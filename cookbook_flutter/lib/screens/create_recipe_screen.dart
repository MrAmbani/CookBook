import 'package:flutter/material.dart';
import 'package:cookbook_client/cookbook_client.dart';
import '../client.dart';

class _IngredientRow {
  final name = TextEditingController();
  final quantity = TextEditingController();
  final unit = TextEditingController();
  bool optional = false;

  void dispose() {
    name.dispose();
    quantity.dispose();
    unit.dispose();
  }
}

class CreateRecipeScreen extends StatefulWidget {
  /// null = create a new recipe, otherwise edit this one.
  final int? recipeId;
  const CreateRecipeScreen({super.key, this.recipeId});

  @override
  State<CreateRecipeScreen> createState() => _CreateRecipeScreenState();
}

class _CreateRecipeScreenState extends State<CreateRecipeScreen> {
  final _title = TextEditingController();
  final _description = TextEditingController();
  final _prep = TextEditingController(text: '10');
  final _cook = TextEditingController(text: '10');
  final _servings = TextEditingController(text: '2');
  String _difficulty = 'easy';
  final List<_IngredientRow> _ingredients = [_IngredientRow()];
  final List<TextEditingController> _steps = [
    TextEditingController(),
    TextEditingController(),
  ];
  bool _saving = false;
  bool _loadingExisting = false;

  bool get _isEdit => widget.recipeId != null;

  @override
  void initState() {
    super.initState();
    if (_isEdit) {
      _loadingExisting = true;
      _loadExisting();
    }
  }

  Future<void> _loadExisting() async {
    try {
      final details = await client.recipe.getDetails(widget.recipeId!);
      final r = details.recipe;
      if (!mounted) return;
      setState(() {
        _title.text = r.title;
        _description.text = r.description;
        _prep.text = '${r.prepTime}';
        _cook.text = '${r.cookTime}';
        _servings.text = '${r.servings}';
        _difficulty = r.difficulty;

        // Steps are stored as "1. text\n2. text": strip the numbers again.
        _steps
          ..forEach((c) => c.dispose())
          ..clear();
        for (final line in r.instructions.split('\n')) {
          final text = line.replaceFirst(RegExp(r'^\d+\.\s*'), '').trim();
          if (text.isNotEmpty) _steps.add(TextEditingController(text: text));
        }
        while (_steps.length < 2) {
          _steps.add(TextEditingController());
        }

        for (final row in _ingredients) {
          row.dispose();
        }
        _ingredients.clear();
        for (final i in details.ingredients) {
          final row = _IngredientRow();
          row.name.text = i.ingredientName;
          row.quantity.text = i.quantity;
          row.unit.text = i.unit ?? '';
          row.optional = i.isOptional;
          _ingredients.add(row);
        }
        if (_ingredients.isEmpty) _ingredients.add(_IngredientRow());
      });
    } catch (e) {
      _showMessage('Could not load recipe: $e');
    } finally {
      if (mounted) setState(() => _loadingExisting = false);
    }
  }

  @override
  void dispose() {
    _title.dispose();
    _description.dispose();
    _prep.dispose();
    _cook.dispose();
    _servings.dispose();
    for (final r in _ingredients) {
      r.dispose();
    }
    for (final s in _steps) {
      s.dispose();
    }
    super.dispose();
  }

  void _showMessage(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  /// Warns about names that are not in the ingredient list yet, so a typo
  /// like "tomatto" does not silently become a new ingredient.
  Future<bool> _confirmNewIngredients(List<String> names) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('New ingredients'),
        content: Text(
          'These are not in the ingredient list yet:\n\n'
          '${names.join(', ')}\n\n'
          'Check the spelling. If they are correct, they will be added as '
          'new ingredients.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Go back'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Add and continue'),
          ),
        ],
      ),
    );
    return ok == true;
  }

  Future<void> _save() async {
    // Friendly checks here; the server repeats all of them for security.
    if (_title.text.trim().isEmpty) {
      _showMessage('Please enter a title');
      return;
    }
    final prep = int.tryParse(_prep.text.trim());
    final cook = int.tryParse(_cook.text.trim());
    final servings = int.tryParse(_servings.text.trim());
    if (prep == null || cook == null || servings == null) {
      _showMessage('Times and servings must be numbers');
      return;
    }
    final filledIngredients =
        _ingredients.where((r) => r.name.text.trim().isNotEmpty).toList();
    if (filledIngredients.isEmpty) {
      _showMessage('Add at least one ingredient');
      return;
    }
    if (filledIngredients.every((r) => r.optional)) {
      _showMessage('At least one ingredient must not be optional');
      return;
    }
    final filledSteps =
        _steps.where((c) => c.text.trim().isNotEmpty).toList();
    if (filledSteps.length < 2) {
      _showMessage('Add at least two steps');
      return;
    }

    setState(() => _saving = true);
    try {
      // Ask the server which ingredient names it does not know yet.
      final check = await client.ingredient
          .normalize(filledIngredients.map((r) => r.name.text.trim()).toList());
      if (!mounted) return;
      if (check.unrecognized.isNotEmpty) {
        final proceed = await _confirmNewIngredients(check.unrecognized);
        if (!proceed) {
          if (mounted) setState(() => _saving = false);
          return;
        }
      }

      final newIngredients = filledIngredients
          .map((r) => NewRecipeIngredient(
                name: r.name.text.trim(),
                quantity: r.quantity.text.trim(),
                unit: r.unit.text.trim().isEmpty ? null : r.unit.text.trim(),
                isOptional: r.optional,
              ))
          .toList();
      final stepTexts = filledSteps.map((c) => c.text).toList();

      if (_isEdit) {
        await client.chefRecipe.updateRecipe(
          recipeId: widget.recipeId!,
          title: _title.text,
          description: _description.text,
          steps: stepTexts,
          prepTime: prep,
          cookTime: cook,
          servings: servings,
          difficulty: _difficulty,
          ingredients: newIngredients,
        );
      } else {
        await client.chefRecipe.createRecipe(
          title: _title.text,
          description: _description.text,
          steps: stepTexts,
          prepTime: prep,
          cookTime: cook,
          servings: servings,
          difficulty: _difficulty,
          ingredients: newIngredients,
        );
      }
      if (!mounted) return;
      Navigator.pop(context, true);
    } catch (e) {
      _showMessage('Could not save recipe: $e');
      if (mounted) setState(() => _saving = false);
    }
  }

  Widget _numberField(TextEditingController controller, String label) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: label),
    );
  }

  Widget _ingredientCard(int i) {
    final row = _ingredients[i];
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: row.name,
                    decoration:
                        const InputDecoration(labelText: 'Ingredient name'),
                  ),
                ),
                if (_ingredients.length > 1)
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => setState(() => _ingredients.removeAt(i)),
                  ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: row.quantity,
                    decoration: const InputDecoration(labelText: 'Quantity'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: row.unit,
                    decoration:
                        const InputDecoration(labelText: 'Unit (optional)'),
                  ),
                ),
              ],
            ),
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              dense: true,
              title: const Text('Optional ingredient'),
              value: row.optional,
              onChanged: (v) => setState(() => row.optional = v ?? false),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_loadingExisting) {
      return Scaffold(
        appBar: AppBar(title: const Text('Edit Recipe')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(_isEdit ? 'Edit Recipe' : 'New Recipe')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: _title,
            maxLength: 100,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: _description,
            maxLength: 300,
            maxLines: 2,
            decoration: const InputDecoration(labelText: 'Short description'),
          ),
          Row(
            children: [
              Expanded(child: _numberField(_prep, 'Prep (min)')),
              const SizedBox(width: 8),
              Expanded(child: _numberField(_cook, 'Cook (min)')),
              const SizedBox(width: 8),
              Expanded(child: _numberField(_servings, 'Servings')),
            ],
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            initialValue: _difficulty,
            decoration: const InputDecoration(labelText: 'Difficulty'),
            items: const [
              DropdownMenuItem(value: 'easy', child: Text('Easy')),
              DropdownMenuItem(value: 'medium', child: Text('Medium')),
              DropdownMenuItem(value: 'hard', child: Text('Hard')),
            ],
            onChanged: (v) => setState(() => _difficulty = v ?? 'easy'),
          ),
          const SizedBox(height: 16),
          const Text(
            'Ingredients',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          for (var i = 0; i < _ingredients.length; i++) _ingredientCard(i),
          TextButton.icon(
            onPressed: () => setState(() => _ingredients.add(_IngredientRow())),
            icon: const Icon(Icons.add),
            label: const Text('Add ingredient'),
          ),
          const SizedBox(height: 16),
          const Text(
            'Steps',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          for (var i = 0; i < _steps.length; i++)
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _steps[i],
                    maxLines: null,
                    decoration: InputDecoration(labelText: 'Step ${i + 1}'),
                  ),
                ),
                if (_steps.length > 2)
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => setState(() => _steps.removeAt(i)),
                  ),
              ],
            ),
          TextButton.icon(
            onPressed: () =>
                setState(() => _steps.add(TextEditingController())),
            icon: const Icon(Icons.add),
            label: const Text('Add step'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _saving ? null : _save,
            child: Text(
              _saving
                  ? 'Saving...'
                  : (_isEdit ? 'Save changes' : 'Publish recipe'),
            ),
          ),
        ],
      ),
    );
  }
}
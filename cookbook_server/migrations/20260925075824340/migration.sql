BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "ingredient" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "category" text NOT NULL,
    "synonyms" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "recipe" (
    "id" bigserial PRIMARY KEY,
    "title" text NOT NULL,
    "description" text NOT NULL,
    "instructions" text NOT NULL,
    "prepTime" bigint NOT NULL,
    "cookTime" bigint NOT NULL,
    "servings" bigint NOT NULL,
    "difficulty" text NOT NULL,
    "creatorId" text,
    "isAiGenerated" boolean NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "recipe_ingredient" (
    "id" bigserial PRIMARY KEY,
    "recipeId" bigint NOT NULL,
    "ingredientId" bigint NOT NULL,
    "quantity" text NOT NULL,
    "unit" text,
    "isOptional" boolean NOT NULL
);


--
-- MIGRATION VERSION FOR cookbook
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('cookbook', '20260925075824340', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260925075824340', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20260824182259319', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260824182259319', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_idp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_idp', '20260910193913364-string-rate-limit-keys', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260910193913364-string-rate-limit-keys', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_core
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_core', '20260824182354731', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260824182354731', "timestamp" = now();


COMMIT;

BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "post_comment" (
    "id" bigserial PRIMARY KEY,
    "postId" bigint NOT NULL,
    "userId" text NOT NULL,
    "authorName" text NOT NULL,
    "text" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "post_comment_post_idx" ON "post_comment" USING btree ("postId");


--
-- MIGRATION VERSION FOR cookbook
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('cookbook', '20261122095101201', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20261122095101201', "timestamp" = now();

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

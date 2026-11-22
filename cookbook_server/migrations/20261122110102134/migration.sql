BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "user_follow" (
    "id" bigserial PRIMARY KEY,
    "followerId" text NOT NULL,
    "followingId" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "user_follow_unique_idx" ON "user_follow" USING btree ("followerId", "followingId");


--
-- MIGRATION VERSION FOR cookbook
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('cookbook', '20261122110102134', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20261122110102134', "timestamp" = now();

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

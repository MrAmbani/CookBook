BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "post_report" (
    "id" bigserial PRIMARY KEY,
    "postId" bigint NOT NULL,
    "postAuthorId" text NOT NULL,
    "postAuthorName" text NOT NULL,
    "postCaption" text NOT NULL,
    "reporterId" text NOT NULL,
    "reason" text NOT NULL,
    "status" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "reviewedBy" text,
    "reviewedAt" timestamp without time zone
);

-- Indexes
CREATE UNIQUE INDEX "post_report_unique_idx" ON "post_report" USING btree ("reporterId", "postId");


--
-- MIGRATION VERSION FOR cookbook
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('cookbook', '20261122112122737', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20261122112122737', "timestamp" = now();

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

BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "linked_account" DROP COLUMN "tradelockerAccountId";
ALTER TABLE "linked_account" DROP COLUMN "tradelockerAccounts";
ALTER TABLE "linked_account" ADD COLUMN "tradelockerAccountId" json;
ALTER TABLE "linked_account" ADD COLUMN "tradelockerAccounts" json;

--
-- MIGRATION VERSION FOR tradelog
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('tradelog', '20241024160320645', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20241024160320645', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20240520102713718', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240520102713718', "timestamp" = now();


COMMIT;
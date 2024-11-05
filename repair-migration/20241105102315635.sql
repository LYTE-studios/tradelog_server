BEGIN;

--
-- ACTION ALTER TABLE
--
DROP INDEX "user_info_id_unique_idx";
ALTER TABLE "linked_account" ADD COLUMN "tradelockerCredentialsId" bigint;
CREATE INDEX "user_info_id_unique_idx" ON "linked_account" USING btree ("userInfoId");
ALTER TABLE ONLY "linked_account"
    ADD CONSTRAINT "linked_account_fk_1"
    FOREIGN KEY("tradelockerCredentialsId")
    REFERENCES "tradelocker_credentials"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- MIGRATION VERSION FOR tradelog
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('tradelog', '20241030224051717', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20241030224051717', "timestamp" = now();

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

--
-- MIGRATION VERSION FOR _repair
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('_repair', '20241105102315635', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20241105102315635', "timestamp" = now();


COMMIT;

BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "linked_account" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "linked_account" (
    "id" bigserial PRIMARY KEY,
    "name" text,
    "userInfoId" bigint NOT NULL,
    "platform" bigint NOT NULL,
    "accountInformation" json NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "linked_account"
    ADD CONSTRAINT "linked_account_fk_0"
    FOREIGN KEY("userInfoId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR tradelog
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('tradelog', '20241205135717402', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20241205135717402', "timestamp" = now();

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
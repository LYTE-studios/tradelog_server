BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "linked_account" ADD COLUMN "tradelockerCredentialsId" bigint;
ALTER TABLE ONLY "linked_account"
    ADD CONSTRAINT "linked_account_fk_1"
    FOREIGN KEY("tradelockerCredentialsId")
    REFERENCES "tradelocker_credentials"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
--
-- ACTION CREATE TABLE
--
CREATE TABLE "tradely_profile" (
    "id" bigserial PRIMARY KEY,
    "userInfoId" bigint NOT NULL,
    "firstName" text NOT NULL,
    "lastName" text NOT NULL,
    "dateOfBirth" timestamp without time zone
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "tradely_profile"
    ADD CONSTRAINT "tradely_profile_fk_0"
    FOREIGN KEY("userInfoId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR tradelog
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('tradelog', '20241028205346408', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20241028205346408', "timestamp" = now();

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

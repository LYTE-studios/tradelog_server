BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "tradelocker_credentials" (
    "id" bigserial PRIMARY KEY,
    "email" text NOT NULL,
    "password" text NOT NULL,
    "server" text NOT NULL,
    "refreshToken" text,
    "userId" bigint NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "tradelocker_credentials"
    ADD CONSTRAINT "tradelocker_credentials_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR tradelog
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('tradelog', '20240807110035912', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240807110035912', "timestamp" = now();

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

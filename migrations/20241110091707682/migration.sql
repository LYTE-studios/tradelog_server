BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "trade" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "trade" (
    "id" bigserial PRIMARY KEY,
    "linkedAccountId" bigint NOT NULL,
    "userId" bigint NOT NULL,
    "option" bigint NOT NULL,
    "currency" text NOT NULL,
    "fee" double precision NOT NULL,
    "date" timestamp without time zone NOT NULL,
    "lotSize" double precision NOT NULL,
    "takeProfit" double precision NOT NULL,
    "stoploss" double precision NOT NULL,
    "profitLoss" text NOT NULL,
    "amount" double precision NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "trade"
    ADD CONSTRAINT "trade_fk_0"
    FOREIGN KEY("linkedAccountId")
    REFERENCES "linked_account"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "trade"
    ADD CONSTRAINT "trade_fk_1"
    FOREIGN KEY("userId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR tradelog
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('tradelog', '20241110091707682', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20241110091707682', "timestamp" = now();

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

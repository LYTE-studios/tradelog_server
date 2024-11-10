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
    "realizedPl" double precision,
    "status" bigint NOT NULL,
    "symbol" text NOT NULL,
    "option" bigint NOT NULL,
    "feeCurrency" text,
    "fee" double precision,
    "openTime" timestamp without time zone NOT NULL,
    "closeTime" timestamp without time zone,
    "lotSize" double precision NOT NULL,
    "takeProfit" double precision,
    "stopLoss" double precision
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
    VALUES ('tradelog', '20241110100747609', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20241110100747609', "timestamp" = now();

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

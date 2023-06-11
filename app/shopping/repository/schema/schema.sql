CREATE TABLE "role" (
  "id" bigserial,
  "name" varchar UNIQUE NOT NULL,
  PRIMARY KEY ("id", "name")
);

CREATE TABLE "user" (
  "id" bigserial,
  "username" varchar UNIQUE NOT NULL,
  "firstname" varchar NOT NULL,
  "lastname" varchar NOT NULL,
  "password" varchar NOT NULL,
  "email" varchar NOT NULL,
  "role_id" varchar NOT NULL,
  PRIMARY KEY ("id", "username")
);

CREATE TABLE "product" (
  "id" bigserial PRIMARY KEY,
  "type" varchar NOT NULL,
  "name" varchar NOT NULL,
  "color" varchar NOT NULL,
  "price" bigint NOT NULL,
  "count" integer NOT NULL DEFAULT 0,
  "created_at" timestamptz DEFAULT (now())
);

CREATE TABLE "customer" (
  "id" bigserial PRIMARY KEY,
  "username" varchar UNIQUE NOT NULL,
  "balance" bigint NOT NULL DEFAULT 0,
  "signup_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "purchase" (
  "id" bigserial PRIMARY KEY,
  "customer_id" bigint NOT NULL,
  "product_id" bigint,
  "count" integer NOT NULL DEFAULT 1,
  "sold_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE INDEX ON "role" ("name");

CREATE INDEX ON "user" ("username");

CREATE INDEX ON "user" ("firstname");

CREATE INDEX ON "user" ("lastname");

CREATE INDEX ON "user" ("password");

CREATE INDEX ON "user" ("email");

CREATE INDEX ON "user" ("role_id");

CREATE INDEX ON "product" ("type");

CREATE INDEX ON "product" ("name");

CREATE INDEX ON "product" ("color");

CREATE INDEX ON "product" ("price");

CREATE INDEX ON "product" ("count");

CREATE INDEX ON "customer" ("username");

CREATE INDEX ON "customer" ("balance");

CREATE INDEX ON "purchase" ("count");

CREATE INDEX ON "purchase" ("customer_id");

CREATE INDEX ON "purchase" ("product_id");

COMMENT ON COLUMN "customer"."balance" IS 'must be positive';

ALTER TABLE "user" ADD FOREIGN KEY ("role_id") REFERENCES "role" ("id");

ALTER TABLE "customer" ADD FOREIGN KEY ("username") REFERENCES "user" ("username");

ALTER TABLE "purchase" ADD FOREIGN KEY ("customer_id") REFERENCES "customer" ("id");

ALTER TABLE "purchase" ADD FOREIGN KEY ("product_id") REFERENCES "product" ("id");
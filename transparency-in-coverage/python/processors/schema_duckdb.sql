CREATE SCHEMA IF NOT EXISTS in_network_rates;

CREATE TABLE IF NOT EXISTS "root" (
  "root_hash_id" varchar(32)  NOT NULL,
  "reporting_entity_name" varchar(256)  NOT NULL,
  "reporting_entity_type" varchar(16)  DEFAULT NULL,
  "last_updated_on" date DEFAULT NULL,
  "version" varchar(16)  DEFAULT NULL,
  "url" varchar(1024)  DEFAULT NULL,
  PRIMARY KEY ("root_hash_id")
);

CREATE TABLE IF NOT EXISTS "in_network" (
  "in_network_hash_id" varchar(32)  NOT NULL,
  "in_network.negotiation_arrangement" varchar(32)  NOT NULL,
  "root_hash_id" varchar(32)  NOT NULL,
  "in_network.name" varchar(1024)  NOT NULL,
  "in_network.billing_code_type" varchar(1024)  NOT NULL,
  "in_network.billing_code" varchar(1024)  NOT NULL,
  "in_network.description" varchar(1024)  NOT NULL,
  PRIMARY KEY ("in_network_hash_id")
);

CREATE TABLE IF NOT EXISTS "in_network.negotiated_rates" (
  "root_hash_id" varchar(32)  NOT NULL,
  "in_network_hash_id" varchar(32)  NOT NULL,
  "in_network.negotiated_rates_hash_id" varchar(32)  NOT NULL,
  "in_network.negotiated_rates.provider_references" varchar(1024)  NOT NULL,
  PRIMARY KEY ("in_network.negotiated_rates_hash_id")
);

CREATE TABLE IF NOT EXISTS "in_network.negotiated_rates.negotiated_prices" (
  "root_hash_id" varchar(32)  NOT NULL,
  "in_network_hash_id" varchar(32)  NOT NULL,
  "in_network.negotiated_rates_hash_id" varchar(32)  NOT NULL,
  "in_network.negotiated_rates.negotiated_prices_hash_id" varchar(32)  NOT NULL,
  "in_network.negotiated_rates.negotiated_prices.negotiated_type" varchar(32)  NOT NULL,
  "in_network.negotiated_rates.negotiated_prices.negotiated_rate" float NOT NULL,
  "in_network.negotiated_rates.negotiated_prices.expiration_date" varchar(32)  NOT NULL,
  "in_network.negotiated_rates.negotiated_prices.service_code" varchar(32)  NOT NULL,
  "in_network.negotiated_rates.negotiated_prices.billing_class" varchar(32)  NOT NULL,
  "in_network.negotiated_rates.negotiated_prices.additional_info" varchar(32)  NOT NULL,
  "in_network.negotiated_rates.negotiated_prices.billing_code_mod" varchar(32)  NOT NULL,
  PRIMARY KEY ("in_network.negotiated_rates.negotiated_prices_hash_id")
);

CREATE TABLE IF NOT EXISTS "provider_references.provider_groups" (
  "root_hash_id" varchar(32)  NOT NULL,
  "provider_references_hash_id" varchar(32)  NOT NULL,
  "provider_references.provider_groups_hash_id" varchar(32)  NOT NULL,
  "provider_references.provider_groups.npi" bigint NOT NULL,
  PRIMARY KEY ("provider_references.provider_groups_hash_id")
);

CREATE TABLE IF NOT EXISTS "provider_references.provider_groups.tin" (
  "root_hash_id" varchar(32)  NOT NULL,
  "provider_references_hash_id" varchar(32)  NOT NULL,
  "provider_references.provider_groups_hash_id" varchar(32)  NOT NULL,
  "provider_references.provider_groups.tin_hash_id" varchar(32)  NOT NULL,
  "provider_references.provider_groups.tin.type" varchar(32)  NOT NULL,
  "provider_references.provider_groups.tin.value" varchar(32)  NOT NULL,
  PRIMARY KEY ("provider_references.provider_groups.tin_hash_id")
);

CREATE TABLE IF NOT EXISTS "provider_references" (
  "root_hash_id" varchar(32)  NOT NULL,
  "provider_references_hash_id" varchar(32)  NOT NULL,
  "provider_references.provider_group_id" varchar(32)  NOT NULL,
  PRIMARY KEY ("provider_references_hash_id")
);

CREATE TABLE IF NOT EXISTS "provider_references.provider_groups" (
  "root_hash_id" varchar(32)  NOT NULL,
  "provider_references_hash_id" varchar(32)  NOT NULL,
  "provider_references.provider_groups_hash_id" varchar(32)  NOT NULL,
  "provider_references.provider_groups.npi" bigint NOT NULL,
  PRIMARY KEY ("provider_references.provider_groups_hash_id")
);

CREATE TABLE IF NOT EXISTS "provider_references.provider_groups.tin" (
  "root_hash_id" varchar(32)  NOT NULL,
  "provider_references_hash_id" varchar(32)  NOT NULL,
  "provider_references.provider_groups_hash_id" varchar(32)  NOT NULL,
  "provider_references.provider_groups.tin_hash_id" varchar(32)  NOT NULL,
  "provider_references.provider_groups.tin.type" varchar(32)  NOT NULL,
  "provider_references.provider_groups.tin.value" varchar(32)  NOT NULL,
  PRIMARY KEY ("provider_references.provider_groups.tin_hash_id")
);

-- Adminer 5.4.1 PostgreSQL 16.11 dump

DROP TABLE IF EXISTS "cache";
CREATE TABLE "public"."cache" (
    "key" character varying(255) NOT NULL,
    "value" text NOT NULL,
    "expiration" integer NOT NULL,
    CONSTRAINT "cache_pkey" PRIMARY KEY ("key")
)
WITH (oids = false);

INSERT INTO "cache" ("key", "value", "expiration") VALUES
('laravel-cache-settings',	'TzoxODoiQXBwXE1vZGVsc1xTZXR0aW5nIjozMzp7czoxMzoiACoAY29ubmVjdGlvbiI7czo1OiJwZ3NxbCI7czo4OiIAKgB0YWJsZSI7czo4OiJzZXR0aW5ncyI7czoxMzoiACoAcHJpbWFyeUtleSI7czoyOiJpZCI7czoxMDoiACoAa2V5VHlwZSI7czozOiJpbnQiO3M6MTI6ImluY3JlbWVudGluZyI7YjoxO3M6NzoiACoAd2l0aCI7YTowOnt9czoxMjoiACoAd2l0aENvdW50IjthOjA6e31zOjE5OiJwcmV2ZW50c0xhenlMb2FkaW5nIjtiOjA7czoxMDoiACoAcGVyUGFnZSI7aToxNTtzOjY6ImV4aXN0cyI7YjoxO3M6MTg6Indhc1JlY2VudGx5Q3JlYXRlZCI7YjowO3M6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDtzOjEzOiIAKgBhdHRyaWJ1dGVzIjthOjEwOntzOjI6ImlkIjtpOjE7czo1OiJ0aXRsZSI7czozMjoieyJydSI6ICJQcm9FbmQiLCAidXoiOiAiUHJvRW5kIn0iO3M6MTY6Im1ldGFfZGVzY3JpcHRpb24iO3M6MzI6InsicnUiOiAiUHJvRW5kIiwgInV6IjogIlByb0VuZCJ9IjtzOjEzOiJtZXRhX2tleXdvcmRzIjtzOjQ4OiJ7InJ1IjogIlByb0VuZCwgUHJvRW5kIiwgInV6IjogIlByb0VuZCwgUHJvRW5kIn0iO3M6NToiZW1haWwiO047czo2OiJzdGF0dXMiO2I6MTtzOjEyOiJtYWluX3BhZ2VfaWQiO047czo5OiJhZG1pbl9pcHMiO047czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyNS0xMi0yMCAxNToyMjo1MiI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyNS0xMi0yMCAxNToyMzoyNyI7fXM6MTE6IgAqAG9yaWdpbmFsIjthOjEwOntzOjI6ImlkIjtpOjE7czo1OiJ0aXRsZSI7czozMjoieyJydSI6ICJQcm9FbmQiLCAidXoiOiAiUHJvRW5kIn0iO3M6MTY6Im1ldGFfZGVzY3JpcHRpb24iO3M6MzI6InsicnUiOiAiUHJvRW5kIiwgInV6IjogIlByb0VuZCJ9IjtzOjEzOiJtZXRhX2tleXdvcmRzIjtzOjQ4OiJ7InJ1IjogIlByb0VuZCwgUHJvRW5kIiwgInV6IjogIlByb0VuZCwgUHJvRW5kIn0iO3M6NToiZW1haWwiO047czo2OiJzdGF0dXMiO2I6MTtzOjEyOiJtYWluX3BhZ2VfaWQiO047czo5OiJhZG1pbl9pcHMiO047czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyNS0xMi0yMCAxNToyMjo1MiI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyNS0xMi0yMCAxNToyMzoyNyI7fXM6MTA6IgAqAGNoYW5nZXMiO2E6MDp7fXM6MTE6IgAqAHByZXZpb3VzIjthOjA6e31zOjg6IgAqAGNhc3RzIjthOjQ6e3M6NToidGl0bGUiO3M6NToiYXJyYXkiO3M6MTY6Im1ldGFfZGVzY3JpcHRpb24iO3M6NToiYXJyYXkiO3M6MTM6Im1ldGFfa2V5d29yZHMiO3M6NToiYXJyYXkiO3M6Njoic3RhdHVzIjtzOjc6ImJvb2xlYW4iO31zOjE3OiIAKgBjbGFzc0Nhc3RDYWNoZSI7YTowOnt9czoyMToiACoAYXR0cmlidXRlQ2FzdENhY2hlIjthOjA6e31zOjEzOiIAKgBkYXRlRm9ybWF0IjtOO3M6MTA6IgAqAGFwcGVuZHMiO2E6MDp7fXM6MTk6IgAqAGRpc3BhdGNoZXNFdmVudHMiO2E6MDp7fXM6MTQ6IgAqAG9ic2VydmFibGVzIjthOjA6e31zOjEyOiIAKgByZWxhdGlvbnMiO2E6MDp7fXM6MTA6IgAqAHRvdWNoZXMiO2E6MDp7fXM6Mjc6IgAqAHJlbGF0aW9uQXV0b2xvYWRDYWxsYmFjayI7TjtzOjI2OiIAKgByZWxhdGlvbkF1dG9sb2FkQ29udGV4dCI7TjtzOjEwOiJ0aW1lc3RhbXBzIjtiOjE7czoxMzoidXNlc1VuaXF1ZUlkcyI7YjowO3M6OToiACoAaGlkZGVuIjthOjA6e31zOjEwOiIAKgB2aXNpYmxlIjthOjA6e31zOjExOiIAKgBmaWxsYWJsZSI7YTo3OntpOjA7czo1OiJ0aXRsZSI7aToxO3M6MTY6Im1ldGFfZGVzY3JpcHRpb24iO2k6MjtzOjEzOiJtZXRhX2tleXdvcmRzIjtpOjM7czo1OiJlbWFpbCI7aTo0O3M6Njoic3RhdHVzIjtpOjU7czoxMjoibWFpbl9wYWdlX2lkIjtpOjY7czo5OiJhZG1pbl9pcHMiO31zOjEwOiIAKgBndWFyZGVkIjthOjE6e2k6MDtzOjE6IioiO319',	2081823752),
('laravel-cache-captcha_b58eb11829d10af8f4b266424807803a',	'a:4:{i:0;s:1:"x";i:1;s:1:"j";i:2;s:1:"u";i:3;s:1:"s";}',	1766468292),
('laravel-cache-captcha_5e5fa457c62d41520008acefe9201fb8',	'a:4:{i:0;s:1:"b";i:1;s:1:"l";i:2;s:1:"y";i:3;s:1:"f";}',	1766648696),
('laravel-cache-captcha_7bebf2a23f38e605981ad356d1393207',	'a:4:{i:0;s:1:"1";i:1;s:1:"y";i:2;s:1:"p";i:3;s:1:"p";}',	1766648704),
('laravel-cache-captcha_7a5d05406d025ca43b9e0d7e848eea4f',	'a:4:{i:0;s:1:"b";i:1;s:1:"x";i:2;s:1:"3";i:3;s:1:"l";}',	1766648713),
('laravel-cache-captcha_08b3be21a42bd49f3bfe2ac5176609a4',	'a:4:{i:0;s:1:"b";i:1;s:1:"g";i:2;s:1:"e";i:3;s:1:"6";}',	1766667644),
('laravel-cache-captcha_d6b4b9233944c37d26af96741772afa2',	'a:4:{i:0;s:1:"j";i:1;s:1:"m";i:2;s:1:"b";i:3;s:1:"g";}',	1766667672),
('laravel-cache-captcha_0413d16d1cf924a991e55860798dfa8f',	'a:4:{i:0;s:1:"y";i:1;s:1:"c";i:2;s:1:"t";i:3;s:1:"t";}',	1766667683),
('laravel-cache-captcha_d28bd08650a62e31027b69becd7f6049',	'a:4:{i:0;s:1:"d";i:1;s:1:"5";i:2;s:1:"d";i:3;s:1:"6";}',	1766667713);

DROP TABLE IF EXISTS "cache_locks";
CREATE TABLE "public"."cache_locks" (
    "key" character varying(255) NOT NULL,
    "owner" character varying(255) NOT NULL,
    "expiration" integer NOT NULL,
    CONSTRAINT "cache_locks_pkey" PRIMARY KEY ("key")
)
WITH (oids = false);


DROP TABLE IF EXISTS "content_images";
DROP SEQUENCE IF EXISTS content_images_id_seq;
CREATE SEQUENCE content_images_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."content_images" (
    "id" bigint DEFAULT nextval('content_images_id_seq') NOT NULL,
    "content_id" bigint NOT NULL,
    "image" text,
    "compressed" text,
    "type" character varying(255),
    "size" bigint,
    "main" boolean DEFAULT false NOT NULL,
    "status" boolean DEFAULT true NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "content_images_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE INDEX content_images_main_index ON public.content_images USING btree (main);


DROP TABLE IF EXISTS "content_settings";
DROP SEQUENCE IF EXISTS content_settings_id_seq;
CREATE SEQUENCE content_settings_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."content_settings" (
    "id" bigint DEFAULT nextval('content_settings_id_seq') NOT NULL,
    "key" character varying(255) NOT NULL,
    "label" character varying(255) NOT NULL,
    "type" character varying(255) NOT NULL,
    "required" boolean DEFAULT true NOT NULL,
    "is_translatable" boolean DEFAULT true NOT NULL,
    "options" json,
    "sort_order" integer DEFAULT '0' NOT NULL,
    "relation" text,
    "status" boolean DEFAULT true NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "content_settings_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE INDEX content_settings_key_is_translatable_status_sort_order_index ON public.content_settings USING btree (key, is_translatable, status, sort_order);

INSERT INTO "content_settings" ("id", "key", "label", "type", "required", "is_translatable", "options", "sort_order", "relation", "status", "created_at", "updated_at") VALUES
(1,	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	NULL,	NULL),
(2,	'key',	'Key',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	NULL,	NULL);

DROP TABLE IF EXISTS "content_translations";
DROP SEQUENCE IF EXISTS content_translations_id_seq;
CREATE SEQUENCE content_translations_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."content_translations" (
    "id" bigint DEFAULT nextval('content_translations_id_seq') NOT NULL,
    "content_id" bigint NOT NULL,
    "locale" character varying(3),
    "data" jsonb,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "content_translations_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE INDEX content_translations_locale_index ON public.content_translations USING btree (locale);


DROP TABLE IF EXISTS "contents";
DROP SEQUENCE IF EXISTS contents_id_seq;
CREATE SEQUENCE contents_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."contents" (
    "id" bigint DEFAULT nextval('contents_id_seq') NOT NULL,
    "type" character varying(255) DEFAULT 'category' NOT NULL,
    "slug" text,
    "url" text,
    "test" boolean DEFAULT false NOT NULL,
    "show_admin" boolean DEFAULT true NOT NULL,
    "sort_order" integer DEFAULT '1' NOT NULL,
    "icon" character varying(255),
    "status" boolean DEFAULT true NOT NULL,
    "parent_id" bigint,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "contents_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "contents_type_check" CHECK (((type)::text = ANY ((ARRAY['category'::character varying, 'page'::character varying, 'url'::character varying, 'section'::character varying])::text[])))
)
WITH (oids = false);

CREATE INDEX contents_type_slug_status_sort_order_index ON public.contents USING btree (type, slug, status, sort_order);


DROP TABLE IF EXISTS "failed_jobs";
DROP SEQUENCE IF EXISTS failed_jobs_id_seq;
CREATE SEQUENCE failed_jobs_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."failed_jobs" (
    "id" bigint DEFAULT nextval('failed_jobs_id_seq') NOT NULL,
    "uuid" character varying(255) NOT NULL,
    "connection" text NOT NULL,
    "queue" text NOT NULL,
    "payload" text NOT NULL,
    "exception" text NOT NULL,
    "failed_at" timestamp(0) DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT "failed_jobs_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE UNIQUE INDEX failed_jobs_uuid_unique ON public.failed_jobs USING btree (uuid);


DROP TABLE IF EXISTS "job_batches";
CREATE TABLE "public"."job_batches" (
    "id" character varying(255) NOT NULL,
    "name" character varying(255) NOT NULL,
    "total_jobs" integer NOT NULL,
    "pending_jobs" integer NOT NULL,
    "failed_jobs" integer NOT NULL,
    "failed_job_ids" text NOT NULL,
    "options" text,
    "cancelled_at" integer,
    "created_at" integer NOT NULL,
    "finished_at" integer,
    CONSTRAINT "job_batches_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);


DROP TABLE IF EXISTS "jobs";
DROP SEQUENCE IF EXISTS jobs_id_seq;
CREATE SEQUENCE jobs_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."jobs" (
    "id" bigint DEFAULT nextval('jobs_id_seq') NOT NULL,
    "queue" character varying(255) NOT NULL,
    "payload" text NOT NULL,
    "attempts" smallint NOT NULL,
    "reserved_at" integer,
    "available_at" integer NOT NULL,
    "created_at" integer NOT NULL,
    CONSTRAINT "jobs_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


DROP TABLE IF EXISTS "langs";
DROP SEQUENCE IF EXISTS langs_id_seq;
CREATE SEQUENCE langs_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."langs" (
    "id" bigint DEFAULT nextval('langs_id_seq') NOT NULL,
    "code" character varying(10) NOT NULL,
    "name" character varying(50) NOT NULL,
    "is_default" boolean DEFAULT false NOT NULL,
    "status" boolean DEFAULT true NOT NULL,
    "locale" character varying(10),
    "flag_icon" character varying(255),
    "sort_order" bigint DEFAULT '0' NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "short_name" text,
    CONSTRAINT "langs_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE UNIQUE INDEX langs_code_unique ON public.langs USING btree (code);

INSERT INTO "langs" ("id", "code", "name", "is_default", "status", "locale", "flag_icon", "sort_order", "created_at", "updated_at", "short_name") VALUES
(2,	'uz',	'Uzbek',	'1',	'1',	'uz_UZ',	'flags/uz.svg',	1,	'2025-12-23 04:21:31',	'2025-12-23 04:21:31',	'O''zb'),
(3,	'ru',	'Russian',	'1',	'1',	'ru_RU',	'flags/ru.svg',	2,	'2025-12-23 04:21:31',	'2025-12-23 04:21:31',	'Рус'),
(1,	'en',	'English',	'1',	'1',	'en_US',	'flags/en.svg',	3,	'2025-12-23 04:21:31',	'2025-12-25 08:27:19',	'Eng');

DROP TABLE IF EXISTS "menu_main_images";
DROP SEQUENCE IF EXISTS menu_main_images_id_seq;
CREATE SEQUENCE menu_main_images_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."menu_main_images" (
    "id" bigint DEFAULT nextval('menu_main_images_id_seq') NOT NULL,
    "menu_main_id" bigint NOT NULL,
    "image" text,
    "compressed" text,
    "type" character varying(255),
    "size" bigint,
    "main" boolean DEFAULT false NOT NULL,
    "status" boolean DEFAULT true NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "menu_main_images_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE INDEX menu_main_images_main_index ON public.menu_main_images USING btree (main);


DROP TABLE IF EXISTS "menu_main_settings";
DROP SEQUENCE IF EXISTS menu_main_settings_id_seq;
CREATE SEQUENCE menu_main_settings_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."menu_main_settings" (
    "id" bigint DEFAULT nextval('menu_main_settings_id_seq') NOT NULL,
    "key" character varying(255) NOT NULL,
    "label" character varying(255) NOT NULL,
    "type" character varying(255) NOT NULL,
    "required" boolean DEFAULT true NOT NULL,
    "is_translatable" boolean DEFAULT true NOT NULL,
    "options" json,
    "sort_order" integer DEFAULT '0' NOT NULL,
    "relation" text,
    "status" boolean DEFAULT true NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "menu_main_settings_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE INDEX menu_main_settings_key_is_translatable_status_sort_order_index ON public.menu_main_settings USING btree (key, is_translatable, status, sort_order);

INSERT INTO "menu_main_settings" ("id", "key", "label", "type", "required", "is_translatable", "options", "sort_order", "relation", "status", "created_at", "updated_at") VALUES
(1,	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	NULL,	NULL),
(2,	'description',	'Description',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	NULL,	NULL);

DROP TABLE IF EXISTS "menu_main_translations";
DROP SEQUENCE IF EXISTS menu_main_translations_id_seq;
CREATE SEQUENCE menu_main_translations_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."menu_main_translations" (
    "id" bigint DEFAULT nextval('menu_main_translations_id_seq') NOT NULL,
    "menu_main_id" bigint NOT NULL,
    "locale" character varying(3),
    "data" jsonb,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "menu_main_translations_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE INDEX menu_main_translations_locale_index ON public.menu_main_translations USING btree (locale);

INSERT INTO "menu_main_translations" ("id", "menu_main_id", "locale", "data", "created_at", "updated_at") VALUES
(1,	1,	'uz',	'{"title": "Asosiy menu", "description": null}',	'2025-12-23 04:24:05',	'2025-12-23 04:24:05'),
(2,	1,	'ru',	'{"title": null, "description": null}',	'2025-12-23 04:24:05',	'2025-12-23 04:24:05'),
(3,	2,	'uz',	'{"title": "Vatandoshlar", "description": null}',	'2025-12-23 04:24:42',	'2025-12-23 04:24:42'),
(4,	2,	'ru',	'{"title": null, "description": null}',	'2025-12-23 04:24:42',	'2025-12-23 04:24:42'),
(5,	3,	'uz',	'{"title": "Statistika", "description": null}',	'2025-12-23 04:25:08',	'2025-12-23 04:25:08'),
(6,	3,	'ru',	'{"title": null, "description": null}',	'2025-12-23 04:25:08',	'2025-12-23 04:25:08'),
(7,	4,	'uz',	'{"title": "Jamoat fondi", "description": null}',	'2025-12-23 04:25:44',	'2025-12-23 04:25:44'),
(8,	4,	'ru',	'{"title": null, "description": null}',	'2025-12-23 04:25:44',	'2025-12-23 04:25:44'),
(13,	7,	'uz',	'{"title": "Qadriyatlar", "description": null}',	'2025-12-23 04:52:36',	'2025-12-23 04:52:36'),
(14,	7,	'ru',	'{"title": null, "description": null}',	'2025-12-23 04:52:36',	'2025-12-23 04:52:36'),
(15,	8,	'uz',	'{"title": "3D  Sayohat", "description": null}',	'2025-12-23 04:53:12',	'2025-12-26 06:45:53'),
(16,	8,	'ru',	'{"title": null, "description": null}',	'2025-12-23 04:53:12',	'2025-12-26 06:45:53'),
(17,	9,	'uz',	'{"title": "Moziy va bugun", "description": null}',	'2025-12-23 04:55:51',	'2025-12-23 04:55:51'),
(18,	9,	'ru',	'{"title": null, "description": null}',	'2025-12-23 04:55:51',	'2025-12-23 04:55:51'),
(19,	10,	'uz',	'{"title": "Manzilgohlar", "description": null}',	'2025-12-23 04:56:55',	'2025-12-23 04:56:55'),
(20,	10,	'ru',	'{"title": null, "description": null}',	'2025-12-23 04:56:55',	'2025-12-23 04:56:55'),
(11,	6,	'uz',	'{"title": "Bosh sahifa", "description": null}',	'2025-12-23 04:52:03',	'2025-12-23 04:59:59'),
(12,	6,	'ru',	'{"title": null, "description": null}',	'2025-12-23 04:52:03',	'2025-12-23 04:59:59'),
(27,	14,	'uz',	'{"title": "Rahbariyat", "description": null}',	'2025-12-23 05:13:48',	'2025-12-23 05:13:48'),
(28,	14,	'ru',	'{"title": null, "description": null}',	'2025-12-23 05:13:48',	'2025-12-23 05:13:48'),
(29,	15,	'uz',	'{"title": "Fondning asosiy yo’nalishlari", "description": null}',	'2025-12-23 05:14:18',	'2025-12-23 05:14:18'),
(30,	15,	'ru',	'{"title": null, "description": null}',	'2025-12-23 05:14:18',	'2025-12-23 05:14:18'),
(31,	16,	'uz',	'{"title": "FAQ", "description": null}',	'2025-12-23 05:14:52',	'2025-12-23 05:14:52'),
(32,	16,	'ru',	'{"title": null, "description": null}',	'2025-12-23 05:14:52',	'2025-12-23 05:14:52'),
(39,	20,	'uz',	'{"title": "Birlashmalar", "description": null}',	'2025-12-23 05:36:31',	'2025-12-23 05:36:31'),
(40,	20,	'ru',	'{"title": null, "description": null}',	'2025-12-23 05:36:31',	'2025-12-23 05:36:31'),
(41,	21,	'uz',	'{"title": "Jamoat birlashmalari", "description": null}',	'2025-12-23 05:36:49',	'2025-12-23 05:36:49'),
(42,	21,	'ru',	'{"title": null, "description": null}',	'2025-12-23 05:36:49',	'2025-12-23 05:36:49'),
(43,	22,	'uz',	'{"title": "Sarlavha", "description": null}',	'2025-12-23 05:38:42',	'2025-12-23 05:38:42'),
(44,	22,	'ru',	'{"title": null, "description": null}',	'2025-12-23 05:38:42',	'2025-12-23 05:38:42'),
(47,	24,	'uz',	'{"title": "Biz haqimizda", "description": null}',	'2025-12-23 05:42:34',	'2025-12-23 05:42:34'),
(48,	24,	'ru',	'{"title": null, "description": null}',	'2025-12-23 05:42:34',	'2025-12-23 05:42:34'),
(62,	30,	'uz',	'{"title": "Url", "description": null}',	'2025-12-25 13:30:47',	'2025-12-25 13:30:47'),
(63,	30,	'ru',	'{"title": null, "description": null}',	'2025-12-25 13:30:47',	'2025-12-25 13:30:47'),
(64,	30,	'en',	'{"title": null, "description": null}',	'2025-12-25 13:30:47',	'2025-12-25 13:30:47'),
(25,	13,	'uz',	'{"title": "Biz haqimizda", "description": null}',	'2025-12-23 05:13:24',	'2025-12-23 05:43:52'),
(26,	13,	'ru',	'{"title": null, "description": null}',	'2025-12-23 05:13:24',	'2025-12-23 05:43:52'),
(45,	23,	'uz',	'{"title": "davlatlar", "description": null}',	'2025-12-23 05:39:07',	'2025-12-23 05:46:49'),
(46,	23,	'ru',	'{"title": null, "description": null}',	'2025-12-23 05:39:07',	'2025-12-23 05:46:49'),
(49,	25,	'uz',	'{"title": "Axborot xizmatlari", "description": null}',	'2025-12-23 06:18:25',	'2025-12-23 06:18:25'),
(50,	25,	'ru',	'{"title": null, "description": null}',	'2025-12-23 06:18:25',	'2025-12-23 06:18:25'),
(51,	26,	'uz',	'{"title": "Yangiliklar", "description": null}',	'2025-12-23 06:18:44',	'2025-12-23 06:18:44'),
(52,	26,	'ru',	'{"title": null, "description": null}',	'2025-12-23 06:18:44',	'2025-12-23 06:18:44'),
(53,	27,	'uz',	'{"title": "Mediateka", "description": null}',	'2025-12-23 06:19:02',	'2025-12-23 06:19:02'),
(54,	27,	'ru',	'{"title": null, "description": null}',	'2025-12-23 06:19:02',	'2025-12-23 06:19:02'),
(68,	8,	'en',	'{"title": null, "description": null}',	'2025-12-26 05:32:09',	'2025-12-26 06:45:53'),
(65,	31,	'uz',	'{"title": "Form", "description": null}',	'2025-12-25 13:31:05',	'2025-12-26 11:05:40'),
(9,	5,	'uz',	'{"title": "Ozbekiston", "description": null}',	'2025-12-23 04:51:35',	'2025-12-25 12:15:37'),
(10,	5,	'ru',	'{"title": null, "description": null}',	'2025-12-23 04:51:35',	'2025-12-25 12:15:37'),
(55,	5,	'en',	'{"title": null, "description": null}',	'2025-12-25 12:13:52',	'2025-12-25 12:15:37'),
(66,	31,	'ru',	'{"title": null, "description": null}',	'2025-12-25 13:31:05',	'2025-12-26 11:05:40'),
(67,	31,	'en',	'{"title": null, "description": null}',	'2025-12-25 13:31:05',	'2025-12-26 11:05:40');

DROP TABLE IF EXISTS "menu_mains";
DROP SEQUENCE IF EXISTS menu_mains_id_seq;
CREATE SEQUENCE menu_mains_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."menu_mains" (
    "id" bigint DEFAULT nextval('menu_mains_id_seq') NOT NULL,
    "type" character varying(255) DEFAULT 'category' NOT NULL,
    "slug" text,
    "url" text,
    "test" boolean DEFAULT false NOT NULL,
    "show_admin" boolean DEFAULT true NOT NULL,
    "sort_order" integer DEFAULT '1' NOT NULL,
    "icon" character varying(255),
    "status" boolean DEFAULT true NOT NULL,
    "parent_id" bigint,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "menu_mains_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "menu_mains_type_check" CHECK (((type)::text = ANY ((ARRAY['category'::character varying, 'page'::character varying, 'url'::character varying, 'section'::character varying])::text[])))
)
WITH (oids = false);

CREATE INDEX menu_mains_type_slug_status_sort_order_index ON public.menu_mains USING btree (type, slug, status, sort_order);

INSERT INTO "menu_mains" ("id", "type", "slug", "url", "test", "show_admin", "sort_order", "icon", "status", "parent_id", "created_at", "updated_at") VALUES
(1,	'category',	'asosiy-menu',	NULL,	'0',	'1',	1,	NULL,	'0',	NULL,	'2025-12-23 04:24:05',	'2025-12-23 04:24:05'),
(2,	'section',	'vatandoshlar',	NULL,	'0',	'1',	2,	NULL,	'1',	1,	'2025-12-23 04:24:41',	'2025-12-23 04:24:41'),
(3,	'section',	'statistika',	NULL,	'0',	'1',	3,	NULL,	'1',	1,	'2025-12-23 04:25:08',	'2025-12-23 04:25:08'),
(4,	'section',	'jamoat-fondi',	NULL,	'0',	'1',	4,	NULL,	'1',	1,	'2025-12-23 04:25:44',	'2025-12-23 04:25:44'),
(5,	'category',	'ozbekiston',	NULL,	'0',	'1',	5,	NULL,	'1',	NULL,	'2025-12-23 04:51:35',	'2025-12-23 04:51:35'),
(7,	'page',	'qadriyatlar',	NULL,	'0',	'1',	7,	NULL,	'1',	5,	'2025-12-23 04:52:36',	'2025-12-23 04:52:36'),
(9,	'page',	'moziy-va-bugun',	NULL,	'0',	'1',	9,	NULL,	'1',	5,	'2025-12-23 04:55:51',	'2025-12-23 04:55:51'),
(10,	'page',	'manzilgohlar',	NULL,	'0',	'1',	10,	NULL,	'1',	5,	'2025-12-23 04:56:55',	'2025-12-23 04:56:55'),
(6,	'page',	'bosh-sahifa',	NULL,	'0',	'1',	6,	NULL,	'1',	5,	'2025-12-23 04:52:02',	'2025-12-23 04:59:59'),
(14,	'page',	'rahbariyat',	NULL,	'0',	'1',	14,	NULL,	'1',	13,	'2025-12-23 05:13:48',	'2025-12-23 05:13:48'),
(15,	'page',	'fondning-asosiy-yo-nalishlari-',	NULL,	'0',	'1',	15,	NULL,	'1',	13,	'2025-12-23 05:14:17',	'2025-12-23 05:14:17'),
(16,	'page',	'faq',	NULL,	'0',	'1',	16,	NULL,	'1',	13,	'2025-12-23 05:14:52',	'2025-12-23 05:14:52'),
(20,	'page',	'birlashmalar',	NULL,	'0',	'1',	20,	NULL,	'1',	NULL,	'2025-12-23 05:36:31',	'2025-12-23 05:36:31'),
(21,	'page',	'jamoat-birlashmalari',	NULL,	'0',	'1',	21,	NULL,	'1',	20,	'2025-12-23 05:36:49',	'2025-12-23 05:36:49'),
(22,	'section',	'sarlavha',	NULL,	'0',	'1',	22,	NULL,	'1',	21,	'2025-12-23 05:38:42',	'2025-12-23 05:38:42'),
(23,	'section',	'tanlov',	NULL,	'0',	'1',	23,	NULL,	'1',	21,	'2025-12-23 05:39:07',	'2025-12-23 05:39:07'),
(13,	'category',	'biz-haqimizda',	NULL,	'0',	'1',	13,	NULL,	'1',	NULL,	'2025-12-23 05:13:24',	'2025-12-23 05:43:52'),
(25,	'category',	'axborot-xizmatlari',	NULL,	'0',	'1',	25,	NULL,	'1',	NULL,	'2025-12-23 06:18:25',	'2025-12-23 06:18:25'),
(26,	'page',	'yangiliklar',	NULL,	'0',	'1',	26,	NULL,	'1',	25,	'2025-12-23 06:18:44',	'2025-12-23 06:18:44'),
(27,	'page',	'mediateka',	NULL,	'0',	'1',	27,	NULL,	'1',	25,	'2025-12-23 06:19:02',	'2025-12-23 06:19:02'),
(24,	'page',	'biz_haqimizda_uchun',	NULL,	'0',	'1',	14,	NULL,	'1',	13,	'2025-12-23 05:42:34',	'2025-12-25 08:44:16'),
(30,	'section',	'url',	NULL,	'0',	'1',	30,	NULL,	'1',	6,	'2025-12-25 13:30:47',	'2025-12-25 13:30:47'),
(31,	'section',	'sarlavhass',	NULL,	'0',	'1',	31,	NULL,	'1',	6,	'2025-12-25 13:31:05',	'2025-12-25 13:34:53'),
(8,	'url',	'3d-sayohat',	'https://www.kj',	'0',	'0',	8,	NULL,	'0',	5,	'2025-12-23 04:53:12',	'2025-12-26 06:45:53');

DROP TABLE IF EXISTS "menus";
DROP SEQUENCE IF EXISTS menus_id_seq;
CREATE SEQUENCE menus_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."menus" (
    "id" bigint DEFAULT nextval('menus_id_seq') NOT NULL,
    "title" character varying(255) NOT NULL,
    "status" boolean DEFAULT true NOT NULL,
    "sort_order" bigint DEFAULT '0' NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "menus_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);


DROP TABLE IF EXISTS "migrations";
DROP SEQUENCE IF EXISTS migrations_id_seq;
CREATE SEQUENCE migrations_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."migrations" (
    "id" integer DEFAULT nextval('migrations_id_seq') NOT NULL,
    "migration" character varying(255) NOT NULL,
    "batch" integer NOT NULL,
    CONSTRAINT "migrations_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

INSERT INTO "migrations" ("id", "migration", "batch") VALUES
(1,	'0001_01_01_000000_create_users_table',	1),
(2,	'0001_01_01_000001_create_cache_table',	1),
(3,	'0001_01_01_000002_create_jobs_table',	1),
(4,	'2025_12_03_094858_create_menus_table',	1),
(5,	'2025_12_03_133507_create_roles_table',	1),
(6,	'2025_12_04_093815_create_permissions_table',	1),
(7,	'2025_12_04_094905_create_menu_mains_table',	1),
(8,	'2025_12_04_104850_create_langs_table',	1),
(9,	'2025_12_05_053253_create_menu_main_settings_table',	1),
(10,	'2025_12_08_045829_create_menu_main_translations_table',	1),
(11,	'2025_12_08_050435_create_menu_main_images_table',	1),
(12,	'2025_12_08_100657_create_page_sections_table',	1),
(13,	'2025_12_08_100708_create_page_section_settings_table',	1),
(14,	'2025_12_08_100721_create_page_section_translations_table',	1),
(15,	'2025_12_09_063323_create_role_menu_permissions_table',	1),
(16,	'2025_12_09_123317_create_page_section_images_table',	1),
(17,	'2025_12_16_103643_create_settings_table',	1),
(18,	'2025_12_16_120031_create_socials_table',	1),
(19,	'2025_12_16_173056_create_contents_table',	1),
(20,	'2025_12_16_174028_create_content_translations_table',	1),
(21,	'2025_12_16_174335_create_content_settings_table',	1),
(22,	'2025_12_16_175011_create_content_images_table',	1);

DROP TABLE IF EXISTS "page_section_images";
DROP SEQUENCE IF EXISTS page_section_images_id_seq;
CREATE SEQUENCE page_section_images_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."page_section_images" (
    "id" bigint DEFAULT nextval('page_section_images_id_seq') NOT NULL,
    "page_section_id" bigint NOT NULL,
    "page_section_parent_id" bigint,
    "category" text,
    "category_slug" text,
    "image" text,
    "compressed" text,
    "type" character varying(255),
    "size" bigint,
    "main" boolean DEFAULT false NOT NULL,
    "status" boolean DEFAULT true NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "page_section_images_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE INDEX page_section_images_main_status_category_category_slug_page_sec ON public.page_section_images USING btree (main, status, category, category_slug, page_section_parent_id, page_section_id);

INSERT INTO "page_section_images" ("id", "page_section_id", "page_section_parent_id", "category", "category_slug", "image", "compressed", "type", "size", "main", "status", "created_at", "updated_at") VALUES
(1,	1,	NULL,	NULL,	NULL,	'page_section_images/1766464991_logo.png',	NULL,	'image/png',	98609,	'1',	'1',	'2025-12-23 04:43:12',	'2025-12-23 04:43:12'),
(2,	2,	NULL,	NULL,	NULL,	'page_section_images/1766465101_stats-img-1.svg',	NULL,	'image/svg+xml',	1022,	'1',	'1',	'2025-12-23 04:45:01',	'2025-12-23 04:45:01'),
(3,	5,	NULL,	NULL,	NULL,	'page_section_images/1766466384_b8b65328e2c66f9e5b6a1abea44d4fbda4ff74d9.png',	NULL,	'image/png',	1255572,	'1',	'1',	'2025-12-23 05:06:24',	'2025-12-23 05:06:24'),
(4,	5,	NULL,	NULL,	NULL,	'page_section_images/1766466384_71596a3c79e6ea29869f23118068e52cdaa097e0.png',	NULL,	'image/png',	1051197,	'0',	'1',	'2025-12-23 05:06:24',	'2025-12-23 05:06:24'),
(5,	5,	NULL,	NULL,	NULL,	'page_section_images/1766466384_9f44c2e308de8a752650fc50f9a730e071877078.png',	NULL,	'image/png',	1672804,	'0',	'1',	'2025-12-23 05:06:24',	'2025-12-23 05:06:24'),
(6,	6,	NULL,	NULL,	NULL,	'page_section_images/1766466468_56fe38f6ec843c64677b251a9d627181f820bf50.png',	NULL,	'image/png',	1739467,	'1',	'1',	'2025-12-23 05:07:49',	'2025-12-23 05:07:49'),
(7,	7,	NULL,	NULL,	NULL,	'page_section_images/1766466507_about-video.jpg',	NULL,	'image/jpeg',	469151,	'1',	'1',	'2025-12-23 05:08:27',	'2025-12-23 05:08:27'),
(8,	8,	NULL,	NULL,	NULL,	'page_section_images/1766466629_c1a4917b58c218386f15744094c20059373d611d-min.png',	NULL,	'image/png',	895781,	'1',	'1',	'2025-12-23 05:10:29',	'2025-12-23 05:10:29'),
(9,	9,	NULL,	NULL,	NULL,	'page_section_images/1766466695_c1a4917b58c218386f15744094c20059373d611d-min.png',	NULL,	'image/png',	895781,	'1',	'1',	'2025-12-23 05:11:36',	'2025-12-23 05:11:36'),
(10,	12,	NULL,	NULL,	NULL,	'page_section_images/1766467747_logo.png',	NULL,	'image/png',	98609,	'1',	'1',	'2025-12-23 05:29:07',	'2025-12-23 05:29:07'),
(11,	12,	NULL,	NULL,	NULL,	'page_section_images/1766467747_56fe38f6ec843c64677b251a9d627181f820bf50.png',	NULL,	'image/png',	1739467,	'0',	'1',	'2025-12-23 05:29:07',	'2025-12-23 05:29:07'),
(12,	13,	NULL,	NULL,	NULL,	'page_section_images/1766467806_c1a4917b58c218386f15744094c20059373d611d-min.png',	NULL,	'image/png',	895781,	'1',	'1',	'2025-12-23 05:30:06',	'2025-12-23 05:30:06'),
(15,	16,	NULL,	NULL,	NULL,	'page_section_images/1766468047_financial-1.svg',	NULL,	'image/svg+xml',	2954,	'1',	'1',	'2025-12-23 05:34:07',	'2025-12-23 05:34:07'),
(16,	17,	NULL,	NULL,	NULL,	'page_section_images/1766468067_financial-2.svg',	NULL,	'image/svg+xml',	2234,	'1',	'1',	'2025-12-23 05:34:27',	'2025-12-23 05:34:27'),
(17,	19,	NULL,	NULL,	NULL,	'page_section_images/1766468859_flag-uz.png',	NULL,	'image/png',	9976,	'1',	'1',	'2025-12-23 05:47:39',	'2025-12-23 05:47:39'),
(18,	20,	NULL,	NULL,	NULL,	'page_section_images/1766468880_flag-en.png',	NULL,	'image/png',	18142,	'1',	'1',	'2025-12-23 05:48:00',	'2025-12-23 05:48:00'),
(19,	21,	19,	'tashkilot',	'tashkilot',	'page_section_images/1766469240_association-1.png',	NULL,	'image/png',	80956,	'1',	'1',	'2025-12-23 05:54:00',	'2025-12-23 05:54:00'),
(20,	23,	21,	'Rahbar',	'rahbar',	'page_section_images/1766469453_2302d0d79c36d32933b02c7f1b9e6140350fad23.png',	NULL,	'image/png',	565477,	'1',	'1',	'2025-12-23 05:57:33',	'2025-12-23 05:57:33'),
(21,	24,	19,	'tashkilot',	'tashkilot',	'page_section_images/1766469492_association-2.png',	NULL,	'image/png',	8354,	'1',	'1',	'2025-12-23 05:58:12',	'2025-12-23 05:58:12'),
(22,	26,	24,	'Rahbar',	'rahbar-1',	'page_section_images/1766469687_association-3.png',	NULL,	'image/png',	11024,	'1',	'1',	'2025-12-23 06:01:27',	'2025-12-23 06:01:27'),
(23,	26,	24,	'Rahbar',	'rahbar-1',	'page_section_images/1766469687_news-img-1.png',	NULL,	'image/png',	1264559,	'0',	'1',	'2025-12-23 06:01:27',	'2025-12-23 06:01:27'),
(24,	27,	20,	'tashkilot',	'tashkilot-1',	'page_section_images/1766469748_association-3.png',	NULL,	'image/png',	11024,	'1',	'1',	'2025-12-23 06:02:28',	'2025-12-23 06:02:28'),
(25,	30,	20,	'tashkilot',	'tashkilot-1',	'page_section_images/1766469975_association-4.png',	NULL,	'image/png',	5583,	'1',	'1',	'2025-12-23 06:06:15',	'2025-12-23 06:06:15'),
(26,	31,	30,	'Nomi',	'nomi-3',	'page_section_images/1766470044_association-4.png',	NULL,	'image/png',	5583,	'0',	'1',	'2025-12-23 06:07:24',	'2025-12-23 06:07:24'),
(27,	31,	30,	'Nomi',	'nomi-3',	'page_section_images/1766470044_association-3.png',	NULL,	'image/png',	11024,	'1',	'1',	'2025-12-23 06:07:24',	'2025-12-23 06:07:24'),
(28,	32,	30,	'Rahbar',	'rahbar-3',	'page_section_images/1766470115_flag-ru.png',	NULL,	'image/png',	1743,	'1',	'1',	'2025-12-23 06:08:35',	'2025-12-23 06:08:35'),
(29,	33,	NULL,	NULL,	NULL,	'page_section_images/1766470904_news-img-1.png',	NULL,	'image/png',	1264559,	'1',	'1',	'2025-12-23 06:21:44',	'2025-12-23 06:21:44'),
(30,	34,	NULL,	NULL,	NULL,	'page_section_images/1766470959_news-img-2.png',	NULL,	'image/png',	23441,	'1',	'1',	'2025-12-23 06:22:39',	'2025-12-23 06:22:39'),
(31,	39,	NULL,	NULL,	NULL,	'page_section_images/1766652621_c1a4917b58c218386f15744094c20059373d611d-min.png',	NULL,	'image/png',	895781,	'0',	'1',	'2025-12-25 08:50:21',	'2025-12-25 08:50:21'),
(33,	39,	NULL,	NULL,	NULL,	'page_section_images/1766652621_Taqu.jpg',	NULL,	'image/jpeg',	62105,	'0',	'1',	'2025-12-25 08:50:21',	'2025-12-25 08:50:21'),
(34,	39,	NULL,	NULL,	NULL,	'page_section_images/1766652621_news-img-1.png',	NULL,	'image/png',	1264559,	'0',	'1',	'2025-12-25 08:50:21',	'2025-12-25 08:50:21'),
(35,	40,	NULL,	NULL,	NULL,	'page_section_images/1766655727_financial-3.svg',	NULL,	'image/svg+xml',	2146,	'1',	'1',	'2025-12-25 09:42:07',	'2025-12-25 09:42:36'),
(48,	37,	NULL,	NULL,	NULL,	'page_section_images/1766656863_logo.png',	NULL,	'image/png',	98609,	'1',	'1',	'2025-12-25 10:01:03',	'2025-12-25 10:01:03'),
(53,	8,	NULL,	NULL,	NULL,	'page_section_images/1766657914_mail.svg',	NULL,	'image/svg+xml',	354,	'0',	'1',	'2025-12-25 10:18:34',	'2025-12-25 10:18:34'),
(54,	8,	NULL,	NULL,	NULL,	'page_section_images/1766657914_news-img-1.png',	NULL,	'image/png',	1264559,	'0',	'1',	'2025-12-25 10:18:34',	'2025-12-25 10:18:34'),
(64,	51,	NULL,	NULL,	NULL,	'page_section_images/1766669091_c1a4917b58c218386f15744094c20059373d611d-min.png',	NULL,	'image/png',	895781,	'0',	'1',	'2025-12-25 13:24:51',	'2025-12-25 13:24:51'),
(65,	51,	NULL,	NULL,	NULL,	'page_section_images/1766669091_form.jpg',	NULL,	'image/jpeg',	192942,	'0',	'1',	'2025-12-25 13:24:51',	'2025-12-25 13:24:51'),
(66,	51,	NULL,	NULL,	NULL,	'page_section_images/1766669091_oila1.jpg',	NULL,	'image/jpeg',	1739467,	'0',	'1',	'2025-12-25 13:24:51',	'2025-12-25 13:24:51'),
(67,	54,	NULL,	NULL,	NULL,	'page_section_images/1766669782_c1a4917b58c218386f15744094c20059373d611d-min.png',	NULL,	'image/png',	895781,	'0',	'1',	'2025-12-25 13:36:22',	'2025-12-25 13:36:22'),
(68,	54,	NULL,	NULL,	NULL,	'page_section_images/1766669782_form.jpg',	NULL,	'image/jpeg',	192942,	'0',	'1',	'2025-12-25 13:36:22',	'2025-12-25 13:36:22'),
(69,	54,	NULL,	NULL,	NULL,	'page_section_images/1766669782_oila1.jpg',	NULL,	'image/jpeg',	1739467,	'0',	'1',	'2025-12-25 13:36:22',	'2025-12-25 13:36:22'),
(70,	33,	NULL,	NULL,	NULL,	'page_section_images/1766723860_news-img-1.png',	NULL,	'image/png',	1264559,	'0',	'1',	'2025-12-26 04:37:41',	'2025-12-26 04:37:41'),
(71,	33,	NULL,	NULL,	NULL,	'page_section_images/1766725150_71596a3c79e6ea29869f23118068e52cdaa097e0.png',	NULL,	'image/png',	1051197,	'0',	'1',	'2025-12-26 04:59:11',	'2025-12-26 04:59:11'),
(72,	33,	NULL,	NULL,	NULL,	'page_section_images/1766725151_b8b65328e2c66f9e5b6a1abea44d4fbda4ff74d9.png',	NULL,	'image/png',	1255572,	'0',	'1',	'2025-12-26 04:59:11',	'2025-12-26 04:59:11'),
(73,	14,	NULL,	NULL,	NULL,	'page_section_images/1766726046_f87cf5263832720cdbe41c7eb7faa98cae5c58a2.png',	NULL,	'image/png',	786846,	'1',	'1',	'2025-12-26 05:14:06',	'2025-12-26 05:14:06'),
(74,	15,	NULL,	NULL,	NULL,	'page_section_images/1766726080_7f1beefe896a37c2a8669f8c96ad0b81629aa952.png',	NULL,	'image/png',	751123,	'1',	'1',	'2025-12-26 05:14:40',	'2025-12-26 05:14:40'),
(76,	56,	NULL,	NULL,	NULL,	'page_section_images/1766733524_b8b65328e2c66f9e5b6a1abea44d4fbda4ff74d9.png',	NULL,	'image/png',	1255572,	'1',	'1',	'2025-12-26 07:18:44',	'2025-12-26 07:18:44'),
(77,	53,	NULL,	NULL,	NULL,	'page_section_images/1766741574_c1a4917b58c218386f15744094c20059373d611d-min.png',	NULL,	'image/png',	895781,	'0',	'1',	'2025-12-26 09:32:54',	'2025-12-26 09:32:54'),
(78,	53,	NULL,	NULL,	NULL,	'page_section_images/1766741574_form.jpg',	NULL,	'image/jpeg',	192942,	'0',	'1',	'2025-12-26 09:32:54',	'2025-12-26 09:32:54'),
(79,	53,	NULL,	NULL,	NULL,	'page_section_images/1766741574_oila1.jpg',	NULL,	'image/jpeg',	1739467,	'0',	'1',	'2025-12-26 09:32:55',	'2025-12-26 09:32:55'),
(87,	57,	52,	'Url',	'url',	'page_section_images/1766747422_oila1.jpg',	NULL,	'image/jpeg',	1739467,	'0',	'1',	'2025-12-26 11:10:22',	'2025-12-26 11:10:22'),
(88,	58,	52,	'Url',	'url',	'page_section_images/1766747439_form.jpg',	NULL,	'image/jpeg',	192942,	'0',	'1',	'2025-12-26 11:10:39',	'2025-12-26 11:10:39');

DROP TABLE IF EXISTS "page_section_settings";
DROP SEQUENCE IF EXISTS page_section_settings_id_seq;
CREATE SEQUENCE page_section_settings_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."page_section_settings" (
    "id" bigint DEFAULT nextval('page_section_settings_id_seq') NOT NULL,
    "menu_main_id" bigint NOT NULL,
    "page_section_parent_id" bigint,
    "category" text,
    "category_slug" text,
    "key" character varying(255) NOT NULL,
    "label" character varying(255) NOT NULL,
    "type" character varying(255) NOT NULL,
    "required" boolean DEFAULT true NOT NULL,
    "is_translatable" boolean DEFAULT true NOT NULL,
    "options" json,
    "sort_order" integer DEFAULT '0' NOT NULL,
    "relation" text,
    "status" boolean DEFAULT true NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "page_section_settings_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE INDEX page_section_settings_key_is_translatable_status_sort_order_cat ON public.page_section_settings USING btree (key, is_translatable, status, sort_order, category, category_slug);

INSERT INTO "page_section_settings" ("id", "menu_main_id", "page_section_parent_id", "category", "category_slug", "key", "label", "type", "required", "is_translatable", "options", "sort_order", "relation", "status", "created_at", "updated_at") VALUES
(1,	2,	NULL,	NULL,	NULL,	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-23 04:42:26',	'2025-12-23 04:42:26'),
(2,	2,	NULL,	NULL,	NULL,	'description',	'Description',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-23 04:42:26',	'2025-12-23 04:42:26'),
(3,	3,	NULL,	NULL,	NULL,	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-23 04:44:11',	'2025-12-23 04:44:11'),
(4,	3,	NULL,	NULL,	NULL,	'number',	'Number',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-23 04:44:12',	'2025-12-23 04:44:12'),
(5,	4,	NULL,	NULL,	NULL,	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-23 04:49:23',	'2025-12-23 04:49:23'),
(6,	4,	NULL,	NULL,	NULL,	'content',	'Content',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-23 04:49:24',	'2025-12-23 04:49:24'),
(7,	4,	NULL,	NULL,	NULL,	'description',	'Description',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-23 04:49:24',	'2025-12-23 04:49:24'),
(8,	4,	NULL,	NULL,	NULL,	'content1',	'Content1',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-23 04:49:24',	'2025-12-23 04:49:24'),
(9,	11,	NULL,	NULL,	NULL,	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-23 05:05:21',	'2025-12-23 05:05:21'),
(10,	11,	NULL,	NULL,	NULL,	'description',	'Description',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-23 05:05:21',	'2025-12-23 05:05:21'),
(11,	12,	NULL,	NULL,	NULL,	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-23 05:06:52',	'2025-12-23 05:06:52'),
(12,	7,	NULL,	NULL,	NULL,	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-23 05:09:20',	'2025-12-23 05:09:20'),
(13,	7,	NULL,	NULL,	NULL,	'description',	'Description',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-23 05:09:20',	'2025-12-23 05:09:20'),
(14,	9,	NULL,	NULL,	NULL,	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-23 05:11:02',	'2025-12-23 05:11:02'),
(15,	9,	NULL,	NULL,	NULL,	'description',	'Description',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-23 05:11:02',	'2025-12-23 05:11:02'),
(16,	10,	NULL,	NULL,	NULL,	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-23 05:12:17',	'2025-12-23 05:12:17'),
(17,	10,	NULL,	NULL,	NULL,	'description',	'Description',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-23 05:12:17',	'2025-12-23 05:12:17'),
(63,	16,	NULL,	NULL,	NULL,	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-25 09:46:24',	'2025-12-25 09:46:24'),
(20,	18,	NULL,	NULL,	NULL,	'description',	'Description',	'textarea',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-23 05:26:22',	'2025-12-23 05:26:44'),
(21,	18,	NULL,	NULL,	NULL,	'content',	'Content',	'textarea',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-23 05:27:46',	'2025-12-23 05:27:46'),
(22,	19,	NULL,	NULL,	NULL,	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-23 05:29:40',	'2025-12-23 05:29:40'),
(23,	14,	NULL,	NULL,	NULL,	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-23 05:31:09',	'2025-12-23 05:31:09'),
(24,	14,	NULL,	NULL,	NULL,	'phone',	'Phone',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-23 05:31:09',	'2025-12-23 05:31:09'),
(25,	14,	NULL,	NULL,	NULL,	'email',	'Email',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-23 05:31:09',	'2025-12-23 05:31:09'),
(26,	15,	NULL,	NULL,	NULL,	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-23 05:33:37',	'2025-12-23 05:33:37'),
(27,	23,	NULL,	NULL,	NULL,	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-23 05:45:15',	'2025-12-23 05:45:15'),
(28,	22,	NULL,	NULL,	NULL,	'title',	'Title',	'textarea',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-23 05:45:51',	'2025-12-23 05:45:51'),
(29,	23,	19,	'tashkilot',	'tashkilot',	'title',	'Title',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-23 05:53:34',	'2025-12-23 05:53:34'),
(30,	23,	21,	'Nomi',	'nomi',	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-23 05:54:40',	'2025-12-23 05:54:40'),
(31,	23,	21,	'Nomi',	'nomi',	'date_at',	'Date_at',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-23 05:54:40',	'2025-12-23 05:54:58'),
(32,	23,	21,	'Nomi',	'nomi',	'first_boss',	'Boss',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-23 05:54:40',	'2025-12-23 05:54:58'),
(33,	23,	21,	'Rahbar',	'rahbar',	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-23 05:56:49',	'2025-12-23 05:56:49'),
(34,	23,	21,	'Rahbar',	'rahbar',	'phone',	'Phone',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-23 05:56:49',	'2025-12-23 05:56:49'),
(35,	23,	21,	'Rahbar',	'rahbar',	'email',	'Email',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-23 05:56:49',	'2025-12-23 05:56:49'),
(36,	23,	24,	'Nomi',	'nomi-1',	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-23 05:58:58',	'2025-12-23 05:58:58'),
(37,	23,	24,	'Nomi',	'nomi-1',	'date_at',	'Date_at',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-23 05:58:58',	'2025-12-23 05:58:58'),
(38,	23,	24,	'Nomi',	'nomi-1',	'first_boss',	'Boss',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-23 05:58:58',	'2025-12-23 05:58:58'),
(39,	23,	24,	'Rahbar',	'rahbar-1',	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-23 06:00:15',	'2025-12-23 06:00:15'),
(40,	23,	24,	'Rahbar',	'rahbar-1',	'phone',	'Phone',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-23 06:00:15',	'2025-12-23 06:00:15'),
(41,	23,	24,	'Rahbar',	'rahbar-1',	'email',	'Email',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-23 06:00:15',	'2025-12-23 06:00:15'),
(42,	23,	20,	'tashkilot',	'tashkilot-1',	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-23 06:02:00',	'2025-12-23 06:02:00'),
(43,	23,	27,	'Nomi',	'nomi-2',	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-23 06:03:21',	'2025-12-23 06:03:21'),
(44,	23,	27,	'Nomi',	'nomi-2',	'date_at',	'Date_at',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-23 06:03:21',	'2025-12-23 06:03:21'),
(45,	23,	27,	'Nomi',	'nomi-2',	'first_boss',	'Boss',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-23 06:03:21',	'2025-12-23 06:03:21'),
(46,	23,	27,	'Rahbar',	'rahbar-2',	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-23 06:04:49',	'2025-12-23 06:04:49'),
(47,	23,	27,	'Rahbar',	'rahbar-2',	'phone',	'Phone',	'number',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-23 06:04:49',	'2025-12-23 06:04:49'),
(48,	23,	27,	'Rahbar',	'rahbar-2',	'email',	'Email',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-23 06:04:49',	'2025-12-23 06:04:49'),
(49,	23,	30,	'Nomi',	'nomi-3',	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-23 06:06:54',	'2025-12-23 06:06:54'),
(50,	23,	30,	'Nomi',	'nomi-3',	'date_at',	'Date_at',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-23 06:06:54',	'2025-12-23 06:06:54'),
(51,	23,	30,	'Nomi',	'nomi-3',	'first_boss',	'Boss',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-23 06:06:54',	'2025-12-23 06:06:54'),
(52,	23,	30,	'Rahbar',	'rahbar-3',	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-23 06:08:04',	'2025-12-23 06:08:04'),
(53,	23,	30,	'Rahbar',	'rahbar-3',	'phone',	'Phone',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-23 06:08:04',	'2025-12-23 06:08:04'),
(54,	23,	30,	'Rahbar',	'rahbar-3',	'email',	'Email',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-23 06:08:04',	'2025-12-23 06:08:04'),
(55,	26,	NULL,	NULL,	NULL,	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-23 06:20:02',	'2025-12-23 06:20:02'),
(64,	16,	NULL,	NULL,	NULL,	'description',	'Description',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-25 09:46:24',	'2025-12-25 09:46:24'),
(57,	26,	NULL,	NULL,	NULL,	'url',	'Url',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-23 06:20:02',	'2025-12-23 06:21:05'),
(56,	26,	NULL,	NULL,	NULL,	'description',	'Description',	'textarea',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-23 06:20:02',	'2025-12-23 06:21:05'),
(58,	27,	NULL,	NULL,	NULL,	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-23 06:21:59',	'2025-12-23 06:21:59'),
(18,	17,	NULL,	NULL,	NULL,	'description',	'Description',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-23 05:18:57',	'2025-12-25 08:28:51'),
(19,	18,	NULL,	NULL,	NULL,	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-23 05:26:22',	'2025-12-25 08:30:29'),
(59,	24,	NULL,	NULL,	NULL,	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-25 08:46:46',	'2025-12-25 08:46:46'),
(60,	24,	NULL,	NULL,	NULL,	'description',	'Description',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-25 08:46:46',	'2025-12-25 08:46:46'),
(61,	24,	NULL,	NULL,	NULL,	'content',	'Content',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-25 08:46:46',	'2025-12-25 08:46:46'),
(62,	24,	NULL,	NULL,	NULL,	'url',	'Url',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-25 08:46:46',	'2025-12-25 08:46:46'),
(65,	6,	NULL,	NULL,	NULL,	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-25 09:55:32',	'2025-12-25 09:55:32'),
(66,	6,	NULL,	NULL,	NULL,	'description',	'Description',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-25 09:55:32',	'2025-12-25 09:55:32'),
(67,	6,	NULL,	NULL,	NULL,	'url',	'Url',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-25 13:17:35',	'2025-12-25 13:17:35'),
(68,	28,	NULL,	NULL,	NULL,	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-25 13:21:49',	'2025-12-25 13:21:49'),
(69,	28,	NULL,	NULL,	NULL,	'url',	'Url',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-25 13:21:49',	'2025-12-25 13:21:49'),
(70,	29,	NULL,	NULL,	NULL,	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-25 13:23:00',	'2025-12-25 13:23:00'),
(71,	29,	NULL,	NULL,	NULL,	'description',	'Description',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-25 13:23:00',	'2025-12-25 13:23:00'),
(72,	30,	NULL,	NULL,	NULL,	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-25 13:31:28',	'2025-12-25 13:31:28'),
(74,	31,	NULL,	NULL,	NULL,	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-25 13:35:17',	'2025-12-25 13:35:17'),
(75,	31,	NULL,	NULL,	NULL,	'description',	'Description',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-25 13:35:17',	'2025-12-25 13:35:17'),
(76,	27,	NULL,	NULL,	NULL,	'url',	'Url',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-26 05:11:06',	'2025-12-26 05:12:04'),
(77,	14,	NULL,	NULL,	NULL,	'description',	'Description',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-26 05:16:30',	'2025-12-26 05:16:30'),
(78,	7,	NULL,	NULL,	NULL,	'url',	'Url',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-26 05:18:39',	'2025-12-26 05:21:46'),
(79,	7,	NULL,	NULL,	NULL,	'url_title',	'Url_title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-26 05:23:33',	'2025-12-26 05:23:33'),
(80,	9,	NULL,	NULL,	NULL,	'url',	'Url',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-26 05:27:34',	'2025-12-26 05:29:14'),
(81,	9,	NULL,	NULL,	NULL,	'url_title',	'Url_title',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-26 05:27:34',	'2025-12-26 05:29:14'),
(82,	27,	NULL,	NULL,	NULL,	'url_title',	'Url_title',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-26 05:30:31',	'2025-12-26 05:30:31'),
(73,	30,	NULL,	NULL,	NULL,	'url',	'Url',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-25 13:31:28',	'2025-12-26 09:35:27'),
(83,	30,	52,	'Url',	'url',	'url',	'Url',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-26 11:09:36',	'2025-12-26 11:09:49'),
(84,	30,	52,	'Url',	'url',	'url_title',	'Url_title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-26 11:29:17',	'2025-12-26 11:29:17');

DROP TABLE IF EXISTS "page_section_translations";
DROP SEQUENCE IF EXISTS page_section_translations_id_seq;
CREATE SEQUENCE page_section_translations_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."page_section_translations" (
    "id" bigint DEFAULT nextval('page_section_translations_id_seq') NOT NULL,
    "page_section_id" bigint NOT NULL,
    "page_section_parent_id" bigint,
    "category" text,
    "category_slug" text,
    "locale" character varying(3),
    "data" jsonb,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "page_section_translations_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE INDEX page_section_translations_locale_category_page_section_id_page_ ON public.page_section_translations USING btree (locale, category, page_section_id, page_section_parent_id, category_slug);

INSERT INTO "page_section_translations" ("id", "page_section_id", "page_section_parent_id", "category", "category_slug", "locale", "data", "created_at", "updated_at") VALUES
(1,	1,	NULL,	NULL,	NULL,	'uz',	'{"title": "Vatandoshlar Jamoat Fondi", "description": "\"Vatandoshlar\" jamoat fondi — bu xorijdagi o‘zbekistonlik vatandoshlar bilan aloqalarni mustahkamlash, ularning huquq va manfaatlarini qo‘llab-quvvatlash, shuningdek, ularni O‘zbekiston taraqqiyotiga jalb etish maqsadida tashkil etilgan notijorat tashkilotdir."}',	'2025-12-23 04:43:11',	'2025-12-23 04:43:11'),
(2,	1,	NULL,	NULL,	NULL,	'ru',	'{"title": null, "description": null}',	'2025-12-23 04:43:11',	'2025-12-23 04:43:11'),
(3,	2,	NULL,	NULL,	NULL,	'uz',	'{"title": "Qatnashgan vatandoshlar soni"}',	'2025-12-23 04:45:01',	'2025-12-23 04:45:01'),
(4,	2,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-23 04:45:01',	'2025-12-23 04:45:01'),
(5,	2,	NULL,	NULL,	NULL,	NULL,	'{"number": "25565"}',	'2025-12-23 04:45:01',	'2025-12-23 04:45:01'),
(6,	3,	NULL,	NULL,	NULL,	'uz',	'{"title": "Qatnashgan vatandoshlar soni"}',	'2025-12-23 04:45:52',	'2025-12-23 04:45:52'),
(7,	3,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-23 04:45:52',	'2025-12-23 04:45:52'),
(8,	3,	NULL,	NULL,	NULL,	NULL,	'{"number": "1255"}',	'2025-12-23 04:45:52',	'2025-12-23 04:45:52'),
(9,	4,	NULL,	NULL,	NULL,	'uz',	'{"title": "Vatandoshlar jamoat fondi", "content": "“Xorijda istiqomat qilayotgan yurtdoshlarni birlashtirish maqsadida ''Vatandoshlar'' jamoat fondi tashkil etildi... Bu fonddan asosiy maqsad - tarixiy Vatanimiz atrofida ularni yanada jipslashtirish, ularning qalbi va ongida yurt bilan faxrlanish tuyg''usini yuksaltirish, milliy oʻzlikni saqlab qolish”", "content1": "O’zbekiston Respublikasi Prezidenti", "description": "Shavkat Miromonovich Mirziyoyev"}',	'2025-12-23 04:50:44',	'2025-12-23 04:50:44'),
(10,	4,	NULL,	NULL,	NULL,	'ru',	'{"title": null, "content": null, "content1": null, "description": null}',	'2025-12-23 04:50:44',	'2025-12-23 04:50:44'),
(11,	5,	NULL,	NULL,	NULL,	'uz',	'{"title": "O‘zbekiston – sirli o‘tmish va yorqin kelajak maskani!", "description": "O‘zbekiston – tarix va zamonaviylik uyg‘unligi! Bu yerda har bir qadam o‘ziga xos kashfiyot. So‘nggi yillarda mamlakat turizm, iqtisodiyot va xizmat ko‘rsatish sohalarida yangi bosqichga ko‘tarilib, sayyohlar uchun yanada qulay va qiziqarli makonga aylandi. Samarqand, Buxoro, Xiva kabi shaharlar o‘zining qadimiy ruhi bilan, Toshkent esa zamonaviy tarovati bilan mehmonlarni o‘ziga jalb qiladi. Bu yerda qadimiylik va yangilik birlashadi, mehmondo‘stlik esa har yurakni zabt etadi. O‘zbekiston – bu nafaqat sayohat, balki ilhom, kashfiyot va unutilmas taassurotlar manzili. Bu mo‘jizaviy diyorga qadam qo‘ying va yuragingizni bu yerga abadiy bog‘lang!"}',	'2025-12-23 05:06:24',	'2025-12-23 05:06:24'),
(12,	5,	NULL,	NULL,	NULL,	'ru',	'{"title": null, "description": null}',	'2025-12-23 05:06:24',	'2025-12-23 05:06:24'),
(13,	6,	NULL,	NULL,	NULL,	'uz',	'{"title": "Forum va seminarlardan video"}',	'2025-12-23 05:07:48',	'2025-12-23 05:07:48'),
(14,	6,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-23 05:07:48',	'2025-12-23 05:07:48'),
(15,	7,	NULL,	NULL,	NULL,	'uz',	'{"title": "Fotogalareya"}',	'2025-12-23 05:08:27',	'2025-12-23 05:08:27'),
(16,	7,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-23 05:08:27',	'2025-12-23 05:08:27'),
(21,	10,	NULL,	NULL,	NULL,	'uz',	'{"title": "Har bir manzil – yangi bir orzu!", "description": "O‘zbekistonning eng go‘zal va sirli joylariga sayohat qilish, unutilmas xotiralar bilan qaytish uchun sizni kutmoqda! Bu yerda sizni ajoyib tabiat manzaralari, qadimiy shaharlarning tarixiy obidalari va madaniyatning eng boy meroslari kutib oladi. Har bir manzil o‘ziga xos hikoya va hissiyotlarni uyg‘otadi. Har bir manzil – bu nafaqat tabiatning go‘zalligi, balki yurtimizning yuragidan chiqib, har bir sayyohni o‘ziga jalb qiladigan sehrdir. O‘zbekistonni kashf eting, uning har bir burchagidan ilhom oling va qaytganingizda qalbingizda unutilmas xotiralar qoladi!"}',	'2025-12-23 05:12:50',	'2025-12-23 05:12:50'),
(22,	10,	NULL,	NULL,	NULL,	'ru',	'{"title": null, "description": null}',	'2025-12-23 05:12:50',	'2025-12-23 05:12:50'),
(26,	12,	NULL,	NULL,	NULL,	'ru',	'{"title": null, "content": null, "description": null}',	'2025-12-23 05:29:07',	'2025-12-25 08:31:46'),
(20,	9,	NULL,	NULL,	NULL,	'ru',	'{"url": null, "title": null, "url_title": null, "description": null}',	'2025-12-23 05:11:35',	'2025-12-26 05:28:45'),
(94,	39,	NULL,	NULL,	NULL,	'en',	'{"url": null, "title": null, "content": null, "description": null}',	'2025-12-25 08:50:21',	'2025-12-26 07:23:47'),
(17,	8,	NULL,	NULL,	NULL,	'uz',	'{"title": "Qadriyatlarimiz bizni birlashtiradi!", "url_title": "Eng chiroyli Namuna", "description": "Qadriyatlarimiz bizni birlashtiradi! Qadriyatlarimiz – bu bizning ildizlarimiz, qalbimizning kuchi va kelajagimizning yorqin yo‘li. Ular bizni bog‘laydi, har birimizning yuragimizni birlashtiradi va bizga chinakam muvaffaqiyatga erishish imkonini beradi. Biz bu qadriyatlar bilan faxrlanishimiz kerak, chunki ular bizni yuksaltiradi va dunyoga haqiqiy kuchimizni ko‘rsatadi. Qadriyatlarimizga sodiq qolish, ularni davom ettirish – bu nafaqat bugungi kunimiz, balki kelajagimiz uchun ham zarur. Qadriyatlarimiz – bu bizning abadiy merosimiz!"}',	'2025-12-23 05:10:29',	'2025-12-26 05:24:48'),
(18,	8,	NULL,	NULL,	NULL,	'ru',	'{"title": null, "url_title": null, "description": null}',	'2025-12-23 05:10:29',	'2025-12-26 05:24:48'),
(19,	9,	NULL,	NULL,	NULL,	'uz',	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW", "title": "Moziydan saboq, bugundan yuksalish", "url_title": "Bugungi kundagi O''zbekiston", "description": "Moziy va bugun – bu vaqtning ikki qutbi: o‘tgan zamonning ulug‘vorligi va bugunning yuksalishi. Bu yerda tariximizning buyuk sahifalari va hozirgi kunda yaratilayotgan yangi yutuqlar birlashadi. Moziy – bu bizni yuksaltirgan ildizlar, Bugun esa bizning yuksalishimiz, kuchimiz va kelajakka ishonchimizdir. Har bir qadriyat, har bir qadam, bizni kelajakka yetaklaydi. Moziyda o‘rgangan saboqlarimiz, bugunda amalga oshirgan ishlarimizga yo‘l ochadi. Moziy va Bugun – bu vaqtning qiyofasi, bizning kelajakka yo‘limiz!"}',	'2025-12-23 05:11:35',	'2025-12-26 05:28:45'),
(27,	13,	NULL,	NULL,	NULL,	'uz',	'{"title": "Oliy maqsadimiz-xorijdagi vatandoshlarni Vatan atrofida birlashtirish, ularning qalbi va ongida yurtdan faxrlanish tuyg''usini yuksaltirish, milliy o''zlikni asrashdir!"}',	'2025-12-23 05:30:06',	'2025-12-23 05:30:06'),
(28,	13,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-23 05:30:06',	'2025-12-23 05:30:06'),
(35,	16,	NULL,	NULL,	NULL,	'uz',	'{"title": "Jamoat birlashmalari bilan hamkorlik aloqalarini yo‘lga qo‘yish va rivojlantirish"}',	'2025-12-23 05:34:07',	'2025-12-23 05:34:07'),
(36,	16,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-23 05:34:07',	'2025-12-23 05:34:07'),
(37,	17,	NULL,	NULL,	NULL,	'uz',	'{"title": "Vatandoshlarning huquq va erkinliklarini himoya qilishga ko‘maklashish"}',	'2025-12-23 05:34:27',	'2025-12-23 05:34:27'),
(38,	17,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-23 05:34:27',	'2025-12-23 05:34:27'),
(39,	18,	NULL,	NULL,	NULL,	'uz',	'{"title": "<p><span>Fond faoliyatining asosiy yo‘nalishlaridan bu xorijda istiqomat qilayotgan vatandoshlar va ular tomonidan tuzilgan jamoat birlashmalari bilan hamkorlik aloqalarini yo‘lga qo‘yish va rivojlantirish. Shu bois vatandoshlar tomonidan tashkil etilgan jamoat birlashmalari faoliyatini rag‘batlantirish, ularga xorijda o‘zbek milliy madaniy markazlarini tashkil etishda amaliy yordam ko‘rsatish, vatandosh birlashmalari bilan hamkorlikda xorijda o‘zbek tili, madaniyati va an’analarini saqlab qolish va rivojlantirishga qaratilgan faoliyatni qo‘llab-quvvatlash va xorijda yurtimizning boy ilmiy, madaniy va ma’naviy merosini keng targ‘ib qilish va ommalashtirish, vatandoshlarga madaniy-ma’rifiy tadbirlarni tashkil etishda ko‘maklashish.x</span></p>"}',	'2025-12-23 05:46:01',	'2025-12-23 05:46:01'),
(40,	18,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-23 05:46:01',	'2025-12-23 05:46:01'),
(41,	19,	NULL,	NULL,	NULL,	'uz',	'{"title": "Ozbekiston"}',	'2025-12-23 05:47:39',	'2025-12-23 05:47:39'),
(42,	19,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-23 05:47:39',	'2025-12-23 05:47:39'),
(43,	20,	NULL,	NULL,	NULL,	'uz',	'{"title": "Buyuk Britaniya"}',	'2025-12-23 05:48:00',	'2025-12-23 05:48:00'),
(44,	20,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-23 05:48:00',	'2025-12-23 05:48:00'),
(45,	21,	19,	'tashkilot',	'tashkilot',	NULL,	'{"title": "Pittsburgdagi uzbeklar jamiyati"}',	'2025-12-23 05:54:00',	'2025-12-23 05:54:00'),
(46,	22,	21,	'Nomi',	'nomi',	'uz',	'{"title": "Pittsburgdagi uzbeklar jamiyati"}',	'2025-12-23 05:55:39',	'2025-12-23 05:55:39'),
(47,	22,	21,	'Nomi',	'nomi',	'ru',	'{"title": null}',	'2025-12-23 05:55:39',	'2025-12-23 05:55:39'),
(48,	22,	21,	'Nomi',	'nomi',	NULL,	'{"date_at": "12/20/2018", "first_boss": "20/09/2024"}',	'2025-12-23 05:55:39',	'2025-12-23 05:55:39'),
(49,	23,	21,	'Rahbar',	'rahbar',	'uz',	'{"title": "Sadikov Baxodir Talibjonovich  Pittsburgdagi uzbeklar jamiyati rahbari"}',	'2025-12-23 05:57:33',	'2025-12-23 05:57:33'),
(50,	23,	21,	'Rahbar',	'rahbar',	'ru',	'{"title": null}',	'2025-12-23 05:57:33',	'2025-12-23 05:57:33'),
(51,	23,	21,	'Rahbar',	'rahbar',	NULL,	'{"email": "sadikov_bahodir@gmail.com", "phone": "+998(55) 502-22-99"}',	'2025-12-23 05:57:33',	'2025-12-23 05:57:33'),
(52,	24,	19,	'tashkilot',	'tashkilot',	NULL,	'{"title": "Amerika O‘zbekiston Uyushmasi"}',	'2025-12-23 05:58:12',	'2025-12-23 05:58:12'),
(53,	25,	24,	'Nomi',	'nomi-1',	'uz',	'{"title": "Amerika O‘zbekiston Uyushmasi", "date_at": "20/08/2005", "first_boss": "20/10/2021"}',	'2025-12-23 05:59:34',	'2025-12-23 05:59:34'),
(54,	25,	24,	'Nomi',	'nomi-1',	'ru',	'{"title": null, "date_at": null, "first_boss": null}',	'2025-12-23 05:59:34',	'2025-12-23 05:59:34'),
(55,	26,	24,	'Rahbar',	'rahbar-1',	'uz',	'{"title": "Amerika O‘zbekiston Uyushma"}',	'2025-12-23 06:01:27',	'2025-12-23 06:01:27'),
(56,	26,	24,	'Rahbar',	'rahbar-1',	'ru',	'{"title": null}',	'2025-12-23 06:01:27',	'2025-12-23 06:01:27'),
(57,	26,	24,	'Rahbar',	'rahbar-1',	NULL,	'{"email": "sadikov_bahodir@gmail.com", "phone": "+998(55) 502-22-99"}',	'2025-12-23 06:01:27',	'2025-12-23 06:01:27'),
(58,	27,	20,	'tashkilot',	'tashkilot-1',	'uz',	'{"title": "“Mahalla-USA” o‘zbek diasporal tashkiloti"}',	'2025-12-23 06:02:28',	'2025-12-23 06:02:28'),
(59,	27,	20,	'tashkilot',	'tashkilot-1',	'ru',	'{"title": null}',	'2025-12-23 06:02:28',	'2025-12-23 06:02:28'),
(60,	28,	27,	'Nomi',	'nomi-2',	'uz',	'{"title": "“Mahalla-USA” o‘zbek diasporal tashkiloti"}',	'2025-12-23 06:03:58',	'2025-12-23 06:03:58'),
(61,	28,	27,	'Nomi',	'nomi-2',	'ru',	'{"title": null}',	'2025-12-23 06:03:58',	'2025-12-23 06:03:58'),
(62,	28,	27,	'Nomi',	'nomi-2',	NULL,	'{"date_at": "12/20/2017", "first_boss": "12/20/2019"}',	'2025-12-23 06:03:58',	'2025-12-23 06:03:58'),
(63,	29,	27,	'Rahbar',	'rahbar-2',	'uz',	'{"title": "Sadikov Baxodir Talibjonovich  Pittsburgdagi uzbeklar jamiyati rahbari"}',	'2025-12-23 06:05:38',	'2025-12-23 06:05:38'),
(64,	29,	27,	'Rahbar',	'rahbar-2',	'ru',	'{"title": null}',	'2025-12-23 06:05:38',	'2025-12-23 06:05:38'),
(65,	29,	27,	'Rahbar',	'rahbar-2',	NULL,	'{"email": "sanayev@vatandoshlarfondi.uz", "phone": null}',	'2025-12-23 06:05:38',	'2025-12-23 06:05:38'),
(66,	30,	20,	'tashkilot',	'tashkilot-1',	'uz',	'{"title": "“Yurtdosh” Uzbek-Amerika Assotsiatsiyasi"}',	'2025-12-23 06:06:15',	'2025-12-23 06:06:15'),
(67,	30,	20,	'tashkilot',	'tashkilot-1',	'ru',	'{"title": null}',	'2025-12-23 06:06:15',	'2025-12-23 06:06:15'),
(68,	31,	30,	'Nomi',	'nomi-3',	'uz',	'{"title": "“Yurtdosh” Uzbek-Amerika Assotsiatsiyasi Batafsil"}',	'2025-12-23 06:07:24',	'2025-12-23 06:07:24'),
(69,	31,	30,	'Nomi',	'nomi-3',	'ru',	'{"title": null}',	'2025-12-23 06:07:24',	'2025-12-23 06:07:24'),
(70,	31,	30,	'Nomi',	'nomi-3',	NULL,	'{"date_at": "12/20/2018", "first_boss": "12/20/2019"}',	'2025-12-23 06:07:24',	'2025-12-23 06:07:24'),
(71,	32,	30,	'Rahbar',	'rahbar-3',	'uz',	'{"title": "Sadikov Baxodir Talibjonovich  Pittsburgdagi uzbeklar jamiyati rahbari"}',	'2025-12-23 06:08:35',	'2025-12-23 06:08:35'),
(72,	32,	30,	'Rahbar',	'rahbar-3',	'ru',	'{"title": null}',	'2025-12-23 06:08:35',	'2025-12-23 06:08:35'),
(73,	32,	30,	'Rahbar',	'rahbar-3',	NULL,	'{"email": "sanayev@vatandoshlarfondi.uz", "phone": "+998(55) 502-22-99"}',	'2025-12-23 06:08:35',	'2025-12-23 06:08:35'),
(95,	40,	NULL,	NULL,	NULL,	'uz',	'{"title": "O‘zbek tili, madaniyati va an’analarini saqlab qolish va rivojlantirish"}',	'2025-12-25 09:42:07',	'2025-12-25 09:42:36'),
(96,	40,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-25 09:42:07',	'2025-12-25 09:42:36'),
(97,	40,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-25 09:42:07',	'2025-12-25 09:42:36'),
(74,	33,	NULL,	NULL,	NULL,	'uz',	'{"title": "Tatariston Respublikasidagi “O‘zbekiston” o‘zbek milliy-madaniy avtonomiyasi"}',	'2025-12-23 06:21:44',	'2025-12-26 05:07:31'),
(75,	33,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-23 06:21:44',	'2025-12-26 05:07:31'),
(30,	14,	NULL,	NULL,	NULL,	'ru',	'{"title": null, "description": null}',	'2025-12-23 05:32:28',	'2025-12-26 05:17:05'),
(31,	14,	NULL,	NULL,	NULL,	NULL,	'{"email": "sattarov@vatandoshlarfondi.uz", "phone": "+998(55) 502-22-99"}',	'2025-12-23 05:32:28',	'2025-12-26 05:17:05'),
(32,	15,	NULL,	NULL,	NULL,	'uz',	'{"title": "Sanayev Bolidin Elamonovich", "description": "“Vatandoshlar” jamoat fondi Boshqaruv raisi o‘rinbosari"}',	'2025-12-23 05:33:13',	'2025-12-26 05:17:23'),
(33,	15,	NULL,	NULL,	NULL,	'ru',	'{"title": null, "description": null}',	'2025-12-23 05:33:13',	'2025-12-26 05:17:23'),
(34,	15,	NULL,	NULL,	NULL,	NULL,	'{"email": "sanayev@vatandoshlarfondi.uz", "phone": "+998(55) 502-22-99"}',	'2025-12-23 05:33:13',	'2025-12-26 05:17:23'),
(29,	14,	NULL,	NULL,	NULL,	'uz',	'{"title": "Sattarov Odiljon Berdimuratovich", "description": "“Vatandoshlar” jamoat fondi Boshqaruv raisi"}',	'2025-12-23 05:32:28',	'2025-12-26 05:17:05'),
(79,	35,	NULL,	NULL,	NULL,	'uz',	'{"description": "“Vatandoshlar” jamoat fondi 2021 yil 11 avgustda tashkil etilgan. Bizning asosiy maqsadimiz- xorijda istiqomat qilayotgan vatandoshlarni tarixiy Vatani atrofida yanada jipslashtirish, ularning qalbi va ongida yurt bilan faxrlanish tuyg‘usini yuksaltirish, milliy o‘zlikni saqlab qolish, vatandoshlar va ular tomonidan tuzilgan jamoat birlashmalarini qo‘llab-quvvatlash, turli sohalarda faoliyat yuritayotgan vatandoshlarimizning salohiyatini mamlakatimiz taraqqiyotiga samarali yo‘naltirishdir!"}',	'2025-12-25 08:29:18',	'2025-12-25 08:29:18'),
(80,	35,	NULL,	NULL,	NULL,	'ru',	'{"description": null}',	'2025-12-25 08:29:18',	'2025-12-25 08:29:18'),
(81,	35,	NULL,	NULL,	NULL,	'en',	'{"description": null}',	'2025-12-25 08:29:18',	'2025-12-25 08:29:18'),
(25,	12,	NULL,	NULL,	NULL,	'uz',	'{"title": "Fondning ramzi", "content": "<p><span>\"Vatandoshlar\" jamoat fondining ramzida asosan milliy qadriyatlarimizni anglatuvchi minoralar hamda tarixiy obidalarimizning naqshlarida aks etgan ko‘k rangdan foydalanilgan. Ko‘k rang – bu tinchlik va hotirjamlik ramzi bo‘lib, u yaxshilikni, donishmandlikni, halollikni va sadoqatni bildiradi. Markazda O‘zbekiston Respublikasining 30 yilligi munosabati bilan “Yangi O‘zbekiston” bog‘ida bunyod etilgan muhtasham obida “Mustaqillik monumenti” joy olgan. Obidaning eng yuqori qismida O‘zbekiston gerbidan ham o‘rin olgan “Humo qushi” tasvirlangan. Obidaning orqa tomonida globus tasviri tushirilgan bo‘lib, bu xorijda istiqomat qilayotgan vatandoshlar bilan ishlashni nazarda tutadi. Shuningdek, ramzda ochiq kaftlar keltirilgan bo‘lib, bu Fondning ochiqlik va qabul qilishlikni, halollik va samimiylikni, vatandoshlarni “Yangi O‘zbekiston” atrofida yanada jipslashishiga, ularga doimiy ravishda g‘amxo‘rlik qilishga ham tayyor ekanligini anglatadi.</span></p>", "description": "<div class=\"content__text\">\r\n<p>\"Vatandoshlar\" jamoat fondining ramzida asosan milliy qadriyatlarimizni anglatuvchi minoralar hamda tarixiy obidalarimizning naqshlarida aks etgan ko‘k rangdan foydalanilgan. Ko‘k rang – bu tinchlik va hotirjamlik ramzi bo‘lib, u yaxshilikni, donishmandlikni, halollikni va sadoqatni bildiradi. Markazda O‘zbekiston Respublikasining 30 yilligi munosabati bilan “Yangi O‘zbekiston” bog‘ida bunyod etilgan muhtasham obida “Mustaqillik monumenti” joy olgan. Obidaning eng yuqori qismida O‘zbekiston gerbidan ham o‘rin olgan “Humo qushi” tasvirlangan. Obidaning orqa tomonida globus tasviri tushirilgan bo‘lib, bu xorijda istiqomat qilayotgan vatandoshlar bilan ishlashni nazarda tutadi. Shuningdek, ramzda ochiq kaftlar keltirilgan bo‘lib, bu Fondning ochiqlik va qabul qilishlikni, halollik va samimiylikni, vatandoshlarni “Yangi O‘zbekiston” atrofida yanada jipslashishiga, ularga doimiy ravishda g‘amxo‘rlik qilishga ham tayyor ekanligini anglatadi.</p>\r\n</div>\r\n<div class=\"about__page\">\r\n<div class=\"about__page--img\"></div>\r\n</div>"}',	'2025-12-23 05:29:07',	'2025-12-25 08:31:46'),
(82,	12,	NULL,	NULL,	NULL,	'en',	'{"title": null, "content": null, "description": null}',	'2025-12-25 08:31:46',	'2025-12-25 08:31:46'),
(87,	37,	NULL,	NULL,	NULL,	'ru',	'{"url": null, "title": null, "content": null, "description": null}',	'2025-12-25 08:48:11',	'2025-12-26 07:02:06'),
(88,	37,	NULL,	NULL,	NULL,	'en',	'{"url": null, "title": null, "content": null, "description": null}',	'2025-12-25 08:48:11',	'2025-12-26 07:02:06'),
(93,	39,	NULL,	NULL,	NULL,	'ru',	'{"url": null, "title": null, "content": null, "description": null}',	'2025-12-25 08:50:21',	'2025-12-26 07:23:47'),
(90,	38,	NULL,	NULL,	NULL,	'ru',	'{"url": null, "title": null, "content": null, "description": null}',	'2025-12-25 08:48:32',	'2025-12-25 10:01:33'),
(91,	38,	NULL,	NULL,	NULL,	'en',	'{"url": null, "title": null, "content": null, "description": null}',	'2025-12-25 08:48:32',	'2025-12-25 10:01:33'),
(77,	34,	NULL,	NULL,	NULL,	'uz',	'{"title": "Yurtdoshlarni qollash"}',	'2025-12-23 06:22:39',	'2025-12-26 05:31:25'),
(78,	34,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-23 06:22:39',	'2025-12-26 05:31:25'),
(83,	36,	NULL,	NULL,	NULL,	'uz',	'{"url": null, "title": "Vatan", "content": null, "description": "“Vatandoshlar” jamoat fondi 2021 yil 11 avgustda tashkil etilgan. Bizning asosiy maqsadimiz- xorijda istiqomat qilayotgan vatandoshlarni tarixiy Vatani atrofida yanada jipslashtirish, ularning qalbi va ongida yurt bilan faxrlanish tuyg‘usini yuksaltirish, milliy o‘zlikni saqlab qolish, vatandoshlar va ular tomonidan tuzilgan jamoat birlashmalarini qo‘llab-quvvatlash, turli sohalarda faoliyat yuritayotgan vatandoshlarimizning salohiyatini mamlakatimiz taraqqiyotiga samarali yo‘naltirishdir!"}',	'2025-12-25 08:47:03',	'2025-12-26 06:30:55'),
(84,	36,	NULL,	NULL,	NULL,	'ru',	'{"url": null, "title": null, "content": null, "description": null}',	'2025-12-25 08:47:03',	'2025-12-26 06:30:55'),
(85,	36,	NULL,	NULL,	NULL,	'en',	'{"url": null, "title": null, "content": null, "description": null}',	'2025-12-25 08:47:03',	'2025-12-26 06:30:55'),
(98,	41,	NULL,	NULL,	NULL,	'uz',	'{"title": "Vatandosh kim?", "description": "O‘zbekiston hududidan tashqarida doimo istiqomat qiladigan yoki ta’lim olish, mehnat faoliyati bilan shug‘ullanish, oilaviy sabablar va boshqa sharoitlardan kelib chiqib, vaqtinchalik chet elda yurgan O‘zbekiston Respublikasi fuqarosi Xorijga chiqqan va chet el fuqaroligini olgan, Vataniga ma’naviy va madaniy nuqtai nazardan mansublikni his qilgan hamda O‘zbekiston Respublikasi bilan madaniy-gumanitar, ijtimoiy-iqtisodiy va boshqa aloqalarni rivojlantirishga harakat qilayotgan O‘zbekistondan chiqib ketgan shaxs va uning avlodi Etnik, til va madaniy-tarixiy nuqtai nazardan o‘zini o‘zbeklar yoki qoraqalpoqlar sifatida identifikatsiya qilgan hamda O‘zbekiston bilan har tomonlama aloqada bo‘lish xohishida bo‘lgan   xorijda istiqomat qilayotgan chet el fuqarolari va fuqaroligi bo‘lmagan shaxslar xorijda istiqomat  qilayotganlar."}',	'2025-12-25 09:49:29',	'2025-12-25 09:49:29'),
(99,	41,	NULL,	NULL,	NULL,	'ru',	'{"title": null, "description": null}',	'2025-12-25 09:49:29',	'2025-12-25 09:49:29'),
(100,	41,	NULL,	NULL,	NULL,	'en',	'{"title": null, "description": null}',	'2025-12-25 09:49:29',	'2025-12-25 09:49:29'),
(101,	42,	NULL,	NULL,	NULL,	'uz',	'{"title": "“Vatandoshlar” jamoat fondi qanday tashkilot ?", "description": "Lorem ipsum dolor sit amet consectetur adipisicing elit. Unde, impedit?"}',	'2025-12-25 09:50:10',	'2025-12-25 09:50:10'),
(102,	42,	NULL,	NULL,	NULL,	'ru',	'{"title": null, "description": null}',	'2025-12-25 09:50:10',	'2025-12-25 09:50:10'),
(103,	42,	NULL,	NULL,	NULL,	'en',	'{"title": null, "description": null}',	'2025-12-25 09:50:10',	'2025-12-25 09:50:10'),
(104,	43,	NULL,	NULL,	NULL,	'uz',	'{"title": "“Vatandoshlar” jamoat fondi pul mablag‘ini kimdan oladi?", "description": "Lorem ipsum dolor sit amet consectetur adipisicing elit. Unde, impedit?"}',	'2025-12-25 09:50:30',	'2025-12-25 09:50:30'),
(105,	43,	NULL,	NULL,	NULL,	'ru',	'{"title": null, "description": null}',	'2025-12-25 09:50:30',	'2025-12-25 09:50:30'),
(106,	43,	NULL,	NULL,	NULL,	'en',	'{"title": null, "description": null}',	'2025-12-25 09:50:30',	'2025-12-25 09:50:30'),
(120,	48,	NULL,	NULL,	NULL,	'uz',	'{"url": "https://www.youtube.com/", "title": "Forum va seminarlardan video"}',	'2025-12-25 13:22:39',	'2025-12-25 13:22:39'),
(121,	48,	NULL,	NULL,	NULL,	'ru',	'{"url": null, "title": null}',	'2025-12-25 13:22:39',	'2025-12-25 13:22:39'),
(89,	38,	NULL,	NULL,	NULL,	'uz',	'{"url": null, "title": "Fondning tashkil topishi haqida", "content": null, "description": "\"Vatandoshlar\" jamoat fondi 2021 yil 11 avgustda O‘zbekiston Respublikasi Prezidentining PQ-5220-sonli qarori bilan xorijiy davlatlardagi vatandoshlarimiz bilan doimiy va samarali aloqalar o‘rnatish va rivojlantirish hamda yagona Vatani atrofida jipslashtirish maqsadida tashkil etilgan.  \"Vatandoshlar\" jamoat fondining vasiylik kengashi Fondning oliy organi hisoblanadi. Vasiylik kengashi tomonidan shakllantiriladigan Fond Boshqaruvi — Fondning ijro organi hisoblananadi.  O‘zbekiston Respublikasi Oliy Majlisi huzuridagi Nodavlat notijorat tashkilotlarini va fuqarolik jamiyatining boshqa institutlarini qo‘llab -quvvatlash jamoat fondi mablag‘larini boshqarish bo‘yicha Parlament komissiyasiga har yili asoslangan buyurtmanoma asosida Fondning asosiy vazifalarini bajarish doirasidagi tadbirlarni tashkil etish va o‘tkazishni moliyalashtirish uchun subsidiya shaklida zarur mablag‘larni ajratadi."}',	'2025-12-25 08:48:32',	'2025-12-25 10:01:33'),
(138,	54,	NULL,	NULL,	NULL,	'uz',	'{"title": "Fotogalareya", "description": null}',	'2025-12-25 13:36:22',	'2025-12-25 13:36:22'),
(139,	54,	NULL,	NULL,	NULL,	'ru',	'{"title": null, "description": null}',	'2025-12-25 13:36:22',	'2025-12-25 13:36:22'),
(140,	54,	NULL,	NULL,	NULL,	'en',	'{"title": null, "description": null}',	'2025-12-25 13:36:22',	'2025-12-25 13:36:22'),
(141,	33,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-26 04:37:40',	'2025-12-26 05:07:31'),
(92,	39,	NULL,	NULL,	NULL,	'uz',	'{"url": null, "title": "Oliy maqsadimiz-xorijdagi vatandoshlarni Vatan atrofida birlashtirish, ularning qalbi va ongida yurtdan faxrlanish tuyg''usini yuksaltirish, milliy o''zlikni asrashdir!", "content": null, "description": null}',	'2025-12-25 08:50:21',	'2025-12-26 07:23:47'),
(122,	48,	NULL,	NULL,	NULL,	'en',	'{"url": null, "title": null}',	'2025-12-25 13:22:39',	'2025-12-25 13:22:39'),
(126,	50,	NULL,	NULL,	NULL,	'uz',	'{"title": "O‘zbekiston – sirli o‘tmish va yorqin kelajak maskani!", "description": "O‘zbekiston – tarix va zamonaviylik uyg‘unligi! Bu yerda har bir qadam o‘ziga xos kashfiyot. So‘nggi yillarda mamlakat turizm, iqtisodiyot va xizmat ko‘rsatish sohalarida yangi bosqichga ko‘tarilib, sayyohlar uchun yanada qulay va qiziqarli makonga aylandi. Samarqand, Buxoro, Xiva kabi shaharlar o‘zining qadimiy ruhi bilan, Toshkent esa zamonaviy tarovati bilan mehmonlarni o‘ziga jalb qiladi. Bu yerda qadimiylik va yangilik birlashadi, mehmondo‘stlik esa har yurakni zabt etadi. O‘zbekiston – bu nafaqat sayohat, balki ilhom, kashfiyot va unutilmas taassurotlar manzili. Bu mo‘jizaviy diyorga qadam qo‘ying va yuragingizni bu yerga abadiy bog‘lang!"}',	'2025-12-25 13:23:52',	'2025-12-25 13:23:52'),
(127,	50,	NULL,	NULL,	NULL,	'ru',	'{"title": null, "description": null}',	'2025-12-25 13:23:52',	'2025-12-25 13:23:52'),
(128,	50,	NULL,	NULL,	NULL,	'en',	'{"title": null, "description": null}',	'2025-12-25 13:23:52',	'2025-12-25 13:23:52'),
(129,	51,	NULL,	NULL,	NULL,	'uz',	'{"title": "Fotogalareya", "description": null}',	'2025-12-25 13:24:51',	'2025-12-25 13:24:51'),
(130,	51,	NULL,	NULL,	NULL,	'ru',	'{"title": null, "description": null}',	'2025-12-25 13:24:51',	'2025-12-25 13:24:51'),
(131,	51,	NULL,	NULL,	NULL,	'en',	'{"title": null, "description": null}',	'2025-12-25 13:24:51',	'2025-12-25 13:24:51'),
(119,	8,	NULL,	NULL,	NULL,	'en',	'{"title": null, "url_title": null, "description": null}',	'2025-12-25 10:18:34',	'2025-12-26 05:24:48'),
(136,	53,	NULL,	NULL,	NULL,	'ru',	'{"title": null, "description": null}',	'2025-12-25 13:35:56',	'2025-12-26 09:33:37'),
(137,	53,	NULL,	NULL,	NULL,	'en',	'{"title": null, "description": null}',	'2025-12-25 13:35:56',	'2025-12-26 09:33:37'),
(132,	52,	NULL,	NULL,	NULL,	'uz',	'{"title": "Forum va seminarlardan video"}',	'2025-12-25 13:32:21',	'2025-12-26 12:18:15'),
(133,	52,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-25 13:32:21',	'2025-12-26 12:18:15'),
(134,	52,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-25 13:32:21',	'2025-12-26 12:18:15'),
(76,	33,	NULL,	NULL,	NULL,	NULL,	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW", "description": "<h4 class=\"text-2\">Bugun Tatariston Respublikasidagi “O‘zbekiston” o‘zbek milliy-madaniy avtonomiyasi faoliyati haqida ma''lumot beramiz</h4>\r\n<div class=\"text-wrapper\">\r\n<p class=\"body2\">Mi tincidunt elit, id quisque ligula ac diam, amet. Vel etiam suspendisse morbi eleifend faucibus eget vestibulum felis. Dictum quis montes, sit sit. Tellus aliquam enim urna, etiam. Mauris posuere vulputate arcu amet, vitae nisi, tellus tincidunt. At feugiat sapien varius id.</p>\r\n<p>Eget quis mi enim, leo lacinia pharetra, semper. Eget in volutpat mollis at volutpat lectus velit, sed auctor. Porttitor fames arcu quis fusce augue enim. Quis at habitant diam at. Suscipit tristique risus, at donec. In turpis vel et quam imperdiet. Ipsum molestie aliquet sodales id est ac volutpat.</p>\r\n<p>Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla.</p>\r\n<p>Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus. Sed condimentum enim dignissim adipiscing faucibus consequat, urna. Viverra purus et erat auctor aliquam. Risus, volutpat vulputate posuere purus sit congue convallis aliquet. Arcu id augue ut feugiat donec porttitor neque. Mauris, neque ultricies eu vestibulum, bibendum quam lorem id. Dolor lacus, eget nunc lectus in tellus, pharetra, porttitor.</p>\r\n<p>Ipsum sit mattis nulla quam nulla. Gravida id gravida ac enim mauris id. Non pellentesque congue eget consectetur turpis. Sapien, dictum molestie sem tempor. Diam elit, orci, tincidunt aenean tempus. Quis velit eget ut tortor tellus. Sed vel, congue felis elit erat nam nibh orci.</p>\r\n</div>"}',	'2025-12-23 06:21:44',	'2025-12-26 05:07:31'),
(146,	14,	NULL,	NULL,	NULL,	'en',	'{"title": null, "description": null}',	'2025-12-26 05:14:06',	'2025-12-26 05:17:05'),
(147,	15,	NULL,	NULL,	NULL,	'en',	'{"title": null, "description": null}',	'2025-12-26 05:14:40',	'2025-12-26 05:17:23'),
(148,	8,	NULL,	NULL,	NULL,	NULL,	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW"}',	'2025-12-26 05:24:48',	'2025-12-26 05:24:48'),
(149,	9,	NULL,	NULL,	NULL,	'en',	'{"url": null, "title": null, "url_title": null, "description": null}',	'2025-12-26 05:28:45',	'2025-12-26 05:28:45'),
(145,	34,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-26 05:11:42',	'2025-12-26 05:31:25'),
(150,	34,	NULL,	NULL,	NULL,	NULL,	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW", "url_title": "Na''munali Yurtdoshlar"}',	'2025-12-26 05:31:25',	'2025-12-26 05:31:25'),
(86,	37,	NULL,	NULL,	NULL,	'uz',	'{"url": null, "title": "Fondning ramzi", "content": "\"Vatan asd asdoshlar\" jamoat fondining ramzida asosan milliy qadriyatlarimizni anglatuvchi minoralar hamda tarixiy obidalarimizning naqshlarida aks etgan ko‘k rangdan foydalanilgan. Ko‘k rang – bu tinchlik va hotirjamlik ramzi bo‘lib, u yaxshilikni, donishmandlikni, halollikni va sadoqatni bildiradi. Markazda O‘zbekiston Respublikasining 30 yilligi munosabati bilan “Yangi O‘zbekiston” bog‘ida bunyod etilgan muhtasham obida “Mustaqillik monumenti” joy olgan. Obidaning eng yuqori qismida O‘zbekiston gerbidan ham o‘rin olgan “Humo qushi” tasvirlangan. Obidaning orqa tomonida globus tasviri tushirilgan bo‘lib, bu xorijda istiqomat qilayotgan vatandoshlar bilan ishlashni nazarda tutadi. Shuningdek, ramzda ochiq kaftlar keltirilgan bo‘lib, bu Fondning ochiqlik va qabul qilishlikni, halollik va samimiylikni, vatandoshlarni “Yangi O‘zbekiston” atrofida yanada jipslashishiga, ularga doimiy ravishda g‘amxo‘rlik qilishga ham tayyor ekanligini anglatadi.", "description": "\"Vatandoshl asdasdas asds aar\" jamoat fondining ramzida asosan milliy qadriyatlarimizni anglatuvchi minoralar hamda tarixiy obidalarimizning naqshlarida aks etgan ko‘k rangdan foydalanilgan. Ko‘k rang – bu tinchlik va hotirjamlik ramzi bo‘lib, u yaxshilikni, donishmandlikni, halollikni va sadoqatni bildiradi. Markazda O‘zbekiston Respublikasining 30 yilligi munosabati bilan “Yangi O‘zbekiston” bog‘ida bunyod etilgan muhtasham obida “Mustaqillik monumenti” joy olgan. Obidaning eng yuqori qismida O‘zbekiston gerbidan ham o‘rin olgan “Humo qushi” tasvirlangan. Obidaning orqa tomonida globus tasviri tushirilgan bo‘lib, bu xorijda istiqomat qilayotgan vatandoshlar bilan ishlashni nazarda tutadi. Shuningdek, ramzda ochiq kaftlar keltirilgan bo‘lib, bu Fondning ochiqlik va qabul qilishlikni, halollik va samimiylikni, vatandoshlarni “Yangi O‘zbekiston” atrofida yanada jipslashishiga, ularga doimiy ravishda g‘amxo‘rlik qilishga ham tayyor ekanligini anglatadi."}',	'2025-12-25 08:48:11',	'2025-12-26 07:02:06'),
(151,	56,	NULL,	NULL,	NULL,	'uz',	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW", "title": "Video link", "content": null, "description": null}',	'2025-12-26 06:41:10',	'2025-12-26 07:18:44'),
(152,	56,	NULL,	NULL,	NULL,	'ru',	'{"url": null, "title": null, "content": null, "description": null}',	'2025-12-26 06:41:10',	'2025-12-26 07:18:44'),
(153,	56,	NULL,	NULL,	NULL,	'en',	'{"url": null, "title": null, "content": null, "description": null}',	'2025-12-26 06:41:10',	'2025-12-26 07:18:44'),
(135,	53,	NULL,	NULL,	NULL,	'uz',	'{"title": "O‘zbekiston – sirli o‘tmish va yorqin kelajak maskani!", "description": "O‘zbekiston – tarix va zamonaviylik uyg‘unligi! Bu yerda har bir qadam o‘ziga xos kashfiyot. So‘nggi yillarda mamlakat turizm, iqtisodiyot va xizmat ko‘rsatish sohalarida yangi bosqichga ko‘tarilib, sayyohlar uchun yanada qulay va qiziqarli makonga aylandi. Samarqand, Buxoro, Xiva kabi shaharlar o‘zining qadimiy ruhi bilan, Toshkent esa zamonaviy tarovati bilan mehmonlarni o‘ziga jalb qiladi. Bu yerda qadimiylik va yangilik birlashadi, mehmondo‘stlik esa har yurakni zabt etadi. O‘zbekiston – bu nafaqat sayohat, balki ilhom, kashfiyot va unutilmas taassurotlar manzili. Bu mo‘jizaviy diyorga qadam qo‘ying va yuragingizni bu yerga abadiy bog‘lang!"}',	'2025-12-25 13:35:56',	'2025-12-26 09:33:37'),
(157,	57,	NULL,	NULL,	NULL,	'uz',	'{"url_title": "Qo''llash"}',	'2025-12-26 11:29:45',	'2025-12-26 11:29:45'),
(158,	57,	NULL,	NULL,	NULL,	'ru',	'{"url_title": null}',	'2025-12-26 11:29:45',	'2025-12-26 11:29:45'),
(159,	57,	NULL,	NULL,	NULL,	'en',	'{"url_title": null}',	'2025-12-26 11:29:45',	'2025-12-26 11:29:45'),
(155,	57,	52,	'Url',	'url',	NULL,	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW"}',	'2025-12-26 11:10:22',	'2025-12-26 11:29:45'),
(160,	58,	NULL,	NULL,	NULL,	'uz',	'{"url_title": "Yurtdosh"}',	'2025-12-26 11:30:11',	'2025-12-26 11:30:11'),
(161,	58,	NULL,	NULL,	NULL,	'ru',	'{"url_title": null}',	'2025-12-26 11:30:11',	'2025-12-26 11:30:11'),
(162,	58,	NULL,	NULL,	NULL,	'en',	'{"url_title": null}',	'2025-12-26 11:30:11',	'2025-12-26 11:30:11'),
(156,	58,	52,	'Url',	'url',	NULL,	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW"}',	'2025-12-26 11:10:39',	'2025-12-26 11:30:11'),
(154,	52,	NULL,	NULL,	NULL,	NULL,	'{"url": null}',	'2025-12-26 11:06:46',	'2025-12-26 12:18:15');

DROP TABLE IF EXISTS "page_sections";
DROP SEQUENCE IF EXISTS page_sections_id_seq;
CREATE SEQUENCE page_sections_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."page_sections" (
    "id" bigint DEFAULT nextval('page_sections_id_seq') NOT NULL,
    "menu_main_id" bigint NOT NULL,
    "sort_order" integer DEFAULT '1' NOT NULL,
    "status" boolean DEFAULT true NOT NULL,
    "slug" character varying(255),
    "category" text,
    "category_slug" text,
    "parent_id" bigint,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "page_sections_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE INDEX page_sections_status_sort_order_menu_main_id_category_category_ ON public.page_sections USING btree (status, sort_order, menu_main_id, category, category_slug, parent_id);

INSERT INTO "page_sections" ("id", "menu_main_id", "sort_order", "status", "slug", "category", "category_slug", "parent_id", "created_at", "updated_at") VALUES
(1,	2,	1,	'1',	'vatandoshlar-jamoat-fondi',	NULL,	NULL,	NULL,	'2025-12-23 04:43:11',	'2025-12-23 04:43:11'),
(2,	3,	2,	'1',	'qatnashgan-vatandoshlar-soni',	NULL,	NULL,	NULL,	'2025-12-23 04:45:01',	'2025-12-23 04:45:01'),
(3,	3,	3,	'1',	'qatnashgan-vatandoshlar-soni-c',	NULL,	NULL,	NULL,	'2025-12-23 04:45:52',	'2025-12-23 04:45:52'),
(4,	4,	4,	'1',	'vatandoshlar-jamoat-fondiff',	NULL,	NULL,	NULL,	'2025-12-23 04:50:44',	'2025-12-23 04:50:44'),
(5,	11,	5,	'1',	'o-zbekiston-sirli-o-tmish-va-yorqin-kelajak-maskani',	NULL,	NULL,	NULL,	'2025-12-23 05:06:24',	'2025-12-23 05:06:24'),
(6,	12,	6,	'1',	'forum-va-seminarlardan-video',	NULL,	NULL,	NULL,	'2025-12-23 05:07:48',	'2025-12-23 05:07:48'),
(7,	12,	7,	'1',	'fotogalareya',	NULL,	NULL,	NULL,	'2025-12-23 05:08:27',	'2025-12-23 05:08:27'),
(8,	7,	8,	'1',	'qadriyatlarimiz-bizni-birlashtiradi',	NULL,	NULL,	NULL,	'2025-12-23 05:10:29',	'2025-12-23 05:10:29'),
(9,	9,	9,	'1',	'moziydan-saboq-bugundan-yuksalish',	NULL,	NULL,	NULL,	'2025-12-23 05:11:35',	'2025-12-23 05:11:35'),
(10,	10,	10,	'1',	'har-bir-manzil-yangi-bir-orzu',	NULL,	NULL,	NULL,	'2025-12-23 05:12:49',	'2025-12-23 05:12:49'),
(13,	19,	13,	'1',	'oliy-maqsadimiz-xorijdagi-vatandoshlarni-vatan-atrofida-birlashtirish-ularning-qalbi-va-ongida-yurtdan-faxrlanish-tuyg-usini-yuksaltirish-milliy-o-zlikni-asrashdir',	NULL,	NULL,	NULL,	'2025-12-23 05:30:06',	'2025-12-23 05:30:06'),
(16,	15,	16,	'1',	'jamoat-birlashmalari-bilan-hamkorlik-aloqalarini-yo-lga-qo-yish-va-rivojlantirish',	NULL,	NULL,	NULL,	'2025-12-23 05:34:07',	'2025-12-23 05:34:07'),
(17,	15,	17,	'1',	'vatandoshlarning-huquq-va-erkinliklarini-himoya-qilishga-ko-maklashish',	NULL,	NULL,	NULL,	'2025-12-23 05:34:27',	'2025-12-23 05:34:27'),
(18,	22,	18,	'1',	'',	NULL,	NULL,	NULL,	'2025-12-23 05:46:01',	'2025-12-23 05:46:01'),
(19,	23,	19,	'1',	'ozbekiston',	NULL,	NULL,	NULL,	'2025-12-23 05:47:39',	'2025-12-23 05:47:39'),
(20,	23,	20,	'1',	'buyuk-britaniya',	NULL,	NULL,	NULL,	'2025-12-23 05:48:00',	'2025-12-23 05:48:00'),
(21,	23,	21,	'1',	'pittsburgdagi-uzbeklar-jamiyati',	'tashkilot',	'tashkilot',	19,	'2025-12-23 05:54:00',	'2025-12-23 05:54:00'),
(22,	23,	22,	'1',	'pittsburgdagi-uzbeklar-jamiyatis',	'Nomi',	'nomi',	21,	'2025-12-23 05:55:39',	'2025-12-23 05:55:39'),
(23,	23,	23,	'1',	'sadikov-baxodir-talibjonovich-pittsburgdagi-uzbeklar-jamiyati-rahbari',	'Rahbar',	'rahbar',	21,	'2025-12-23 05:57:33',	'2025-12-23 05:57:33'),
(25,	23,	25,	'1',	'amerika-o-zbekiston-uyushmasidfs',	'Nomi',	'nomi-1',	24,	'2025-12-23 05:59:34',	'2025-12-23 05:59:34'),
(26,	23,	26,	'1',	'amerika-o-zbekiston-uyushma',	'Rahbar',	'rahbar-1',	24,	'2025-12-23 06:01:27',	'2025-12-23 06:01:27'),
(27,	23,	27,	'1',	'mahalla-usa-o-zbek-diasporal-tashkiloti',	'tashkilot',	'tashkilot-1',	20,	'2025-12-23 06:02:28',	'2025-12-23 06:02:28'),
(28,	23,	28,	'1',	'mahalla-usa-o-zbek-diasporal-tashkiloticbf',	'Nomi',	'nomi-2',	27,	'2025-12-23 06:03:58',	'2025-12-23 06:03:58'),
(29,	23,	29,	'1',	'sadikov-baxodir-talibjonovich-pittsburgdagi-uzbeklar-jamiyati-rahbariew',	'Rahbar',	'rahbar-2',	27,	'2025-12-23 06:05:38',	'2025-12-23 06:05:38'),
(30,	23,	30,	'1',	'yurtdosh-uzbek-amerika-assotsiatsiyasi',	'tashkilot',	'tashkilot-1',	20,	'2025-12-23 06:06:15',	'2025-12-23 06:06:15'),
(31,	23,	31,	'1',	'yurtdosh-uzbek-amerika-assotsiatsiyasi-batafsildd',	'Nomi',	'nomi-3',	30,	'2025-12-23 06:07:24',	'2025-12-23 06:07:24'),
(32,	23,	32,	'1',	'sadikov-baxodir-talibjonovich-pittsburgdagi-uzbeklar-jamiyati-rahbaricc',	'Rahbar',	'rahbar-3',	30,	'2025-12-23 06:08:35',	'2025-12-23 06:08:35'),
(33,	26,	33,	'1',	'tatariston-respublikasidagi-o-zbekiston-o-zbek-milliy-madaniy-avtonomiyasi',	NULL,	NULL,	NULL,	'2025-12-23 06:21:44',	'2025-12-23 06:21:44'),
(34,	27,	34,	'1',	'yurtdoshlarni-qollash',	NULL,	NULL,	NULL,	'2025-12-23 06:22:39',	'2025-12-23 06:22:39'),
(35,	17,	35,	'1',	'',	NULL,	NULL,	NULL,	'2025-12-25 08:29:18',	'2025-12-25 08:29:18'),
(12,	18,	12,	'1',	'fondning-ramzi',	NULL,	NULL,	NULL,	'2025-12-23 05:29:07',	'2025-12-25 08:31:46'),
(37,	24,	37,	'1',	'fondning-ramzid',	NULL,	NULL,	NULL,	'2025-12-25 08:48:11',	'2025-12-25 08:48:11'),
(40,	15,	40,	'1',	'o-zbek-tili-madaniyati-va-an-analarini-saqlab-qolish-va-rivojlantirish',	NULL,	NULL,	NULL,	'2025-12-25 09:42:07',	'2025-12-25 09:42:07'),
(41,	16,	41,	'1',	'vatandosh-kim',	NULL,	NULL,	NULL,	'2025-12-25 09:49:29',	'2025-12-25 09:49:29'),
(42,	16,	42,	'1',	'vatandoshlar-jamoat-fondi-qanday-tashkilot',	NULL,	NULL,	NULL,	'2025-12-25 09:50:10',	'2025-12-25 09:50:10'),
(43,	16,	43,	'1',	'vatandoshlar-jamoat-fondi-pul-mablag-ini-kimdan-oladi',	NULL,	NULL,	NULL,	'2025-12-25 09:50:30',	'2025-12-25 09:50:30'),
(48,	28,	48,	'1',	'forum-va-seminarlardan-csfdgrthfyj',	NULL,	NULL,	NULL,	'2025-12-25 13:22:39',	'2025-12-25 13:22:39'),
(50,	29,	50,	'1',	'o-zbekiston-sirli-o-tmish-va-yorqin-kelajak-maskanidfvhg',	NULL,	NULL,	NULL,	'2025-12-25 13:23:52',	'2025-12-25 13:23:52'),
(51,	29,	51,	'1',	'fotogalareyacdvfghjkl-xcdsgrtyu7io',	NULL,	NULL,	NULL,	'2025-12-25 13:24:51',	'2025-12-25 13:24:51'),
(52,	30,	52,	'1',	'forum-va-seminarlardan-videovv',	NULL,	NULL,	NULL,	'2025-12-25 13:32:21',	'2025-12-25 13:32:21'),
(53,	31,	53,	'1',	'o-zbekiston-sirli-o-tmish-va-yorqin-kelajak-maskanixzfbgnhmjkl',	NULL,	NULL,	NULL,	'2025-12-25 13:35:56',	'2025-12-25 13:35:56'),
(54,	31,	54,	'1',	'fotogalareya11',	NULL,	NULL,	NULL,	'2025-12-25 13:36:22',	'2025-12-25 13:36:22'),
(14,	14,	14,	'1',	'sattarov-odiljon-berdimuratovich',	NULL,	NULL,	NULL,	'2025-12-23 05:32:28',	'2025-12-26 05:17:05'),
(15,	14,	15,	'1',	'sanayev-bolidin-elamonovich',	NULL,	NULL,	NULL,	'2025-12-23 05:33:13',	'2025-12-26 05:17:23'),
(36,	24,	36,	'1',	'vatan',	NULL,	NULL,	NULL,	'2025-12-25 08:47:03',	'2025-12-26 06:30:55'),
(24,	23,	57,	'1',	'amerika-o-zbekiston-uyushmasi',	'tashkilot',	'tashkilot',	19,	'2025-12-23 05:58:12',	'2025-12-26 06:41:54'),
(56,	24,	38,	'1',	'video-link',	NULL,	NULL,	NULL,	'2025-12-26 06:41:10',	'2025-12-26 06:50:21'),
(38,	24,	39,	'1',	'fondning-tashkil-topishi-haqida',	NULL,	NULL,	NULL,	'2025-12-25 08:48:32',	'2025-12-26 06:52:14'),
(39,	24,	40,	'1',	'oliy-maqsadimiz-xorijdagi-vatandoshlarni-vatan-atrofida-birlashtirish-ularning-qalbi-va-ongida-yurtdan-faxrlanish-tuyg-usini-yuksaltirish-milliy-o-zlikni-asrashdirv',	NULL,	NULL,	NULL,	'2025-12-25 08:50:21',	'2025-12-26 06:52:21'),
(57,	30,	57,	'1',	'',	'Url',	'url',	52,	'2025-12-26 11:10:22',	'2025-12-26 11:10:22'),
(58,	30,	58,	'1',	'',	'Url',	'url',	52,	'2025-12-26 11:10:39',	'2025-12-26 11:10:39');

DROP TABLE IF EXISTS "password_reset_tokens";
CREATE TABLE "public"."password_reset_tokens" (
    "email" character varying(255) NOT NULL,
    "token" character varying(255) NOT NULL,
    "created_at" timestamp(0),
    CONSTRAINT "password_reset_tokens_pkey" PRIMARY KEY ("email")
)
WITH (oids = false);


DROP TABLE IF EXISTS "permissions";
DROP SEQUENCE IF EXISTS permissions_id_seq;
CREATE SEQUENCE permissions_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."permissions" (
    "id" bigint DEFAULT nextval('permissions_id_seq') NOT NULL,
    "name" character varying(255) NOT NULL,
    "sort_order" bigint DEFAULT '0' NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "permissions_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "permissions_name_check" CHECK (((name)::text = ANY ((ARRAY['given'::character varying, 'not_given'::character varying])::text[])))
)
WITH (oids = false);


DROP TABLE IF EXISTS "role_menu_permissions";
DROP SEQUENCE IF EXISTS role_menu_permissions_id_seq;
CREATE SEQUENCE role_menu_permissions_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."role_menu_permissions" (
    "id" bigint DEFAULT nextval('role_menu_permissions_id_seq') NOT NULL,
    "role_id" bigint NOT NULL,
    "menu_main_id" bigint NOT NULL,
    "permission_id" bigint NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "role_menu_permissions_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE INDEX role_menu_permissions_role_id_menu_main_id_permission_id_index ON public.role_menu_permissions USING btree (role_id, menu_main_id, permission_id);


DROP TABLE IF EXISTS "roles";
DROP SEQUENCE IF EXISTS roles_id_seq;
CREATE SEQUENCE roles_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."roles" (
    "id" bigint DEFAULT nextval('roles_id_seq') NOT NULL,
    "name" character varying(255) NOT NULL,
    "sort_order" bigint DEFAULT '0' NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "roles_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

INSERT INTO "roles" ("id", "name", "sort_order", "created_at", "updated_at") VALUES
(1,	'admin',	0,	NULL,	NULL),
(2,	'moderator',	0,	NULL,	NULL);

DROP TABLE IF EXISTS "sessions";
CREATE TABLE "public"."sessions" (
    "id" character varying(255) NOT NULL,
    "user_id" bigint,
    "ip_address" character varying(45),
    "user_agent" text,
    "payload" text NOT NULL,
    "last_activity" integer NOT NULL,
    CONSTRAINT "sessions_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);

INSERT INTO "sessions" ("id", "user_id", "ip_address", "user_agent", "payload", "last_activity") VALUES
('psV3vqoCciq4oB1htxjPUnplT1H9JpntQWoq50mg',	1,	'172.23.0.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36',	'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiQVVnSVhuR08wS0JMTnNSRTJoelFRQW5hSFp0M3M3VG5KZUUzeHBLSyI7czo2OiJsb2NhbGUiO3M6MjoidXoiO3M6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjExMToiaHR0cDovL2xvY2FsaG9zdDo4MDc4L3V6L3lhbmdpbGlrbGFyL3RhdGFyaXN0b24tcmVzcHVibGlrYXNpZGFnaS1vLXpiZWtpc3Rvbi1vLXpiZWstbWlsbGl5LW1hZGFuaXktYXZ0b25vbWl5YXNpIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjM6InVybCI7YToxOntzOjg6ImludGVuZGVkIjtzOjI3OiJodHRwOi8vbG9jYWxob3N0OjgwNzgvYWRtaW4iO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=',	1766753108);

DROP TABLE IF EXISTS "settings";
DROP SEQUENCE IF EXISTS settings_id_seq;
CREATE SEQUENCE settings_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."settings" (
    "id" bigint DEFAULT nextval('settings_id_seq') NOT NULL,
    "title" jsonb NOT NULL,
    "meta_description" jsonb,
    "meta_keywords" jsonb,
    "email" character varying(255),
    "status" boolean DEFAULT false NOT NULL,
    "main_page_id" bigint,
    "admin_ips" character varying(255),
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "settings_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

INSERT INTO "settings" ("id", "title", "meta_description", "meta_keywords", "email", "status", "main_page_id", "admin_ips", "created_at", "updated_at") VALUES
(1,	'{"ru": "ProEnd", "uz": "ProEnd"}',	'{"ru": "ProEnd", "uz": "ProEnd"}',	'{"ru": "ProEnd, ProEnd", "uz": "ProEnd, ProEnd"}',	NULL,	'1',	NULL,	NULL,	'2025-12-20 15:22:52',	'2025-12-20 15:23:27');

DROP TABLE IF EXISTS "socials";
DROP SEQUENCE IF EXISTS socials_id_seq;
CREATE SEQUENCE socials_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."socials" (
    "id" bigint DEFAULT nextval('socials_id_seq') NOT NULL,
    "name" character varying(255) NOT NULL,
    "icon" character varying(255),
    "url" character varying(255) NOT NULL,
    "key" character varying(255),
    "status" boolean DEFAULT true NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "socials_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);


DROP TABLE IF EXISTS "users";
DROP SEQUENCE IF EXISTS users_id_seq;
CREATE SEQUENCE users_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."users" (
    "id" bigint DEFAULT nextval('users_id_seq') NOT NULL,
    "name" character varying(255) NOT NULL,
    "username" character varying(255) NOT NULL,
    "status" boolean DEFAULT true NOT NULL,
    "password" character varying(255) NOT NULL,
    "role_id" bigint,
    "email" character varying(255),
    "email_verified_at" timestamp(0),
    "remember_token" character varying(100),
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE UNIQUE INDEX users_username_unique ON public.users USING btree (username);

INSERT INTO "users" ("id", "name", "username", "status", "password", "role_id", "email", "email_verified_at", "remember_token", "created_at", "updated_at") VALUES
(1,	'Admin',	'admin',	'1',	'$2y$12$IdkZ.NfglZq6MhMc5ZI2buef.eMXylpbETW9tRtKsK2g06N.URDP2',	1,	NULL,	NULL,	NULL,	NULL,	NULL),
(2,	'Moderator',	'moderator',	'1',	'$2y$12$6ZkAf8mM7gBLGpKS61RCku6S8hnXw3Sj5mcPzt5OTyHXM83QtD6C6',	2,	NULL,	NULL,	NULL,	NULL,	NULL),
(3,	'Editor',	'editor',	'0',	'$2y$12$xmCOMOGc46IeFlCVSHaM5ujFkUnN5VgiPhHgNkR8VR.IEWnIKEw4S',	2,	NULL,	NULL,	NULL,	NULL,	NULL);

ALTER TABLE ONLY "public"."content_images" ADD CONSTRAINT "content_images_content_id_foreign" FOREIGN KEY (content_id) REFERENCES contents(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."content_translations" ADD CONSTRAINT "content_translations_content_id_foreign" FOREIGN KEY (content_id) REFERENCES contents(id) ON DELETE CASCADE NOT DEFERRABLE;

ALTER TABLE ONLY "public"."contents" ADD CONSTRAINT "contents_parent_id_foreign" FOREIGN KEY (parent_id) REFERENCES contents(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."menu_main_images" ADD CONSTRAINT "menu_main_images_menu_main_id_foreign" FOREIGN KEY (menu_main_id) REFERENCES menu_mains(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."menu_main_translations" ADD CONSTRAINT "menu_main_translations_menu_main_id_foreign" FOREIGN KEY (menu_main_id) REFERENCES menu_mains(id) ON DELETE CASCADE NOT DEFERRABLE;

ALTER TABLE ONLY "public"."menu_mains" ADD CONSTRAINT "menu_mains_parent_id_foreign" FOREIGN KEY (parent_id) REFERENCES menu_mains(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."role_menu_permissions" ADD CONSTRAINT "role_menu_permissions_menu_main_id_foreign" FOREIGN KEY (menu_main_id) REFERENCES menu_mains(id) ON DELETE CASCADE NOT DEFERRABLE;
ALTER TABLE ONLY "public"."role_menu_permissions" ADD CONSTRAINT "role_menu_permissions_permission_id_foreign" FOREIGN KEY (permission_id) REFERENCES permissions(id) ON DELETE CASCADE NOT DEFERRABLE;
ALTER TABLE ONLY "public"."role_menu_permissions" ADD CONSTRAINT "role_menu_permissions_role_id_foreign" FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE CASCADE NOT DEFERRABLE;

-- 2025-12-26 12:50:49 UTC

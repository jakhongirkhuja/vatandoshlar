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
('laravel-cache-captcha_d28bd08650a62e31027b69becd7f6049',	'a:4:{i:0;s:1:"d";i:1;s:1:"5";i:2;s:1:"d";i:3;s:1:"6";}',	1766667713),
('laravel-cache-captcha_18711efaa24a3f6ec8b2045b197c2190',	'a:4:{i:0;s:1:"m";i:1;s:1:"k";i:2;s:1:"e";i:3;s:1:"s";}',	1766862139),
('laravel-cache-captcha_e0d837b543bbfbd2f93f487297b368ea',	'a:4:{i:0;s:1:"v";i:1;s:1:"g";i:2;s:1:"i";i:3;s:1:"0";}',	1767136419);

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

INSERT INTO "content_translations" ("id", "content_id", "locale", "data", "created_at", "updated_at") VALUES
(1,	1,	'uz',	'{"title": "Yangiliklar"}',	'2025-12-29 11:28:37',	'2025-12-29 11:28:37'),
(2,	1,	'ru',	'{"title": "Новости"}',	'2025-12-29 11:28:37',	'2025-12-29 11:28:37'),
(3,	1,	'en',	'{"title": "News"}',	'2025-12-29 11:28:37',	'2025-12-29 11:28:37'),
(4,	1,	NULL,	'{"key": "news"}',	'2025-12-29 11:28:37',	'2025-12-29 11:28:37'),
(5,	2,	'uz',	'{"title": "Telefon raqam"}',	'2025-12-29 11:34:12',	'2025-12-29 11:34:12'),
(6,	2,	'ru',	'{"title": "Номер телефона"}',	'2025-12-29 11:34:12',	'2025-12-29 11:34:12'),
(7,	2,	'en',	'{"title": "Phone number"}',	'2025-12-29 11:34:12',	'2025-12-29 11:34:12'),
(8,	2,	NULL,	'{"key": "phone"}',	'2025-12-29 11:34:12',	'2025-12-29 11:34:12'),
(9,	3,	'uz',	'{"title": "Elektron pochta"}',	'2025-12-29 11:34:55',	'2025-12-29 11:34:55'),
(10,	3,	'ru',	'{"title": "Электрон поста"}',	'2025-12-29 11:34:55',	'2025-12-29 11:34:55'),
(11,	3,	'en',	'{"title": "Email"}',	'2025-12-29 11:34:55',	'2025-12-29 11:34:55'),
(12,	3,	NULL,	'{"key": "email"}',	'2025-12-29 11:34:55',	'2025-12-29 11:34:55'),
(17,	5,	'uz',	'{"title": "O''zbekiston Respublikasi Prezidenti Administratsiyasi huzuridagi ta''lim sifatini ta''minlash milliy agentligi"}',	'2025-12-29 11:37:26',	'2025-12-29 11:37:26'),
(18,	5,	'ru',	'{"title": "Национальное агентство по обеспечению качества образования при Администрации Президента Республики Узбекистан"}',	'2025-12-29 11:37:26',	'2025-12-29 11:37:26'),
(19,	5,	'en',	'{"title": "National Agency for Quality Assurance in Education under the Administration of the President of the Republic of Uzbekistan"}',	'2025-12-29 11:37:26',	'2025-12-29 11:37:26'),
(20,	5,	NULL,	'{"key": "agency"}',	'2025-12-29 11:37:26',	'2025-12-29 11:37:26'),
(13,	4,	'uz',	'{"title": "Manzil"}',	'2025-12-29 11:36:08',	'2025-12-29 11:45:16'),
(14,	4,	'ru',	'{"title": "Адрес"}',	'2025-12-29 11:36:08',	'2025-12-29 11:45:16'),
(15,	4,	'en',	'{"title": "Address"}',	'2025-12-29 11:36:08',	'2025-12-29 11:45:16'),
(16,	4,	NULL,	'{"key": "address"}',	'2025-12-29 11:36:08',	'2025-12-29 11:45:16'),
(21,	6,	'uz',	'{"title": "Forum va seminarlardan video"}',	'2025-12-29 13:28:11',	'2025-12-29 13:28:11'),
(22,	6,	'ru',	'{"title": null}',	'2025-12-29 13:28:11',	'2025-12-29 13:28:11'),
(23,	6,	'en',	'{"title": null}',	'2025-12-29 13:28:11',	'2025-12-29 13:28:11'),
(24,	6,	NULL,	'{"key": "forum"}',	'2025-12-29 13:28:11',	'2025-12-29 13:28:11');

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

INSERT INTO "contents" ("id", "type", "slug", "url", "test", "show_admin", "sort_order", "icon", "status", "parent_id", "created_at", "updated_at") VALUES
(1,	'category',	NULL,	NULL,	'0',	'1',	1,	NULL,	'1',	NULL,	'2025-12-29 11:28:37',	'2025-12-29 11:28:37'),
(2,	'category',	NULL,	NULL,	'0',	'1',	1,	NULL,	'1',	NULL,	'2025-12-29 11:34:12',	'2025-12-29 11:34:12'),
(3,	'category',	NULL,	NULL,	'0',	'1',	1,	NULL,	'1',	NULL,	'2025-12-29 11:34:55',	'2025-12-29 11:34:55'),
(4,	'category',	NULL,	NULL,	'0',	'1',	1,	NULL,	'1',	NULL,	'2025-12-29 11:36:08',	'2025-12-29 11:36:08'),
(5,	'category',	NULL,	NULL,	'0',	'1',	1,	NULL,	'1',	NULL,	'2025-12-29 11:37:26',	'2025-12-29 11:37:26'),
(6,	'category',	NULL,	NULL,	'0',	'1',	1,	NULL,	'1',	NULL,	'2025-12-29 13:28:11',	'2025-12-29 13:28:11');

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
(2,	'description',	'Description',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	NULL,	NULL),
(3,	'info',	'Info',	'textarea-editor',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-30 06:09:52',	'2025-12-30 06:09:52');

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
(84,	37,	'uz',	'{"title": "Loyihalar", "description": null}',	'2025-12-29 11:46:30',	'2025-12-29 11:46:30'),
(85,	37,	'ru',	'{"title": null, "description": null}',	'2025-12-29 11:46:30',	'2025-12-29 11:46:30'),
(78,	35,	'uz',	'{"title": "Video", "description": null}',	'2025-12-27 18:31:23',	'2025-12-27 18:31:23'),
(68,	8,	'en',	'{"title": null, "description": null}',	'2025-12-26 05:32:09',	'2025-12-26 06:45:53'),
(65,	31,	'uz',	'{"title": "Form", "description": null}',	'2025-12-25 13:31:05',	'2025-12-26 11:05:40'),
(9,	5,	'uz',	'{"title": "Ozbekiston", "description": null}',	'2025-12-23 04:51:35',	'2025-12-25 12:15:37'),
(10,	5,	'ru',	'{"title": null, "description": null}',	'2025-12-23 04:51:35',	'2025-12-25 12:15:37'),
(55,	5,	'en',	'{"title": null, "description": null}',	'2025-12-25 12:13:52',	'2025-12-25 12:15:37'),
(66,	31,	'ru',	'{"title": null, "description": null}',	'2025-12-25 13:31:05',	'2025-12-26 11:05:40'),
(67,	31,	'en',	'{"title": null, "description": null}',	'2025-12-25 13:31:05',	'2025-12-26 11:05:40'),
(69,	32,	'uz',	'{"title": "Forms", "description": null}',	'2025-12-26 13:13:22',	'2025-12-26 13:13:22'),
(79,	35,	'ru',	'{"title": null, "description": null}',	'2025-12-27 18:31:23',	'2025-12-27 18:31:23'),
(80,	35,	'en',	'{"title": null, "description": null}',	'2025-12-27 18:31:23',	'2025-12-27 18:31:23'),
(81,	36,	'uz',	'{"title": "Asosiy", "description": null}',	'2025-12-29 09:58:34',	'2025-12-29 09:58:34'),
(70,	32,	'ru',	'{"title": null, "description": null}',	'2025-12-26 13:13:22',	'2025-12-26 13:13:22'),
(71,	32,	'en',	'{"title": null, "description": null}',	'2025-12-26 13:13:22',	'2025-12-26 13:13:22'),
(72,	33,	'uz',	'{"title": "Locations", "description": null}',	'2025-12-26 13:17:17',	'2025-12-26 13:17:17'),
(73,	33,	'ru',	'{"title": null, "description": null}',	'2025-12-26 13:17:17',	'2025-12-26 13:17:17'),
(74,	33,	'en',	'{"title": null, "description": null}',	'2025-12-26 13:17:17',	'2025-12-26 13:17:17'),
(86,	37,	'en',	'{"title": null, "description": null}',	'2025-12-29 11:46:30',	'2025-12-29 11:46:30'),
(82,	36,	'ru',	'{"title": null, "description": null}',	'2025-12-29 09:58:34',	'2025-12-29 09:58:34'),
(83,	36,	'en',	'{"title": null, "description": null}',	'2025-12-29 09:58:34',	'2025-12-29 09:58:34'),
(87,	38,	'uz',	'{"title": "Barcha Loyihalar", "description": null}',	'2025-12-29 11:47:01',	'2025-12-29 11:47:16'),
(88,	38,	'ru',	'{"title": null, "description": null}',	'2025-12-29 11:47:01',	'2025-12-29 11:47:16'),
(89,	38,	'en',	'{"title": null, "description": null}',	'2025-12-29 11:47:01',	'2025-12-29 11:47:16'),
(2,	1,	'ru',	'{"info": null, "title": null, "description": null}',	'2025-12-23 04:24:05',	'2025-12-30 06:13:41'),
(1,	1,	'uz',	'{"info": "<p>hjjkhjkhkjhkjhjkl</p><p><br></p><p><iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/FzvmmnAyKH4?si=zdJtHSL8TNpSXyhn\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen=\"\"></iframe></p>", "title": "Asosiy menu", "description": null}',	'2025-12-23 04:24:05',	'2025-12-30 06:13:41'),
(99,	1,	'en',	'{"info": null, "title": null, "description": null}',	'2025-12-30 06:13:41',	'2025-12-30 06:13:41'),
(106,	44,	'uz',	'{"info": null, "title": "Bog''lanish", "description": null}',	'2025-12-30 23:27:51',	'2025-12-30 23:27:51'),
(107,	44,	'ru',	'{"info": null, "title": null, "description": null}',	'2025-12-30 23:27:51',	'2025-12-30 23:27:51'),
(108,	44,	'en',	'{"info": null, "title": null, "description": null}',	'2025-12-30 23:27:51',	'2025-12-30 23:27:51');

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
(13,	'category',	'biz-haqimizda',	NULL,	'0',	'1',	4,	NULL,	'1',	NULL,	'2025-12-23 05:13:24',	'2025-12-30 05:59:53'),
(2,	'section',	'vatandoshlar',	NULL,	'0',	'1',	2,	NULL,	'1',	1,	'2025-12-23 04:24:41',	'2025-12-23 04:24:41'),
(3,	'section',	'statistika',	NULL,	'0',	'1',	3,	NULL,	'1',	1,	'2025-12-23 04:25:08',	'2025-12-23 04:25:08'),
(4,	'section',	'jamoat-fondi',	NULL,	'0',	'1',	4,	NULL,	'1',	1,	'2025-12-23 04:25:44',	'2025-12-23 04:25:44'),
(14,	'page',	'rahbariyat',	NULL,	'0',	'1',	14,	NULL,	'1',	13,	'2025-12-23 05:13:48',	'2025-12-23 05:13:48'),
(15,	'page',	'fondning-asosiy-yo-nalishlari-',	NULL,	'0',	'1',	15,	NULL,	'1',	13,	'2025-12-23 05:14:17',	'2025-12-23 05:14:17'),
(16,	'page',	'faq',	NULL,	'0',	'1',	16,	NULL,	'1',	13,	'2025-12-23 05:14:52',	'2025-12-23 05:14:52'),
(21,	'page',	'jamoat-birlashmalari',	NULL,	'0',	'1',	21,	NULL,	'1',	20,	'2025-12-23 05:36:49',	'2025-12-23 05:36:49'),
(22,	'section',	'sarlavha',	NULL,	'0',	'1',	22,	NULL,	'1',	21,	'2025-12-23 05:38:42',	'2025-12-23 05:38:42'),
(23,	'section',	'tanlov',	NULL,	'0',	'1',	23,	NULL,	'1',	21,	'2025-12-23 05:39:07',	'2025-12-23 05:39:07'),
(32,	'section',	'forms',	NULL,	'0',	'1',	32,	NULL,	'1',	10,	'2025-12-26 13:13:22',	'2025-12-26 13:13:22'),
(33,	'section',	'locations',	NULL,	'0',	'1',	33,	NULL,	'1',	10,	'2025-12-26 13:17:17',	'2025-12-26 13:17:17'),
(26,	'page',	'yangiliklar',	NULL,	'0',	'1',	26,	NULL,	'1',	25,	'2025-12-23 06:18:44',	'2025-12-23 06:18:44'),
(27,	'page',	'mediateka',	NULL,	'0',	'1',	27,	NULL,	'1',	25,	'2025-12-23 06:19:02',	'2025-12-23 06:19:02'),
(24,	'page',	'biz_haqimizda_uchun',	NULL,	'0',	'1',	14,	NULL,	'1',	13,	'2025-12-23 05:42:34',	'2025-12-25 08:44:16'),
(30,	'section',	'url',	NULL,	'0',	'1',	30,	NULL,	'1',	6,	'2025-12-25 13:30:47',	'2025-12-25 13:30:47'),
(31,	'section',	'sarlavhass',	NULL,	'0',	'1',	31,	NULL,	'1',	6,	'2025-12-25 13:31:05',	'2025-12-25 13:34:53'),
(37,	'category',	'loyihalar',	NULL,	'0',	'1',	5,	NULL,	'1',	NULL,	'2025-12-29 11:46:30',	'2025-12-30 05:59:53'),
(35,	'section',	'video',	NULL,	'0',	'1',	35,	NULL,	'1',	1,	'2025-12-27 18:31:23',	'2025-12-27 18:31:23'),
(36,	'section',	'asosiy-',	NULL,	'0',	'1',	36,	NULL,	'1',	1,	'2025-12-29 09:58:34',	'2025-12-29 09:58:34'),
(38,	'page',	'barcha-loyihalar',	NULL,	'0',	'1',	38,	NULL,	'1',	37,	'2025-12-29 11:47:01',	'2025-12-29 11:47:16'),
(25,	'category',	'axborot-xizmatlari',	NULL,	'0',	'1',	6,	NULL,	'1',	NULL,	'2025-12-23 06:18:25',	'2025-12-30 05:59:53'),
(1,	'category',	'asosiy-menu',	NULL,	'0',	'1',	1,	NULL,	'0',	NULL,	'2025-12-23 04:24:05',	'2025-12-30 05:59:53'),
(5,	'category',	'ozbekiston',	NULL,	'0',	'1',	2,	NULL,	'1',	NULL,	'2025-12-23 04:51:35',	'2025-12-30 05:59:53'),
(20,	'page',	'birlashmalar',	NULL,	'0',	'1',	3,	NULL,	'1',	NULL,	'2025-12-23 05:36:31',	'2025-12-30 05:59:53'),
(6,	'page',	'bosh-sahifa',	NULL,	'0',	'1',	1,	NULL,	'1',	5,	'2025-12-23 04:52:02',	'2025-12-30 08:07:40'),
(7,	'page',	'qadriyatlar',	NULL,	'0',	'1',	2,	NULL,	'1',	5,	'2025-12-23 04:52:36',	'2025-12-30 08:07:40'),
(8,	'url',	'3d-sayohat',	'https://www.kj',	'0',	'0',	3,	NULL,	'0',	5,	'2025-12-23 04:53:12',	'2025-12-30 08:07:40'),
(9,	'page',	'moziy-va-bugun',	NULL,	'0',	'1',	4,	NULL,	'1',	5,	'2025-12-23 04:55:51',	'2025-12-30 08:07:40'),
(10,	'page',	'manzilgohlar',	NULL,	'0',	'1',	5,	NULL,	'1',	5,	'2025-12-23 04:56:55',	'2025-12-30 08:07:40'),
(44,	'section',	'contacts',	NULL,	'0',	'1',	44,	NULL,	'1',	1,	'2025-12-30 23:27:51',	'2025-12-30 23:27:51');

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
(22,	'2025_12_16_175011_create_content_images_table',	1),
(23,	'2025_12_30_094546_create_supports_table',	2);

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
(24,	27,	20,	'tashkilot',	'tashkilot-1',	'page_section_images/1766469748_association-3.png',	NULL,	'image/png',	11024,	'1',	'1',	'2025-12-23 06:02:28',	'2025-12-23 06:02:28'),
(25,	30,	20,	'tashkilot',	'tashkilot-1',	'page_section_images/1766469975_association-4.png',	NULL,	'image/png',	5583,	'1',	'1',	'2025-12-23 06:06:15',	'2025-12-23 06:06:15'),
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
(89,	60,	NULL,	NULL,	NULL,	'page_section_images/1766756303_c1a4917b58c218386f15744094c20059373d611d-min.png',	NULL,	'image/png',	895781,	'0',	'1',	'2025-12-26 13:38:23',	'2025-12-26 13:38:23'),
(90,	60,	NULL,	NULL,	NULL,	'page_section_images/1766756303_form.jpg',	NULL,	'image/jpeg',	192942,	'0',	'1',	'2025-12-26 13:38:23',	'2025-12-26 13:38:23'),
(91,	60,	NULL,	NULL,	NULL,	'page_section_images/1766756303_oila1.jpg',	NULL,	'image/jpeg',	1739467,	'0',	'1',	'2025-12-26 13:38:23',	'2025-12-26 13:38:23'),
(92,	61,	NULL,	NULL,	NULL,	'page_section_images/1766756347_c1a4917b58c218386f15744094c20059373d611d-min.png',	NULL,	'image/png',	895781,	'0',	'1',	'2025-12-26 13:39:07',	'2025-12-26 13:39:07'),
(93,	61,	NULL,	NULL,	NULL,	'page_section_images/1766756347_form.jpg',	NULL,	'image/jpeg',	192942,	'0',	'1',	'2025-12-26 13:39:07',	'2025-12-26 13:39:07'),
(94,	61,	NULL,	NULL,	NULL,	'page_section_images/1766756347_oila1.jpg',	NULL,	'image/jpeg',	1739467,	'0',	'1',	'2025-12-26 13:39:07',	'2025-12-26 13:39:07'),
(95,	62,	NULL,	NULL,	NULL,	'page_section_images/1766756680_c1a4917b58c218386f15744094c20059373d611d-min.png',	NULL,	'image/png',	895781,	'0',	'1',	'2025-12-26 13:44:40',	'2025-12-26 13:44:40'),
(96,	62,	NULL,	NULL,	NULL,	'page_section_images/1766756680_form.jpg',	NULL,	'image/jpeg',	192942,	'0',	'1',	'2025-12-26 13:44:40',	'2025-12-26 13:44:40'),
(97,	62,	NULL,	NULL,	NULL,	'page_section_images/1766756680_oila1.jpg',	NULL,	'image/jpeg',	1739467,	'0',	'1',	'2025-12-26 13:44:40',	'2025-12-26 13:44:40'),
(98,	63,	NULL,	NULL,	NULL,	'page_section_images/1766756734_c1a4917b58c218386f15744094c20059373d611d-min.png',	NULL,	'image/png',	895781,	'0',	'1',	'2025-12-26 13:45:34',	'2025-12-26 13:45:34'),
(99,	63,	NULL,	NULL,	NULL,	'page_section_images/1766756734_form.jpg',	NULL,	'image/jpeg',	192942,	'0',	'1',	'2025-12-26 13:45:34',	'2025-12-26 13:45:34'),
(100,	63,	NULL,	NULL,	NULL,	'page_section_images/1766756734_oila1.jpg',	NULL,	'image/jpeg',	1739467,	'0',	'1',	'2025-12-26 13:45:34',	'2025-12-26 13:45:34'),
(101,	64,	NULL,	NULL,	NULL,	'page_section_images/1766756794_c1a4917b58c218386f15744094c20059373d611d-min.png',	NULL,	'image/png',	895781,	'0',	'1',	'2025-12-26 13:46:35',	'2025-12-26 13:46:35'),
(102,	64,	NULL,	NULL,	NULL,	'page_section_images/1766756795_form.jpg',	NULL,	'image/jpeg',	192942,	'0',	'1',	'2025-12-26 13:46:35',	'2025-12-26 13:46:35'),
(103,	64,	NULL,	NULL,	NULL,	'page_section_images/1766756795_oila1.jpg',	NULL,	'image/jpeg',	1739467,	'0',	'1',	'2025-12-26 13:46:35',	'2025-12-26 13:46:35'),
(107,	66,	NULL,	NULL,	NULL,	'page_section_images/1766756853_c1a4917b58c218386f15744094c20059373d611d-min.png',	NULL,	'image/png',	895781,	'0',	'1',	'2025-12-26 13:47:33',	'2025-12-26 13:47:33'),
(108,	66,	NULL,	NULL,	NULL,	'page_section_images/1766756853_form.jpg',	NULL,	'image/jpeg',	192942,	'0',	'1',	'2025-12-26 13:47:33',	'2025-12-26 13:47:33'),
(109,	66,	NULL,	NULL,	NULL,	'page_section_images/1766756853_oila1.jpg',	NULL,	'image/jpeg',	1739467,	'0',	'1',	'2025-12-26 13:47:33',	'2025-12-26 13:47:33'),
(110,	67,	NULL,	NULL,	NULL,	'page_section_images/1766756912_c1a4917b58c218386f15744094c20059373d611d-min.png',	NULL,	'image/png',	895781,	'0',	'1',	'2025-12-26 13:48:32',	'2025-12-26 13:48:32'),
(111,	67,	NULL,	NULL,	NULL,	'page_section_images/1766756912_form.jpg',	NULL,	'image/jpeg',	192942,	'0',	'1',	'2025-12-26 13:48:32',	'2025-12-26 13:48:32'),
(112,	67,	NULL,	NULL,	NULL,	'page_section_images/1766756912_oila1.jpg',	NULL,	'image/jpeg',	1739467,	'0',	'1',	'2025-12-26 13:48:32',	'2025-12-26 13:48:32'),
(113,	68,	NULL,	NULL,	NULL,	'page_section_images/1766756969_c1a4917b58c218386f15744094c20059373d611d-min.png',	NULL,	'image/png',	895781,	'0',	'1',	'2025-12-26 13:49:30',	'2025-12-26 13:49:30'),
(114,	68,	NULL,	NULL,	NULL,	'page_section_images/1766756970_form.jpg',	NULL,	'image/jpeg',	192942,	'0',	'1',	'2025-12-26 13:49:30',	'2025-12-26 13:49:30'),
(115,	68,	NULL,	NULL,	NULL,	'page_section_images/1766756970_oila1.jpg',	NULL,	'image/jpeg',	1739467,	'0',	'1',	'2025-12-26 13:49:30',	'2025-12-26 13:49:30'),
(116,	69,	NULL,	NULL,	NULL,	'page_section_images/1766757029_c1a4917b58c218386f15744094c20059373d611d-min.png',	NULL,	'image/png',	895781,	'0',	'1',	'2025-12-26 13:50:29',	'2025-12-26 13:50:29'),
(117,	69,	NULL,	NULL,	NULL,	'page_section_images/1766757029_form.jpg',	NULL,	'image/jpeg',	192942,	'0',	'1',	'2025-12-26 13:50:29',	'2025-12-26 13:50:29'),
(118,	69,	NULL,	NULL,	NULL,	'page_section_images/1766757029_oila1.jpg',	NULL,	'image/jpeg',	1739467,	'0',	'1',	'2025-12-26 13:50:29',	'2025-12-26 13:50:29'),
(119,	70,	NULL,	NULL,	NULL,	'page_section_images/1766757069_c1a4917b58c218386f15744094c20059373d611d-min.png',	NULL,	'image/png',	895781,	'0',	'1',	'2025-12-26 13:51:10',	'2025-12-26 13:51:10'),
(120,	70,	NULL,	NULL,	NULL,	'page_section_images/1766757070_form.jpg',	NULL,	'image/jpeg',	192942,	'0',	'1',	'2025-12-26 13:51:10',	'2025-12-26 13:51:10'),
(121,	70,	NULL,	NULL,	NULL,	'page_section_images/1766757070_oila1.jpg',	NULL,	'image/jpeg',	1739467,	'0',	'1',	'2025-12-26 13:51:10',	'2025-12-26 13:51:10'),
(122,	71,	NULL,	NULL,	NULL,	'page_section_images/1766757113_c1a4917b58c218386f15744094c20059373d611d-min.png',	NULL,	'image/png',	895781,	'0',	'1',	'2025-12-26 13:51:53',	'2025-12-26 13:51:53'),
(123,	71,	NULL,	NULL,	NULL,	'page_section_images/1766757113_form.jpg',	NULL,	'image/jpeg',	192942,	'0',	'1',	'2025-12-26 13:51:53',	'2025-12-26 13:51:53'),
(124,	71,	NULL,	NULL,	NULL,	'page_section_images/1766757113_oila1.jpg',	NULL,	'image/jpeg',	1739467,	'0',	'1',	'2025-12-26 13:51:53',	'2025-12-26 13:51:53'),
(125,	72,	NULL,	NULL,	NULL,	'page_section_images/1766757172_c1a4917b58c218386f15744094c20059373d611d-min.png',	NULL,	'image/png',	895781,	'0',	'1',	'2025-12-26 13:52:52',	'2025-12-26 13:52:52'),
(126,	72,	NULL,	NULL,	NULL,	'page_section_images/1766757172_form.jpg',	NULL,	'image/jpeg',	192942,	'0',	'1',	'2025-12-26 13:52:53',	'2025-12-26 13:52:53'),
(127,	72,	NULL,	NULL,	NULL,	'page_section_images/1766757173_oila1.jpg',	NULL,	'image/jpeg',	1739467,	'0',	'1',	'2025-12-26 13:52:53',	'2025-12-26 13:52:53'),
(128,	73,	NULL,	NULL,	NULL,	'page_section_images/1766757215_c1a4917b58c218386f15744094c20059373d611d-min.png',	NULL,	'image/png',	895781,	'0',	'1',	'2025-12-26 13:53:35',	'2025-12-26 13:53:35'),
(129,	73,	NULL,	NULL,	NULL,	'page_section_images/1766757215_form.jpg',	NULL,	'image/jpeg',	192942,	'0',	'1',	'2025-12-26 13:53:35',	'2025-12-26 13:53:35'),
(130,	73,	NULL,	NULL,	NULL,	'page_section_images/1766757215_oila1.jpg',	NULL,	'image/jpeg',	1739467,	'0',	'1',	'2025-12-26 13:53:35',	'2025-12-26 13:53:35'),
(131,	74,	60,	'video',	'video',	'page_section_images/1766757358_c1a4917b58c218386f15744094c20059373d611d-min.png',	NULL,	'image/png',	895781,	'1',	'1',	'2025-12-26 13:55:58',	'2025-12-26 13:55:58'),
(132,	75,	60,	'video',	'video',	'page_section_images/1766757376_form.jpg',	NULL,	'image/jpeg',	192942,	'1',	'1',	'2025-12-26 13:56:17',	'2025-12-26 13:56:17'),
(133,	76,	60,	'video',	'video',	'page_section_images/1766757395_oila1.jpg',	NULL,	'image/jpeg',	1739467,	'1',	'1',	'2025-12-26 13:56:36',	'2025-12-26 13:56:36'),
(134,	77,	61,	'video',	'video-1',	'page_section_images/1766757456_c1a4917b58c218386f15744094c20059373d611d-min.png',	NULL,	'image/png',	895781,	'1',	'1',	'2025-12-26 13:57:36',	'2025-12-26 13:57:36'),
(135,	78,	61,	'video',	'video-1',	'page_section_images/1766757473_form.jpg',	NULL,	'image/jpeg',	192942,	'1',	'1',	'2025-12-26 13:57:53',	'2025-12-26 13:57:53'),
(136,	79,	61,	'video',	'video-1',	'page_section_images/1766757491_oila1.jpg',	NULL,	'image/jpeg',	1739467,	'1',	'1',	'2025-12-26 13:58:11',	'2025-12-26 13:58:11'),
(137,	80,	62,	'video',	'video-2',	'page_section_images/1766758654_c1a4917b58c218386f15744094c20059373d611d-min.png',	NULL,	'image/png',	895781,	'1',	'1',	'2025-12-26 14:17:34',	'2025-12-26 14:17:34'),
(87,	57,	52,	'Url',	'url',	'page_section_images/1766747422_oila1.jpg',	NULL,	'image/jpeg',	1739467,	'1',	'1',	'2025-12-26 11:10:22',	'2025-12-29 13:33:55'),
(88,	58,	52,	'Url',	'url',	'page_section_images/1766747439_form.jpg',	NULL,	'image/jpeg',	192942,	'1',	'1',	'2025-12-26 11:10:39',	'2025-12-29 13:34:24'),
(138,	81,	62,	'video',	'video-2',	'page_section_images/1766758671_oila1.jpg',	NULL,	'image/jpeg',	1739467,	'1',	'1',	'2025-12-26 14:17:51',	'2025-12-26 14:17:51'),
(139,	82,	62,	'video',	'video-2',	'page_section_images/1766758689_form.jpg',	NULL,	'image/jpeg',	192942,	'1',	'1',	'2025-12-26 14:18:09',	'2025-12-26 14:18:09'),
(140,	83,	63,	'video',	'video-3',	'page_section_images/1766758736_form.jpg',	NULL,	'image/jpeg',	192942,	'1',	'1',	'2025-12-26 14:18:56',	'2025-12-26 14:18:56'),
(141,	84,	63,	'video',	'video-3',	'page_section_images/1766758753_c1a4917b58c218386f15744094c20059373d611d-min.png',	NULL,	'image/png',	895781,	'1',	'1',	'2025-12-26 14:19:13',	'2025-12-26 14:19:13'),
(142,	85,	63,	'video',	'video-3',	'page_section_images/1766758770_oila1.jpg',	NULL,	'image/jpeg',	1739467,	'1',	'1',	'2025-12-26 14:19:30',	'2025-12-26 14:19:30'),
(143,	86,	64,	'video',	'video-4',	'page_section_images/1766758810_c1a4917b58c218386f15744094c20059373d611d-min.png',	NULL,	'image/png',	895781,	'1',	'1',	'2025-12-26 14:20:11',	'2025-12-26 14:20:11'),
(144,	87,	64,	'video',	'video-4',	'page_section_images/1766758828_form.jpg',	NULL,	'image/jpeg',	192942,	'1',	'1',	'2025-12-26 14:20:28',	'2025-12-26 14:20:28'),
(145,	88,	64,	'video',	'video-4',	'page_section_images/1766758846_oila1.jpg',	NULL,	'image/jpeg',	1739467,	'1',	'1',	'2025-12-26 14:20:46',	'2025-12-26 14:20:46'),
(146,	90,	89,	'video',	'video-6',	'page_section_images/1766759177_c1a4917b58c218386f15744094c20059373d611d-min.png',	NULL,	'image/png',	895781,	'1',	'1',	'2025-12-26 14:26:17',	'2025-12-26 14:26:17'),
(147,	91,	89,	'video',	'video-6',	'page_section_images/1766759192_form.jpg',	NULL,	'image/jpeg',	192942,	'1',	'1',	'2025-12-26 14:26:32',	'2025-12-26 14:26:32'),
(148,	92,	89,	'video',	'video-6',	'page_section_images/1766759208_oila1.jpg',	NULL,	'image/jpeg',	1739467,	'1',	'1',	'2025-12-26 14:26:48',	'2025-12-26 14:26:48'),
(149,	93,	66,	'video',	'video-7',	'page_section_images/1766759249_c1a4917b58c218386f15744094c20059373d611d-min.png',	NULL,	'image/png',	895781,	'1',	'1',	'2025-12-26 14:27:29',	'2025-12-26 14:27:29'),
(150,	94,	66,	'video',	'video-7',	'page_section_images/1766759270_form.jpg',	NULL,	'image/jpeg',	192942,	'1',	'1',	'2025-12-26 14:27:50',	'2025-12-26 14:27:50'),
(151,	95,	66,	'video',	'video-7',	'page_section_images/1766759285_oila1.jpg',	NULL,	'image/jpeg',	1739467,	'1',	'1',	'2025-12-26 14:28:05',	'2025-12-26 14:28:05'),
(152,	96,	67,	'video',	'video-8',	'page_section_images/1766759319_c1a4917b58c218386f15744094c20059373d611d-min.png',	NULL,	'image/png',	895781,	'1',	'1',	'2025-12-26 14:28:39',	'2025-12-26 14:28:39'),
(153,	97,	67,	'video',	'video-8',	'page_section_images/1766759333_form.jpg',	NULL,	'image/jpeg',	192942,	'1',	'1',	'2025-12-26 14:28:53',	'2025-12-26 14:28:53'),
(154,	98,	67,	'video',	'video-8',	'page_section_images/1766759346_oila1.jpg',	NULL,	'image/jpeg',	1739467,	'1',	'1',	'2025-12-26 14:29:06',	'2025-12-26 14:29:06'),
(155,	99,	68,	'video',	'video-9',	'page_section_images/1766759391_c1a4917b58c218386f15744094c20059373d611d-min.png',	NULL,	'image/png',	895781,	'1',	'1',	'2025-12-26 14:29:51',	'2025-12-26 14:29:51'),
(156,	100,	68,	'video',	'video-9',	'page_section_images/1766759405_form.jpg',	NULL,	'image/jpeg',	192942,	'1',	'1',	'2025-12-26 14:30:05',	'2025-12-26 14:30:05'),
(157,	101,	68,	'video',	'video-9',	'page_section_images/1766759418_oila1.jpg',	NULL,	'image/jpeg',	1739467,	'1',	'1',	'2025-12-26 14:30:19',	'2025-12-26 14:30:19'),
(158,	102,	69,	'video',	'video-10',	'page_section_images/1766759452_oila1.jpg',	NULL,	'image/jpeg',	1739467,	'1',	'1',	'2025-12-26 14:30:52',	'2025-12-26 14:30:52'),
(159,	103,	69,	'video',	'video-10',	'page_section_images/1766759469_form.jpg',	NULL,	'image/jpeg',	192942,	'1',	'1',	'2025-12-26 14:31:09',	'2025-12-26 14:31:09'),
(160,	104,	69,	'video',	'video-10',	'page_section_images/1766759484_c1a4917b58c218386f15744094c20059373d611d-min.png',	NULL,	'image/png',	895781,	'1',	'1',	'2025-12-26 14:31:24',	'2025-12-26 14:31:24'),
(161,	105,	70,	'video',	'video-11',	'page_section_images/1766759533_c1a4917b58c218386f15744094c20059373d611d-min.png',	NULL,	'image/png',	895781,	'1',	'1',	'2025-12-26 14:32:14',	'2025-12-26 14:32:14'),
(162,	106,	70,	'video',	'video-11',	'page_section_images/1766759550_form.jpg',	NULL,	'image/jpeg',	192942,	'1',	'1',	'2025-12-26 14:32:30',	'2025-12-26 14:32:30'),
(163,	107,	70,	'video',	'video-11',	'page_section_images/1766759563_oila1.jpg',	NULL,	'image/jpeg',	1739467,	'0',	'1',	'2025-12-26 14:32:43',	'2025-12-26 14:32:43'),
(164,	108,	71,	'video',	'video-12',	'page_section_images/1766759597_c1a4917b58c218386f15744094c20059373d611d-min.png',	NULL,	'image/png',	895781,	'1',	'1',	'2025-12-26 14:33:17',	'2025-12-26 14:33:17'),
(165,	109,	71,	'video',	'video-12',	'page_section_images/1766759615_form.jpg',	NULL,	'image/jpeg',	192942,	'1',	'1',	'2025-12-26 14:33:35',	'2025-12-26 14:33:35'),
(166,	110,	71,	'video',	'video-12',	'page_section_images/1766759628_oila1.jpg',	NULL,	'image/jpeg',	1739467,	'1',	'1',	'2025-12-26 14:33:49',	'2025-12-26 14:33:49'),
(167,	111,	72,	'video',	'video-13',	'page_section_images/1766759691_c1a4917b58c218386f15744094c20059373d611d-min.png',	NULL,	'image/png',	895781,	'1',	'1',	'2025-12-26 14:34:51',	'2025-12-26 14:34:51'),
(168,	112,	72,	'video',	'video-13',	'page_section_images/1766759710_form.jpg',	NULL,	'image/jpeg',	192942,	'1',	'1',	'2025-12-26 14:35:10',	'2025-12-26 14:35:10'),
(169,	113,	72,	'video',	'video-13',	'page_section_images/1766759723_oila1.jpg',	NULL,	'image/jpeg',	1739467,	'1',	'1',	'2025-12-26 14:35:24',	'2025-12-26 14:35:24'),
(170,	114,	73,	'video',	'video-14',	'page_section_images/1766759756_c1a4917b58c218386f15744094c20059373d611d-min.png',	NULL,	'image/png',	895781,	'1',	'1',	'2025-12-26 14:35:56',	'2025-12-26 14:35:56'),
(171,	115,	73,	'video',	'video-14',	'page_section_images/1766759771_form.jpg',	NULL,	'image/jpeg',	192942,	'1',	'1',	'2025-12-26 14:36:11',	'2025-12-26 14:36:11'),
(172,	116,	73,	'video',	'video-14',	'page_section_images/1766759787_oila1.jpg',	NULL,	'image/jpeg',	1739467,	'1',	'1',	'2025-12-26 14:36:27',	'2025-12-26 14:36:27'),
(176,	117,	NULL,	NULL,	NULL,	'page_section_images/1766859286_news-img-1.png',	NULL,	'image/png',	1264559,	'1',	'1',	'2025-12-27 18:14:46',	'2025-12-27 18:14:46'),
(177,	118,	NULL,	NULL,	NULL,	'page_section_images/1766859328_prezident.png',	NULL,	'image/png',	58403,	'1',	'1',	'2025-12-27 18:15:28',	'2025-12-27 18:15:28'),
(180,	4,	NULL,	NULL,	NULL,	'page_section_images/1766864471_prezident.png',	NULL,	'image/png',	58403,	'1',	'1',	'2025-12-27 19:41:11',	'2025-12-27 19:41:11'),
(183,	120,	NULL,	NULL,	NULL,	'page_section_images/1766983670_file_example_MP4_480_1_5MG.mp4',	NULL,	'video/mp4',	1570024,	'1',	'1',	'2025-12-29 04:47:51',	'2025-12-29 04:47:51'),
(187,	124,	19,	'tashkilot',	'tashkilot',	'page_section_images/1766995973_association-1.png',	NULL,	'image/png',	80956,	'1',	'1',	'2025-12-29 08:12:53',	'2025-12-29 08:12:53'),
(188,	125,	19,	'tashkilot',	'tashkilot',	'page_section_images/1766996015_association-3.png',	NULL,	'image/png',	11024,	'1',	'1',	'2025-12-29 08:13:35',	'2025-12-29 08:13:35'),
(189,	126,	124,	'Nomi',	'nomi-5',	'page_section_images/1766996150_association-1.png',	NULL,	'image/png',	80956,	'1',	'1',	'2025-12-29 08:15:50',	'2025-12-29 08:15:50'),
(190,	128,	124,	'Rahbar',	'rahbar-5',	'page_section_images/1766996525_2302d0d79c36d32933b02c7f1b9e6140350fad23.png',	NULL,	'image/png',	565477,	'1',	'1',	'2025-12-29 08:22:05',	'2025-12-29 08:22:05'),
(191,	129,	NULL,	NULL,	NULL,	'page_section_images/1766998645_association-2.png',	NULL,	'image/png',	8354,	'1',	'1',	'2025-12-29 08:57:25',	'2025-12-29 08:57:25'),
(192,	29,	NULL,	NULL,	NULL,	'page_section_images/1767000379_2302d0d79c36d32933b02c7f1b9e6140350fad23.png',	NULL,	'image/png',	565477,	'0',	'1',	'2025-12-29 09:26:19',	'2025-12-29 09:26:19'),
(193,	29,	NULL,	NULL,	NULL,	'page_section_images/1767000379_2302d0d79c36d32933b02c7f1b9e6140350fad23.png',	NULL,	'image/png',	565477,	'1',	'1',	'2025-12-29 09:26:19',	'2025-12-29 09:26:19'),
(194,	119,	NULL,	NULL,	NULL,	'page_section_images/1767007216_56fe38f6ec843c64677b251a9d627181f820bf50.png',	NULL,	'image/png',	1739467,	'1',	'1',	'2025-12-29 11:20:16',	'2025-12-29 11:20:16'),
(196,	132,	NULL,	NULL,	NULL,	'page_section_images/1767011429_0a9de2d13f6d63a28051589157af258de5c64e37.jpg',	NULL,	'image/jpeg',	478813,	'1',	'1',	'2025-12-29 12:30:29',	'2025-12-29 12:30:29'),
(197,	133,	NULL,	NULL,	NULL,	'page_section_images/1767011476_71596a3c79e6ea29869f23118068e52cdaa097e0.png',	NULL,	'image/png',	1051197,	'1',	'1',	'2025-12-29 12:31:16',	'2025-12-29 12:31:16'),
(198,	134,	NULL,	NULL,	NULL,	'page_section_images/1767011517_662b4243d213d533c2a32dc5abe015394d50cc47.png',	NULL,	'image/png',	3427681,	'1',	'1',	'2025-12-29 12:31:57',	'2025-12-29 12:31:57'),
(207,	131,	NULL,	NULL,	NULL,	'page_section_images/1767013363_prezident.png',	NULL,	'image/png',	58403,	'0',	'1',	'2025-12-29 13:02:43',	'2025-12-29 13:02:43'),
(208,	131,	NULL,	NULL,	NULL,	'page_section_images/1767013363_video-3.png',	NULL,	'image/png',	1739467,	'1',	'1',	'2025-12-29 13:02:43',	'2025-12-29 13:02:43'),
(209,	135,	NULL,	NULL,	NULL,	'page_section_images/1767090564_video-3.png',	NULL,	'image/png',	1739467,	'0',	'1',	'2025-12-30 10:29:25',	'2025-12-30 10:29:25'),
(210,	135,	NULL,	NULL,	NULL,	'page_section_images/1767090565_9f44c2e308de8a752650fc50f9a730e071877078.png',	NULL,	'image/png',	1672804,	'0',	'1',	'2025-12-30 10:29:25',	'2025-12-30 10:29:25'),
(211,	135,	NULL,	NULL,	NULL,	'page_section_images/1767090565_71596a3c79e6ea29869f23118068e52cdaa097e0.png',	NULL,	'image/png',	1051197,	'0',	'1',	'2025-12-30 10:29:25',	'2025-12-30 10:29:25'),
(212,	135,	NULL,	NULL,	NULL,	'page_section_images/1767090565_association-2.png',	NULL,	'image/png',	8354,	'0',	'1',	'2025-12-30 10:29:25',	'2025-12-30 10:29:25'),
(213,	139,	NULL,	NULL,	NULL,	'page_section_images/1767090592_2302d0d79c36d32933b02c7f1b9e6140350fad23.png',	NULL,	'image/png',	565477,	'0',	'1',	'2025-12-30 10:29:52',	'2025-12-30 10:29:52'),
(214,	139,	NULL,	NULL,	NULL,	'page_section_images/1767090592_association-4.png',	NULL,	'image/png',	5583,	'0',	'1',	'2025-12-30 10:29:52',	'2025-12-30 10:29:52'),
(215,	139,	NULL,	NULL,	NULL,	'page_section_images/1767090592_association-3.png',	NULL,	'image/png',	11024,	'0',	'1',	'2025-12-30 10:29:52',	'2025-12-30 10:29:52'),
(216,	139,	NULL,	NULL,	NULL,	'page_section_images/1767090592_association-2.png',	NULL,	'image/png',	8354,	'0',	'1',	'2025-12-30 10:29:52',	'2025-12-30 10:29:52'),
(217,	139,	NULL,	NULL,	NULL,	'page_section_images/1767090592_association-1.png',	NULL,	'image/png',	80956,	'0',	'1',	'2025-12-30 10:29:52',	'2025-12-30 10:29:52'),
(218,	139,	NULL,	NULL,	NULL,	'page_section_images/1767090592_flag-en.png',	NULL,	'image/png',	18142,	'0',	'1',	'2025-12-30 10:29:52',	'2025-12-30 10:29:52'),
(219,	139,	NULL,	NULL,	NULL,	'page_section_images/1767090592_flag-ru.png',	NULL,	'image/png',	1743,	'0',	'1',	'2025-12-30 10:29:52',	'2025-12-30 10:29:52'),
(220,	139,	NULL,	NULL,	NULL,	'page_section_images/1767090592_flag-uz.png',	NULL,	'image/png',	9976,	'0',	'1',	'2025-12-30 10:29:52',	'2025-12-30 10:29:52'),
(232,	148,	NULL,	NULL,	NULL,	'page_section_images/1767113016_56fe38f6ec843c64677b251a9d627181f820bf50.png',	NULL,	'image/png',	1739467,	'1',	'1',	'2025-12-30 16:43:36',	'2025-12-30 16:43:36'),
(233,	149,	NULL,	NULL,	NULL,	'page_section_images/1767113069_662b4243d213d533c2a32dc5abe015394d50cc47.png',	NULL,	'image/png',	3427681,	'1',	'1',	'2025-12-30 16:44:29',	'2025-12-30 16:44:29'),
(244,	150,	NULL,	NULL,	NULL,	'page_section_images/1767124750_71596a3c79e6ea29869f23118068e52cdaa097e0.png',	NULL,	'image/png',	1051197,	'0',	'1',	'2025-12-30 19:59:11',	'2025-12-30 19:59:11'),
(245,	150,	NULL,	NULL,	NULL,	'page_section_images/1767124751_9f44c2e308de8a752650fc50f9a730e071877078.png',	NULL,	'image/png',	1672804,	'0',	'1',	'2025-12-30 19:59:11',	'2025-12-30 19:59:11'),
(246,	150,	NULL,	NULL,	NULL,	'page_section_images/1767124751_f87cf5263832720cdbe41c7eb7faa98cae5c58a2.png',	NULL,	'image/png',	786846,	'0',	'1',	'2025-12-30 19:59:11',	'2025-12-30 19:59:11'),
(247,	150,	NULL,	NULL,	NULL,	'page_section_images/1767124751_7f1beefe896a37c2a8669f8c96ad0b81629aa952.png',	NULL,	'image/png',	751123,	'0',	'1',	'2025-12-30 19:59:11',	'2025-12-30 19:59:11'),
(248,	151,	NULL,	NULL,	NULL,	'page_section_images/1767124785_7f1beefe896a37c2a8669f8c96ad0b81629aa952.png',	NULL,	'image/png',	751123,	'0',	'1',	'2025-12-30 19:59:45',	'2025-12-30 19:59:45'),
(249,	151,	NULL,	NULL,	NULL,	'page_section_images/1767124785_flag-uz.png',	NULL,	'image/png',	9976,	'0',	'1',	'2025-12-30 19:59:45',	'2025-12-30 19:59:45'),
(250,	151,	NULL,	NULL,	NULL,	'page_section_images/1767124785_2302d0d79c36d32933b02c7f1b9e6140350fad23.png',	NULL,	'image/png',	565477,	'0',	'1',	'2025-12-30 19:59:45',	'2025-12-30 19:59:45'),
(251,	151,	NULL,	NULL,	NULL,	'page_section_images/1767124785_association-3.png',	NULL,	'image/png',	11024,	'0',	'1',	'2025-12-30 19:59:45',	'2025-12-30 19:59:45'),
(252,	152,	NULL,	NULL,	NULL,	'page_section_images/1767142699_7f1beefe896a37c2a8669f8c96ad0b81629aa952.png',	NULL,	'image/png',	751123,	'0',	'1',	'2025-12-31 00:58:19',	'2025-12-31 00:58:19'),
(253,	152,	NULL,	NULL,	NULL,	'page_section_images/1767142699_f87cf5263832720cdbe41c7eb7faa98cae5c58a2.png',	NULL,	'image/png',	786846,	'0',	'1',	'2025-12-31 00:58:19',	'2025-12-31 00:58:19'),
(254,	152,	NULL,	NULL,	NULL,	'page_section_images/1767142699_news-img-2.png',	NULL,	'image/png',	23441,	'0',	'1',	'2025-12-31 00:58:19',	'2025-12-31 00:58:19'),
(255,	152,	NULL,	NULL,	NULL,	'page_section_images/1767142699_news-img-1.png',	NULL,	'image/png',	1264559,	'0',	'1',	'2025-12-31 00:58:19',	'2025-12-31 00:58:19'),
(256,	152,	NULL,	NULL,	NULL,	'page_section_images/1767142699_662b4243d213d533c2a32dc5abe015394d50cc47.png',	NULL,	'image/png',	3427681,	'0',	'1',	'2025-12-31 00:58:19',	'2025-12-31 00:58:19'),
(257,	153,	NULL,	NULL,	NULL,	'page_section_images/1767142745_form.jpg',	NULL,	'image/jpeg',	192942,	'0',	'1',	'2025-12-31 00:59:05',	'2025-12-31 00:59:05'),
(258,	153,	NULL,	NULL,	NULL,	'page_section_images/1767142745_oila1.jpg',	NULL,	'image/jpeg',	1739467,	'0',	'1',	'2025-12-31 00:59:05',	'2025-12-31 00:59:05'),
(259,	153,	NULL,	NULL,	NULL,	'page_section_images/1767142745_Salah.jpg',	NULL,	'image/jpeg',	108682,	'0',	'1',	'2025-12-31 00:59:05',	'2025-12-31 00:59:05'),
(260,	153,	NULL,	NULL,	NULL,	'page_section_images/1767142745_Taqu.jpg',	NULL,	'image/jpeg',	62105,	'0',	'1',	'2025-12-31 00:59:05',	'2025-12-31 00:59:05'),
(263,	156,	NULL,	NULL,	NULL,	'page_section_images/1767142971_Taqu.jpg',	NULL,	'image/jpeg',	62105,	'0',	'1',	'2025-12-31 01:02:51',	'2025-12-31 01:02:51'),
(264,	157,	NULL,	NULL,	NULL,	'page_section_images/1767143011_Salah.jpg',	NULL,	'image/jpeg',	108682,	'1',	'1',	'2025-12-31 01:03:31',	'2025-12-31 01:03:31'),
(265,	158,	NULL,	NULL,	NULL,	'page_section_images/1767143111_c1a4917b58c218386f15744094c20059373d611d-min.png',	NULL,	'image/png',	895781,	'1',	'1',	'2025-12-31 01:05:11',	'2025-12-31 01:05:11');

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
(151,	36,	NULL,	NULL,	NULL,	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-29 09:58:52',	'2025-12-29 09:58:52'),
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
(154,	41,	NULL,	NULL,	NULL,	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-29 12:33:13',	'2025-12-29 12:33:13'),
(29,	23,	19,	'tashkilot',	'tashkilot',	'title',	'Title',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-23 05:53:34',	'2025-12-23 05:53:34'),
(30,	23,	21,	'Nomi',	'nomi',	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-23 05:54:40',	'2025-12-23 05:54:40'),
(31,	23,	21,	'Nomi',	'nomi',	'date_at',	'Date_at',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-23 05:54:40',	'2025-12-23 05:54:58'),
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
(46,	23,	27,	'Rahbar',	'rahbar-2',	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-23 06:04:49',	'2025-12-23 06:04:49'),
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
(32,	23,	21,	'Nomi',	'nomi',	'boss_at',	'Boss_at',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-23 05:54:40',	'2025-12-29 08:09:23'),
(45,	23,	27,	'Nomi',	'nomi-2',	'boss_at',	'Boss_at',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-23 06:03:21',	'2025-12-29 09:23:20'),
(74,	31,	NULL,	NULL,	NULL,	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-25 13:35:17',	'2025-12-25 13:35:17'),
(75,	31,	NULL,	NULL,	NULL,	'description',	'Description',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-25 13:35:17',	'2025-12-25 13:35:17'),
(47,	23,	27,	'Rahbar',	'rahbar-2',	'phone',	'Phone',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-23 06:04:49',	'2025-12-29 09:25:27'),
(76,	27,	NULL,	NULL,	NULL,	'url',	'Url',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-26 05:11:06',	'2025-12-26 05:12:04'),
(77,	14,	NULL,	NULL,	NULL,	'description',	'Description',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-26 05:16:30',	'2025-12-26 05:16:30'),
(78,	7,	NULL,	NULL,	NULL,	'url',	'Url',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-26 05:18:39',	'2025-12-26 05:21:46'),
(79,	7,	NULL,	NULL,	NULL,	'url_title',	'Url_title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-26 05:23:33',	'2025-12-26 05:23:33'),
(80,	9,	NULL,	NULL,	NULL,	'url',	'Url',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-26 05:27:34',	'2025-12-26 05:29:14'),
(81,	9,	NULL,	NULL,	NULL,	'url_title',	'Url_title',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-26 05:27:34',	'2025-12-26 05:29:14'),
(82,	27,	NULL,	NULL,	NULL,	'url_title',	'Url_title',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-26 05:30:31',	'2025-12-26 05:30:31'),
(73,	30,	NULL,	NULL,	NULL,	'url',	'Url',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-25 13:31:28',	'2025-12-26 09:35:27'),
(83,	30,	52,	'Url',	'url',	'url',	'Url',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-26 11:09:36',	'2025-12-26 11:09:49'),
(84,	30,	52,	'Url',	'url',	'url_title',	'Url_title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-26 11:29:17',	'2025-12-26 11:29:17'),
(85,	32,	NULL,	NULL,	NULL,	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-26 13:16:02',	'2025-12-26 13:16:02'),
(86,	32,	NULL,	NULL,	NULL,	'description',	'Description',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-26 13:16:02',	'2025-12-26 13:16:02'),
(88,	33,	NULL,	NULL,	NULL,	'path',	'Path',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-26 13:18:29',	'2025-12-26 13:21:25'),
(89,	33,	NULL,	NULL,	NULL,	'description',	'Description',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-26 13:37:38',	'2025-12-26 13:40:01'),
(87,	33,	NULL,	NULL,	NULL,	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-26 13:18:29',	'2025-12-26 13:42:31'),
(90,	33,	60,	'video',	'video',	'url',	'Url',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-26 13:55:22',	'2025-12-26 13:55:22'),
(91,	33,	61,	'video',	'video-1',	'url',	'Url',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-26 13:57:14',	'2025-12-26 13:57:14'),
(92,	33,	62,	'video',	'video-2',	'url',	'Url',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-26 14:17:16',	'2025-12-26 14:17:16'),
(93,	33,	63,	'video',	'video-3',	'url',	'Url',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-26 14:18:35',	'2025-12-26 14:18:35'),
(94,	33,	64,	'video',	'video-4',	'url',	'Url',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-26 14:19:53',	'2025-12-26 14:19:53'),
(95,	33,	65,	'video',	'video-5',	'url',	'Url',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-26 14:21:29',	'2025-12-26 14:21:29'),
(96,	33,	65,	'video',	'video-5',	'url',	'Url',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-26 14:22:03',	'2025-12-26 14:22:03'),
(97,	33,	65,	'video',	'video-5',	'url',	'Url',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-26 14:23:15',	'2025-12-26 14:23:15'),
(98,	33,	89,	'video',	'video-6',	'url',	'Url',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-26 14:25:38',	'2025-12-26 14:25:38'),
(99,	33,	66,	'video',	'video-7',	'url',	'Url',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-26 14:27:12',	'2025-12-26 14:27:12'),
(100,	33,	67,	'video',	'video-8',	'url',	'Url',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-26 14:28:24',	'2025-12-26 14:28:24'),
(101,	33,	68,	'video',	'video-9',	'url',	'Url',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-26 14:29:34',	'2025-12-26 14:29:34'),
(102,	33,	69,	'video',	'video-10',	'url',	'Url',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-26 14:30:36',	'2025-12-26 14:30:36'),
(103,	33,	70,	'video',	'video-11',	'url',	'Url',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-26 14:31:52',	'2025-12-26 14:31:52'),
(104,	33,	71,	'video',	'video-12',	'url',	'Url',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-26 14:33:03',	'2025-12-26 14:33:03'),
(105,	33,	72,	'video',	'video-13',	'url',	'Url',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-26 14:34:36',	'2025-12-26 14:34:36'),
(106,	33,	73,	'video',	'video-14',	'url',	'Url',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-26 14:35:42',	'2025-12-26 14:35:42'),
(107,	33,	NULL,	NULL,	NULL,	'code',	'Code',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-27 07:01:08',	'2025-12-27 07:01:39'),
(108,	33,	NULL,	NULL,	NULL,	'offset',	'Offset',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-27 07:28:52',	'2025-12-27 07:28:52'),
(109,	33,	66,	'video',	'video-7',	'title',	'title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-27 14:22:41',	'2025-12-27 14:22:41'),
(110,	35,	NULL,	NULL,	NULL,	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-27 18:32:28',	'2025-12-27 18:33:36'),
(111,	33,	60,	'video',	'video',	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-28 06:09:32',	'2025-12-28 06:09:56'),
(112,	33,	61,	'video',	'video-1',	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-28 06:11:24',	'2025-12-28 06:11:24'),
(113,	33,	62,	'video',	'video-2',	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-28 06:13:42',	'2025-12-28 06:13:42'),
(114,	33,	63,	'video',	'video-3',	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-28 06:16:04',	'2025-12-28 06:16:04'),
(115,	33,	64,	'video',	'video-4',	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-28 06:21:38',	'2025-12-28 06:21:38'),
(116,	33,	89,	'video',	'video-6',	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-28 06:23:04',	'2025-12-28 06:23:04'),
(117,	33,	67,	'video',	'video-8',	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-28 06:25:02',	'2025-12-28 06:25:02'),
(118,	33,	68,	'video',	'video-9',	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-28 06:26:49',	'2025-12-28 06:26:49'),
(119,	33,	69,	'video',	'video-10',	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-28 06:28:30',	'2025-12-28 06:28:30'),
(120,	33,	70,	'video',	'video-11',	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-28 06:30:21',	'2025-12-28 06:30:21'),
(121,	33,	71,	'video',	'video-12',	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-28 06:31:38',	'2025-12-28 06:31:38'),
(122,	23,	121,	'Nomi',	'nomi-4',	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-29 08:02:16',	'2025-12-29 08:02:16'),
(123,	23,	121,	'Nomi',	'nomi-4',	'date_at',	'Date_at',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-29 08:02:16',	'2025-12-29 08:02:16'),
(124,	23,	121,	'Nomi',	'nomi-4',	'boss_at',	'Boss_at',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-29 08:02:16',	'2025-12-29 08:02:16'),
(125,	23,	121,	'Nomi',	'nomi-4',	'content',	'Content',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-29 08:02:16',	'2025-12-29 08:02:16'),
(126,	23,	121,	'Rahbar',	'rahbar-4',	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-29 08:05:03',	'2025-12-29 08:05:03'),
(127,	23,	121,	'Rahbar',	'rahbar-4',	'description',	'Description',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-29 08:05:03',	'2025-12-29 08:05:04'),
(128,	23,	121,	'Rahbar',	'rahbar-4',	'phone',	'Phone',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-29 08:05:04',	'2025-12-29 08:05:04'),
(129,	23,	121,	'Rahbar',	'rahbar-4',	'email',	'Email',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-29 08:05:04',	'2025-12-29 08:05:04'),
(130,	23,	21,	'Rahbar',	'rahbar',	'description',	'Description',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-29 08:10:55',	'2025-12-29 08:10:55'),
(131,	23,	124,	'Nomi',	'nomi-5',	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-29 08:14:48',	'2025-12-29 08:14:48'),
(132,	23,	124,	'Nomi',	'nomi-5',	'date_at',	'Date_at',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-29 08:14:48',	'2025-12-29 08:14:48'),
(133,	23,	124,	'Nomi',	'nomi-5',	'boss_at',	'Boss_at',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-29 08:14:48',	'2025-12-29 08:14:48'),
(134,	23,	124,	'Nomi',	'nomi-5',	'description',	'Description',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-29 08:14:48',	'2025-12-29 08:14:48'),
(135,	23,	125,	'Nomi',	'nomi-6',	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-29 08:18:18',	'2025-12-29 08:18:18'),
(136,	23,	125,	'Nomi',	'nomi-6',	'description',	'Description',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-29 08:18:18',	'2025-12-29 08:18:18'),
(137,	23,	125,	'Nomi',	'nomi-6',	'date_at',	'Date_at',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-29 08:18:18',	'2025-12-29 08:18:18'),
(138,	23,	125,	'Nomi',	'nomi-6',	'boss_at',	'Boss_at',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-29 08:18:18',	'2025-12-29 08:18:18'),
(139,	23,	124,	'Rahbar',	'rahbar-5',	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-29 08:20:39',	'2025-12-29 08:20:39'),
(140,	23,	124,	'Rahbar',	'rahbar-5',	'phone',	'Phone',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-29 08:20:39',	'2025-12-29 08:20:39'),
(148,	23,	27,	'Rahbar',	'rahbar-2',	'description',	'Description',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-29 09:25:27',	'2025-12-29 09:25:27'),
(141,	23,	124,	'Rahbar',	'rahbar-5',	'email',	'Email',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-29 08:20:39',	'2025-12-29 08:20:39'),
(142,	23,	124,	'Rahbar',	'rahbar-5',	'description',	'Description',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-29 08:20:39',	'2025-12-29 08:20:39'),
(149,	23,	30,	'Nomi',	'nomi-3',	'description',	'Description',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-29 09:27:19',	'2025-12-29 09:27:19'),
(143,	23,	125,	'Rahbar',	'rahbar-6',	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-29 08:21:37',	'2025-12-29 08:21:37'),
(144,	23,	125,	'Rahbar',	'rahbar-6',	'description',	'Description',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-29 08:21:37',	'2025-12-29 08:21:37'),
(145,	23,	125,	'Rahbar',	'rahbar-6',	'email',	'Email',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-29 08:21:37',	'2025-12-29 08:21:37'),
(150,	23,	30,	'Rahbar',	'rahbar-3',	'description',	'Description',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-29 09:28:27',	'2025-12-29 09:28:48'),
(146,	23,	125,	'Rahbar',	'rahbar-6',	'phone',	'Phone',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-29 08:21:37',	'2025-12-29 08:21:37'),
(152,	40,	NULL,	NULL,	NULL,	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-29 12:26:42',	'2025-12-29 12:26:42'),
(147,	23,	27,	'Nomi',	'nomi-2',	'description',	'Description',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-29 09:23:20',	'2025-12-29 09:23:20'),
(153,	40,	NULL,	NULL,	NULL,	'url',	'Url',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-29 12:26:42',	'2025-12-29 12:26:42'),
(155,	41,	NULL,	NULL,	NULL,	'year',	'Year',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-29 12:33:13',	'2025-12-29 12:33:13'),
(156,	41,	135,	'Bu mavsumga tegishli rasmlar',	'bu-mavsumga-tegishli-rasmlar',	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-29 12:42:03',	'2025-12-29 12:42:03'),
(157,	41,	139,	'2024-rasmlar',	'2024-rasmlar',	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-29 12:44:58',	'2025-12-29 12:44:58'),
(158,	42,	NULL,	NULL,	NULL,	'title',	'Title',	'textarea-editor',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-30 06:18:45',	'2025-12-30 06:18:45'),
(159,	38,	NULL,	NULL,	NULL,	'title',	'title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-30 15:59:51',	'2025-12-30 15:59:51'),
(160,	38,	NULL,	NULL,	NULL,	'description',	'Description',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-30 15:59:51',	'2025-12-30 15:59:51'),
(161,	38,	NULL,	NULL,	NULL,	'url',	'Url',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-30 15:59:51',	'2025-12-30 15:59:51'),
(162,	38,	144,	'Yillar',	'yillar',	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-30 16:03:09',	'2025-12-30 16:03:09'),
(163,	38,	148,	'Yillar',	'yillar-1',	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-30 16:46:43',	'2025-12-30 16:46:43'),
(164,	38,	149,	'Yillar',	'yillar-2',	'title',	'Title',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-30 16:49:30',	'2025-12-30 16:49:30'),
(165,	43,	NULL,	NULL,	NULL,	'name',	'Name',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-30 20:07:06',	'2025-12-30 20:07:06'),
(166,	43,	NULL,	NULL,	NULL,	'description',	'Description',	'textarea',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-30 20:07:06',	'2025-12-30 20:07:06'),
(167,	43,	NULL,	NULL,	NULL,	'email',	'Email',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-30 20:07:06',	'2025-12-30 20:07:06'),
(168,	43,	NULL,	NULL,	NULL,	'phone',	'Phone',	'text',	'1',	'0',	NULL,	1,	NULL,	'1',	'2025-12-30 20:07:07',	'2025-12-30 20:07:07'),
(169,	44,	NULL,	NULL,	NULL,	'name',	'Name',	'text',	'1',	'1',	NULL,	1,	NULL,	'1',	'2025-12-30 23:32:12',	'2025-12-30 23:32:12');

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
(11,	5,	NULL,	NULL,	NULL,	'uz',	'{"title": "O‘zbekiston – sirli o‘tmish va yorqin kelajak maskani!", "description": "O‘zbekiston – tarix va zamonaviylik uyg‘unligi! Bu yerda har bir qadam o‘ziga xos kashfiyot. So‘nggi yillarda mamlakat turizm, iqtisodiyot va xizmat ko‘rsatish sohalarida yangi bosqichga ko‘tarilib, sayyohlar uchun yanada qulay va qiziqarli makonga aylandi. Samarqand, Buxoro, Xiva kabi shaharlar o‘zining qadimiy ruhi bilan, Toshkent esa zamonaviy tarovati bilan mehmonlarni o‘ziga jalb qiladi. Bu yerda qadimiylik va yangilik birlashadi, mehmondo‘stlik esa har yurakni zabt etadi. O‘zbekiston – bu nafaqat sayohat, balki ilhom, kashfiyot va unutilmas taassurotlar manzili. Bu mo‘jizaviy diyorga qadam qo‘ying va yuragingizni bu yerga abadiy bog‘lang!"}',	'2025-12-23 05:06:24',	'2025-12-23 05:06:24'),
(12,	5,	NULL,	NULL,	NULL,	'ru',	'{"title": null, "description": null}',	'2025-12-23 05:06:24',	'2025-12-23 05:06:24'),
(13,	6,	NULL,	NULL,	NULL,	'uz',	'{"title": "Forum va seminarlardan video"}',	'2025-12-23 05:07:48',	'2025-12-23 05:07:48'),
(14,	6,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-23 05:07:48',	'2025-12-23 05:07:48'),
(15,	7,	NULL,	NULL,	NULL,	'uz',	'{"title": "Fotogalareya"}',	'2025-12-23 05:08:27',	'2025-12-23 05:08:27'),
(16,	7,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-23 05:08:27',	'2025-12-23 05:08:27'),
(26,	12,	NULL,	NULL,	NULL,	'ru',	'{"title": null, "content": null, "description": null}',	'2025-12-23 05:29:07',	'2025-12-25 08:31:46'),
(332,	88,	NULL,	NULL,	NULL,	'uz',	'{"title": "Juventus"}',	'2025-12-28 06:22:17',	'2025-12-28 06:22:17'),
(20,	9,	NULL,	NULL,	NULL,	'ru',	'{"url": null, "title": null, "url_title": null, "description": null}',	'2025-12-23 05:11:35',	'2025-12-26 05:28:45'),
(94,	39,	NULL,	NULL,	NULL,	'en',	'{"url": null, "title": null, "content": null, "description": null}',	'2025-12-25 08:50:21',	'2025-12-26 07:23:47'),
(9,	4,	NULL,	NULL,	NULL,	'uz',	'{"title": "Vatandoshlar jamoat fondi", "content": "“Xorijda istiqomat qilayotgan yurtdoshlarni birlashtirish maqsadida ''Vatandoshlar'' jamoat fondi tashkil etildi... Bu fonddan asosiy maqsad - tarixiy Vatanimiz atrofida ularni yanada jipslashtirish, ularning qalbi va ongida yurt bilan faxrlanish tuyg''usini yuksaltirish, milliy oʻzlikni saqlab qolish”", "content1": "O’zbekiston Respublikasi Prezidenti", "description": "Shavkat Miromonovich Mirziyoyev"}',	'2025-12-23 04:50:44',	'2025-12-27 19:41:11'),
(17,	8,	NULL,	NULL,	NULL,	'uz',	'{"title": "Qadriyatlarimiz bizni birlashtiradi!", "url_title": "Eng chiroyli Namuna", "description": "Qadriyatlarimiz bizni birlashtiradi! Qadriyatlarimiz – bu bizning ildizlarimiz, qalbimizning kuchi va kelajagimizning yorqin yo‘li. Ular bizni bog‘laydi, har birimizning yuragimizni birlashtiradi va bizga chinakam muvaffaqiyatga erishish imkonini beradi. Biz bu qadriyatlar bilan faxrlanishimiz kerak, chunki ular bizni yuksaltiradi va dunyoga haqiqiy kuchimizni ko‘rsatadi. Qadriyatlarimizga sodiq qolish, ularni davom ettirish – bu nafaqat bugungi kunimiz, balki kelajagimiz uchun ham zarur. Qadriyatlarimiz – bu bizning abadiy merosimiz!"}',	'2025-12-23 05:10:29',	'2025-12-26 05:24:48'),
(18,	8,	NULL,	NULL,	NULL,	'ru',	'{"title": null, "url_title": null, "description": null}',	'2025-12-23 05:10:29',	'2025-12-26 05:24:48'),
(19,	9,	NULL,	NULL,	NULL,	'uz',	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW", "title": "Moziydan saboq, bugundan yuksalish", "url_title": "Bugungi kundagi O''zbekiston", "description": "Moziy va bugun – bu vaqtning ikki qutbi: o‘tgan zamonning ulug‘vorligi va bugunning yuksalishi. Bu yerda tariximizning buyuk sahifalari va hozirgi kunda yaratilayotgan yangi yutuqlar birlashadi. Moziy – bu bizni yuksaltirgan ildizlar, Bugun esa bizning yuksalishimiz, kuchimiz va kelajakka ishonchimizdir. Har bir qadriyat, har bir qadam, bizni kelajakka yetaklaydi. Moziyda o‘rgangan saboqlarimiz, bugunda amalga oshirgan ishlarimizga yo‘l ochadi. Moziy va Bugun – bu vaqtning qiyofasi, bizning kelajakka yo‘limiz!"}',	'2025-12-23 05:11:35',	'2025-12-26 05:28:45'),
(10,	4,	NULL,	NULL,	NULL,	'ru',	'{"title": null, "content": null, "content1": null, "description": null}',	'2025-12-23 04:50:44',	'2025-12-27 19:41:11'),
(305,	78,	NULL,	NULL,	NULL,	'uz',	'{"title": "Eng Sara joylar"}',	'2025-12-28 06:12:16',	'2025-12-28 06:12:16'),
(306,	78,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-28 06:12:16',	'2025-12-28 06:12:16'),
(307,	78,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-28 06:12:16',	'2025-12-28 06:12:16'),
(333,	88,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-28 06:22:17',	'2025-12-28 06:22:17'),
(334,	88,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-28 06:22:17',	'2025-12-28 06:22:17'),
(356,	99,	NULL,	NULL,	NULL,	'uz',	'{"title": "Atetico Madrid"}',	'2025-12-28 06:27:11',	'2025-12-28 06:27:11'),
(357,	99,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-28 06:27:11',	'2025-12-28 06:27:11'),
(358,	99,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-28 06:27:11',	'2025-12-28 06:27:11'),
(380,	107,	NULL,	NULL,	NULL,	'uz',	'{"title": "Swansea"}',	'2025-12-28 06:31:08',	'2025-12-28 06:31:08'),
(381,	107,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-28 06:31:08',	'2025-12-28 06:31:08'),
(382,	107,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-28 06:31:08',	'2025-12-28 06:31:08'),
(440,	134,	NULL,	NULL,	NULL,	'uz',	'{"title": "Maktab loyihasi"}',	'2025-12-29 12:31:57',	'2025-12-29 12:31:57'),
(441,	134,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-29 12:31:57',	'2025-12-29 12:31:57'),
(289,	120,	NULL,	NULL,	NULL,	'uz',	'{"title": "Biz barcha vatandoshlarni birlashtirib ularga kerakli mativatsiya"}',	'2025-12-27 19:14:10',	'2025-12-29 04:47:50'),
(404,	125,	19,	'tashkilot',	'tashkilot',	NULL,	'{"title": "Harvard University"}',	'2025-12-29 08:13:35',	'2025-12-29 08:13:35'),
(442,	134,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-29 12:31:57',	'2025-12-29 12:31:57'),
(423,	29,	NULL,	NULL,	NULL,	'en',	'{"title": null, "description": null}',	'2025-12-29 09:26:19',	'2025-12-29 09:26:19'),
(443,	134,	NULL,	NULL,	NULL,	NULL,	'{"url": null}',	'2025-12-29 12:31:57',	'2025-12-29 12:31:57'),
(498,	151,	148,	'Yillar',	'yillar-1',	'uz',	'{"title": "2023mavsum"}',	'2025-12-30 16:47:54',	'2025-12-30 19:59:45'),
(499,	151,	148,	'Yillar',	'yillar-1',	'ru',	'{"title": null}',	'2025-12-30 16:47:54',	'2025-12-30 19:59:45'),
(500,	151,	148,	'Yillar',	'yillar-1',	'en',	'{"title": null}',	'2025-12-30 16:47:54',	'2025-12-30 19:59:45'),
(523,	158,	NULL,	NULL,	NULL,	'uz',	'{"title": "Bank Loyihasi", "description": "Bank Loyihasi haqida"}',	'2025-12-31 01:05:11',	'2025-12-31 01:05:11'),
(524,	158,	NULL,	NULL,	NULL,	'ru',	'{"title": null, "description": null}',	'2025-12-31 01:05:11',	'2025-12-31 01:05:11'),
(525,	158,	NULL,	NULL,	NULL,	'en',	'{"title": null, "description": null}',	'2025-12-31 01:05:11',	'2025-12-31 01:05:11'),
(526,	158,	NULL,	NULL,	NULL,	NULL,	'{"url": null}',	'2025-12-31 01:05:11',	'2025-12-31 01:05:11'),
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
(58,	27,	20,	'tashkilot',	'tashkilot-1',	'uz',	'{"title": "“Mahalla-USA” o‘zbek diasporal tashkiloti"}',	'2025-12-23 06:02:28',	'2025-12-23 06:02:28'),
(59,	27,	20,	'tashkilot',	'tashkilot-1',	'ru',	'{"title": null}',	'2025-12-23 06:02:28',	'2025-12-23 06:02:28'),
(66,	30,	20,	'tashkilot',	'tashkilot-1',	'uz',	'{"title": "“Yurtdosh” Uzbek-Amerika Assotsiatsiyasi"}',	'2025-12-23 06:06:15',	'2025-12-23 06:06:15'),
(67,	30,	20,	'tashkilot',	'tashkilot-1',	'ru',	'{"title": null}',	'2025-12-23 06:06:15',	'2025-12-23 06:06:15'),
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
(308,	79,	NULL,	NULL,	NULL,	'uz',	'{"title": "Korishga arziydigan joylar"}',	'2025-12-28 06:13:10',	'2025-12-28 06:13:10'),
(29,	14,	NULL,	NULL,	NULL,	'uz',	'{"title": "Sattarov Odiljon Berdimuratovich", "description": "“Vatandoshlar” jamoat fondi Boshqaruv raisi"}',	'2025-12-23 05:32:28',	'2025-12-26 05:17:05'),
(309,	79,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-28 06:13:10',	'2025-12-28 06:13:10'),
(61,	28,	27,	'Nomi',	'nomi-2',	'ru',	'{"title": null, "description": null}',	'2025-12-23 06:03:58',	'2025-12-29 09:24:21'),
(62,	28,	27,	'Nomi',	'nomi-2',	NULL,	'{"boss_at": "12/12/2022", "date_at": "12/20/2017"}',	'2025-12-23 06:03:58',	'2025-12-29 09:24:21'),
(64,	29,	27,	'Rahbar',	'rahbar-2',	'ru',	'{"title": null, "description": null}',	'2025-12-23 06:05:38',	'2025-12-29 09:26:19'),
(63,	29,	27,	'Rahbar',	'rahbar-2',	'uz',	'{"title": "Sadikov Baxodir Talibjonovich  Pittsburgdagi uzbeklar jamiyati rahbari", "description": "New-york-university Rahbari"}',	'2025-12-23 06:05:38',	'2025-12-29 09:26:19'),
(60,	28,	27,	'Nomi',	'nomi-2',	'uz',	'{"title": "“Mahalla-USA” o‘zbek diasporal tashkiloti", "description": "АQShdagi vatandoshlarni birlashtirish, ular oʼrtasida hamjixatlikni mustahkamlash, oʼzbek urf-odatlari, qadriyatlari va ona-tilini asrab qolish"}',	'2025-12-23 06:03:58',	'2025-12-29 09:24:21'),
(70,	31,	30,	'Nomi',	'nomi-3',	NULL,	'{"date_at": "12/20/2018", "first_boss": "12/20/2019"}',	'2025-12-23 06:07:24',	'2025-12-29 09:27:50'),
(65,	29,	27,	'Rahbar',	'rahbar-2',	NULL,	'{"email": "sanayev@vatandoshlarfondi.uz", "phone": "+998(55) 502-22-50"}',	'2025-12-23 06:05:38',	'2025-12-29 09:26:19'),
(68,	31,	30,	'Nomi',	'nomi-3',	'uz',	'{"title": "“Yurtdosh” Uzbek-Amerika Assotsiatsiyasi Batafsil", "description": "new-york-university new-york-university new-york-university new-york-university"}',	'2025-12-23 06:07:24',	'2025-12-29 09:27:50'),
(69,	31,	30,	'Nomi',	'nomi-3',	'ru',	'{"title": null, "description": null}',	'2025-12-23 06:07:24',	'2025-12-29 09:27:50'),
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
(238,	89,	NULL,	NULL,	NULL,	'ru',	'{"title": null, "description": null}',	'2025-12-26 14:25:11',	'2025-12-27 07:31:11'),
(310,	79,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-28 06:13:10',	'2025-12-28 06:13:10'),
(335,	87,	NULL,	NULL,	NULL,	'uz',	'{"title": "Barcelona"}',	'2025-12-28 06:22:33',	'2025-12-28 06:22:33'),
(237,	89,	NULL,	NULL,	NULL,	'uz',	'{"title": "Namangan", "description": "Viloyatning eng qadimiy shahri va markazi bo‘lgan Termizda va uning atrofida zardushtiylar, nestorianlar, buddistlar kabi turli xalqlarning shaharlari va qalʼalarining xarobalari, meʼmorchilik va arxeologiya obidalari, shuningdek islom meʼmorchiligi yodgorliklari saqlanib qolgan. Termizdan uncha uzoq bo‘lmagan joyda esa, fil suyagidan yasalgan shaxmat donalari topilgan,"}',	'2025-12-26 14:25:11',	'2025-12-27 07:31:11'),
(239,	89,	NULL,	NULL,	NULL,	'en',	'{"title": null, "description": null}',	'2025-12-26 14:25:11',	'2025-12-27 07:31:11'),
(132,	52,	NULL,	NULL,	NULL,	'uz',	'{"title": "Forum va seminarlardan video"}',	'2025-12-25 13:32:21',	'2025-12-26 12:18:15'),
(133,	52,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-25 13:32:21',	'2025-12-26 12:18:15'),
(134,	52,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-25 13:32:21',	'2025-12-26 12:18:15'),
(336,	87,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-28 06:22:33',	'2025-12-28 06:22:33'),
(337,	87,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-28 06:22:33',	'2025-12-28 06:22:33'),
(359,	100,	NULL,	NULL,	NULL,	'uz',	'{"title": "Betis"}',	'2025-12-28 06:27:26',	'2025-12-28 06:27:26'),
(360,	100,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-28 06:27:26',	'2025-12-28 06:27:26'),
(361,	100,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-28 06:27:26',	'2025-12-28 06:27:26'),
(383,	108,	NULL,	NULL,	NULL,	'uz',	'{"title": "Futbolchi"}',	'2025-12-28 06:32:15',	'2025-12-28 06:32:15'),
(384,	108,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-28 06:32:15',	'2025-12-28 06:32:15'),
(385,	108,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-28 06:32:15',	'2025-12-28 06:32:15'),
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
(160,	58,	NULL,	NULL,	NULL,	'uz',	'{"url_title": "Yurtdosh"}',	'2025-12-26 11:30:11',	'2025-12-29 13:34:24'),
(154,	52,	NULL,	NULL,	NULL,	NULL,	'{"url": null}',	'2025-12-26 11:06:46',	'2025-12-26 12:18:15'),
(163,	59,	NULL,	NULL,	NULL,	'uz',	'{"title": "Har bir manzil – yangi bir orzu!", "description": "Har bir manzil – yangi bir orzu! O‘zbekistonning eng go‘zal va sirli joylariga sayohat qilish, unutilmas xotiralar bilan qaytish uchun sizni kutmoqda! Bu yerda sizni ajoyib tabiat manzaralari, qadimiy shaharlarning tarixiy obidalari va madaniyatning eng boy meroslari kutib oladi. Har bir manzil o‘ziga xos hikoya va hissiyotlarni uyg‘otadi. Har bir manzil – bu nafaqat tabiatning go‘zalligi, balki yurtimizning yuragidan chiqib, har bir sayyohni o‘ziga jalb qiladigan sehrdir. O‘zbekistonni kashf eting, uning har bir burchagidan ilhom oling va qaytganingizda qalbingizda unutilmas xotiralar qoladi!"}',	'2025-12-26 13:16:46',	'2025-12-26 13:16:46'),
(164,	59,	NULL,	NULL,	NULL,	'ru',	'{"title": null, "description": null}',	'2025-12-26 13:16:46',	'2025-12-26 13:16:46'),
(165,	59,	NULL,	NULL,	NULL,	'en',	'{"title": null, "description": null}',	'2025-12-26 13:16:46',	'2025-12-26 13:16:46'),
(166,	60,	NULL,	NULL,	NULL,	NULL,	'{"code": "UZ-QR", "path": "m144.74 21.815.321 7.095-1.848 5.366-2.96 5-2.593 5.55-.928 3.888H134.7l-1.664.183-1.297 1.296-.551 2.408.744 4.255 1.113 2.407.745 2.592-2.225.744-2.777-1.48-2.225 1.297-1.664 3.703-2.225 3.887-2.032 2.224-2.777-1.663-.367-3.704-.184-5.734-1.113-1.48v-3.17h1.481l1.112 2.592 1.664.928 2.593-.928 1.296-2.776v-3.703l.929-2.96-2.786-1.663-2.96-2.407-.552-2.224 1.664-1.848 1.664-.367 1.848.928.184-7.582 2.593-.367-.184-2.96-2.225-.55-3.512-.552-1.297.928-1.48 1.847-2.032.928 1.297-2.03 2.592-4.807 1.665-2.407-.929-2.776-1.848-2.591.552-3.51.928-3.144 3.126-5.909zM109.508.311l-.165 3.262-1.481 2.96-.184 4.438-3.512 3.143-1.848 2.96-.184 5.366-2.408 2.408-1.113 5.183-2.776 4.438-1.849 4.99-.367 4.255.184 5.551 1.112 2.591 1.848 3.327-.368 2.408-2.776 7.765.368 4.807 2.031 4.806 2.032 2.407 2.777 1.296 3.705 1.48 2.777.184 2.409 1.847 1.848.551.928-1.847 1.48-.368 2.225.184 1.664-.744 4.625-1.48 2.409-1.112 1.48.928.745 3.327-1.664 2.031-2.602 1.682.928 3.327 2.032.928 1.664 1.663 4.809.745 2.409 2.03 2.776.368 5.554.551 4.073.184 3.328-2.03 2.225 1.295 1.112.928 3.512-.744 1.848-.552 3.329 1.112 4.624-.928 4.441-1.48 6.482-2.59.551-2.409h3.145l1.112-1.663-.919-1.654 1.48-3.143 5.737-4.623 4.257-4.254 2.593-4.623.744-3.51-.928-1.296-1.48-1.296-.929-1.847 3.567-.322 19.933 14.382 2.032 6.48 5.581 5.632 5.875 7.086.266.588.589.542 2.326 2.766 5.24 6.442 15.474 19.207 1.498 1.434.506.046 5.379 9.649 14.186 3.841-25.431 47.971-1.158 14.492 6.197 11.166-11.815 6.524 19.234 26.348 12.679 17.626-10.058 4.65-2.345 1.112-.598-.175-.248-.202-4.192-6.81-1.379-2.545-7.356-8.097-2.831-1.755-3.237-1.709-8.228-1.893-2.795-.019-.57.184-1.278.708-.717.818-1.076 2.113-.469 1.719-.662.707h-1.37l-2.069-1.323-.229-1.066-.341-.799-1.857-2.087-.653-.56-.68-.267-1.986-.33-1.296-.533-5.48-4.173-7.567-6.717-1.443-1.379-3.08-3.584-4.753-4.439-.635-.284-.616-.598-.34-.422-2.832-4.954-.377-2.26-.036-2.417-.157-.533-.358-.441-4.855-1.03-3.916 1.278-1.747.772-2.455 4.806-.202-.487-.46-.552-.506-.358-2.225-.763-.744-.468-1.637-2.013-.156.037-.304-.322-.809.184-1.158-1.14-.175-.744.175-.312.515-.414 2.592-.184.322-.413-.184-.735-.469-.671-.376-.892-.203-.864-.147-2.086-1.158-1.507-.028-.616.166-.441 1.002-.533.386.175.781.092.423-.101.414-.395.23-.359.018-.588-.45-1.094-.442-.514-.91-.552-1.609-.22-.533-.221-.754-.652-.763-1.029-.625-1.25-.579-.515-1.812-.588-.956-.772-.285.506-.423 1.314-.331.321-.459.01-1.655-.506-.626-.322-.422.019-.497-.193-1.811-.037-1.444.34h-1.388l-1.232.147-6.813.092-.524-.414-.671-1.286-.598-.276-.809-.974-3.714-3.703-.037-.368.423-1.139-.101-1.131-3.135-4.089-.432-.423-1.021-.607-.368-.055-1.002.276-.882.708-.524.22-2.391-.156-.643-.202-1.453-.791-2.087-.606-.616-.294-1.591-1.379-3.852-4.227-4.422-4.916-2.832-3.584-.441-.396-.028.782-.285 1.084.092.505.818.818.037.267-.156.478-.313.202-.386-.009-.506-.285h-.579l-.469.579v.156l.634.524.24.386-.387 2.003-.285.45-.45.276-1.057-.34-2.437.46-.984.055-1.213-.588-1.113-.221-1.094-.524-1.37-.377-2.666-.551-.827.028-1.306.523-.956.552-2.142 1.783-.57.055-.377.321-.166.634.294.699 1.71 1.24 2.18 1.223.91.349 1.24.23.415.496 2.454 5.698 1.196 1.883.524.625.174.864-.036 1.112.404.368.487-.12 2.896 1.82.883.726.12.652-.469.956-.34.239-.396.018-1.94-.459-1.719.349-.175-.616.111-1.856-.102-.965-.744-2.628-.653-1.232-.818-.909-1.15-.772-4.459-1.149-.735.046-2.004 1.038-1.196.442-.174-.092-.175-.662-.846-.597-.267-.34-.248-1.103-.781-.689-.883-.166-1.315.285-.91.625-.487-.009-.248.266-.368 1.682-.267.689-.294-.119-.68-.791-.405-.101-.616.203-.202.358-.258 1.424.313.717.818.754.405.661.303.993-.018.496-.34.965.027 1.296-.22 1.02.11 1.424-.184 1.48-.166.551-.312.359-.432.147-.782-.028-1.526-.634-.404.092-.258.478-.312 1.103.643 1.102.405 1.011-.175.386-.8.11-2.813-.477-2.382.817-1.627.855-.68.166-.552-.019-1.49-.91-1.719-.34-2.105-.165-4.753.257-1.802.671-2.317 1.14-2.014 1.47-1.158 1.002-1.03 1.479-.377.8-.625 1.461-.984 3.06-.56.781-1.04 1.011-.652.395-1.26.469-1.986.588-.671.404-.79.726-.847 1.765-.285 1.875-.413 1.681.046 2.528.275 2.462-.128 2.509.515 2.178.367.91.35.459-.019.221.331.147.488.947.22 1.056.083.736-.184 1.121v2.15l.386 2.886.276.91.35.661 1.7 2.426.837.019 1.793-.552.395.368.037.478-.294.652-.368.368-.487.303-1.82.634-.773.726-.423.809-.037 1.378-.294.616-.45.496-.506.267H42.85l-1.655-.405-3.64-.312-3.816-.542-6.206-.386-3.466-.074-5.406-.625-3.209-.239-1.728.01-4.763-.432-8.66-.359L.227 34.681l1.397-.359 1.315-.579 27.71-9.051.02-.12 1.535-.266.312-.322.929-.312 12.08-3.86L85.669 7.406l6.114-2.04 2.041-.423z"}',	'2025-12-26 13:22:38',	'2025-12-27 07:02:15'),
(284,	118,	NULL,	NULL,	NULL,	NULL,	'{"url": "https://www.youtube.com/watch?v=mlDyGFq2q-A", "description": "<p><span>Fairies have been showing up in stories since the middle ages. Originating as nymphs in Greek Mythology, magical creatures have shown up throughout European literature ever since. </span></p>"}',	'2025-12-27 16:59:20',	'2025-12-27 18:15:28'),
(311,	80,	NULL,	NULL,	NULL,	'uz',	'{"title": "Chiroyli manzilgohlar"}',	'2025-12-28 06:14:41',	'2025-12-28 06:14:41'),
(281,	118,	NULL,	NULL,	NULL,	'uz',	'{"title": "Arabiston Respublikasidagi “O‘zbekiston” o‘zbek milliy-madaniy avtonomiyasi"}',	'2025-12-27 16:59:20',	'2025-12-27 18:15:28'),
(312,	80,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-28 06:14:41',	'2025-12-28 06:14:41'),
(313,	80,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-28 06:14:41',	'2025-12-28 06:14:41'),
(338,	90,	NULL,	NULL,	NULL,	'uz',	'{"title": "Roma"}',	'2025-12-28 06:23:24',	'2025-12-28 06:23:24'),
(158,	57,	NULL,	NULL,	NULL,	'ru',	'{"url_title": null}',	'2025-12-26 11:29:45',	'2025-12-29 13:33:55'),
(159,	57,	NULL,	NULL,	NULL,	'en',	'{"url_title": null}',	'2025-12-26 11:29:45',	'2025-12-29 13:33:55'),
(161,	58,	NULL,	NULL,	NULL,	'ru',	'{"url_title": null}',	'2025-12-26 11:30:11',	'2025-12-29 13:34:24'),
(162,	58,	NULL,	NULL,	NULL,	'en',	'{"url_title": null}',	'2025-12-26 11:30:11',	'2025-12-29 13:34:24'),
(156,	58,	52,	'Url',	'url',	NULL,	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW"}',	'2025-12-26 11:10:39',	'2025-12-29 13:34:24'),
(168,	62,	NULL,	NULL,	NULL,	NULL,	'{"code": "UZ-BU", "path": "m387.311 352.308-3.466 3.299-3.08 2.04-.524.101-4.046 4.329-.322.946.138.791.653 1.102.763.809.754 1.075.212.469-.258.561-16.659 6.102-5.158 5.725-1.959-2.114-.377-.027-1.084.275-1.931 1.112-.92.239-.965.018-1.269-.165-.781-.386-2.713-2.233-2.638-1.838-6.243-4.797-1.673-1.075-4.303-3.162-1.205-1.185-1.057-1.277-.266-.579-.377-.34-.718-1.131-3.282-3.179-1.857-1.976-3.65-2.582-4.027-2.408-4.091-2.895-3.899-2.555-9.433-6.708-6.399-4.384-13.175-9.677-1.085-1.011-.836-1.185-.148-.487-.183-.827.055-.506-.267-.643-.119-1.608-1.297-1.902.019-.598.634-1.093.074-2.417-.35-.928-.129-1.131-.542-1.874-.055-1.048-.212-.708.037-.551.331-.836-.027-.929-.69-1.231-1.066-.965-.662-.974-.056-.469.46-1.415.267-1.351-.037-.285-1.214-.478-1.213-.771-1.214-1.333-1.168-.524-1.213-.799-.368-.515 5.774-6.993 4.22-4.715.726-3.492.028-1.415-.625-1.057-5.434-6.139-2.979-3.06 10.058-4.65-12.669-17.626.515-.257 3.374-.846 12.458-2.95.965-.073 3.071 6.157 1.278 1.893 1.977 2.132 2.197 1.425 3.255 1.746 1.443 1.452 1.913 3.997 1.287 4.733.524 1.277.809-.082.414-.34 1.875-.046 2.906.836 4.946 2.123 7.797 4.227 9.037 5.238 1.95 1.535.514.965.313 1.369-.441 2.049 3.126-.082 2.427-.212.506-.174 4.946-11.203.956-1.001 2.014-1.075.809.137 1.535 1.774.092 6.993 14.885 1.737.175-.45.754-4.126.524-.175 4.615-.533 3.485-.055 2.087-.349 1.039-2.463.662-1.93.414-.175.891.203.727 2.6 1.967 9.3 1.048 1.011.736.386.947.313 7.934 1.093 5.452.579 7.328 1.048-1.287 8.51-3.669 2.582-.156.947-1.333 3.795-3.08 3.804-.588.561-.865.349-3.539-.211-2.667-.496-1.848-.91-.754-.726-1.838-1.195-1.894-.11-1.021.441-.331.57.331 3.051-.414 4.007-1.186 5.247-2.326 4.393-1.958 2.269-4.045 2.454-.819.303-1.305 2.5 3.926 5.321 1.094 1.057 6.491 2.453.993.056 2.942-.717 4.514 3.391 4.036 8.629.331 1.057z"}',	'2025-12-26 13:26:58',	'2025-12-27 07:03:12'),
(170,	64,	NULL,	NULL,	NULL,	NULL,	'{"code": "UZ-JI", "path": "m533.83 344.342-.441.23-.193 1.415-.294.937-.754.671-.993-.349-1.058.239-2.721-.432-1.71.744-.359-.11-.726-.699-.469-.22-1.305-.294-1.628-.193-1.158.129-.855.238-.681-.119-.937-.542-.681.092-2.05-.147-.892-.441-.68-.175-1.002.083-.552-.138-1.011-.781-.837-.34-1.26-.074-.845.092-1.72-.772-.882-.809-1.269-.073-2.234-1.516-.644.358-1.112.294-1.775-.763-.368-.009-.809.937-1.002.35-.588.413-.864 1.406-.534.147-1.314.028-3.66 1.369-.11.625.184 1.48-.377.468-2.041-.505-.423.101-.322.735-.018 1.204.294.469-4.165-3.511-.947-.965-.598-.882-.193-.873-.018-3.823.092-.34 2.96-4.815.699-.837.635-.496 1.985-.947 1.416-.349 1.196-.138-.074-.937-.984-5.477-.193-.221-10.913-2.325-4.423-.367-1.949-.735-5.36-3.612-.322-3.409.092-.322 1.14-.267.221-.147.414-1.231.064-.744-1.324-2.583-1.71-1.525-.772-3.768-.092-3.612.129-.707.763-1.682-.009-1.011-.883-2.003-4.239-.092-7.162-.846.671-1.645 4.073-7.894 2.869-4.889.257-.68-1.443-6.304-.212-.487-.229-.211-3.926-.965-.874-.533-.662-1.167-1.039-9.778 6.17-.202.266-2.693.203.037.478-4.375 15.997 1.204 4.266.478 2.501.009.782.515.799.119 1.15-.376 1.167-.184 14.168.432 1.297 1.185.8.212 1.884 2.288 3.053 2.83 1.351-1.194.773 1.093 2.804-1.819 1.269 1.185.542-.239.726.432-2.271.487-1.296 1.36 1.278 3.171-1.361 1.351.074 4.797-3.742.138-.671 2.095 1.324 1.838 2.243.625 5.305 3.124 3.301 3.704 3.484 1.231.405.349-.157 2.61-.312.561-1.71-.092-1.931.496-.441 4.494.147.248 1.94-.937.303-.092.147.184-.138.707-.708 1.838-4.551 10.146-.184 1.397.138.882.313.827.607.891.294.046 6.022.285 4.202-.156 3.696-.754 2.096-.726 6.555-1.507.285.625-.928 5.891-1.425.257-.083.129-2.657.772-.221.551.791.735 2.409 1.416 1.131-.028 1.976-.414 1.205-.514 2.638-.745 1.131-.505 3.154-.818 1.544-.193 2.897-.101.772.597.377 1.177.414 2.187-.295.606-.689.055-1.407-.33-.827-.01-.69.028-1.397.322-1.076.808-.193.956-.138.11-.423-.239-.276-1.185-.671-1.011-.598-.092-.533.184-.221.257-.027.487.322.524.864.864.046.579-.377 1.241.027.275 1.38 1.287 2.399 2.977.497 1.011.037.689-.184.635-.653.661-.745.092-.57-.285-.552-.864-.064-1.635-1.241-2.95-.662-.809-.368-.064-.432.202-.11.367.073 1.011.956 1.82.745 1.764.028.634-.331.736-.331.248-.846.193-.276.358-.248 1.314-.221.202-.423.102-.515-.386-.285-1.168-.717-.817-.423-.12-1.351 1.13-.469-.275-1.103-.138-.083 1.057.276 1.534-.294 1.204-.451.781-.23.846-.276.515-.588.248-.579.036-.386.469.248.588 1.728 2.463-.248 1.581-2.179 2.463z", "offset": "-15,-35"}',	'2025-12-26 13:28:53',	'2025-12-27 07:30:47'),
(424,	31,	NULL,	NULL,	NULL,	'en',	'{"title": null, "description": null}',	'2025-12-29 09:27:38',	'2025-12-29 09:27:50'),
(447,	135,	NULL,	NULL,	NULL,	NULL,	'{"year": "2023 mavzum"}',	'2025-12-29 12:34:27',	'2025-12-30 10:29:24'),
(314,	81,	NULL,	NULL,	NULL,	'uz',	'{"title": "Eng chiroyli joy"}',	'2025-12-28 06:14:55',	'2025-12-28 06:14:55'),
(315,	81,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-28 06:14:55',	'2025-12-28 06:14:55'),
(316,	81,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-28 06:14:55',	'2025-12-28 06:14:55'),
(339,	90,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-28 06:23:24',	'2025-12-28 06:23:24'),
(340,	90,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-28 06:23:24',	'2025-12-28 06:23:24'),
(362,	101,	NULL,	NULL,	NULL,	'uz',	'{"title": "Sevila"}',	'2025-12-28 06:27:43',	'2025-12-28 06:27:43'),
(363,	101,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-28 06:27:43',	'2025-12-28 06:27:43'),
(364,	101,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-28 06:27:43',	'2025-12-28 06:27:43'),
(386,	109,	NULL,	NULL,	NULL,	'uz',	'{"title": "Championship"}',	'2025-12-28 06:35:07',	'2025-12-28 06:35:07'),
(387,	109,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-28 06:35:07',	'2025-12-28 06:35:07'),
(388,	109,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-28 06:35:07',	'2025-12-28 06:35:07'),
(288,	119,	NULL,	NULL,	NULL,	NULL,	'{"url": "https://www.youtube.com/embed/pDgzE2tXZEs?si=LLxCo7PYWkSD18xd", "description": "<p><span>Fairies have been showing up in stories since the middle ages. Originating as nymphs in Greek Mythology, magical creatures have shown up throughout European literature ever since. In many stories, </span></p>"}',	'2025-12-27 17:01:20',	'2025-12-29 11:20:16'),
(405,	126,	124,	'Nomi',	'nomi-5',	'uz',	'{"title": "Pittsburgdagi uzbeklar jamiyati", "description": "Tashkilotning asosiy maqsad va vazifalari:  АQShdagi vatandoshlarni birlashtirish, ular oʼrtasida hamjixatlikni mustahkamlash, oʼzbek urf-odatlari, qadriyatlari va ona-tilini asrab qolish"}',	'2025-12-29 08:15:50',	'2025-12-29 08:15:50'),
(406,	126,	124,	'Nomi',	'nomi-5',	'ru',	'{"title": null, "description": null}',	'2025-12-29 08:15:50',	'2025-12-29 08:15:50'),
(407,	126,	124,	'Nomi',	'nomi-5',	'en',	'{"title": null, "description": null}',	'2025-12-29 08:15:50',	'2025-12-29 08:15:50'),
(408,	126,	124,	'Nomi',	'nomi-5',	NULL,	'{"boss_at": "12/12/2022", "date_at": "12/20/2018"}',	'2025-12-29 08:15:50',	'2025-12-29 08:15:50'),
(503,	152,	149,	'Yillar',	'yillar-2',	'en',	'{"title": null}',	'2025-12-30 16:54:48',	'2025-12-31 00:58:19'),
(444,	135,	NULL,	NULL,	NULL,	'uz',	'{"title": "2023 yil"}',	'2025-12-29 12:34:27',	'2025-12-30 10:29:24'),
(445,	135,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-29 12:34:27',	'2025-12-30 10:29:24'),
(446,	135,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-29 12:34:27',	'2025-12-30 10:29:24'),
(501,	152,	149,	'Yillar',	'yillar-2',	'uz',	'{"title": "2022 mavsum"}',	'2025-12-30 16:54:48',	'2025-12-31 00:58:19'),
(502,	152,	149,	'Yillar',	'yillar-2',	'ru',	'{"title": null}',	'2025-12-30 16:54:48',	'2025-12-31 00:58:19'),
(173,	67,	NULL,	NULL,	NULL,	NULL,	'{"code": "UZ-QA", "path": "m387.311 352.308 1.075-.744.736-.35 1.278-.34 2.39-.367.488-.193.367-.395.635.147 16.135.487 1.37-.166 1.205-.505 1.314-.983.175-.249.037-.303 3.963.809 3.034 3.501 2.546 4.273.083 1.37.202.193.662.229 2.832.717 1.407-.037 2.032-1.268 3.006-1.534 6.942-1.719.579.147 1.076.689 1.517 1.324 1.507 1.057.635.303.276-.009 3.346-1.434.754-.882 1.011-1.636.764-.873.744-.257 1.094-.055 7.88 1.406.579.615.45 1.213-.101 1.158-.423 1.562.056.533.303.442.855.487 1.738.138 3.567-.221.754-.193.386-.441.101-.322-.064-1.636.395-.441.809-.046 4.101 1.167 2.353 1.002 3.531 1.094 1.517.294.919-.212.35 1.452 1.278 2.215.671.689.882.487 1.619.34.57.377.781.267.736.018.947-.202.993.175.937.432.598 1.534.524.212 1.462.073.257.267-.009.523-.322.469-.193 2.298.405 1.157.119 1.884.359.515-.736.754-.901.533-3.668.211-.791.239-.469.23-.616.523-.413.772-.056.368.497 2.886.938 1.929.349.423.138.478.12 3.86-1.232 3.951-.497-.165-1.296-1.314-.92-.294-1.314-.065-1.049.304-.413.312-.543.588-.744 1.195-1.095 2.04-8.173 8.161-.662 3.078-.147 1.397-.34 1.287-.414.799-2.225 2.233-1.683 1.176-3.254 1.701-10.647 11.119-.395 1.149-.956 3.924.248.827-2.198-2.564-.965-.616-1.361-.56-2.933-.322-2.418.754-.524.055-1.158-.303-1.131-.984-2.565-1.507-1.683-1.902-1.186-2.141-.432-.276-1.747-.101-3.218-.947-.579-.367-.459-.892-1.076-.367-.8-.12-.699-.735-.432-.156-1.259.064-.764-.248-.827-.551-1.756-1.802-.828-.22-.983.009-.892.248-.671 1.287-.515-.065-.129.092-.147.589-.34.156h-.487l-4.303-.882-9.13-3.603-1.793-1.029-5.893-3.796-1.701-1.369-2.482-2.316-6.997-6.984-.533-.358-2.51-1.149-3.218-1.222-2.703-1.259-1.591-1.158-.561-.607-8.256-5.1-2.501-1.746-5.093-4.714-1.094-1.204 5.157-5.725 16.66-6.102.258-.561-.212-.469-.754-1.075-.763-.809-.653-1.102-.138-.791.322-.946 4.046-4.329.524-.101 3.08-2.04z", "offset": "5,0"}',	'2025-12-26 13:30:35',	'2025-12-27 07:31:36'),
(175,	69,	NULL,	NULL,	NULL,	NULL,	'{"code": "UZ-SI", "path": "m548.082 310.43-1.48.891-1.186.304-2.197-.616-.902.404-5.001 1.599.929-5.89-.285-.625-6.556 1.507-2.096.726-3.696.753-4.202.157-6.022-.285-.294-.046-.607-.892-.312-.827-.138-.882.184-1.397 4.551-10.145.708-1.838.137-.708-.147-.184-.303.092-1.94.938-.147-.249.441-4.493 1.931-.497 1.71.092.313-.56.156-2.61 3.356 2.858 1.737-.46 1.756 1.443-.496 1.048 4.478 1.314.744-1.029 2.207.165 3.962-1.59-.772-1.92-2.216-1.186-1.039-3.023-3.015-4.163.8-6.847-.92-2.325.791-.827-.809-1.277-3.328-.212-.01-1.194 4.524.285.294.551 2.17-1.351-.019.221.286.082.183 1.103.616.23.736-.34.864.193.34.349-.128.303-1.324.506-.175.321-.028.515.497.974.368-.303 4.468 5.073 3.19 3.189 4.524 4.08 4.33 3.593.57.074 2.786 3.887-.46 4.319-.79 4.889-.929 4.558.018.974.129.57.46.965-.23 4.347-1.021-.322-2.362-.018-3.09.321z", "offset": "0,-20"}',	'2025-12-26 13:31:46',	'2025-12-27 07:32:20'),
(280,	117,	NULL,	NULL,	NULL,	NULL,	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW", "description": "<p><span>Use a graphic organizer and some writing paper to write your very own fairy tale! Start with an introduction to describe the good characters and the setting. Then, write about the problem, or what goes wrong in your story. Next, write about the solution to that problem. Finally, end your story by saying that the good </span></p>"}',	'2025-12-27 16:57:51',	'2025-12-27 18:14:46'),
(172,	66,	NULL,	NULL,	NULL,	NULL,	'{"code": "UZ-NW", "path": "m458.232 252.709-.478 4.375-.202-.037-.267 2.692-6.169.203 1.039 9.778.662 1.167.874.533 3.925.965.23.211.212.487 1.443 6.304-.257.68-2.869 4.889-4.073 7.894-.671 1.645-1.158-3.189-1.71-2.444-.892-1.029-.534-.249-1.939 1.765-2.161 1.185-1.269.101-1.682-.229-.957-.726-.947-1.425-1.094-.082-1.02.174-.837.993-1.977 4.301-.542 4.512.23.321.496.184.341.662-.157 2.086-.809 5.624-.791 1.231-2.114 5.579.184.9.735.092 1.315-.845.754.064.165.414-.128 1.029-.396.57-3.208 3.023-1.499.698-8.192 1.774-1.122-.184-4.946-2.113-1.922-1.048-.422-.956-.92-1.424-5.038-1.902-.929-.157-.478.258-.322.523-.147.644.046.891-.386 5.33-1.682 5.091-.653 1.186-.478.276-.543.009-2.62-.809-.919-.45-7.953 2.683-.46.322-.074.34.304.707 1.361 1.406.891.745.865 1.332 1.241 4.797-.156.892-.469 1.342-1.076 2.15-.037.579.156.744.745 1.664 1.949 3.492-.367.395-.488.193-2.39.367-1.278.34-.736.35-1.075.744-.267-3.106-.331-1.057-4.036-8.629-4.515-3.391-2.942.717-.993-.055-6.491-2.454-1.094-1.057-3.925-5.321 1.305-2.499.818-.304 4.046-2.453 1.958-2.27 2.326-4.393 1.186-5.247.414-4.007-.331-3.051.331-.57 1.02-.441 1.894.11 1.839 1.195.754.726 1.848.91 2.666.496 3.54.211.864-.349.589-.56 3.08-3.805 1.333-3.795.156-.947 3.669-2.582 1.287-8.51-7.328-1.048-5.452-.579-7.934-1.093-.947-.313-.736-.386-1.048-1.01-1.968-9.301-.726-2.6-.892-.202-.413.174-.662 1.93-1.039 2.463-2.087.349-3.485.055-4.615.533-.524.175-.754 4.126-.175.45-14.885-1.736-.092-6.994-1.535-1.773-.81-.138-2.013 1.075-.956 1.002-4.947 11.202-.505.174-2.428.212-3.125.083.441-2.05-.313-1.369-.515-.965-1.949-1.535-9.038-5.238-7.796-4.227-4.946-2.123-2.906-.836-1.875.046-.414.34-.809.082-.524-1.277-1.287-4.733-1.913-3.997-1.443-1.452-3.255-1.746-2.197-1.425-1.977-2.132-1.278-1.893-3.071-6.157-.965.074-12.458 2.949-3.374.846-.515.257-19.234-26.347 11.814-6.525-6.197-11.165 1.159-14.492 25.431-47.98-14.196-3.842-5.378-9.64 38.945-7.581 18.802-3.318 3.2.625 2.767.331 8.918.965 5.453.349 2.206.386 13.037 1.002 12.541.615.184-.137.781-.037 9.672-4.751 6.436-2.812 4.027-2.013 1.894-.469.993-.101 1.536.065.763.294.698.533.911 1.047 5.268 11.598 1.857 1.755 3.31 3.437 10.003 8.896 1.379 5.578 6.105 19.657 11.557-5.44.322 28.764-.046 6.625-.534-.165-2.225-1.13h-.229l-.092 6.065-.837 1.011-.276 15.292.065 1.975 22.194 2.684 3.199 36.483z"}',	'2025-12-26 13:29:58',	'2025-12-27 07:05:08'),
(389,	110,	NULL,	NULL,	NULL,	'uz',	'{"title": "B seria"}',	'2025-12-28 06:35:30',	'2025-12-28 06:35:30'),
(390,	110,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-28 06:35:30',	'2025-12-28 06:35:30'),
(317,	82,	NULL,	NULL,	NULL,	'uz',	'{"title": "Golsdo"}',	'2025-12-28 06:15:23',	'2025-12-28 06:15:23'),
(318,	82,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-28 06:15:23',	'2025-12-28 06:15:23'),
(319,	82,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-28 06:15:23',	'2025-12-28 06:15:23'),
(341,	91,	NULL,	NULL,	NULL,	'uz',	'{"title": "Latsio"}',	'2025-12-28 06:23:42',	'2025-12-28 06:23:42'),
(342,	91,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-28 06:23:42',	'2025-12-28 06:23:42'),
(343,	91,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-28 06:23:42',	'2025-12-28 06:23:42'),
(365,	102,	NULL,	NULL,	NULL,	'uz',	'{"title": "Atalanta"}',	'2025-12-28 06:28:55',	'2025-12-28 06:28:55'),
(366,	102,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-28 06:28:55',	'2025-12-28 06:28:55'),
(367,	102,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-28 06:28:55',	'2025-12-28 06:28:55'),
(391,	110,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-28 06:35:30',	'2025-12-28 06:35:30'),
(409,	127,	125,	'Nomi',	'nomi-6',	'uz',	'{"title": "Pittsburgdagi uzbeklar jamiyati", "description": "Tashkilotning asosiy maqsad va vazifalari:  АQShdagi vatandoshlarni birlashtirish, ular oʼrtasida hamjixatlikni mustahkamlash, oʼzbek urf-odatlari"}',	'2025-12-29 08:19:13',	'2025-12-29 08:19:13'),
(410,	127,	125,	'Nomi',	'nomi-6',	'ru',	'{"title": null, "description": null}',	'2025-12-29 08:19:13',	'2025-12-29 08:19:13'),
(411,	127,	125,	'Nomi',	'nomi-6',	'en',	'{"title": null, "description": null}',	'2025-12-29 08:19:13',	'2025-12-29 08:19:13'),
(412,	127,	125,	'Nomi',	'nomi-6',	NULL,	'{"boss_at": "12/12/2022", "date_at": "12/20/2018"}',	'2025-12-29 08:19:13',	'2025-12-29 08:19:13'),
(425,	130,	NULL,	NULL,	NULL,	'uz',	'{"title": "\"Vatandoshlar\" jamoat fondi — bu xorijdagi o‘zbekistonlik vatandoshlar bilan aloqalarni mustahkamlash, ularning huquq va manfaatlarini qo‘llab-quvvatlash, shuningdek, ularni O‘zbekiston taraqqiyotiga jalb etish maqsadida tashkil etilgan notijorat tashkilotdir."}',	'2025-12-29 09:59:02',	'2025-12-29 09:59:02'),
(426,	130,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-29 09:59:02',	'2025-12-29 09:59:02'),
(427,	130,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-29 09:59:02',	'2025-12-29 09:59:02'),
(504,	153,	149,	'Yillar',	'yillar-2',	'uz',	'{"title": "2023mavsum"}',	'2025-12-30 16:58:03',	'2025-12-31 00:59:05'),
(505,	153,	149,	'Yillar',	'yillar-2',	'ru',	'{"title": null}',	'2025-12-30 16:58:03',	'2025-12-31 00:59:05'),
(506,	153,	149,	'Yillar',	'yillar-2',	'en',	'{"title": null}',	'2025-12-30 16:58:03',	'2025-12-31 00:59:05'),
(179,	73,	NULL,	NULL,	NULL,	NULL,	'{"code": "TK", "path": "m569.056 244.898.046-.524-.083-.128h-.221l-.275.229-.12.34-.69.212-.652.689-.644-.064-.331.606-.506-.248-.524.101-1.471-.772-.183.019-.24.312-.753.34-.947-.193-.102-.165h-.128l-1.104 1.213-.092.781-.413 1.149-.129.799-.11 1.342.082.312.855.202.267.193.304-.165.441.23.294.772.147.046.331-.212.156.23.635.119.524-.055.009-.441.993-.799 1.002.082.662.212-.147.377.395.863.341.23.579-.083.965-.965.35-.799-.065-1.084-.349-.671-.267-.248.441-.699.313-.23-.119-.312.046-.441.266-.625.138-.11.368.046-.083-.607.258-.248.11-.441-.101-.294-.221-.129z", "offset": "0,-30"}',	'2025-12-26 13:33:53',	'2025-12-27 07:33:42'),
(295,	74,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-28 06:10:13',	'2025-12-28 06:10:13'),
(320,	83,	NULL,	NULL,	NULL,	'uz',	'{"title": "Futbol"}',	'2025-12-28 06:17:03',	'2025-12-28 06:17:03'),
(183,	61,	NULL,	NULL,	NULL,	'uz',	'{"title": "Andijon", "description": "Viloyatning eng qadimiy shahri va markazi bo‘lgan Termizda va uning atrofida zardushtiylar, nestorianlar, buddistlar kabi turli xalqlarning shaharlari va qalʼalarining xarobalari, meʼmorchilik va arxeologiya obidalari, shuningdek islom meʼmorchiligi yodgorliklari saqlanib qolgan. Termizdan uncha uzoq bo‘lmagan joyda esa, fil suyagidan yasalgan shaxmat donalari topilgan,"}',	'2025-12-26 13:39:07',	'2025-12-27 07:29:40'),
(321,	83,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-28 06:17:03',	'2025-12-28 06:17:03'),
(322,	83,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-28 06:17:03',	'2025-12-28 06:17:03'),
(344,	92,	NULL,	NULL,	NULL,	'uz',	'{"title": "Inter"}',	'2025-12-28 06:24:26',	'2025-12-28 06:24:26'),
(184,	61,	NULL,	NULL,	NULL,	'ru',	'{"title": null, "description": null}',	'2025-12-26 13:39:07',	'2025-12-27 07:29:40'),
(185,	61,	NULL,	NULL,	NULL,	'en',	'{"title": null, "description": null}',	'2025-12-26 13:39:07',	'2025-12-27 07:29:40'),
(180,	60,	NULL,	NULL,	NULL,	'uz',	'{"title": "Qoraqalpog''iston Respublikasi", "description": "Viloyatning eng qadimiy shahri va markazi bo‘lgan Termizda va uning atrofida zardushtiylar, nestorianlar, buddistlar kabi turli xalqlarning shaharlari va qalʼalarining xarobalari, meʼmorchilik va arxeologiya obidalari, shuningdek islom meʼmorchiligi yodgorliklari saqlanib qolgan. Termizdan uncha uzoq bo‘lmagan joyda esa, fil suyagidan yasalgan shaxmat donalari topilgan,"}',	'2025-12-26 13:38:23',	'2025-12-27 07:02:15'),
(181,	60,	NULL,	NULL,	NULL,	'ru',	'{"title": null, "description": null}',	'2025-12-26 13:38:23',	'2025-12-27 07:02:15'),
(182,	60,	NULL,	NULL,	NULL,	'en',	'{"title": null, "description": null}',	'2025-12-26 13:38:23',	'2025-12-27 07:02:15'),
(345,	92,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-28 06:24:26',	'2025-12-28 06:24:26'),
(176,	70,	NULL,	NULL,	NULL,	NULL,	'{"code": "UZ-SU", "path": "m527.068 422.243-.947 3.244-.129 1.131-2.114 2.224-1.508 2.848.064 1.443-.432 1.02.083.726-.322.818-2.298 1.075-3.724.644-.745 1.323-2.905 6.203-1.057 1.526-1.26.9-2.105 2.729-.966 2.234-1.167 2.233-1.462 1.406-1.094 3.565-.046 2.353.239 3.685-.515 6.12-.653 2.234-.625.404-.543-1.02-1.379-1.103-.68-.202-1.269.138-.386-.055-.791-.699-.919-.542-.561.083-1.26.505-.616.496-.358.46-.644.083-.386-.598-.386-1.259-.68-.661-.754-.368-.616.129-.524.349-1.72 1.581-1.241.422-1.057.625-1.159.101-1.691.432-.883.947-1.379.579-.497-.184-.79-.708-.156-1.406-.258-.45-.708-.34-.34-.8-.248-.248-.892-.349-.414-.312-.643.137-.423-.11-1.398-.781-.423-.652.331-1.406-.294-.772-1.591-.791-1.25-1.295-.395-.239-1.775-.662-1.728.119-3.292 1.462-1.452-.175-.754.064-2.051.699-1.792-.451-.874.01-1.011.34-1.471-.34-1.333.211-1.076-.11-1.646.064-1.204.496-.368-1.847.156-.606.396-.57.79-.579 1.039-.533 2.795-.836.276-.671.009-.69-.395-1.01-4.193-5.092-.239-1.369.515-5.164-.266-1.407v-.551l.413-2.858.681-1.645.671-1.029.708-.699.496-1.167.515-.671 2.096-1.222.396-.367.22-.763-.027-.818-.497-.965-.248-.827.956-3.924.396-1.149 10.646-11.119 3.255-1.701 1.683-1.176 2.225-2.233.413-.799.34-1.287.148-1.397.662-3.078 8.173-8.161 1.094-2.04.745-1.195.542-.588.414-.312 1.048-.304 1.315.065.919.294 1.297 1.314.496.165 1.232-3.951-.119-3.86-.138-.478-.35-.423-.937-1.929-.497-2.886.055-.368.414-.772.616-.523.469-.23.791-.239 3.668-.211.901-.533.736-.754.358.487.625.267.837-.294.57.22.956-.662 1.885-.174 1.241.753 1.352.129.965-1.241 1.885-.064.956-.505.414.009 1.02 1.066.938.23 1.692-.91 1.149.128 1.14.754.8 1.691.285.946 2.473 1.93.083.735-.129 1.14-.322.202.276 1.985-1.158.598-.543.827-.947.294-2.298.367-.322.515 2.326 3.382-.331.615-1.462.175-1.167 1.121.386 1.36.8 1.783-.009.414-.433.514-.303 4.88 2.225 2.95.919.744-.34 1.03-.855 1.332-.23.928.414.009 1.361-.597.423.009 1.535.864 1.296 2.206.194.726.073 1.25.202.211 1.232.441 1.333.653.92.634 1.811 2.325.018.349.662 1.213 1.003 1.369-.01.726z", "offset": "5,10"}',	'2025-12-26 13:32:12',	'2025-12-27 07:32:41'),
(177,	71,	NULL,	NULL,	NULL,	NULL,	'{"code": "TO", "path": "m648.862 198.618-.138-.35-.597-.468-.727-.349-3.061-2.757-.864-.497-1.609-.193-1.122-.643-.423-.018-.791.193-1.048.459-1.149 1.066-.625.028-.865-.313-.386.037-1.627 2.059-.938.634-.882.395-1.085.818-.644.018-.974-.928-.479.147-.533.515-.616.671-.772 1.268-.754.606-.506.827-.901.717-.689 1.002-.138 1.158-.837 1.654-1.011 2.748.046.183-.203.442-.68.238-.386-.018-1.131-1.038-.689-.193-.138-.579.101-1.48-.506-.836-2.335-1.278-2.473-2.177-.34-.148-.635.129-.34.423-.276 1.948-.202.34-.892.8-.276.634-1.453.882-.285.459.12 1.076.313 1.277-.074.993-.956.68-.883.284-.45.506-.497-.019-1.066.506-.819 1.195-.983.827-.405.698-.68 1.847-.543.928-2.932 1.471-1.233.882-.671 1.967-.294.275-.303.111-.331-.111-.147-.266.046-.515-.35-.616-.358-.064-.626.184-.239.285-1.517 3.667-2.693 1.102-1.104-.955-.68-.304h-.46l-1.535.965-1.876.303-.23-.119-.772.119-.285.184-.184.405-.487.487-.625.303-2.519.597-.479.212-1.121 1.047-.267.469-.873.652-1.196 1.278-.367.496-.46 1.434-.211.257-.681.349-1.121.322-.35-.055-.303.11-1.545 1.314-.616 1.011.019.478.303.496 1.076.699-.313.928-.377.193-2.032-.322-.487.211-.763.037-1.205.322-.432-.019-.919-.533-.515-.128-1.011.119-.331-.11-1.379.294-1.058.634-.588 1.746-.405.46-2.05 1.158-1.048 2.609-.607.423-.469-.055-.542-.533-.267-.11-.469.147-1.82 2.821-.175 2.491-.211.34-1.278 1.075-.276 1.654-.193.129-.782-.138-.625.422-.597.791-1.297 1.259-1.407 1.856-.68 1.057-.441 1.011-1.526 1.92-.662 1.535-.138 1.388-.157.321-1.222 1.112-1.683.662-.956.79 4.468 5.073 3.191 3.189 4.523 4.08 4.33 3.593.57.074 2.786 3.887-.459 4.319-.791 4.889-.929 4.559.009.974.129.569.46.975-.23 4.346 2.344.203.589-.046.965.34 1.002-.083.708-.23 1.196.285 1.802.037 1.029.57.442-.368-.773-1.948-.377-.386-1.268-.248-.377-.386.22-.781-.321-.533.165-.57 1.609.22.763-.055 1.039-.983.009-.836.304-.506-.019-1.112-.956-.763-.386-.459.009-.763-.267-.744-.367-.322.22-.781-.432-.175-.561-1.902-.386-.459.009-.763.322-.377.037-.698-.607-.524-1.232-1.7-.064-.303.248-.589 1.434-.965 1.674-.22.8.156.275-.073.239-.249-.027-.165.368-.689.441-.212.239-1.167-.515-1.13-.313-1.038.194-3.226.055-.294.303-.359.184-.873 1.692-2.38 1.508-.183.606.303 2.326.643 1.113.138.689.68.782 1.571.23 1.094.505.717 1.159.827.671.809.634.101.368.193.46 1.194.276.377.607.138 1.489-.101.855-.542 1.287-2.776.414-.367.653-.193 1.314.377.276-.028.865-.928 1.02-.607.395-.009 1.462.901.193.009 1.085-1.029.699-.451 1.866-.266.763-.331.975-.827 1.315-.515 2.188-2.132.285-.404.257-.8.451-.542.542-.101.947.377 1.048.165 1.343-.864.809-.358.662-.937 1.508-.91 1.103-.028.625-.211.34-.331.469-.928.009-.331-.266-.854.138-.662.625-.754.028-.698.275-.487-.257-1.177.101-.422.349-.258.368-.863.506-.552 1.195-.478.947.23-.184-.386.138-.809-.028-1.608-.22-2.141-.607-1.231-1.756-2.408-.616-6.709 2.731-3.777.625-1.773-.451-.928-.441-.515-.782-.515-1.112-1.332-1.076-.111-.459-.477-.58-1.351-.367-.248-1.205-.515-.984-.165-.891.055-.479.257-.753.092-.865-.221-1.149.083-.579-.34-.147-.34-.157-1.14.074-1.81.257-.68.377-.533 1.168-.496.634-.11 1.177.101 1.526-1.416 1.196.046.781-.367 1.389-1.342.533-.827.276-.211 1.903-1.039.496-.147 1.526-1.038.616-1.232.083-2.031.221-.45.57-.542 1.14-.515 1.995-1.397.303-1.112 1.03-.735.34-.386.681-1.406.965-.992 1.094-.524.598-.046.809.294.377-.009.156-.175.156-.753.203-.184.625.423.956.33.809.01.395-.138.819-.827.276-.469.147-1.673-.837-1.452.313-.827.597-.606.111-.671.156-.267.551-.266h.736l1.719.956.745.184h.708l.965-.478 1.186-1.011.626-.276 1.618-1.663.744-.285 2.464-2.353.993-.377.754-.027 1.168.285.368-.57.643-.496.414-.166.184-.257.092-1.443zm-79.271 47.263-.331.422.083.607-.359-.046-.147.101-.266.625-.046.441.128.313-.312.229-.441.69.524.689.156.505v.818l-.138.506-.873 1.047-.304.212-.588.082-.331-.229-.396-.855.148-.377-.662-.211-.993-.083-.993.8-.019.441-.524.064-.634-.129-.156-.229-.331.211-.148-.046-.303-.772-.441-.23-.304.166-.266-.193-.855-.212-.083-.312.11-1.342.129-.799.414-1.149.092-.772 1.103-1.213h.129l.092.165.947.193.763-.34.239-.312.193-.018 1.471.771.524-.101.506.249.331-.607.652.064.644-.689.552-.101.349-.57.414-.101.036.653.469.422z", "offset": "10,0"}',	'2025-12-26 13:32:47',	'2025-12-27 07:33:01'),
(346,	92,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-28 06:24:26',	'2025-12-28 06:24:26'),
(368,	103,	NULL,	NULL,	NULL,	'uz',	'{"title": "Spezia"}',	'2025-12-28 06:29:11',	'2025-12-28 06:29:11'),
(369,	103,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-28 06:29:11',	'2025-12-28 06:29:11'),
(370,	103,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-28 06:29:11',	'2025-12-28 06:29:11'),
(413,	128,	124,	'Rahbar',	'rahbar-5',	'uz',	'{"title": "Sadikov Baxodir Talibjonovich", "description": "Sadikov Baxodir Talibjonovich"}',	'2025-12-29 08:22:05',	'2025-12-29 08:56:13'),
(414,	128,	124,	'Rahbar',	'rahbar-5',	'ru',	'{"title": null, "description": null}',	'2025-12-29 08:22:05',	'2025-12-29 08:56:13'),
(415,	128,	124,	'Rahbar',	'rahbar-5',	'en',	'{"title": null, "description": null}',	'2025-12-29 08:22:05',	'2025-12-29 08:56:13'),
(416,	128,	124,	'Rahbar',	'rahbar-5',	NULL,	'{"email": "sattarov@vatandoshlarfondi.uz", "phone": "+998(55) 502-22-55"}',	'2025-12-29 08:22:05',	'2025-12-29 08:56:13'),
(285,	119,	NULL,	NULL,	NULL,	'uz',	'{"title": "BAA Respublikasidagi “O‘zbekiston” o‘zbek milliy-madaniy avtonomiyasi"}',	'2025-12-27 17:01:20',	'2025-12-29 11:20:16'),
(428,	131,	NULL,	NULL,	NULL,	'uz',	'{"title": "Anor Tanlovi"}',	'2025-12-29 12:29:53',	'2025-12-29 13:02:43'),
(487,	148,	NULL,	NULL,	NULL,	'uz',	'{"title": "Anor Loyihasi", "description": "Anor ijtimoiy va ixtososlashgan milliy loyihaga hush kelibsiz"}',	'2025-12-30 16:43:36',	'2025-12-30 16:43:36'),
(488,	148,	NULL,	NULL,	NULL,	'ru',	'{"title": null, "description": null}',	'2025-12-30 16:43:36',	'2025-12-30 16:43:36'),
(489,	148,	NULL,	NULL,	NULL,	'en',	'{"title": null, "description": null}',	'2025-12-30 16:43:36',	'2025-12-30 16:43:36'),
(490,	148,	NULL,	NULL,	NULL,	NULL,	'{"url": "https://www.youtube.com/watch?v=MOsTpgKIGT4&list=RD7zEhsnoWlt0&index=2"}',	'2025-12-30 16:43:36',	'2025-12-30 16:43:36'),
(515,	156,	NULL,	NULL,	NULL,	'uz',	'{"title": "Universitet Tanlovi", "description": "Universitetlar haritasi"}',	'2025-12-31 01:02:51',	'2025-12-31 01:02:51'),
(516,	156,	NULL,	NULL,	NULL,	'ru',	'{"title": null, "description": null}',	'2025-12-31 01:02:51',	'2025-12-31 01:02:51'),
(517,	156,	NULL,	NULL,	NULL,	'en',	'{"title": null, "description": null}',	'2025-12-31 01:02:51',	'2025-12-31 01:02:51'),
(518,	156,	NULL,	NULL,	NULL,	NULL,	'{"url": "https://www.youtube.com/watch?v=mlDyGFq2q-A"}',	'2025-12-31 01:02:51',	'2025-12-31 01:02:51'),
(186,	62,	NULL,	NULL,	NULL,	'uz',	'{"title": "Buxoro", "description": "Viloyatning eng qadimiy shahri va markazi bo‘lgan Termizda va uning atrofida zardushtiylar, nestorianlar, buddistlar kabi turli xalqlarning shaharlari va qalʼalarining xarobalari, meʼmorchilik va arxeologiya obidalari, shuningdek islom meʼmorchiligi yodgorliklari saqlanib qolgan. Termizdan uncha uzoq bo‘lmagan joyda esa, fil suyagidan yasalgan shaxmat donalari topilgan,"}',	'2025-12-26 13:44:40',	'2025-12-27 07:03:12'),
(193,	64,	NULL,	NULL,	NULL,	'ru',	'{"title": null, "description": null}',	'2025-12-26 13:46:34',	'2025-12-27 07:30:47'),
(187,	62,	NULL,	NULL,	NULL,	'ru',	'{"title": null, "description": null}',	'2025-12-26 13:44:40',	'2025-12-27 07:03:12'),
(188,	62,	NULL,	NULL,	NULL,	'en',	'{"title": null, "description": null}',	'2025-12-26 13:44:40',	'2025-12-27 07:03:12'),
(194,	64,	NULL,	NULL,	NULL,	'en',	'{"title": null, "description": null}',	'2025-12-26 13:46:34',	'2025-12-27 07:30:47'),
(296,	75,	NULL,	NULL,	NULL,	'uz',	'{"title": "Togri Yol"}',	'2025-12-28 06:10:28',	'2025-12-28 06:10:28'),
(297,	75,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-28 06:10:28',	'2025-12-28 06:10:28'),
(298,	75,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-28 06:10:28',	'2025-12-28 06:10:28'),
(167,	61,	NULL,	NULL,	NULL,	NULL,	'{"code": "UZ-AN", "path": "m689.854 294.45-.101-3.317-.285-.772-3.687-1.176-2.068-.414-.221.156h-.303l-8.505-1.443-2.059-3.179-.57-.598-2.777-1.433-3.825-.552-.183 1.333-2.786-4.117 1.747-1.112-2.023-2.454 1.866-1.746 1.094-.735 7.898-2.012 3.383.027.525.239.671.515 3.061.68 1.343.138 4.486-.405.488-.248.367-.413 1.159-5.395.22.138.616-.009 2.621-1.241.699-.165 1.121-.846 1.039-1.139.635-.065.137.166 1.214.321.892.625.818.046.726.368.791-.083.717.156.607.295.239 1.075-.092.597-.754 1.397.009.202.166.202.138-.018.423-.662.211-.046.221-.027.432.22.386.359 1.214 2.077.533.634.184 1.838.708.505 1.103.322 1.223.597 1.443.533.506-.184 1.673.267.865-.368.846-.174.625.193 2.032-.515.662.018.754.414 1.397 1.534.349.965.157.138.606.147.469-.036.598-.23.175-.276.588-.303.368-.441.533-.019.322-.193-.138-.496-.533-.367-.322-.451.395-1.305.212-.211.395.009.929 1.342.827.184 1.039.698.874-.478 1.379.064.395.35.211.891-.395 1.599-.395.561-.414.285-2.648 1.112-1.526.22-.579.8-1.067.735-1.287.717-.745.156-.046.211-.8.184-1.232.68-.919.882-1.416.46-1.039-.138-.726.101-.285.331-.046.294.129.404.349.423.028.312-.681.561-.092.386.166 2.518-.065.983-.597.193-.478-.275-.883-.901-1.379-.312-.294.34-.046.698-.8.579-.129.22-.193 1.287-.533.983-.616.147-.386-.036-1.278-1.03-1.352-.064-.634-.349-.837-.8-.469-.165-.625.266-.193-.036-1.26-1.535-.505-.919-1.278-1.075-.368-.175-.901.395-1.011.01-.368.496.138.257 1.03.349.294.285.423.947.965.294.377.514-.037.506-.322.367-.947.092-.248.175-.156.469.129.413.993-.101.239.34.211 1.351.451.487.22.689-1.048 2.454.258.763-.065.588-.156.147-.276.055-1.361-.349-.413-.248-1.425-1.471-.598-.422-.267-.092-.735.275-.294-.193-.46-.652-.267-.193-.827.009-.248-.101-.166-.368.303-1.038-.055-.23-.413-.248z", "offset": "5,-20"}',	'2025-12-26 13:25:28',	'2025-12-27 07:29:40'),
(189,	63,	NULL,	NULL,	NULL,	'uz',	'{"title": "Farg''ona", "description": "Viloyatning eng qadimiy shahri va markazi bo‘lgan Termizda va uning atrofida zardushtiylar, nestorianlar, buddistlar kabi turli xalqlarning shaharlari va qalʼalarining xarobalari, meʼmorchilik va arxeologiya obidalari, shuningdek islom meʼmorchiligi yodgorliklari saqlanib qolgan. Termizdan uncha uzoq bo‘lmagan joyda esa, fil suyagidan yasalgan shaxmat donalari topilgan,"}',	'2025-12-26 13:45:33',	'2025-12-27 07:30:12'),
(190,	63,	NULL,	NULL,	NULL,	'ru',	'{"title": null, "description": null}',	'2025-12-26 13:45:33',	'2025-12-27 07:30:12'),
(191,	63,	NULL,	NULL,	NULL,	'en',	'{"title": null, "description": null}',	'2025-12-26 13:45:33',	'2025-12-27 07:30:12'),
(192,	64,	NULL,	NULL,	NULL,	'uz',	'{"title": "Jizzax", "description": "Viloyatning eng qadimiy shahri va markazi bo‘lgan Termizda va uning atrofida zardushtiylar, nestorianlar, buddistlar kabi turli xalqlarning shaharlari va qalʼalarining xarobalari, meʼmorchilik va arxeologiya obidalari, shuningdek islom meʼmorchiligi yodgorliklari saqlanib qolgan. Termizdan uncha uzoq bo‘lmagan joyda esa, fil suyagidan yasalgan shaxmat donalari topilgan,"}',	'2025-12-26 13:46:34',	'2025-12-27 07:30:47'),
(323,	84,	NULL,	NULL,	NULL,	'uz',	'{"title": "Real"}',	'2025-12-28 06:17:19',	'2025-12-28 06:17:19'),
(324,	84,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-28 06:17:19',	'2025-12-28 06:17:19'),
(325,	84,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-28 06:17:19',	'2025-12-28 06:17:19'),
(347,	96,	NULL,	NULL,	NULL,	'uz',	'{"title": "Saylov"}',	'2025-12-28 06:25:23',	'2025-12-28 06:25:23'),
(348,	96,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-28 06:25:23',	'2025-12-28 06:25:23'),
(349,	96,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-28 06:25:23',	'2025-12-28 06:25:23'),
(371,	104,	NULL,	NULL,	NULL,	'uz',	'{"title": "Sasuolo"}',	'2025-12-28 06:29:41',	'2025-12-28 06:29:41'),
(372,	104,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-28 06:29:41',	'2025-12-28 06:29:41'),
(373,	104,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-28 06:29:41',	'2025-12-28 06:29:41'),
(470,	143,	NULL,	NULL,	NULL,	'uz',	'{"title": "<p><a href=\"http://&lt;iframe width=&quot;560&quot; height=&quot;315&quot; src=&quot;https://www.youtube.com/embed/JhUEpd9GjRI?si=QapSvR0lTl0YTiAp&quot; title=&quot;YouTube video player&quot; frameborder=&quot;0&quot; allow=&quot;accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share&quot; referrerpolicy=&quot;strict-origin-when-cross-origin&quot; allowfullscreen&gt;&lt;/iframe&gt;\" target=\"_blank\"><iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/JhUEpd9GjRI?si=QapSvR0lTl0YTiAp\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen=\"\"></iframe></a><br></p>"}',	'2025-12-30 07:36:01',	'2025-12-30 07:36:01'),
(471,	143,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-30 07:36:01',	'2025-12-30 07:36:01'),
(472,	143,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-30 07:36:01',	'2025-12-30 07:36:01'),
(417,	129,	125,	'Rahbar',	'rahbar-6',	'uz',	'{"title": "Sadikov Baxodir Talibjonovich", "description": "Sadikov Baxodir Talibjonovich"}',	'2025-12-29 08:23:08',	'2025-12-29 08:57:25'),
(418,	129,	125,	'Rahbar',	'rahbar-6',	'ru',	'{"title": null, "description": null}',	'2025-12-29 08:23:08',	'2025-12-29 08:57:25'),
(419,	129,	125,	'Rahbar',	'rahbar-6',	'en',	'{"title": null, "description": null}',	'2025-12-29 08:23:08',	'2025-12-29 08:57:25'),
(420,	129,	125,	'Rahbar',	'rahbar-6',	NULL,	'{"email": "sanayev@vatandoshlarfondi.uz", "phone": "+998(55) 502-22-99"}',	'2025-12-29 08:23:08',	'2025-12-29 08:57:25'),
(430,	131,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-29 12:29:53',	'2025-12-29 13:02:43'),
(431,	131,	NULL,	NULL,	NULL,	NULL,	'{"url": "www.youtube.com/embed/1AHaFE9NOYo?si=IDkDf0Zvw7cyALnS"}',	'2025-12-29 12:29:53',	'2025-12-29 13:02:43'),
(155,	57,	52,	'Url',	'url',	NULL,	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW"}',	'2025-12-26 11:10:22',	'2025-12-29 13:33:55'),
(491,	149,	NULL,	NULL,	NULL,	'uz',	'{"title": "Yoshlar Tanlovi", "description": "Yosh tanlovi Haritasi"}',	'2025-12-30 16:44:29',	'2025-12-30 16:44:29'),
(492,	149,	NULL,	NULL,	NULL,	'ru',	'{"title": null, "description": null}',	'2025-12-30 16:44:29',	'2025-12-30 16:44:29'),
(493,	149,	NULL,	NULL,	NULL,	'en',	'{"title": null, "description": null}',	'2025-12-30 16:44:29',	'2025-12-30 16:44:29'),
(494,	149,	NULL,	NULL,	NULL,	NULL,	'{"url": "www.youtube.com/embed/1AHaFE9NOYo?si=IDkDf0Zvw7cyALnS"}',	'2025-12-30 16:44:29',	'2025-12-30 16:44:29'),
(519,	157,	NULL,	NULL,	NULL,	'uz',	'{"title": "Futbol mavzusi", "description": "Futbol haqida tushuncha"}',	'2025-12-31 01:03:31',	'2025-12-31 01:03:31'),
(520,	157,	NULL,	NULL,	NULL,	'ru',	'{"title": null, "description": null}',	'2025-12-31 01:03:31',	'2025-12-31 01:03:31'),
(521,	157,	NULL,	NULL,	NULL,	'en',	'{"title": null, "description": null}',	'2025-12-31 01:03:31',	'2025-12-31 01:03:31'),
(205,	68,	NULL,	NULL,	NULL,	'ru',	'{"title": null, "description": null}',	'2025-12-26 13:49:13',	'2025-12-27 07:31:55'),
(206,	68,	NULL,	NULL,	NULL,	'en',	'{"title": null, "description": null}',	'2025-12-26 13:49:13',	'2025-12-27 07:31:55'),
(299,	76,	NULL,	NULL,	NULL,	'uz',	'{"title": "Asosiysi"}',	'2025-12-28 06:10:55',	'2025-12-28 06:10:55'),
(198,	66,	NULL,	NULL,	NULL,	'uz',	'{"title": "Navoiy", "description": "Viloyatning eng qadimiy shahri va markazi bo‘lgan Termizda va uning atrofida zardushtiylar, nestorianlar, buddistlar kabi turli xalqlarning shaharlari va qalʼalarining xarobalari, meʼmorchilik va arxeologiya obidalari, shuningdek islom meʼmorchiligi yodgorliklari saqlanib qolgan. Termizdan uncha uzoq bo‘lmagan joyda esa, fil suyagidan yasalgan shaxmat donalari topilgan,"}',	'2025-12-26 13:47:33',	'2025-12-27 07:05:08'),
(199,	66,	NULL,	NULL,	NULL,	'ru',	'{"title": null, "description": null}',	'2025-12-26 13:47:33',	'2025-12-27 07:05:08'),
(200,	66,	NULL,	NULL,	NULL,	'en',	'{"title": null, "description": null}',	'2025-12-26 13:47:33',	'2025-12-27 07:05:08'),
(300,	76,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-28 06:10:55',	'2025-12-28 06:10:55'),
(301,	76,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-28 06:10:55',	'2025-12-28 06:10:55'),
(326,	85,	NULL,	NULL,	NULL,	'uz',	'{"title": "Man City"}',	'2025-12-28 06:20:50',	'2025-12-28 06:20:50'),
(327,	85,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-28 06:20:50',	'2025-12-28 06:20:50'),
(201,	67,	NULL,	NULL,	NULL,	'uz',	'{"title": "Qashqadaryo", "description": "Viloyatning eng qadimiy shahri va markazi bo‘lgan Termizda va uning atrofida zardushtiylar, nestorianlar, buddistlar kabi turli xalqlarning shaharlari va qalʼalarining xarobalari, meʼmorchilik va arxeologiya obidalari, shuningdek islom meʼmorchiligi yodgorliklari saqlanib qolgan. Termizdan uncha uzoq bo‘lmagan joyda esa, fil suyagidan yasalgan shaxmat donalari topilgan,"}',	'2025-12-26 13:48:32',	'2025-12-27 07:31:36'),
(202,	67,	NULL,	NULL,	NULL,	'ru',	'{"title": null, "description": null}',	'2025-12-26 13:48:32',	'2025-12-27 07:31:36'),
(203,	67,	NULL,	NULL,	NULL,	'en',	'{"title": null, "description": null}',	'2025-12-26 13:48:32',	'2025-12-27 07:31:36'),
(204,	68,	NULL,	NULL,	NULL,	'uz',	'{"title": "Samarqand", "description": "Viloyatning eng qadimiy shahri va markazi bo‘lgan Termizda va uning atrofida zardushtiylar, nestorianlar, buddistlar kabi turli xalqlarning shaharlari va qalʼalarining xarobalari, meʼmorchilik va arxeologiya obidalari, shuningdek islom meʼmorchiligi yodgorliklari saqlanib qolgan. Termizdan uncha uzoq bo‘lmagan joyda esa, fil suyagidan yasalgan shaxmat donalari topilgan,"}',	'2025-12-26 13:49:13',	'2025-12-27 07:31:55'),
(328,	85,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-28 06:20:50',	'2025-12-28 06:20:50'),
(350,	97,	NULL,	NULL,	NULL,	'uz',	'{"title": "Golland"}',	'2025-12-28 06:25:45',	'2025-12-28 06:25:45'),
(351,	97,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-28 06:25:45',	'2025-12-28 06:25:45'),
(352,	97,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-28 06:25:45',	'2025-12-28 06:25:45'),
(374,	105,	NULL,	NULL,	NULL,	'uz',	'{"title": "Bornmut"}',	'2025-12-28 06:30:40',	'2025-12-28 06:30:40'),
(375,	105,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-28 06:30:40',	'2025-12-28 06:30:40'),
(376,	105,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-28 06:30:40',	'2025-12-28 06:30:40'),
(421,	28,	NULL,	NULL,	NULL,	'en',	'{"title": null, "description": null}',	'2025-12-29 09:24:21',	'2025-12-29 09:24:21'),
(432,	132,	NULL,	NULL,	NULL,	'uz',	'{"title": "Chinor"}',	'2025-12-29 12:30:29',	'2025-12-29 12:30:29'),
(433,	132,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-29 12:30:29',	'2025-12-29 12:30:29'),
(434,	132,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-29 12:30:29',	'2025-12-29 12:30:29'),
(435,	132,	NULL,	NULL,	NULL,	NULL,	'{"url": null}',	'2025-12-29 12:30:29',	'2025-12-29 12:30:29'),
(457,	139,	NULL,	NULL,	NULL,	'uz',	'{"title": "2024 yil"}',	'2025-12-29 12:44:36',	'2025-12-30 10:29:52'),
(458,	139,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-29 12:44:36',	'2025-12-30 10:29:52'),
(459,	139,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-29 12:44:36',	'2025-12-30 10:29:52'),
(460,	139,	NULL,	NULL,	NULL,	NULL,	'{"year": "2024mavsum"}',	'2025-12-29 12:44:36',	'2025-12-30 10:29:52'),
(495,	150,	148,	'Yillar',	'yillar-1',	'uz',	'{"title": "2022 mavsum"}',	'2025-12-30 16:47:11',	'2025-12-30 19:59:10'),
(496,	150,	148,	'Yillar',	'yillar-1',	'ru',	'{"title": null}',	'2025-12-30 16:47:11',	'2025-12-30 19:59:10'),
(497,	150,	148,	'Yillar',	'yillar-1',	'en',	'{"title": null}',	'2025-12-30 16:47:11',	'2025-12-30 19:59:10'),
(522,	157,	NULL,	NULL,	NULL,	NULL,	'{"url": null}',	'2025-12-31 01:03:31',	'2025-12-31 01:03:31'),
(214,	71,	NULL,	NULL,	NULL,	'ru',	'{"title": null, "description": null}',	'2025-12-26 13:51:53',	'2025-12-27 07:33:01'),
(215,	71,	NULL,	NULL,	NULL,	'en',	'{"title": null, "description": null}',	'2025-12-26 13:51:53',	'2025-12-27 07:33:01'),
(216,	72,	NULL,	NULL,	NULL,	'uz',	'{"title": "Xoramz", "description": "Viloyatning eng qadimiy shahri va markazi bo‘lgan Termizda va uning atrofida zardushtiylar, nestorianlar, buddistlar kabi turli xalqlarning shaharlari va qalʼalarining xarobalari, meʼmorchilik va arxeologiya obidalari, shuningdek islom meʼmorchiligi yodgorliklari saqlanib qolgan. Termizdan uncha uzoq bo‘lmagan joyda esa, fil suyagidan yasalgan shaxmat donalari topilgan,"}',	'2025-12-26 13:52:31',	'2025-12-27 07:33:25'),
(220,	73,	NULL,	NULL,	NULL,	'ru',	'{"title": null, "description": null}',	'2025-12-26 13:53:35',	'2025-12-27 07:33:42'),
(221,	73,	NULL,	NULL,	NULL,	'en',	'{"title": null, "description": null}',	'2025-12-26 13:53:35',	'2025-12-27 07:33:42'),
(222,	74,	60,	'video',	'video',	NULL,	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW"}',	'2025-12-26 13:55:58',	'2025-12-28 06:10:13'),
(226,	78,	61,	'video',	'video-1',	NULL,	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW"}',	'2025-12-26 13:57:53',	'2025-12-28 06:12:16'),
(208,	69,	NULL,	NULL,	NULL,	'ru',	'{"title": null, "description": null}',	'2025-12-26 13:49:52',	'2025-12-27 07:32:20'),
(209,	69,	NULL,	NULL,	NULL,	'en',	'{"title": null, "description": null}',	'2025-12-26 13:49:52',	'2025-12-27 07:32:20'),
(210,	70,	NULL,	NULL,	NULL,	'uz',	'{"title": "Surxondaryo", "description": "Viloyatning eng qadimiy shahri va markazi bo‘lgan Termizda va uning atrofida zardushtiylar, nestorianlar, buddistlar kabi turli xalqlarning shaharlari va qalʼalarining xarobalari, meʼmorchilik va arxeologiya obidalari, shuningdek islom meʼmorchiligi yodgorliklari saqlanib qolgan. Termizdan uncha uzoq bo‘lmagan joyda esa, fil suyagidan yasalgan shaxmat donalari topilgan,"}',	'2025-12-26 13:51:09',	'2025-12-27 07:32:41'),
(217,	72,	NULL,	NULL,	NULL,	'ru',	'{"title": null, "description": null}',	'2025-12-26 13:52:31',	'2025-12-27 07:33:25'),
(218,	72,	NULL,	NULL,	NULL,	'en',	'{"title": null, "description": null}',	'2025-12-26 13:52:31',	'2025-12-27 07:33:25'),
(219,	73,	NULL,	NULL,	NULL,	'uz',	'{"title": "Toshkent sh.", "description": "Viloyatning eng qadimiy shahri va markazi bo‘lgan Termizda va uning atrofida zardushtiylar, nestorianlar, buddistlar kabi turli xalqlarning shaharlari va qalʼalarining xarobalari, meʼmorchilik va arxeologiya obidalari, shuningdek islom meʼmorchiligi yodgorliklari saqlanib qolgan. Termizdan uncha uzoq bo‘lmagan joyda esa, fil suyagidan yasalgan shaxmat donalari topilgan,"}',	'2025-12-26 13:53:35',	'2025-12-27 07:33:42'),
(223,	75,	60,	'video',	'video',	NULL,	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW"}',	'2025-12-26 13:56:16',	'2025-12-28 06:10:28'),
(224,	76,	60,	'video',	'video',	NULL,	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW"}',	'2025-12-26 13:56:35',	'2025-12-28 06:10:55'),
(302,	77,	NULL,	NULL,	NULL,	'uz',	'{"title": "Ajoyib manzil"}',	'2025-12-28 06:11:54',	'2025-12-28 06:11:54'),
(227,	79,	61,	'video',	'video-1',	NULL,	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW"}',	'2025-12-26 13:58:11',	'2025-12-28 06:13:10'),
(207,	69,	NULL,	NULL,	NULL,	'uz',	'{"title": "Sirdaryo", "description": "Viloyatning eng qadimiy shahri va markazi bo‘lgan Termizda va uning atrofida zardushtiylar, nestorianlar, buddistlar kabi turli xalqlarning shaharlari va qalʼalarining xarobalari, meʼmorchilik va arxeologiya obidalari, shuningdek islom meʼmorchiligi yodgorliklari saqlanib qolgan. Termizdan uncha uzoq bo‘lmagan joyda esa, fil suyagidan yasalgan shaxmat donalari topilgan,"}',	'2025-12-26 13:49:52',	'2025-12-27 07:32:20'),
(211,	70,	NULL,	NULL,	NULL,	'ru',	'{"title": null, "description": null}',	'2025-12-26 13:51:09',	'2025-12-27 07:32:41'),
(212,	70,	NULL,	NULL,	NULL,	'en',	'{"title": null, "description": null}',	'2025-12-26 13:51:09',	'2025-12-27 07:32:41'),
(213,	71,	NULL,	NULL,	NULL,	'uz',	'{"title": "Toshkent v.", "description": "Viloyatning eng qadimiy shahri va markazi bo‘lgan Termizda va uning atrofida zardushtiylar, nestorianlar, buddistlar kabi turli xalqlarning shaharlari va qalʼalarining xarobalari, meʼmorchilik va arxeologiya obidalari, shuningdek islom meʼmorchiligi yodgorliklari saqlanib qolgan. Termizdan uncha uzoq bo‘lmagan joyda esa, fil suyagidan yasalgan shaxmat donalari topilgan,"}',	'2025-12-26 13:51:53',	'2025-12-27 07:33:01'),
(303,	77,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-28 06:11:54',	'2025-12-28 06:11:54'),
(304,	77,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-28 06:11:54',	'2025-12-28 06:11:54'),
(225,	77,	61,	'video',	'video-1',	NULL,	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW"}',	'2025-12-26 13:57:36',	'2025-12-28 06:11:54'),
(228,	80,	62,	'video',	'video-2',	NULL,	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW"}',	'2025-12-26 14:17:34',	'2025-12-28 06:14:41'),
(229,	81,	62,	'video',	'video-2',	NULL,	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW"}',	'2025-12-26 14:17:51',	'2025-12-28 06:14:55'),
(230,	82,	62,	'video',	'video-2',	NULL,	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW"}',	'2025-12-26 14:18:09',	'2025-12-28 06:15:23'),
(231,	83,	63,	'video',	'video-3',	NULL,	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW"}',	'2025-12-26 14:18:56',	'2025-12-28 06:17:03'),
(232,	84,	63,	'video',	'video-3',	NULL,	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW"}',	'2025-12-26 14:19:13',	'2025-12-28 06:17:19'),
(233,	85,	63,	'video',	'video-3',	NULL,	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW"}',	'2025-12-26 14:19:30',	'2025-12-28 06:20:50'),
(329,	86,	NULL,	NULL,	NULL,	'uz',	'{"title": "Man United"}',	'2025-12-28 06:22:02',	'2025-12-28 06:22:02'),
(330,	86,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-28 06:22:02',	'2025-12-28 06:22:02'),
(331,	86,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-28 06:22:02',	'2025-12-28 06:22:02'),
(234,	86,	64,	'video',	'video-4',	NULL,	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW"}',	'2025-12-26 14:20:10',	'2025-12-28 06:22:02'),
(236,	88,	64,	'video',	'video-4',	NULL,	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW"}',	'2025-12-26 14:20:46',	'2025-12-28 06:22:17'),
(235,	87,	64,	'video',	'video-4',	NULL,	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW"}',	'2025-12-26 14:20:28',	'2025-12-28 06:22:33'),
(353,	98,	NULL,	NULL,	NULL,	'uz',	'{"title": "Chelsea"}',	'2025-12-28 06:26:01',	'2025-12-28 06:26:01'),
(354,	98,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-28 06:26:01',	'2025-12-28 06:26:01'),
(355,	98,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-28 06:26:01',	'2025-12-28 06:26:01'),
(377,	106,	NULL,	NULL,	NULL,	'uz',	'{"title": "Astron Villa"}',	'2025-12-28 06:30:53',	'2025-12-28 06:30:53'),
(378,	106,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-28 06:30:53',	'2025-12-28 06:30:53'),
(379,	106,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-28 06:30:53',	'2025-12-28 06:30:53'),
(422,	29,	NULL,	NULL,	NULL,	'en',	'{"title": null, "description": null}',	'2025-12-29 09:26:19',	'2025-12-29 09:26:19'),
(436,	133,	NULL,	NULL,	NULL,	'uz',	'{"title": "Malaka oshirish"}',	'2025-12-29 12:31:16',	'2025-12-29 12:31:16'),
(437,	133,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-29 12:31:16',	'2025-12-29 12:31:16'),
(438,	133,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-29 12:31:16',	'2025-12-29 12:31:16'),
(439,	133,	NULL,	NULL,	NULL,	NULL,	'{"url": null}',	'2025-12-29 12:31:16',	'2025-12-29 12:31:16'),
(262,	111,	72,	'video',	'video-13',	NULL,	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW"}',	'2025-12-26 14:34:51',	'2025-12-26 14:34:51'),
(263,	112,	72,	'video',	'video-13',	NULL,	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW"}',	'2025-12-26 14:35:10',	'2025-12-26 14:35:10'),
(264,	113,	72,	'video',	'video-13',	NULL,	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW"}',	'2025-12-26 14:35:23',	'2025-12-26 14:35:23'),
(265,	114,	73,	'video',	'video-14',	NULL,	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW"}',	'2025-12-26 14:35:56',	'2025-12-26 14:35:56'),
(266,	115,	73,	'video',	'video-14',	NULL,	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW"}',	'2025-12-26 14:36:11',	'2025-12-26 14:36:11'),
(267,	116,	73,	'video',	'video-14',	NULL,	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW"}',	'2025-12-26 14:36:27',	'2025-12-26 14:36:27'),
(169,	63,	NULL,	NULL,	NULL,	NULL,	'{"code": "UZ-FA", "path": "m619.468 304.513.092-.607-.212-.505-.68-.607-2.675-1.204-1.499-.303-.919-.368h-.295l-.827.396-.395-.028-.423-.193-.304-.34-.423-1.02-.266-.285-.258-.092-.138-.68-.836-1.626-.055-.561.119-.184.745-.202.919-.744 1.094-.203 1.012-.523 1.884-.662h.736l.432-.377.11-.744.405-.405.129-.817.174-.368.368-.202.543-.074.707.065.442-.331.662-.019.395-.147.8-1.02 1.021-2.04.33-.349.598-.165.625-.671.469-.157.138-.257.377-.073.377-.46.892-.202.368.257.294.028.046-.607-.166-.909.285-.212.258.23.607-.037.404-.533.276-.919.533-.487.055-.239.313-.083.239-.238 4.477-1.149 3.099-.561 6.215-.092v.203l-.34.477-1.251 1.526.764 1.81 1.719 1.71 5.139 2.508.368.074.69-.386 2.776-2.619.699-.91.68-1.332 1.14-.736 3.779-2.049 3.163-.946 2.786 4.117.184-1.333 3.824.551 2.777 1.434.57.597 2.059 3.18 8.505 1.443h.303l.221-.156 2.069.413 3.686 1.176.285.772.102 3.318-.451.037-.984-.239-.358.073-.469 1.268-.276.46-.579.551-.423.221-.34.064-.543-.184-.818-.542-.423.956.414 1.571-.129.313-.588.652-.065.524-.266.368-1.26.376-.956 1.232-.469.349-.736 1.039-1.094.477-.855.791-.11.239.193.459.901.211.901.818-.064.451-1.021.946-.423.993-.266.294-.607.303-.57-.018-1.168-.846-1.857-.432-.441.359-.12.441.046.248.68 1.038.019.487-.69.46-.496-.028-2.29 1.462-1.213.386-.846.606-.322.055-.23-.128-.423-.782-.395-.468-.221-.065-.331-.367-.137-.331.156-1.746-.175-.744-.625-.837-.478-.331-.708-.073-1.131.11-.101.772.221 1.314-.193.873.073.515-.11.184-.267-.028-.745-.882h-.919l-.506.175-.846-.533-1.627-.726-.202-.497.175-1.24-.221-.478-1.195-.028-1.416-.367-.579-.46-1.003-1.13-.377-.248-.45-.138-.46.202-.57.055-.147-.285.083-.358-.294-.23-1.407.588-.69.092-.248-.092-.138-.248-.018-.919-1.416.101-.929-.312-.919-.083-.763.101-1.269.423-.901-.018-.561.193-2.353 1.635-1.793.322-1.903.827-.414.267-.129.248.285.845-.101.892-2.188.064-1.793.321-.248-.082-1.563 1.158-2.271 1.011-1.453.303-1.287.11-2.878.634-.763-.312-1.085-1.967-.294-.809-.662-.358-.487-.864.119-.101.065-1.176.34-.91-.506-1.608z", "offset": "10,-15"}',	'2025-12-26 13:28:16',	'2025-12-27 07:30:12'),
(244,	93,	66,	'video',	'video-7',	NULL,	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW"}',	'2025-12-26 14:27:29',	'2025-12-27 14:23:30'),
(245,	94,	66,	'video',	'video-7',	NULL,	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW"}',	'2025-12-26 14:27:50',	'2025-12-27 14:23:56'),
(246,	95,	66,	'video',	'video-7',	NULL,	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW"}',	'2025-12-26 14:28:05',	'2025-12-27 14:24:21'),
(241,	90,	89,	'video',	'video-6',	NULL,	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW"}',	'2025-12-26 14:26:17',	'2025-12-28 06:23:24'),
(242,	91,	89,	'video',	'video-6',	NULL,	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW"}',	'2025-12-26 14:26:32',	'2025-12-28 06:23:42'),
(243,	92,	89,	'video',	'video-6',	NULL,	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW"}',	'2025-12-26 14:26:48',	'2025-12-28 06:24:26'),
(247,	96,	67,	'video',	'video-8',	NULL,	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW"}',	'2025-12-26 14:28:39',	'2025-12-28 06:25:23'),
(248,	97,	67,	'video',	'video-8',	NULL,	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW"}',	'2025-12-26 14:28:53',	'2025-12-28 06:25:45'),
(249,	98,	67,	'video',	'video-8',	NULL,	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW"}',	'2025-12-26 14:29:06',	'2025-12-28 06:26:01'),
(250,	99,	68,	'video',	'video-9',	NULL,	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW"}',	'2025-12-26 14:29:51',	'2025-12-28 06:27:11'),
(251,	100,	68,	'video',	'video-9',	NULL,	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW"}',	'2025-12-26 14:30:05',	'2025-12-28 06:27:26'),
(252,	101,	68,	'video',	'video-9',	NULL,	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW"}',	'2025-12-26 14:30:18',	'2025-12-28 06:27:43'),
(253,	102,	69,	'video',	'video-10',	NULL,	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW"}',	'2025-12-26 14:30:52',	'2025-12-28 06:28:55'),
(254,	103,	69,	'video',	'video-10',	NULL,	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW"}',	'2025-12-26 14:31:09',	'2025-12-28 06:29:11'),
(255,	104,	69,	'video',	'video-10',	NULL,	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW"}',	'2025-12-26 14:31:24',	'2025-12-28 06:29:41'),
(256,	105,	70,	'video',	'video-11',	NULL,	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW"}',	'2025-12-26 14:32:13',	'2025-12-28 06:30:40'),
(257,	106,	70,	'video',	'video-11',	NULL,	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW"}',	'2025-12-26 14:32:30',	'2025-12-28 06:30:53'),
(258,	107,	70,	'video',	'video-11',	NULL,	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW"}',	'2025-12-26 14:32:43',	'2025-12-28 06:31:08'),
(259,	108,	71,	'video',	'video-12',	NULL,	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW"}',	'2025-12-26 14:33:17',	'2025-12-28 06:32:15'),
(260,	109,	71,	'video',	'video-12',	NULL,	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW"}',	'2025-12-26 14:33:35',	'2025-12-28 06:35:07'),
(261,	110,	71,	'video',	'video-12',	NULL,	'{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW"}',	'2025-12-26 14:33:48',	'2025-12-28 06:35:30'),
(240,	89,	NULL,	NULL,	NULL,	NULL,	'{"code": "UZ-NA", "path": "m688.919 258.371-.46-.772-.423-.266-.413-.064-.414.22-.966-.322-.698-.027-1.729 1.25-.322.073-.625-.275-1.6-1.03-1.048-.285-1.121-.128-1.067.726-.423-.202-.515-.046-1.489-.598-.294-.377.018-.808-.515-.055-.34-.184-.064-.193.588-1.838.846-1.48.717-.735.432-.753.515-1.241-.046-.23-.993-.533-.781-.946-.258-.598.12-1.194-.129-.34-.349-.258-.377.221-.313.515-.745.156-.229-.156-.056-.175.239-1.195-.57-.974-1.287-1.24-.965-2.031-.34-.092-.129.11-.101 1.553-.156.239-.285.064-.194-.377-.091-.624-.285-.249-.35-.027-.579.413-.11.368.377.607-.056.514-.248.193-.386-.239-.377-.652-.092-.423.083-.395.772-1.011.423-.763.064-.432-.22-1.295.119-.276-.055-.68.395-.827-.321-.561-1.048-.046-.331.092-.708.662-.699 1.25-.405.459-1.158.395-.221.322.046.386.294.22 1.049.101.524.212.459.717.12.625-.313 1.121-.404.744-.037.377.735 1.13-.266.607-.607.661-.331.644-.248.9-.202.009-.331-.229-.239.229-.295.662-.551.45-.157.533-.156.037-.23.873-.349.294-.552-.147-.561-.634-.367-.202-.809-.018-.387.321-.616.129-.754-.469-.294.065-1.324 1.58-.046.377.23.708-.239.781v.487l.166.34.79.34.276.662-.818 1.837-.294 1.829-.653 1.48-.028.34-.947 1.029-.487.037-.239-.156-.138-.267-.211-1.626-.212-.451-.726-.763-.359-.174-.496.009-.469.276-.322.377-.211 1.295-.368.699-.736.689-.469.11-.349-.101-.129-.276.203-2.196-.239-1.314-.24-.386-.873-.579-.276-.037-.57.267-.119.367.037.497-.286.211-.257-.055-.395-.974-.295-.009-.321.275-.432.662-.442-.019-.239.138-.763.809-.46.267-.367.027-1.113-.395-.377-.34-.561-.937-.735-.175-1.131-.735-.542.027-2.446 1.664-.515-.184-.496-1.13-.846-.791-.791-.496-.533-.781-.487-.46-.249-.036-.653.294-.432.625-.763 1.893-.276.404-.303.147-.791-.322-.459-.56-.203-.827.028-1.002.68-.873.166-.551-.092-.322-.57-.836-.23-.68-.064-1.645.386-.846.23-1.066-.451-1.884-2.344-3.749-.386-1.075-.175-.147-1.113-.313-.285.028-1.048.781-1.131-.055-1.397.441-.901.772-.377.68-1.545 1.277h-1.912l-.46-.496-.625 1.774-2.731 3.777.616 6.708 1.756 2.408.607 1.231.221 2.142.028 1.608-.138.808.183.386.414-.018.671.368.249.625 1.011.817.064.57.295.221.809 1.093.625.019.505 1.259.929 1.148.359.818 1.02 1.517.423 1.084.248.009.111.34.891.763.515 1.259.763.285.488.432.671.91-.441.349-.157-.083-.266.166.073.294-.175.266-.34.092-.524-.23-.432-1.112-.34 1.14.037.652.294.588.763-.22 1.131.092.781.413-.257.166.827.037.396.211.919.781.202.45.313-.082.239-.239 4.478-1.149 3.107-.561 6.206-.091v.202l-.34.478-1.25 1.525.763 1.81 1.728 1.701 5.13 2.508.368.074.699-.386 2.777-2.619.698-.919.69-1.333 1.131-.726 3.778-2.049 3.163-.947 1.747-1.112-2.023-2.453 1.867-1.737 1.103-.735 7.898-2.013 3.374.028.533.23.671.514 3.062.689 1.342.138 4.487-.404.487-.248.368-.423 1.158-5.385-.386-.239-.413-.533.147-.303 1.158-.276.487-.377.433-.937-.414-.754zm-64.781 13.5-2.924-3.961-1.122-.827-.928-.027-.175-.625.248-.432.671-.515-.248.349 1.104.469 1.388 1.627 1.59 2.159.589 1.452z", "offset": "10,-25"}',	'2025-12-26 14:25:11',	'2025-12-27 07:31:11'),
(174,	68,	NULL,	NULL,	NULL,	NULL,	'{"code": "UZ-SA", "path": "m489.969 359.172-.101.276-1.471-.285-.892.193-3.062 1.057-.211.267v.174l-.92.211-1.517-.294-3.53-1.093-2.354-1.002-4.1-1.167-.809.046-.396.441.065 1.636-.102.322-.386.441-.754.193-3.567.22-1.738-.138-.855-.487-.303-.441-.055-.533.423-1.562.101-1.158-.451-1.213-.579-.616-7.879-1.406-1.094.055-.745.258-.763.873-1.011 1.635-.754.883-3.347 1.433-.276.009-.634-.303-1.508-1.057-1.517-1.323-1.076-.689-.579-.147-6.942 1.718-3.006 1.535-2.032 1.268-1.407.037-2.831-.717-.662-.23-.203-.193-.082-1.369-2.547-4.273-3.034-3.501-3.963-.809-.036.303-.175.248-1.315.984-1.204.505-1.37.165-16.136-.487-.634-.147-1.949-3.492-.745-1.663-.156-.745.036-.579 1.076-2.15.469-1.342.156-.891-1.241-4.797-.864-1.333-.892-.744-1.361-1.406-.303-.708.074-.34.459-.321 7.953-2.684.919.451 2.621.808.542-.009.478-.276.653-1.185 1.683-5.091.386-5.33-.046-.892.147-.643.322-.524.478-.257.928.156 5.039 1.902.919 1.425.423.956 1.922 1.047 4.946 2.114 1.122.184 8.192-1.774 1.498-.698 3.209-3.024.395-.57.129-1.029-.166-.413-.753-.065-1.315.846-.736-.092-.184-.901 2.115-5.578.791-1.231.809-5.625.156-2.086-.34-.661-.497-.184-.229-.322.542-4.512 1.977-4.301.836-.992 1.021-.175 1.094.083.947 1.424.956.726 1.683.23 1.268-.101 2.161-1.186 1.94-1.764.533.248.892 1.029 1.71 2.445 1.159 3.189 7.162.845 4.238.092.883 2.003.009 1.011-.763 1.682-.129.708.092 3.611.772 3.768 1.711 1.526 1.324 2.582-.065.744-.414 1.232-.22.147-1.14.266-.092.322.322 3.409 5.36 3.612 1.949.735 4.422.368 10.913 2.325.194.22.983 5.477.074.938-1.195.138-1.416.349-1.986.946-.635.497-.698.836-2.961 4.815-.092.34.019 3.823.193.873.597.882.947.965 4.165 3.511 2.051 4.292.763 2.113.864 1.792.193.745z", "offset": "5,-10"}',	'2025-12-26 13:31:14',	'2025-12-27 07:31:55'),
(178,	72,	NULL,	NULL,	NULL,	NULL,	'{"code": "XO", "path": "m259.77 287.025-1.159-2.628-.478-.69-.634-.56-.276-.744-.147-2.546-.423-.68-.239-.947-1.122-1.874-.082-1.122.147-1.084-.065-1.819-.137-.442-.23-2.619.211-1.488-.202-.368-.469-.193-.166-.662.019-.588-.267-.744-.68-.864-1.352-.717-.524-.101-.413-.239-.276-.514.174-.864-.34-.965-.432-.8-1.122-.671-1.728-1.819-1.039-.313-1.37-.928-1.866-2.215-.442-.275-1.167-.12-.607-.211-.451-.313-.376-.349-.258-.873-.349-.661-.782-.589-.432-.009-1.195.524-1.627-.129-.681-.202-1.48-.827-1.618-.266-.478.036-.432.285-.754 1.351.055 2.435-.414.736-.257 1.442-.396.837-.321.358-.451.303-.965.147-.138.129-1.536.175-.303-.092-1.214.046-.184-.12-.257.092-.644-.147-2.85-1.36-1.958-2.049-.313-.138-1.848.165-1.213-1.433-4.515-.202-.386.192-.956-.064-2.004.294-2.372-.11-1.545.285-3.613.009-4.376.276-.81-.046-2.39.395-.873-.055-.662-.221-2.979-1.783-2.676-2.389-5.617-3.832-3.099-1.774-1.066-.955-.524-1.14-.019-.634.147-.726.037-2.748.258-1.709.349-.744 1.968-1.838.229-.561v-1.075l-.248-.818-1.039-1.856-1.057-1.406-1.701-2.656-.349-1.379.478-1.139.515-2.068.22-.129.285.019.828.45.919-.018 1.821.661 1.02.487 1.177.965 1.094-.027.717.579.754.248.239-.368.671.009.239-.147.028-.404-.478-.643-1.039-.818-1.067-1.213-1.149-.524-1.517-.34-1.278-.8-.699-.781-.285-.661 2.455-4.807 1.747-.781 3.917-1.277 4.854 1.029.359.441.147.533.037 2.426.377 2.252 2.831 4.953.35.432.607.597.643.285 4.753 4.439 3.08 3.584 1.444 1.388 7.567 6.717 5.479 4.173 1.297.533 1.986.33.68.267.653.56 1.848 2.086.34.8.239 1.066 2.069 1.323h1.369l.662-.698.469-1.728 1.076-2.113.717-.809 1.278-.708.57-.184 2.795.01 8.229 1.893 3.236 1.709 2.832 1.755 7.355 8.097 1.379 2.545 4.193 6.81.248.202.598.175 2.344-1.122 2.979 3.061 5.434 6.138.625 1.057-.028 1.415-.726 3.493-4.22 4.714-5.774 6.993z", "offset": "0,-20"}',	'2025-12-26 13:33:21',	'2025-12-27 07:33:25'),
(268,	93,	NULL,	NULL,	NULL,	'uz',	'{"title": "Yurtdosh"}',	'2025-12-27 14:23:30',	'2025-12-27 14:23:30'),
(269,	93,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-27 14:23:30',	'2025-12-27 14:23:30'),
(270,	93,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-27 14:23:30',	'2025-12-27 14:23:30'),
(271,	94,	NULL,	NULL,	NULL,	'uz',	'{"title": "Qollsh"}',	'2025-12-27 14:23:56',	'2025-12-27 14:23:56'),
(272,	94,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-27 14:23:56',	'2025-12-27 14:23:56'),
(273,	94,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-27 14:23:56',	'2025-12-27 14:23:56'),
(274,	95,	NULL,	NULL,	NULL,	'uz',	'{"title": "Qollang"}',	'2025-12-27 14:24:21',	'2025-12-27 14:24:21'),
(275,	95,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-27 14:24:21',	'2025-12-27 14:24:21'),
(276,	95,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-27 14:24:21',	'2025-12-27 14:24:21'),
(286,	119,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-27 17:01:20',	'2025-12-29 11:20:16'),
(287,	119,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-27 17:01:20',	'2025-12-29 11:20:16'),
(277,	117,	NULL,	NULL,	NULL,	'uz',	'{"title": "Xorijdagi  Vatandoshlar  uchun Anor damolish oromgohi ochildi"}',	'2025-12-27 16:57:51',	'2025-12-27 18:14:46'),
(278,	117,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-27 16:57:51',	'2025-12-27 18:14:46'),
(279,	117,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-27 16:57:51',	'2025-12-27 18:14:46'),
(282,	118,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-27 16:59:20',	'2025-12-27 18:15:28'),
(283,	118,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-27 16:59:20',	'2025-12-27 18:15:28'),
(292,	4,	NULL,	NULL,	NULL,	'en',	'{"title": null, "content": null, "content1": null, "description": null}',	'2025-12-27 19:41:11',	'2025-12-27 19:41:11'),
(293,	74,	NULL,	NULL,	NULL,	'uz',	'{"title": "Qollash"}',	'2025-12-28 06:10:13',	'2025-12-28 06:10:13'),
(294,	74,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-28 06:10:13',	'2025-12-28 06:10:13'),
(290,	120,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-27 19:14:10',	'2025-12-29 04:47:50'),
(291,	120,	NULL,	NULL,	NULL,	'en',	'{"title": null}',	'2025-12-27 19:14:10',	'2025-12-29 04:47:50'),
(403,	124,	19,	'tashkilot',	'tashkilot',	NULL,	'{"title": "New York University"}',	'2025-12-29 08:12:53',	'2025-12-29 08:12:53'),
(429,	131,	NULL,	NULL,	NULL,	'ru',	'{"title": null}',	'2025-12-29 12:29:53',	'2025-12-29 13:02:43'),
(157,	57,	NULL,	NULL,	NULL,	'uz',	'{"url_title": "Qo''llash"}',	'2025-12-26 11:29:45',	'2025-12-29 13:33:55');

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
(74,	33,	74,	'1',	'qollash',	'video',	'video',	60,	'2025-12-26 13:55:58',	'2025-12-28 06:10:13'),
(3,	3,	3,	'1',	'qatnashgan-vatandoshlar-soni-c',	NULL,	NULL,	NULL,	'2025-12-23 04:45:52',	'2025-12-23 04:45:52'),
(75,	33,	75,	'1',	'togri-yol',	'video',	'video',	60,	'2025-12-26 13:56:16',	'2025-12-28 06:10:28'),
(4,	4,	4,	'1',	'vatandoshlar-jamoat-fondiff',	NULL,	NULL,	NULL,	'2025-12-23 04:50:44',	'2025-12-23 04:50:44'),
(76,	33,	76,	'1',	'asosiysi',	'video',	'video',	60,	'2025-12-26 13:56:35',	'2025-12-28 06:10:55'),
(5,	11,	5,	'1',	'o-zbekiston-sirli-o-tmish-va-yorqin-kelajak-maskani',	NULL,	NULL,	NULL,	'2025-12-23 05:06:24',	'2025-12-23 05:06:24'),
(6,	12,	6,	'1',	'forum-va-seminarlardan-video',	NULL,	NULL,	NULL,	'2025-12-23 05:07:48',	'2025-12-23 05:07:48'),
(7,	12,	7,	'1',	'fotogalareya',	NULL,	NULL,	NULL,	'2025-12-23 05:08:27',	'2025-12-23 05:08:27'),
(8,	7,	8,	'1',	'qadriyatlarimiz-bizni-birlashtiradi',	NULL,	NULL,	NULL,	'2025-12-23 05:10:29',	'2025-12-23 05:10:29'),
(54,	31,	54,	'1',	'fotogalareya11',	NULL,	NULL,	NULL,	'2025-12-25 13:36:22',	'2025-12-29 10:30:46'),
(9,	9,	9,	'1',	'moziydan-saboq-bugundan-yuksalish',	NULL,	NULL,	NULL,	'2025-12-23 05:11:35',	'2025-12-23 05:11:35'),
(13,	19,	13,	'1',	'oliy-maqsadimiz-xorijdagi-vatandoshlarni-vatan-atrofida-birlashtirish-ularning-qalbi-va-ongida-yurtdan-faxrlanish-tuyg-usini-yuksaltirish-milliy-o-zlikni-asrashdir',	NULL,	NULL,	NULL,	'2025-12-23 05:30:06',	'2025-12-23 05:30:06'),
(16,	15,	16,	'1',	'jamoat-birlashmalari-bilan-hamkorlik-aloqalarini-yo-lga-qo-yish-va-rivojlantirish',	NULL,	NULL,	NULL,	'2025-12-23 05:34:07',	'2025-12-23 05:34:07'),
(17,	15,	17,	'1',	'vatandoshlarning-huquq-va-erkinliklarini-himoya-qilishga-ko-maklashish',	NULL,	NULL,	NULL,	'2025-12-23 05:34:27',	'2025-12-23 05:34:27'),
(18,	22,	18,	'1',	'',	NULL,	NULL,	NULL,	'2025-12-23 05:46:01',	'2025-12-23 05:46:01'),
(19,	23,	19,	'1',	'ozbekiston',	NULL,	NULL,	NULL,	'2025-12-23 05:47:39',	'2025-12-23 05:47:39'),
(20,	23,	20,	'1',	'buyuk-britaniya',	NULL,	NULL,	NULL,	'2025-12-23 05:48:00',	'2025-12-23 05:48:00'),
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
(14,	14,	14,	'1',	'sattarov-odiljon-berdimuratovich',	NULL,	NULL,	NULL,	'2025-12-23 05:32:28',	'2025-12-26 05:17:05'),
(15,	14,	15,	'1',	'sanayev-bolidin-elamonovich',	NULL,	NULL,	NULL,	'2025-12-23 05:33:13',	'2025-12-26 05:17:23'),
(36,	24,	36,	'1',	'vatan',	NULL,	NULL,	NULL,	'2025-12-25 08:47:03',	'2025-12-26 06:30:55'),
(56,	24,	38,	'1',	'video-link',	NULL,	NULL,	NULL,	'2025-12-26 06:41:10',	'2025-12-26 06:50:21'),
(38,	24,	39,	'1',	'fondning-tashkil-topishi-haqida',	NULL,	NULL,	NULL,	'2025-12-25 08:48:32',	'2025-12-26 06:52:14'),
(39,	24,	40,	'1',	'oliy-maqsadimiz-xorijdagi-vatandoshlarni-vatan-atrofida-birlashtirish-ularning-qalbi-va-ongida-yurtdan-faxrlanish-tuyg-usini-yuksaltirish-milliy-o-zlikni-asrashdirv',	NULL,	NULL,	NULL,	'2025-12-25 08:50:21',	'2025-12-26 06:52:21'),
(57,	30,	57,	'1',	'',	'Url',	'url',	52,	'2025-12-26 11:10:22',	'2025-12-26 11:10:22'),
(58,	30,	58,	'1',	'',	'Url',	'url',	52,	'2025-12-26 11:10:39',	'2025-12-26 11:10:39'),
(59,	32,	59,	'1',	'har-bir-manzil-yangi-bir-orzuss',	NULL,	NULL,	NULL,	'2025-12-26 13:16:46',	'2025-12-26 13:16:46'),
(60,	33,	60,	'1',	'qoraqalpog-iston-respublikasi',	NULL,	NULL,	NULL,	'2025-12-26 13:22:38',	'2025-12-26 13:24:00'),
(61,	33,	61,	'1',	'andijon',	NULL,	NULL,	NULL,	'2025-12-26 13:25:28',	'2025-12-26 13:25:28'),
(62,	33,	62,	'1',	'buxoro',	NULL,	NULL,	NULL,	'2025-12-26 13:26:58',	'2025-12-26 13:26:58'),
(63,	33,	63,	'1',	'farg-ona',	NULL,	NULL,	NULL,	'2025-12-26 13:28:16',	'2025-12-26 13:28:16'),
(64,	33,	64,	'1',	'jizzax',	NULL,	NULL,	NULL,	'2025-12-26 13:28:53',	'2025-12-26 13:28:53'),
(66,	33,	66,	'1',	'navoiy',	NULL,	NULL,	NULL,	'2025-12-26 13:29:58',	'2025-12-26 13:29:58'),
(67,	33,	67,	'1',	'qashqadaryo',	NULL,	NULL,	NULL,	'2025-12-26 13:30:35',	'2025-12-26 13:30:35'),
(68,	33,	68,	'1',	'samarqand',	NULL,	NULL,	NULL,	'2025-12-26 13:31:14',	'2025-12-26 13:31:14'),
(69,	33,	69,	'1',	'sirdaryo',	NULL,	NULL,	NULL,	'2025-12-26 13:31:46',	'2025-12-26 13:31:46'),
(70,	33,	70,	'1',	'surxondaryo',	NULL,	NULL,	NULL,	'2025-12-26 13:32:12',	'2025-12-26 13:32:12'),
(71,	33,	71,	'1',	'toshkent-v',	NULL,	NULL,	NULL,	'2025-12-26 13:32:47',	'2025-12-26 13:32:47'),
(73,	33,	73,	'1',	'toshkent-sh',	NULL,	NULL,	NULL,	'2025-12-26 13:33:53',	'2025-12-26 13:33:53'),
(72,	33,	72,	'1',	'xoramz',	NULL,	NULL,	NULL,	'2025-12-26 13:33:21',	'2025-12-26 13:52:31'),
(89,	33,	66,	'1',	'namanganvs',	NULL,	NULL,	NULL,	'2025-12-26 14:25:11',	'2025-12-26 14:25:21'),
(111,	33,	111,	'1',	'',	'video',	'video-13',	72,	'2025-12-26 14:34:51',	'2025-12-26 14:34:51'),
(112,	33,	112,	'1',	'',	'video',	'video-13',	72,	'2025-12-26 14:35:10',	'2025-12-26 14:35:10'),
(113,	33,	113,	'1',	'',	'video',	'video-13',	72,	'2025-12-26 14:35:23',	'2025-12-26 14:35:23'),
(114,	33,	114,	'1',	'',	'video',	'video-14',	73,	'2025-12-26 14:35:56',	'2025-12-26 14:35:56'),
(115,	33,	115,	'1',	'',	'video',	'video-14',	73,	'2025-12-26 14:36:11',	'2025-12-26 14:36:11'),
(116,	33,	116,	'1',	'',	'video',	'video-14',	73,	'2025-12-26 14:36:27',	'2025-12-26 14:36:27'),
(93,	33,	93,	'1',	'yurtdosh',	'video',	'video-7',	66,	'2025-12-26 14:27:29',	'2025-12-27 14:23:30'),
(94,	33,	94,	'1',	'qollsh',	'video',	'video-7',	66,	'2025-12-26 14:27:50',	'2025-12-27 14:23:56'),
(95,	33,	95,	'1',	'qollang',	'video',	'video-7',	66,	'2025-12-26 14:28:05',	'2025-12-27 14:24:21'),
(117,	26,	117,	'1',	'xorijdagi-vatandoshlar-uchun-anor-damolish-oromgohi-ochildi',	NULL,	NULL,	NULL,	'2025-12-27 16:57:51',	'2025-12-27 16:57:51'),
(118,	26,	118,	'1',	'arabiston-respublikasidagi-o-zbekiston-o-zbek-milliy-madaniy-avtonomiyasi',	NULL,	NULL,	NULL,	'2025-12-27 16:59:20',	'2025-12-27 16:59:20'),
(119,	26,	119,	'1',	'baa-respublikasidagi-o-zbekiston-o-zbek-milliy-madaniy-avtonomiyasi',	NULL,	NULL,	NULL,	'2025-12-27 17:01:20',	'2025-12-27 17:01:20'),
(120,	35,	120,	'1',	'biz-barcha-vatandoshlarni-birlashtirib-ularga-kerakli-mativatsiya',	NULL,	NULL,	NULL,	'2025-12-27 19:14:10',	'2025-12-27 19:14:10'),
(77,	33,	77,	'1',	'ajoyib-manzil',	'video',	'video-1',	61,	'2025-12-26 13:57:36',	'2025-12-28 06:11:54'),
(78,	33,	78,	'1',	'eng-sara-joylar',	'video',	'video-1',	61,	'2025-12-26 13:57:53',	'2025-12-28 06:12:16'),
(79,	33,	79,	'1',	'korishga-arziydigan-joylar',	'video',	'video-1',	61,	'2025-12-26 13:58:11',	'2025-12-28 06:13:10'),
(80,	33,	80,	'1',	'chiroyli-manzilgohlar',	'video',	'video-2',	62,	'2025-12-26 14:17:34',	'2025-12-28 06:14:41'),
(81,	33,	81,	'1',	'eng-chiroyli-joy',	'video',	'video-2',	62,	'2025-12-26 14:17:51',	'2025-12-28 06:14:55'),
(82,	33,	82,	'1',	'golsdo',	'video',	'video-2',	62,	'2025-12-26 14:18:09',	'2025-12-28 06:15:23'),
(83,	33,	83,	'1',	'futbol',	'video',	'video-3',	63,	'2025-12-26 14:18:56',	'2025-12-28 06:17:03'),
(84,	33,	84,	'1',	'real',	'video',	'video-3',	63,	'2025-12-26 14:19:13',	'2025-12-28 06:17:19'),
(85,	33,	85,	'1',	'man-city',	'video',	'video-3',	63,	'2025-12-26 14:19:30',	'2025-12-28 06:20:50'),
(86,	33,	86,	'1',	'man-united',	'video',	'video-4',	64,	'2025-12-26 14:20:10',	'2025-12-28 06:22:02'),
(88,	33,	88,	'1',	'juventus',	'video',	'video-4',	64,	'2025-12-26 14:20:46',	'2025-12-28 06:22:17'),
(87,	33,	87,	'1',	'barcelona',	'video',	'video-4',	64,	'2025-12-26 14:20:28',	'2025-12-28 06:22:33'),
(90,	33,	90,	'1',	'roma',	'video',	'video-6',	89,	'2025-12-26 14:26:17',	'2025-12-28 06:23:24'),
(91,	33,	91,	'1',	'latsio',	'video',	'video-6',	89,	'2025-12-26 14:26:32',	'2025-12-28 06:23:42'),
(92,	33,	92,	'1',	'inter',	'video',	'video-6',	89,	'2025-12-26 14:26:48',	'2025-12-28 06:24:26'),
(96,	33,	96,	'1',	'saylov',	'video',	'video-8',	67,	'2025-12-26 14:28:39',	'2025-12-28 06:25:23'),
(97,	33,	97,	'1',	'golland',	'video',	'video-8',	67,	'2025-12-26 14:28:53',	'2025-12-28 06:25:45'),
(98,	33,	98,	'1',	'chelsea',	'video',	'video-8',	67,	'2025-12-26 14:29:06',	'2025-12-28 06:26:01'),
(99,	33,	99,	'1',	'atetico-madrid',	'video',	'video-9',	68,	'2025-12-26 14:29:51',	'2025-12-28 06:27:11'),
(100,	33,	100,	'1',	'betis',	'video',	'video-9',	68,	'2025-12-26 14:30:05',	'2025-12-28 06:27:26'),
(101,	33,	101,	'1',	'sevila',	'video',	'video-9',	68,	'2025-12-26 14:30:18',	'2025-12-28 06:27:43'),
(102,	33,	102,	'1',	'atalanta',	'video',	'video-10',	69,	'2025-12-26 14:30:52',	'2025-12-28 06:28:55'),
(103,	33,	103,	'1',	'spezia',	'video',	'video-10',	69,	'2025-12-26 14:31:09',	'2025-12-28 06:29:10'),
(104,	33,	104,	'1',	'sasuolo',	'video',	'video-10',	69,	'2025-12-26 14:31:24',	'2025-12-28 06:29:41'),
(105,	33,	105,	'1',	'bornmut',	'video',	'video-11',	70,	'2025-12-26 14:32:13',	'2025-12-28 06:30:40'),
(106,	33,	106,	'1',	'astron-villa',	'video',	'video-11',	70,	'2025-12-26 14:32:30',	'2025-12-28 06:30:53'),
(107,	33,	107,	'1',	'swansea',	'video',	'video-11',	70,	'2025-12-26 14:32:43',	'2025-12-28 06:31:08'),
(108,	33,	108,	'1',	'futbolchi',	'video',	'video-12',	71,	'2025-12-26 14:33:17',	'2025-12-28 06:32:15'),
(109,	33,	109,	'1',	'championship',	'video',	'video-12',	71,	'2025-12-26 14:33:35',	'2025-12-28 06:35:06'),
(110,	33,	110,	'1',	'b-seria',	'video',	'video-12',	71,	'2025-12-26 14:33:48',	'2025-12-28 06:35:30'),
(124,	23,	124,	'1',	'new-york-university',	'tashkilot',	'tashkilot',	19,	'2025-12-29 08:12:53',	'2025-12-29 08:12:53'),
(125,	23,	125,	'1',	'harvard-university',	'tashkilot',	'tashkilot',	19,	'2025-12-29 08:13:35',	'2025-12-29 08:13:35'),
(126,	23,	126,	'1',	'pittsburgdagi-uzbeklar-jamiyati',	'Nomi',	'nomi-5',	124,	'2025-12-29 08:15:50',	'2025-12-29 08:15:50'),
(127,	23,	127,	'1',	'pittsburgdagi-uzbeklar-jamiyatisddd',	'Nomi',	'nomi-6',	125,	'2025-12-29 08:19:13',	'2025-12-29 08:19:13'),
(128,	23,	128,	'1',	'sadikov-baxodir-talibjonovich',	'Rahbar',	'rahbar-5',	124,	'2025-12-29 08:22:05',	'2025-12-29 08:22:05'),
(129,	23,	129,	'1',	'sadikov-baxodir-talibjonovichff',	'Rahbar',	'rahbar-6',	125,	'2025-12-29 08:23:08',	'2025-12-29 08:23:08'),
(130,	36,	130,	'1',	'vatandoshlar-jamoat-fondi-bu-xorijdagi-o-zbekistonlik-vatandoshlar-bilan-aloqalarni-mustahkamlash-ularning-huquq-va-manfaatlarini-qo-llab-quvvatlash-shuningdek-ularni-o-zbekiston-taraqqiyotiga-jalb-etish-maqsadida-tashkil-etilgan-notijorat-tashkilotdir',	NULL,	NULL,	NULL,	'2025-12-29 09:59:02',	'2025-12-29 09:59:02'),
(132,	40,	132,	'1',	'chinor',	NULL,	NULL,	NULL,	'2025-12-29 12:30:29',	'2025-12-29 12:30:29'),
(133,	40,	133,	'1',	'malaka-oshirish',	NULL,	NULL,	NULL,	'2025-12-29 12:31:16',	'2025-12-29 12:31:16'),
(134,	40,	134,	'1',	'maktab-loyihasi',	NULL,	NULL,	NULL,	'2025-12-29 12:31:57',	'2025-12-29 12:31:57'),
(135,	41,	135,	'1',	'2023-yil',	NULL,	NULL,	NULL,	'2025-12-29 12:34:27',	'2025-12-29 12:39:21'),
(139,	41,	139,	'1',	'2024-yil',	NULL,	NULL,	NULL,	'2025-12-29 12:44:36',	'2025-12-29 12:44:36'),
(131,	40,	131,	'1',	'anor-tanlovi',	NULL,	NULL,	NULL,	'2025-12-29 12:29:53',	'2025-12-29 12:47:40'),
(143,	42,	143,	'1',	'',	NULL,	NULL,	NULL,	'2025-12-30 07:36:01',	'2025-12-30 07:36:01'),
(148,	38,	148,	'1',	'anor-loyihasi',	NULL,	NULL,	NULL,	'2025-12-30 16:43:36',	'2025-12-30 16:43:36'),
(149,	38,	149,	'1',	'yoshlar-tanlovi',	NULL,	NULL,	NULL,	'2025-12-30 16:44:29',	'2025-12-30 16:44:29'),
(150,	38,	150,	'1',	'2022-mavsum',	'Yillar',	'yillar-1',	148,	'2025-12-30 16:47:11',	'2025-12-30 16:47:11'),
(151,	38,	151,	'1',	'2023mavsum',	'Yillar',	'yillar-1',	148,	'2025-12-30 16:47:54',	'2025-12-30 16:47:54'),
(152,	38,	152,	'1',	'2022-mavsumdagi',	'Yillar',	'yillar-2',	149,	'2025-12-30 16:54:48',	'2025-12-30 16:54:48'),
(153,	38,	153,	'1',	'2023mavsumdagi',	'Yillar',	'yillar-2',	149,	'2025-12-30 16:58:03',	'2025-12-30 16:58:03'),
(156,	38,	156,	'1',	'universitet-tanlovi',	NULL,	NULL,	NULL,	'2025-12-31 01:02:51',	'2025-12-31 01:02:51'),
(157,	38,	157,	'1',	'futbol-mavzusi',	NULL,	NULL,	NULL,	'2025-12-31 01:03:31',	'2025-12-31 01:03:31'),
(158,	38,	158,	'1',	'bank-loyihasi',	NULL,	NULL,	NULL,	'2025-12-31 01:05:11',	'2025-12-31 01:05:11');

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
('K9ZNRzvv98LQHJ8gN4oiYjeu8rHyErE5Mkv6CdP4',	NULL,	'172.23.0.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36',	'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZkdZNHUzcDRldUR3M1d5QXBEb0tCM2l3bkdCazYwN3NMTjdkR1l3WiI7czo2OiJsb2NhbGUiO3M6MjoidXoiO3M6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjQxOiJodHRwOi8vbG9jYWxob3N0OjgwNzgvdXovYmFyY2hhLWxveWloYWxhciI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',	1767154762),
('nnp1TEztKjjpGeJeWFPBs0ebq259Y5hBsholgBSG',	NULL,	'172.23.0.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36',	'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUnU3NVRPdlo2eDJ6dWVob3FmWVN0ZTFERVBjUFZnbGdYM01rNjc2WiI7czo2OiJsb2NhbGUiO3M6MjoidXoiO3M6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjIxOiJodHRwOi8vbG9jYWxob3N0OjgwNzgiO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',	1767166642),
('njlaFDQs8uTbMg597nzoru6FNQzw0VQu57mfgh5r',	1,	'172.23.0.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36',	'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiaVpjQkxLa3Q3TTdvSGlIdFJYYVRTTkx2TjJUeDhLUlhlTW9aZDdHRiI7czo2OiJsb2NhbGUiO3M6MjoidXoiO3M6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjQxOiJodHRwOi8vbG9jYWxob3N0OjgwNzgvdXovYmFyY2hhLWxveWloYWxhciI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyNzoiaHR0cDovL2xvY2FsaG9zdDo4MDc4L2FkbWluIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9',	1767144064);

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


DROP TABLE IF EXISTS "supports";
DROP SEQUENCE IF EXISTS supports_id_seq;
CREATE SEQUENCE supports_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."supports" (
    "id" bigint DEFAULT nextval('supports_id_seq') NOT NULL,
    "data" jsonb NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "supports_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

INSERT INTO "supports" ("id", "data", "created_at", "updated_at") VALUES
(1,	'{"name": "Asad", "email": "y@gmail.com", "phone": "+990555555", "description": "gol"}',	'2025-12-30 23:52:13',	'2025-12-30 23:52:13'),
(2,	'{"name": "aLI", "email": "yam@gmail.com", "phone": "+998905975554", "description": "Eng yaxshi dastruc"}',	'2025-12-30 23:58:20',	'2025-12-30 23:58:20');

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

-- 2025-12-31 07:37:40 UTC

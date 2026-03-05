--
-- PostgreSQL database dump
--

\restrict cch8ZEr0yjhNL2IhxKZTtm8CBHEou69d3lvKCFgnSfEAo6iEBCYzpUUgqz49abL

-- Dumped from database version 16.12 (Ubuntu 16.12-1.pgdg22.04+1)
-- Dumped by pg_dump version 16.12 (Ubuntu 16.12-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cache; Type: TABLE; Schema: public; Owner: vatandoshlar_usr
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache OWNER TO vatandoshlar_usr;

--
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: vatandoshlar_usr
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache_locks OWNER TO vatandoshlar_usr;

--
-- Name: content_images_id_seq; Type: SEQUENCE; Schema: public; Owner: vatandoshlar_usr
--

CREATE SEQUENCE public.content_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.content_images_id_seq OWNER TO vatandoshlar_usr;

--
-- Name: content_images; Type: TABLE; Schema: public; Owner: vatandoshlar_usr
--

CREATE TABLE public.content_images (
    id bigint DEFAULT nextval('public.content_images_id_seq'::regclass) NOT NULL,
    content_id bigint NOT NULL,
    image text,
    compressed text,
    type character varying(255),
    size bigint,
    main boolean DEFAULT false NOT NULL,
    status boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    category text,
    sort_order bigint,
    poster text
);


ALTER TABLE public.content_images OWNER TO vatandoshlar_usr;

--
-- Name: content_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: vatandoshlar_usr
--

CREATE SEQUENCE public.content_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.content_settings_id_seq OWNER TO vatandoshlar_usr;

--
-- Name: content_settings; Type: TABLE; Schema: public; Owner: vatandoshlar_usr
--

CREATE TABLE public.content_settings (
    id bigint DEFAULT nextval('public.content_settings_id_seq'::regclass) NOT NULL,
    key character varying(255) NOT NULL,
    label character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    required boolean DEFAULT true NOT NULL,
    is_translatable boolean DEFAULT true NOT NULL,
    options json,
    sort_order integer DEFAULT 0 NOT NULL,
    relation text,
    status boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    category text
);


ALTER TABLE public.content_settings OWNER TO vatandoshlar_usr;

--
-- Name: content_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: vatandoshlar_usr
--

CREATE SEQUENCE public.content_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.content_translations_id_seq OWNER TO vatandoshlar_usr;

--
-- Name: content_translations; Type: TABLE; Schema: public; Owner: vatandoshlar_usr
--

CREATE TABLE public.content_translations (
    id bigint DEFAULT nextval('public.content_translations_id_seq'::regclass) NOT NULL,
    content_id bigint NOT NULL,
    locale character varying(3),
    data jsonb,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    category text
);


ALTER TABLE public.content_translations OWNER TO vatandoshlar_usr;

--
-- Name: contents_id_seq; Type: SEQUENCE; Schema: public; Owner: vatandoshlar_usr
--

CREATE SEQUENCE public.contents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contents_id_seq OWNER TO vatandoshlar_usr;

--
-- Name: contents; Type: TABLE; Schema: public; Owner: vatandoshlar_usr
--

CREATE TABLE public.contents (
    id bigint DEFAULT nextval('public.contents_id_seq'::regclass) NOT NULL,
    type character varying(255) DEFAULT 'category'::character varying NOT NULL,
    slug text,
    url text,
    test boolean DEFAULT false NOT NULL,
    show_admin boolean DEFAULT true NOT NULL,
    sort_order integer DEFAULT 1 NOT NULL,
    icon character varying(255),
    status boolean DEFAULT true NOT NULL,
    parent_id bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    category text,
    CONSTRAINT contents_type_check CHECK (((type)::text = ANY (ARRAY[('category'::character varying)::text, ('page'::character varying)::text, ('url'::character varying)::text, ('section'::character varying)::text])))
);


ALTER TABLE public.contents OWNER TO vatandoshlar_usr;

--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: vatandoshlar_usr
--

CREATE SEQUENCE public.countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.countries_id_seq OWNER TO vatandoshlar_usr;

--
-- Name: countries; Type: TABLE; Schema: public; Owner: vatandoshlar_usr
--

CREATE TABLE public.countries (
    id bigint DEFAULT nextval('public.countries_id_seq'::regclass) NOT NULL,
    name text NOT NULL,
    nicename character varying(255),
    iso character varying(100),
    iso3 character varying(100),
    numcode character varying(100),
    phonecode character varying(100),
    phonemask character varying(255),
    status character varying(255) DEFAULT 'active'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT countries_status_check CHECK (((status)::text = ANY (ARRAY[('active'::character varying)::text, ('inactive'::character varying)::text])))
);


ALTER TABLE public.countries OWNER TO vatandoshlar_usr;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: vatandoshlar_usr
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.failed_jobs_id_seq OWNER TO vatandoshlar_usr;

--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: vatandoshlar_usr
--

CREATE TABLE public.failed_jobs (
    id bigint DEFAULT nextval('public.failed_jobs_id_seq'::regclass) NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO vatandoshlar_usr;

--
-- Name: form_images_id_seq; Type: SEQUENCE; Schema: public; Owner: vatandoshlar_usr
--

CREATE SEQUENCE public.form_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.form_images_id_seq OWNER TO vatandoshlar_usr;

--
-- Name: form_images; Type: TABLE; Schema: public; Owner: vatandoshlar_usr
--

CREATE TABLE public.form_images (
    id bigint DEFAULT nextval('public.form_images_id_seq'::regclass) NOT NULL,
    support_id bigint,
    type character varying(255),
    size bigint,
    image text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.form_images OWNER TO vatandoshlar_usr;

--
-- Name: job_batches; Type: TABLE; Schema: public; Owner: vatandoshlar_usr
--

CREATE TABLE public.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);


ALTER TABLE public.job_batches OWNER TO vatandoshlar_usr;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: vatandoshlar_usr
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jobs_id_seq OWNER TO vatandoshlar_usr;

--
-- Name: jobs; Type: TABLE; Schema: public; Owner: vatandoshlar_usr
--

CREATE TABLE public.jobs (
    id bigint DEFAULT nextval('public.jobs_id_seq'::regclass) NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE public.jobs OWNER TO vatandoshlar_usr;

--
-- Name: lang_images_id_seq; Type: SEQUENCE; Schema: public; Owner: vatandoshlar_usr
--

CREATE SEQUENCE public.lang_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lang_images_id_seq OWNER TO vatandoshlar_usr;

--
-- Name: lang_images; Type: TABLE; Schema: public; Owner: vatandoshlar_usr
--

CREATE TABLE public.lang_images (
    id bigint DEFAULT nextval('public.lang_images_id_seq'::regclass) NOT NULL,
    image text,
    compressed text,
    type character varying(255),
    size bigint,
    main boolean DEFAULT false NOT NULL,
    status boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    lang_id bigint NOT NULL,
    sort_order bigint
);


ALTER TABLE public.lang_images OWNER TO vatandoshlar_usr;

--
-- Name: langs_id_seq; Type: SEQUENCE; Schema: public; Owner: vatandoshlar_usr
--

CREATE SEQUENCE public.langs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.langs_id_seq OWNER TO vatandoshlar_usr;

--
-- Name: langs; Type: TABLE; Schema: public; Owner: vatandoshlar_usr
--

CREATE TABLE public.langs (
    id bigint DEFAULT nextval('public.langs_id_seq'::regclass) NOT NULL,
    code character varying(10) NOT NULL,
    name character varying(50) NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    status boolean DEFAULT true NOT NULL,
    locale character varying(10),
    flag_icon character varying(255),
    sort_order bigint DEFAULT '0'::bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    short_name text
);


ALTER TABLE public.langs OWNER TO vatandoshlar_usr;

--
-- Name: menu_main_images_id_seq; Type: SEQUENCE; Schema: public; Owner: vatandoshlar_usr
--

CREATE SEQUENCE public.menu_main_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.menu_main_images_id_seq OWNER TO vatandoshlar_usr;

--
-- Name: menu_main_images; Type: TABLE; Schema: public; Owner: vatandoshlar_usr
--

CREATE TABLE public.menu_main_images (
    id bigint DEFAULT nextval('public.menu_main_images_id_seq'::regclass) NOT NULL,
    menu_main_id bigint NOT NULL,
    image text,
    compressed text,
    type character varying(255),
    size bigint,
    main boolean DEFAULT false NOT NULL,
    status boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    sort_order bigint,
    poster text
);


ALTER TABLE public.menu_main_images OWNER TO vatandoshlar_usr;

--
-- Name: menu_main_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: vatandoshlar_usr
--

CREATE SEQUENCE public.menu_main_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.menu_main_settings_id_seq OWNER TO vatandoshlar_usr;

--
-- Name: menu_main_settings; Type: TABLE; Schema: public; Owner: vatandoshlar_usr
--

CREATE TABLE public.menu_main_settings (
    id bigint DEFAULT nextval('public.menu_main_settings_id_seq'::regclass) NOT NULL,
    key character varying(255) NOT NULL,
    label character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    required boolean DEFAULT true NOT NULL,
    is_translatable boolean DEFAULT true NOT NULL,
    options json,
    sort_order integer DEFAULT 0 NOT NULL,
    relation text,
    status boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.menu_main_settings OWNER TO vatandoshlar_usr;

--
-- Name: menu_main_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: vatandoshlar_usr
--

CREATE SEQUENCE public.menu_main_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.menu_main_translations_id_seq OWNER TO vatandoshlar_usr;

--
-- Name: menu_main_translations; Type: TABLE; Schema: public; Owner: vatandoshlar_usr
--

CREATE TABLE public.menu_main_translations (
    id bigint DEFAULT nextval('public.menu_main_translations_id_seq'::regclass) NOT NULL,
    menu_main_id bigint NOT NULL,
    locale character varying(3),
    data jsonb,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.menu_main_translations OWNER TO vatandoshlar_usr;

--
-- Name: menu_mains_id_seq; Type: SEQUENCE; Schema: public; Owner: vatandoshlar_usr
--

CREATE SEQUENCE public.menu_mains_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.menu_mains_id_seq OWNER TO vatandoshlar_usr;

--
-- Name: menu_mains; Type: TABLE; Schema: public; Owner: vatandoshlar_usr
--

CREATE TABLE public.menu_mains (
    id bigint DEFAULT nextval('public.menu_mains_id_seq'::regclass) NOT NULL,
    type character varying(255) DEFAULT 'category'::character varying NOT NULL,
    slug text,
    url text,
    test boolean DEFAULT false NOT NULL,
    show_admin boolean DEFAULT true NOT NULL,
    sort_order integer DEFAULT 1 NOT NULL,
    icon character varying(255),
    status boolean DEFAULT true NOT NULL,
    parent_id bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT menu_mains_type_check CHECK (((type)::text = ANY (ARRAY[('category'::character varying)::text, ('page'::character varying)::text, ('url'::character varying)::text, ('section'::character varying)::text])))
);


ALTER TABLE public.menu_mains OWNER TO vatandoshlar_usr;

--
-- Name: menus_id_seq; Type: SEQUENCE; Schema: public; Owner: vatandoshlar_usr
--

CREATE SEQUENCE public.menus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.menus_id_seq OWNER TO vatandoshlar_usr;

--
-- Name: menus; Type: TABLE; Schema: public; Owner: vatandoshlar_usr
--

CREATE TABLE public.menus (
    id bigint DEFAULT nextval('public.menus_id_seq'::regclass) NOT NULL,
    title character varying(255) NOT NULL,
    status boolean DEFAULT true NOT NULL,
    sort_order bigint DEFAULT '0'::bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.menus OWNER TO vatandoshlar_usr;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: vatandoshlar_usr
--

CREATE SEQUENCE public.migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO vatandoshlar_usr;

--
-- Name: migrations; Type: TABLE; Schema: public; Owner: vatandoshlar_usr
--

CREATE TABLE public.migrations (
    id integer DEFAULT nextval('public.migrations_id_seq'::regclass) NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO vatandoshlar_usr;

--
-- Name: order_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: vatandoshlar_usr
--

CREATE SEQUENCE public.order_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_settings_id_seq OWNER TO vatandoshlar_usr;

--
-- Name: order_settings; Type: TABLE; Schema: public; Owner: vatandoshlar_usr
--

CREATE TABLE public.order_settings (
    id bigint DEFAULT nextval('public.order_settings_id_seq'::regclass) NOT NULL,
    menu_main_id bigint NOT NULL,
    "order" text NOT NULL,
    status boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.order_settings OWNER TO vatandoshlar_usr;

--
-- Name: page_section_blocks; Type: TABLE; Schema: public; Owner: vatandoshlar_usr
--

CREATE TABLE public.page_section_blocks (
    id bigint NOT NULL,
    menu_main_id bigint NOT NULL,
    category_slug text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.page_section_blocks OWNER TO vatandoshlar_usr;

--
-- Name: page_section_images_id_seq; Type: SEQUENCE; Schema: public; Owner: vatandoshlar_usr
--

CREATE SEQUENCE public.page_section_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.page_section_images_id_seq OWNER TO vatandoshlar_usr;

--
-- Name: page_section_images; Type: TABLE; Schema: public; Owner: vatandoshlar_usr
--

CREATE TABLE public.page_section_images (
    id bigint DEFAULT nextval('public.page_section_images_id_seq'::regclass) NOT NULL,
    page_section_id bigint NOT NULL,
    page_section_parent_id bigint,
    category text,
    category_slug text,
    image text,
    compressed text,
    type character varying(255),
    size bigint,
    main boolean DEFAULT false NOT NULL,
    status boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    sort_order bigint,
    poster text
);


ALTER TABLE public.page_section_images OWNER TO vatandoshlar_usr;

--
-- Name: page_section_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: vatandoshlar_usr
--

CREATE SEQUENCE public.page_section_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.page_section_settings_id_seq OWNER TO vatandoshlar_usr;

--
-- Name: page_section_settings; Type: TABLE; Schema: public; Owner: vatandoshlar_usr
--

CREATE TABLE public.page_section_settings (
    id bigint DEFAULT nextval('public.page_section_settings_id_seq'::regclass) NOT NULL,
    menu_main_id bigint NOT NULL,
    page_section_parent_id bigint,
    category text,
    category_slug text,
    key character varying(255) NOT NULL,
    label character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    required boolean DEFAULT true NOT NULL,
    is_translatable boolean DEFAULT true NOT NULL,
    options json,
    sort_order integer DEFAULT 0 NOT NULL,
    relation text,
    status boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.page_section_settings OWNER TO vatandoshlar_usr;

--
-- Name: page_section_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: vatandoshlar_usr
--

CREATE SEQUENCE public.page_section_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.page_section_translations_id_seq OWNER TO vatandoshlar_usr;

--
-- Name: page_section_translations; Type: TABLE; Schema: public; Owner: vatandoshlar_usr
--

CREATE TABLE public.page_section_translations (
    id bigint DEFAULT nextval('public.page_section_translations_id_seq'::regclass) NOT NULL,
    page_section_id bigint NOT NULL,
    page_section_parent_id bigint,
    category text,
    category_slug text,
    locale character varying(3),
    data jsonb,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.page_section_translations OWNER TO vatandoshlar_usr;

--
-- Name: page_sections_id_seq; Type: SEQUENCE; Schema: public; Owner: vatandoshlar_usr
--

CREATE SEQUENCE public.page_sections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.page_sections_id_seq OWNER TO vatandoshlar_usr;

--
-- Name: page_sections; Type: TABLE; Schema: public; Owner: vatandoshlar_usr
--

CREATE TABLE public.page_sections (
    id bigint DEFAULT nextval('public.page_sections_id_seq'::regclass) NOT NULL,
    menu_main_id bigint NOT NULL,
    sort_order integer DEFAULT 1 NOT NULL,
    status boolean DEFAULT true NOT NULL,
    slug character varying(255),
    category text,
    category_slug text,
    parent_id bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    publish_at timestamp without time zone,
    modal_status boolean
);


ALTER TABLE public.page_sections OWNER TO vatandoshlar_usr;

--
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: vatandoshlar_usr
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO vatandoshlar_usr;

--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: vatandoshlar_usr
--

CREATE SEQUENCE public.permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.permissions_id_seq OWNER TO vatandoshlar_usr;

--
-- Name: permissions; Type: TABLE; Schema: public; Owner: vatandoshlar_usr
--

CREATE TABLE public.permissions (
    id bigint DEFAULT nextval('public.permissions_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL,
    sort_order bigint DEFAULT '0'::bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT permissions_name_check CHECK (((name)::text = ANY (ARRAY[('given'::character varying)::text, ('not_given'::character varying)::text])))
);


ALTER TABLE public.permissions OWNER TO vatandoshlar_usr;

--
-- Name: role_menu_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: vatandoshlar_usr
--

CREATE SEQUENCE public.role_menu_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.role_menu_permissions_id_seq OWNER TO vatandoshlar_usr;

--
-- Name: role_menu_permissions; Type: TABLE; Schema: public; Owner: vatandoshlar_usr
--

CREATE TABLE public.role_menu_permissions (
    id bigint DEFAULT nextval('public.role_menu_permissions_id_seq'::regclass) NOT NULL,
    role_id bigint NOT NULL,
    menu_main_id bigint NOT NULL,
    permission_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.role_menu_permissions OWNER TO vatandoshlar_usr;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: vatandoshlar_usr
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO vatandoshlar_usr;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: vatandoshlar_usr
--

CREATE TABLE public.roles (
    id bigint DEFAULT nextval('public.roles_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL,
    sort_order bigint DEFAULT '0'::bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    status boolean DEFAULT true NOT NULL
);


ALTER TABLE public.roles OWNER TO vatandoshlar_usr;

--
-- Name: sessions; Type: TABLE; Schema: public; Owner: vatandoshlar_usr
--

CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


ALTER TABLE public.sessions OWNER TO vatandoshlar_usr;

--
-- Name: setting_images_id_seq; Type: SEQUENCE; Schema: public; Owner: vatandoshlar_usr
--

CREATE SEQUENCE public.setting_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.setting_images_id_seq OWNER TO vatandoshlar_usr;

--
-- Name: setting_images; Type: TABLE; Schema: public; Owner: vatandoshlar_usr
--

CREATE TABLE public.setting_images (
    id bigint DEFAULT nextval('public.setting_images_id_seq'::regclass) NOT NULL,
    setting_id bigint NOT NULL,
    image text,
    compressed text,
    type character varying(255),
    size bigint,
    main boolean DEFAULT false NOT NULL,
    status boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    sort_order bigint,
    poster text
);


ALTER TABLE public.setting_images OWNER TO vatandoshlar_usr;

--
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: vatandoshlar_usr
--

CREATE SEQUENCE public.settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.settings_id_seq OWNER TO vatandoshlar_usr;

--
-- Name: settings; Type: TABLE; Schema: public; Owner: vatandoshlar_usr
--

CREATE TABLE public.settings (
    id bigint DEFAULT nextval('public.settings_id_seq'::regclass) NOT NULL,
    title jsonb NOT NULL,
    meta_description jsonb,
    meta_keywords jsonb,
    email character varying(255),
    status boolean DEFAULT false NOT NULL,
    main_page_id bigint,
    admin_ips character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    search_ids json,
    sorting_ids json,
    bot_token text,
    chat_id text,
    week_short jsonb,
    week_long jsonb,
    month_long jsonb,
    month_short jsonb,
    default_lang text
);


ALTER TABLE public.settings OWNER TO vatandoshlar_usr;

--
-- Name: socials_id_seq; Type: SEQUENCE; Schema: public; Owner: vatandoshlar_usr
--

CREATE SEQUENCE public.socials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.socials_id_seq OWNER TO vatandoshlar_usr;

--
-- Name: socials; Type: TABLE; Schema: public; Owner: vatandoshlar_usr
--

CREATE TABLE public.socials (
    id bigint DEFAULT nextval('public.socials_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(255),
    url character varying(255) NOT NULL,
    key character varying(255),
    status boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.socials OWNER TO vatandoshlar_usr;

--
-- Name: supports_id_seq; Type: SEQUENCE; Schema: public; Owner: vatandoshlar_usr
--

CREATE SEQUENCE public.supports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.supports_id_seq OWNER TO vatandoshlar_usr;

--
-- Name: supports; Type: TABLE; Schema: public; Owner: vatandoshlar_usr
--

CREATE TABLE public.supports (
    id bigint DEFAULT nextval('public.supports_id_seq'::regclass) NOT NULL,
    data jsonb NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    type text,
    user_id bigint,
    chat_id text
);


ALTER TABLE public.supports OWNER TO vatandoshlar_usr;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: vatandoshlar_usr
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO vatandoshlar_usr;

--
-- Name: users; Type: TABLE; Schema: public; Owner: vatandoshlar_usr
--

CREATE TABLE public.users (
    id bigint DEFAULT nextval('public.users_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL,
    username character varying(255) NOT NULL,
    status boolean DEFAULT true NOT NULL,
    password character varying(255) NOT NULL,
    role_id bigint,
    email character varying(255),
    email_verified_at timestamp(0) without time zone,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO vatandoshlar_usr;

--
-- Name: view_counts_id_seq; Type: SEQUENCE; Schema: public; Owner: vatandoshlar_usr
--

CREATE SEQUENCE public.view_counts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.view_counts_id_seq OWNER TO vatandoshlar_usr;

--
-- Name: view_counts; Type: TABLE; Schema: public; Owner: vatandoshlar_usr
--

CREATE TABLE public.view_counts (
    id bigint DEFAULT nextval('public.view_counts_id_seq'::regclass) NOT NULL,
    viewable_type character varying(255) NOT NULL,
    viewable_id bigint NOT NULL,
    ip_address character varying(45) NOT NULL,
    user_agent text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    page_section_created_at timestamp without time zone
);


ALTER TABLE public.view_counts OWNER TO vatandoshlar_usr;

--
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: vatandoshlar_usr
--

COPY public.cache (key, value, expiration) FROM stdin;
laravel-cache-setting_global	TzoxODoiQXBwXE1vZGVsc1xTZXR0aW5nIjozMzp7czoxMzoiACoAY29ubmVjdGlvbiI7czo1OiJwZ3NxbCI7czo4OiIAKgB0YWJsZSI7czo4OiJzZXR0aW5ncyI7czoxMzoiACoAcHJpbWFyeUtleSI7czoyOiJpZCI7czoxMDoiACoAa2V5VHlwZSI7czozOiJpbnQiO3M6MTI6ImluY3JlbWVudGluZyI7YjoxO3M6NzoiACoAd2l0aCI7YTowOnt9czoxMjoiACoAd2l0aENvdW50IjthOjA6e31zOjE5OiJwcmV2ZW50c0xhenlMb2FkaW5nIjtiOjA7czoxMDoiACoAcGVyUGFnZSI7aToxNTtzOjY6ImV4aXN0cyI7YjoxO3M6MTg6Indhc1JlY2VudGx5Q3JlYXRlZCI7YjowO3M6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDtzOjEzOiIAKgBhdHRyaWJ1dGVzIjthOjE4OntzOjI6ImlkIjtpOjE7czo1OiJ0aXRsZSI7czoxMDU6InsiZW4iOiAiVmF0YW5kb3NobGFyIGphbW9hdCBmb25kaSIsICJydSI6ICJWYXRhbmRvc2hsYXIgamFtb2F0IGZvbmRpIiwgInV6IjogIlZhdGFuZG9zaGxhciBqYW1vYXQgZm9uZGkifSI7czoxNjoibWV0YV9kZXNjcmlwdGlvbiI7czo2NDoieyJlbiI6IG51bGwsICJydSI6ICJQcm9FbmQiLCAidXoiOiAiVmF0YW5kb3NobGFyIGphbW9hdCBmb25kaTIifSI7czoxMzoibWV0YV9rZXl3b3JkcyI7czo2MDoieyJlbiI6IG51bGwsICJydSI6ICJQcm9FbmQsIFByb0VuZCIsICJ1eiI6ICJQcm9FbmQsIFByb0VuZCJ9IjtzOjU6ImVtYWlsIjtOO3M6Njoic3RhdHVzIjtiOjA7czoxMjoibWFpbl9wYWdlX2lkIjtpOjM4O3M6OToiYWRtaW5faXBzIjtOO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjUtMTItMjAgMTU6MjI6NTIiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjYtMDEtMjIgMTU6NDA6MDgiO3M6MTA6InNlYXJjaF9pZHMiO3M6MjA6IlsiNiIsIjE0IiwiMjYiLCIzOCJdIjtzOjExOiJzb3J0aW5nX2lkcyI7czo2OiJbIjI2Il0iO3M6OToiYm90X3Rva2VuIjtOO3M6NzoiY2hhdF9pZCI7TjtzOjEwOiJ3ZWVrX3Nob3J0IjtzOjEzMToieyJlbiI6ICJTdW4sIE1vbiwgVHVlLCBXZWQsIFRodSwgRnJpLCBTYXQiLCAicnUiOiAi0JLRgSwg0J/QvSwg0JLRgiwg0KHRgCwg0KfRgiwg0J/Rgiwg0KHQsSIsICJ1eiI6ICJZYWssIER1LCBTZSwgQ2gsIFBhLCBKdSwgU2hhIn0iO3M6OToid2Vla19sb25nIjtzOjI4MDoieyJlbiI6ICJTdW5kYXksIE1vbmRheSwgVHVlc2RheSwgV2VkbmVzZGF5LCBUaHVyc2RheSwgRnJpZGF5LCBTYXR1cmRheSIsICJydSI6ICLQktC+0YHQutGA0LXRgdC10L3RjNC1LCDQn9C+0L3QtdC00LXQu9GM0L3QuNC6LCDQktGC0L7RgNC90LjQuiwg0KHRgNC10LTQsCwg0KfQtdGC0LLQtdGA0LMsINCf0Y/RgtC90LjRhtCwLCDQodGD0LHQsdC+0YLQsCIsICJ1eiI6ICJZYWtzaGFuYmEsIER1c2hhbmJhLCBTZXNoYW5iYSwgQ2hvcnNoYW5iYSwgUGF5c2hhbmJhLCBKdW1hLCBTaGFuYmEifSI7czoxMDoibW9udGhfbG9uZyI7czozNzE6InsiZW4iOiAiSmFudWFyeSwgRmVicnVhcnksIE1hcmNoLCBBcHJpbCwgTWF5LCBKdW5lLCBKdWx5LCBBdWd1c3QsIFNlcHRlbWJlciwgT2N0b2JlciwgTm92ZW1iZXIsIERlY2VtYmVyIiwgInJ1IjogItCv0L3QstCw0YDRjCwg0KTQtdCy0YDQsNC70YwsINCc0LDRgNGCLCDQkNC/0YDQtdC70YwsINCc0LDQuSwg0JjRjtC90YwsINCY0Y7Qu9GMLCDQkNCy0LPRg9GB0YIsINCh0LXQvdGC0Y/QsdGA0YwsINCe0LrRgtGP0LHRgNGMLCDQndC+0Y/QsdGA0YwsINCU0LXQutCw0LHRgNGMIiwgInV6IjogIllhbnZhciwgRmV2cmFsLCBNYXJ0LCBBcHJlbCwgTWF5LCBJeXVuLCBJeXVsLCBBdmd1c3QsIFNlbnR5YWJyLCBPa3R5YWJyLCBOb3lhYnIsIERla2FiciJ9IjtzOjExOiJtb250aF9zaG9ydCI7czoyNDA6InsiZW4iOiAiSmFuLCBGZWIsIE1hciwgQXByLCBNYXksIEp1biwgSnVsLCBBdWcsIFNlcCwgT2N0LCBOb3YsIERlYyIsICJydSI6ICLQr9C90LIsINCk0LXQsiwg0JzQsNGALCDQkNC/0YAsINCc0LDQuSwg0JjRjtC9LCDQmNGO0LssINCQ0LLQsywg0KHQtdC9LCDQntC60YIsINCd0L7Rjywg0JTQtdC6IiwgInV6IjogIllhbiwgRmV2LCBNYXIsIEFwciwgTWF5LCBJeW4sIEl5bCwgQXZnLCBTZW4sIE9rdCwgTm95LCBEZWsifSI7fXM6MTE6IgAqAG9yaWdpbmFsIjthOjE4OntzOjI6ImlkIjtpOjE7czo1OiJ0aXRsZSI7czoxMDU6InsiZW4iOiAiVmF0YW5kb3NobGFyIGphbW9hdCBmb25kaSIsICJydSI6ICJWYXRhbmRvc2hsYXIgamFtb2F0IGZvbmRpIiwgInV6IjogIlZhdGFuZG9zaGxhciBqYW1vYXQgZm9uZGkifSI7czoxNjoibWV0YV9kZXNjcmlwdGlvbiI7czo2NDoieyJlbiI6IG51bGwsICJydSI6ICJQcm9FbmQiLCAidXoiOiAiVmF0YW5kb3NobGFyIGphbW9hdCBmb25kaTIifSI7czoxMzoibWV0YV9rZXl3b3JkcyI7czo2MDoieyJlbiI6IG51bGwsICJydSI6ICJQcm9FbmQsIFByb0VuZCIsICJ1eiI6ICJQcm9FbmQsIFByb0VuZCJ9IjtzOjU6ImVtYWlsIjtOO3M6Njoic3RhdHVzIjtiOjA7czoxMjoibWFpbl9wYWdlX2lkIjtpOjM4O3M6OToiYWRtaW5faXBzIjtOO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjUtMTItMjAgMTU6MjI6NTIiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjYtMDEtMjIgMTU6NDA6MDgiO3M6MTA6InNlYXJjaF9pZHMiO3M6MjA6IlsiNiIsIjE0IiwiMjYiLCIzOCJdIjtzOjExOiJzb3J0aW5nX2lkcyI7czo2OiJbIjI2Il0iO3M6OToiYm90X3Rva2VuIjtOO3M6NzoiY2hhdF9pZCI7TjtzOjEwOiJ3ZWVrX3Nob3J0IjtzOjEzMToieyJlbiI6ICJTdW4sIE1vbiwgVHVlLCBXZWQsIFRodSwgRnJpLCBTYXQiLCAicnUiOiAi0JLRgSwg0J/QvSwg0JLRgiwg0KHRgCwg0KfRgiwg0J/Rgiwg0KHQsSIsICJ1eiI6ICJZYWssIER1LCBTZSwgQ2gsIFBhLCBKdSwgU2hhIn0iO3M6OToid2Vla19sb25nIjtzOjI4MDoieyJlbiI6ICJTdW5kYXksIE1vbmRheSwgVHVlc2RheSwgV2VkbmVzZGF5LCBUaHVyc2RheSwgRnJpZGF5LCBTYXR1cmRheSIsICJydSI6ICLQktC+0YHQutGA0LXRgdC10L3RjNC1LCDQn9C+0L3QtdC00LXQu9GM0L3QuNC6LCDQktGC0L7RgNC90LjQuiwg0KHRgNC10LTQsCwg0KfQtdGC0LLQtdGA0LMsINCf0Y/RgtC90LjRhtCwLCDQodGD0LHQsdC+0YLQsCIsICJ1eiI6ICJZYWtzaGFuYmEsIER1c2hhbmJhLCBTZXNoYW5iYSwgQ2hvcnNoYW5iYSwgUGF5c2hhbmJhLCBKdW1hLCBTaGFuYmEifSI7czoxMDoibW9udGhfbG9uZyI7czozNzE6InsiZW4iOiAiSmFudWFyeSwgRmVicnVhcnksIE1hcmNoLCBBcHJpbCwgTWF5LCBKdW5lLCBKdWx5LCBBdWd1c3QsIFNlcHRlbWJlciwgT2N0b2JlciwgTm92ZW1iZXIsIERlY2VtYmVyIiwgInJ1IjogItCv0L3QstCw0YDRjCwg0KTQtdCy0YDQsNC70YwsINCc0LDRgNGCLCDQkNC/0YDQtdC70YwsINCc0LDQuSwg0JjRjtC90YwsINCY0Y7Qu9GMLCDQkNCy0LPRg9GB0YIsINCh0LXQvdGC0Y/QsdGA0YwsINCe0LrRgtGP0LHRgNGMLCDQndC+0Y/QsdGA0YwsINCU0LXQutCw0LHRgNGMIiwgInV6IjogIllhbnZhciwgRmV2cmFsLCBNYXJ0LCBBcHJlbCwgTWF5LCBJeXVuLCBJeXVsLCBBdmd1c3QsIFNlbnR5YWJyLCBPa3R5YWJyLCBOb3lhYnIsIERla2FiciJ9IjtzOjExOiJtb250aF9zaG9ydCI7czoyNDA6InsiZW4iOiAiSmFuLCBGZWIsIE1hciwgQXByLCBNYXksIEp1biwgSnVsLCBBdWcsIFNlcCwgT2N0LCBOb3YsIERlYyIsICJydSI6ICLQr9C90LIsINCk0LXQsiwg0JzQsNGALCDQkNC/0YAsINCc0LDQuSwg0JjRjtC9LCDQmNGO0LssINCQ0LLQsywg0KHQtdC9LCDQntC60YIsINCd0L7Rjywg0JTQtdC6IiwgInV6IjogIllhbiwgRmV2LCBNYXIsIEFwciwgTWF5LCBJeW4sIEl5bCwgQXZnLCBTZW4sIE9rdCwgTm95LCBEZWsifSI7fXM6MTA6IgAqAGNoYW5nZXMiO2E6MDp7fXM6MTE6IgAqAHByZXZpb3VzIjthOjA6e31zOjg6IgAqAGNhc3RzIjthOjEwOntzOjU6InRpdGxlIjtzOjU6ImFycmF5IjtzOjEwOiJzZWFyY2hfaWRzIjtzOjU6ImFycmF5IjtzOjExOiJzb3J0aW5nX2lkcyI7czo1OiJhcnJheSI7czoxNjoibWV0YV9kZXNjcmlwdGlvbiI7czo1OiJhcnJheSI7czoxMzoibWV0YV9rZXl3b3JkcyI7czo1OiJhcnJheSI7czo2OiJzdGF0dXMiO3M6NzoiYm9vbGVhbiI7czoxMDoid2Vla19zaG9ydCI7czo1OiJhcnJheSI7czo5OiJ3ZWVrX2xvbmciO3M6NToiYXJyYXkiO3M6MTA6Im1vbnRoX2xvbmciO3M6NToiYXJyYXkiO3M6MTE6Im1vbnRoX3Nob3J0IjtzOjU6ImFycmF5Ijt9czoxNzoiACoAY2xhc3NDYXN0Q2FjaGUiO2E6MDp7fXM6MjE6IgAqAGF0dHJpYnV0ZUNhc3RDYWNoZSI7YTowOnt9czoxMzoiACoAZGF0ZUZvcm1hdCI7TjtzOjEwOiIAKgBhcHBlbmRzIjthOjA6e31zOjE5OiIAKgBkaXNwYXRjaGVzRXZlbnRzIjthOjA6e31zOjE0OiIAKgBvYnNlcnZhYmxlcyI7YTowOnt9czoxMjoiACoAcmVsYXRpb25zIjthOjA6e31zOjEwOiIAKgB0b3VjaGVzIjthOjA6e31zOjI3OiIAKgByZWxhdGlvbkF1dG9sb2FkQ2FsbGJhY2siO047czoyNjoiACoAcmVsYXRpb25BdXRvbG9hZENvbnRleHQiO047czoxMDoidGltZXN0YW1wcyI7YjoxO3M6MTM6InVzZXNVbmlxdWVJZHMiO2I6MDtzOjk6IgAqAGhpZGRlbiI7YTowOnt9czoxMDoiACoAdmlzaWJsZSI7YTowOnt9czoxMToiACoAZmlsbGFibGUiO2E6MTU6e2k6MDtzOjU6InRpdGxlIjtpOjE7czoxNjoibWV0YV9kZXNjcmlwdGlvbiI7aToyO3M6MTM6Im1ldGFfa2V5d29yZHMiO2k6MztzOjU6ImVtYWlsIjtpOjQ7czo2OiJzdGF0dXMiO2k6NTtzOjEyOiJtYWluX3BhZ2VfaWQiO2k6NjtzOjk6ImFkbWluX2lwcyI7aTo3O3M6MTA6InNlYXJjaF9pZHMiO2k6ODtzOjExOiJzb3J0aW5nX2lkcyI7aTo5O3M6OToiYm90X3Rva2VuIjtpOjEwO3M6NzoiY2hhdF9pZCI7aToxMTtzOjEwOiJ3ZWVrX3Nob3J0IjtpOjEyO3M6OToid2Vla19sb25nIjtpOjEzO3M6MTA6Im1vbnRoX2xvbmciO2k6MTQ7czoxMToibW9udGhfc2hvcnQiO31zOjEwOiIAKgBndWFyZGVkIjthOjE6e2k6MDtzOjE6IioiO319	1769097664
laravel-cache-lang	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	1769097664
laravel-cache-menu	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	1769097664
laravel-cache-static_value:more:url:uz	s:5:"about";	1769100964
laravel-cache-static_value:more:title:uz	s:8:"Batafsil";	1769100964
laravel-cache-static_value:news:title:uz	s:11:"Yangiliklar";	1769100964
laravel-cache-static_value:all:title:uz	s:8:"Barchasi";	1769100964
laravel-cache-static_value:projects:title:uz	s:13:"Loyihalarimiz";	1769100964
laravel-cache-static_value:newspapers:title:uz	s:9:"Gazetalar";	1769100964
laravel-cache-static_value:statisctic:title:uz	s:10:"Statistika";	1769100964
laravel-cache-static_value:volunteers:title:uz	s:16:"Volontyorlarimiz";	1769100964
laravel-cache-static_value:knowledge:title:uz	s:20:"Ilmni rivojlantirish";	1769100964
laravel-cache-static_value:download :title:uz	N;	1769100964
laravel-cache-static_value:keyboard:title:uz	s:20:"Platformaga o’tish";	1769100964
laravel-cache-static_value:podcasts:title:uz	s:26:"Podkastlarimizga havolalar";	1769100964
laravel-cache-static_value:mutoola:title:uz	s:38:"- eng sara audio va elektron kitoblar!";	1769100964
laravel-cache-static_value:download:title:uz	s:65:"O‘zbek tilidagi eng katta mobil kutubxonani hozir yuklab oling!";	1769100964
laravel-cache-static_value:site:title:uz	s:21:"Mutolaa saytiga otish";	1769100964
laravel-cache-static_value:platform:title:uz	s:38:"Elektron murojaat yuborish platformasi";	1769100964
laravel-cache-static_value:join-us:title:uz	s:76:"Biz barcha sizni qiynayotga muammoga yo’l topaolamiz. Bizga murojat qiling";	1769100964
laravel-cache-static_value:button1:title:uz	s:17:"Murojaat yuborish";	1769100964
laravel-cache-static_value:video_l:url:uz	s:61:"https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW";	1769100964
laravel-cache-static_value:video_l:title:uz	s:17:"Video qo’llanma";	1769100964
laravel-cache-static_value:vatandosh:title:uz	s:29:"Vatandoshlar safida bo‘ling";	1769100964
laravel-cache-static_value:vatandosh1:title:uz	s:69:"“Vatandoshlar” jamoat fondiga a’zo bo‘lish uchun ariza bering";	1769100964
laravel-cache-setting_global_image_main	s:87:"http://vatandoshlar.7z7.uz/storage/settings/a0e3313c-3d27-490e-91bf-6e109a4f36c4157.png";	1769097664
laravel-cache-setting_global_image_secondary	s:87:"http://vatandoshlar.7z7.uz/storage/settings/a0e178d2-8396-456a-b547-a15e69f4ca64127.jpg";	1769097664
laravel-cache-static_value:vatandoshlar:title:uz	s:18:"“Vatandoshlar”";	1769100964
laravel-cache-static_value:vatandoshlar:content:uz	s:12:"Jamoat Fondi";	1769100964
laravel-cache-static_value:search:title:uz	s:28:"Qidiruv so'zingizni kiriting";	1769100964
laravel-cache-static_value:menu:title:uz	s:5:"Menyu";	1769100964
laravel-cache-static_value:agency:title:uz	s:108:"O'zbekiston Respublikasi Prezidenti Administratsiyasi huzuridagi ta'lim sifatini ta'minlash milliy agentligi";	1769100964
laravel-cache-static_value:phonenumber:description:uz	s:18:"+998(55) 502-22-66";	1769100964
laravel-cache-static_value:phonenumber:title:uz	s:13:"Telefon raqam";	1769100964
laravel-cache-static_value:email:description:uz	s:16:"info@example.com";	1769100964
laravel-cache-static_value:email:title:uz	s:15:"Elektron pochta";	1769100964
laravel-cache-static_value:adress_info:content:uz	s:63:"100100, Toshkent sh., Yakkasaroy tumani, Bobur ko'chasi, 30-uy.";	1769100964
laravel-cache-static_value:adress_info:title:uz	s:6:"Manzil";	1769100964
laravel-cache-static_value:safe:title:uz	s:57:"©2025 VATANDOSHLAR FONDI. Barcha huquqlari himoyalangan.";	1769100964
laravel-cache-static_value:develop:title:uz	s:16:"Ishlab chiquvchi";	1769100964
\.


--
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: vatandoshlar_usr
--

COPY public.cache_locks (key, owner, expiration) FROM stdin;
\.


--
-- Data for Name: content_images; Type: TABLE DATA; Schema: public; Owner: vatandoshlar_usr
--

COPY public.content_images (id, content_id, image, compressed, type, size, main, status, created_at, updated_at, category, sort_order, poster) FROM stdin;
6	35	contents/1768287498_Vector (5).png	\N	image/png	2413	f	t	2026-01-13 06:58:19	2026-01-13 06:58:19	\N	\N	\N
7	35	contents/1768287499_Frame 1321315991 (16).png	\N	image/png	1642	f	t	2026-01-13 06:58:19	2026-01-13 06:58:19	\N	\N	\N
8	35	contents/1768287596_Vector (5).png	\N	image/png	2413	f	t	2026-01-13 06:59:56	2026-01-13 06:59:56	\N	\N	\N
9	35	contents/1768287841_Vector (5).png	\N	image/png	2413	f	t	2026-01-13 07:04:01	2026-01-13 07:04:01	\N	\N	\N
10	35	contents/1768287863_Frame 1321315991 (16).png	\N	image/png	1642	f	t	2026-01-13 07:04:23	2026-01-13 07:04:23	\N	\N	\N
\.


--
-- Data for Name: content_settings; Type: TABLE DATA; Schema: public; Owner: vatandoshlar_usr
--

COPY public.content_settings (id, key, label, type, required, is_translatable, options, sort_order, relation, status, created_at, updated_at, category) FROM stdin;
1	title	Title	text	t	t	\N	1	\N	t	\N	2026-01-08 12:17:12	list
2	key	Key	text	t	f	\N	1	\N	t	\N	2026-01-08 12:17:12	list
3	url	Url	text	t	f	\N	1	\N	t	2026-01-20 13:22:31	2026-01-20 13:22:39	\N
4	description	description	text	t	f	\N	1	\N	t	2026-01-21 13:10:14	2026-01-21 13:10:53	\N
5	content	content	text	t	t	\N	1	\N	t	2026-01-21 13:23:52	2026-01-21 13:23:52	\N
6	short_description	Short description	text	t	t	\N	1	\N	t	2026-01-22 11:06:18	2026-01-22 11:06:18	\N
\.


--
-- Data for Name: content_translations; Type: TABLE DATA; Schema: public; Owner: vatandoshlar_usr
--

COPY public.content_translations (id, content_id, locale, data, created_at, updated_at, category) FROM stdin;
25	7	uz	{"title": "Loyihalarimiz"}	2026-01-05 06:08:08	2026-01-08 12:17:27	list
26	7	ru	{"title": "Наши проекты"}	2026-01-05 06:08:08	2026-01-08 12:17:27	list
27	7	en	{"title": "Projects"}	2026-01-05 06:08:08	2026-01-08 12:17:27	list
28	7	\N	{"key": "projects"}	2026-01-05 06:08:08	2026-01-08 12:17:27	list
29	8	uz	{"title": "Gazetalar"}	2026-01-05 06:08:54	2026-01-08 12:17:27	list
30	8	ru	{"title": "Газеты"}	2026-01-05 06:08:54	2026-01-08 12:17:27	list
31	8	en	{"title": "Newspapers"}	2026-01-05 06:08:54	2026-01-08 12:17:27	list
32	8	\N	{"key": "newspapers"}	2026-01-05 06:08:54	2026-01-08 12:17:27	list
33	9	uz	{"title": "Volontyorlarimiz"}	2026-01-05 06:09:45	2026-01-08 12:17:27	list
34	9	ru	{"title": "Наши волонтеры"}	2026-01-05 06:09:45	2026-01-08 12:17:27	list
35	9	en	{"title": "Our volunteers"}	2026-01-05 06:09:45	2026-01-08 12:17:27	list
36	9	\N	{"key": "volunteers"}	2026-01-05 06:09:45	2026-01-08 12:17:27	list
41	11	uz	{"title": "Podkastlarimizga havolalar"}	2026-01-05 06:11:20	2026-01-08 12:17:27	list
42	11	ru	{"title": "Ссылки на наши подкасты"}	2026-01-05 06:11:20	2026-01-08 12:17:27	list
43	11	en	{"title": "Links to our podcasts"}	2026-01-05 06:11:20	2026-01-08 12:17:27	list
44	11	\N	{"key": "podcasts"}	2026-01-05 06:11:20	2026-01-08 12:17:27	list
45	12	uz	{"title": "- eng sara audio va elektron kitoblar!"}	2026-01-05 06:12:41	2026-01-08 12:17:27	list
46	12	ru	{"title": "— Лучшие аудиокниги и электронные книги!"}	2026-01-05 06:12:41	2026-01-08 12:17:27	list
47	12	en	{"title": "— The best audiobooks and e-books!"}	2026-01-05 06:12:41	2026-01-08 12:17:27	list
48	12	\N	{"key": "mutoola"}	2026-01-05 06:12:41	2026-01-08 12:17:27	list
49	13	uz	{"title": "O‘zbek tilidagi eng katta mobil kutubxonani hozir yuklab oling!"}	2026-01-05 06:13:52	2026-01-08 12:17:27	list
50	13	ru	{"title": "Скачайте крупнейшую мобильную библиотеку на узбекском языке прямо сейчас!"}	2026-01-05 06:13:52	2026-01-08 12:17:27	list
51	13	en	{"title": "Download the largest mobile library in the Uzbek language now!"}	2026-01-05 06:13:52	2026-01-08 12:17:27	list
52	13	\N	{"key": "download"}	2026-01-05 06:13:52	2026-01-08 12:17:27	list
53	14	uz	{"title": "Mutolaa saytiga otish"}	2026-01-05 06:15:07	2026-01-08 12:17:27	list
54	14	ru	{"title": "Перейдите на сайт для чтения"}	2026-01-05 06:15:07	2026-01-08 12:17:27	list
55	14	en	{"title": "Go to the reading site"}	2026-01-05 06:15:07	2026-01-08 12:17:27	list
56	14	\N	{"key": "site"}	2026-01-05 06:15:07	2026-01-08 12:17:27	list
167	42	en	{"title": "Working hours:"}	2026-01-13 09:01:18	2026-01-13 09:01:18	\N
168	42	\N	{"key": "work-time"}	2026-01-13 09:01:18	2026-01-13 09:01:18	\N
61	16	uz	{"title": "Biz barcha sizni qiynayotga muammoga yo’l topaolamiz. Bizga murojat qiling"}	2026-01-05 06:17:30	2026-01-08 12:17:27	list
12	3	\N	{"key": "email", "url": null, "description": "info@vatandoshlarfondi.uz"}	2025-12-29 11:34:55	2026-02-13 10:48:27	list
24	6	\N	{"key": "forum", "url": null, "description": null}	2025-12-29 13:28:11	2026-02-24 08:21:31	list
9	3	uz	{"title": "Elektron pochta", "content": null, "short_description": null}	2025-12-29 11:34:55	2026-02-13 10:48:27	list
20	5	\N	{"key": "agency", "url": null, "description": null}	2025-12-29 11:37:26	2026-02-13 11:00:46	list
21	6	uz	{"title": "O'tkazilgan loyihadan videolar", "content": null, "short_description": null}	2025-12-29 13:28:11	2026-02-24 08:21:31	list
22	6	ru	{"title": "Видео из проведенного проекта", "content": null, "short_description": null}	2025-12-29 13:28:11	2026-02-24 08:21:31	list
23	6	en	{"title": "Videos from the Completed Project", "content": null, "short_description": null}	2025-12-29 13:28:11	2026-02-24 08:21:31	list
3	1	en	{"title": "News", "content": null}	2025-12-29 11:28:37	2026-01-22 06:48:12	list
8	2	\N	{"key": "phone", "url": null, "description": "+998(55) 502-22-99"}	2025-12-29 11:34:12	2026-02-13 10:57:52	list
17	5	uz	{"title": "\\"Vatandoshlar\\" jamoat fondi — xorijdagi vatandoshlarimiz bilan aloqalar o'rnatish, ularning huquqlarini himoya qilish va Vatan taraqqiyotiga hissa qo'shishlariga yordam beruvchi notijorat tashkilot.", "content": null, "short_description": null}	2025-12-29 11:37:26	2026-02-13 11:00:46	list
5	2	uz	{"title": "Telefon raqam", "content": null, "short_description": null}	2025-12-29 11:34:12	2026-02-13 10:57:52	list
6	2	ru	{"title": "Номер телефона", "content": null, "short_description": null}	2025-12-29 11:34:12	2026-02-13 10:57:52	list
7	2	en	{"title": "Phone number", "content": null, "short_description": null}	2025-12-29 11:34:12	2026-02-13 10:57:52	list
14	4	ru	{"title": "Адрес", "content": "Узбекистан, город Ташкент, Яккасарайский район, улица Бабура, 45"}	2025-12-29 11:36:08	2026-01-21 13:24:41	list
15	4	en	{"title": "Address", "content": "Uzbekistan, Tashkent city, Yakkasaroy district, Babur street, 45"}	2025-12-29 11:36:08	2026-01-21 13:24:41	list
16	4	\N	{"key": "address", "url": null, "description": null}	2025-12-29 11:36:08	2026-01-21 13:24:41	list
170	43	ru	{"title": "Понедельник-пятница:"}	2026-01-13 09:02:14	2026-01-21 13:21:14	\N
13	4	uz	{"title": "Manzil", "content": "O'zbekiston, Toshkent shahri, Yakkasaroy tumani, Bobur ko'chasi, 45-uy"}	2025-12-29 11:36:08	2026-01-21 13:24:41	list
4	1	\N	{"key": "news", "url": null, "description": null}	2025-12-29 11:28:37	2026-01-22 06:48:12	list
10	3	ru	{"title": "Электрон почта", "content": null, "short_description": null}	2025-12-29 11:34:55	2026-02-13 10:48:27	list
11	3	en	{"title": "Email", "content": null, "short_description": null}	2025-12-29 11:34:55	2026-02-13 10:48:27	list
62	16	ru	{"title": "Мы можем помочь вам с любой проблемой. Свяжитесь с нами."}	2026-01-05 06:17:30	2026-01-08 12:17:27	list
63	16	en	{"title": "We can help you with any problem. Contact us."}	2026-01-05 06:17:30	2026-01-08 12:17:27	list
64	16	\N	{"key": "callus"}	2026-01-05 06:17:30	2026-01-08 12:17:27	list
69	18	uz	{"title": "Video qo'llanma"}	2026-01-05 06:19:15	2026-01-08 12:17:27	list
70	18	ru	{"title": "Видеоинструкция"}	2026-01-05 06:19:15	2026-01-08 12:17:27	list
71	18	en	{"title": "Video instructions"}	2026-01-05 06:19:15	2026-01-08 12:17:27	list
72	18	\N	{"key": "button2"}	2026-01-05 06:19:15	2026-01-08 12:17:27	list
73	19	uz	{"title": "Vatandoshlar safida bo‘ling"}	2026-01-05 06:20:38	2026-01-08 12:17:27	list
74	19	ru	{"title": "Будьте среди своих соотечественников."}	2026-01-05 06:20:38	2026-01-08 12:17:27	list
75	19	en	{"title": "Be among your compatriots"}	2026-01-05 06:20:38	2026-01-08 12:17:27	list
76	19	\N	{"key": "vatandosh"}	2026-01-05 06:20:38	2026-01-08 12:17:27	list
77	20	uz	{"title": "“Vatandoshlar” jamoat fondiga a’zo bo‘lish uchun ariza bering"}	2026-01-05 06:21:27	2026-01-08 12:17:27	list
78	20	ru	{"title": "Подайте заявку на членство в общественном фонде «Ватандошлар»."}	2026-01-05 06:21:27	2026-01-08 12:17:27	list
79	20	en	{"title": "Apply to join the \\"Vatandoshlar\\" Public Foundation"}	2026-01-05 06:21:27	2026-01-08 12:17:27	list
80	20	\N	{"key": "vatandosh1"}	2026-01-05 06:21:27	2026-01-08 12:17:27	list
81	21	uz	{"title": "Siz yuklab olish yoki havola orqali o’tishingiz mumkin"}	2026-01-05 06:43:23	2026-01-08 12:17:27	list
82	21	ru	{"title": "Вы можете скачать файл или перейти по ссылке."}	2026-01-05 06:43:23	2026-01-08 12:17:27	list
83	21	en	{"title": "You can download the yoki files by following the link."}	2026-01-05 06:43:23	2026-01-08 12:17:27	list
84	21	\N	{"key": "the link"}	2026-01-05 06:43:23	2026-01-08 12:17:27	list
85	22	uz	{"title": "O’zbek tilini o’rganish platformasiga marxamat"}	2026-01-05 06:54:59	2026-01-08 12:17:27	list
86	22	ru	{"title": "Добро пожаловать на платформу для изучения узбекского языка!"}	2026-01-05 06:54:59	2026-01-08 12:17:27	list
87	22	en	{"title": "Welcome to the Uzbek language learning platform!"}	2026-01-05 06:54:59	2026-01-08 12:17:27	list
88	22	\N	{"key": "uzbek"}	2026-01-05 06:54:59	2026-01-08 12:17:27	list
89	23	uz	{"title": "Platformaga o’tish"}	2026-01-05 06:57:49	2026-01-08 12:17:27	list
90	23	ru	{"title": "Перейдите на платформу"}	2026-01-05 06:57:49	2026-01-08 12:17:27	list
91	23	en	{"title": "Go to the platform"}	2026-01-05 06:57:49	2026-01-08 12:17:27	list
92	23	\N	{"key": "keyboard"}	2026-01-05 06:57:49	2026-01-08 12:17:27	list
93	24	uz	{"title": "Barchasi"}	2026-01-05 06:58:49	2026-01-08 12:17:27	list
94	24	ru	{"title": "Все"}	2026-01-05 06:58:49	2026-01-08 12:17:27	list
95	24	en	{"title": "All"}	2026-01-05 06:58:49	2026-01-08 12:17:27	list
96	24	\N	{"key": "all"}	2026-01-05 06:58:49	2026-01-08 12:17:27	list
137	35	uz	{"title": "newtext"}	2026-01-13 06:58:18	2026-01-13 06:58:18	\N
138	35	ru	{"title": null}	2026-01-13 06:58:18	2026-01-13 06:58:18	\N
139	35	en	{"title": null}	2026-01-13 06:58:18	2026-01-13 06:58:18	\N
140	35	\N	{"key": "newtext"}	2026-01-13 06:58:18	2026-01-13 06:58:18	\N
153	39	uz	{"title": "Telefon raqamingiz:"}	2026-01-13 08:55:47	2026-01-13 08:55:47	\N
154	39	ru	{"title": "Ваш номер телефона:"}	2026-01-13 08:55:47	2026-01-13 08:55:47	\N
155	39	en	{"title": "Your phone number:"}	2026-01-13 08:55:47	2026-01-13 08:55:47	\N
156	39	\N	{"key": "number"}	2026-01-13 08:55:47	2026-01-13 08:55:47	\N
157	40	uz	{"title": "Xabar matni:"}	2026-01-13 08:58:06	2026-01-13 08:58:06	\N
158	40	ru	{"title": "Текст сообщения:"}	2026-01-13 08:58:06	2026-01-13 08:58:06	\N
159	40	en	{"title": "Message text:"}	2026-01-13 08:58:06	2026-01-13 08:58:06	\N
160	40	\N	{"key": "message"}	2026-01-13 08:58:06	2026-01-13 08:58:06	\N
145	37	uz	{"title": "Biz bilan bog'lanish uchun ariza shakli"}	2026-01-13 08:52:06	2026-01-13 08:52:06	\N
146	37	ru	{"title": "Форма заявки для связи с нами"}	2026-01-13 08:52:06	2026-01-13 08:52:06	\N
147	37	en	{"title": "Application form to contact us"}	2026-01-13 08:52:06	2026-01-13 08:52:06	\N
148	37	\N	{"key": "contactmessage"}	2026-01-13 08:52:06	2026-01-13 08:52:06	\N
149	38	uz	{"title": "To'liq ismingiz:"}	2026-01-13 08:55:00	2026-01-13 08:55:00	\N
150	38	ru	{"title": "Ваше полное имя:"}	2026-01-13 08:55:00	2026-01-13 08:55:00	\N
151	38	en	{"title": "Your full name:"}	2026-01-13 08:55:00	2026-01-13 08:55:00	\N
152	38	\N	{"key": "fullname"}	2026-01-13 08:55:00	2026-01-13 08:55:00	\N
161	41	uz	{"title": "Yuborish"}	2026-01-13 08:58:55	2026-01-13 08:58:55	\N
162	41	ru	{"title": "Отправлять"}	2026-01-13 08:58:55	2026-01-13 08:58:55	\N
163	41	en	{"title": "Send"}	2026-01-13 08:58:55	2026-01-13 08:58:55	\N
164	41	\N	{"key": "request"}	2026-01-13 08:58:55	2026-01-13 08:58:55	\N
165	42	uz	{"title": "Ish vaqti:"}	2026-01-13 09:01:18	2026-01-13 09:01:18	\N
166	42	ru	{"title": "Рабочее время:"}	2026-01-13 09:01:18	2026-01-13 09:01:18	\N
68	17	\N	{"key": "button1"}	2026-01-05 06:18:28	2026-01-20 13:19:48	list
1	1	uz	{"title": "Yangiliklar", "content": "s"}	2025-12-29 11:28:37	2026-01-22 06:48:12	list
65	17	uz	{"title": "Murojaat yuborish"}	2026-01-05 06:18:28	2026-01-20 13:19:48	list
67	17	en	{"title": "Send a request"}	2026-01-05 06:18:28	2026-01-20 13:19:48	list
2	1	ru	{"title": "Новости", "content": null}	2025-12-29 11:28:37	2026-01-22 06:48:12	list
177	45	uz	{"title": "Ma'lumot"}	2026-01-13 09:09:32	2026-01-13 09:09:32	\N
178	45	ru	{"title": "Информация"}	2026-01-13 09:09:32	2026-01-13 09:09:32	\N
179	45	en	{"title": "Information"}	2026-01-13 09:09:32	2026-01-13 09:09:32	\N
180	45	\N	{"key": "info"}	2026-01-13 09:09:32	2026-01-13 09:09:32	\N
181	46	uz	{"title": "Rahmat!"}	2026-01-13 09:11:01	2026-01-13 09:11:01	\N
182	46	ru	{"title": "Спасибо!"}	2026-01-13 09:11:01	2026-01-13 09:11:01	\N
183	46	en	{"title": "Thank you!"}	2026-01-13 09:11:01	2026-01-13 09:11:01	\N
184	46	\N	{"key": "thanks"}	2026-01-13 09:11:01	2026-01-13 09:11:01	\N
185	47	uz	{"title": "Kontakt ma'lumotlari"}	2026-01-13 09:14:35	2026-01-13 09:14:35	\N
186	47	ru	{"title": "Контактная информация"}	2026-01-13 09:14:35	2026-01-13 09:14:35	\N
187	47	en	{"title": "Contact information"}	2026-01-13 09:14:35	2026-01-13 09:14:35	\N
188	47	\N	{"key": "contacts"}	2026-01-13 09:14:35	2026-01-13 09:14:35	\N
193	49	uz	{"title": "Tug'ilgan sana:"}	2026-01-13 09:22:27	2026-01-13 09:22:27	\N
194	49	ru	{"title": "Дата рождения:"}	2026-01-13 09:22:27	2026-01-13 09:22:27	\N
195	49	en	{"title": "Date of birth:"}	2026-01-13 09:22:27	2026-01-13 09:22:27	\N
196	49	\N	{"key": "birthdate"}	2026-01-13 09:22:27	2026-01-13 09:22:27	\N
197	50	uz	{"title": "Mutaxassisligi:"}	2026-01-13 09:23:17	2026-01-13 09:23:17	\N
198	50	ru	{"title": "Специализация:"}	2026-01-13 09:23:17	2026-01-13 09:23:17	\N
199	50	en	{"title": "Specialization:"}	2026-01-13 09:23:17	2026-01-13 09:23:17	\N
200	50	\N	{"key": "Specialization:"}	2026-01-13 09:23:17	2026-01-13 09:23:17	\N
205	52	uz	{"title": "Yashash manzili:"}	2026-01-13 09:25:09	2026-01-13 09:25:09	\N
206	52	ru	{"title": "Адрес проживания:"}	2026-01-13 09:25:09	2026-01-13 09:25:09	\N
207	52	en	{"title": "Residential address:"}	2026-01-13 09:25:09	2026-01-13 09:25:09	\N
208	52	\N	{"key": "turar-joy"}	2026-01-13 09:25:09	2026-01-13 09:25:09	\N
209	53	uz	{"title": "Email, telefon yoki boshqa bog‘lanish ma’lumoti:"}	2026-01-13 09:25:54	2026-01-13 09:25:54	\N
210	53	ru	{"title": "Адрес электронной почты, номер телефона или другая контактная информация:"}	2026-01-13 09:25:54	2026-01-13 09:25:54	\N
211	53	en	{"title": "Email address, phone number or other contact information:"}	2026-01-13 09:25:54	2026-01-13 09:25:54	\N
212	53	\N	{"key": "add-info"}	2026-01-13 09:25:54	2026-01-13 09:25:54	\N
213	54	uz	{"title": "Takliflar:"}	2026-01-13 09:26:45	2026-01-13 09:26:45	\N
214	54	ru	{"title": "Предложения:"}	2026-01-13 09:26:45	2026-01-13 09:26:45	\N
215	54	en	{"title": "Offers:"}	2026-01-13 09:26:45	2026-01-13 09:26:45	\N
216	54	\N	{"key": "taklif"}	2026-01-13 09:26:45	2026-01-13 09:26:45	\N
217	55	uz	{"title": "Ma'lumot kiriting"}	2026-01-13 09:37:19	2026-01-13 09:37:19	\N
218	55	ru	{"title": "Введите информацию"}	2026-01-13 09:37:19	2026-01-13 09:37:19	\N
219	55	en	{"title": "Enter the information"}	2026-01-13 09:37:19	2026-01-13 09:37:19	\N
220	55	\N	{"key": "info-add"}	2026-01-13 09:37:19	2026-01-13 09:37:19	\N
221	56	uz	{"title": "Manzilni kiriting"}	2026-01-13 09:40:34	2026-01-13 09:40:34	\N
222	56	ru	{"title": "Введите адрес"}	2026-01-13 09:40:34	2026-01-13 09:40:34	\N
223	56	en	{"title": "Enter the address"}	2026-01-13 09:40:34	2026-01-13 09:40:34	\N
224	56	\N	{"key": "the_address"}	2026-01-13 09:40:34	2026-01-13 09:40:34	\N
225	57	uz	{"title": "Bog‘lanish ma’lumoti"}	2026-01-13 09:43:04	2026-01-13 09:43:04	\N
226	57	ru	{"title": "Контактная информация"}	2026-01-13 09:43:04	2026-01-13 09:43:04	\N
227	57	en	{"title": "Contact information"}	2026-01-13 09:43:04	2026-01-13 09:43:04	\N
228	57	\N	{"key": "contact-info"}	2026-01-13 09:43:04	2026-01-13 09:43:04	\N
229	58	uz	{"title": "Yopish"}	2026-01-13 09:45:06	2026-01-13 09:45:06	\N
230	58	ru	{"title": "Закрывать"}	2026-01-13 09:45:06	2026-01-13 09:45:06	\N
231	58	en	{"title": "Close"}	2026-01-13 09:45:06	2026-01-13 09:45:06	\N
232	58	\N	{"key": "close"}	2026-01-13 09:45:06	2026-01-13 09:45:06	\N
245	62	uz	{"title": "Statistika"}	2026-01-13 09:55:53	2026-01-13 09:55:53	\N
234	59	ru	{"title": "Видеоурок"}	2026-01-13 09:50:35	2026-01-20 13:23:02	\N
235	59	en	{"title": "Video tutorial"}	2026-01-13 09:50:35	2026-01-20 13:23:02	\N
169	43	uz	{"title": "Dushanba-Juma:"}	2026-01-13 09:02:14	2026-01-21 13:21:14	\N
171	43	en	{"title": "Monday-Friday:"}	2026-01-13 09:02:14	2026-01-21 13:21:14	\N
172	43	\N	{"key": "work-days", "url": null, "description": "09:00 – 18:00"}	2026-01-13 09:02:14	2026-01-21 13:21:14	\N
239	60	en	{"title": "Electronic appeals submission platform", "content": "You can submit your appeals from anywhere in the world.", "short_description": null}	2026-01-13 09:53:20	2026-02-13 11:28:38	\N
240	60	\N	{"key": "platform", "url": "https://murojaat.vatandoshlar.uz/", "description": null}	2026-01-13 09:53:20	2026-02-13 11:28:38	\N
189	48	uz	{"title": "F.I.Sh (Iltimos, to'lliq kiriting)", "content": null, "short_description": null}	2026-01-13 09:21:50	2026-02-17 09:51:13	\N
237	60	uz	{"title": "Elektron murojaat yuborish platformasi", "content": "Siz dunyoning istalgan joyidan murojaatlaringizni yuborishingiz mumkin.", "short_description": null}	2026-01-13 09:53:20	2026-02-13 11:28:38	\N
238	60	ru	{"title": "Платформа для отправки электронных обращений", "content": "Вы можете отправлять свои обращения из любой точки мира.", "short_description": null}	2026-01-13 09:53:20	2026-02-13 11:28:38	\N
190	48	ru	{"title": "Ф.И.О (Пожалуйста, введите полностью)", "content": null, "short_description": null}	2026-01-13 09:21:50	2026-02-17 09:51:13	\N
191	48	en	{"title": "Full Name (Please enter in full)", "content": null, "short_description": null}	2026-01-13 09:21:50	2026-02-17 09:51:13	\N
192	48	\N	{"key": "pleasure", "url": null, "description": null}	2026-01-13 09:21:50	2026-02-17 09:51:13	\N
201	51	uz	{"title": "Mutaxassislikni kiriting", "content": null, "short_description": null}	2026-01-13 09:24:02	2026-02-17 10:19:18	\N
202	51	ru	{"title": "Введите специальность", "content": null, "short_description": null}	2026-01-13 09:24:02	2026-02-17 10:19:18	\N
203	51	en	{"title": "Введите специальность", "content": null, "short_description": null}	2026-01-13 09:24:02	2026-02-17 10:19:18	\N
204	51	\N	{"key": "select_spec", "url": null, "description": null}	2026-01-13 09:24:02	2026-02-17 10:19:18	\N
246	62	ru	{"title": "Статистика"}	2026-01-13 09:55:53	2026-01-13 09:55:53	\N
247	62	en	{"title": "Statistics"}	2026-01-13 09:55:53	2026-01-13 09:55:53	\N
248	62	\N	{"key": "statisctic"}	2026-01-13 09:55:53	2026-01-13 09:55:53	\N
249	63	uz	{"title": "Ishtirok etish uchun ariza yuborish"}	2026-01-13 10:02:23	2026-01-13 10:02:23	\N
250	63	ru	{"title": "Подайте заявку на участие."}	2026-01-13 10:02:23	2026-01-13 10:02:23	\N
251	63	en	{"title": "Submit an application to participate."}	2026-01-13 10:02:23	2026-01-13 10:02:23	\N
252	63	\N	{"key": "Participation"}	2026-01-13 10:02:23	2026-01-13 10:02:23	\N
253	64	uz	{"title": "Jinsi:"}	2026-01-13 10:03:22	2026-01-13 10:03:22	\N
254	64	ru	{"title": "Пол:"}	2026-01-13 10:03:22	2026-01-13 10:03:22	\N
255	64	en	{"title": "Gender:"}	2026-01-13 10:03:22	2026-01-13 10:03:22	\N
256	64	\N	{"key": "gender"}	2026-01-13 10:03:22	2026-01-13 10:03:22	\N
257	65	uz	{"title": "Tanlang"}	2026-01-13 10:04:30	2026-01-13 10:04:30	\N
258	65	ru	{"title": "Выбирать"}	2026-01-13 10:04:30	2026-01-13 10:04:30	\N
259	65	en	{"title": "Choose"}	2026-01-13 10:04:30	2026-01-13 10:04:30	\N
260	65	\N	{"key": "choose"}	2026-01-13 10:04:30	2026-01-13 10:04:30	\N
261	66	uz	{"title": "Istiqomat qilayotgan davlatingiz:"}	2026-01-13 10:05:28	2026-01-13 10:05:28	\N
262	66	ru	{"title": "Ваша страна проживания:"}	2026-01-13 10:05:28	2026-01-13 10:05:28	\N
263	66	en	{"title": "Your country of residence:"}	2026-01-13 10:05:28	2026-01-13 10:05:28	\N
264	66	\N	{"key": "owncity"}	2026-01-13 10:05:28	2026-01-13 10:05:28	\N
265	67	uz	{"title": "Shahar/tuman:"}	2026-01-13 10:06:22	2026-01-13 10:06:22	\N
266	67	ru	{"title": "Город/район:"}	2026-01-13 10:06:22	2026-01-13 10:06:22	\N
267	67	en	{"title": "City/district:"}	2026-01-13 10:06:22	2026-01-13 10:06:22	\N
268	67	\N	{"key": "city"}	2026-01-13 10:06:22	2026-01-13 10:06:22	\N
269	68	uz	{"title": "Ish joyi:"}	2026-01-13 10:06:59	2026-01-13 10:06:59	\N
270	68	ru	{"title": "Рабочее место:"}	2026-01-13 10:06:59	2026-01-13 10:06:59	\N
271	68	en	{"title": "Workplace:"}	2026-01-13 10:06:59	2026-01-13 10:06:59	\N
272	68	\N	{"key": "workplace:"}	2026-01-13 10:06:59	2026-01-13 10:06:59	\N
273	69	uz	{"title": "Lavozimi:"}	2026-01-13 10:07:40	2026-01-13 10:07:40	\N
274	69	ru	{"title": "Позиция:"}	2026-01-13 10:07:40	2026-01-13 10:07:40	\N
275	69	en	{"title": "Position:"}	2026-01-13 10:07:40	2026-01-13 10:07:40	\N
276	69	\N	{"key": "position"}	2026-01-13 10:07:40	2026-01-13 10:07:40	\N
277	70	uz	{"title": "Ma'lumoti:"}	2026-01-13 10:08:38	2026-01-13 10:08:38	\N
278	70	ru	{"title": "Информация:"}	2026-01-13 10:08:38	2026-01-13 10:08:38	\N
279	70	en	{"title": "Information:"}	2026-01-13 10:08:38	2026-01-13 10:08:38	\N
280	70	\N	{"key": "information"}	2026-01-13 10:08:38	2026-01-13 10:08:38	\N
281	71	uz	{"title": "Fayl:"}	2026-01-13 10:14:53	2026-01-13 10:14:53	\N
282	71	ru	{"title": "Файл:"}	2026-01-13 10:14:53	2026-01-13 10:14:53	\N
283	71	en	{"title": "File:"}	2026-01-13 10:14:53	2026-01-13 10:14:53	\N
284	71	\N	{"key": "file"}	2026-01-13 10:14:53	2026-01-13 10:14:53	\N
285	72	uz	{"title": "Faylni yuklang yoki sudrab torting"}	2026-01-13 10:15:43	2026-01-13 10:15:43	\N
286	72	ru	{"title": "Загрузите или перетащите файл."}	2026-01-13 10:15:43	2026-01-13 10:15:43	\N
287	72	en	{"title": "Upload or drag file"}	2026-01-13 10:15:43	2026-01-13 10:15:43	\N
288	72	\N	{"key": "upload"}	2026-01-13 10:15:43	2026-01-13 10:15:43	\N
289	73	uz	{"title": "Video, rasm, hujjat, PDF, docx, excel va boshqalar"}	2026-01-13 10:16:35	2026-01-13 10:16:35	\N
290	73	ru	{"title": "Видео, изображение, документ, PDF, docx, excel и другие"}	2026-01-13 10:16:35	2026-01-13 10:16:35	\N
291	73	en	{"title": "Video, image, document, PDF, docx, excel and others"}	2026-01-13 10:16:35	2026-01-13 10:16:35	\N
292	73	\N	{"key": "video"}	2026-01-13 10:16:35	2026-01-13 10:16:35	\N
293	74	uz	{"title": "Erkak"}	2026-01-13 10:17:58	2026-01-13 10:17:58	\N
294	74	ru	{"title": "Мужской"}	2026-01-13 10:17:58	2026-01-13 10:17:58	\N
295	74	en	{"title": "Male"}	2026-01-13 10:17:58	2026-01-13 10:17:58	\N
296	74	\N	{"key": "erkak"}	2026-01-13 10:17:58	2026-01-13 10:17:58	\N
297	75	uz	{"title": "Ayol"}	2026-01-13 10:18:27	2026-01-13 10:18:27	\N
298	75	ru	{"title": "Женщина"}	2026-01-13 10:18:27	2026-01-13 10:18:27	\N
299	75	en	{"title": "Woman"}	2026-01-13 10:18:27	2026-01-13 10:18:27	\N
300	75	\N	{"key": "ayol"}	2026-01-13 10:18:27	2026-01-13 10:18:27	\N
301	76	uz	{"title": "Ilmni rivojlantirish"}	2026-01-20 06:50:02	2026-01-20 06:50:02	\N
302	76	ru	{"title": "Развитие науки"}	2026-01-20 06:50:02	2026-01-20 06:50:02	\N
303	76	en	{"title": "Development of science"}	2026-01-20 06:50:02	2026-01-20 06:50:02	\N
304	76	\N	{"key": "knowledge"}	2026-01-20 06:50:02	2026-01-20 06:50:02	\N
66	17	ru	{"title": "Отправить запрос"}	2026-01-05 06:18:28	2026-01-20 13:19:48	list
233	59	uz	{"title": "Video qo’llanma"}	2026-01-13 09:50:35	2026-01-20 13:23:02	\N
236	59	\N	{"key": "video_l", "url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW"}	2026-01-13 09:50:35	2026-01-20 13:23:02	\N
313	79	uz	{"title": "Elektron pochta"}	2026-01-21 13:17:04	2026-01-21 13:17:04	\N
314	79	ru	{"title": "Электронная почта"}	2026-01-21 13:17:04	2026-01-21 13:17:04	\N
315	79	en	{"title": "Email"}	2026-01-21 13:17:04	2026-01-21 13:17:04	\N
316	79	\N	{"key": "email_info", "url": null, "description": "info@vatandoshlarfondi.uz"}	2026-01-21 13:17:04	2026-01-21 13:17:04	\N
320	80	\N	{"key": "adress_info", "url": null, "description": null}	2026-01-21 13:19:30	2026-02-03 19:15:29	\N
305	77	uz	{"title": "Batafsil", "content": null, "short_description": null}	2026-01-21 09:40:03	2026-01-23 06:04:25	\N
307	77	en	{"title": "More details", "content": null, "short_description": null}	2026-01-21 09:40:03	2026-01-23 06:04:25	\N
308	77	\N	{"key": "more", "url": "about", "description": null}	2026-01-21 09:40:03	2026-01-23 06:04:25	\N
321	81	uz	{"title": "“Vatandoshlar”", "content": "Jamoat Fondi"}	2026-01-21 13:59:01	2026-01-21 13:59:01	\N
322	81	ru	{"title": "«Соотечественники»", "content": "Общественный фонд"}	2026-01-21 13:59:01	2026-01-21 13:59:01	\N
323	81	en	{"title": "\\"Compatriots\\"", "content": "Public Foundation"}	2026-01-21 13:59:01	2026-01-21 13:59:01	\N
324	81	\N	{"key": "vatandoshlar", "url": null, "description": null}	2026-01-21 13:59:01	2026-01-21 13:59:01	\N
325	82	uz	{"title": "Qidiruv so'zingizni kiriting", "content": null}	2026-01-21 17:09:08	2026-01-21 17:11:29	\N
326	82	ru	{"title": "Введите поисковый запрос", "content": null}	2026-01-21 17:09:08	2026-01-21 17:11:29	\N
327	82	en	{"title": "Enter your search term", "content": null}	2026-01-21 17:09:08	2026-01-21 17:11:29	\N
328	82	\N	{"key": "search", "url": null, "description": null}	2026-01-21 17:09:08	2026-01-21 17:11:29	\N
333	84	uz	{"title": "Musiqachi", "content": null}	2026-01-21 17:41:32	2026-01-21 17:41:32	\N
334	84	ru	{"title": "Музыкант", "content": null}	2026-01-21 17:41:32	2026-01-21 17:41:32	\N
335	84	en	{"title": "Musician", "content": null}	2026-01-21 17:41:32	2026-01-21 17:41:32	\N
336	84	\N	{"key": null, "url": null, "description": null}	2026-01-21 17:41:32	2026-01-21 17:41:32	\N
337	85	uz	{"title": "Tashkil topgan sanasi", "content": null}	2026-01-22 06:06:49	2026-01-22 06:06:49	\N
338	85	ru	{"title": "Дата основания", "content": null}	2026-01-22 06:06:49	2026-01-22 06:06:49	\N
339	85	en	{"title": "Date of establishment", "content": null}	2026-01-22 06:06:49	2026-01-22 06:06:49	\N
340	85	\N	{"key": "date_at", "url": null, "description": null}	2026-01-22 06:06:49	2026-01-22 06:06:49	\N
341	86	uz	{"title": "Rahbari saylangan sanasi:", "content": null}	2026-01-22 06:08:08	2026-01-22 06:08:08	\N
342	86	ru	{"title": "Дата выборов лидера:", "content": null}	2026-01-22 06:08:08	2026-01-22 06:08:08	\N
343	86	en	{"title": "Date of election of the leader:", "content": null}	2026-01-22 06:08:08	2026-01-22 06:08:08	\N
344	86	\N	{"key": "leader", "url": null, "description": null}	2026-01-22 06:08:08	2026-01-22 06:08:08	\N
345	87	uz	{"title": "Tashkilotning asosiy maqsad va vazifalari:", "content": null}	2026-01-22 06:08:57	2026-01-22 06:08:57	\N
346	87	ru	{"title": "Основные цели и задачи организации:", "content": null}	2026-01-22 06:08:57	2026-01-22 06:08:57	\N
347	87	en	{"title": "The main goals and objectives of the organization are:", "content": null}	2026-01-22 06:08:57	2026-01-22 06:08:57	\N
348	87	\N	{"key": "aim", "url": null, "description": null}	2026-01-22 06:08:57	2026-01-22 06:08:57	\N
349	88	uz	{"title": "Xarita ko'rinishida", "content": null}	2026-01-22 06:10:31	2026-01-22 06:10:31	\N
350	88	ru	{"title": "В режиме карты", "content": null}	2026-01-22 06:10:31	2026-01-22 06:10:31	\N
351	88	en	{"title": "In map view", "content": null}	2026-01-22 06:10:31	2026-01-22 06:10:31	\N
352	88	\N	{"key": "map", "url": null, "description": null}	2026-01-22 06:10:31	2026-01-22 06:10:31	\N
353	89	uz	{"title": "Grid ko'rinishida", "content": null}	2026-01-22 06:11:24	2026-01-22 06:11:24	\N
354	89	ru	{"title": "В табличном представлении", "content": null}	2026-01-22 06:11:24	2026-01-22 06:11:24	\N
355	89	en	{"title": "In grid view", "content": null}	2026-01-22 06:11:24	2026-01-22 06:11:24	\N
356	89	\N	{"key": "grid", "url": null, "description": null}	2026-01-22 06:11:24	2026-01-22 06:11:24	\N
329	83	uz	{"title": "Loyihalar bo'yicha menejer", "content": null}	2026-01-21 17:39:30	2026-01-22 06:47:46	\N
330	83	ru	{"title": "Руководитель проекта", "content": null}	2026-01-21 17:39:30	2026-01-22 06:47:46	\N
331	83	en	{"title": "Project Manager", "content": null}	2026-01-21 17:39:30	2026-01-22 06:47:46	\N
332	83	\N	{"key": null, "url": null, "description": "asdasd"}	2026-01-21 17:39:30	2026-01-22 06:47:46	\N
359	90	en	{"title": "\\"Vatandoshlar\\" Public Foundation. All rights reserved.", "content": null, "short_description": null}	2026-01-22 06:55:01	2026-02-13 10:55:48	\N
360	90	\N	{"key": "safe", "url": null, "description": null}	2026-01-22 06:55:01	2026-02-13 10:55:48	\N
318	80	ru	{"title": "Аддресс", "content": "100100, город Ташкент, Яккасарайский район, улица Бабура, дом 45.", "short_description": null}	2026-01-21 13:19:30	2026-02-03 19:15:29	\N
361	91	uz	{"title": "ta natija topildi", "content": null}	2026-01-22 08:35:26	2026-01-22 08:35:26	\N
362	91	ru	{"title": "найденные результаты", "content": null}	2026-01-22 08:35:26	2026-01-22 08:35:26	\N
363	91	en	{"title": "results found", "content": null}	2026-01-22 08:35:26	2026-01-22 08:35:26	\N
364	91	\N	{"key": "search-found", "url": null, "description": null}	2026-01-22 08:35:26	2026-01-22 08:35:26	\N
365	92	uz	{"title": "Hech qanday natija topilmadi", "content": null}	2026-01-22 08:37:16	2026-01-22 08:37:16	\N
366	92	ru	{"title": "Результаты не найдены.", "content": null}	2026-01-22 08:37:16	2026-01-22 08:37:16	\N
367	92	en	{"title": "No results found.", "content": null}	2026-01-22 08:37:16	2026-01-22 08:37:16	\N
368	92	\N	{"key": "search-not-found", "url": null, "description": null}	2026-01-22 08:37:16	2026-01-22 08:37:16	\N
369	93	uz	{"title": "Barcha viloyatlar", "content": null}	2026-01-22 10:43:48	2026-01-22 10:43:48	\N
370	93	ru	{"title": "Все регионы", "content": null}	2026-01-22 10:43:48	2026-01-22 10:43:48	\N
371	93	en	{"title": "All regions", "content": null}	2026-01-22 10:43:48	2026-01-22 10:43:48	\N
372	93	\N	{"key": "cities", "url": null, "description": null}	2026-01-22 10:43:48	2026-01-22 10:43:48	\N
373	94	uz	{"title": "Batafsil loyiha haqida", "content": null}	2026-01-22 10:49:44	2026-01-22 10:49:44	\N
374	94	ru	{"title": "Подробнее о проекте", "content": null}	2026-01-22 10:49:44	2026-01-22 10:49:44	\N
375	94	en	{"title": "More about the project", "content": null}	2026-01-22 10:49:44	2026-01-22 10:49:44	\N
376	94	\N	{"key": "more-about", "url": null, "description": null}	2026-01-22 10:49:44	2026-01-22 10:49:44	\N
377	95	uz	{"title": "Tanlov shartlari", "content": null}	2026-01-22 10:51:19	2026-01-22 10:51:19	\N
378	95	ru	{"title": "Условия соревнований", "content": null}	2026-01-22 10:51:19	2026-01-22 10:51:19	\N
379	95	en	{"title": "Competition conditions", "content": null}	2026-01-22 10:51:19	2026-01-22 10:51:19	\N
358	90	ru	{"title": "Общественный фонд \\"Ватандошлар\\". Все права защищены.", "content": null, "short_description": null}	2026-01-22 06:55:01	2026-02-13 10:55:48	\N
357	90	uz	{"title": "\\"Vatandoshlar\\" jamoat fondi. Barcha huquqlari himoyalangan.", "content": null, "short_description": null}	2026-01-22 06:55:01	2026-02-13 10:55:48	\N
380	95	\N	{"key": "requirements", "url": null, "description": null}	2026-01-22 10:51:19	2026-01-22 10:51:19	\N
381	96	uz	{"title": "Ishtirok etish", "content": null}	2026-01-22 10:53:53	2026-01-22 10:53:53	\N
382	96	ru	{"title": "Участие", "content": null}	2026-01-22 10:53:53	2026-01-22 10:53:53	\N
383	96	en	{"title": "Participation", "content": null}	2026-01-22 10:53:53	2026-01-22 10:53:53	\N
384	96	\N	{"key": "Participate", "url": null, "description": null}	2026-01-22 10:53:53	2026-01-22 10:53:53	\N
385	97	uz	{"title": "Video ko’rish", "content": null}	2026-01-22 10:55:53	2026-01-22 10:55:53	\N
386	97	ru	{"title": "Посмотреть  видео", "content": null}	2026-01-22 10:55:53	2026-01-22 10:55:53	\N
387	97	en	{"title": "Watch the video", "content": null}	2026-01-22 10:55:53	2026-01-22 10:55:53	\N
388	97	\N	{"key": "video-play", "url": null, "description": null}	2026-01-22 10:55:53	2026-01-22 10:55:53	\N
419	105	en	{"title": "There is an error.", "content": null, "short_description": null}	2026-01-22 13:11:12	2026-01-22 13:11:12	\N
420	105	\N	{"key": "somethingWentWrong", "url": null, "description": null}	2026-01-22 13:11:12	2026-01-22 13:11:12	\N
421	106	uz	{"title": "Bo’lishish", "content": null, "short_description": null}	2026-01-22 13:29:33	2026-01-22 13:29:33	\N
422	106	ru	{"title": "Поделиться", "content": null, "short_description": null}	2026-01-22 13:29:33	2026-01-22 13:29:33	\N
389	98	uz	{"title": "Hafta", "content": "O‘zgartirish uchun aylantiring", "short_description": "Ochiq/Yopiq"}	2026-01-22 11:03:58	2026-01-22 11:07:07	\N
390	98	ru	{"title": "Неделя", "content": "Поверните, чтобы изменить", "short_description": "Открыто/Закрыто"}	2026-01-22 11:03:58	2026-01-22 11:07:07	\N
391	98	en	{"title": "Week", "content": "Rotate to change", "short_description": "Open/Closed"}	2026-01-22 11:03:58	2026-01-22 11:07:07	\N
392	98	\N	{"key": "week", "url": null, "description": null}	2026-01-22 11:03:58	2026-01-22 11:07:07	\N
393	99	uz	{"title": "Loyihadan lavhalar", "content": null, "short_description": null}	2026-01-22 11:40:09	2026-01-22 11:40:09	\N
394	99	ru	{"title": "Кадры из проекта", "content": null, "short_description": null}	2026-01-22 11:40:09	2026-01-22 11:40:09	\N
395	99	en	{"title": "Photos from project", "content": null, "short_description": null}	2026-01-22 11:40:09	2026-01-22 11:40:09	\N
396	99	\N	{"key": "project", "url": null, "description": null}	2026-01-22 11:40:09	2026-01-22 11:40:09	\N
397	100	uz	{"title": "Bekor Qilish", "content": null, "short_description": null}	2026-01-22 11:47:59	2026-01-22 11:47:59	\N
398	100	ru	{"title": "Отмена", "content": null, "short_description": null}	2026-01-22 11:47:59	2026-01-22 11:47:59	\N
399	100	en	{"title": "Cancel", "content": null, "short_description": null}	2026-01-22 11:47:59	2026-01-22 11:47:59	\N
400	100	\N	{"key": "cancel", "url": null, "description": null}	2026-01-22 11:47:59	2026-01-22 11:47:59	\N
401	101	uz	{"title": "Ishlab chiquvchi", "content": null, "short_description": null}	2026-01-22 12:58:06	2026-01-22 12:58:06	\N
402	101	ru	{"title": "Разработано компанией", "content": null, "short_description": null}	2026-01-22 12:58:06	2026-01-22 12:58:06	\N
403	101	en	{"title": "Developed by", "content": null, "short_description": null}	2026-01-22 12:58:06	2026-01-22 12:58:06	\N
404	101	\N	{"key": "develop", "url": null, "description": null}	2026-01-22 12:58:06	2026-01-22 12:58:06	\N
405	102	uz	{"title": "Menyu", "content": null, "short_description": null}	2026-01-22 13:01:08	2026-01-22 13:01:08	\N
406	102	ru	{"title": "Меню", "content": null, "short_description": null}	2026-01-22 13:01:08	2026-01-22 13:01:08	\N
407	102	en	{"title": "Menu", "content": null, "short_description": null}	2026-01-22 13:01:08	2026-01-22 13:01:08	\N
408	102	\N	{"key": "menu", "url": null, "description": null}	2026-01-22 13:01:08	2026-01-22 13:01:08	\N
409	103	uz	{"title": "Arizangiz muvaffaqiyatli yuborildi. Tez orada siz bilan bog’lanamiz", "content": null, "short_description": null}	2026-01-22 13:04:13	2026-01-22 13:08:08	\N
410	103	ru	{"title": "Ваша заявка успешно отправлена. Мы свяжемся с вами в ближайшее время.", "content": null, "short_description": null}	2026-01-22 13:04:13	2026-01-22 13:08:08	\N
411	103	en	{"title": "Your application has been successfully submitted. We will contact you shortly.", "content": null, "short_description": null}	2026-01-22 13:04:13	2026-01-22 13:08:08	\N
412	103	\N	{"key": "ApplicationSent", "url": null, "description": null}	2026-01-22 13:04:13	2026-01-22 13:08:08	\N
417	105	uz	{"title": "Hatolik bor.", "content": null, "short_description": null}	2026-01-22 13:11:12	2026-01-22 13:11:12	\N
418	105	ru	{"title": "Произошла ошибка.", "content": null, "short_description": null}	2026-01-22 13:11:12	2026-01-22 13:11:12	\N
423	106	en	{"title": "Share", "content": null, "short_description": null}	2026-01-22 13:29:33	2026-01-22 13:29:33	\N
424	106	\N	{"key": "share", "url": null, "description": null}	2026-01-22 13:29:33	2026-01-22 13:29:33	\N
425	107	uz	{"title": "Havolani nusxalash", "content": null, "short_description": null}	2026-01-22 13:30:11	2026-01-22 13:30:11	\N
426	107	ru	{"title": "Скопировать ссылку", "content": null, "short_description": null}	2026-01-22 13:30:11	2026-01-22 13:30:11	\N
427	107	en	{"title": "Copy link", "content": null, "short_description": null}	2026-01-22 13:30:11	2026-01-22 13:30:11	\N
428	107	\N	{"key": "copy", "url": null, "description": null}	2026-01-22 13:30:11	2026-01-22 13:30:11	\N
306	77	ru	{"title": "Подробнее", "content": null, "short_description": null}	2026-01-21 09:40:03	2026-01-23 06:04:25	\N
429	108	uz	{"title": "Bog'lanish", "content": null, "short_description": null}	2026-01-23 06:09:48	2026-01-23 06:35:48	\N
430	108	ru	{"title": "Контакты", "content": null, "short_description": null}	2026-01-23 06:09:48	2026-01-23 06:35:48	\N
431	108	en	{"title": "Contacts", "content": null, "short_description": null}	2026-01-23 06:09:48	2026-01-23 06:35:48	\N
432	108	\N	{"key": "contacts_header", "url": null, "description": null}	2026-01-23 06:09:48	2026-01-23 06:35:48	\N
413	104	uz	{"title": "Arizangiz xato yuborildi. Iltimos qayta tekshirib ko'ring", "content": null, "short_description": null}	2026-01-22 13:10:01	2026-02-03 19:16:01	\N
414	104	ru	{"title": "Ваша заявка была отправлена ​​по ошибке. Пожалуйста, проверьте еще раз.", "content": null, "short_description": null}	2026-01-22 13:10:01	2026-02-03 19:16:01	\N
415	104	en	{"title": "Your application was sent in error. Please check again.", "content": null, "short_description": null}	2026-01-22 13:10:01	2026-02-03 19:16:01	\N
416	104	\N	{"key": "ApplicationNotSent", "url": null, "description": null}	2026-01-22 13:10:01	2026-02-03 19:16:01	\N
461	116	uz	{"title": "Bizning hamkorlar", "content": null, "short_description": null}	2026-02-18 06:58:38	2026-02-18 06:58:38	\N
449	113	uz	{"title": "CTRL + ENTER", "content": "Diqqat! Agar siz matnda xatoliklarni aniqlasangiz, ularni belgilab, ma muriyatni xabardor qilish uchun Ctrl+Enter tugmalarini bosing", "short_description": null}	2026-02-13 06:48:28	2026-02-13 06:48:28	\N
450	113	ru	{"title": "CTRL + ENTER", "content": "Внимание! Если вы обнаружите какие-либо ошибки в тексте, пожалуйста, выделите их и нажмите Ctrl+Enter, чтобы сообщить об этом администрации.", "short_description": null}	2026-02-13 06:48:28	2026-02-13 06:48:28	\N
451	113	en	{"title": "CTRL + ENTER", "content": "Attention! If you find any errors in the text, please highlight them and press Ctrl+Enter to notify the administration.", "short_description": null}	2026-02-13 06:48:28	2026-02-13 06:48:28	\N
452	113	\N	{"key": "error-report", "url": null, "description": null}	2026-02-13 06:48:28	2026-02-13 06:48:28	\N
453	114	uz	{"title": "CTRL + ENTER chat id", "content": null, "short_description": null}	2026-02-13 07:02:37	2026-02-13 07:02:37	\N
454	114	ru	{"title": null, "content": null, "short_description": null}	2026-02-13 07:02:37	2026-02-13 07:02:37	\N
455	114	en	{"title": null, "content": null, "short_description": null}	2026-02-13 07:02:37	2026-02-13 07:02:37	\N
456	114	\N	{"key": "error_report_chat_id", "url": null, "description": null}	2026-02-13 07:02:37	2026-02-13 07:02:37	\N
457	115	uz	{"title": "Sayt test rejimida ishlamoqda", "content": null, "short_description": null}	2026-02-13 09:30:21	2026-02-13 09:30:21	\N
458	115	ru	{"title": "Сайт находится в тестовом режиме.", "content": null, "short_description": null}	2026-02-13 09:30:21	2026-02-13 09:30:21	\N
459	115	en	{"title": "The site is in test mode.", "content": null, "short_description": null}	2026-02-13 09:30:21	2026-02-13 09:30:21	\N
433	109	uz	{"title": "asdsd", "content": null, "short_description": null}	2026-01-27 06:44:30	2026-01-27 06:44:30	\N
434	109	ru	{"title": null, "content": null, "short_description": null}	2026-01-27 06:44:30	2026-01-27 06:44:30	\N
435	109	en	{"title": null, "content": null, "short_description": null}	2026-01-27 06:44:30	2026-01-27 06:44:30	\N
436	109	\N	{"key": "sd", "url": null, "description": null}	2026-01-27 06:44:30	2026-01-27 06:44:30	\N
437	110	uz	{"title": "Telegram Contact ChatID", "content": null, "short_description": null}	2026-01-27 07:44:24	2026-01-27 07:44:24	\N
438	110	ru	{"title": null, "content": null, "short_description": null}	2026-01-27 07:44:24	2026-01-27 07:44:24	\N
439	110	en	{"title": null, "content": null, "short_description": null}	2026-01-27 07:44:24	2026-01-27 07:44:24	\N
440	110	\N	{"key": "telegram_contact_chat_id", "url": null, "description": "-1003249220292"}	2026-01-27 07:44:24	2026-01-27 07:44:24	\N
441	111	uz	{"title": "Telegram Murojat ChatID", "content": null, "short_description": null}	2026-01-27 07:45:03	2026-01-27 07:45:03	\N
442	111	ru	{"title": null, "content": null, "short_description": null}	2026-01-27 07:45:03	2026-01-27 07:45:03	\N
443	111	en	{"title": null, "content": null, "short_description": null}	2026-01-27 07:45:03	2026-01-27 07:45:03	\N
444	111	\N	{"key": "telegram_application_chat_id", "url": null, "description": "-1003249220292"}	2026-01-27 07:45:03	2026-01-27 07:45:03	\N
445	112	uz	{"title": "Telegram Ishtirok etish ChatID", "content": null, "short_description": null}	2026-01-27 07:45:19	2026-01-27 07:45:19	\N
446	112	ru	{"title": null, "content": null, "short_description": null}	2026-01-27 07:45:19	2026-01-27 07:45:19	\N
447	112	en	{"title": null, "content": null, "short_description": null}	2026-01-27 07:45:19	2026-01-27 07:45:19	\N
448	112	\N	{"key": "telegram_participation_chat_id", "url": null, "description": "-1003249220292"}	2026-01-27 07:45:19	2026-01-27 07:45:19	\N
317	80	uz	{"title": "Manzil", "content": "100100, Toshkent sh., Yakkasaroy tumani, Bobur ko'chasi, 45-uy.", "short_description": null}	2026-01-21 13:19:30	2026-02-03 19:15:29	\N
319	80	en	{"title": "Address", "content": "100100, Tashkent city, Yakkasaroy district, Babur street, house 45.", "short_description": null}	2026-01-21 13:19:30	2026-02-03 19:15:29	\N
462	116	ru	{"title": null, "content": null, "short_description": null}	2026-02-18 06:58:38	2026-02-18 06:58:38	\N
460	115	\N	{"key": "test-mode", "url": null, "description": null}	2026-02-13 09:30:21	2026-02-13 09:30:21	\N
18	5	ru	{"title": "Общественный фонд \\"Ватандошлар\\" — некоммерческая организация, устанавливающая связи с нашими соотечественниками за рубежом, защищающая их права и помогающая вносить вклад в развитие Родины.", "content": null, "short_description": null}	2025-12-29 11:37:26	2026-02-13 11:00:46	list
19	5	en	{"title": "\\"Vatandoshlar\\" Public Foundation is a non-profit organization that establishes connections with our compatriots abroad, protects their rights and helps them contribute to the development of the Motherland.", "content": null, "short_description": null}	2025-12-29 11:37:26	2026-02-13 11:00:46	list
463	116	en	{"title": null, "content": null, "short_description": null}	2026-02-18 06:58:38	2026-02-18 06:58:38	\N
464	116	\N	{"key": "partners", "url": null, "description": null}	2026-02-18 06:58:38	2026-02-18 06:58:38	\N
465	117	uz	{"title": "Yuklab olish", "content": null, "short_description": null}	2026-02-23 10:10:39	2026-02-23 10:10:39	\N
466	117	ru	{"title": null, "content": null, "short_description": null}	2026-02-23 10:10:39	2026-02-23 10:10:39	\N
467	117	en	{"title": null, "content": null, "short_description": null}	2026-02-23 10:10:39	2026-02-23 10:10:39	\N
468	117	\N	{"key": "downloadNow", "url": null, "description": null}	2026-02-23 10:10:39	2026-02-23 10:10:39	\N
469	118	uz	{"title": "Loyiha yakunlangan", "content": null, "short_description": null}	2026-02-25 12:35:00	2026-02-25 12:35:00	\N
470	118	ru	{"title": null, "content": null, "short_description": null}	2026-02-25 12:35:00	2026-02-25 12:35:00	\N
471	118	en	{"title": null, "content": null, "short_description": null}	2026-02-25 12:35:00	2026-02-25 12:35:00	\N
472	118	\N	{"key": "inactive_project", "url": null, "description": null}	2026-02-25 12:35:00	2026-02-25 12:35:00	\N
\.


--
-- Data for Name: contents; Type: TABLE DATA; Schema: public; Owner: vatandoshlar_usr
--

COPY public.contents (id, type, slug, url, test, show_admin, sort_order, icon, status, parent_id, created_at, updated_at, category) FROM stdin;
7	category	\N	\N	f	t	1	\N	t	\N	2026-01-05 06:08:08	2026-01-08 12:16:36	list
8	category	\N	\N	f	t	1	\N	t	\N	2026-01-05 06:08:54	2026-01-08 12:16:36	list
9	category	\N	\N	f	t	1	\N	t	\N	2026-01-05 06:09:45	2026-01-08 12:16:36	list
11	category	\N	\N	f	t	1	\N	t	\N	2026-01-05 06:11:20	2026-01-08 12:16:36	list
12	category	\N	\N	f	t	1	\N	t	\N	2026-01-05 06:12:41	2026-01-08 12:16:36	list
13	category	\N	\N	f	t	1	\N	t	\N	2026-01-05 06:13:52	2026-01-08 12:16:36	list
14	category	\N	\N	f	t	1	\N	t	\N	2026-01-05 06:15:07	2026-01-08 12:16:36	list
16	category	\N	\N	f	t	1	\N	t	\N	2026-01-05 06:17:30	2026-01-08 12:16:36	list
18	category	\N	\N	f	t	1	\N	t	\N	2026-01-05 06:19:15	2026-01-08 12:16:36	list
19	category	\N	\N	f	t	1	\N	t	\N	2026-01-05 06:20:38	2026-01-08 12:16:36	list
20	category	\N	\N	f	t	1	\N	t	\N	2026-01-05 06:21:27	2026-01-08 12:16:36	list
21	category	\N	\N	f	t	1	\N	t	\N	2026-01-05 06:43:23	2026-01-08 12:16:36	list
22	category	\N	\N	f	t	1	\N	t	\N	2026-01-05 06:54:59	2026-01-08 12:16:36	list
23	category	\N	\N	f	t	1	\N	t	\N	2026-01-05 06:57:49	2026-01-08 12:16:36	list
24	category	\N	\N	f	t	1	\N	t	\N	2026-01-05 06:58:49	2026-01-08 12:16:36	list
35	category	\N	\N	f	t	1	\N	t	\N	2026-01-13 06:58:18	2026-01-13 06:58:18	list
37	category	\N	\N	f	t	1	\N	t	\N	2026-01-13 08:52:06	2026-01-13 08:52:06	list
38	category	\N	\N	f	t	1	\N	t	\N	2026-01-13 08:55:00	2026-01-13 08:55:00	list
39	category	\N	\N	f	t	1	\N	t	\N	2026-01-13 08:55:47	2026-01-13 08:55:47	list
40	category	\N	\N	f	t	1	\N	t	\N	2026-01-13 08:58:06	2026-01-13 08:58:06	list
41	category	\N	\N	f	t	1	\N	t	\N	2026-01-13 08:58:55	2026-01-13 08:58:55	list
42	category	\N	\N	f	t	1	\N	t	\N	2026-01-13 09:01:18	2026-01-13 09:01:18	list
43	category	\N	\N	f	t	1	\N	t	\N	2026-01-13 09:02:14	2026-01-13 09:02:14	list
45	category	\N	\N	f	t	1	\N	t	\N	2026-01-13 09:09:32	2026-01-13 09:09:32	list
46	category	\N	\N	f	t	1	\N	t	\N	2026-01-13 09:11:01	2026-01-13 09:11:01	list
47	category	\N	\N	f	t	1	\N	t	\N	2026-01-13 09:14:35	2026-01-13 09:14:35	list
48	category	\N	\N	f	t	1	\N	t	\N	2026-01-13 09:21:50	2026-01-13 09:21:50	list
49	category	\N	\N	f	t	1	\N	t	\N	2026-01-13 09:22:27	2026-01-13 09:22:27	list
50	category	\N	\N	f	t	1	\N	t	\N	2026-01-13 09:23:17	2026-01-13 09:23:17	list
51	category	\N	\N	f	t	1	\N	t	\N	2026-01-13 09:24:02	2026-01-13 09:24:02	list
52	category	\N	\N	f	t	1	\N	t	\N	2026-01-13 09:25:09	2026-01-13 09:25:09	list
53	category	\N	\N	f	t	1	\N	t	\N	2026-01-13 09:25:54	2026-01-13 09:25:54	list
54	category	\N	\N	f	t	1	\N	t	\N	2026-01-13 09:26:45	2026-01-13 09:26:45	list
55	category	\N	\N	f	t	1	\N	t	\N	2026-01-13 09:37:19	2026-01-13 09:37:19	list
56	category	\N	\N	f	t	1	\N	t	\N	2026-01-13 09:40:34	2026-01-13 09:40:34	list
57	category	\N	\N	f	t	1	\N	t	\N	2026-01-13 09:43:04	2026-01-13 09:43:04	list
58	category	\N	\N	f	t	1	\N	t	\N	2026-01-13 09:45:06	2026-01-13 09:45:06	list
59	category	\N	\N	f	t	1	\N	t	\N	2026-01-13 09:50:35	2026-01-13 09:50:35	list
60	category	\N	\N	f	t	1	\N	t	\N	2026-01-13 09:53:20	2026-01-13 09:53:20	list
62	category	\N	\N	f	t	1	\N	t	\N	2026-01-13 09:55:53	2026-01-13 09:55:53	list
63	category	\N	\N	f	t	1	\N	t	\N	2026-01-13 10:02:23	2026-01-13 10:02:23	list
64	category	\N	\N	f	t	1	\N	t	\N	2026-01-13 10:03:22	2026-01-13 10:03:22	list
65	category	\N	\N	f	t	1	\N	t	\N	2026-01-13 10:04:30	2026-01-13 10:04:30	list
66	category	\N	\N	f	t	1	\N	t	\N	2026-01-13 10:05:28	2026-01-13 10:05:28	list
67	category	\N	\N	f	t	1	\N	t	\N	2026-01-13 10:06:22	2026-01-13 10:06:22	list
68	category	\N	\N	f	t	1	\N	t	\N	2026-01-13 10:06:59	2026-01-13 10:06:59	list
69	category	\N	\N	f	t	1	\N	t	\N	2026-01-13 10:07:40	2026-01-13 10:07:40	list
70	category	\N	\N	f	t	1	\N	t	\N	2026-01-13 10:08:38	2026-01-13 10:08:38	list
71	category	\N	\N	f	t	1	\N	t	\N	2026-01-13 10:14:53	2026-01-13 10:14:53	list
72	category	\N	\N	f	t	1	\N	t	\N	2026-01-13 10:15:43	2026-01-13 10:15:43	list
73	category	\N	\N	f	t	1	\N	t	\N	2026-01-13 10:16:35	2026-01-13 10:16:35	list
74	category	\N	\N	f	t	1	\N	t	\N	2026-01-13 10:17:58	2026-01-13 10:17:58	list
75	category	\N	\N	f	t	1	\N	t	\N	2026-01-13 10:18:27	2026-01-13 10:18:27	list
76	category	\N	\N	f	t	1	\N	t	\N	2026-01-20 06:50:02	2026-01-20 06:50:02	list
17	category	\N	\N	f	f	1	\N	t	\N	2026-01-05 06:18:28	2026-01-20 13:19:48	list
2	category	\N	\N	f	t	1	\N	t	\N	2025-12-29 11:34:12	2026-01-20 14:00:50	list
3	category	\N	\N	f	t	1	\N	t	\N	2025-12-29 11:34:55	2026-01-20 14:00:55	list
4	category	\N	\N	f	t	1	\N	t	\N	2025-12-29 11:36:08	2026-01-20 17:17:28	list
6	category	\N	\N	f	t	1	\N	t	\N	2025-12-29 13:28:11	2026-01-20 17:23:21	list
77	category	\N	\N	f	t	1	\N	t	\N	2026-01-21 09:40:03	2026-01-21 09:40:03	list
79	category	\N	\N	f	t	1	\N	t	\N	2026-01-21 13:17:04	2026-01-21 13:17:04	list
80	category	\N	\N	f	t	1	\N	t	\N	2026-01-21 13:19:30	2026-01-21 13:19:30	list
81	category	\N	\N	f	t	1	\N	t	\N	2026-01-21 13:59:01	2026-01-21 13:59:01	list
82	category	\N	\N	f	t	1	\N	t	\N	2026-01-21 17:09:08	2026-01-21 17:09:08	list
84	category	\N	\N	f	t	1	\N	t	\N	2026-01-21 17:41:32	2026-01-21 17:41:32	job
85	category	\N	\N	f	t	1	\N	t	\N	2026-01-22 06:06:49	2026-01-22 06:06:49	list
86	category	\N	\N	f	t	1	\N	t	\N	2026-01-22 06:08:08	2026-01-22 06:08:08	list
87	category	\N	\N	f	t	1	\N	t	\N	2026-01-22 06:08:57	2026-01-22 06:08:57	list
88	category	\N	\N	f	t	1	\N	t	\N	2026-01-22 06:10:31	2026-01-22 06:10:31	list
89	category	\N	\N	f	t	1	\N	t	\N	2026-01-22 06:11:24	2026-01-22 06:11:24	list
83	category	\N	\N	f	t	1	\N	t	\N	2026-01-21 17:39:30	2026-01-22 06:47:46	\N
90	category	\N	\N	f	t	1	\N	t	\N	2026-01-22 06:55:01	2026-01-22 06:55:01	list
91	category	\N	\N	f	t	1	\N	t	\N	2026-01-22 08:35:26	2026-01-22 08:35:26	list
92	category	\N	\N	f	t	1	\N	t	\N	2026-01-22 08:37:16	2026-01-22 08:37:16	list
93	category	\N	\N	f	t	1	\N	t	\N	2026-01-22 10:43:48	2026-01-22 10:43:48	list
94	category	\N	\N	f	t	1	\N	t	\N	2026-01-22 10:49:44	2026-01-22 10:49:44	list
95	category	\N	\N	f	t	1	\N	t	\N	2026-01-22 10:51:19	2026-01-22 10:51:19	list
96	category	\N	\N	f	t	1	\N	t	\N	2026-01-22 10:53:53	2026-01-22 10:53:53	list
97	category	\N	\N	f	t	1	\N	t	\N	2026-01-22 10:55:53	2026-01-22 10:55:53	list
98	category	\N	\N	f	t	1	\N	t	\N	2026-01-22 11:03:58	2026-01-22 11:03:58	list
99	category	\N	\N	f	t	1	\N	t	\N	2026-01-22 11:40:09	2026-01-22 11:40:09	list
100	category	\N	\N	f	t	1	\N	t	\N	2026-01-22 11:47:59	2026-01-22 11:47:59	list
5	category	\N	\N	f	t	1	\N	t	\N	2025-12-29 11:37:26	2026-01-23 13:25:57	list
1	category	\N	\N	f	t	1	\N	t	\N	2025-12-29 11:28:37	2026-01-22 12:23:19	list
101	category	\N	\N	f	t	1	\N	t	\N	2026-01-22 12:58:06	2026-01-22 12:58:06	list
102	category	\N	\N	f	t	1	\N	t	\N	2026-01-22 13:01:08	2026-01-22 13:01:08	list
103	category	\N	\N	f	t	1	\N	t	\N	2026-01-22 13:04:13	2026-01-22 13:04:13	list
104	category	\N	\N	f	t	1	\N	t	\N	2026-01-22 13:10:01	2026-01-22 13:10:01	list
105	category	\N	\N	f	t	1	\N	t	\N	2026-01-22 13:11:12	2026-01-22 13:11:12	list
106	category	\N	\N	f	t	1	\N	t	\N	2026-01-22 13:29:33	2026-01-22 13:29:33	list
107	category	\N	\N	f	t	1	\N	t	\N	2026-01-22 13:30:11	2026-01-22 13:30:11	list
108	category	\N	\N	f	t	1	\N	t	\N	2026-01-23 06:09:48	2026-01-23 06:09:48	list
109	category	\N	\N	f	t	1	\N	t	\N	2026-01-27 06:44:30	2026-01-27 06:44:30	list
112	category	\N	\N	f	t	1	\N	f	\N	2026-01-27 07:45:19	2026-01-28 10:07:08	list
111	category	\N	\N	f	t	1	\N	f	\N	2026-01-27 07:45:03	2026-01-28 10:07:08	list
110	category	\N	\N	f	t	1	\N	f	\N	2026-01-27 07:44:24	2026-01-28 10:07:09	list
113	category	\N	\N	f	t	1	\N	t	\N	2026-02-13 06:48:28	2026-02-13 06:48:28	list
114	category	\N	\N	f	t	1	\N	t	\N	2026-02-13 07:02:37	2026-02-13 07:02:37	list
115	category	\N	\N	f	t	1	\N	t	\N	2026-02-13 09:30:21	2026-02-13 09:35:06	list
116	category	\N	\N	f	t	1	\N	t	\N	2026-02-18 06:58:38	2026-02-18 06:58:38	list
117	category	\N	\N	f	t	1	\N	t	\N	2026-02-23 10:10:39	2026-02-23 10:10:39	list
118	category	\N	\N	f	t	1	\N	t	\N	2026-02-25 12:35:00	2026-02-25 12:35:00	list
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: vatandoshlar_usr
--

COPY public.countries (id, name, nicename, iso, iso3, numcode, phonecode, phonemask, status, created_at, updated_at) FROM stdin;
217	{"en":"Gabon","ru":"\\u0413\\u0430\\u0431\\u043e\\u043d","oz":"Gabon"}	Gabon	GA	GAB	266	241	0-00-00-00	active	2026-01-15 12:24:33	2026-01-15 12:24:33
218	{"en":"Gambia","ru":"\\u0413\\u0430\\u043c\\u0431\\u0438\\u044f","oz":"Gambiya"}	Gambia	GM	GMB	270	220	000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
219	{"en":"Georgia","ru":"\\u0413\\u0440\\u0443\\u0437\\u0438\\u044f","oz":"Gruziya"}	Georgia	GE	GEO	268	995	000-000-000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
220	{"en":"Germany","ru":"\\u0413\\u0435\\u0440\\u043c\\u0430\\u043d\\u0438\\u044f","oz":"Germaniya"}	Germany	DE	DEU	276	49	000-0000000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
221	{"en":"Ghana","ru":"\\u0413\\u0430\\u043d\\u0430","oz":"Gana"}	Ghana	GH	GHA	288	233	00-000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
222	{"en":"Gibraltar","ru":"\\u0413\\u0438\\u0431\\u0440\\u0430\\u043b\\u0442\\u0430\\u0440","oz":"Gibraltar"}	Gibraltar	GI	GIB	292	350	000-00000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
223	{"en":"Greece","ru":"\\u0413\\u0440\\u0435\\u0446\\u0438\\u044f","oz":"Gretsiya"}	Greece	GR	GRC	300	30	00-0000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
224	{"en":"Greenland","ru":"\\u0413\\u0440\\u0435\\u043d\\u043b\\u0430\\u043d\\u0434\\u0438\\u044f","oz":"Grenlandiya"}	Greenland	GL	GRL	304	299	00-00-00	active	2026-01-15 12:24:33	2026-01-15 12:24:33
225	{"en":"Grenada","ru":"\\u0413\\u0440\\u0435\\u043d\\u0430\\u0434\\u0430","oz":"Grenada"}	Grenada	GD	GRD	308	1473	000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
226	{"en":"Guadeloupe","ru":"\\u0413\\u0432\\u0430\\u0434\\u0435\\u043b\\u0443\\u043f\\u0430","oz":"Gvadelupa"}	Guadeloupe	GP	GLP	312	590	000-00-00-00	active	2026-01-15 12:24:33	2026-01-15 12:24:33
227	{"en":"Guam","ru":"\\u0413\\u0443\\u0430\\u043c","oz":"Guam"}	Guam	GU	GUM	316	1671	000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
228	{"en":"Guatemala","ru":"\\u0413\\u0432\\u0430\\u0442\\u0435\\u043c\\u0430\\u043b\\u0430","oz":"Gvatemala"}	Guatemala	GT	GTM	320	502	0-000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
229	{"en":"Guinea","ru":"\\u0413\\u0432\\u0438\\u043d\\u0435\\u044f","oz":"Gvineya"}	Guinea	GN	GIN	324	224	00-000-000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
230	{"en":"Guinea-Bissau","ru":"\\u0413\\u0432\\u0438\\u043d\\u0435\\u044f-\\u0411\\u0438\\u0441\\u0430\\u0443","oz":"Gvineya-Bisau"}	Guinea-Bissau	GW	GNB	624	245	00-000-000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
231	{"en":"Guyana","ru":"\\u0413\\u0430\\u0439\\u0430\\u043d\\u0430","oz":"Gayana"}	Guyana	GY	GUY	328	592	000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
232	{"en":"Haiti","ru":"\\u0413\\u0430\\u0438\\u0442\\u0438","oz":"Gaiti"}	Haiti	HT	HTI	332	509	00-00-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
233	{"en":"Heard Island and Mcdonald Islands","ru":"\\u041e\\u0441\\u0442\\u0440\\u043e\\u0432\\u0430 \\u0425\\u0435\\u0440\\u0434 \\u0438 \\u041c\\u0430\\u043a\\u0434\\u043e\\u043d\\u0430\\u043b\\u044c\\u0434","oz":"Xerd va Makdonald orollari"}	Heard Island and Mcdonald Islands	HM	HMD	334	0		active	2026-01-15 12:24:33	2026-01-15 12:24:33
234	{"en":"Holy See (Vatican City State)","ru":"\\u0412\\u0430\\u0442\\u0438\\u043a\\u0430\\u043d","oz":"Vatikan"}	Holy See (Vatican City State)	VA	VAT	336	39	00-0000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
235	{"en":"Honduras","ru":"\\u0413\\u043e\\u043d\\u0434\\u0443\\u0440\\u0430\\u0441","oz":"Gonduras"}	Honduras	HN	HND	340	504	0000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
236	{"en":"Hong Kong","ru":"\\u0413\\u043e\\u043d\\u043a\\u043e\\u043d\\u0433","oz":"Gonkong"}	Hong Kong	HK	HKG	344	852	0000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
237	{"en":"Hungary","ru":"\\u0412\\u0435\\u043d\\u0433\\u0440\\u0438\\u044f","oz":"Vengriya"}	Hungary	HU	HUN	348	36	00-000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
238	{"en":"Iceland","ru":"\\u0418\\u0441\\u043b\\u0430\\u043d\\u0434\\u0438\\u044f","oz":"Islandiya"}	Iceland	IS	ISL	352	354	000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
239	{"en":"India","ru":"\\u0418\\u043d\\u0434\\u0438\\u044f","oz":"Hindiston"}	India	IN	IND	356	91	00000-00000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
240	{"en":"Indonesia","ru":"\\u0418\\u043d\\u0434\\u043e\\u043d\\u0435\\u0437\\u0438\\u044f","oz":"Indoneziya"}	Indonesia	ID	IDN	360	62	00-000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
242	{"en":"Iraq","ru":"\\u0418\\u0440\\u0430\\u043a","oz":"Iroq"}	Iraq	IQ	IRQ	368	964	000-000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
243	{"en":"Ireland","ru":"\\u0418\\u0440\\u043b\\u0430\\u043d\\u0434\\u0438\\u044f","oz":"Irlandiya"}	Ireland	IE	IRL	372	353	00-000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
244	{"en":"Israel","ru":"\\u0418\\u0437\\u0440\\u0430\\u0438\\u043b\\u044c","oz":"Isroil"}	Israel	IL	ISR	376	972	0-000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
245	{"en":"Italy","ru":"\\u0418\\u0442\\u0430\\u043b\\u0438\\u044f","oz":"Italiya"}	Italy	IT	ITA	380	39	00-0000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
246	{"en":"Jamaica","ru":"\\u042f\\u043c\\u0430\\u0439\\u043a\\u0430","oz":"Yamayka"}	Jamaica	JM	JAM	388	1876	000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
247	{"en":"Japan","ru":"\\u042f\\u043f\\u043e\\u043d\\u0438\\u044f","oz":"Yaponiya"}	Japan	JP	JPN	392	81	00-0000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
248	{"en":"Jordan","ru":"\\u0418\\u043e\\u0440\\u0434\\u0430\\u043d\\u0438\\u044f","oz":"Iordaniya"}	Jordan	JO	JOR	400	962	0-000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
249	{"en":"Kazakhstan","ru":"\\u041a\\u0430\\u0437\\u0430\\u0445\\u0441\\u0442\\u0430\\u043d","oz":"Qozog'iston"}	Kazakhstan	KZ	KAZ	398	7	(000) 000-00-00	active	2026-01-15 12:24:33	2026-01-15 12:24:33
250	{"en":"Kenya","ru":"\\u041a\\u0435\\u043d\\u0438\\u044f","oz":"Keniya"}	Kenya	KE	KEN	404	254	000-000000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
251	{"en":"Kiribati","ru":"\\u041a\\u0438\\u0440\\u0438\\u0431\\u0430\\u0442\\u0438","oz":"Kiribati"}	Kiribati	KI	KIR	296	686	00-000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
253	{"en":"Kuwait","ru":"\\u041a\\u0443\\u0432\\u0435\\u0439\\u0442","oz":"Quvayt"}	Kuwait	KW	KWT	414	965	0000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
254	{"en":"Kyrgyzstan","ru":"\\u041a\\u044b\\u0440\\u0433\\u044b\\u0437\\u0441\\u0442\\u0430\\u043d","oz":"Qirg'iziston"}	Kyrgyzstan	KG	KGZ	417	996	000-000-000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
255	{"en":"Lao People's Democratic Republic"}	Lao People's Democratic Republic	LA	LAO	418	856	00-000-000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
256	{"en":"Latvia","ru":"\\u041b\\u0430\\u0442\\u0432\\u0438\\u044f","oz":"Latviya"}	Latvia	LV	LVA	428	371	00-000-000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
257	{"en":"Lebanon","ru":"\\u041b\\u0438\\u0432\\u0430\\u043d","oz":"Livan"}	Lebanon	LB	LBN	422	961	0-000-000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
258	{"en":"Lesotho","ru":"\\u041b\\u0435\\u0441\\u043e\\u0442\\u043e","oz":"Lesoto"}	Lesotho	LS	LSO	426	266	0-000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
299	{"en":"Oman","ru":"\\u041e\\u043c\\u0430\\u043d","oz":"Ummon"}	Oman	OM	OMN	512	968	00-000-000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
241	{"en": "Islamic Republic of","ru": "Иран","oz": "Eron"}\n	Iran 	IR	IRN	364	98	000-000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
141	{"en":"Afghanistan","ru":"\\u0410\\u0444\\u0433\\u0430\\u043d\\u0438\\u0441\\u0442\\u0430\\u043d","oz":"Afg'oniston"}	Afghanistan	AF	AFG	004	93	00-000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
142	{"en":"Albania","ru":"\\u0410\\u043b\\u0431\\u0430\\u043d\\u0438\\u044f","oz":"Albaniya"}	Albania	AL	ALB	008	355	00-000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
143	{"en":"Algeria","ru":"\\u0410\\u043b\\u0436\\u0438\\u0440","oz":"Jazoir"}	Algeria	DZ	DZA	012	213	00-000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
144	{"en":"American Samoa","ru":"\\u0410\\u043c\\u0435\\u0440\\u0438\\u043a\\u0430\\u043d\\u0441\\u043a\\u043e\\u0435 \\u0421\\u0430\\u043c\\u043e\\u0430","oz":"Amerika Samoasi"}	American Samoa	AS	ASM	016	1684	000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
145	{"en":"Andorra","ru":"\\u0410\\u043d\\u0434\\u043e\\u0440\\u0440\\u0430","oz":"Andorra"}	Andorra	AD	AND	020	376	000-000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
146	{"en":"Angola","ru":"\\u0410\\u043d\\u0433\\u043e\\u043b\\u0430","oz":"Angola"}	Angola	AO	AGO	024	244	000-000-000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
147	{"en":"Anguilla","ru":"\\u0410\\u043d\\u0433\\u0438\\u043b\\u044c\\u044f","oz":"Angilya"}	Anguilla	AI	AIA	660	1264	000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
148	{"en":"Antarctica","ru":"\\u0410\\u043d\\u0442\\u0430\\u0440\\u043a\\u0442\\u0438\\u0434\\u0430","oz":"Antarktida"}	Antarctica	AQ	ATA	010	0		active	2026-01-15 12:24:33	2026-01-15 12:24:33
149	{"en":"Antigua and Barbuda","ru":"\\u0410\\u043d\\u0442\\u0438\\u0433\\u0443\\u0430 \\u0438 \\u0411\\u0430\\u0440\\u0431\\u0443\\u0434\\u0430","oz":"Antigua va Barbuda"}	Antigua and Barbuda	AG	ATG	028	1268	000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
150	{"en":"Argentina","ru":"\\u0410\\u0440\\u0433\\u0435\\u043d\\u0442\\u0438\\u043d\\u0430","oz":"Argentina"}	Argentina	AR	ARG	032	54	00-0000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
151	{"en":"Armenia","ru":"\\u0410\\u0440\\u043c\\u0435\\u043d\\u0438\\u044f","oz":"Armaniston"}	Armenia	AM	ARM	051	374	00-000-000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
152	{"en":"Aruba","ru":"\\u0410\\u0440\\u0443\\u0431\\u0430","oz":"Aruba"}	Aruba	AW	ABW	533	297	000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
153	{"en":"Australia","ru":"\\u0410\\u0432\\u0441\\u0442\\u0440\\u0430\\u043b\\u0438\\u044f","oz":"Avstraliya"}	Australia	AU	AUS	036	61	0-0000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
154	{"en":"Austria","ru":"\\u0410\\u0432\\u0441\\u0442\\u0440\\u0438\\u044f","oz":"Avstriya"}	Austria	AT	AUT	040	43	000-0000000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
155	{"en":"Azerbaijan","ru":"\\u0410\\u0437\\u0435\\u0440\\u0431\\u0430\\u0439\\u0434\\u0436\\u0430\\u043d","oz":"Ozarbayjon"}	Azerbaijan	AZ	AZE	031	994	00-000-00-00	active	2026-01-15 12:24:33	2026-01-15 12:24:33
156	{"en":"Bahamas","ru":"\\u0411\\u0430\\u0433\\u0430\\u043c\\u0441\\u043a\\u0438\\u0435 \\u043e\\u0441\\u0442\\u0440\\u043e\\u0432\\u0430","oz":"Bagam orollari"}	Bahamas	BS	BHS	044	1242	000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
157	{"en":"Bahrain","ru":"\\u0411\\u0430\\u0445\\u0440\\u0435\\u0439\\u043d","oz":"Bahrayn"}	Bahrain	BH	BHR	048	973	0000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
158	{"en":"Bangladesh","ru":"\\u0411\\u0430\\u043d\\u0433\\u043b\\u0430\\u0434\\u0435\\u0448","oz":"Bangladesh"}	Bangladesh	BD	BGD	050	880	00-000-000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
159	{"en":"Barbados","ru":"\\u0411\\u0430\\u0440\\u0431\\u0430\\u0434\\u043e\\u0441","oz":"Barbados"}	Barbados	BB	BRB	052	1246	000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
160	{"en":"Belarus","ru":"\\u0411\\u0435\\u043b\\u0430\\u0440\\u0443\\u0441\\u044c","oz":"Belarus"}	Belarus	BY	BLR	112	375	00-000-00-00	active	2026-01-15 12:24:33	2026-01-15 12:24:33
161	{"en":"Belgium","ru":"\\u0411\\u0435\\u043b\\u044c\\u0433\\u0438\\u044f","oz":"Belgiya"}	Belgium	BE	BEL	056	32	000-000-000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
162	{"en":"Belize","ru":"\\u0411\\u0435\\u043b\\u0438\\u0437","oz":"Beliz"}	Belize	BZ	BLZ	084	501	000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
163	{"en":"Benin","ru":"\\u0411\\u0435\\u043d\\u0438\\u043d","oz":"Benin"}	Benin	BJ	BEN	204	229	00-00-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
164	{"en":"Bermuda","ru":"\\u0411\\u0435\\u0440\\u043c\\u0443\\u0434\\u0441\\u043a\\u0438\\u0435 \\u043e\\u0441\\u0442\\u0440\\u043e\\u0432\\u0430","oz":"Bermuda orollari"}	Bermuda	BM	BMU	060	1441	000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
165	{"en":"Bhutan","ru":"\\u0411\\u0443\\u0442\\u0430\\u043d","oz":"Butan"}	Bhutan	BT	BTN	064	975	0-000-000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
166	{"en":"Bolivia","ru":"\\u0411\\u043e\\u043b\\u0438\\u0432\\u0438\\u044f","oz":"Boliviya"}	Bolivia	BO	BOL	068	591	0-000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
167	{"en":"Bosnia and Herzegovina","ru":"\\u0411\\u043e\\u0441\\u043d\\u0438\\u044f \\u0438 \\u0413\\u0435\\u0440\\u0446\\u0435\\u0433\\u043e\\u0432\\u0438\\u043d\\u0430","oz":"Bosniya va Gertsegovina"}	Bosnia and Herzegovina	BA	BIH	070	387	00-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
168	{"en":"Botswana","ru":"\\u0411\\u043e\\u0442\\u0441\\u0432\\u0430\\u043d\\u0430","oz":"Botsvana"}	Botswana	BW	BWA	072	267	00-000-000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
169	{"en":"Bouvet Island","ru":"\\u041e\\u0441\\u0442\\u0440\\u043e\\u0432 \\u0411\\u0443\\u0432\\u0435","oz":"Buve oroli"}	Bouvet Island	BV	BVT	074	0		active	2026-01-15 12:24:33	2026-01-15 12:24:33
170	{"en":"Brazil","ru":"\\u0411\\u0440\\u0430\\u0437\\u0438\\u043b\\u0438\\u044f","oz":"Braziliya"}	Brazil	BR	BRA	076	55	00-00000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
171	{"en":"British Indian Ocean Territory"}	British Indian Ocean Territory	IO	IOT	086	246	000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
172	{"en":"Brunei Darussalam","ru":"\\u0411\\u0440\\u0443\\u043d\\u0435\\u0439","oz":"Bruney"}	Brunei Darussalam	BN	BRN	096	673	000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
173	{"en":"Bulgaria","ru":"\\u0411\\u043e\\u043b\\u0433\\u0430\\u0440\\u0438\\u044f","oz":"Bolgariya"}	Bulgaria	BG	BGR	100	359	00-000-000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
174	{"en":"Burkina Faso","ru":"\\u0411\\u0443\\u0440\\u043a\\u0438\\u043d\\u0430-\\u0424\\u0430\\u0441\\u043e","oz":"Burkina Faso"}	Burkina Faso	BF	BFA	854	226	00-00-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
175	{"en":"Burundi","ru":"\\u0411\\u0443\\u0440\\u0443\\u043d\\u0434\\u0438","oz":"Burundi"}	Burundi	BI	BDI	108	257	00-00-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
176	{"en":"Cambodia","ru":"\\u041a\\u0430\\u043c\\u0431\\u043e\\u0434\\u0436\\u0430","oz":"Kambodja"}	Cambodia	KH	KHM	116	855	00-000-000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
177	{"en":"Cameroon","ru":"\\u041a\\u0430\\u043c\\u0435\\u0440\\u0443\\u043d","oz":"Kamerun"}	Cameroon	CM	CMR	120	237	0-000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
178	{"en":"Canada","ru":"\\u041a\\u0430\\u043d\\u0430\\u0434\\u0430","oz":"Kanada"}	Canada	CA	CAN	124	1	(000) 000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
179	{"en":"Cape Verde","ru":"\\u041a\\u0430\\u0431\\u043e-\\u0412\\u0435\\u0440\\u0434\\u0435","oz":"Kabo-Verde"}	Cape Verde	CV	CPV	132	238	000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
180	{"en":"Cayman Islands","ru":"\\u041a\\u0430\\u0439\\u043c\\u0430\\ufffd\\ufffd\\u043e\\u0432\\u044b \\u043e\\u0441\\u0442\\u0440\\u043e\\u0432\\u0430","oz":"Kayman orollari"}	Cayman Islands	KY	CYM	136	1345	000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
259	{"en":"Liberia","ru":"\\u041b\\u0438\\u0431\\u0435\\u0440\\u0438\\u044f","oz":"Liberiya"}	Liberia	LR	LBR	430	231	00-000-000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
181	{"en":"Central African Republic","ru":"\\u0426\\u0435\\u043d\\u0442\\u0440\\u0430\\u043b\\u044c\\u043d\\u043e\\u0430\\u0444\\u0440\\u0438\\u043a\\u0430\\u043d\\u0441\\u043a\\u0430\\u044f \\u0420\\u0435\\u0441\\u043f\\u0443\\u0431\\u043b\\u0438\\u043a\\u0430","oz":"Markaziy Afrika Respublikasi"}	Central African Republic	CF	CAF	140	236	00-00-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
182	{"en":"Chad","ru":"\\u0427\\u0430\\u0434","oz":"Chad"}	Chad	TD	TCD	148	235	00-00-00-00	active	2026-01-15 12:24:33	2026-01-15 12:24:33
183	{"en":"Chile","ru":"\\u0427\\u0438\\u043b\\u0438","oz":"Chili"}	Chile	CL	CHL	152	56	0-0000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
184	{"en":"China","ru":"\\u041a\\u0438\\u0442\\u0430\\u0439","oz":"Xitoy"}	China	CN	CHN	156	86	000-0000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
185	{"en":"Christmas Island","ru":"\\u041e\\u0441\\u0442\\u0440\\u043e\\u0432 \\u0420\\u043e\\u0436\\u0434\\u0435\\u0441\\u0442\\u0432\\u0430","oz":"Rojdestvo oroli"}	Christmas Island	CX	CXR	162	61	0-0000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
186	{"en":"Cocos (Keeling) Islands","ru":"\\u041a\\u043e\\u043a\\u043e\\u0441\\u043e\\u0432\\u044b\\u0435 \\u043e\\u0441\\u0442\\u0440\\u043e\\u0432\\u0430","oz":"Kokos orollari"}	Cocos (Keeling) Islands	CC	CCK	166	672	0-0000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
187	{"en":"Colombia","ru":"\\u041a\\u043e\\u043b\\u0443\\u043c\\u0431\\u0438\\u044f","oz":"Kolumbiya"}	Colombia	CO	COL	170	57	000-000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
188	{"en":"Comoros","ru":"\\u041a\\u043e\\u043c\\u043e\\u0440\\u0441\\u043a\\u0438\\u0435 \\u043e\\u0441\\u0442\\u0440\\u043e\\u0432\\u0430","oz":"Komor orollari"}	Comoros	KM	COM	174	269	00-00000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
189	{"en":"Congo","ru":"\\u041a\\u043e\\u043d\\u0433\\u043e","oz":"Kongo"}	Congo	CG	COG	178	242	00-000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
191	{"en":"Cook Islands","ru":"\\u041e\\u0441\\u0442\\u0440\\u043e\\u0432\\u0430 \\u041a\\u0443\\u043a\\u0430","oz":"Kuk orollari"}	Cook Islands	CK	COK	184	682	00-000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
192	{"en":"Costa Rica","ru":"\\u041a\\u043e\\u0441\\u0442\\u0430-\\u0420\\u0438\\u043a\\u0430","oz":"Kosta-Rika"}	Costa Rica	CR	CRI	188	506	0000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
194	{"en":"Croatia","ru":"\\u0425\\u043e\\u0440\\u0432\\u0430\\u0442\\u0438\\u044f","oz":"Xorvatiya"}	Croatia	HR	HRV	191	385	00-000-000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
195	{"en":"Cuba","ru":"\\u041a\\u0443\\u0431\\u0430","oz":"Kuba"}	Cuba	CU	CUB	192	53	0-000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
196	{"en":"Cyprus","ru":"\\u041a\\u0438\\u043f\\u0440","oz":"Kipr"}	Cyprus	CY	CYP	196	357	00-000-000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
197	{"en":"Czech Republic","ru":"\\u0427\\u0435\\u0448\\u0441\\u043a\\u0430\\u044f \\u0420\\u0435\\u0441\\u043f\\u0443\\u0431\\u043b\\u0438\\u043a\\u0430","oz":"Chexiya Respublikasi"}	Czech Republic	CZ	CZE	203	420	000-000-000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
198	{"en":"Denmark","ru":"\\u0414\\u0430\\u043d\\u0438\\u044f","oz":"Daniya"}	Denmark	DK	DNK	208	45	00-00-00-00	active	2026-01-15 12:24:33	2026-01-15 12:24:33
199	{"en":"Djibouti","ru":"\\u0414\\u0436\\u0438\\u0431\\u0443\\u0442\\u0438","oz":"Jibuti"}	Djibouti	DJ	DJI	262	253	00-00-00-00	active	2026-01-15 12:24:33	2026-01-15 12:24:33
200	{"en":"Dominica","ru":"\\u0414\\u043e\\u043c\\u0438\\u043d\\u0438\\u043a\\u0430","oz":"Dominika"}	Dominica	DM	DMA	212	1767	000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
201	{"en":"Dominican Republic","ru":"\\u0414\\u043e\\u043c\\u0438\\u043d\\u0438\\u043a\\u0430\\u043d\\u0441\\u043a\\u0430\\u044f \\u0420\\u0435\\u0441\\u043f\\u0443\\u0431\\u043b\\u0438\\u043a\\u0430","oz":"Dominikan Respublikasi"}	Dominican Republic	DO	DOM	214	1809	000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
202	{"en":"Ecuador","ru":"\\u042d\\u043a\\u0432\\u0430\\u0434\\u043e\\u0440","oz":"Ekvador"}	Ecuador	EC	ECU	218	593	0-000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
203	{"en":"Egypt","ru":"\\u0415\\u0433\\u0438\\u043f\\u0435\\u0442","oz":"Misr"}	Egypt	EG	EGY	818	20	00-0000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
204	{"en":"El Salvador","ru":"\\u0421\\u0430\\u043b\\u044c\\u0432\\u0430\\u0434\\u043e\\u0440","oz":"Salvador"}	El Salvador	SV	SLV	222	503	0000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
205	{"en":"Equatorial Guinea","ru":"\\u042d\\u043a\\u0432\\u0430\\u0442\\u043e\\u0440\\u0438\\u0430\\u043b\\u044c\\u043d\\u0430\\u044f \\u0413\\u0432\\u0438\\u043d\\u0435\\u044f","oz":"Ekvatorial Gvineya"}	Equatorial Guinea	GQ	GNQ	226	240	00-000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
206	{"en":"Eritrea","ru":"\\u042d\\u0440\\u0438\\u0442\\u0440\\u0435\\u044f","oz":"Eritreya"}	Eritrea	ER	ERI	232	291	0-000-000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
207	{"en":"Estonia","ru":"\\u042d\\u0441\\u0442\\u043e\\u043d\\u0438\\u044f","oz":"Estoniya"}	Estonia	EE	EST	233	372	0000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
208	{"en":"Ethiopia","ru":"\\u042d\\u0444\\u0438\\u043e\\u043f\\u0438\\u044f","oz":"Efiopiya"}	Ethiopia	ET	ETH	231	251	00-000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
209	{"en":"Falkland Islands (Malvinas)","ru":"\\u0424\\u043e\\u043b\\u043a\\u043b\\u0435\\u043d\\u0434\\u0441\\u043a\\u0438\\u0435 \\u043e\\u0441\\u0442\\u0440\\u043e\\u0432\\u0430","oz":"Folklend orollari"}	Falkland Islands (Malvinas)	FK	FLK	238	500	00000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
210	{"en":"Faroe Islands","ru":"\\u0424\\u0430\\u0440\\u0435\\u0440\\u0441\\u043a\\u0438\\u0435 \\u043e\\u0441\\u0442\\u0440\\u043e\\u0432\\u0430","oz":"Farer orollari"}	Faroe Islands	FO	FRO	234	298	000-000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
211	{"en":"Fiji","ru":"\\u0424\\u0438\\u0434\\u0436\\u0438","oz":"Fiji"}	Fiji	FJ	FJI	242	679	000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
212	{"en":"Finland","ru":"\\u0424\\u0438\\u043d\\u043b\\u044f\\u043d\\u0434\\u0438\\u044f","oz":"Finlyandiya"}	Finland	FI	FIN	246	358	00-000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
213	{"en":"France","ru":"\\u0424\\u0440\\u0430\\u043d\\u0446\\u0438\\u044f","oz":"Fransiya"}	France	FR	FRA	250	33	0-00-00-00-00	active	2026-01-15 12:24:33	2026-01-15 12:24:33
214	{"en":"French Guiana","ru":"\\u0424\\u0440\\u0430\\u043d\\u0446\\u0443\\u0437\\u0441\\u043a\\u0430\\u044f \\u0413\\u0432\\u0438\\u0430\\u043d\\u0430","oz":"Fransuz Gvianasi"}	French Guiana	GF	GUF	254	594	000-00-00-00	active	2026-01-15 12:24:33	2026-01-15 12:24:33
215	{"en":"French Polynesia","ru":"\\u0424\\u0440\\u0430\\u043d\\u0446\\u0443\\u0437\\u0441\\u043a\\u0430\\u044f \\u041f\\u043e\\u043b\\u0438\\u043d\\u0435\\u0437\\u0438\\u044f","oz":"Fransuz Polineziyasi"}	French Polynesia	PF	PYF	258	689	00-00-00	active	2026-01-15 12:24:33	2026-01-15 12:24:33
216	{"en":"French Southern Territories","ru":"\\u0424\\u0440\\u0430\\u043d\\u0446\\u0443\\u0437\\u0441\\u043a\\u0438\\u0435 \\u042e\\u0436\\u043d\\u044b\\u0435 \\u0422\\u0435\\u0440\\u0440\\u0438\\u0442\\u043e\\u0440\\u0438\\u0438","oz":"Fransuz Janubiy hududlari"}	French Southern Territories	TF	ATF	260	0		active	2026-01-15 12:24:33	2026-01-15 12:24:33
193	{"en": "Cote D'Ivoire","ru": "Cote D'Ivoire","oz": "Cote D'Ivoire"}\n	Cote D'Ivoire	CI	CIV	384	225	00-000-000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
260	{"en":"Libyan Arab Jamahiriya","ru":"\\u041b\\u0438\\u0432\\u0438\\u044f","oz":"Liviya"}	Libyan Arab Jamahiriya	LY	LBY	434	218	00-000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
261	{"en":"Liechtenstein","ru":"\\u041b\\u0438\\u0445\\u0442\\u0435\\u043d\\u0448\\u0442\\u0435\\u0439\\u043d","oz":"Lixtenshteyn"}	Liechtenstein	LI	LIE	438	423	000-000-000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
262	{"en":"Lithuania","ru":"\\u041b\\u0438\\u0442\\u0432\\u0430","oz":"Litva"}	Lithuania	LT	LTU	440	370	000-00-000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
263	{"en":"Luxembourg","ru":"\\u041b\\u044e\\u043a\\u0441\\u0435\\u043c\\u0431\\u0443\\u0440\\u0433","oz":"Lyuksemburg"}	Luxembourg	LU	LUX	442	352	000-000-000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
264	{"en":"Macao","ru":"\\u041c\\u0430\\u043a\\u0430\\u043e","oz":"Makao"}	Macao	MO	MAC	446	853	0000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
266	{"en":"Madagascar","ru":"\\u041c\\u0430\\u0434\\u0430\\u0433\\u0430\\u0441\\u043a\\u0430\\u0440","oz":"Madagaskar"}	Madagascar	MG	MDG	450	261	00-00-00000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
267	{"en":"Malawi","ru":"\\u041c\\u0430\\u043b\\u0430\\u0432\\u0438","oz":"Malavi"}	Malawi	MW	MWI	454	265	0-000-000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
268	{"en":"Malaysia","ru":"\\u041c\\u0430\\u043b\\u0430\\u0439\\u0437\\u0438\\u044f","oz":"Malayziya"}	Malaysia	MY	MYS	458	60	00-000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
269	{"en":"Maldives","ru":"\\u041c\\u0430\\u043b\\u044c\\u0434\\u0438\\u0432\\u044b","oz":"Maldiv orollari"}	Maldives	MV	MDV	462	960	000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
270	{"en":"Mali","ru":"\\u041c\\u0430\\u043b\\u0438","oz":"Mali"}	Mali	ML	MLI	466	223	00-00-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
271	{"en":"Malta","ru":"\\u041c\\u0430\\u043b\\u044c\\u0442\\u0430","oz":"Malta"}	Malta	MT	MLT	470	356	0000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
272	{"en":"Marshall Islands","ru":"\\u041c\\u0430\\u0440\\u0448\\u0430\\u043b\\u043b\\u043e\\u0432\\u044b \\u041e\\u0441\\u0442\\u0440\\u043e\\u0432\\u0430","oz":"Marshal orollari"}	Marshall Islands	MH	MHL	584	692	000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
273	{"en":"Martinique","ru":"\\u041c\\u0430\\u0440\\u0442\\u0438\\u043d\\u0438\\u043a\\u0430","oz":"Martinika"}	Martinique	MQ	MTQ	474	596	000-00-00-00	active	2026-01-15 12:24:33	2026-01-15 12:24:33
274	{"en":"Mauritania","ru":"\\u041c\\u0430\\u0432\\u0440\\u0438\\u0442\\u0430\\u043d\\u0438\\u044f","oz":"Mavritaniya"}	Mauritania	MR	MRT	478	222	00-00-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
275	{"en":"Mauritius","ru":"\\u041c\\u0430\\u0432\\u0440\\u0438\\u043a\\u0438\\u0439","oz":"Mavrikiy"}	Mauritius	MU	MUS	480	230	000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
276	{"en":"Mayotte","ru":"\\u041c\\u0430\\u0439\\u043e\\u0442\\u0442\\u0430","oz":"Mayotta"}	Mayotte	YT	MYT	175	269	00-00000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
277	{"en":"Mexico","ru":"\\u041c\\u0435\\u043a\\u0441\\u0438\\u043a\\u0430","oz":"Meksika"}	Mexico	MX	MEX	484	52	00-0000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
280	{"en":"Monaco","ru":"\\u041c\\u043e\\u043d\\u0430\\u043a\\u043e","oz":"Monako"}	Monaco	MC	MCO	492	377	00-00-00-00-00	active	2026-01-15 12:24:33	2026-01-15 12:24:33
281	{"en":"Mongolia","ru":"\\u041c\\u043e\\u043d\\u0433\\u043e\\u043b\\u0438\\u044f","oz":"Mo'g'uliston"}	Mongolia	MN	MNG	496	976	00-00-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
282	{"en":"Montserrat","ru":"\\u041c\\u043e\\u043d\\u0442\\u0441\\u0435\\u0440\\u0440\\u0430\\u0442","oz":"Montserrat"}	Montserrat	MS	MSR	500	1664	000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
283	{"en":"Morocco","ru":"\\u041c\\u0430\\u0440\\u043e\\u043a\\u043a\\u043e","oz":"Marokash"}	Morocco	MA	MAR	504	212	00-0000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
284	{"en":"Mozambique","ru":"\\u041c\\u043e\\u0437\\u0430\\u043c\\u0431\\u0438\\u043a","oz":"Mozambik"}	Mozambique	MZ	MOZ	508	258	00-000-000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
285	{"en":"Myanmar","ru":"\\u041c\\u044c\\u044f\\u043d\\u043c\\u0430","oz":"Myanma"}	Myanmar	MM	MMR	104	95	0-000-000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
286	{"en":"Namibia","ru":"\\u041d\\u0430\\u043c\\u0438\\u0431\\u0438\\u044f","oz":"Namibiya"}	Namibia	NA	NAM	516	264	00-000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
287	{"en":"Nauru","ru":"\\u041d\\u0430\\u0443\\u0440\\u0443","oz":"Nauru"}	Nauru	NR	NRU	520	674	000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
288	{"en":"Nepal","ru":"\\u041d\\u0435\\u043f\\u0430\\u043b","oz":"Nepal"}	Nepal	NP	NPL	524	977	00-000-000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
289	{"en":"Netherlands Antilles","ru":"\\u041d\\u0438\\u0434\\u0435\\u0440\\u043b\\u0430\\u043d\\u0434\\u0441\\u043a\\u0438\\u0435 \\u0410\\u043d\\u0442\\u0438\\u043b\\u044c\\u0441\\u043a\\u0438\\u0435 \\u043e\\u0441\\u0442\\u0440\\u043e\\u0432\\u0430","oz":"Niderlandiya Antil orollari"}	Netherlands Antilles	NL	ANT	530	599	000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
290	{"en":"New Caledonia","ru":"\\u041d\\u043e\\u0432\\u0430\\u044f \\u041a\\u0430\\u043b\\u0435\\u0434\\u043e\\u043d\\u0438\\u044f","oz":"Yangi Kaledoniya"}	New Caledonia	NC	NCL	540	687	00-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
291	{"en":"New Zealand","ru":"\\u041d\\u043e\\u0432\\u0430\\u044f \\u0417\\u0435\\u043b\\u0430\\u043d\\u0434\\u0438\\u044f","oz":"Yangi Zelandiya"}	New Zealand	NZ	NZL	554	64	00-000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
292	{"en":"Nicaragua","ru":"\\u041d\\u0438\\u043a\\u0430\\u0440\\u0430\\u0433\\u0443\\u0430","oz":"Nikaragua"}	Nicaragua	NI	NIC	558	505	0000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
293	{"en":"Niger","ru":"\\u041d\\u0438\\u0433\\u0435\\u0440","oz":"Niger"}	Niger	NE	NER	562	227	00-00-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
294	{"en":"Nigeria","ru":"\\u041d\\u0438\\u0433\\u0435\\u0440\\u0438\\u044f","oz":"Nigeriya"}	Nigeria	NG	NGA	566	234	00-0000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
295	{"en":"Niue","ru":"\\u041d\\u0438\\u0443\\u044d","oz":"Niue"}	Niue	NU	NIU	570	683	0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
296	{"en":"Norfolk Island","ru":"\\u041e\\u0441\\u0442\\u0440\\u043e\\u0432 \\u041d\\u043e\\u0440\\u0444\\u043e\\u043b\\u043a","oz":"Norfolk oroli"}	Norfolk Island	NF	NFK	574	672	0-0000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
297	{"en":"Northern Mariana Islands","ru":"\\u0421\\u0435\\u0432\\u0435\\u0440\\u043d\\u044b\\u0435 \\u041c\\u0430\\u0440\\u0438\\u0430\\u043d\\u0441\\u043a\\u0438\\u0435 \\u043e\\u0441\\u0442\\u0440\\u043e\\u0432\\u0430","oz":"Shimoliy Mariana orollari"}	Northern Mariana Islands	MP	MNP	580	1670	000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
298	{"en":"Norway","ru":"\\u041d\\u043e\\u0440\\u0432\\u0435\\u0433\\u0438\\u044f","oz":"Norvegiya"}	Norway	NO	NOR	578	47	000-00-000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
265	{ "en":"the Former Yugoslav Republic of", "ru":"Македония","oz": "Makedoniya"}\n	Macedonia 	MK	MKD	807	389	00-000-000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
278	{ "en":"Micronesia, Federated States of", "ru":"Микронезия","oz":"Mikroneziya"}	Micronesia	FM	FSM	583	691	000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
300	{"en":"Pakistan","ru":"\\u041f\\u0430\\u043a\\u0438\\u0441\\u0442\\u0430\\u043d","oz":"Pokiston"}	Pakistan	PK	PAK	586	92	000-0000000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
301	{"en":"Palau","ru":"\\u041f\\u0430\\u043b\\u0430\\u0443","oz":"Palau"}	Palau	PW	PLW	585	680	000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
303	{"en":"Panama","ru":"\\u041f\\u0430\\u043d\\u0430\\u043c\\u0430","oz":"Panama"}	Panama	PA	PAN	591	507	000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
304	{"en":"Papua New Guinea","ru":"\\u041f\\u0430\\u043f\\u0443\\u0430 \\u2014 \\u041d\\u043e\\u0432\\u0430\\u044f \\u0413\\u0432\\u0438\\u043d\\u0435\\u044f","oz":"Papua Yangi Gvineya"}	Papua New Guinea	PG	PNG	598	675	000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
305	{"en":"Paraguay","ru":"\\u041f\\u0430\\u0440\\u0430\\u0433\\u0432\\u0430\\u0439","oz":"Paragvay"}	Paraguay	PY	PRY	600	595	00-000-000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
306	{"en":"Peru","ru":"\\u041f\\u0435\\u0440\\u0443","oz":"Peru"}	Peru	PE	PER	604	51	00-000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
307	{"en":"Philippines","ru":"\\u0424\\u0438\\u043b\\u0438\\u043f\\u043f\\u0438\\u043d\\u044b","oz":"Filippin"}	Philippines	PH	PHL	608	63	000-000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
308	{"en":"Pitcairn","ru":"\\u041f\\u0438\\u0442\\u043a\\u044d\\u0440\\u043d","oz":"Pitkern"}	Pitcairn	PN	PCN	612	0		active	2026-01-15 12:24:33	2026-01-15 12:24:33
309	{"en":"Poland","ru":"\\u041f\\u043e\\u043b\\u044c\\u0448\\u0430","oz":"Polsha"}	Poland	PL	POL	616	48	00-000-00-00	active	2026-01-15 12:24:33	2026-01-15 12:24:33
310	{"en":"Portugal","ru":"\\u041f\\u043e\\u0440\\u0442\\u0443\\u0433\\u0430\\u043b\\u0438\\u044f","oz":"Portugaliya"}	Portugal	PT	PRT	620	351	00-000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
311	{"en":"Puerto Rico","ru":"\\u041f\\u0443\\u044d\\u0440\\u0442\\u043e-\\u0420\\u0438\\u043a\\u043e","oz":"Puerto-Riko"}	Puerto Rico	PR	PRI	630	1787	000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
312	{"en":"Qatar","ru":"\\u041a\\u0430\\u0442\\u0430\\u0440","oz":"Qatar"}	Qatar	QA	QAT	634	974	0000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
313	{"en":"Reunion","ru":"\\u0420\\u0435\\u044e\\u043d\\u044c\\u043e\\u043d","oz":"Reyunion"}	Reunion	RE	REU	638	262	000-00-00-00	active	2026-01-15 12:24:33	2026-01-15 12:24:33
314	{"en":"Romania","ru":"\\u0420\\u0443\\u043c\\u044b\\u043d\\u0438\\u044f","oz":"Ruminiya"}	Romania	RO	ROM	642	40	00-000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
315	{"en":"Russian Federation","ru":"\\u0420\\u043e\\u0441\\u0441\\u0438\\u0439\\u0441\\u043a\\u0430\\u044f \\u0424\\u0435\\u0434\\u0435\\u0440\\u0430\\u0446\\u0438\\u044f","oz":"Rossiya Federatsiyasi"}	Russian Federation	RU	RUS	643	70	(000) 000-00-00	active	2026-01-15 12:24:33	2026-01-15 12:24:33
316	{"en":"Rwanda","ru":"\\u0420\\u0443\\u0430\\u043d\\u0434\\u0430","oz":"Ruanda"}	Rwanda	RW	RWA	646	250	000-000-000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
317	{"en":"Saint Helena","ru":"\\u041e\\u0441\\u0442\\u0440\\u043e\\u0432 \\u0421\\u0432\\u044f\\u0442\\u043e\\u0439 \\u0415\\u043b\\u0435\\u043d\\u044b","oz":"Avliyo Yelena oroli"}	Saint Helena	SH	SHN	654	290	0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
318	{"en":"Saint Kitts and Nevis","ru":"\\u0421\\u0435\\u043d\\u0442-\\u041a\\u0438\\u0442\\u0441 \\u0438 \\u041d\\u0435\\u0432\\u0438\\u0441","oz":"Sent-Kits va Nevis"}	Saint Kitts and Nevis	KN	KNA	659	1869	000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
319	{"en":"Saint Lucia","ru":"\\u0421\\u0435\\u043d\\u0442-\\u041b\\u044e\\u0441\\u0438\\u044f","oz":"Sent-Lyusiya"}	Saint Lucia	LC	LCA	662	1758	000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
320	{"en":"Saint Pierre and Miquelon","ru":"\\u0421\\u0435\\u043d-\\u041f\\u044c\\u0435\\u0440 \\u0438 \\u041c\\u0438\\u043a\\u0435\\u043b\\u043e\\u043d","oz":"Sen-Pyer va Mikelon"}	Saint Pierre and Miquelon	PM	SPM	666	508	00-00-00	active	2026-01-15 12:24:33	2026-01-15 12:24:33
321	{"en":"Saint Vincent and the Grenadines","ru":"\\u0421\\u0435\\u043d\\u0442-\\u0412\\u0438\\u043d\\u0441\\u0435\\u043d\\u0442 \\u0438 \\u0413\\u0440\\u0435\\u043d\\u0430\\u0434\\u0438\\u043d\\u044b","oz":"Sent-Vinsent va Grenadinlar"}	Saint Vincent and the Grenadines	VC	VCT	670	1784	000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
322	{"en":"Samoa","ru":"\\u0421\\u0430\\u043c\\u043e\\u0430","oz":"Samoa"}	Samoa	WS	WSM	882	684	000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
323	{"en":"San Marino","ru":"\\u0421\\u0430\\u043d-\\u041c\\u0430\\u0440\\u0438\\u043d\\u043e","oz":"San-Marino"}	San Marino	SM	SMR	674	378	0000-000000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
324	{"en":"Sao Tome and Principe","ru":"\\u0421\\u0430\\u043d-\\u0422\\u043e\\u043c\\u0435 \\u0438 \\u041f\\u0440\\u0438\\u043d\\u0441\\u0438\\u043f\\u0438","oz":"San-Tome va Prinsipi"}	Sao Tome and Principe	ST	STP	678	239	00-00000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
325	{"en":"Saudi Arabia","ru":"\\u0421\\u0430\\u0443\\u0434\\u043e\\u0432\\u0441\\u043a\\u0430\\u044f \\u0410\\u0440\\u0430\\u0432\\u0438\\u044f","oz":"Saudiya Arabistoni"}	Saudi Arabia	SA	SAU	682	966	0-000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
326	{"en":"Senegal","ru":"\\u0421\\u0435\\u043d\\u0435\\u0433\\u0430\\u043b","oz":"Senegal"}	Senegal	SN	SEN	686	221	00-000-00-00	active	2026-01-15 12:24:33	2026-01-15 12:24:33
327	{"en":"Serbia and Montenegro","ru":"\\u0421\\u0435\\u0440\\u0431\\u0438\\u044f \\u0438 \\u0427\\u0435\\u0440\\u043d\\u043e\\u0433\\u043e\\u0440\\u0438\\u044f","oz":"Serbiya va Chernogoriya"}	Serbia and Montenegro	RS	SRB	688	381	00-000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
328	{"en":"Seychelles","ru":"\\u0421\\u0435\\u0439\\u0448\\u0435\\u043b\\u044c\\u0441\\u043a\\u0438\\u0435 \\u041e\\u0441\\u0442\\u0440\\u043e\\u0432\\u0430","oz":"Seyshel orollari"}	Seychelles	SC	SYC	690	248	0-000-000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
329	{"en":"Sierra Leone","ru":"\\u0421\\u044c\\u0435\\u0440\\u0440\\u0430-\\u041b\\u0435\\u043e\\u043d\\u0435","oz":"Syerra-Leone"}	Sierra Leone	SL	SLE	694	232	00-000000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
330	{"en":"Singapore","ru":"\\u0421\\u0438\\u043d\\u0433\\u0430\\u043f\\u0443\\u0440","oz":"Singapur"}	Singapore	SG	SGP	702	65	0000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
331	{"en":"Slovakia","ru":"\\u0421\\u043b\\u043e\\u0432\\u0430\\u043a\\u0438\\u044f","oz":"Slovakiya"}	Slovakia	SK	SVK	703	421	000-000-000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
332	{"en":"Slovenia","ru":"\\u0421\\u043b\\u043e\\u0432\\u0435\\u043d\\u0438\\u044f","oz":"Sloveniya"}	Slovenia	SI	SVN	705	386	00-000-000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
333	{"en":"Solomon Islands","ru":"\\u0421\\u043e\\u043b\\u043e\\u043c\\u043e\\u043d\\u043e\\u0432\\u044b \\u041e\\u0441\\u0442\\u0440\\u043e\\u0432\\u0430","oz":"Solomon orollari"}	Solomon Islands	SB	SLB	090	677	00-00000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
334	{"en":"Somalia","ru":"\\u0421\\u043e\\u043c\\u0430\\u043b\\u0438","oz":"Somali"}	Somalia	SO	SOM	706	252	0-000-000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
335	{"en":"South Africa","ru":"\\u042e\\u0436\\u043d\\u0430\\u044f \\u0410\\u0444\\u0440\\u0438\\u043a\\u0430","oz":"Janubiy Afrika"}	South Africa	ZA	ZAF	710	27	00-000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
372	{"en":"Wallis and Futuna","ru":"\\u0423\\u043e\\u043b\\u043b\\u0438\\u0441 \\u0438 \\u0424\\u0443\\u0442\\u0443\\u043d\\u0430","oz":"Uollis va Futuna"}	Wallis and Futuna	WF	WLF	876	681	00-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
337	{"en":"Spain","ru":"\\u0418\\u0441\\u043f\\u0430\\u043d\\u0438\\u044f","oz":"Ispaniya"}	Spain	ES	ESP	724	34	000-000-000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
338	{"en":"Sri Lanka","ru":"\\u0428\\u0440\\u0438-\\u041b\\u0430\\u043d\\u043a\\u0430","oz":"Shri-Lanka"}	Sri Lanka	LK	LKA	144	94	00-000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
339	{"en":"Sudan","ru":"\\u0421\\u0443\\u0434\\u0430\\u043d","oz":"Sudan"}	Sudan	SD	SDN	736	249	00-000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
340	{"en":"Suriname","ru":"\\u0421\\u0443\\u0440\\u0438\\u043d\\u0430\\u043c","oz":"Surinam"}	Suriname	SR	SUR	740	597	000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
341	{"en":"Svalbard and Jan Mayen","ru":"\\u0428\\u043f\\u0438\\u0446\\u0431\\u0435\\u0440\\u0433\\u0435\\u043d \\u0438 \\u042f\\u043d-\\u041c\\u0430\\u0439\\u0435\\u043d","oz":"Shpitsbergen va Yan-Mayen"}	Svalbard and Jan Mayen	SJ	SJM	744	47	000-00-000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
342	{"en":"Swaziland","ru":"\\u0421\\u0432\\u0430\\u0437\\u0438\\u043b\\u0435\\u043d\\u0434","oz":"Svaziland"}	Swaziland	SZ	SWZ	748	268	00-00-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
343	{"en":"Sweden","ru":"\\u0428\\u0432\\u0435\\u0446\\u0438\\u044f","oz":"Shvetsiya"}	Sweden	SE	SWE	752	46	00-000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
344	{"en":"Switzerland","ru":"\\u0428\\u0432\\u0435\\u0439\\u0446\\u0430\\u0440\\u0438\\u044f","oz":"Shveytsariya"}	Switzerland	CH	CHE	756	41	00-000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
345	{"en":"Syrian Arab Republic","ru":"\\u0421\\u0438\\u0440\\u0438\\u044f","oz":"Suriya"}	Syrian Arab Republic	SY	SYR	760	963	00-0000-000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
347	{"en":"Tajikistan","ru":"\\u0422\\u0430\\u0434\\u0436\\u0438\\u043a\\u0438\\u0441\\u0442\\u0430\\u043d","oz":"Tojikiston"}	Tajikistan	TJ	TJK	762	992	00-000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
349	{"en":"Thailand","ru":"\\u0422\\u0430\\u0438\\u043b\\u0430\\u043d\\u0434","oz":"Tailand"}	Thailand	TH	THA	764	66	00-000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
350	{"en":"Timor-Leste","ru":"\\u0412\\u043e\\u0441\\u0442\\u043e\\u0447\\u043d\\u044b\\u0439 \\u0422\\u0438\\u043c\\u043e\\u0440","oz":"Sharqiy Timor"}	Timor-Leste	TL	TLS	626	670	000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
351	{"en":"Togo","ru":"\\u0422\\u043e\\u0433\\u043e","oz":"Togo"}	Togo	TG	TGO	768	228	00-000-000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
352	{"en":"Tokelau","ru":"\\u0422\\u043e\\u043a\\u0435\\u043b\\u0430\\u0443","oz":"Tokelau"}	Tokelau	TK	TKL	772	690	0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
353	{"en":"Tonga","ru":"\\u0422\\u043e\\u043d\\u0433\\u0430","oz":"Tonga"}	Tonga	TO	TON	776	676	00000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
354	{"en":"Trinidad and Tobago","ru":"\\u0422\\u0440\\u0438\\u043d\\u0438\\u0434\\u0430\\u0434 \\u0438 \\u0422\\u043e\\u0431\\u0430\\u0433\\u043e","oz":"Trinidad va Tobago"}	Trinidad and Tobago	TT	TTO	780	1868	000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
355	{"en":"Tunisia","ru":"\\u0422\\u0443\\u043d\\u0438\\u0441","oz":"Tunis"}	Tunisia	TN	TUN	788	216	00-000-000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
356	{"en":"Turkey","ru":"\\u0422\\u0443\\u0440\\u0446\\u0438\\u044f","oz":"Turkiya"}	Turkey	TR	TUR	792	90	000-000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
357	{"en":"Turkmenistan","ru":"\\u0422\\u0443\\u0440\\u043a\\u043c\\u0435\\u043d\\u0438\\u0441\\u0442\\u0430\\u043d","oz":"Turkmaniston"}	Turkmenistan	TM	TKM	795	7370	0-000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
358	{"en":"Turks and Caicos Islands","ru":"\\u0422\\u0435\\u0440\\u043a\\u0441 \\u0438 \\u041a\\u0430\\u0439\\u043a\\u043e\\u0441","oz":"Terks va Kaykos orollari"}	Turks and Caicos Islands	TC	TCA	796	1649	000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
359	{"en":"Tuvalu","ru":"\\u0422\\u0443\\u0432\\u0430\\u043b\\u0443","oz":"Tuvalu"}	Tuvalu	TV	TUV	798	688	00000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
360	{"en":"Uganda","ru":"\\u0423\\u0433\\u0430\\u043d\\u0434\\u0430","oz":"Uganda"}	Uganda	UG	UGA	800	256	00-000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
361	{"en":"Ukraine","ru":"\\u0423\\u043a\\u0440\\u0430\\u0438\\u043d\\u0430","oz":"Ukraina"}	Ukraine	UA	UKR	804	380	00-000-00-00	active	2026-01-15 12:24:33	2026-01-15 12:24:33
362	{"en":"United Arab Emirates","ru":"\\u041e\\u0431\\u044a\\u0435\\u0434\\u0438\\u043d\\u0451\\u043d\\u043d\\u044b\\u0435 \\u0410\\u0440\\u0430\\u0431\\u0441\\u043a\\u0438\\u0435 \\u042d\\u043c\\u0438\\u0440\\u0430\\u0442\\u044b","oz":"Birlashgan Arab Amirliklari"}	United Arab Emirates	AE	ARE	784	971	0-000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
363	{"en":"United Kingdom","ru":"\\u0412\\u0435\\u043b\\u0438\\u043a\\u043e\\u0431\\u0440\\u0438\\u0442\\u0430\\u043d\\u0438\\u044f","oz":"Buyuk Britaniya"}	United Kingdom	GB	GBR	826	44	00-0000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
364	{"en":"United States","ru":"\\u0421\\u043e\\u0435\\u0434\\u0438\\u043d\\u0451\\u043d\\u043d\\u044b\\u0435 \\u0428\\u0442\\u0430\\u0442\\u044b","oz":"Amerika Qo'shma Shtatlari"}	United States	US	USA	840	1	(000) 000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
365	{"en":"United States Minor Outlying Islands","ru":"\\u0412\\u043d\\u0435\\u0448\\u043d\\u0438\\u0435 \\u043c\\u0430\\u043b\\u044b\\u0435 \\u043e\\u0441\\u0442\\u0440\\u043e\\u0432\\u0430 \\u0421\\u0428\\u0410","oz":"AQSh tashqi kichik orollari"}	United States Minor Outlying Islands	UM	UMI	581	1	(000) 000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
366	{"en":"Uruguay","ru":"\\u0423\\u0440\\u0443\\u0433\\u0432\\u0430\\u0439","oz":"Urugvay"}	Uruguay	UY	URY	858	598	0-000-00-00	active	2026-01-15 12:24:33	2026-01-15 12:24:33
367	{"en":"Uzbekistan","ru":"\\u0423\\u0437\\u0431\\u0435\\u043a\\u0438\\u0441\\u0442\\u0430\\u043d","oz":"O'zbekiston"}	Uzbekistan	UZ	UZB	860	998	00-000-00-00	active	2026-01-15 12:24:33	2026-01-15 12:24:33
368	{"en":"Vanuatu","ru":"\\u0412\\u0430\\u043d\\u0443\\u0430\\u0442\\u0443","oz":"Vanuatu"}	Vanuatu	VU	VUT	548	678	00-00000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
369	{"en":"Venezuela","ru":"\\u0412\\u0435\\u043d\\u0435\\u0441\\u0443\\u044d\\u043b\\u0430","oz":"Venesuela"}	Venezuela	VE	VEN	862	58	000-000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
370	{"en":"Viet Nam","ru":"\\u0412\\u044c\\u0435\\u0442\\u043d\\u0430\\u043c","oz":"Vyetnam"}	Viet Nam	VN	VNM	704	84	00-0000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
348	{"en": "Tanzania, United Republic of","ru": "Танзания","oz": "Tanzaniya"}\n	Tanzania 	TZ	TZA	834	255	00-000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
346	{"en": "Taiwan, Province of China","ru": "Тайвань","oz": "Tayvan"}\n	Taiwan 	TW	TWN	158	886	0-0000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
336	{"en":"South Georgia and the South Sandwich Islands","ru":"\\u042e\\u0436\\u043d\\u0430\\u044f \\u0413\\u0435\\u043e\\u0440\\u0433\\u0438\\u044f \\u0438 \\u042e\\u0436\\u043d\\u044b\\u0435 \\u0421\\u0430\\u043d\\u0434\\u0432\\u0438\\u0447\\u0435\\u0432\\u044b \\u041e\\u0441\\u0442\\u0440\\u043e\\u0432\\u0430","oz":"Janubiy Georgiya va Janubiy Sendvich orollari"}	South Georgia and the South Sandwich Islands	GS	SGS	239	500\n	0000\n	active	2026-01-15 12:24:33	2026-01-15 12:24:33
373	{"en":"Western Sahara","ru":"\\u0417\\u0430\\u043f\\u0430\\u0434\\u043d\\u0430\\u044f \\u0421\\u0430\\u0445\\u0430\\u0440\\u0430","oz":"G'arbiy Sahro"}	Western Sahara	EH	ESH	732	212	00-0000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
374	{"en":"Yemen","ru":"\\u0419\\u0435\\u043c\\u0435\\u043d","oz":"Yaman"}	Yemen	YE	YEM	887	967	0-000-000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
375	{"en":"Zambia","ru":"\\u0417\\u0430\\u043c\\u0431\\u0438\\u044f","oz":"Zambiya"}	Zambia	ZM	ZMB	894	260	00-000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
376	{"en":"Zimbabwe","ru":"\\u0417\\u0438\\u043c\\u0431\\u0430\\u0431\\u0432\\u0435","oz":"Zimbabve"}	Zimbabwe	ZW	ZWE	716	263	0-000000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
371	{"en": "Virgin Islands, U.s.","ru": "Виргинские Острова (США)","oz": "Virgin orollari (AQSH)"}\n	Virgin Islands, U.s.	VI	VIR	850	1340	000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
302	{"en": "Palestinian Territory, Occupied","ru": "Палестина","oz": "Falastin"}\n	Palestinian Territory, Occupied	PS	PSE	275	970	00-000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
279	{"en": "Moldova, Republic of","ru":"Молдова","oz":"Moldova"}	Moldova 	MD	MDA	498	373	00-000-000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
252	{"en": "Republic of","ru": "Республика Корея","oz": "Janubiy Koreya"}\n	Korea 	KR	KOR	410	82	00-0000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
190	{"en": "the Democratic Republic of the","ru": "Демократическая Республика Конго","oz": "Kongo Demokratik Respublikasi"}\n	Congo	CD	COD	180	242	00-000-0000	active	2026-01-15 12:24:33	2026-01-15 12:24:33
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: vatandoshlar_usr
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: form_images; Type: TABLE DATA; Schema: public; Owner: vatandoshlar_usr
--

COPY public.form_images (id, support_id, type, size, image, created_at, updated_at) FROM stdin;
1	108	participation	2413	supports/e8b576c4-62f8-4282-bb31-61decd15e290.png	2026-01-12 12:29:43	2026-01-12 12:29:43
2	108	participation	1642	supports/1d6b0aee-447b-4b36-bdb5-3899994849dc.png	2026-01-12 12:29:43	2026-01-12 12:29:43
3	109	participation	2413	supports/f417b5cd-c8e2-43a3-b8d8-2d320148a1d0.png	2026-01-12 12:30:04	2026-01-12 12:30:04
4	109	participation	1642	supports/676f55d7-0357-4bcf-8275-0508bb1d5b5d.png	2026-01-12 12:30:04	2026-01-12 12:30:04
5	111	participation	1252	supports/a9664b71-7afd-4651-a47b-f3cdc4799e2b.png	2026-01-12 13:06:21	2026-01-12 13:06:21
6	111	participation	1194	supports/38b73994-a18c-40bb-8794-bf1561bbf261.png	2026-01-12 13:06:21	2026-01-12 13:06:21
7	13	participation	751123	supports/d048ec04-749d-4941-aa0a-023e759dc72f.png	2026-01-19 12:00:13	2026-01-19 12:00:13
8	158	participation	95384	supports/c79358a4-7e20-4cbf-9194-48ad49fe0526.pdf	2026-01-28 10:30:51	2026-01-28 10:30:51
9	159	participation	152907	supports/56f1135f-ed61-48f6-bbf0-9304202e8c92.jpg	2026-01-28 10:38:36	2026-01-28 10:38:36
10	160	participation	95384	supports/6f67ef40-7d33-445d-b6d7-93587587b941.pdf	2026-01-28 11:50:07	2026-01-28 11:50:07
11	161	participation	95384	supports/bab4dabf-cd7b-4aa3-ac8f-34eacb50a28c.pdf	2026-01-28 11:54:23	2026-01-28 11:54:23
12	162	participation	95384	supports/fd809824-2965-41a9-bb7f-99ecaed5d165.pdf	2026-01-28 11:56:26	2026-01-28 11:56:26
\.


--
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: vatandoshlar_usr
--

COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: vatandoshlar_usr
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.


--
-- Data for Name: lang_images; Type: TABLE DATA; Schema: public; Owner: vatandoshlar_usr
--

COPY public.lang_images (id, image, compressed, type, size, main, status, created_at, updated_at, lang_id, sort_order) FROM stdin;
8	langs/a0db849a-19a4-4ca7-9e07-f2f5ec1085d4487.png	\N	image/png	9976	t	t	2026-01-17 10:47:09	2026-01-17 10:47:22	2	\N
9	langs/a0db84b5-a253-441e-a7ec-2e0f238547f1375.png	\N	image/png	1743	t	t	2026-01-17 10:47:27	2026-01-17 10:47:32	3	\N
10	langs/a0db84c5-509b-41cf-be5e-f9c8a8e221f2138.png	\N	image/png	18142	t	t	2026-01-17 10:47:38	2026-01-17 10:47:42	1	\N
11	langs/a0f3cbec-554e-47d9-adec-5baaa2c2e23b430.png	\N	image/png	22646	t	t	2026-01-29 12:26:27	2026-01-29 12:26:27	4	\N
\.


--
-- Data for Name: langs; Type: TABLE DATA; Schema: public; Owner: vatandoshlar_usr
--

COPY public.langs (id, code, name, is_default, status, locale, flag_icon, sort_order, created_at, updated_at, short_name) FROM stdin;
1	en	English	t	t	en_US	flags/en.svg	3	2025-12-23 04:21:31	2026-01-22 07:58:50	Eng
2	uz	O'zbek	t	t	uz_UZ	flags/uz.svg	1	2025-12-23 04:21:31	2026-02-02 09:57:43	O'zb
3	ru	Русский	t	t	ru_RU	flags/ru.svg	2	2025-12-23 04:21:31	2026-02-02 09:58:02	Рус
4	tr	Turkcha	f	f	\N	\N	0	2026-01-29 12:26:27	2026-02-06 12:32:14	\N
\.


--
-- Data for Name: menu_main_images; Type: TABLE DATA; Schema: public; Owner: vatandoshlar_usr
--

COPY public.menu_main_images (id, menu_main_id, image, compressed, type, size, main, status, created_at, updated_at, sort_order, poster) FROM stdin;
1	49	menu_images/1768286270_Group 35.png	\N	image/png	1252	f	t	2026-01-13 06:37:50	2026-01-13 06:37:50	\N	\N
13	6	uzbekistan/a101c961-811e-4c61-b05b-1ae3fc75d20b145.png	\N	image/png	1822702	f	t	2026-02-05 11:20:56	2026-02-05 11:27:56	\N	\N
3	5	menu_main/a101c149-18a3-4791-8e8f-41f2174d6009432.jpg	\N	image/jpeg	137083	t	t	2026-02-05 10:58:18	2026-02-05 10:59:04	\N	\N
14	7	traditions/a114511d-d346-4c52-8f9b-32add3d5e753344.jpg	\N	image/jpeg	535799	t	t	2026-02-14 16:25:23	2026-02-14 16:26:05	\N	\N
5	6	uzbekistan/a101c311-4564-4c29-b241-edbc44426bae475.jpg	\N	image/jpeg	916659	f	t	2026-02-05 11:03:17	2026-02-05 11:06:24	\N	\N
15	9	pastandpresent/a1145196-65e8-46d7-a345-ee2e4afb9df4492.jpg	\N	image/jpeg	1048715	t	t	2026-02-14 16:26:42	2026-02-14 16:27:04	\N	\N
6	6	uzbekistan/a101c42d-a151-40d5-b485-a236f95eaec2155.jpg	\N	image/jpeg	674635	f	t	2026-02-05 11:06:23	2026-02-05 11:07:37	\N	\N
7	6	uzbekistan/a101c49c-8e18-4ed8-b596-604d62d193ae336.jpg	\N	image/jpeg	213581	f	t	2026-02-05 11:07:36	2026-02-05 11:09:32	\N	\N
8	6	uzbekistan/a101c54b-6e58-4c4b-a8bb-1569d1b01992298.jpg	\N	image/jpeg	288660	f	t	2026-02-05 11:09:30	2026-02-05 11:11:05	\N	\N
9	6	uzbekistan/a101c5db-0c2f-4ddf-8657-bfb941a64039389.jpg	\N	image/jpeg	283944	f	t	2026-02-05 11:11:05	2026-02-05 11:13:32	\N	\N
10	6	uzbekistan/a101c6ba-52c8-4ffe-9f5e-90bdb8a4deaf210.jpg	\N	image/jpeg	429491	f	t	2026-02-05 11:13:31	2026-02-05 11:16:08	\N	\N
11	6	uzbekistan/a101c7a9-ceda-4aa8-a651-5f9e3e4d6ab5485.jpg	\N	image/jpeg	113103	f	t	2026-02-05 11:16:08	2026-02-05 11:16:37	\N	\N
\.


--
-- Data for Name: menu_main_settings; Type: TABLE DATA; Schema: public; Owner: vatandoshlar_usr
--

COPY public.menu_main_settings (id, key, label, type, required, is_translatable, options, sort_order, relation, status, created_at, updated_at) FROM stdin;
1	title	Title	text	t	t	\N	1	\N	t	\N	\N
2	description	Description	text	t	t	\N	1	\N	t	\N	\N
3	info	Info	textarea-editor	t	t	\N	1	\N	t	2025-12-30 06:09:52	2025-12-30 06:09:52
\.


--
-- Data for Name: menu_main_translations; Type: TABLE DATA; Schema: public; Owner: vatandoshlar_usr
--

COPY public.menu_main_translations (id, menu_main_id, locale, data, created_at, updated_at) FROM stdin;
5	3	uz	{"title": "Statistika", "description": null}	2025-12-23 04:25:08	2025-12-23 04:25:08
6	3	ru	{"title": null, "description": null}	2025-12-23 04:25:08	2025-12-23 04:25:08
43	22	uz	{"title": "Sarlavha", "description": null}	2025-12-23 05:38:42	2025-12-23 05:38:42
44	22	ru	{"title": null, "description": null}	2025-12-23 05:38:42	2025-12-23 05:38:42
62	30	uz	{"title": "Url", "description": null}	2025-12-25 13:30:47	2025-12-25 13:30:47
63	30	ru	{"title": null, "description": null}	2025-12-25 13:30:47	2025-12-25 13:30:47
64	30	en	{"title": null, "description": null}	2025-12-25 13:30:47	2025-12-25 13:30:47
45	23	uz	{"title": "davlatlar", "description": null}	2025-12-23 05:39:07	2025-12-23 05:46:49
46	23	ru	{"title": null, "description": null}	2025-12-23 05:39:07	2025-12-23 05:46:49
65	31	uz	{"title": "Form", "description": null}	2025-12-25 13:31:05	2025-12-26 11:05:40
66	31	ru	{"title": null, "description": null}	2025-12-25 13:31:05	2025-12-26 11:05:40
67	31	en	{"title": null, "description": null}	2025-12-25 13:31:05	2025-12-26 11:05:40
69	32	uz	{"title": "Forms", "description": null}	2025-12-26 13:13:22	2025-12-26 13:13:22
70	32	ru	{"title": null, "description": null}	2025-12-26 13:13:22	2025-12-26 13:13:22
71	32	en	{"title": null, "description": null}	2025-12-26 13:13:22	2025-12-26 13:13:22
28	14	ru	{"info": null, "title": "Лидерство", "description": null}	2025-12-23 05:13:48	2026-01-22 06:28:16
106	44	uz	{"info": null, "title": "Bog'lanish", "description": null}	2025-12-30 23:27:51	2026-01-23 13:32:20
53	27	uz	{"info": null, "title": "Mediateka", "description": null}	2025-12-23 06:19:02	2026-02-15 15:57:33
13	7	uz	{"info": null, "title": "Qadriyatlar", "description": null}	2025-12-23 04:52:36	2026-02-14 16:26:05
20	10	ru	{"info": null, "title": "Места расположения", "description": null}	2025-12-23 04:56:55	2026-02-14 20:01:11
2	1	ru	{"info": null, "title": null, "description": null}	2025-12-23 04:24:05	2026-01-21 11:56:39
99	1	en	{"info": null, "title": null, "description": null}	2025-12-30 06:13:41	2026-01-21 11:56:39
107	44	ru	{"info": null, "title": "Связь", "description": null}	2025-12-30 23:27:51	2026-01-23 13:32:20
108	44	en	{"info": null, "title": "Contact", "description": null}	2025-12-30 23:27:51	2026-01-23 13:32:20
10	5	ru	{"info": null, "title": "Узбекистан", "description": null}	2025-12-23 04:51:35	2026-02-05 10:59:04
47	24	uz	{"info": null, "title": "Biz haqimizda", "description": null}	2025-12-23 05:42:34	2026-01-22 06:24:46
14	7	ru	{"info": null, "title": "Ценности", "description": null}	2025-12-23 04:52:36	2026-02-14 16:26:05
12	6	ru	{"info": null, "title": "Главная страница", "description": null}	2025-12-23 04:52:03	2026-02-14 16:28:00
68	8	en	{"info": null, "title": "3D Travel", "description": null}	2025-12-26 05:32:09	2026-01-21 19:48:35
72	33	uz	{"info": null, "title": "Locations", "description": null}	2025-12-26 13:17:17	2026-01-22 06:27:32
25	13	uz	{"info": null, "title": "Biz haqimizda", "description": null}	2025-12-23 05:13:24	2026-01-21 19:50:28
26	13	ru	{"info": null, "title": "О  нас", "description": null}	2025-12-23 05:13:24	2026-01-21 19:50:28
48	24	ru	{"info": null, "title": "О  нас", "description": null}	2025-12-23 05:42:34	2026-01-22 06:24:46
18	9	ru	{"info": null, "title": "Прошлое и настоящее", "description": null}	2025-12-23 04:55:51	2026-02-14 16:27:04
78	35	uz	{"info": null, "title": "Hero(Главный)", "description": null}	2025-12-27 18:31:23	2026-01-23 06:32:03
79	35	ru	{"info": null, "title": null, "description": null}	2025-12-27 18:31:23	2026-01-23 06:32:03
31	16	uz	{"info": null, "title": "FAQ", "description": null}	2025-12-23 05:14:52	2026-01-21 19:54:08
32	16	ru	{"info": null, "title": "FAQ", "description": null}	2025-12-23 05:14:52	2026-01-21 19:54:08
40	20	ru	{"info": null, "title": "Ассоциации", "description": null}	2025-12-23 05:36:31	2026-01-29 13:49:24
19	10	uz	{"info": null, "title": "Manzilgohlar", "description": null}	2025-12-23 04:56:55	2026-02-14 20:01:11
41	21	uz	{"info": null, "title": "Jamoat birlashmalari", "description": null}	2025-12-23 05:36:49	2026-01-21 19:55:14
42	21	ru	{"info": null, "title": "Общественные объединения", "description": null}	2025-12-23 05:36:49	2026-01-21 19:55:14
84	37	uz	{"info": null, "title": "Loyihalar", "description": null}	2025-12-29 11:46:30	2026-01-21 19:55:48
85	37	ru	{"info": null, "title": "Проекты", "description": null}	2025-12-29 11:46:30	2026-01-21 19:55:48
86	37	en	{"info": null, "title": "Projects", "description": null}	2025-12-29 11:46:30	2026-01-21 19:55:48
87	38	uz	{"info": null, "title": "Barcha Loyihalar", "description": null}	2025-12-29 11:47:01	2026-01-21 19:56:17
89	38	en	{"info": null, "title": "All Projects", "description": null}	2025-12-29 11:47:01	2026-01-21 19:56:17
49	25	uz	{"info": null, "title": "Axborot xizmatlari", "description": null}	2025-12-23 06:18:25	2026-01-21 19:56:44
50	25	ru	{"info": null, "title": "Информационные услуги", "description": null}	2025-12-23 06:18:25	2026-01-21 19:56:44
51	26	uz	{"info": null, "title": "Yangiliklar", "description": null}	2025-12-23 06:18:44	2026-01-21 19:57:16
52	26	ru	{"info": null, "title": "Новости", "description": null}	2025-12-23 06:18:44	2026-01-21 19:57:16
54	27	ru	{"info": null, "title": "Mediateka", "description": null}	2025-12-23 06:19:02	2026-02-15 15:57:33
73	33	ru	{"info": null, "title": null, "description": null}	2025-12-26 13:17:17	2026-01-22 06:27:32
74	33	en	{"info": null, "title": null, "description": null}	2025-12-26 13:17:17	2026-01-22 06:27:32
55	5	en	{"info": null, "title": "Uzbekistan", "description": null}	2025-12-25 12:13:52	2026-02-05 10:59:04
80	35	en	{"info": null, "title": null, "description": null}	2025-12-27 18:31:23	2026-01-23 06:32:03
3	2	uz	{"info": null, "title": "Vatandoshlar Jamoat Fondi", "description": null}	2025-12-23 04:24:42	2026-01-23 06:35:09
4	2	ru	{"info": null, "title": null, "description": null}	2025-12-23 04:24:42	2026-01-23 06:35:09
7	4	uz	{"info": null, "title": "Prezident", "description": null}	2025-12-23 04:25:44	2026-01-23 06:35:57
8	4	ru	{"info": null, "title": null, "description": null}	2025-12-23 04:25:44	2026-01-23 06:35:57
39	20	uz	{"info": null, "title": "Birlashmalar", "description": null}	2025-12-23 05:36:31	2026-01-29 13:49:24
130	9	en	{"info": null, "title": "Past and present", "description": null}	2026-01-14 10:35:37	2026-02-14 16:27:04
15	8	uz	{"info": null, "title": "3D  Sayohat", "description": null}	2025-12-23 04:53:12	2026-01-21 19:48:35
115	47	uz	{"info": null, "title": "Ilovalar", "description": null}	2026-01-06 10:33:30	2026-01-19 12:57:37
116	47	ru	{"info": null, "title": null, "description": null}	2026-01-06 10:33:30	2026-01-19 12:57:37
117	47	en	{"info": null, "title": null, "description": null}	2026-01-06 10:33:30	2026-01-19 12:57:37
16	8	ru	{"info": null, "title": "3D Путешествия", "description": null}	2025-12-23 04:53:12	2026-01-21 19:48:35
136	50	uz	{"info": null, "title": "Kitoblar", "description": null}	2026-01-19 16:37:07	2026-01-23 07:16:13
150	53	uz	{"info": null, "title": "Vatandoshlar safida bo‘ling", "description": null}	2026-01-22 10:19:03	2026-01-23 13:24:56
111	45	en	{"info": null, "title": "Our volunteers", "description": null}	2026-01-05 04:54:22	2026-02-02 10:33:59
109	45	uz	{"info": null, "title": "Volontorlarimiz", "description": null}	2026-01-05 04:54:22	2026-02-02 10:33:59
112	46	uz	{"info": null, "title": "Gazetalar", "description": null}	2026-01-05 04:54:46	2026-01-21 19:58:52
1	1	uz	{"info": "<p>hjjkhjkhkjhkjhjkl</p><p><br></p><p><iframe width=\\"560\\" height=\\"315\\" src=\\"https://www.youtube.com/embed/FzvmmnAyKH4?si=zdJtHSL8TNpSXyhn\\" title=\\"YouTube video player\\" frameborder=\\"0\\" allow=\\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\\" referrerpolicy=\\"strict-origin-when-cross-origin\\" allowfullscreen=\\"\\"></iframe></p>", "title": "Asosiy sahifa", "description": null}	2025-12-23 04:24:05	2026-01-21 11:56:39
142	52	uz	{"info": null, "title": "Podcastlar", "description": null}	2026-01-21 18:32:15	2026-01-21 18:32:15
143	52	ru	{"info": null, "title": null, "description": null}	2026-01-21 18:32:15	2026-01-21 18:32:15
144	52	en	{"info": null, "title": null, "description": null}	2026-01-21 18:32:15	2026-01-21 18:32:15
145	13	en	{"info": null, "title": "About us", "description": null}	2026-01-21 19:50:28	2026-01-21 19:50:28
110	45	ru	{"info": null, "title": "Наши волонтеры", "description": null}	2026-01-05 04:54:22	2026-02-02 10:33:59
11	6	uz	{"info": null, "title": "Bosh sahifa", "description": null}	2025-12-23 04:52:03	2026-02-14 16:28:00
17	9	uz	{"info": null, "title": "Moziy va bugun", "description": null}	2025-12-23 04:55:51	2026-02-14 16:27:04
153	2	en	{"info": null, "title": null, "description": null}	2026-01-23 06:35:09	2026-01-23 06:35:09
154	4	en	{"info": null, "title": null, "description": null}	2026-01-23 06:35:57	2026-01-23 06:35:57
146	16	en	{"info": null, "title": "FAQ", "description": null}	2026-01-21 19:54:08	2026-01-21 19:54:08
135	21	en	{"info": null, "title": "Public associations", "description": null}	2026-01-14 10:38:39	2026-01-21 19:55:14
88	38	ru	{"info": null, "title": "Все проекты", "description": null}	2025-12-29 11:47:01	2026-01-21 19:56:17
148	25	en	{"info": null, "title": "Information services", "description": null}	2026-01-21 19:56:44	2026-01-21 19:56:44
127	26	en	{"info": null, "title": "News", "description": null}	2026-01-14 08:28:20	2026-01-21 19:57:16
113	46	ru	{"info": null, "title": "Газеты", "description": null}	2026-01-05 04:54:46	2026-01-21 19:58:52
114	46	en	{"info": null, "title": "Newspapers", "description": null}	2026-01-05 04:54:46	2026-01-21 19:58:52
122	49	ru	{"info": null, "title": "Применять", "description": null}	2026-01-12 12:37:19	2026-01-23 13:32:33
123	49	en	{"info": null, "title": "Apply", "description": null}	2026-01-12 12:37:19	2026-01-23 13:32:33
129	7	en	{"info": null, "title": "Values", "description": null}	2026-01-14 10:33:53	2026-02-14 16:26:05
132	24	en	{"info": null, "title": "About us", "description": null}	2026-01-14 10:36:35	2026-01-22 06:24:46
140	51	ru	{"info": null, "title": null, "description": null}	2026-01-21 11:49:19	2026-01-23 07:15:31
149	27	en	{"info": null, "title": "Mediateka", "description": null}	2026-01-21 19:57:31	2026-02-15 15:57:33
27	14	uz	{"info": null, "title": "Rahbariyat", "description": null}	2025-12-23 05:13:48	2026-01-22 06:28:16
133	14	en	{"info": null, "title": "Leadership", "description": null}	2026-01-14 10:37:04	2026-01-22 06:28:16
29	15	uz	{"info": null, "title": "Fondning asosiy yo’nalishlari", "description": null}	2025-12-23 05:14:18	2026-01-22 06:28:39
30	15	ru	{"info": null, "title": "Основные направления деятельности фонда", "description": null}	2025-12-23 05:14:18	2026-01-22 06:28:39
134	15	en	{"info": null, "title": "Main directions of the fund", "description": null}	2026-01-14 10:37:53	2026-01-22 06:28:39
137	50	ru	{"info": null, "title": null, "description": null}	2026-01-19 16:37:07	2026-01-23 07:16:13
156	54	ru	{"info": null, "title": null, "description": null}	2026-01-23 07:14:57	2026-01-23 07:16:37
151	53	ru	{"info": null, "title": null, "description": null}	2026-01-22 10:19:03	2026-01-23 13:24:56
139	51	uz	{"info": null, "title": "Mutolaa", "description": null}	2026-01-21 11:49:19	2026-01-23 07:15:31
141	51	en	{"info": null, "title": null, "description": null}	2026-01-21 11:49:19	2026-01-23 07:15:31
138	50	en	{"info": null, "title": null, "description": null}	2026-01-19 16:37:07	2026-01-23 07:16:13
155	54	uz	{"info": null, "title": "Mutolaa", "description": null}	2026-01-23 07:14:57	2026-01-23 07:16:37
157	54	en	{"info": null, "title": null, "description": null}	2026-01-23 07:14:57	2026-01-23 07:16:37
152	53	en	{"info": null, "title": null, "description": null}	2026-01-22 10:19:03	2026-01-23 13:24:56
121	49	uz	{"info": "<p><br></p>", "title": "Murojat qilish", "description": null}	2026-01-12 12:37:19	2026-01-23 13:32:33
147	20	en	{"info": null, "title": "Associations", "description": null}	2026-01-21 19:54:38	2026-01-29 13:49:24
9	5	uz	{"info": null, "title": "O'zbekiston", "description": null}	2025-12-23 04:51:35	2026-02-05 10:59:04
128	6	en	{"info": null, "title": "Main Page", "description": null}	2026-01-14 10:33:16	2026-02-14 16:28:00
131	10	en	{"info": null, "title": "Locations", "description": null}	2026-01-14 10:36:09	2026-02-14 20:01:11
161	56	uz	{"info": null, "title": "Elektron kutubxona", "description": "Elektron kutubxona"}	2026-02-03 20:11:15	2026-02-15 16:02:37
163	56	en	{"info": null, "title": "Digital Library", "description": "Digital Library"}	2026-02-03 20:11:15	2026-02-15 16:02:37
158	55	uz	{"info": null, "title": "Elektron jurnal", "description": null}	2026-02-03 20:10:48	2026-02-15 16:03:33
159	55	ru	{"info": null, "title": "Электронный журнал", "description": "Электронный журнал"}	2026-02-03 20:10:48	2026-02-15 16:03:33
179	62	uz	{"info": "<br>", "title": "O'zbekiston Respublikasining davlat madhiyasi", "description": null}	2026-02-20 07:47:29	2026-02-20 08:57:30
180	62	ru	{"info": null, "title": null, "description": null}	2026-02-20 07:47:29	2026-02-20 08:57:30
181	62	en	{"info": null, "title": null, "description": null}	2026-02-20 07:47:29	2026-02-20 08:57:30
167	58	uz	{"info": "<br>", "title": "Fond tuzilmasi", "description": null}	2026-02-13 05:53:36	2026-02-15 15:58:14
168	58	ru	{"info": null, "title": null, "description": null}	2026-02-13 05:53:36	2026-02-15 15:58:14
169	58	en	{"info": null, "title": null, "description": null}	2026-02-13 05:53:36	2026-02-15 15:58:14
164	57	uz	{"info": null, "title": "Darsliklar", "description": "Darsliklar"}	2026-02-03 20:16:53	2026-02-15 16:01:14
165	57	ru	{"info": null, "title": "Учебники", "description": "Учебники"}	2026-02-03 20:16:53	2026-02-15 16:01:14
166	57	en	{"info": null, "title": "Lesson", "description": "Lessons"}	2026-02-03 20:16:53	2026-02-15 16:01:14
162	56	ru	{"info": null, "title": "Электронная библиотека", "description": "Электронная библиотека"}	2026-02-03 20:11:15	2026-02-15 16:02:37
160	55	en	{"info": null, "title": "Electronic Journal", "description": "Electronic Journal"}	2026-02-03 20:10:48	2026-02-15 16:03:33
170	59	uz	{"info": null, "title": "Hamkorlar", "description": null}	2026-02-18 06:47:23	2026-02-18 06:47:23
171	59	ru	{"info": null, "title": null, "description": null}	2026-02-18 06:47:23	2026-02-18 06:47:23
172	59	en	{"info": null, "title": null, "description": null}	2026-02-18 06:47:23	2026-02-18 06:47:23
182	63	uz	{"info": null, "title": "test", "description": null}	2026-02-25 04:52:07	2026-02-25 04:52:07
183	63	ru	{"info": null, "title": null, "description": null}	2026-02-25 04:52:07	2026-02-25 04:52:07
173	60	uz	{"info": "<br>", "title": "O'zbekiston Respublikasi Davlat bayrog'i", "description": null}	2026-02-20 07:38:29	2026-02-20 08:36:45
174	60	ru	{"info": null, "title": null, "description": null}	2026-02-20 07:38:29	2026-02-20 08:36:45
175	60	en	{"info": null, "title": null, "description": null}	2026-02-20 07:38:29	2026-02-20 08:36:45
176	61	uz	{"info": "<br>", "title": "O‘zbekiston Respublikasi Davlat gerbi", "description": null}	2026-02-20 07:45:37	2026-02-20 08:43:33
177	61	ru	{"info": null, "title": null, "description": null}	2026-02-20 07:45:37	2026-02-20 08:43:33
178	61	en	{"info": null, "title": null, "description": null}	2026-02-20 07:45:37	2026-02-20 08:43:33
184	63	en	{"info": null, "title": null, "description": null}	2026-02-25 04:52:07	2026-02-25 04:52:07
185	64	uz	{"info": null, "title": "Form", "description": null}	2026-02-25 05:36:47	2026-02-25 05:36:47
186	64	ru	{"info": null, "title": null, "description": null}	2026-02-25 05:36:47	2026-02-25 05:36:47
187	64	en	{"info": null, "title": null, "description": null}	2026-02-25 05:36:47	2026-02-25 05:36:47
\.


--
-- Data for Name: menu_mains; Type: TABLE DATA; Schema: public; Owner: vatandoshlar_usr
--

COPY public.menu_mains (id, type, slug, url, test, show_admin, sort_order, icon, status, parent_id, created_at, updated_at) FROM stdin;
50	section	asosiy-rasmlar	\N	f	t	7	\N	t	54	2026-01-19 16:37:07	2026-02-02 10:43:32
6	page	uzbekistan	\N	f	t	1	\N	t	5	2025-12-23 04:52:02	2026-01-22 06:23:53
22	section	sarlavha	\N	f	t	22	\N	t	21	2025-12-23 05:38:42	2025-12-23 05:38:42
23	section	tanlov	\N	f	t	23	\N	t	21	2025-12-23 05:39:07	2025-12-23 05:39:07
32	section	forms	\N	f	t	32	\N	t	10	2025-12-26 13:13:22	2025-12-26 13:13:22
30	section	url	\N	f	t	30	\N	t	6	2025-12-25 13:30:47	2025-12-25 13:30:47
31	section	sarlavhass	\N	f	t	31	\N	t	6	2025-12-25 13:31:05	2025-12-25 13:34:53
9	page	pastandpresent	\N	f	t	4	\N	t	5	2025-12-23 04:55:51	2026-01-22 06:25:40
33	section	locations1	\N	f	t	33	\N	t	10	2025-12-26 13:17:17	2026-01-22 06:27:32
10	page	locations	\N	f	t	5	\N	t	5	2025-12-23 04:56:55	2026-01-22 06:27:45
35	section	video	\N	f	t	1	\N	t	1	2025-12-27 18:31:23	2026-02-20 08:36:13
26	page	news	\N	f	t	26	\N	t	25	2025-12-23 06:18:44	2026-01-14 10:25:12
38	page	projects	\N	f	t	38	\N	t	37	2025-12-29 11:47:01	2026-01-14 10:38:59
60	page	flag	\N	f	t	13	\N	t	1	2026-02-20 07:38:29	2026-02-23 09:30:32
55	url	\N	https://jurnal.vatandoshlar.uz/	f	t	55	\N	t	25	2026-02-03 20:10:48	2026-02-03 20:10:48
53	section	ariza-yuborish	\N	f	t	7	\N	t	1	2026-01-22 10:19:03	2026-02-23 09:32:43
46	page	newspaper	\N	f	t	46	\N	t	25	2026-01-05 04:54:46	2026-02-23 09:37:16
2	section	vatandoshlar	\N	f	t	2	\N	t	1	2025-12-23 04:24:41	2026-02-20 08:36:13
3	section	statistika	\N	f	t	3	\N	t	1	2025-12-23 04:25:08	2026-02-20 08:36:13
4	section	jamoat-fondi	\N	f	t	4	\N	t	1	2025-12-23 04:25:44	2026-02-20 08:36:13
47	section	cc	\N	f	t	5	\N	t	1	2026-01-06 10:33:30	2026-02-20 08:36:13
52	section	podcastlar	\N	f	t	6	\N	t	1	2026-01-21 18:32:15	2026-02-20 08:36:13
45	page	volunteers	\N	f	t	8	\N	t	1	2026-01-05 04:54:22	2026-02-20 08:36:13
54	category	mutolaa	\N	f	t	9	\N	t	1	2026-01-23 07:14:57	2026-02-20 08:36:13
44	section	contacts	\N	f	t	10	\N	t	1	2025-12-30 23:27:51	2026-02-20 08:36:13
56	url	\N	https://mutolaa.com/uz	f	t	56	\N	t	25	2026-02-03 20:11:15	2026-02-03 20:11:15
49	page	application	\N	f	f	11	\N	t	1	2026-01-12 12:37:19	2026-02-20 08:36:13
61	page	emblem	\N	f	t	14	\N	t	1	2026-02-20 07:45:37	2026-02-20 08:36:13
62	page	hymn	\N	f	t	15	\N	t	1	2026-02-20 07:47:29	2026-02-20 08:36:13
59	page	partners	\N	f	t	12	\N	t	1	2026-02-18 06:47:23	2026-02-24 10:46:21
63	page	test	\N	f	t	63	\N	f	\N	2026-02-25 04:52:07	2026-02-25 05:10:29
57	url	darsliklar	https://dars.vatandoshlar.uz	f	t	57	\N	t	25	2026-02-03 20:16:53	2026-02-03 20:17:03
64	section	\N	\N	f	t	64	\N	t	37	2026-02-25 05:36:47	2026-02-25 05:36:47
21	page	associations	\N	f	t	1	\N	t	20	2025-12-23 05:36:49	2026-02-06 07:42:02
51	section	mutoola	\N	f	t	8	\N	t	54	2026-01-21 11:49:19	2026-01-23 07:15:31
7	page	traditions	\N	f	t	2	\N	t	5	2025-12-23 04:52:36	2026-01-21 19:46:25
8	url	3d-sayohat	https://uzbekistan360.uz/ru	f	f	3	\N	t	5	2025-12-23 04:53:12	2026-01-21 19:46:25
24	page	about	\N	f	t	1	\N	t	13	2025-12-23 05:42:34	2026-02-13 06:03:48
14	page	leadership	\N	f	t	2	\N	t	13	2025-12-23 05:13:48	2026-02-13 06:03:48
15	page	directions	\N	f	t	3	\N	t	13	2025-12-23 05:14:17	2026-02-13 06:03:48
16	page	faq	\N	f	t	5	\N	t	13	2025-12-23 05:14:52	2026-02-13 06:03:48
1	category	asosiy_sahifa	\N	f	t	1	\N	f	\N	2025-12-23 04:24:05	2026-02-20 08:31:22
5	category	ozbekiston	\N	f	t	2	\N	t	\N	2025-12-23 04:51:35	2026-02-20 08:31:22
13	category	biz-haqimizda	\N	f	t	3	\N	t	\N	2025-12-23 05:13:24	2026-02-20 08:31:22
58	page	structure	\N	f	t	4	\N	f	\N	2026-02-13 05:53:36	2026-02-20 08:31:22
20	category	birlashmalar	\N	f	t	5	\N	t	\N	2025-12-23 05:36:31	2026-02-20 08:31:22
37	category	loyihalar	\N	f	t	6	\N	t	\N	2025-12-29 11:46:30	2026-02-20 08:31:22
25	category	axborot-xizmatlari	\N	f	t	7	\N	t	\N	2025-12-23 06:18:25	2026-02-20 08:31:22
27	page	mediateka	\N	f	t	8	\N	f	\N	2025-12-23 06:19:02	2026-02-20 08:31:22
\.


--
-- Data for Name: menus; Type: TABLE DATA; Schema: public; Owner: vatandoshlar_usr
--

COPY public.menus (id, title, status, sort_order, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: vatandoshlar_usr
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	0001_01_01_000000_create_users_table	1
2	0001_01_01_000001_create_cache_table	1
3	0001_01_01_000002_create_jobs_table	1
4	2025_12_03_094858_create_menus_table	1
5	2025_12_03_133507_create_roles_table	1
6	2025_12_04_093815_create_permissions_table	1
7	2025_12_04_094905_create_menu_mains_table	1
8	2025_12_04_104850_create_langs_table	1
9	2025_12_05_053253_create_menu_main_settings_table	1
10	2025_12_08_045829_create_menu_main_translations_table	1
11	2025_12_08_050435_create_menu_main_images_table	1
12	2025_12_08_100657_create_page_sections_table	1
13	2025_12_08_100708_create_page_section_settings_table	1
14	2025_12_08_100721_create_page_section_translations_table	1
15	2025_12_09_063323_create_role_menu_permissions_table	1
16	2025_12_09_123317_create_page_section_images_table	1
17	2025_12_16_103643_create_settings_table	1
18	2025_12_16_120031_create_socials_table	1
19	2025_12_16_173056_create_contents_table	1
20	2025_12_16_174028_create_content_translations_table	1
21	2025_12_16_174335_create_content_settings_table	1
22	2025_12_16_175011_create_content_images_table	1
23	2025_12_30_094546_create_supports_table	2
24	2026_01_06_075146_create_view_counts_table	3
25	2026_01_09_093839_create_form_images_table	4
26	2026_01_12_075744_create_order_settings_table	5
\.


--
-- Data for Name: order_settings; Type: TABLE DATA; Schema: public; Owner: vatandoshlar_usr
--

COPY public.order_settings (id, menu_main_id, "order", status, created_at, updated_at) FROM stdin;
2	38	sort_order_asc	t	2026-01-13 12:20:20	2026-01-13 12:22:26
1	26	time_desc	t	2026-01-12 08:02:58	2026-01-29 12:19:33
3	14	sort_order_asc	t	2026-01-23 11:32:47	2026-01-23 11:32:58
\.


--
-- Data for Name: page_section_blocks; Type: TABLE DATA; Schema: public; Owner: vatandoshlar_usr
--

COPY public.page_section_blocks (id, menu_main_id, category_slug, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: page_section_images; Type: TABLE DATA; Schema: public; Owner: vatandoshlar_usr
--

COPY public.page_section_images (id, page_section_id, page_section_parent_id, category, category_slug, image, compressed, type, size, main, status, created_at, updated_at, sort_order, poster) FROM stdin;
1	1	\N	\N	\N	page_section_images/1766464991_logo.png	\N	image/png	98609	t	t	2025-12-23 04:43:12	2025-12-23 04:43:12	\N	\N
2	2	\N	\N	\N	page_section_images/1766465101_stats-img-1.svg	\N	image/svg+xml	1022	t	t	2025-12-23 04:45:01	2025-12-23 04:45:01	\N	\N
3	5	\N	\N	\N	page_section_images/1766466384_b8b65328e2c66f9e5b6a1abea44d4fbda4ff74d9.png	\N	image/png	1255572	t	t	2025-12-23 05:06:24	2025-12-23 05:06:24	\N	\N
4	5	\N	\N	\N	page_section_images/1766466384_71596a3c79e6ea29869f23118068e52cdaa097e0.png	\N	image/png	1051197	f	t	2025-12-23 05:06:24	2025-12-23 05:06:24	\N	\N
5	5	\N	\N	\N	page_section_images/1766466384_9f44c2e308de8a752650fc50f9a730e071877078.png	\N	image/png	1672804	f	t	2025-12-23 05:06:24	2025-12-23 05:06:24	\N	\N
6	6	\N	\N	\N	page_section_images/1766466468_56fe38f6ec843c64677b251a9d627181f820bf50.png	\N	image/png	1739467	t	t	2025-12-23 05:07:49	2025-12-23 05:07:49	\N	\N
7	7	\N	\N	\N	page_section_images/1766466507_about-video.jpg	\N	image/jpeg	469151	t	t	2025-12-23 05:08:27	2025-12-23 05:08:27	\N	\N
605	107	\N	\N	\N	locations1/a1149214-f3f9-4c15-9105-188c332c0377255.jpg	\N	image/jpeg	182599	f	t	2026-02-14 19:27:02	2026-02-14 19:27:02	\N	\N
10	12	\N	\N	\N	page_section_images/1766467747_logo.png	\N	image/png	98609	t	t	2025-12-23 05:29:07	2025-12-23 05:29:07	\N	\N
11	12	\N	\N	\N	page_section_images/1766467747_56fe38f6ec843c64677b251a9d627181f820bf50.png	\N	image/png	1739467	f	t	2025-12-23 05:29:07	2025-12-23 05:29:07	\N	\N
12	13	\N	\N	\N	page_section_images/1766467806_c1a4917b58c218386f15744094c20059373d611d-min.png	\N	image/png	895781	t	t	2025-12-23 05:30:06	2025-12-23 05:30:06	\N	\N
15	16	\N	\N	\N	page_section_images/1766468047_financial-1.svg	\N	image/svg+xml	2954	t	t	2025-12-23 05:34:07	2025-12-23 05:34:07	\N	\N
16	17	\N	\N	\N	page_section_images/1766468067_financial-2.svg	\N	image/svg+xml	2234	t	t	2025-12-23 05:34:27	2025-12-23 05:34:27	\N	\N
615	68	\N	\N	\N	locations1/a11497cc-6c56-4c06-80e4-eedff4e48f9c46.jpg	\N	image/jpeg	104344	f	t	2026-02-14 19:43:01	2026-02-14 19:43:01	\N	\N
787	492	491	Tashkilot haqida	nomi-7	page_section_images/a125aaed-38e7-4e1b-a006-df8598921bbf237.jpg	\N	image/jpeg	10879	t	t	2026-02-23 07:25:35	2026-02-23 07:25:35	\N	\N
616	68	\N	\N	\N	locations1/a11497cc-6e3c-416d-a6bc-f7423eeac44b264.jpg	\N	image/jpeg	95983	f	t	2026-02-14 19:43:01	2026-02-14 19:43:01	\N	\N
295	169	\N	\N	\N	page_section_images/1767601337_volunteer-6.png	\N	image/png	105042	t	t	2026-01-05 08:22:17	2026-01-05 08:22:17	\N	\N
30	34	\N	\N	\N	page_section_images/1766470959_news-img-2.png	\N	image/png	23441	t	t	2025-12-23 06:22:39	2025-12-23 06:22:39	\N	\N
617	68	\N	\N	\N	locations1/a11497cc-6f92-4563-a143-725b390ca48f157.jpg	\N	image/jpeg	726059	f	t	2026-02-14 19:43:01	2026-02-14 19:43:01	\N	\N
35	40	\N	\N	\N	page_section_images/1766655727_financial-3.svg	\N	image/svg+xml	2146	t	t	2025-12-25 09:42:07	2025-12-25 09:42:36	\N	\N
48	37	\N	\N	\N	page_section_images/1766656863_logo.png	\N	image/png	98609	t	t	2025-12-25 10:01:03	2025-12-25 10:01:03	\N	\N
64	51	\N	\N	\N	page_section_images/1766669091_c1a4917b58c218386f15744094c20059373d611d-min.png	\N	image/png	895781	f	t	2025-12-25 13:24:51	2025-12-25 13:24:51	\N	\N
65	51	\N	\N	\N	page_section_images/1766669091_form.jpg	\N	image/jpeg	192942	f	t	2025-12-25 13:24:51	2025-12-25 13:24:51	\N	\N
66	51	\N	\N	\N	page_section_images/1766669091_oila1.jpg	\N	image/jpeg	1739467	f	t	2025-12-25 13:24:51	2025-12-25 13:24:51	\N	\N
74	15	\N	\N	\N	page_section_images/1766726080_7f1beefe896a37c2a8669f8c96ad0b81629aa952.png	\N	image/png	751123	t	t	2025-12-26 05:14:40	2025-12-26 05:14:40	\N	\N
744	426	\N	\N	\N	page_section_images/a11bd232-7938-4bad-a1cd-90cc37519799144.svg	\N	image/svg+xml	265	t	t	2026-02-18 09:57:07	2026-02-18 09:57:07	\N	\N
746	177	\N	\N	\N	statistika/a11be0a2-a44c-4578-9a75-28cb80395b1e208.png	\N	image/png	10537	f	t	2026-02-18 10:37:29	2026-02-18 10:37:29	\N	\N
747	177	\N	\N	\N	statistika/a11be0a2-a641-4eb7-93ce-b281444bc81372.png	\N	image/png	68007	f	t	2026-02-18 10:37:29	2026-02-18 10:37:29	\N	\N
748	177	\N	\N	\N	statistika/a11be0a2-a74a-4c2d-be6e-0f0011b2931f416.png	\N	image/png	470540	f	t	2026-02-18 10:37:29	2026-02-18 10:37:29	\N	\N
752	256	\N	\N	\N	partners/a11c08c4-ec35-4f00-a66e-b34de553a464125.jpg	\N	image/jpeg	9131	t	t	2026-02-18 12:29:42	2026-02-18 12:29:44	\N	\N
754	458	\N	\N	\N	tanlov/a11df452-d152-4ab0-a672-dce588a57fa9498.png	\N	image/png	565477	t	t	2026-02-19 11:24:11	2026-02-19 11:24:14	\N	\N
511	56	\N	\N	\N	about/a110050a-2972-439a-bd71-865f5e00b8cf441.jpg	\N	image/jpeg	5028979	t	t	2026-02-12 13:09:21	2026-02-12 13:09:32	\N	\N
517	220	\N	\N	\N	page_section_images/a1118726-1050-45a8-ad61-de6a9a99759e113.jpg	\N	image/jpeg	156894	f	t	2026-02-13 07:08:59	2026-02-13 07:08:59	\N	\N
518	220	\N	\N	\N	page_section_images/a1118726-1289-4ae9-86de-ec358f7de580357.jpg	\N	image/jpeg	290248	t	t	2026-02-13 07:08:59	2026-02-13 07:08:59	\N	\N
519	220	\N	\N	\N	page_section_images/a1118726-141a-4a46-96e2-01cc6862f577148.jpg	\N	image/jpeg	236736	f	t	2026-02-13 07:08:59	2026-02-13 07:08:59	\N	\N
526	223	\N	\N	\N	page_section_images/a1118920-f8bc-4247-a24b-d6f5c8c5f53d10.jpg	\N	image/jpeg	146851	f	t	2026-02-13 07:14:31	2026-02-13 07:14:31	\N	\N
527	223	\N	\N	\N	page_section_images/a1118920-fa75-421a-84c0-2870fc12124c199.jpg	\N	image/jpeg	95295	f	t	2026-02-13 07:14:31	2026-02-13 07:14:31	\N	\N
528	223	\N	\N	\N	page_section_images/a1118920-fc8a-4df9-a31f-719918c38c78229.jpg	\N	image/jpeg	91478	t	t	2026-02-13 07:14:31	2026-02-13 07:14:31	\N	\N
529	223	\N	\N	\N	page_section_images/a1118920-fd90-4b8c-b6b4-1414bc13824a309.jpg	\N	image/jpeg	58917	f	t	2026-02-13 07:14:31	2026-02-13 07:14:31	\N	\N
539	226	\N	\N	\N	page_section_images/a1118e9d-c153-47aa-9c5c-03d3cdae247e97.jpg	\N	image/jpeg	78091	f	t	2026-02-13 07:29:52	2026-02-13 07:29:52	\N	\N
540	226	\N	\N	\N	page_section_images/a1118e9d-c33b-4b58-9a25-68e8461cbf1b266.jpg	\N	image/jpeg	48751	f	t	2026-02-13 07:29:52	2026-02-13 07:29:52	\N	\N
760	467	\N	\N	\N	tanlov/a11f6b6a-5898-4d53-b5df-f7cf5ec9f8c6192.jpg	\N	image/jpeg	334205	t	t	2026-02-20 04:53:01	2026-02-20 04:53:04	\N	\N
762	190	\N	\N	\N	cc/a11f80dd-5f3d-47b1-b5a9-aca31275bbf054.png	\N	image/png	949049	f	t	2026-02-20 05:53:00	2026-02-20 05:55:31	\N	\N
770	257	\N	\N	\N	partners/a11f99df-51cb-48b2-ad47-996aa605a5b711.png	\N	image/png	12396	t	t	2026-02-20 07:02:56	2026-02-20 07:03:00	\N	\N
772	475	\N	\N	\N	page_section_images/a11fba91-cc67-45f7-a85a-8eb3dcd61f5940.png	\N	image/png	61753	t	t	2026-02-20 08:34:21	2026-02-20 08:34:21	\N	\N
776	476	\N	\N	\N	emblem/a11fc13f-d5b8-47ba-9515-369b2b455a9c232.svg	\N	image/svg+xml	144048	f	t	2026-02-20 08:53:02	2026-02-20 09:11:52	\N	\N
779	480	\N	\N	\N	tanlov/a11ffe27-8c2a-4c62-9eca-17d67dd262a1403.jpg	\N	image/jpeg	8544	t	t	2026-02-20 11:43:20	2026-02-20 11:43:24	\N	\N
781	482	481	Tashkilot haqida	nomi-7	page_section_images/a120164c-3dd2-4f7d-a8d7-84f2f84cfb07207.jpg	\N	image/jpeg	5275	t	t	2026-02-20 12:50:51	2026-02-20 12:50:51	\N	\N
783	481	\N	\N	\N	tanlov/a1201753-99d9-4a9d-9ff2-f798f317f4b5327.jpg	\N	image/jpeg	5275	t	t	2026-02-20 12:53:43	2026-02-20 12:53:46	\N	\N
859	522	156	Yillar	yillar-1	page_section_images/a127c82f-a16a-4f56-86bb-99534671db2e206.jpg	\N	image/jpeg	180647	f	t	2026-02-24 08:39:03	2026-02-24 08:39:03	1	\N
606	69	\N	\N	\N	locations1/a1149338-7311-43dd-bb9c-be22a4c1c262484.jpg	\N	image/jpeg	230503	f	t	2026-02-14 19:30:13	2026-02-14 19:30:13	\N	\N
607	69	\N	\N	\N	locations1/a1149338-755f-4817-903e-015e6764484e422.jpg	\N	image/jpeg	69939	f	t	2026-02-14 19:30:13	2026-02-14 19:30:13	\N	\N
608	69	\N	\N	\N	locations1/a1149338-7641-4323-8d1a-2d6a0e6c16be5.jpg	\N	image/jpeg	209009	f	t	2026-02-14 19:30:13	2026-02-14 19:30:13	\N	\N
609	69	\N	\N	\N	locations1/a1149338-7743-45cd-a9b5-5991f1defd23337.jpg	\N	image/jpeg	51197	f	t	2026-02-14 19:30:13	2026-02-14 19:30:13	\N	\N
610	69	\N	\N	\N	locations1/a1149338-7826-476f-b02a-5b7d4692cdb458.jpg	\N	image/jpeg	3701193	f	t	2026-02-14 19:30:13	2026-02-14 19:30:13	\N	\N
618	68	\N	\N	\N	locations1/a11497cc-70e6-4101-aef9-aa764ec62862411.jpg	\N	image/jpeg	139565	f	t	2026-02-14 19:43:01	2026-02-14 19:43:01	\N	\N
619	68	\N	\N	\N	locations1/a11497cc-71fa-4f0c-a479-f50b22402c9e115.jpg	\N	image/jpeg	242311	f	t	2026-02-14 19:43:01	2026-02-14 19:43:01	\N	\N
620	68	\N	\N	\N	locations1/a11497cc-730e-4a33-9a0a-86426cc60486231.png	\N	image/png	2663082	f	t	2026-02-14 19:43:01	2026-02-14 19:43:01	\N	\N
621	68	\N	\N	\N	locations1/a11497cc-7579-495b-bfd7-aa0c13462f5e109.jpg	\N	image/jpeg	288122	f	t	2026-02-14 19:43:01	2026-02-14 19:43:01	\N	\N
622	68	\N	\N	\N	locations1/a11497cc-7691-434a-9ce8-d663fdb4e4f9415.jpg	\N	image/jpeg	28497880	t	t	2026-02-14 19:43:01	2026-02-14 19:43:37	\N	\N
496	39	\N	\N	\N	about/a10fff33-bf56-4089-8e3a-292e1ad46fd7432.jpg	\N	image/jpeg	130358	f	t	2026-02-12 12:53:01	2026-02-12 12:53:01	\N	\N
279	173	\N	\N	\N	page_section_images/1767597755_form.jpg	\N	image/jpeg	192942	t	t	2026-01-05 07:22:35	2026-01-05 07:22:35	\N	\N
215	139	\N	\N	\N	page_section_images/1767090592_association-3.png	\N	image/png	11024	f	t	2025-12-30 10:29:52	2025-12-30 10:29:52	\N	\N
632	96	\N	\N	\N	locations1/a1149a77-390b-437a-a4e6-1524cfc90ea5309.jpg	\N	image/jpeg	91803	f	t	2026-02-14 19:50:29	2026-02-14 19:50:29	\N	\N
641	94	\N	\N	\N	locations1/a1149c9e-55ec-44d2-8bf0-d6b49e862155359.jpg	\N	image/jpeg	220739	f	t	2026-02-14 19:56:30	2026-02-14 19:56:30	\N	\N
651	91	\N	\N	\N	locations1/a114a034-702f-494a-a2af-ef28c37535b0441.jpg	\N	image/jpeg	137592	f	t	2026-02-14 20:06:32	2026-02-14 20:06:32	\N	\N
653	64	\N	\N	\N	locations1/a114a2f1-a56e-4371-9eb5-b9110cceb1b350.jpg	\N	image/jpeg	404103	f	t	2026-02-14 20:14:11	2026-02-14 20:14:11	\N	\N
654	64	\N	\N	\N	locations1/a114a2f1-a866-451b-be7a-9ee3d7004ae5461.jpg	\N	image/jpeg	168121	f	t	2026-02-14 20:14:11	2026-02-14 20:14:11	\N	\N
655	64	\N	\N	\N	locations1/a114a2f1-a9e0-4c0b-9de8-9296946629d0130.jpg	\N	image/jpeg	56108	f	t	2026-02-14 20:14:11	2026-02-14 20:14:11	\N	\N
657	64	\N	\N	\N	locations1/a114a2f1-ac3f-4ac3-b0d6-e208e59f5a6e358.jpg	\N	image/jpeg	127692	f	t	2026-02-14 20:14:11	2026-02-14 20:14:11	\N	\N
658	64	\N	\N	\N	locations1/a114a2f1-ad6f-4d45-838a-7fabe1f2f83f431.jpg	\N	image/jpeg	93881	f	t	2026-02-14 20:14:11	2026-02-14 20:14:11	\N	\N
659	64	\N	\N	\N	locations1/a114a2f1-aea5-4214-926a-282112d6a7df258.jpg	\N	image/jpeg	125405	f	t	2026-02-14 20:14:11	2026-02-14 20:14:11	\N	\N
672	62	\N	\N	\N	locations1/a114a82d-f5dd-4d65-b9d7-6cd76e7b7629265.jpg	\N	image/jpeg	260041	f	t	2026-02-14 20:28:50	2026-02-14 20:28:50	\N	\N
656	64	\N	\N	\N	locations1/a114a2f1-ab10-471e-b66c-ef7eb5b66f22279.jpg	\N	image/jpeg	104514	t	t	2026-02-14 20:14:11	2026-02-14 20:14:19	\N	\N
662	88	\N	\N	\N	locations1/a114a4ae-0e99-4f97-9c19-3ea9bc616f76174.jpg	\N	image/jpeg	168121	f	t	2026-02-14 20:19:02	2026-02-14 20:19:02	\N	\N
669	83	\N	\N	\N	locations1/a114a616-949e-4ce6-a803-a67d6484d611103.jpg	\N	image/jpeg	142788	f	t	2026-02-14 20:22:59	2026-02-14 20:22:59	\N	\N
673	62	\N	\N	\N	locations1/a114a82d-f81b-435c-bd9c-f574fc076b40456.jpg	\N	image/jpeg	256990	f	t	2026-02-14 20:28:50	2026-02-14 20:28:50	\N	\N
674	62	\N	\N	\N	locations1/a114a82d-f94d-4685-9f88-f4b85ac620ab487.jpeg	\N	image/jpeg	35327	f	t	2026-02-14 20:28:50	2026-02-14 20:28:50	\N	\N
675	62	\N	\N	\N	locations1/a114a82d-fa29-4748-a506-eb27004393e8201.jpg	\N	image/jpeg	188010	f	t	2026-02-14 20:28:50	2026-02-14 20:28:50	\N	\N
676	62	\N	\N	\N	locations1/a114a82d-fb02-4dc6-82f8-71f63ca96bf0368.jpeg	\N	image/jpeg	32432	f	t	2026-02-14 20:28:50	2026-02-14 20:28:50	\N	\N
678	62	\N	\N	\N	locations1/a114a82d-fc6d-4c14-aa43-74eb9491c075118.jpeg	\N	image/jpeg	22778	f	t	2026-02-14 20:28:50	2026-02-14 20:28:50	\N	\N
679	62	\N	\N	\N	locations1/a114a82d-fd2c-4775-ac3e-22175356117d439.jpg	\N	image/jpeg	259850	f	t	2026-02-14 20:28:50	2026-02-14 20:28:50	\N	\N
680	62	\N	\N	\N	locations1/a114a82d-fe33-4ec5-9c07-cbadad8730cc468.jpg	\N	image/jpeg	75384	f	t	2026-02-14 20:28:50	2026-02-14 20:28:50	\N	\N
684	82	\N	\N	\N	locations1/a114a91b-23ba-4741-81b1-2653af593637403.jpg	\N	image/jpeg	256990	f	t	2026-02-14 20:31:25	2026-02-14 20:31:25	\N	\N
681	62	\N	\N	\N	locations1/a114a82d-ff28-4f35-a4c0-c8b232ff0ca3201.jpg	\N	image/jpeg	117382	f	t	2026-02-14 20:28:50	2026-02-14 20:31:41	\N	\N
677	62	\N	\N	\N	locations1/a114a82d-fbb7-4bd1-870b-91527112d901204.jpeg	\N	image/jpeg	28994	t	t	2026-02-14 20:28:50	2026-02-14 20:31:44	\N	\N
695	78	\N	\N	\N	locations1/a114ab3d-3a17-4f71-b7fb-308095d127d8165.jpg	\N	image/jpeg	72157	f	t	2026-02-14 20:37:23	2026-02-14 20:37:23	\N	\N
697	60	\N	\N	\N	locations1/a114acb7-41ff-4ed7-8a06-b485a70c9b6814.jpg	\N	image/jpeg	157643	f	t	2026-02-14 20:41:31	2026-02-14 20:41:37	\N	\N
706	76	\N	\N	\N	locations1/a114af19-7ccd-48cf-99ed-b8f1d4b5623917.jpg	\N	image/jpeg	52585	f	t	2026-02-14 20:48:11	2026-02-14 20:48:11	\N	\N
707	8	\N	\N	\N	traditions/a119c15b-1350-4191-bf7f-2841d5e5242924.mp4	\N	video/mp4	192460252	f	t	2026-02-17 09:18:22	2026-02-17 09:18:22	\N	\N
708	8	\N	\N	\N	traditions/a119c15b-e1c4-417d-8afd-4d1ddbd099ad147.mp4	\N	video/mp4	124871311	f	t	2026-02-17 09:18:23	2026-02-17 09:18:23	\N	\N
709	8	\N	\N	\N	traditions/a119c15c-8dce-4953-8e13-660703654856353.mp4	\N	video/mp4	102561556	f	t	2026-02-17 09:18:23	2026-02-17 09:18:23	\N	\N
710	8	\N	\N	\N	traditions/a119c15d-0374-4296-bc15-134f72d3b26a355.mp4	\N	video/mp4	103123839	f	t	2026-02-17 09:18:23	2026-02-17 09:18:23	\N	\N
711	8	\N	\N	\N	traditions/a119c15d-89d8-4640-936c-338a1bc40b9c66.mp4	\N	video/mp4	174140088	f	t	2026-02-17 09:18:24	2026-02-17 09:18:24	\N	\N
712	8	\N	\N	\N	traditions/a119c15e-6c12-4201-b100-3a08e633012245.mp4	\N	video/mp4	77152087	f	t	2026-02-17 09:18:24	2026-02-17 09:18:24	\N	\N
713	8	\N	\N	\N	traditions/a119c15e-e68c-47d8-9cca-70aad24e6a8c89.mp4	\N	video/mp4	102942681	f	t	2026-02-17 09:18:25	2026-02-17 09:18:25	\N	\N
714	8	\N	\N	\N	traditions/a119c15f-77c8-4e83-ae90-8f4c79335650203.mp4	\N	video/mp4	57135401	f	t	2026-02-17 09:18:25	2026-02-17 09:18:25	\N	\N
717	9	\N	\N	\N	pastandpresent/a119c548-9d88-401c-84a9-c94cdb0b8d09306.mp4	\N	video/mp4	102738146	f	t	2026-02-17 09:29:21	2026-02-17 09:29:21	\N	\N
718	9	\N	\N	\N	pastandpresent/a119c548-f5f4-4050-8c2f-cf6272af0083404.mp4	\N	video/mp4	102516477	f	t	2026-02-17 09:29:21	2026-02-17 09:29:21	\N	\N
719	9	\N	\N	\N	pastandpresent/a119c549-3965-417c-8c0a-b7a5c71c1cf214.mp4	\N	video/mp4	102596046	f	t	2026-02-17 09:29:21	2026-02-17 09:29:21	\N	\N
828	520	\N	\N	\N	projects/a127c0f2-68c3-4529-a465-8b0a359b2923357.jpg	\N	image/jpeg	241578	f	t	2026-02-24 08:18:49	2026-02-24 08:18:49	\N	\N
785	473	\N	\N	\N	tanlov/a1258062-bfd3-4969-8603-b6ea07bd6fe1283.jpg	\N	image/jpeg	1124932	f	t	2026-02-23 05:26:38	2026-02-23 05:52:51	\N	\N
788	490	\N	\N	\N	tanlov/a125acc2-1406-427d-8da3-ef04ec033fa5178.png	\N	image/png	701436	t	t	2026-02-23 07:30:42	2026-02-23 07:31:24	\N	\N
790	493	491	Rahbar	rahbar-5	page_section_images/a125aeb3-2e23-409e-99c2-30cfa1141a00476.jpg	\N	image/jpeg	10627	t	t	2026-02-23 07:36:08	2026-02-23 07:36:08	\N	\N
793	496	494	Rahbar	rahbar-5	page_section_images/a125b3b8-1c6c-41f5-8191-df423596596f320.jpeg	\N	image/jpeg	9592	t	t	2026-02-23 07:50:10	2026-02-23 07:50:10	\N	\N
611	102	\N	\N	\N	locations1/a114935d-923d-467e-822b-5126b89af906420.jpg	\N	image/jpeg	3701193	f	t	2026-02-14 19:30:38	2026-02-14 19:30:38	\N	\N
623	99	\N	\N	\N	locations1/a1149840-d607-4141-93fd-c0ce443b0cc1320.jpg	\N	image/jpeg	95983	f	t	2026-02-14 19:44:18	2026-02-14 19:44:18	\N	\N
633	97	\N	\N	\N	locations1/a1149ac1-8a5c-4af0-b6b8-69c5bd1a923c300.jpg	\N	image/jpeg	176402	f	t	2026-02-14 19:51:17	2026-02-14 19:51:17	\N	\N
642	95	\N	\N	\N	locations1/a1149cf0-a4c9-49af-846d-3c6f22b48909373.jpg	\N	image/jpeg	160457	f	t	2026-02-14 19:57:24	2026-02-14 19:57:24	\N	\N
652	92	\N	\N	\N	locations1/a114a0fc-4600-4da2-bce7-e1247e8ba532153.jpg	\N	image/jpeg	331922	t	t	2026-02-14 20:08:43	2026-02-14 20:09:04	\N	\N
660	86	\N	\N	\N	locations1/a114a3d2-5bb5-4c09-8b87-6044565c7b64487.jpg	\N	image/jpeg	404103	f	t	2026-02-14 20:16:38	2026-02-14 20:16:38	\N	\N
663	63	\N	\N	\N	locations1/a114a5b4-838e-4c23-831d-2928fdde8660416.jpg	\N	image/jpeg	142788	f	t	2026-02-14 20:21:54	2026-02-14 20:21:54	\N	\N
664	63	\N	\N	\N	locations1/a114a5b4-85f2-455a-a390-093890f966e571.jpg	\N	image/jpeg	315707	f	t	2026-02-14 20:21:54	2026-02-14 20:21:54	\N	\N
497	39	\N	\N	\N	about/a10fff33-c231-490d-89d1-9bb7fdf4e1d2256.jpg	\N	image/jpeg	78302	f	t	2026-02-12 12:53:01	2026-02-12 12:53:01	\N	\N
296	170	\N	\N	\N	page_section_images/1767601368_volunteer-7.png	\N	image/png	55422	t	t	2026-01-05 08:22:48	2026-01-05 08:22:48	\N	\N
180	4	\N	\N	\N	page_section_images/1766864471_prezident.png	\N	image/png	58403	t	t	2025-12-27 19:41:11	2025-12-27 19:41:11	\N	\N
498	39	\N	\N	\N	about/a10fff33-c384-416a-83ec-c412afe23ef0443.jpg	\N	image/jpeg	102964	f	t	2026-02-12 12:53:01	2026-02-12 12:53:01	\N	\N
499	39	\N	\N	\N	about/a10fff33-c4ae-45ab-9086-237176410e46248.jpg	\N	image/jpeg	109936	f	t	2026-02-12 12:53:01	2026-02-12 12:53:01	\N	\N
500	39	\N	\N	\N	about/a10fff33-c5ea-433e-8f73-a33464a3b4f7382.jpg	\N	image/jpeg	139376	f	t	2026-02-12 12:53:01	2026-02-12 12:53:01	\N	\N
293	166	\N	\N	\N	page_section_images/1767601269_volunteer-3.png	\N	image/png	56798	t	t	2026-01-05 08:21:09	2026-01-05 08:21:09	\N	\N
501	39	\N	\N	\N	about/a10fff33-c70e-4914-99f5-b94c1f7c9f897.jpg	\N	image/jpeg	69140	f	t	2026-02-12 12:53:01	2026-02-12 12:53:01	\N	\N
196	132	\N	\N	\N	page_section_images/1767011429_0a9de2d13f6d63a28051589157af258de5c64e37.jpg	\N	image/jpeg	478813	t	t	2025-12-29 12:30:29	2025-12-29 12:30:29	\N	\N
197	133	\N	\N	\N	page_section_images/1767011476_71596a3c79e6ea29869f23118068e52cdaa097e0.png	\N	image/png	1051197	t	t	2025-12-29 12:31:16	2025-12-29 12:31:16	\N	\N
198	134	\N	\N	\N	page_section_images/1767011517_662b4243d213d533c2a32dc5abe015394d50cc47.png	\N	image/png	3427681	t	t	2025-12-29 12:31:57	2025-12-29 12:31:57	\N	\N
207	131	\N	\N	\N	page_section_images/1767013363_prezident.png	\N	image/png	58403	f	t	2025-12-29 13:02:43	2025-12-29 13:02:43	\N	\N
208	131	\N	\N	\N	page_section_images/1767013363_video-3.png	\N	image/png	1739467	t	t	2025-12-29 13:02:43	2025-12-29 13:02:43	\N	\N
209	135	\N	\N	\N	page_section_images/1767090564_video-3.png	\N	image/png	1739467	f	t	2025-12-30 10:29:25	2025-12-30 10:29:25	\N	\N
210	135	\N	\N	\N	page_section_images/1767090565_9f44c2e308de8a752650fc50f9a730e071877078.png	\N	image/png	1672804	f	t	2025-12-30 10:29:25	2025-12-30 10:29:25	\N	\N
211	135	\N	\N	\N	page_section_images/1767090565_71596a3c79e6ea29869f23118068e52cdaa097e0.png	\N	image/png	1051197	f	t	2025-12-30 10:29:25	2025-12-30 10:29:25	\N	\N
212	135	\N	\N	\N	page_section_images/1767090565_association-2.png	\N	image/png	8354	f	t	2025-12-30 10:29:25	2025-12-30 10:29:25	\N	\N
213	139	\N	\N	\N	page_section_images/1767090592_2302d0d79c36d32933b02c7f1b9e6140350fad23.png	\N	image/png	565477	f	t	2025-12-30 10:29:52	2025-12-30 10:29:52	\N	\N
214	139	\N	\N	\N	page_section_images/1767090592_association-4.png	\N	image/png	5583	f	t	2025-12-30 10:29:52	2025-12-30 10:29:52	\N	\N
666	63	\N	\N	\N	locations1/a114a5b4-887a-4f5b-a1c9-eec31846ab8c122.jpg	\N	image/jpeg	168572	f	t	2026-02-14 20:21:54	2026-02-14 20:21:54	\N	\N
667	63	\N	\N	\N	locations1/a114a5b4-896c-4bc0-9bc2-eaeeea27d2f1283.jpg	\N	image/jpeg	151251	f	t	2026-02-14 20:21:54	2026-02-14 20:21:54	\N	\N
668	63	\N	\N	\N	locations1/a114a5b4-8a5c-4917-9d5f-f2f0ed1d0b6b393.jpg	\N	image/jpeg	14741002	f	t	2026-02-14 20:21:54	2026-02-14 20:21:54	\N	\N
665	63	\N	\N	\N	locations1/a114a5b4-8765-4a4c-9e92-f4e71364d037374.jpg	\N	image/jpeg	202311	t	t	2026-02-14 20:21:54	2026-02-14 20:22:01	\N	\N
670	84	\N	\N	\N	locations1/a114a654-47e6-47ae-8b5f-1b7f394dc38e214.jpg	\N	image/jpeg	278705	f	t	2026-02-14 20:23:39	2026-02-14 20:23:39	\N	\N
682	80	\N	\N	\N	locations1/a114a87f-4cd6-4cb7-bd4a-f8aaf51fbb8a435.jpg	\N	image/jpeg	259850	f	t	2026-02-14 20:29:43	2026-02-14 20:29:43	\N	\N
685	61	\N	\N	\N	locations1/a114aa3e-750d-40da-bbd3-16d037b29fbe293.jpg	\N	image/jpeg	155168	f	t	2026-02-14 20:34:36	2026-02-14 20:34:36	\N	\N
686	61	\N	\N	\N	locations1/a114aa3e-77a4-4a4a-91af-a52cafc79c57303.jpg	\N	image/jpeg	199239	f	t	2026-02-14 20:34:36	2026-02-14 20:34:36	\N	\N
687	61	\N	\N	\N	locations1/a114aa3e-78fa-4cf4-b073-9e00fbf850cb316.jpg	\N	image/jpeg	365532	f	t	2026-02-14 20:34:36	2026-02-14 20:34:36	\N	\N
688	61	\N	\N	\N	locations1/a114aa3e-7a28-4d5c-beb8-4e58cc8028b8226.jpg	\N	image/jpeg	95185	f	t	2026-02-14 20:34:36	2026-02-14 20:34:36	\N	\N
689	61	\N	\N	\N	locations1/a114aa3e-7b36-4e2e-b013-2361454ea852136.jpg	\N	image/jpeg	72157	f	t	2026-02-14 20:34:36	2026-02-14 20:34:36	\N	\N
690	61	\N	\N	\N	locations1/a114aa3e-7c2f-444d-ac14-af90ea2c8a7e303.jpg	\N	image/jpeg	98116	f	t	2026-02-14 20:34:36	2026-02-14 20:34:36	\N	\N
692	61	\N	\N	\N	locations1/a114aa3e-7e3e-4c0b-ab5e-b7144298af83480.jpg	\N	image/jpeg	85569	f	t	2026-02-14 20:34:36	2026-02-14 20:34:36	\N	\N
693	61	\N	\N	\N	locations1/a114aa3e-7f4f-43c4-bd33-9ae3f86b98cb150.jpg	\N	image/jpeg	16386694	f	t	2026-02-14 20:34:36	2026-02-14 20:34:36	\N	\N
691	61	\N	\N	\N	locations1/a114aa3e-7d14-4763-9b32-efc8d544789a483.jpg	\N	image/jpeg	84454	t	t	2026-02-14 20:34:36	2026-02-14 20:34:52	\N	\N
696	79	\N	\N	\N	locations1/a114abba-bb1b-4c5c-acd7-88203eae60da320.jpg	\N	image/jpeg	16386694	f	t	2026-02-14 20:38:45	2026-02-14 20:38:45	\N	\N
704	74	\N	\N	\N	locations1/a114aea4-c068-451f-a284-b16c288939e8355.jpg	\N	image/jpeg	157643	f	t	2026-02-14 20:46:54	2026-02-14 20:46:54	\N	\N
715	9	\N	\N	\N	pastandpresent/a119c547-fbb8-468b-9a22-21bcd8695dd8389.mp4	\N	video/mp4	102620698	f	t	2026-02-17 09:29:21	2026-02-17 09:29:21	\N	\N
716	9	\N	\N	\N	pastandpresent/a119c548-4ce3-49d7-a023-154aef48910a151.mp4	\N	video/mp4	102828911	f	t	2026-02-17 09:29:21	2026-02-17 09:29:21	\N	\N
216	139	\N	\N	\N	page_section_images/1767090592_association-2.png	\N	image/png	8354	f	t	2025-12-30 10:29:52	2025-12-30 10:29:52	\N	\N
217	139	\N	\N	\N	page_section_images/1767090592_association-1.png	\N	image/png	80956	f	t	2025-12-30 10:29:52	2025-12-30 10:29:52	\N	\N
218	139	\N	\N	\N	page_section_images/1767090592_flag-en.png	\N	image/png	18142	f	t	2025-12-30 10:29:52	2025-12-30 10:29:52	\N	\N
219	139	\N	\N	\N	page_section_images/1767090592_flag-ru.png	\N	image/png	1743	f	t	2025-12-30 10:29:52	2025-12-30 10:29:52	\N	\N
220	139	\N	\N	\N	page_section_images/1767090592_flag-uz.png	\N	image/png	9976	f	t	2025-12-30 10:29:52	2025-12-30 10:29:52	\N	\N
829	520	\N	\N	\N	projects/a127c0f2-6aee-4b1f-bd19-c1f6bd4bb4b0302.jpg	\N	image/jpeg	242329	f	t	2026-02-24 08:18:49	2026-02-24 08:18:49	\N	\N
830	520	\N	\N	\N	projects/a127c0f2-6bfa-48d4-832b-7c3eddf973c5168.jpg	\N	image/jpeg	114843	f	t	2026-02-24 08:18:49	2026-02-24 08:18:49	\N	\N
831	520	\N	\N	\N	projects/a127c0f2-6cf9-4a3c-85c6-4db010a02952366.jpg	\N	image/jpeg	323114	f	t	2026-02-24 08:18:49	2026-02-24 08:18:49	\N	\N
832	520	\N	\N	\N	projects/a127c0f2-6e11-4dbb-bbc3-a2d5b6de69e6123.jpg	\N	image/jpeg	174052	f	t	2026-02-24 08:18:49	2026-02-24 08:18:49	\N	\N
833	520	\N	\N	\N	projects/a127c0f2-6f37-4da4-84f2-1b6acdb36001142.jpg	\N	image/jpeg	200884	f	t	2026-02-24 08:18:49	2026-02-24 08:18:49	\N	\N
835	520	\N	\N	\N	projects/a127c0f2-7166-4329-9ca0-9a295e22865d276.jpg	\N	image/jpeg	159032	f	t	2026-02-24 08:18:49	2026-02-24 08:18:49	\N	\N
836	520	\N	\N	\N	projects/a127c0f2-725e-4c38-bb50-8ddfceaa7b05423.jpg	\N	image/jpeg	225638	f	t	2026-02-24 08:18:49	2026-02-24 08:18:49	\N	\N
837	520	\N	\N	\N	projects/a127c0f2-735c-4963-aa51-53d44fa8f3fe369.jpg	\N	image/jpeg	193683	f	t	2026-02-24 08:18:49	2026-02-24 08:18:49	\N	\N
838	520	\N	\N	\N	projects/a127c0f2-7445-42f3-8209-84d59bcaecb6344.jpg	\N	image/jpeg	230079	f	t	2026-02-24 08:18:49	2026-02-24 08:18:49	\N	\N
839	520	\N	\N	\N	projects/a127c0f2-752e-469e-bd9f-93d3565bc663157.jpg	\N	image/jpeg	201873	f	t	2026-02-24 08:18:49	2026-02-24 08:18:49	\N	\N
274	168	\N	\N	\N	page_section_images/1767597019_oila1.jpg	\N	image/jpeg	1739467	t	t	2026-01-05 07:10:19	2026-01-05 07:10:19	\N	\N
294	167	\N	\N	\N	page_section_images/1767601294_volunteer-4.png	\N	image/png	34293	t	t	2026-01-05 08:21:34	2026-01-05 08:21:34	\N	\N
612	103	\N	\N	\N	locations1/a114943d-90b2-49a3-82d8-8db945e01e65251.jpg	\N	image/jpeg	209009	f	t	2026-02-14 19:33:04	2026-02-14 19:33:04	\N	\N
298	172	\N	\N	\N	page_section_images/1767601425_volunteer-9.png	\N	image/png	44925	t	t	2026-01-05 08:23:46	2026-01-05 08:23:46	\N	\N
502	39	\N	\N	\N	about/a10fff33-c833-44f7-8718-8c02366bc59052.jpg	\N	image/jpeg	70936	f	t	2026-02-12 12:53:01	2026-02-12 12:53:01	\N	\N
503	39	\N	\N	\N	about/a10fff33-c94d-4783-beb1-94a32eed8c3f6.jpg	\N	image/jpeg	112368	f	t	2026-02-12 12:53:01	2026-02-12 12:53:01	\N	\N
504	39	\N	\N	\N	about/a10fff33-ca7e-4c5a-9f4e-5129f6ac5645339.jpg	\N	image/jpeg	110427	f	t	2026-02-12 12:53:01	2026-02-12 12:53:01	\N	\N
834	520	\N	\N	\N	projects/a127c0f2-7033-446e-af1e-2522ff5280c9142.jpg	\N	image/jpeg	357071	t	t	2026-02-24 08:18:49	2026-02-24 08:18:54	\N	\N
624	100	\N	\N	\N	locations1/a114989b-7aa9-404c-9204-18da4259844e326.png	\N	image/png	2663082	f	t	2026-02-14 19:45:17	2026-02-14 19:45:17	\N	\N
860	522	156	Yillar	yillar-1	page_section_images/a127c82f-a2e9-49d3-82e6-2f9227d9e51c271.jpg	\N	image/jpeg	202722	f	t	2026-02-24 08:39:03	2026-02-24 08:39:03	2	\N
861	522	156	Yillar	yillar-1	page_section_images/a127c82f-a3d2-4c4e-8980-f48fc31eb87f418.jpg	\N	image/jpeg	340478	f	t	2026-02-24 08:39:03	2026-02-24 08:39:03	3	\N
862	522	156	Yillar	yillar-1	page_section_images/a127c82f-a4b7-4054-b873-fe8c3df71852304.jpg	\N	image/jpeg	188393	f	t	2026-02-24 08:39:03	2026-02-24 08:39:03	4	\N
863	522	156	Yillar	yillar-1	page_section_images/a127c82f-a5aa-4a73-9e57-f6c7adf048d5424.jpg	\N	image/jpeg	422246	f	t	2026-02-24 08:39:03	2026-02-24 08:39:03	5	\N
864	522	156	Yillar	yillar-1	page_section_images/a127c82f-a6bb-4f98-844e-6d5fd8154094394.jpg	\N	image/jpeg	292122	f	t	2026-02-24 08:39:03	2026-02-24 08:39:03	6	\N
865	522	156	Yillar	yillar-1	page_section_images/a127c82f-a848-43b4-a312-5eb1f91dda73439.jpg	\N	image/jpeg	172503	f	t	2026-02-24 08:39:03	2026-02-24 08:39:03	7	\N
866	522	156	Yillar	yillar-1	page_section_images/a127c82f-a9bf-46c9-ad23-f3b6c6305cda467.jpg	\N	image/jpeg	185372	f	t	2026-02-24 08:39:03	2026-02-24 08:39:03	8	\N
867	522	156	Yillar	yillar-1	page_section_images/a127c82f-ab2d-465f-9ccf-a54d19045c2f368.jpg	\N	image/jpeg	259640	f	t	2026-02-24 08:39:03	2026-02-24 08:39:03	9	\N
868	522	156	Yillar	yillar-1	page_section_images/a127c82f-ac75-4396-9529-e0c36533fffc212.jpg	\N	image/jpeg	219321	f	t	2026-02-24 08:39:03	2026-02-24 08:39:03	10	\N
468	120	\N	\N	\N	video/a0ffac34-7ea3-4473-a57a-2fced1ef3d10474.mp4	\N	video/mp4	32208385	t	t	2026-02-04 10:07:42	2026-02-04 10:08:02	\N	\N
470	54	\N	\N	\N	sarlavhass/a101b5f4-3149-4043-910f-eab2ac48a1c2342.jpg	\N	image/jpeg	143168	t	t	2026-02-05 10:26:37	2026-02-05 10:26:45	\N	\N
472	54	\N	\N	\N	sarlavhass/a101b652-8be4-4911-a6d7-d5a0451cc73c65.jpg	\N	image/jpeg	89287	f	t	2026-02-05 10:27:39	2026-02-05 10:27:39	\N	\N
474	54	\N	\N	\N	sarlavhass/a101b694-6f1c-4971-a3b3-d3cae4eeaf37324.jpg	\N	image/jpeg	73701	f	t	2026-02-05 10:28:22	2026-02-05 10:28:22	\N	\N
475	54	\N	\N	\N	sarlavhass/a101b6a6-1dc4-4677-8760-0432719d8e8414.jpg	\N	image/jpeg	137083	f	t	2026-02-05 10:28:33	2026-02-05 10:28:33	\N	\N
476	58	\N	\N	\N	url/a101cd72-a438-499a-a487-bd8a8269bae2240.mp4	\N	video/mp4	31156145	f	t	2026-02-05 11:32:18	2026-02-05 11:32:18	\N	\N
477	216	\N	\N	\N	page_section_images/a101d9d5-21c5-4450-aa18-009999947738390.jpg	\N	image/jpeg	117436	f	t	2026-02-05 12:06:56	2026-02-05 12:07:13	\N	\N
478	216	\N	\N	\N	page_section_images/a101d9d5-23d4-4b2e-b7d5-b7d755164ce9174.jpg	\N	image/jpeg	155380	t	t	2026-02-05 12:06:56	2026-02-05 12:07:16	\N	\N
479	217	\N	\N	\N	page_section_images/a101db11-fd38-4970-ba47-eddea0dd4f9b124.jpg	\N	image/jpeg	49002	t	t	2026-02-05 12:10:24	2026-02-05 12:10:24	\N	\N
480	171	\N	\N	\N	volunteers/a1036800-2760-4943-8dd5-7fd50919a012106.jpeg	\N	image/jpeg	135209	t	t	2026-02-06 06:40:18	2026-02-06 06:40:22	\N	\N
481	164	\N	\N	\N	volunteers/a1036842-a0c0-42e0-85c9-dd1c223c963a166.jpeg	\N	image/jpeg	135209	t	t	2026-02-06 06:41:01	2026-02-06 06:41:06	\N	\N
482	165	\N	\N	\N	volunteers/a1036878-d48c-444e-bb8f-1c2ffdf20df6326.jpeg	\N	image/jpeg	135209	t	t	2026-02-06 06:41:37	2026-02-06 06:41:40	\N	\N
483	213	\N	\N	\N	ariza_yuborish/a10368be-a15c-4c33-ad85-2d00a99b3a2710.jpeg	\N	image/jpeg	135209	f	t	2026-02-06 06:42:22	2026-02-06 06:42:22	\N	\N
484	213	\N	\N	\N	ariza_yuborish/a1036976-3677-4ebf-8f60-4629bf0c9d4a236.jpg	\N	image/jpeg	176381	f	t	2026-02-06 06:44:23	2026-02-06 06:44:23	\N	\N
485	213	\N	\N	\N	ariza_yuborish/a10369dc-3c94-4ec2-9ad4-37ff51582f34146.png	\N	image/png	1330605	f	t	2026-02-06 06:45:30	2026-02-06 06:45:30	\N	\N
486	213	\N	\N	\N	ariza_yuborish/a1036a15-e2af-4d8b-92d2-b915ab8b91f510.jpg	\N	image/jpeg	37320	f	t	2026-02-06 06:46:07	2026-02-06 06:46:07	\N	\N
487	212	\N	\N	\N	ariza_yuborish/a1036b03-2dc0-498e-ba19-22ff82728ce4112.jpeg	\N	image/jpeg	79400	t	t	2026-02-06 06:48:43	2026-02-06 06:51:17	\N	\N
505	39	\N	\N	\N	about/a10fff33-cb8d-4017-9462-7514b4dc88d4247.jpg	\N	image/jpeg	103698	f	t	2026-02-12 12:53:01	2026-02-12 12:53:01	\N	\N
506	39	\N	\N	\N	about/a10fff33-cca7-4d0f-94c5-da4d27ce1673116.jpg	\N	image/jpeg	69205	f	t	2026-02-12 12:53:01	2026-02-12 12:53:01	\N	\N
507	39	\N	\N	\N	about/a10fff33-cdaa-44ea-82ed-b852accdb0d0115.jpg	\N	image/jpeg	98128	f	t	2026-02-12 12:53:01	2026-02-12 12:53:01	\N	\N
508	39	\N	\N	\N	about/a10fff33-ced8-4ef9-849b-47fe2cb26c86350.jpg	\N	image/jpeg	71239	f	t	2026-02-12 12:53:01	2026-02-12 12:53:01	\N	\N
509	39	\N	\N	\N	about/a10fff33-cff0-49d2-b654-39c9ef1b1f8e110.jpg	\N	image/jpeg	85591	f	t	2026-02-12 12:53:01	2026-02-12 12:53:01	\N	\N
613	104	\N	\N	\N	locations1/a1149596-d173-429f-aab2-fa834a75900c424.jpg	\N	image/jpeg	179696	f	t	2026-02-14 19:36:51	2026-02-14 19:36:51	\N	\N
625	101	\N	\N	\N	locations1/a114990b-2423-4778-b702-18a1d0fe8d9342.jpg	\N	image/jpeg	288122	f	t	2026-02-14 19:46:30	2026-02-14 19:46:30	\N	\N
840	521	520	Video	video-15	page_section_images/a127c2c7-a77e-4be4-8b32-521cf0c9ad28360.mp4	\N	video/mp4	42811322	f	t	2026-02-24 08:23:56	2026-02-24 08:23:56	1	\N
634	66	\N	\N	\N	locations1/a1149c21-4872-410b-a91c-99497001d622241.jpg	\N	image/jpeg	142807	f	t	2026-02-14 19:55:08	2026-02-14 19:55:08	\N	\N
513	218	\N	\N	\N	structure/a111734e-55f0-4dcb-940c-f1379ab77a17219.png	\N	image/png	993021	t	t	2026-02-13 06:13:30	2026-02-13 06:13:34	\N	\N
520	221	\N	\N	\N	page_section_images/a11187ea-a855-4419-bc64-dbac2eac4b36468.jpg	\N	image/jpeg	443658	t	t	2026-02-13 07:11:08	2026-02-13 07:11:08	\N	\N
521	221	\N	\N	\N	page_section_images/a11187ea-ab9c-4195-b89c-2a5539cfdcc7314.jpg	\N	image/jpeg	264234	f	t	2026-02-13 07:11:08	2026-02-13 07:11:08	\N	\N
635	66	\N	\N	\N	locations1/a1149c21-4a89-4965-8564-bb017e169381338.jpg	\N	image/jpeg	130692	f	t	2026-02-14 19:55:08	2026-02-14 19:55:08	\N	\N
522	221	\N	\N	\N	page_section_images/a11187ea-ad2f-44ec-bb8e-9579400c2ab597.jpg	\N	image/jpeg	262793	f	t	2026-02-13 07:11:08	2026-02-13 07:11:08	\N	\N
471	54	\N	\N	\N	sarlavhass/a101b637-fd16-4cb4-af07-3cdf3e68859379.jpg	\N	image/jpeg	89276	f	t	2026-02-05 10:27:21	2026-02-05 10:27:21	\N	\N
415	191	\N	\N	\N	asosiy_rasmlar/a0e020e9-9c2a-4080-a44e-64f95954426c76.png	\N	image/png	704035	t	t	2026-01-19 17:47:32	2026-01-19 17:47:41	\N	\N
416	192	\N	\N	\N	page_section_images/a0e02116-ba1a-4cc9-8cb6-c217ff9e20db15.png	\N	image/png	550254	t	t	2026-01-19 17:48:02	2026-01-19 17:48:02	\N	\N
417	193	\N	\N	\N	page_section_images/a0e02135-9552-49e8-9800-7a9b9853c6cf450.png	\N	image/png	600965	t	t	2026-01-19 17:48:22	2026-01-19 17:48:22	\N	\N
473	54	\N	\N	\N	sarlavhass/a101b66c-7c06-4627-9155-73abb3ca9259115.jpg	\N	image/jpeg	309735	f	t	2026-02-05 10:27:56	2026-02-05 10:27:56	\N	\N
530	224	\N	\N	\N	page_section_images/a11189ef-ac2c-453b-b546-8a66ce671c7b460.jpg	\N	image/jpeg	201249	t	t	2026-02-13 07:16:47	2026-02-13 07:16:47	\N	\N
531	224	\N	\N	\N	page_section_images/a11189ef-ae27-42a7-9fca-bc85473a3c8b116.jpg	\N	image/jpeg	223290	f	t	2026-02-13 07:16:47	2026-02-13 07:16:47	\N	\N
532	224	\N	\N	\N	page_section_images/a11189ef-af29-4249-a1a2-cda3405b2a37416.jpg	\N	image/jpeg	277528	f	t	2026-02-13 07:16:47	2026-02-13 07:16:47	\N	\N
636	66	\N	\N	\N	locations1/a1149c21-4b7a-4d8e-8a43-0b72af517bd9205.jpg	\N	image/jpeg	160457	f	t	2026-02-14 19:55:08	2026-02-14 19:55:08	\N	\N
421	156	\N	\N	\N	projects/a0e10fce-2482-4376-b1b2-29c7651f67ad452.jpg	\N	image/jpeg	84421	t	t	2026-01-20 04:55:32	2026-01-20 04:55:37	\N	\N
637	66	\N	\N	\N	locations1/a1149c21-4c83-4793-809f-83aefda82aca325.jpg	\N	image/jpeg	312390	f	t	2026-02-14 19:55:08	2026-02-14 19:55:08	\N	\N
841	521	520	Video	video-15	page_section_images/a127c2c7-c9ea-4b37-b922-7e2756fca61d94.mp4	\N	video/mp4	34991621	t	t	2026-02-24 08:23:56	2026-02-24 08:23:56	2	\N
842	521	520	Video	video-15	page_section_images/a127c2c7-e61f-41d7-92f1-82e79e0e4fac109.mp4	\N	video/mp4	22592443	f	t	2026-02-24 08:23:56	2026-02-24 08:23:56	3	\N
638	66	\N	\N	\N	locations1/a1149c21-4d77-42bb-8229-b467955f620f9.jpg	\N	image/jpeg	220739	f	t	2026-02-14 19:55:08	2026-02-14 19:55:08	\N	\N
424	194	\N	\N	\N	cc/a0e13774-e674-4db5-a887-676337687214172.png	\N	image/png	44699	t	t	2026-01-20 06:46:24	2026-01-20 06:46:28	\N	\N
639	66	\N	\N	\N	locations1/a1149c21-4e7f-471f-8ab8-1e844fff74bd290.jpg	\N	image/jpeg	287664	f	t	2026-02-14 19:55:08	2026-02-14 19:55:08	\N	\N
643	89	\N	\N	\N	locations1/a1149da5-f523-483b-bfbf-f1c8d76e10cf204.jpg	\N	image/jpeg	331922	f	t	2026-02-14 19:59:23	2026-02-14 19:59:23	\N	\N
644	89	\N	\N	\N	locations1/a1149da5-f762-432c-9e02-30ed9ecc5fa130.jpg	\N	image/jpeg	152523	f	t	2026-02-14 19:59:23	2026-02-14 19:59:23	\N	\N
425	195	\N	\N	\N	page_section_images/a0e33595-2a32-4177-8bdc-6473fb97d58c38.svg	\N	image/svg+xml	1682	t	t	2026-01-21 06:32:49	2026-01-21 06:32:49	\N	\N
426	196	\N	\N	\N	page_section_images/a0e335ba-2f3d-407b-b332-09fef4d0c7b7325.svg	\N	image/svg+xml	1898	t	t	2026-01-21 06:33:14	2026-01-21 06:33:14	\N	\N
427	197	\N	\N	\N	page_section_images/a0e335e4-1915-48f8-bc66-67adff5d8f86299.svg	\N	image/svg+xml	3074	t	t	2026-01-21 06:33:41	2026-01-21 06:33:41	\N	\N
428	198	\N	\N	\N	page_section_images/a0e33612-843c-489a-871a-3b4324f9a033432.svg	\N	image/svg+xml	1558	t	t	2026-01-21 06:34:12	2026-01-21 06:34:12	\N	\N
429	199	\N	\N	\N	page_section_images/a0e3364a-7ec8-43f0-9a52-488c7e29bf17100.svg	\N	image/svg+xml	2922	t	t	2026-01-21 06:34:48	2026-01-21 06:34:48	\N	\N
430	200	\N	\N	\N	page_section_images/a0e3367e-9b9f-42ad-a178-959da1932c51251.svg	\N	image/svg+xml	1798	t	t	2026-01-21 06:35:22	2026-01-21 06:35:22	\N	\N
431	201	\N	\N	\N	page_section_images/a0e336a3-8c93-4850-95e0-1d8b498c58ae60.svg	\N	image/svg+xml	2078	t	t	2026-01-21 06:35:47	2026-01-21 06:35:47	\N	\N
432	202	\N	\N	\N	page_section_images/a0e336c6-2e7c-4a16-82a8-3ea68d861193244.svg	\N	image/svg+xml	1706	t	t	2026-01-21 06:36:09	2026-01-21 06:36:09	\N	\N
433	203	\N	\N	\N	page_section_images/a0e336e8-8d8f-4f7c-9420-d30b67a8f75c313.svg	\N	image/svg+xml	1762	t	t	2026-01-21 06:36:32	2026-01-21 06:36:32	\N	\N
645	89	\N	\N	\N	locations1/a1149da5-f87f-4c1b-b26e-81c83b80aa1e267.jpg	\N	image/jpeg	11952825	f	t	2026-02-14 19:59:23	2026-02-14 19:59:23	\N	\N
646	89	\N	\N	\N	locations1/a1149da6-01ec-4c42-a0fc-4ef0b29f86fa384.jpg	\N	image/jpeg	167803	f	t	2026-02-14 19:59:23	2026-02-14 19:59:23	\N	\N
647	89	\N	\N	\N	locations1/a1149da6-02f2-44e8-a753-25382021cb946.jpg	\N	image/jpeg	109622	f	t	2026-02-14 19:59:23	2026-02-14 19:59:23	\N	\N
648	89	\N	\N	\N	locations1/a1149da6-0430-4a48-9329-36a78485e562162.jpg	\N	image/jpeg	307964	f	t	2026-02-14 19:59:23	2026-02-14 19:59:23	\N	\N
649	89	\N	\N	\N	locations1/a1149da6-0536-4127-ac37-f3c8d2f20b49184.jpg	\N	image/jpeg	137592	f	t	2026-02-14 19:59:23	2026-02-14 19:59:23	\N	\N
435	205	\N	\N	\N	mutoola/a0e3ae4b-61d3-49cc-8c4c-4a6b51a9ef76323.png	\N	image/png	22697	f	t	2026-01-21 12:10:21	2026-01-21 12:10:21	\N	\N
436	205	\N	\N	\N	mutoola/a0e3ae54-6a06-405b-b813-cf02125d0745234.png	\N	image/png	13393	f	t	2026-01-21 12:10:27	2026-01-22 05:51:20	\N	\N
437	205	\N	\N	\N	mutoola/a0e3ae5f-9456-4415-946b-dc78671dcf52119.png	\N	image/png	22382	t	t	2026-01-21 12:10:35	2026-01-22 05:51:20	\N	\N
455	187	\N	\N	\N	mediateka/a0e575a9-e908-47fc-9707-0cf6d1837732371.jpg	\N	image/jpeg	202670	t	t	2026-01-22 09:23:40	2026-01-22 09:23:43	\N	\N
843	521	520	Video	video-15	page_section_images/a127c2c7-f749-49ce-8412-cead6f33f74b8.mp4	\N	video/mp4	36873922	f	t	2026-02-24 08:23:56	2026-02-24 08:23:56	4	\N
514	219	\N	\N	\N	page_section_images/a11185fd-1a9a-4863-b9c3-a4106c60d6dc222.jpg	\N	image/jpeg	271474	t	t	2026-02-13 07:05:44	2026-02-13 07:05:44	\N	\N
489	212	\N	\N	\N	ariza_yuborish/a1036be4-c574-4e66-a8fd-41463cd96848114.jpg	\N	image/jpeg	111619	f	t	2026-02-06 06:51:11	2026-02-06 06:51:11	\N	\N
488	212	\N	\N	\N	ariza_yuborish/a1036b58-be82-49d9-bdb0-1e5a80be0174173.jpg	\N	image/jpeg	98122	f	t	2026-02-06 06:49:39	2026-02-06 06:51:15	\N	\N
515	219	\N	\N	\N	page_section_images/a11185fd-1caa-4300-a8d2-f82f7820fc1f293.jpg	\N	image/jpeg	159079	f	t	2026-02-13 07:05:44	2026-02-13 07:05:44	\N	\N
490	212	\N	\N	\N	ariza_yuborish/a1036c5d-b722-4a57-b993-008d288d299b75.jpg	\N	image/jpeg	152748	f	t	2026-02-06 06:52:30	2026-02-06 06:52:30	\N	\N
516	219	\N	\N	\N	page_section_images/a11185fd-1e67-49f3-9e6c-dc7865f52b24494.jpg	\N	image/jpeg	209716	f	t	2026-02-13 07:05:44	2026-02-13 07:05:44	\N	\N
523	222	\N	\N	\N	page_section_images/a111888f-6f86-442c-be0d-23563664f8c4280.jpg	\N	image/jpeg	200104	t	t	2026-02-13 07:12:56	2026-02-13 07:12:56	\N	\N
524	222	\N	\N	\N	page_section_images/a111888f-7129-46bc-af08-a709b139e4e5174.jpg	\N	image/jpeg	143808	f	t	2026-02-13 07:12:56	2026-02-13 07:12:56	\N	\N
525	222	\N	\N	\N	page_section_images/a111888f-71f9-4f19-808e-f313434eda5f270.jpg	\N	image/jpeg	195003	f	t	2026-02-13 07:12:56	2026-02-13 07:12:56	\N	\N
533	225	\N	\N	\N	page_section_images/a1118c7c-55ab-43da-aca6-6bc1dc6802b5309.jpg	\N	image/jpeg	222998	t	t	2026-02-13 07:23:54	2026-02-13 07:23:54	\N	\N
791	495	494	Tashkilot haqida	nomi-7	page_section_images/a125b202-14ae-473e-8154-d29c3c781c0a304.png	\N	image/png	429656	t	t	2026-02-23 07:45:23	2026-02-23 07:45:23	\N	\N
534	225	\N	\N	\N	page_section_images/a1118c7c-57ee-4ff8-a363-b8ba5fceee41430.jpg	\N	image/jpeg	185619	f	t	2026-02-13 07:23:54	2026-02-13 07:23:54	\N	\N
535	225	\N	\N	\N	page_section_images/a1118c7c-58fb-4c53-a343-6396feffb3a0290.jpg	\N	image/jpeg	150149	f	t	2026-02-13 07:23:54	2026-02-13 07:23:54	\N	\N
536	225	\N	\N	\N	page_section_images/a1118c7c-59f0-4169-885d-6ad2636e9390239.jpg	\N	image/jpeg	145135	f	t	2026-02-13 07:23:54	2026-02-13 07:23:54	\N	\N
537	225	\N	\N	\N	page_section_images/a1118c7c-5b19-4753-af92-34acd4f882b1368.jpg	\N	image/jpeg	236219	f	t	2026-02-13 07:23:54	2026-02-13 07:23:54	\N	\N
538	225	\N	\N	\N	page_section_images/a1118c7c-5c11-40c1-8973-21a0f0d7565f317.jpg	\N	image/jpeg	238652	f	t	2026-02-13 07:23:54	2026-02-13 07:23:54	\N	\N
542	226	\N	\N	\N	page_section_images/a1118e9d-c4d0-4c70-a72e-d5f42ed26bb7308.jpg	\N	image/jpeg	135250	f	t	2026-02-13 07:29:52	2026-02-13 07:29:52	\N	\N
541	226	\N	\N	\N	page_section_images/a1118e9d-c41d-4be5-ad9b-997f67c70c58462.jpg	\N	image/jpeg	129131	t	t	2026-02-13 07:29:52	2026-02-13 07:30:35	\N	\N
753	456	\N	\N	\N	page_section_images/a11d67a6-b842-4e18-859c-9af0b858d7e5498.svg	\N	image/svg+xml	641	t	t	2026-02-19 04:50:51	2026-02-19 04:50:51	\N	\N
550	207	\N	\N	\N	podcastlar/a111c0ff-3cbd-4c59-843a-7ac09f5817e5236.png	\N	image/png	1033688	f	t	2026-02-13 09:50:44	2026-02-13 09:50:49	\N	\N
494	19	\N	\N	\N	tanlov/a1037acb-bc95-4de5-87ae-d376c3ef203770.jpg	\N	image/jpeg	103741	t	t	2026-02-06 07:32:51	2026-02-06 07:32:56	\N	\N
755	459	\N	\N	\N	tanlov/a11dfcf5-d969-43ea-aa2e-fa57ce35082d27.png	\N	image/png	1662352	t	t	2026-02-19 11:48:20	2026-02-19 11:48:24	\N	\N
758	466	465	Nomi	nomi-5	page_section_images/a11f6a65-932f-47b9-a5e8-72ccc91327f7312.jpg	\N	image/jpeg	199997	t	t	2026-02-20 04:50:11	2026-02-20 04:50:11	\N	\N
546	208	\N	\N	\N	podcastlar/a111b7c5-043d-48fc-9aa6-1dc5c18912b5480.png	\N	image/png	4439939	f	t	2026-02-13 09:24:56	2026-02-13 09:24:56	\N	\N
558	190	\N	\N	\N	cc/a111cd3d-bbc4-4bc4-9861-93c2e738b66f182.png	\N	image/png	1329125	f	t	2026-02-13 10:24:58	2026-02-20 05:53:01	\N	\N
545	208	\N	\N	\N	podcastlar/a111b582-693d-4735-9eab-cea0015bd49b325.png	\N	image/png	1720079	f	t	2026-02-13 09:18:37	2026-02-13 09:26:14	\N	\N
547	208	\N	\N	\N	podcastlar/a111b83b-6da6-4313-8545-51abf0202d6f16.png	\N	image/png	2951280	t	t	2026-02-13 09:26:14	2026-02-13 09:26:18	\N	\N
549	207	\N	\N	\N	podcastlar/a111c0ff-3b23-41b5-8088-4968ed76d505435.png	\N	image/png	835278	f	t	2026-02-13 09:50:44	2026-02-13 09:50:44	\N	\N
548	207	\N	\N	\N	podcastlar/a111c0ff-37c7-487f-83c8-56203697a5b1486.png	\N	image/png	1309828	t	t	2026-02-13 09:50:44	2026-02-13 09:50:52	\N	\N
552	209	\N	\N	\N	podcastlar/a111c34c-29e6-4a69-8788-fdf12809a506416.png	\N	image/png	768735	f	t	2026-02-13 09:57:10	2026-02-13 09:57:10	\N	\N
553	209	\N	\N	\N	podcastlar/a111c383-4e87-45a1-a075-24af34661b09216.png	\N	image/png	2429888	f	t	2026-02-13 09:57:46	2026-02-13 09:57:46	\N	\N
554	209	\N	\N	\N	podcastlar/a111c437-d0c8-4a2a-9022-33ef774874d175.png	\N	image/png	3380239	t	t	2026-02-13 09:59:45	2026-02-13 09:59:50	\N	\N
556	206	\N	\N	\N	podcastlar/a111c6ee-fc2a-4174-97c0-770a77c975ae35.png	\N	image/png	1504919	f	t	2026-02-13 10:07:20	2026-02-13 10:07:20	\N	\N
557	206	\N	\N	\N	podcastlar/a111c6ee-fe57-454e-91f9-11c38168b8fb462.png	\N	image/png	1967179	f	t	2026-02-13 10:07:20	2026-02-13 10:07:20	\N	\N
555	206	\N	\N	\N	podcastlar/a111c6ee-f8d5-4bdb-9a66-bad27f9ad396142.png	\N	image/png	1250917	t	t	2026-02-13 10:07:20	2026-02-13 10:07:25	\N	\N
562	52	\N	\N	\N	url/a1144ffd-6c77-434b-8184-97cc9a324638243.mp4	\N	video/mp4	36971858	f	t	2026-02-14 16:22:14	2026-02-14 16:22:14	\N	\N
560	228	52	Url	url	page_section_images/a1144e80-0820-4287-aded-dc187ccee694238.mp4	\N	video/mp4	26847802	f	t	2026-02-14 16:18:04	2026-02-14 16:18:04	\N	\N
561	229	\N	\N	\N	page_section_images/a1144f0d-1721-43b0-8233-8933bbeaec09216.mp4	\N	video/mp4	30400802	f	t	2026-02-14 16:19:36	2026-02-14 16:19:36	\N	\N
563	73	\N	\N	\N	locations1/a1145790-e3c8-43b8-9c01-ece6e68d1c2a495.jpg	\N	image/jpeg	89287	f	t	2026-02-14 16:43:25	2026-02-14 16:43:25	\N	\N
564	73	\N	\N	\N	locations1/a1145790-e61e-45d7-be0f-3886a52dff5a417.jpg	\N	image/jpeg	309735	f	t	2026-02-14 16:43:25	2026-02-14 16:43:25	\N	\N
565	73	\N	\N	\N	locations1/a1145790-e739-490b-ba3a-f149197bb747129.jpg	\N	image/jpeg	137083	f	t	2026-02-14 16:43:25	2026-02-14 16:43:25	\N	\N
566	73	\N	\N	\N	locations1/a1145790-e81f-49f3-afab-90f0558752fe21.jpg	\N	image/jpeg	916659	f	t	2026-02-14 16:43:25	2026-02-14 16:43:25	\N	\N
567	114	\N	\N	\N	locations1/a11457ea-52b4-48a6-bf2f-870c0567bdea132.jpg	\N	image/jpeg	309735	f	t	2026-02-14 16:44:23	2026-02-14 16:44:23	\N	\N
568	73	\N	\N	\N	locations1/a1145945-2f82-4fed-b6fb-24842228bc2291.jpg	\N	image/jpeg	229997	f	t	2026-02-14 16:48:11	2026-02-14 16:48:11	\N	\N
569	73	\N	\N	\N	locations1/a1145945-3192-4393-a58e-f79887c01675438.jpg	\N	image/jpeg	190084	f	t	2026-02-14 16:48:11	2026-02-14 16:48:11	\N	\N
570	73	\N	\N	\N	locations1/a1145945-327c-47d3-910f-ce5f2ce4a0bc186.jpeg	\N	image/jpeg	35514	f	t	2026-02-14 16:48:11	2026-02-14 16:48:11	\N	\N
571	73	\N	\N	\N	locations1/a1145945-3322-49e2-b36b-2b5ed39ac622240.jpeg	\N	image/jpeg	32624	f	t	2026-02-14 16:48:11	2026-02-14 16:48:11	\N	\N
572	73	\N	\N	\N	locations1/a1145945-33ba-4a62-8760-120a82e384fe36.jpeg	\N	image/jpeg	33987	f	t	2026-02-14 16:48:11	2026-02-14 16:48:11	\N	\N
573	73	\N	\N	\N	locations1/a1145945-3440-4bab-a980-4a539c98a943445.jpeg	\N	image/jpeg	44478	f	t	2026-02-14 16:48:11	2026-02-14 16:48:11	\N	\N
574	73	\N	\N	\N	locations1/a1145945-34d2-4596-b780-f7fd9201000d116.jpg	\N	image/jpeg	60574	f	t	2026-02-14 16:48:11	2026-02-14 16:48:11	\N	\N
575	73	\N	\N	\N	locations1/a1145945-357b-4daa-905c-858289f60f7a274.jpg	\N	image/jpeg	107443	f	t	2026-02-14 16:48:11	2026-02-14 16:48:11	\N	\N
576	115	\N	\N	\N	locations1/a1145990-243a-4084-820e-ee99caa66a72145.jpeg	\N	image/jpeg	33987	f	t	2026-02-14 16:49:00	2026-02-14 16:49:00	\N	\N
577	116	\N	\N	\N	locations1/a11459eb-4ab8-4593-96e7-6e6ca8ec6acb336.jpg	\N	image/jpeg	916659	f	t	2026-02-14 16:50:00	2026-02-14 16:50:00	\N	\N
578	72	\N	\N	\N	locations1/a1145bc1-b782-497e-9461-5098d41408f6228.jpg	\N	image/jpeg	187555	f	t	2026-02-14 16:55:08	2026-02-14 16:55:08	\N	\N
579	72	\N	\N	\N	locations1/a1145bc1-ba1c-40d1-bb15-253ced249e2a19.jpg	\N	image/jpeg	339631	f	t	2026-02-14 16:55:08	2026-02-14 16:55:08	\N	\N
580	72	\N	\N	\N	locations1/a1145bc1-bb76-41d8-a389-5017e6c5a917197.jpg	\N	image/jpeg	47609	f	t	2026-02-14 16:55:08	2026-02-14 16:55:08	\N	\N
614	230	69	video	video-10	page_section_images/a114965a-50ea-44a4-850b-1af9a6f551ea406.jpg	\N	image/jpeg	69939	f	t	2026-02-14 19:38:59	2026-02-14 19:38:59	\N	\N
582	72	\N	\N	\N	locations1/a1145bc1-bdf1-4172-bbda-07e83550c69627.jpg	\N	image/jpeg	55131	f	t	2026-02-14 16:55:08	2026-02-14 16:55:08	\N	\N
583	72	\N	\N	\N	locations1/a1145bc1-bfbb-4292-986c-bb4f0454450b215.jpg	\N	image/jpeg	54734	f	t	2026-02-14 16:55:08	2026-02-14 16:55:08	\N	\N
626	67	\N	\N	\N	locations1/a1149a30-2348-4c4c-a980-cb443f4be4a743.jpg	\N	image/jpeg	382025	f	t	2026-02-14 19:49:42	2026-02-14 19:49:42	\N	\N
627	67	\N	\N	\N	locations1/a1149a30-2595-4a6f-b03c-6d1e11ba4c55422.jpg	\N	image/jpeg	323207	f	t	2026-02-14 19:49:42	2026-02-14 19:49:42	\N	\N
628	67	\N	\N	\N	locations1/a1149a30-26df-47d1-896a-7d928ebe3b03253.jpg	\N	image/jpeg	91803	f	t	2026-02-14 19:49:42	2026-02-14 19:49:42	\N	\N
581	72	\N	\N	\N	locations1/a1145bc1-bcaf-495e-8b41-a7db62791c44255.jpg	\N	image/jpeg	55524	t	t	2026-02-14 16:55:08	2026-02-14 16:55:14	\N	\N
584	111	\N	\N	\N	locations1/a1145c58-cd21-4444-a77a-e453428f610014.jpg	\N	image/jpeg	339631	f	t	2026-02-14 16:56:47	2026-02-14 16:56:47	\N	\N
629	67	\N	\N	\N	locations1/a1149a30-27f7-4a6d-a411-c8620c299400477.jpg	\N	image/jpeg	250420	f	t	2026-02-14 19:49:42	2026-02-14 19:49:42	\N	\N
630	67	\N	\N	\N	locations1/a1149a30-290c-41b4-9de4-e1fda3886a6e80.jpg	\N	image/jpeg	176402	f	t	2026-02-14 19:49:42	2026-02-14 19:49:42	\N	\N
631	67	\N	\N	\N	locations1/a1149a30-2a1e-4822-a959-70e740acddbb28.jpg	\N	image/jpeg	315644	f	t	2026-02-14 19:49:42	2026-02-14 19:49:42	\N	\N
640	93	\N	\N	\N	locations1/a1149c5d-b872-4ac7-a03e-5fab87fa508e95.jpg	\N	image/jpeg	287664	f	t	2026-02-14 19:55:48	2026-02-14 19:55:48	\N	\N
650	90	\N	\N	\N	locations1/a1149fae-8096-4006-ad20-7195042c71ee250.jpg	\N	image/jpeg	11952825	f	t	2026-02-14 20:05:04	2026-02-14 20:05:04	\N	\N
585	112	\N	\N	\N	locations1/a1145cc5-dbe2-44a2-b315-f19a1d9e26b0171.jpg	\N	image/jpeg	54734	t	t	2026-02-14 16:57:58	2026-02-14 16:58:02	\N	\N
586	113	\N	\N	\N	locations1/a1145d1c-1195-4a82-98fe-dc8d405dbff019.jpg	\N	image/jpeg	55131	f	t	2026-02-14 16:58:55	2026-02-14 16:58:55	\N	\N
587	71	\N	\N	\N	locations1/a1145eb0-d17f-4bea-be31-4875eef98e93180.jpg	\N	image/jpeg	479622	f	t	2026-02-14 17:03:20	2026-02-14 17:03:20	\N	\N
588	71	\N	\N	\N	locations1/a1145eb0-d3bc-41ec-b829-9d81ff903456110.jpg	\N	image/jpeg	188149	f	t	2026-02-14 17:03:20	2026-02-14 17:03:20	\N	\N
589	71	\N	\N	\N	locations1/a1145eb0-d4bb-416a-a237-bd88136e0695110.jpg	\N	image/jpeg	73786	f	t	2026-02-14 17:03:20	2026-02-14 17:03:20	\N	\N
590	71	\N	\N	\N	locations1/a1145eb0-d58a-41d0-9193-fcaaac76b86e420.jpg	\N	image/jpeg	170976	f	t	2026-02-14 17:03:20	2026-02-14 17:03:20	\N	\N
591	71	\N	\N	\N	locations1/a1145eb0-d697-4878-99c1-7770cff55eda471.jpg	\N	image/jpeg	162417	f	t	2026-02-14 17:03:20	2026-02-14 17:03:20	\N	\N
592	71	\N	\N	\N	locations1/a1145eb0-d7fb-48ef-bf31-ee557d5f5290449.jpg	\N	image/jpeg	208657	f	t	2026-02-14 17:03:20	2026-02-14 17:03:20	\N	\N
593	108	\N	\N	\N	locations1/a1148e39-74de-4f3a-91e9-2553feec1d0f390.jpeg	\N	image/jpeg	294143	f	t	2026-02-14 19:16:15	2026-02-14 19:16:15	\N	\N
594	109	\N	\N	\N	locations1/a1148f26-a172-401d-9e03-1ffcaca8464b247.jpg	\N	image/jpeg	188149	f	t	2026-02-14 19:18:50	2026-02-14 19:18:50	\N	\N
595	110	\N	\N	\N	locations1/a1148f9b-1f76-485d-a385-caf08d03398015.jpg	\N	image/jpeg	479622	f	t	2026-02-14 19:20:07	2026-02-14 19:20:07	\N	\N
596	70	\N	\N	\N	locations1/a1149100-fb6f-4d13-91e6-16839e15b211390.jpg	\N	image/jpeg	173964	f	t	2026-02-14 19:24:01	2026-02-14 19:24:01	\N	\N
597	70	\N	\N	\N	locations1/a1149100-fe2b-45db-8972-a3ab524bebc483.jpg	\N	image/jpeg	52648	f	t	2026-02-14 19:24:01	2026-02-14 19:24:01	\N	\N
598	70	\N	\N	\N	locations1/a1149100-ff8a-4bc1-86a0-f722c8007e80170.jpg	\N	image/jpeg	203864	f	t	2026-02-14 19:24:01	2026-02-14 19:24:01	\N	\N
599	70	\N	\N	\N	locations1/a1149101-00c8-43fb-8c15-ed8f26e87950305.jpg	\N	image/jpeg	223741	f	t	2026-02-14 19:24:01	2026-02-14 19:24:01	\N	\N
600	70	\N	\N	\N	locations1/a1149101-01e1-474a-85bf-73fe406cb9e4129.jpg	\N	image/jpeg	224579	f	t	2026-02-14 19:24:01	2026-02-14 19:24:01	\N	\N
601	70	\N	\N	\N	locations1/a1149101-02e3-45da-9ff6-5acf1728a172484.png	\N	image/png	1442142	f	t	2026-02-14 19:24:01	2026-02-14 19:24:01	\N	\N
602	70	\N	\N	\N	locations1/a1149101-04a9-451b-9f7a-e916be90f7b54.jpg	\N	image/jpeg	1633342	f	t	2026-02-14 19:24:01	2026-02-14 19:24:01	\N	\N
603	105	\N	\N	\N	locations1/a114912e-e072-43e1-bc2a-a2a84268533c213.jpg	\N	image/jpeg	224579	f	t	2026-02-14 19:24:31	2026-02-14 19:24:31	\N	\N
604	106	\N	\N	\N	locations1/a114916f-dccf-478d-b8ab-085c90a6ef56105.jpg	\N	image/jpeg	203864	f	t	2026-02-14 19:25:14	2026-02-14 19:25:14	\N	\N
661	87	\N	\N	\N	locations1/a114a44a-567e-4b36-bfe7-37a6822327dc329.jpg	\N	image/jpeg	125405	f	t	2026-02-14 20:17:57	2026-02-14 20:17:57	\N	\N
671	85	\N	\N	\N	locations1/a114a700-18d8-414d-9884-a4297240791d68.jpg	\N	image/jpeg	14741002	f	t	2026-02-14 20:25:32	2026-02-14 20:25:32	\N	\N
683	81	\N	\N	\N	locations1/a114a8dd-4ef2-49d4-bd04-4ce7a81f201a49.jpg	\N	image/jpeg	75384	f	t	2026-02-14 20:30:44	2026-02-14 20:30:44	\N	\N
694	77	\N	\N	\N	locations1/a114aab0-6085-4ebf-a07a-1de02cb2f54f406.jpg	\N	image/jpeg	155168	f	t	2026-02-14 20:35:51	2026-02-14 20:35:51	\N	\N
698	60	\N	\N	\N	locations1/a114acb7-4531-4b40-b247-b4f8c94386f4213.jpeg	\N	image/jpeg	72120	f	t	2026-02-14 20:41:31	2026-02-14 20:41:31	\N	\N
700	60	\N	\N	\N	locations1/a114acb7-4811-48d9-8a3b-87fae0f109eb7.jpg	\N	image/jpeg	540597	f	t	2026-02-14 20:41:31	2026-02-14 20:41:31	\N	\N
701	60	\N	\N	\N	locations1/a114acb7-4969-4bf2-bbe6-36111b4c4d4834.jpg	\N	image/jpeg	183311	f	t	2026-02-14 20:41:31	2026-02-14 20:41:31	\N	\N
702	60	\N	\N	\N	locations1/a114acb7-4a79-4688-aeb5-f794a42a3cd5272.jpg	\N	image/jpeg	52585	f	t	2026-02-14 20:41:31	2026-02-14 20:41:31	\N	\N
703	60	\N	\N	\N	locations1/a114acb7-4b78-4c23-bb0e-8f7a0d0c8a38269.jpg	\N	image/jpeg	56843	f	t	2026-02-14 20:41:31	2026-02-14 20:41:31	\N	\N
699	60	\N	\N	\N	locations1/a114acb7-46b6-44e3-bcac-1d11182f1324256.jpg	\N	image/jpeg	249969	t	t	2026-02-14 20:41:31	2026-02-14 20:41:41	\N	\N
705	75	\N	\N	\N	locations1/a114aee0-bf34-4628-844f-cddeac1853b9325.jpg	\N	image/jpeg	183311	f	t	2026-02-14 20:47:33	2026-02-14 20:47:33	\N	\N
844	150	\N	\N	\N	projects/a127c67f-e1d9-4537-ad70-98dc533a7e69351.jpg	\N	image/jpeg	340350	f	t	2026-02-24 08:34:20	2026-02-24 08:34:20	\N	\N
845	150	\N	\N	\N	projects/a127c67f-e3be-44be-9d72-9e30880dfb1c241.jpg	\N	image/jpeg	126176	f	t	2026-02-24 08:34:20	2026-02-24 08:34:20	\N	\N
786	473	\N	\N	\N	tanlov/a12589c3-6cc7-41ef-9bc2-7f21e8ae04a628.jpg	\N	image/jpeg	9011	t	t	2026-02-23 05:52:51	2026-02-23 05:52:53	\N	\N
720	231	\N	\N	\N	page_section_images/a11b6472-e047-4bf9-a28c-9a6c20327f98396.png	\N	image/png	414	t	t	2026-02-18 04:50:14	2026-02-18 04:53:52	\N	\N
743	418	\N	\N	\N	page_section_images/a11bd183-055b-47b7-a912-a0d1ff46cc71393.svg	\N	image/svg+xml	563	t	t	2026-02-18 09:55:12	2026-02-18 09:57:21	\N	\N
721	233	\N	\N	\N	page_section_images/a11b6cc6-3e7c-4e52-a27f-b1a3fef95ff3469.png	\N	image/png	45084	t	t	2026-02-18 05:13:31	2026-02-18 05:13:31	\N	\N
722	234	\N	\N	\N	page_section_images/a11b6d90-18b2-4834-92f9-1e83f8b973a8232.png	\N	image/png	11629	t	t	2026-02-18 05:15:43	2026-02-18 05:15:43	\N	\N
723	235	\N	\N	\N	page_section_images/a11b6eba-9740-42d8-9421-b7e131a0607a381.png	\N	image/png	226	t	t	2026-02-18 05:18:59	2026-02-18 05:18:59	\N	\N
724	236	\N	\N	\N	page_section_images/a11b6fd3-3db3-4d5f-bb9c-d3f7496a8f1b331.svg	\N	image/svg+xml	273	t	t	2026-02-18 05:22:03	2026-02-18 05:22:03	\N	\N
725	237	\N	\N	\N	page_section_images/a11b7079-cfd2-4a4a-8b9a-126455ef2269161.svg	\N	image/svg+xml	241	t	t	2026-02-18 05:23:52	2026-02-18 05:23:52	\N	\N
726	238	\N	\N	\N	page_section_images/a11b711c-15a0-46c5-8a40-cbffad9cfe947.svg	\N	image/svg+xml	275	t	t	2026-02-18 05:25:38	2026-02-18 05:25:38	\N	\N
727	239	\N	\N	\N	page_section_images/a11b719d-2d58-46fe-858e-b099f7a1a0f8114.svg	\N	image/svg+xml	193	t	t	2026-02-18 05:27:03	2026-02-18 05:27:03	\N	\N
728	240	\N	\N	\N	page_section_images/a11b7459-d2de-4c2f-8aae-673cc41c9833323.svg	\N	image/svg+xml	213	t	t	2026-02-18 05:34:42	2026-02-18 05:34:42	\N	\N
729	241	\N	\N	\N	page_section_images/a11b74be-58e0-4485-9042-ef0184cfac4e330.svg	\N	image/svg+xml	223	t	t	2026-02-18 05:35:48	2026-02-18 05:35:48	\N	\N
730	242	\N	\N	\N	page_section_images/a11b754c-1394-4555-9717-e224f3f3ddbb107.svg	\N	image/svg+xml	14865	t	t	2026-02-18 05:37:21	2026-02-18 05:37:21	\N	\N
731	243	\N	\N	\N	page_section_images/a11b75cc-ed61-4bc0-8fa1-193dd30cb44a442.svg	\N	image/svg+xml	161	t	t	2026-02-18 05:38:45	2026-02-18 05:38:45	\N	\N
732	244	\N	\N	\N	page_section_images/a11b7679-53a0-4e22-9248-357787fb6ee842.svg	\N	image/svg+xml	201	t	t	2026-02-18 05:40:38	2026-02-18 05:40:38	\N	\N
846	150	\N	\N	\N	projects/a127c67f-e4ea-4116-8781-c561ee1f1727490.jpg	\N	image/jpeg	312052	f	t	2026-02-24 08:34:20	2026-02-24 08:34:20	\N	\N
733	246	\N	\N	\N	page_section_images/a11b7b36-2dc7-49d5-bcb3-e1dbbe9f1ec0375.svg	\N	image/svg+xml	324	t	t	2026-02-18 05:53:53	2026-02-18 05:53:53	\N	\N
734	247	\N	\N	\N	page_section_images/a11b7d68-a60b-40f1-9748-fba4ee1ca0be393.svg	\N	image/svg+xml	588	t	t	2026-02-18 06:00:01	2026-02-18 06:00:01	\N	\N
735	248	\N	\N	\N	page_section_images/a11b7dc5-f14b-4ea4-8e56-59eb700cc980469.svg	\N	image/svg+xml	209	t	t	2026-02-18 06:01:03	2026-02-18 06:01:03	\N	\N
789	491	\N	\N	\N	tanlov/a125adc1-a7f3-4056-b90e-3b86b9f5060b115.jpg	\N	image/jpeg	10879	t	t	2026-02-23 07:33:30	2026-02-23 07:33:33	\N	\N
738	258	\N	\N	\N	page_section_images/a11b9295-bbe3-4882-9455-8b6f661f9b14283.svg	\N	image/svg+xml	182	t	t	2026-02-18 06:59:14	2026-02-18 07:01:43	\N	\N
792	494	\N	\N	\N	tanlov/a125b2ad-528f-4dc8-993b-d33b510cee9c43.png	\N	image/png	429656	t	t	2026-02-23 07:47:15	2026-02-23 07:47:18	\N	\N
739	245	\N	\N	\N	tanlov/a11b96f2-fe49-4529-b729-fe8f33c85fee331.svg	\N	image/svg+xml	183	t	t	2026-02-18 07:11:26	2026-02-18 07:11:29	\N	\N
794	232	\N	\N	\N	tanlov/a125b566-e753-44dd-a2e5-449a68167d1e94.png	\N	image/png	701436	t	t	2026-02-23 07:54:52	2026-02-23 07:54:59	\N	\N
795	497	19	tashkilotlar	tashkilot	page_section_images/a125b628-9cc8-4302-9bff-6ae3514c3d74262.jpg	\N	image/jpeg	71556	f	t	2026-02-23 07:56:59	2026-02-23 07:57:15	\N	\N
740	259	\N	\N	\N	tanlov/a11b98c4-e9bd-40ee-9788-80ec954d3ea3357.svg	\N	image/svg+xml	9668	t	t	2026-02-18 07:16:32	2026-02-18 07:16:35	\N	\N
797	498	497	Tashkilot haqida	nomi-7	page_section_images/a125d4e9-e595-42d2-af36-49ace2f3c91b152.jpg	\N	image/jpeg	71556	t	t	2026-02-23 09:22:59	2026-02-23 09:22:59	\N	\N
741	260	\N	\N	\N	tanlov/a11b9906-1131-4692-ad21-8b5939fa46ea171.svg	\N	image/svg+xml	15577	t	t	2026-02-18 07:17:15	2026-02-18 07:17:18	\N	\N
796	497	\N	\N	\N	tanlov/a125b63e-aee1-4e6b-916b-c6332be7a208275.jpeg	\N	image/jpeg	4479	t	t	2026-02-23 07:57:14	2026-02-23 07:57:17	\N	\N
761	469	\N	\N	\N	tanlov/a11f7a04-4369-4b72-8a98-bcfda05aabc371.png	\N	image/png	184495	t	t	2026-02-20 05:33:51	2026-02-20 05:33:55	\N	\N
759	465	\N	\N	\N	tanlov/a11f6a86-82c6-44f6-be2a-d91aa29f3b3e315.jpg	\N	image/jpeg	9336	t	t	2026-02-20 04:50:32	2026-02-20 04:50:35	\N	\N
742	261	\N	\N	\N	tanlov/a11b999a-28b3-4a37-9400-88e8d9c65ec9214.svg	\N	image/svg+xml	9835	t	t	2026-02-18 07:18:52	2026-02-18 07:18:55	\N	\N
800	501	500	Tashkilot haqida	nomi-7	page_section_images/a125da6a-b56f-449f-b908-65581928fdf5294.jpg	\N	image/jpeg	56064	t	t	2026-02-23 09:38:22	2026-02-23 09:38:22	\N	\N
798	499	\N	\N	\N	tanlov/a125d6be-b584-4e96-b781-18c09b422e4e117.jpg	\N	image/jpeg	22610	t	t	2026-02-23 09:28:06	2026-02-23 09:28:09	\N	\N
763	190	\N	\N	\N	cc/a11f81bb-d22c-4e78-9cf1-b30636229c1f324.png	\N	image/png	412342	t	t	2026-02-20 05:55:26	2026-02-20 05:55:34	\N	\N
799	500	19	tashkilotlar	tashkilot	page_section_images/a125d7cf-1867-4129-acc6-eeddd7fa4aeb469.jpg	\N	image/jpeg	56064	t	t	2026-02-23 09:31:05	2026-02-23 09:31:05	\N	\N
765	470	\N	\N	\N	tanlov/a11f892b-5697-45c7-a50c-03a6c4282ca8321.jpg	\N	image/jpeg	14336	t	t	2026-02-20 06:16:13	2026-02-20 06:16:17	\N	\N
767	471	\N	\N	\N	tanlov/a11f8de4-d40a-45ed-a181-fa67a001bc22415.jpg	\N	image/jpeg	116410	t	t	2026-02-20 06:29:26	2026-02-20 06:29:29	\N	\N
802	163	\N	\N	\N	newspaper/a125e091-dfc4-483f-adb1-a1ec99bf5b93419.pdf	\N	application/pdf	815	f	t	2026-02-23 09:55:35	2026-02-23 09:55:36	\N	\N
771	474	\N	\N	\N	tanlov/a11fa1a8-b748-4316-aba2-5487316ae298489.jpg	\N	image/jpeg	14336	t	t	2026-02-20 07:24:42	2026-02-20 07:24:45	\N	\N
777	477	\N	\N	\N	hymn/a11fc5af-826a-4c30-905b-7cd5e63d19d3392.ogg	\N	application/ogg	1350389	t	t	2026-02-20 09:05:26	2026-02-20 09:05:29	\N	\N
803	162	\N	\N	\N	newspaper/a125e0bc-a39d-46f2-930d-24d67984b6e5116.pdf	\N	application/pdf	815	f	t	2026-02-23 09:56:03	2026-02-23 09:56:03	\N	\N
778	476	\N	\N	\N	emblem/a11fc7fa-91b0-44eb-9835-9a229915b1fc51.jpg	\N	image/jpeg	123118	t	t	2026-02-20 09:11:51	2026-02-20 09:11:54	\N	\N
804	162	\N	\N	\N	newspaper/a125e0ce-0e37-491c-8fd3-c443d387bd7c316.png	\N	image/png	850369	t	t	2026-02-23 09:56:14	2026-02-23 09:56:17	\N	\N
780	479	\N	\N	\N	tanlov/a11ffeae-f145-405e-afb2-4179ed1b5a9413.jpg	\N	image/jpeg	6010	t	t	2026-02-20 11:44:49	2026-02-20 11:44:52	\N	\N
782	483	481	Rahbar	rahbar-5	page_section_images/a1201729-ccdd-4b6c-a3fd-81b22e40b4c2306.jpg	\N	image/jpeg	116402	t	t	2026-02-20 12:53:16	2026-02-20 12:53:16	\N	\N
806	161	\N	\N	\N	newspaper/a125e0e3-cb61-4ac3-b916-cbdbf0446eb2409.pdf	\N	application/pdf	815	f	t	2026-02-23 09:56:28	2026-02-23 09:56:28	\N	\N
784	468	\N	\N	\N	tanlov/a1257ffe-a1af-4ccc-bc0d-db0ee46eb8c2465.jpg	\N	image/jpeg	1124932	t	t	2026-02-23 05:25:32	2026-02-23 05:25:35	\N	\N
847	150	\N	\N	\N	projects/a127c67f-e697-4e3d-96a9-b43f9291d06a278.jpg	\N	image/jpeg	292604	f	t	2026-02-24 08:34:20	2026-02-24 08:34:20	\N	\N
848	150	\N	\N	\N	projects/a127c67f-e84c-435a-abd2-5d660ea69033361.jpg	\N	image/jpeg	175507	f	t	2026-02-24 08:34:20	2026-02-24 08:34:20	\N	\N
805	161	\N	\N	\N	newspaper/a125e0dd-a013-4642-a249-a86970a8d03d94.png	\N	image/png	850369	t	t	2026-02-23 09:56:24	2026-02-23 09:56:32	\N	\N
850	150	\N	\N	\N	projects/a127c67f-eb28-44be-aded-3670723f67c117.jpg	\N	image/jpeg	241750	f	t	2026-02-24 08:34:20	2026-02-24 08:34:20	\N	\N
851	150	\N	\N	\N	projects/a127c67f-ecaa-4ce0-a030-55604ca633b9222.jpg	\N	image/jpeg	127413	f	t	2026-02-24 08:34:20	2026-02-24 08:34:20	\N	\N
852	150	\N	\N	\N	projects/a127c67f-edd7-495a-9237-9b05f7582716276.jpg	\N	image/jpeg	281092	f	t	2026-02-24 08:34:20	2026-02-24 08:34:20	\N	\N
807	148	\N	\N	\N	projects/a12611d1-b582-42bc-9ad4-63e0d66b5e3b183.png	\N	image/png	584803	t	t	2026-02-23 12:13:17	2026-02-23 12:13:19	\N	\N
853	150	\N	\N	\N	projects/a127c67f-ef0b-44d8-955d-c2422b37e3be450.jpg	\N	image/jpeg	351322	f	t	2026-02-24 08:34:20	2026-02-24 08:34:20	\N	\N
854	150	\N	\N	\N	projects/a127c67f-f07e-4ef7-a858-d87c2634276b5.jpg	\N	image/jpeg	294309	f	t	2026-02-24 08:34:20	2026-02-24 08:34:20	\N	\N
855	150	\N	\N	\N	projects/a127c67f-f1b3-4bbe-825a-f185415dd72a242.jpg	\N	image/jpeg	352301	f	t	2026-02-24 08:34:20	2026-02-24 08:34:20	\N	\N
808	502	\N	\N	\N	tanlov/a126155f-347c-458f-a64e-b69fbd31d861464.jpg	\N	image/jpeg	56812	t	t	2026-02-23 12:23:13	2026-02-23 12:23:17	\N	\N
809	503	19	tashkilotlar	tashkilot	page_section_images/a126166a-0bcb-4975-a6cd-146f4ef50552469.jpg	\N	image/jpeg	32221	t	t	2026-02-23 12:26:08	2026-02-23 12:26:08	\N	\N
856	150	\N	\N	\N	projects/a127c67f-f2ea-4955-8f39-a2ef70b4a1a918.jpg	\N	image/jpeg	196932	f	t	2026-02-24 08:34:20	2026-02-24 08:34:20	\N	\N
857	150	\N	\N	\N	projects/a127c67f-f42a-4237-aa12-9f3953bd4936214.jpg	\N	image/jpeg	54244	f	t	2026-02-24 08:34:20	2026-02-24 08:34:20	\N	\N
858	150	\N	\N	\N	projects/a127c67f-f51f-4b19-b4b0-9973a76f2fdb98.jpg	\N	image/jpeg	282221	f	t	2026-02-24 08:34:20	2026-02-24 08:34:20	\N	\N
849	150	\N	\N	\N	projects/a127c67f-e9c0-458e-97d4-82839e1feba6180.jpg	\N	image/jpeg	145878	t	t	2026-02-24 08:34:20	2026-02-24 08:34:57	\N	\N
869	522	156	Yillar	yillar-1	page_section_images/a127c82f-add7-46b6-87ff-79bd44fdd388296.jpg	\N	image/jpeg	191725	f	t	2026-02-24 08:39:03	2026-02-24 08:39:03	11	\N
870	522	156	Yillar	yillar-1	page_section_images/a127c82f-af09-4806-a60a-ebffa767bb9b461.jpg	\N	image/jpeg	191725	f	t	2026-02-24 08:39:03	2026-02-24 08:39:03	12	\N
810	507	503	Rahbar	rahbar-5	page_section_images/a1276ce3-1ad0-4e81-ad95-38cf5453a235319.jpg	\N	image/jpeg	65730	t	t	2026-02-24 04:23:46	2026-02-24 04:23:46	1	\N
871	522	156	Yillar	yillar-1	page_section_images/a127c82f-b070-43c3-a069-3d148c2e24bd179.jpg	\N	image/jpeg	210551	f	t	2026-02-24 08:39:03	2026-02-24 08:39:03	13	\N
872	522	156	Yillar	yillar-1	page_section_images/a127c82f-b1a1-45ee-89fb-d4ce4cd1152111.jpg	\N	image/jpeg	307629	f	t	2026-02-24 08:39:03	2026-02-24 08:39:03	14	\N
821	513	19	tashkilotlar	tashkilot	page_section_images/a12783ed-d696-4f49-bf8c-999ebcc9e214134.jpg	\N	image/jpeg	15026	t	t	2026-02-24 05:28:11	2026-02-24 05:28:11	1	\N
873	522	156	Yillar	yillar-1	page_section_images/a127c82f-b2c1-4144-956c-646de04d14ec149.jpg	\N	image/jpeg	127634	f	t	2026-02-24 08:39:03	2026-02-24 08:39:03	15	\N
874	522	156	Yillar	yillar-1	page_section_images/a127c82f-b372-4b25-b92b-5197e93030bb500.jpg	\N	image/jpeg	121972	f	t	2026-02-24 08:39:03	2026-02-24 08:39:03	16	\N
811	506	\N	\N	\N	tanlov/a1276dba-b7bc-4a0e-acbb-d6e46b31c543172.jpg	\N	image/jpeg	32221	t	t	2026-02-24 04:26:07	2026-02-24 04:26:10	\N	\N
876	523	19	tashkilotlar	tashkilot	page_section_images/a127f734-8479-4d11-a733-e8f7789747f35.jpg	\N	image/jpeg	53410	t	t	2026-02-24 10:50:32	2026-02-24 10:50:32	1	\N
877	524	523	Tashkilot haqida	nomi-7	page_section_images/a127f8e3-99be-4b73-ab8f-20ec200b7002218.jpg	\N	image/jpeg	53410	t	t	2026-02-24 10:55:14	2026-02-24 10:55:14	1	\N
878	525	\N	\N	\N	page_section_images/a12816bd-5e41-4d64-9517-456e6330be05293.jpg	\N	image/jpeg	30933	t	t	2026-02-24 12:18:42	2026-02-24 12:18:42	1	\N
879	526	\N	\N	\N	page_section_images/a1281bd4-d32c-4896-9aa5-56fbd7d7ab79423.jpg	\N	image/jpeg	2024915	t	t	2026-02-24 12:32:56	2026-02-24 12:32:56	1	\N
822	515	513	Rahbar	rahbar-5	page_section_images/a127914c-df7a-4cad-b118-8f595643f79391.jpg	\N	image/jpeg	94132	t	t	2026-02-24 06:05:35	2026-02-24 06:05:35	1	\N
815	227	\N	\N	\N	projects/a127756d-0515-4f55-82f5-066504b43891222.png	\N	image/png	1221801	t	t	2026-02-24 04:47:38	2026-02-24 04:47:47	\N	\N
816	508	\N	\N	\N	projects/a12775f9-36b1-4eff-9547-23e5e0a90dd9127.mp4	\N	video/mp4	30400802	f	t	2026-02-24 04:49:10	2026-02-24 04:49:10	\N	\N
817	509	\N	\N	\N	projects/a127760f-5ef0-49bf-9d9c-9f161316d7623.mp4	\N	video/mp4	30400802	f	t	2026-02-24 04:49:25	2026-02-24 04:49:25	\N	\N
818	510	19	tashkilotlar	tashkilot	page_section_images/a1277e53-c0cc-45ab-9edf-d0ef3f6378c187.jpg	\N	image/jpeg	159975	t	t	2026-02-24 05:12:32	2026-02-24 05:12:32	1	\N
819	511	510	Tashkilot haqida	nomi-7	page_section_images/a1277fe1-36e1-40a3-bcfd-824290e06d3f371.jpg	\N	image/jpeg	159975	t	t	2026-02-24 05:16:52	2026-02-24 05:16:52	1	\N
820	512	510	Rahbar	rahbar-5	page_section_images/a127816b-2f70-4fb6-99ca-e07936ba9abf271.jpg	\N	image/jpeg	249370	t	t	2026-02-24 05:21:10	2026-02-24 05:21:10	1	\N
823	514	\N	\N	\N	tanlov/a127916b-1ab3-4707-b421-fcbfd5eaf34616.jpg	\N	image/jpeg	15026	t	t	2026-02-24 06:05:55	2026-02-24 06:05:58	\N	\N
824	516	19	tashkilotlar	tashkilot	page_section_images/a1279504-d2f9-49a0-918a-05530d5c16e688.jpg	\N	image/jpeg	23180	t	t	2026-02-24 06:15:59	2026-02-24 06:15:59	1	\N
825	517	516	Tashkilot haqida	nomi-7	page_section_images/a1279965-6934-4b16-8d42-e755da855e91273.jpg	\N	image/jpeg	23180	t	t	2026-02-24 06:28:13	2026-02-24 06:28:13	1	\N
826	518	516	Rahbar	rahbar-5	page_section_images/a1279a7a-7a80-4a01-8c01-55caa97e688f402.jpg	\N	image/jpeg	474381	t	t	2026-02-24 06:31:15	2026-02-24 06:31:15	1	\N
73	14	\N	\N	\N	page_section_images/1766726046_f87cf5263832720cdbe41c7eb7faa98cae5c58a2.png	\N	image/png	786846	f	t	2025-12-26 05:14:06	2026-02-24 07:59:38	\N	\N
827	14	\N	\N	\N	leadership/a127ba15-4824-42e0-975e-141072502c5e369.jpeg	\N	image/jpeg	92135	t	t	2026-02-24 07:59:37	2026-02-24 07:59:41	\N	\N
880	527	\N	\N	\N	page_section_images/a1281d39-ebef-4cab-9f5b-1293534a8d1d414.png	\N	image/png	473775	t	t	2026-02-24 12:36:50	2026-02-24 12:36:50	1	\N
881	528	\N	\N	\N	page_section_images/a1281de3-a293-46c5-88dd-839196a29e7031.jpeg	\N	image/jpeg	7945	t	t	2026-02-24 12:38:42	2026-02-24 12:38:42	1	\N
882	529	\N	\N	\N	page_section_images/a1281e65-6840-4371-bef3-b47e75b57604279.png	\N	image/png	352143	t	t	2026-02-24 12:40:07	2026-02-24 12:40:07	1	\N
883	554	523	Rahbar	rahbar-5	page_section_images/a129d3b6-a4fe-4381-a27f-18c054246d4a286.jpg	page_section_images/compressed/a129d3b6-b952-4598-8d0e-4e5b92745f44123.jpg	image/jpeg	57849	t	t	2026-02-25 09:02:57	2026-02-25 09:02:57	1	\N
875	522	156	Yillar	yillar-1	page_section_images/a127c82f-b447-47bd-acc6-3d80dfb04805369.jpg	\N	image/jpeg	161689	f	t	2026-02-24 08:39:03	2026-02-25 09:07:09	17	\N
884	555	19	tashkilotlar	tashkilot	page_section_images/a129d7e0-a03f-4e44-9795-5fe7a441607e136.png	page_section_images/compressed/a129d7e0-a5ee-4364-822b-1d484f645935258.png	image/png	22857	t	t	2026-02-25 09:14:35	2026-02-25 09:14:35	1	\N
885	556	555	Tashkilot haqida	nomi-7	page_section_images/a129daa3-819a-4ae0-b5f0-40f513eeac7a365.png	page_section_images/compressed/a129daa3-869a-404d-8192-8578a14ca6b7486.png	image/png	22857	t	t	2026-02-25 09:22:18	2026-02-25 09:22:18	1	\N
886	557	555	Rahbar	rahbar-5	page_section_images/a129de72-f450-4752-b1ed-3296a947b787266.jpg	page_section_images/compressed/a129de73-0153-41e5-968a-23cbc74fa71e422.jpg	image/jpeg	16214	t	t	2026-02-25 09:32:58	2026-02-25 09:32:58	1	\N
887	148	\N	\N	\N	projects/a129f747-01b1-4cdf-8a50-1fd4e38ff2e0159.pdf	\N	application/pdf	142786	f	t	2026-02-25 10:42:23	2026-02-25 10:42:23	\N	\N
888	227	\N	\N	\N	projects/a129f907-5fae-4831-9333-150152e10376163.pdf	\N	application/pdf	142786	f	t	2026-02-25 10:47:17	2026-02-25 10:47:17	\N	\N
889	587	19	tashkilotlar	tashkilot	page_section_images/a129ff9c-c098-4d23-9956-d4c5f8d4a458315.png	page_section_images/compressed/a129ff9c-cac1-45ab-89d9-64aaaa7a33f4118.png	image/png	20635	t	t	2026-02-25 11:05:42	2026-02-25 11:05:42	1	\N
891	589	587	Tashkilot haqida	nomi-7	page_section_images/a12a04a7-2fc9-4c22-a25b-3e709723da2547.png	page_section_images/compressed/a12a04a7-39e5-4a74-a9e0-6815a5e40091393.png	image/png	20635	t	t	2026-02-25 11:19:47	2026-02-25 11:19:47	1	\N
892	590	587	Rahbar	rahbar-5	page_section_images/a12b716a-ecae-4cce-b915-1a6e10a3401a246.png	page_section_images/compressed/a12b716a-fd07-4e4c-8792-c08b8c0e0db518.png	image/png	40717	t	t	2026-02-26 04:19:45	2026-02-26 04:19:45	1	\N
893	591	19	tashkilotlar	tashkilot	page_section_images/a12b720b-df18-4531-9ab9-6e174964908a116.png	page_section_images/compressed/a12b720b-f0a6-4ee8-a05f-d516f9e48b0f426.png	image/png	222415	t	t	2026-02-26 04:21:30	2026-02-26 04:21:30	1	\N
\.


--
-- Data for Name: page_section_settings; Type: TABLE DATA; Schema: public; Owner: vatandoshlar_usr
--

COPY public.page_section_settings (id, menu_main_id, page_section_parent_id, category, category_slug, key, label, type, required, is_translatable, options, sort_order, relation, status, created_at, updated_at) FROM stdin;
1	2	\N	\N	\N	title	Title	text	t	t	\N	1	\N	t	2025-12-23 04:42:26	2025-12-23 04:42:26
2	2	\N	\N	\N	description	Description	text	t	t	\N	1	\N	t	2025-12-23 04:42:26	2025-12-23 04:42:26
3	3	\N	\N	\N	title	Title	text	t	t	\N	1	\N	t	2025-12-23 04:44:11	2025-12-23 04:44:11
4	3	\N	\N	\N	number	Number	text	t	f	\N	1	\N	t	2025-12-23 04:44:12	2025-12-23 04:44:12
5	4	\N	\N	\N	title	Title	text	t	t	\N	1	\N	t	2025-12-23 04:49:23	2025-12-23 04:49:23
6	4	\N	\N	\N	content	Content	text	t	t	\N	1	\N	t	2025-12-23 04:49:24	2025-12-23 04:49:24
7	4	\N	\N	\N	description	Description	text	t	t	\N	1	\N	t	2025-12-23 04:49:24	2025-12-23 04:49:24
8	4	\N	\N	\N	content1	Content1	text	t	t	\N	1	\N	t	2025-12-23 04:49:24	2025-12-23 04:49:24
9	11	\N	\N	\N	title	Title	text	t	t	\N	1	\N	t	2025-12-23 05:05:21	2025-12-23 05:05:21
10	11	\N	\N	\N	description	Description	text	t	t	\N	1	\N	t	2025-12-23 05:05:21	2025-12-23 05:05:21
11	12	\N	\N	\N	title	Title	text	t	t	\N	1	\N	t	2025-12-23 05:06:52	2025-12-23 05:06:52
12	7	\N	\N	\N	title	Title	text	t	t	\N	1	\N	t	2025-12-23 05:09:20	2025-12-23 05:09:20
13	7	\N	\N	\N	description	Description	text	t	t	\N	1	\N	t	2025-12-23 05:09:20	2025-12-23 05:09:20
14	9	\N	\N	\N	title	Title	text	t	t	\N	1	\N	t	2025-12-23 05:11:02	2025-12-23 05:11:02
15	9	\N	\N	\N	description	Description	text	t	t	\N	1	\N	t	2025-12-23 05:11:02	2025-12-23 05:11:02
16	10	\N	\N	\N	title	Title	text	t	t	\N	1	\N	t	2025-12-23 05:12:17	2025-12-23 05:12:17
17	10	\N	\N	\N	description	Description	text	t	t	\N	1	\N	t	2025-12-23 05:12:17	2025-12-23 05:12:17
151	36	\N	\N	\N	title	Title	text	t	t	\N	1	\N	t	2025-12-29 09:58:52	2025-12-29 09:58:52
63	16	\N	\N	\N	title	Title	text	t	t	\N	1	\N	t	2025-12-25 09:46:24	2025-12-25 09:46:24
20	18	\N	\N	\N	description	Description	textarea	t	t	\N	1	\N	t	2025-12-23 05:26:22	2025-12-23 05:26:44
21	18	\N	\N	\N	content	Content	textarea	t	t	\N	1	\N	t	2025-12-23 05:27:46	2025-12-23 05:27:46
22	19	\N	\N	\N	title	Title	text	t	t	\N	1	\N	t	2025-12-23 05:29:40	2025-12-23 05:29:40
23	14	\N	\N	\N	title	Title	text	t	t	\N	1	\N	t	2025-12-23 05:31:09	2025-12-23 05:31:09
24	14	\N	\N	\N	phone	Phone	text	t	f	\N	1	\N	t	2025-12-23 05:31:09	2025-12-23 05:31:09
25	14	\N	\N	\N	email	Email	text	t	f	\N	1	\N	t	2025-12-23 05:31:09	2025-12-23 05:31:09
26	15	\N	\N	\N	title	Title	text	t	t	\N	1	\N	t	2025-12-23 05:33:37	2025-12-23 05:33:37
27	23	\N	\N	\N	title	Title	text	t	t	\N	1	\N	t	2025-12-23 05:45:15	2025-12-23 05:45:15
28	22	\N	\N	\N	title	Title	textarea	t	t	\N	1	\N	t	2025-12-23 05:45:51	2025-12-23 05:45:51
154	41	\N	\N	\N	title	Title	text	t	t	\N	1	\N	t	2025-12-29 12:33:13	2025-12-29 12:33:13
635	63	\N	\N	\N	desc	Description	textarea-editor	t	t	\N	1	\N	t	2026-02-25 04:58:34	2026-02-25 04:58:34
31	23	21	Nomi	nomi	date_at	Date_at	text	t	f	\N	1	\N	t	2025-12-23 05:54:40	2025-12-23 05:54:58
33	23	21	Rahbar	rahbar	title	Title	text	t	t	\N	1	\N	t	2025-12-23 05:56:49	2025-12-23 05:56:49
34	23	21	Rahbar	rahbar	phone	Phone	text	t	f	\N	1	\N	t	2025-12-23 05:56:49	2025-12-23 05:56:49
35	23	21	Rahbar	rahbar	email	Email	text	t	f	\N	1	\N	t	2025-12-23 05:56:49	2025-12-23 05:56:49
36	23	24	Nomi	nomi-1	title	Title	text	t	t	\N	1	\N	t	2025-12-23 05:58:58	2025-12-23 05:58:58
39	23	24	Rahbar	rahbar-1	title	Title	text	t	t	\N	1	\N	t	2025-12-23 06:00:15	2025-12-23 06:00:15
40	23	24	Rahbar	rahbar-1	phone	Phone	text	t	f	\N	1	\N	t	2025-12-23 06:00:15	2025-12-23 06:00:15
41	23	24	Rahbar	rahbar-1	email	Email	text	t	f	\N	1	\N	t	2025-12-23 06:00:15	2025-12-23 06:00:15
46	23	27	Rahbar	rahbar-2	title	Title	text	t	t	\N	1	\N	t	2025-12-23 06:04:49	2025-12-23 06:04:49
48	23	27	Rahbar	rahbar-2	email	Email	text	t	f	\N	1	\N	t	2025-12-23 06:04:49	2025-12-23 06:04:49
49	23	30	Nomi	nomi-3	title	Title	text	t	t	\N	1	\N	t	2025-12-23 06:06:54	2025-12-23 06:06:54
52	23	30	Rahbar	rahbar-3	title	Title	text	t	t	\N	1	\N	t	2025-12-23 06:08:04	2025-12-23 06:08:04
53	23	30	Rahbar	rahbar-3	phone	Phone	text	t	f	\N	1	\N	t	2025-12-23 06:08:04	2025-12-23 06:08:04
54	23	30	Rahbar	rahbar-3	email	Email	text	t	f	\N	1	\N	t	2025-12-23 06:08:04	2025-12-23 06:08:04
55	26	\N	\N	\N	title	Title	text	t	t	\N	1	\N	t	2025-12-23 06:20:02	2025-12-23 06:20:02
58	27	\N	\N	\N	title	Title	text	t	t	\N	1	\N	t	2025-12-23 06:21:59	2025-12-23 06:21:59
18	17	\N	\N	\N	description	Description	text	t	t	\N	1	\N	t	2025-12-23 05:18:57	2025-12-25 08:28:51
19	18	\N	\N	\N	title	Title	text	t	t	\N	1	\N	t	2025-12-23 05:26:22	2025-12-25 08:30:29
59	24	\N	\N	\N	title	Title	text	t	t	\N	1	\N	t	2025-12-25 08:46:46	2025-12-25 08:46:46
60	24	\N	\N	\N	description	Description	text	t	t	\N	1	\N	t	2025-12-25 08:46:46	2025-12-25 08:46:46
61	24	\N	\N	\N	content	Content	text	t	t	\N	1	\N	t	2025-12-25 08:46:46	2025-12-25 08:46:46
29	23	456	tashkilotlar	tashkilot	title	Title	text	t	f	\N	1	\N	t	2025-12-23 05:53:34	2026-02-20 06:42:48
65	6	\N	\N	\N	title	Title	text	t	t	\N	1	\N	t	2025-12-25 09:55:32	2025-12-25 09:55:32
66	6	\N	\N	\N	description	Description	text	t	t	\N	1	\N	t	2025-12-25 09:55:32	2025-12-25 09:55:32
67	6	\N	\N	\N	url	Url	text	t	t	\N	1	\N	t	2025-12-25 13:17:35	2025-12-25 13:17:35
68	28	\N	\N	\N	title	Title	text	t	t	\N	1	\N	t	2025-12-25 13:21:49	2025-12-25 13:21:49
69	28	\N	\N	\N	url	Url	text	t	t	\N	1	\N	t	2025-12-25 13:21:49	2025-12-25 13:21:49
70	29	\N	\N	\N	title	Title	text	t	t	\N	1	\N	t	2025-12-25 13:23:00	2025-12-25 13:23:00
71	29	\N	\N	\N	description	Description	text	t	t	\N	1	\N	t	2025-12-25 13:23:00	2025-12-25 13:23:00
72	30	\N	\N	\N	title	Title	text	t	t	\N	1	\N	t	2025-12-25 13:31:28	2025-12-25 13:31:28
45	23	27	Nomi	nomi-2	boss_at	Boss_at	text	t	f	\N	1	\N	t	2025-12-23 06:03:21	2025-12-29 09:23:20
74	31	\N	\N	\N	title	Title	text	t	t	\N	1	\N	t	2025-12-25 13:35:17	2025-12-25 13:35:17
75	31	\N	\N	\N	description	Description	text	t	t	\N	1	\N	t	2025-12-25 13:35:17	2025-12-25 13:35:17
62	24	\N	\N	\N	url	Url	text	t	f	\N	1	\N	t	2025-12-25 08:46:46	2026-01-22 12:02:43
64	16	\N	\N	\N	description	Description	textarea-editor	t	t	\N	1	\N	t	2025-12-25 09:46:24	2026-01-23 14:05:54
622	22	18	categ 3	categoriys-2	title	Title	text	t	t	\N	1	\N	t	2026-02-19 09:30:47	2026-02-23 04:17:07
47	23	27	Rahbar	rahbar-2	phone	Phone	text	t	f	\N	1	\N	t	2025-12-23 06:04:49	2025-12-29 09:25:27
76	27	\N	\N	\N	url	Url	text	t	f	\N	1	\N	t	2025-12-26 05:11:06	2025-12-26 05:12:04
77	14	\N	\N	\N	description	Description	text	t	t	\N	1	\N	t	2025-12-26 05:16:30	2025-12-26 05:16:30
78	7	\N	\N	\N	url	Url	text	t	f	\N	1	\N	t	2025-12-26 05:18:39	2025-12-26 05:21:46
634	38	150	Video	video-15	date_at	O'tkazilgan kun	datetime-local	t	f	\N	1	\N	t	2026-02-24 04:42:13	2026-02-24 04:42:59
80	9	\N	\N	\N	url	Url	text	t	f	\N	1	\N	t	2025-12-26 05:27:34	2025-12-26 05:29:14
139	23	232	Rahbar	rahbar-5	title	Title	text	t	t	\N	1	\N	t	2025-12-29 08:20:39	2026-02-19 11:21:35
140	23	232	Rahbar	rahbar-5	phone	Phone	text	t	f	\N	1	\N	t	2025-12-29 08:20:39	2026-02-19 11:21:35
73	30	\N	\N	\N	url	Url	text	t	f	\N	1	\N	t	2025-12-25 13:31:28	2025-12-26 09:35:27
83	30	52	Url	url	url	Url	text	t	f	\N	1	\N	t	2025-12-26 11:09:36	2025-12-26 11:09:49
141	23	232	Rahbar	rahbar-5	email	Email	text	t	f	\N	1	\N	t	2025-12-29 08:20:39	2026-02-19 11:21:35
85	32	\N	\N	\N	title	Title	text	t	t	\N	1	\N	t	2025-12-26 13:16:02	2025-12-26 13:16:02
86	32	\N	\N	\N	description	Description	text	t	t	\N	1	\N	t	2025-12-26 13:16:02	2025-12-26 13:16:02
88	33	\N	\N	\N	path	Path	text	t	f	\N	1	\N	t	2025-12-26 13:18:29	2025-12-26 13:21:25
89	33	\N	\N	\N	description	Description	text	t	t	\N	1	\N	t	2025-12-26 13:37:38	2025-12-26 13:40:01
87	33	\N	\N	\N	title	Title	text	t	t	\N	1	\N	t	2025-12-26 13:18:29	2025-12-26 13:42:31
90	33	60	video	video	url	Url	text	t	f	\N	1	\N	t	2025-12-26 13:55:22	2025-12-26 13:55:22
91	33	61	video	video-1	url	Url	text	t	f	\N	1	\N	t	2025-12-26 13:57:14	2025-12-26 13:57:14
92	33	62	video	video-2	url	Url	text	t	f	\N	1	\N	t	2025-12-26 14:17:16	2025-12-26 14:17:16
93	33	63	video	video-3	url	Url	text	t	f	\N	1	\N	t	2025-12-26 14:18:35	2025-12-26 14:18:35
94	33	64	video	video-4	url	Url	text	t	f	\N	1	\N	t	2025-12-26 14:19:53	2025-12-26 14:19:53
95	33	65	video	video-5	url	Url	text	t	t	\N	1	\N	t	2025-12-26 14:21:29	2025-12-26 14:21:29
96	33	65	video	video-5	url	Url	text	t	f	\N	1	\N	t	2025-12-26 14:22:03	2025-12-26 14:22:03
97	33	65	video	video-5	url	Url	text	t	f	\N	1	\N	t	2025-12-26 14:23:15	2025-12-26 14:23:15
98	33	89	video	video-6	url	Url	text	t	f	\N	1	\N	t	2025-12-26 14:25:38	2025-12-26 14:25:38
99	33	66	video	video-7	url	Url	text	t	f	\N	1	\N	t	2025-12-26 14:27:12	2025-12-26 14:27:12
100	33	67	video	video-8	url	Url	text	t	f	\N	1	\N	t	2025-12-26 14:28:24	2025-12-26 14:28:24
101	33	68	video	video-9	url	Url	text	t	f	\N	1	\N	t	2025-12-26 14:29:34	2025-12-26 14:29:34
102	33	69	video	video-10	url	Url	text	t	f	\N	1	\N	t	2025-12-26 14:30:36	2025-12-26 14:30:36
103	33	70	video	video-11	url	Url	text	t	f	\N	1	\N	t	2025-12-26 14:31:52	2025-12-26 14:31:52
104	33	71	video	video-12	url	Url	text	t	f	\N	1	\N	t	2025-12-26 14:33:03	2025-12-26 14:33:03
105	33	72	video	video-13	url	Url	text	t	f	\N	1	\N	t	2025-12-26 14:34:36	2025-12-26 14:34:36
106	33	73	video	video-14	url	Url	text	t	f	\N	1	\N	t	2025-12-26 14:35:42	2025-12-26 14:35:42
107	33	\N	\N	\N	code	Code	text	t	f	\N	1	\N	t	2025-12-27 07:01:08	2025-12-27 07:01:39
108	33	\N	\N	\N	offset	Offset	text	t	f	\N	1	\N	t	2025-12-27 07:28:52	2025-12-27 07:28:52
109	33	66	video	video-7	title	title	text	t	t	\N	1	\N	t	2025-12-27 14:22:41	2025-12-27 14:22:41
110	35	\N	\N	\N	title	Title	text	t	t	\N	1	\N	t	2025-12-27 18:32:28	2025-12-27 18:33:36
111	33	60	video	video	title	Title	text	t	t	\N	1	\N	t	2025-12-28 06:09:32	2025-12-28 06:09:56
112	33	61	video	video-1	title	Title	text	t	t	\N	1	\N	t	2025-12-28 06:11:24	2025-12-28 06:11:24
113	33	62	video	video-2	title	Title	text	t	t	\N	1	\N	t	2025-12-28 06:13:42	2025-12-28 06:13:42
114	33	63	video	video-3	title	Title	text	t	t	\N	1	\N	t	2025-12-28 06:16:04	2025-12-28 06:16:04
115	33	64	video	video-4	title	Title	text	t	t	\N	1	\N	t	2025-12-28 06:21:38	2025-12-28 06:21:38
116	33	89	video	video-6	title	Title	text	t	t	\N	1	\N	t	2025-12-28 06:23:04	2025-12-28 06:23:04
117	33	67	video	video-8	title	Title	text	t	t	\N	1	\N	t	2025-12-28 06:25:02	2025-12-28 06:25:02
118	33	68	video	video-9	title	Title	text	t	t	\N	1	\N	t	2025-12-28 06:26:49	2025-12-28 06:26:49
119	33	69	video	video-10	title	Title	text	t	t	\N	1	\N	t	2025-12-28 06:28:30	2025-12-28 06:28:30
120	33	70	video	video-11	title	Title	text	t	t	\N	1	\N	t	2025-12-28 06:30:21	2025-12-28 06:30:21
121	33	71	video	video-12	title	Title	text	t	t	\N	1	\N	t	2025-12-28 06:31:38	2025-12-28 06:31:38
122	23	121	Nomi	nomi-4	title	Title	text	t	t	\N	1	\N	t	2025-12-29 08:02:16	2025-12-29 08:02:16
636	63	530	child	child	title	Title	text	t	t	\N	1	\N	t	2026-02-25 05:12:25	2026-02-25 05:12:25
126	23	121	Rahbar	rahbar-4	title	Title	text	t	t	\N	1	\N	t	2025-12-29 08:05:03	2025-12-29 08:05:03
127	23	121	Rahbar	rahbar-4	description	Description	text	t	t	\N	1	\N	t	2025-12-29 08:05:03	2025-12-29 08:05:04
128	23	121	Rahbar	rahbar-4	phone	Phone	text	t	f	\N	1	\N	t	2025-12-29 08:05:04	2025-12-29 08:05:04
129	23	121	Rahbar	rahbar-4	email	Email	text	t	t	\N	1	\N	t	2025-12-29 08:05:04	2025-12-29 08:05:04
130	23	21	Rahbar	rahbar	description	Description	text	t	t	\N	1	\N	t	2025-12-29 08:10:55	2025-12-29 08:10:55
138	23	125	Nomi	nomi-6	boss_at	Boss_at	text	t	f	\N	1	\N	t	2025-12-29 08:18:18	2025-12-29 08:18:18
148	23	27	Rahbar	rahbar-2	description	Description	text	t	t	\N	1	\N	t	2025-12-29 09:25:27	2025-12-29 09:25:27
84	30	52	Url	url	title	Title	text	t	t	\N	1	\N	t	2025-12-26 11:29:17	2026-01-22 09:34:40
134	23	465	Tashkilot haqida	nomi-5	description	Description	text	t	t	\N	1	\N	t	2025-12-29 08:14:48	2026-02-20 06:43:10
633	38	150	Video	video-15	title	Title	text	t	t	\N	1	\N	t	2026-02-24 04:42:13	2026-02-24 04:42:13
641	64	\N	\N	\N	key	Key	text	t	f	\N	4	\N	t	2026-02-25 05:49:32	2026-02-25 05:51:44
143	23	125	Rahbar	rahbar-6	title	Title	text	t	t	\N	1	\N	t	2025-12-29 08:21:37	2025-12-29 08:21:37
144	23	125	Rahbar	rahbar-6	description	Description	text	t	t	\N	1	\N	t	2025-12-29 08:21:37	2025-12-29 08:21:37
145	23	125	Rahbar	rahbar-6	email	Email	text	t	f	\N	1	\N	t	2025-12-29 08:21:37	2025-12-29 08:21:37
150	23	30	Rahbar	rahbar-3	description	Description	text	t	t	\N	1	\N	t	2025-12-29 09:28:27	2025-12-29 09:28:48
146	23	125	Rahbar	rahbar-6	phone	Phone	text	t	f	\N	1	\N	t	2025-12-29 08:21:37	2025-12-29 08:21:37
152	40	\N	\N	\N	title	Title	text	t	t	\N	1	\N	t	2025-12-29 12:26:42	2025-12-29 12:26:42
164	38	156	Yillar	yillar-2	title	Title	text	t	t	\N	1	\N	t	2025-12-30 16:49:30	2026-02-24 08:15:23
153	40	\N	\N	\N	url	Url	text	t	f	\N	1	\N	t	2025-12-29 12:26:42	2025-12-29 12:26:42
155	41	\N	\N	\N	year	Year	text	t	f	\N	1	\N	t	2025-12-29 12:33:13	2025-12-29 12:33:13
156	41	135	Bu mavsumga tegishli rasmlar	bu-mavsumga-tegishli-rasmlar	title	Title	text	t	t	\N	1	\N	t	2025-12-29 12:42:03	2025-12-29 12:42:03
157	41	139	2024-rasmlar	2024-rasmlar	title	Title	text	t	t	\N	1	\N	t	2025-12-29 12:44:58	2025-12-29 12:44:58
158	42	\N	\N	\N	title	Title	textarea-editor	t	t	\N	1	\N	t	2025-12-30 06:18:45	2025-12-30 06:18:45
160	38	\N	\N	\N	description	Description	text	t	t	\N	1	\N	t	2025-12-30 15:59:51	2025-12-30 15:59:51
142	23	232	Rahbar	rahbar-5	description	Description	text	t	t	\N	1	\N	t	2025-12-29 08:20:39	2026-02-19 11:21:35
162	38	144	Yillar	yillar	title	Title	text	t	t	\N	1	\N	t	2025-12-30 16:03:09	2025-12-30 16:03:09
163	38	148	Yillar	yillar-1	title	Title	text	t	t	\N	1	\N	t	2025-12-30 16:46:43	2025-12-30 16:46:43
165	43	\N	\N	\N	name	Name	text	t	t	\N	1	\N	t	2025-12-30 20:07:06	2025-12-30 20:07:06
166	43	\N	\N	\N	description	Description	textarea	t	t	\N	1	\N	t	2025-12-30 20:07:06	2025-12-30 20:07:06
167	43	\N	\N	\N	email	Email	text	t	f	\N	1	\N	t	2025-12-30 20:07:06	2025-12-30 20:07:06
168	43	\N	\N	\N	phone	Phone	text	t	f	\N	1	\N	t	2025-12-30 20:07:07	2025-12-30 20:07:07
170	46	\N	\N	\N	title	Title	text	t	t	\N	1	\N	t	2026-01-05 04:58:31	2026-01-05 04:58:31
172	45	\N	\N	\N	title	Title	text	t	t	\N	1	\N	t	2026-01-05 05:37:20	2026-01-05 05:37:20
173	45	\N	\N	\N	phone	Phone	text	t	f	\N	1	\N	t	2026-01-05 05:37:20	2026-01-05 05:37:20
174	45	\N	\N	\N	email	Email	text	t	f	\N	1	\N	t	2026-01-05 05:37:20	2026-01-05 05:37:20
175	45	\N	\N	\N	age	Age	number	t	f	\N	1	\N	t	2026-01-05 05:37:20	2026-01-05 05:37:20
176	47	\N	\N	\N	title	Title	text	t	t	\N	1	\N	t	2026-01-06 10:37:26	2026-01-06 10:37:26
159	38	\N	\N	\N	title	Title	text	t	t	\N	1	\N	t	2025-12-30 15:59:51	2026-01-09 06:22:03
56	26	\N	\N	\N	description	Description	textarea-editor	t	t	\N	1	\N	t	2025-12-23 06:20:02	2026-01-09 11:46:18
178	23	\N	\N	\N	code	Code	text	t	f	\N	1	\N	t	2026-01-12 09:39:59	2026-01-12 09:39:59
169	44	\N	\N	\N	title	Title	text	t	t	\N	1	\N	t	2025-12-30 23:32:12	2026-01-15 14:32:34
179	44	\N	\N	\N	map	Map	textarea	t	f	\N	1	\N	t	2026-01-15 14:29:06	2026-01-15 14:32:35
180	47	\N	\N	\N	description	Description	text	t	t	\N	1	\N	t	2026-01-19 16:38:11	2026-01-19 16:38:11
181	38	\N	\N	\N	video	Video	text	t	f	\N	1	\N	t	2026-01-19 17:22:24	2026-01-19 17:22:24
182	50	\N	\N	\N	title	Title	text	t	t	\N	1	\N	t	2026-01-19 17:42:53	2026-01-19 17:46:39
161	38	\N	\N	\N	content	Content	text	t	f	\N	1	\N	t	2025-12-30 15:59:51	2026-01-20 05:37:35
183	38	\N	\N	\N	description1	Description1	textarea-editor	t	t	\N	1	\N	t	2026-01-20 05:37:35	2026-01-20 05:38:09
623	23	461	Rahbar	rahbar-8	title	Title	text	t	t	\N	1	\N	t	2026-02-19 12:18:10	2026-02-19 12:18:10
185	51	\N	\N	\N	title	Title	text	t	t	\N	1	\N	t	2026-01-21 11:57:48	2026-01-21 11:57:48
186	52	\N	\N	\N	title	Title	text	t	t	\N	1	\N	t	2026-01-21 18:32:51	2026-01-21 18:32:51
187	52	\N	\N	\N	description	Description	text	t	t	\N	1	\N	t	2026-01-21 18:32:51	2026-01-21 18:32:51
188	53	\N	\N	\N	title	Title	text	t	t	\N	1	\N	t	2026-01-22 10:19:27	2026-01-22 10:19:27
189	47	\N	\N	\N	link1	Link 1	text	t	f	\N	1	\N	t	2026-01-23 06:56:29	2026-01-23 06:56:29
190	47	\N	\N	\N	link2	Link2	text	t	f	\N	1	\N	t	2026-01-23 06:56:29	2026-01-23 07:02:00
191	51	\N	\N	\N	description	Description	text	t	t	\N	1	\N	t	2026-01-23 07:07:32	2026-01-23 07:07:32
192	51	\N	\N	\N	url	Url	text	t	f	\N	1	\N	t	2026-01-23 07:07:32	2026-01-23 07:07:32
193	51	\N	\N	\N	url_title	Url Title	text	t	t	\N	1	\N	t	2026-01-23 07:07:32	2026-01-23 07:07:32
194	52	\N	\N	\N	url	Ссылка	text	t	f	\N	2	\N	t	2026-01-23 12:48:08	2026-01-23 12:48:08
195	30	52	Url	url	date	Дата	datetime-local	t	f	\N	1	\N	t	2026-01-23 13:38:36	2026-01-23 13:38:47
196	30	\N	\N	\N	date	Date	datetime-local	t	f	\N	1	\N	t	2026-01-23 13:51:05	2026-01-23 13:51:05
197	58	\N	\N	\N	title	tile	text	t	t	\N	1	\N	t	2026-02-13 06:05:00	2026-02-13 06:05:00
198	35	\N	\N	\N	word1	1-so'z	text	f	t	\N	1	\N	t	2026-02-13 10:37:02	2026-02-13 10:37:02
199	35	\N	\N	\N	word2	2-so'z	text	f	t	\N	1	\N	t	2026-02-13 10:37:02	2026-02-13 10:37:02
200	35	\N	\N	\N	word3	3-so'z	text	t	t	\N	1	\N	t	2026-02-13 10:37:02	2026-02-13 10:37:02
637	64	\N	\N	\N	title	Label	text	t	t	\N	1	\N	t	2026-02-25 05:49:32	2026-02-25 05:51:00
639	64	\N	\N	\N	placeholder	Placeholder	text	t	t	\N	2	\N	t	2026-02-25 05:49:32	2026-02-25 05:51:44
642	64	\N	\N	\N	column	Column	text	t	f	\N	5	\N	t	2026-02-25 05:49:32	2026-02-25 05:51:44
640	64	\N	\N	\N	type	Type	select	t	f	"[\\"text\\",\\"number\\",\\"file\\",\\"tel\\",\\"email\\",\\"select\\",\\"country\\"]"	3	\N	t	2026-02-25 05:49:32	2026-02-25 07:41:52
226	59	\N	\N	\N	link	link	text	t	t	\N	2	\N	t	2026-02-18 06:51:16	2026-02-24 12:06:47
643	64	\N	\N	\N	value	Value	text	t	t	\N	6	\N	t	2026-02-25 05:53:29	2026-02-25 05:53:29
225	59	\N	\N	\N	title	Title	text	t	t	\N	1	\N	t	2026-02-18 06:51:16	2026-02-18 06:51:16
276	23	288	Nomi	nomi-5-copy-1	date_at	Date_at	text	t	f	\N	1	\N	t	2026-02-18 09:46:15	2026-02-18 09:46:15
644	64	\N	\N	\N	required	Required (0- no, 1-yes)	text	t	f	\N	7	\N	t	2026-02-25 06:26:20	2026-02-25 06:26:50
280	23	288	Rahbar	rahbar-5-copy-1	phone	Phone	text	t	f	\N	1	\N	t	2026-02-18 09:46:15	2026-02-18 09:46:15
624	23	468	Tashkilot haqida	nomi-7	description	Description	textarea-editor	t	t	\N	2	\N	t	2026-02-20 06:50:47	2026-02-23 06:00:26
626	23	468	Tashkilot haqida	nomi-7	date_at	Birlashma ochilgan yil	text	t	f	\N	3	\N	t	2026-02-20 06:50:47	2026-02-23 06:00:26
625	23	468	Tashkilot haqida	nomi-7	boss_at	Rahbar saylangan yil	text	t	f	\N	4	\N	t	2026-02-20 06:50:47	2026-02-23 06:00:26
645	38	148	Form	form	title	Label	text	t	t	\N	1	\N	t	2026-02-25 08:17:48	2026-02-25 08:17:48
627	60	\N	\N	\N	desc	Description	textarea-editor	f	t	\N	2	\N	t	2026-02-20 08:33:41	2026-02-20 08:33:45
646	38	148	Form	form	placeholder	Placeholder	text	t	t	\N	2	\N	t	2026-02-25 08:17:48	2026-02-25 08:17:48
647	38	148	Form	form	type	Type	select	t	f	"[\\"text\\",\\"number\\",\\"file\\",\\"tel\\",\\"email\\",\\"select\\",\\"country\\"]"	3	\N	t	2026-02-25 08:17:48	2026-02-25 08:17:48
648	38	148	Form	form	key	Key	text	t	f	\N	4	\N	t	2026-02-25 08:17:48	2026-02-25 08:17:48
649	38	148	Form	form	column	Column	text	t	f	\N	5	\N	t	2026-02-25 08:17:48	2026-02-25 08:17:48
650	38	148	Form	form	value	Value	text	t	t	\N	6	\N	t	2026-02-25 08:17:48	2026-02-25 08:17:48
651	38	148	Form	form	required	Required (0- no, 1-yes)	text	t	f	\N	7	\N	t	2026-02-25 08:17:48	2026-02-25 08:17:48
628	61	\N	\N	\N	title	title	text	t	t	\N	1	\N	t	2026-02-20 08:42:54	2026-02-20 08:42:54
629	61	\N	\N	\N	desc	description	textarea-editor	f	t	\N	1	\N	t	2026-02-20 08:42:54	2026-02-20 08:43:05
652	38	\N	\N	\N	project_status	Loyiha_statusi	select	f	f	"[\\"active\\",\\"inactive\\"]"	1	\N	t	2026-02-25 12:29:18	2026-02-25 12:29:53
630	62	\N	\N	\N	title	title	text	f	t	\N	1	\N	t	2026-02-20 08:57:10	2026-02-20 08:57:10
631	62	\N	\N	\N	desc	description	textarea-editor	f	t	\N	1	\N	t	2026-02-20 08:57:10	2026-02-20 08:57:10
632	63	\N	\N	\N	title	Title	text	t	t	\N	1	\N	t	2026-02-23 04:30:18	2026-02-23 04:30:18
603	60	\N	\N	\N	title	Title	text	t	t	\N	1	\N	t	2026-02-18 11:32:47	2026-02-18 11:32:47
620	23	468	Tashkilot haqida	nomi-7	title	Title	text	t	t	\N	1	\N	t	2026-02-18 13:11:30	2026-02-23 06:00:26
621	23	232	Rahbar	rahbar-7	title	Title	text	t	t	\N	1	\N	t	2026-02-18 13:13:39	2026-02-18 13:13:39
\.


--
-- Data for Name: page_section_translations; Type: TABLE DATA; Schema: public; Owner: vatandoshlar_usr
--

COPY public.page_section_translations (id, page_section_id, page_section_parent_id, category, category_slug, locale, data, created_at, updated_at) FROM stdin;
332	88	\N	\N	\N	uz	{"title": null}	2025-12-28 06:22:17	2026-02-14 20:19:05
11	5	\N	\N	\N	uz	{"title": "O‘zbekiston – sirli o‘tmish va yorqin kelajak maskani!", "description": "O‘zbekiston – tarix va zamonaviylik uyg‘unligi! Bu yerda har bir qadam o‘ziga xos kashfiyot. So‘nggi yillarda mamlakat turizm, iqtisodiyot va xizmat ko‘rsatish sohalarida yangi bosqichga ko‘tarilib, sayyohlar uchun yanada qulay va qiziqarli makonga aylandi. Samarqand, Buxoro, Xiva kabi shaharlar o‘zining qadimiy ruhi bilan, Toshkent esa zamonaviy tarovati bilan mehmonlarni o‘ziga jalb qiladi. Bu yerda qadimiylik va yangilik birlashadi, mehmondo‘stlik esa har yurakni zabt etadi. O‘zbekiston – bu nafaqat sayohat, balki ilhom, kashfiyot va unutilmas taassurotlar manzili. Bu mo‘jizaviy diyorga qadam qo‘ying va yuragingizni bu yerga abadiy bog‘lang!"}	2025-12-23 05:06:24	2025-12-23 05:06:24
12	5	\N	\N	\N	ru	{"title": null, "description": null}	2025-12-23 05:06:24	2025-12-23 05:06:24
13	6	\N	\N	\N	uz	{"title": "Forum va seminarlardan video"}	2025-12-23 05:07:48	2025-12-23 05:07:48
14	6	\N	\N	\N	ru	{"title": null}	2025-12-23 05:07:48	2025-12-23 05:07:48
15	7	\N	\N	\N	uz	{"title": "Fotogalareya"}	2025-12-23 05:08:27	2025-12-23 05:08:27
16	7	\N	\N	\N	ru	{"title": null}	2025-12-23 05:08:27	2025-12-23 05:08:27
333	88	\N	\N	\N	ru	{"title": null}	2025-12-28 06:22:17	2026-02-14 20:19:05
26	12	\N	\N	\N	ru	{"title": null, "content": null, "description": null}	2025-12-23 05:29:07	2025-12-25 08:31:46
334	88	\N	\N	\N	en	{"title": null}	2025-12-28 06:22:17	2026-02-14 20:19:05
440	134	\N	\N	\N	uz	{"title": "Maktab loyihasi"}	2025-12-29 12:31:57	2025-12-29 12:31:57
441	134	\N	\N	\N	ru	{"title": null}	2025-12-29 12:31:57	2025-12-29 12:31:57
305	78	\N	\N	\N	uz	{"title": null}	2025-12-28 06:12:16	2026-02-14 20:37:26
442	134	\N	\N	\N	en	{"title": null}	2025-12-29 12:31:57	2025-12-29 12:31:57
1442	456	\N	\N	\N	uz	{"title": "Buyuk Britaniya"}	2026-02-19 04:50:51	2026-02-19 04:50:51
443	134	\N	\N	\N	\N	{"url": null}	2025-12-29 12:31:57	2025-12-29 12:31:57
306	78	\N	\N	\N	ru	{"title": null}	2025-12-28 06:12:16	2026-02-14 20:37:26
307	78	\N	\N	\N	en	{"title": null}	2025-12-28 06:12:16	2026-02-14 20:37:26
27	13	\N	\N	\N	uz	{"title": "Oliy maqsadimiz-xorijdagi vatandoshlarni Vatan atrofida birlashtirish, ularning qalbi va ongida yurtdan faxrlanish tuyg'usini yuksaltirish, milliy o'zlikni asrashdir!"}	2025-12-23 05:30:06	2025-12-23 05:30:06
28	13	\N	\N	\N	ru	{"title": null}	2025-12-23 05:30:06	2025-12-23 05:30:06
20	9	\N	\N	\N	ru	{"title": null, "description": null}	2025-12-23 05:11:35	2026-02-17 09:35:56
6	3	\N	\N	\N	uz	{"title": "Elektron kitoblar"}	2025-12-23 04:45:52	2026-02-13 10:17:25
35	16	\N	\N	\N	uz	{"title": "Jamoat birlashmalari bilan hamkorlik aloqalarini yo‘lga qo‘yish va rivojlantirish"}	2025-12-23 05:34:07	2026-02-13 05:39:50
94	39	\N	\N	\N	en	{"title": "Our supreme goal is to unite compatriots abroad around their Motherland, to raise the feeling of pride in the country in their hearts and minds, and to preserve the national identity!", "content": null, "description": null}	2025-12-25 08:50:21	2026-02-12 13:01:40
10	4	\N	\N	\N	ru	{"title": "Vatandoshlar jamoat fondi ru", "content": null, "content1": null, "description": null}	2025-12-23 04:50:44	2026-01-23 12:34:28
5	2	\N	\N	\N	\N	{"number": "133000"}	2025-12-23 04:45:01	2026-02-13 10:16:39
3	2	\N	\N	\N	uz	{"title": "Qatnashgan vatandoshlar soni"}	2025-12-23 04:45:01	2026-02-13 10:16:39
9	4	\N	\N	\N	uz	{"title": "Vatandoshlar jamoat fondi", "content": "“Xorijda istiqomat qilayotgan yurtdoshlarni birlashtirish maqsadida 'Vatandoshlar' jamoat fondi tashkil etildi... Bu fonddan asosiy maqsad - tarixiy Vatanimiz atrofida ularni yanada jipslashtirish, ularning qalbi va ongida yurt bilan faxrlanish tuyg'usini yuksaltirish, milliy oʻzlikni saqlab qolish”", "content1": "O’zbekiston Respublikasi Prezidenti", "description": "Shavkat Miromonovich Mirziyoyev"}	2025-12-23 04:50:44	2026-01-23 12:34:28
36	16	\N	\N	\N	ru	{"title": "Налаживание и развитие партнерских отношений с общественными объединениями"}	2025-12-23 05:34:07	2026-02-13 05:39:50
37	17	\N	\N	\N	uz	{"title": "Vatandoshlarning huquq va erkinliklarini himoya qilishga ko‘maklashish"}	2025-12-23 05:34:27	2026-02-13 05:40:26
38	17	\N	\N	\N	ru	{"title": "Содействие защите прав и свобод соотечественников"}	2025-12-23 05:34:27	2026-02-13 05:40:26
4	2	\N	\N	\N	ru	{"title": "Количество участвовавших соотечественников"}	2025-12-23 04:45:01	2026-02-13 10:16:39
7	3	\N	\N	\N	ru	{"title": "Электронные книги"}	2025-12-23 04:45:52	2026-02-13 10:17:25
8	3	\N	\N	\N	\N	{"number": "1000"}	2025-12-23 04:45:52	2026-02-13 10:17:25
380	107	\N	\N	\N	uz	{"title": null}	2025-12-28 06:31:08	2026-02-14 19:27:09
381	107	\N	\N	\N	ru	{"title": null}	2025-12-28 06:31:08	2026-02-14 19:27:09
382	107	\N	\N	\N	en	{"title": null}	2025-12-28 06:31:08	2026-02-14 19:27:09
356	99	\N	\N	\N	uz	{"title": null}	2025-12-28 06:27:11	2026-02-14 19:44:20
357	99	\N	\N	\N	ru	{"title": null}	2025-12-28 06:27:11	2026-02-14 19:44:20
358	99	\N	\N	\N	en	{"title": null}	2025-12-28 06:27:11	2026-02-14 19:44:20
1443	456	\N	\N	\N	ru	{"title": "Великобритания"}	2026-02-19 04:50:51	2026-02-19 04:50:51
895	260	\N	\N	\N	uz	{"title": "Qirg‘iziston"}	2026-02-18 07:16:19	2026-02-18 07:17:18
797	232	19	tashkilot	tashkilot	\N	{"title": "Uzbek Association of Pittsburgh"}	2026-02-18 04:58:39	2026-02-23 07:54:59
320	83	\N	\N	\N	uz	{"title": null}	2025-12-28 06:17:03	2026-02-14 20:23:00
308	79	\N	\N	\N	uz	{"title": null}	2025-12-28 06:13:10	2026-02-14 20:38:48
309	79	\N	\N	\N	ru	{"title": null}	2025-12-28 06:13:10	2026-02-14 20:38:48
1444	456	\N	\N	\N	en	{"title": "United Kingdom"}	2026-02-19 04:50:51	2026-02-19 04:50:51
1445	456	\N	\N	\N	\N	{"code": "uk"}	2026-02-19 04:50:51	2026-02-19 04:50:51
1564	498	497	Tashkilot haqida	nomi-7	uz	{"title": "Amerika-O‘zbekiston Assotsiatsiyasi", "description": "<p>Tashkilotning asosiy maqsadlari:</p><ul><li>AQShda yashovchi o‘zbek diasporasini qo‘llab‑quvvatlash va birlashtirish.</li><li>Amerika va O‘zbekiston xalqlari o‘rtasida madaniy, akademik va professional almashinuvni rag‘batlantirish.</li></ul><p>Asosiy vazifalari:</p><ul><li>Akademik va ijtimoiy dasturlar tashkil etish, shu jumladan yoshlar, talabalar va professionallar uchun imkoniyatlar yaratish.</li><li>O‘zbekiston va AQSh o‘rtasida ta’lim, madaniyat, til va kasb‑mahorat almashinuvini qo‘llab‑quvvatlash.</li><li>Diaspora jamoasi uchun resurslar, seminarlar va tadbirlar orqali hamkorlikni kuchaytirish.</li></ul>"}	2026-02-23 09:22:59	2026-02-23 09:22:59
1451	458	232	Rahbar	rahbar-5	en	{"title": "Sadikov Baxodir Talibjonovich", "description": "Head of the Uzbek Association of Pittsburgh"}	2026-02-19 11:23:35	2026-02-24 09:28:40
1452	458	232	Rahbar	rahbar-5	\N	{"email": "sadikov_bahodir@gmail.com", "phone": null}	2026-02-19 11:23:35	2026-02-24 09:28:40
1449	458	232	Rahbar	rahbar-5	uz	{"title": "Sadikov Baxodir Talibjonovich", "description": "Pittsburgdagi uzbeklar jamiyati rahbari"}	2026-02-19 11:23:35	2026-02-24 09:28:40
1515	480	478	Tashkilot haqida	nomi-7	en	{"title": "Friends of Uzbekistan", "boss_at": "2023", "date_at": "2023", "description": "<p>Main goal:</p><ul><li><span style=\\"font-size: 1rem; letter-spacing: 0.01rem;\\">To promote Uzbekistan internationally and popularize its culture, history, and traditions.</span></li><li>To strengthen friendship and cooperation between Uzbekistan and other countries.</li></ul><p>Main tasks:</p><ul><li><span style=\\"font-size: 1rem; letter-spacing: 0.01rem;\\">Organizing cultural events, exhibitions, meetings, and conferences.</span></li><li>Promoting the culture, art, and tourism of Uzbekistan.</li><li>Developing and supporting relations with compatriots living abroad.</li><li>Initiating cooperation projects in the fields of education, science, and culture.</li><li>Expanding cooperation with organizations and institutions in different countries.</li></ul>"}	2026-02-20 11:39:10	2026-02-20 11:44:11
79	35	\N	\N	\N	uz	{"description": "“Vatandoshlar” jamoat fondi 2021 yil 11 avgustda tashkil etilgan. Bizning asosiy maqsadimiz- xorijda istiqomat qilayotgan vatandoshlarni tarixiy Vatani atrofida yanada jipslashtirish, ularning qalbi va ongida yurt bilan faxrlanish tuyg‘usini yuksaltirish, milliy o‘zlikni saqlab qolish, vatandoshlar va ular tomonidan tuzilgan jamoat birlashmalarini qo‘llab-quvvatlash, turli sohalarda faoliyat yuritayotgan vatandoshlarimizning salohiyatini mamlakatimiz taraqqiyotiga samarali yo‘naltirishdir!"}	2025-12-25 08:29:18	2025-12-25 08:29:18
80	35	\N	\N	\N	ru	{"description": null}	2025-12-25 08:29:18	2025-12-25 08:29:18
81	35	\N	\N	\N	en	{"description": null}	2025-12-25 08:29:18	2025-12-25 08:29:18
25	12	\N	\N	\N	uz	{"title": "Fondning ramzi", "content": "<p><span>\\"Vatandoshlar\\" jamoat fondining ramzida asosan milliy qadriyatlarimizni anglatuvchi minoralar hamda tarixiy obidalarimizning naqshlarida aks etgan ko‘k rangdan foydalanilgan. Ko‘k rang – bu tinchlik va hotirjamlik ramzi bo‘lib, u yaxshilikni, donishmandlikni, halollikni va sadoqatni bildiradi. Markazda O‘zbekiston Respublikasining 30 yilligi munosabati bilan “Yangi O‘zbekiston” bog‘ida bunyod etilgan muhtasham obida “Mustaqillik monumenti” joy olgan. Obidaning eng yuqori qismida O‘zbekiston gerbidan ham o‘rin olgan “Humo qushi” tasvirlangan. Obidaning orqa tomonida globus tasviri tushirilgan bo‘lib, bu xorijda istiqomat qilayotgan vatandoshlar bilan ishlashni nazarda tutadi. Shuningdek, ramzda ochiq kaftlar keltirilgan bo‘lib, bu Fondning ochiqlik va qabul qilishlikni, halollik va samimiylikni, vatandoshlarni “Yangi O‘zbekiston” atrofida yanada jipslashishiga, ularga doimiy ravishda g‘amxo‘rlik qilishga ham tayyor ekanligini anglatadi.</span></p>", "description": "<div class=\\"content__text\\">\\r\\n<p>\\"Vatandoshlar\\" jamoat fondining ramzida asosan milliy qadriyatlarimizni anglatuvchi minoralar hamda tarixiy obidalarimizning naqshlarida aks etgan ko‘k rangdan foydalanilgan. Ko‘k rang – bu tinchlik va hotirjamlik ramzi bo‘lib, u yaxshilikni, donishmandlikni, halollikni va sadoqatni bildiradi. Markazda O‘zbekiston Respublikasining 30 yilligi munosabati bilan “Yangi O‘zbekiston” bog‘ida bunyod etilgan muhtasham obida “Mustaqillik monumenti” joy olgan. Obidaning eng yuqori qismida O‘zbekiston gerbidan ham o‘rin olgan “Humo qushi” tasvirlangan. Obidaning orqa tomonida globus tasviri tushirilgan bo‘lib, bu xorijda istiqomat qilayotgan vatandoshlar bilan ishlashni nazarda tutadi. Shuningdek, ramzda ochiq kaftlar keltirilgan bo‘lib, bu Fondning ochiqlik va qabul qilishlikni, halollik va samimiylikni, vatandoshlarni “Yangi O‘zbekiston” atrofida yanada jipslashishiga, ularga doimiy ravishda g‘amxo‘rlik qilishga ham tayyor ekanligini anglatadi.</p>\\r\\n</div>\\r\\n<div class=\\"about__page\\">\\r\\n<div class=\\"about__page--img\\"></div>\\r\\n</div>"}	2025-12-23 05:29:07	2025-12-25 08:31:46
82	12	\N	\N	\N	en	{"title": null, "content": null, "description": null}	2025-12-25 08:31:46	2025-12-25 08:31:46
29	14	\N	\N	\N	uz	{"title": "Sattarov Odiljon Berdimuratovich", "description": "“Vatandoshlar” jamoat fondi Boshqaruv raisi"}	2025-12-23 05:32:28	2026-02-24 07:59:41
31	14	\N	\N	\N	\N	{"email": "sattarov@vatandoshlarfondi.uz", "phone": "+998(55) 502-22-99"}	2025-12-23 05:32:28	2026-02-24 07:59:41
457	139	\N	\N	\N	uz	{"title": "2024 yil"}	2025-12-29 12:44:36	2025-12-30 10:29:52
78	34	\N	\N	\N	ru	{"title": null}	2025-12-23 06:22:39	2026-01-14 11:30:41
40	18	\N	\N	\N	ru	{"title": null}	2025-12-23 05:46:01	2026-01-20 06:39:23
1450	458	232	Rahbar	rahbar-5	ru	{"title": "Садиков Баходир Талибджонович", "description": "Руководитель Ассоциации узбеков Питтсбурга"}	2026-02-19 11:23:35	2026-02-24 09:28:40
132	52	\N	\N	\N	uz	{"title": "O'zbekiston lahzalari"}	2025-12-25 13:32:21	2026-02-14 16:22:26
42	19	\N	\N	\N	ru	{"title": null}	2025-12-23 05:47:39	2026-02-06 07:32:56
41	19	\N	\N	\N	uz	{"title": "AQSH"}	2025-12-23 05:47:39	2026-02-06 07:32:56
32	15	\N	\N	\N	uz	{"title": "Sanayev Bolidin Elamonovich", "description": "“Vatandoshlar” jamoat fondi Boshqaruv raisi o‘rinbosari"}	2025-12-23 05:33:13	2026-02-13 05:20:54
33	15	\N	\N	\N	ru	{"title": "Санаев Болидин Эламонович", "description": "Заместитель председателя правления ОФ «Ватандошлар»"}	2025-12-23 05:33:13	2026-02-13 05:20:54
34	15	\N	\N	\N	\N	{"email": "sanayev@vatandoshlarfondi.uz", "phone": "+998(55) 502-22-99"}	2025-12-23 05:33:13	2026-02-13 05:20:54
95	40	\N	\N	\N	uz	{"title": "O‘zbek tili, madaniyati va an’analarini saqlab qolish va rivojlantirish"}	2025-12-25 09:42:07	2026-02-13 05:40:51
96	40	\N	\N	\N	ru	{"title": "Сохранение и развитие узбекского языка, культуры и традиций"}	2025-12-25 09:42:07	2026-02-13 05:40:51
97	40	\N	\N	\N	en	{"title": "Preservation and development of Uzbek language, culture and traditions"}	2025-12-25 09:42:07	2026-02-13 05:40:51
798	233	\N	\N	\N	uz	{"title": "Kanada"}	2026-02-18 05:13:31	2026-02-18 05:16:14
799	233	\N	\N	\N	ru	{"title": "Канада"}	2026-02-18 05:13:31	2026-02-18 05:16:14
800	233	\N	\N	\N	en	{"title": "Canada"}	2026-02-18 05:13:31	2026-02-18 05:16:14
801	233	\N	\N	\N	\N	{"code": "CA"}	2026-02-18 05:13:31	2026-02-18 05:16:14
335	87	\N	\N	\N	uz	{"title": null}	2025-12-28 06:22:33	2026-02-14 20:18:00
310	79	\N	\N	\N	en	{"title": null}	2025-12-28 06:13:10	2026-02-14 20:38:48
802	234	\N	\N	\N	uz	{"title": "Germaniya"}	2026-02-18 05:15:43	2026-02-18 05:15:43
803	234	\N	\N	\N	ru	{"title": "Германия"}	2026-02-18 05:15:43	2026-02-18 05:15:43
804	234	\N	\N	\N	en	{"title": "Germany"}	2026-02-18 05:15:43	2026-02-18 05:15:43
805	234	\N	\N	\N	\N	{"code": "DE"}	2026-02-18 05:15:43	2026-02-18 05:15:43
120	48	\N	\N	\N	uz	{"url": "https://www.youtube.com/", "title": "Forum va seminarlardan video"}	2025-12-25 13:22:39	2025-12-25 13:22:39
121	48	\N	\N	\N	ru	{"url": null, "title": null}	2025-12-25 13:22:39	2025-12-25 13:22:39
900	261	\N	\N	\N	ru	{"title": "Таджикистан"}	2026-02-18 07:18:26	2026-02-18 07:18:55
122	48	\N	\N	\N	en	{"url": null, "title": null}	2025-12-25 13:22:39	2025-12-25 13:22:39
126	50	\N	\N	\N	uz	{"title": "O‘zbekiston – sirli o‘tmish va yorqin kelajak maskani!", "description": "O‘zbekiston – tarix va zamonaviylik uyg‘unligi! Bu yerda har bir qadam o‘ziga xos kashfiyot. So‘nggi yillarda mamlakat turizm, iqtisodiyot va xizmat ko‘rsatish sohalarida yangi bosqichga ko‘tarilib, sayyohlar uchun yanada qulay va qiziqarli makonga aylandi. Samarqand, Buxoro, Xiva kabi shaharlar o‘zining qadimiy ruhi bilan, Toshkent esa zamonaviy tarovati bilan mehmonlarni o‘ziga jalb qiladi. Bu yerda qadimiylik va yangilik birlashadi, mehmondo‘stlik esa har yurakni zabt etadi. O‘zbekiston – bu nafaqat sayohat, balki ilhom, kashfiyot va unutilmas taassurotlar manzili. Bu mo‘jizaviy diyorga qadam qo‘ying va yuragingizni bu yerga abadiy bog‘lang!"}	2025-12-25 13:23:52	2025-12-25 13:23:52
127	50	\N	\N	\N	ru	{"title": null, "description": null}	2025-12-25 13:23:52	2025-12-25 13:23:52
128	50	\N	\N	\N	en	{"title": null, "description": null}	2025-12-25 13:23:52	2025-12-25 13:23:52
129	51	\N	\N	\N	uz	{"title": "Fotogalareya", "description": null}	2025-12-25 13:24:51	2025-12-25 13:24:51
130	51	\N	\N	\N	ru	{"title": null, "description": null}	2025-12-25 13:24:51	2025-12-25 13:24:51
131	51	\N	\N	\N	en	{"title": null, "description": null}	2025-12-25 13:24:51	2025-12-25 13:24:51
901	261	\N	\N	\N	en	{"title": "Tajikistan"}	2026-02-18 07:18:26	2026-02-18 07:18:55
137	53	\N	\N	\N	en	{"title": "Uzbekistan – a land of mysterious past and bright future!", "description": "Uzbekistan – where history and modernity unite! Here, every step is a unique discovery. In recent years, the country has reached new heights in tourism, economy, and hospitality, becoming an even more comfortable and fascinating destination for travelers. Samarkand, Bukhara, and Khiva captivate guests with their ancient spirit, while Tashkent enchants with its modern charm. Here, antiquity and innovation merge, and hospitality wins every heart. Uzbekistan is not just a journey – it's a source of inspiration, discovery, and unforgettable impressions. Step into this wondrous land and forever connect your heart to it!"}	2025-12-25 13:35:56	2026-02-05 10:31:24
85	36	\N	\N	\N	en	{"title": "Vatandoshlar", "content": null, "description": "\\"Vatandoshlar\\" public foundation was established on August 11, 2021. Our main goal is to further unite compatriots living abroad around their historical homeland, strengthen in their hearts and minds a sense of pride for the country, preserve national identity, support compatriots and public associations created by them, effectively channel the potential of compatriots working in various fields for the development of our country."}	2025-12-25 08:47:03	2026-02-12 12:34:06
106	43	\N	\N	\N	en	{"title": "3. From whom does the Vatandosh Public Foundation receive funds?", "description": "<p>The sources of formation of the Fund's resources are:</p><p> - state subsidies and funds received from state social orders;</p><p> - funds allocated by the founders; - charitable donations of legal entities and individuals;</p><p> - grants of legal entities and individuals, foreign and international organizations, as well as foreign states;</p><p> - income received from the placement of the Fund's funds on deposits of commercial banks;</p><p> - income (profit) received from the entrepreneurial activities of the Fund;</p><p> - other sources not prohibited by legislative acts.</p>"}	2025-12-25 09:50:30	2026-02-13 05:48:35
237	89	\N	\N	\N	uz	{"title": "Namangan", "description": "Namangan viloyati – Farg'ona vodiysining shimoliy qismida joylashgan boy tarixga ega hudud bo'lib, rivojlangan sanoati, chorvachilik va qishloq xo'jaligi bilan mashhur. Viloyat markazi Namangan shahri O'zbekistonning yirik shaharlaridan biri bo'lib, hunarmandchilik an'analari va madaniy merosi bilan ajralib turadi. Bu yerdagi Mulla Qirgiz madrasasi, Xo'jaambar bobo maqbarasi va Ota Valikhon To'ra madrasasi kabi tarixiy yodgorliklar islom meʼmorchiligining go'zal namunalaridir. Namangan viloyati paxta yetishtirish, ipakchilik va meva-sabzavot ishlab chiqarish bilan mashhur bo'lib, O'zbekistonning qishloq xo'jaligi poytaxtlaridan biri hisoblanadi. Viloyatning tog'li hududlari, Chust va Chortoq tumanlari an'anaviy do'ppi tikish, kulolchilik va boshqa milliy hunarmandchilik bilan butun O'zbekistonda tanilgan. Namangan xalqining mehmondo'stligi, boy madaniy an'analari va shirinliklari har bir mehmonni maftun etadi."}	2025-12-26 14:25:11	2026-02-14 19:59:59
93	39	\N	\N	\N	ru	{"title": "Наша высшая цель - объединить соотечественников за рубежом вокруг их Родины, пробудить в их сердцах и умах чувство гордости за страну и сохранить национальную самобытность!", "content": null, "description": null}	2025-12-25 08:50:21	2026-02-12 13:01:40
100	41	\N	\N	\N	en	{"title": "1. Who is a compatriot?", "description": "<p>Citizens of the Republic of Uzbekistan permanently residing outside the territory of Uzbekistan or temporarily staying abroad due to study, work, family and other circumstances; people from Uzbekistan who have gone abroad and become citizens of a foreign state, as well as their descendants who have retained a sense of spiritual and cultural belonging to the Motherland and are striving to develop friendly cultural, humanitarian, socio-economic and other ties with the Republic of Uzbekistan; foreign citizens or stateless persons living abroad, identifying themselves as Uzbeks or Karakalpaks by ethnicity and language, as well as from a cultural and historical point of view and wishing to maintain comprehensive communication with Uzbekistan.</p>"}	2025-12-25 09:49:29	2026-02-13 05:52:13
139	54	\N	\N	\N	ru	{"title": "Фотогалерея", "description": "Самые красивые мгновения Узбекистана"}	2025-12-25 13:36:22	2026-02-05 10:33:31
92	39	\N	\N	\N	uz	{"title": "Oliy maqsadimiz-xorijdagi vatandoshlarni Vatan atrofida birlashtirish, ularning qalbi va ongida yurtdan faxrlanish tuyg'usini yuksaltirish, milliy o'zlikni asrashdir!", "content": null, "description": null}	2025-12-25 08:50:21	2026-02-12 13:01:40
138	54	\N	\N	\N	uz	{"title": "Fotogalareya", "description": "O'zbekistonning eng go'zal lahzalari"}	2025-12-25 13:36:22	2026-02-05 10:33:31
140	54	\N	\N	\N	en	{"title": "Photo Gallery", "description": "The most beautiful moments of Uzbekistan"}	2025-12-25 13:36:22	2026-02-05 10:33:31
338	90	\N	\N	\N	uz	{"title": null}	2025-12-28 06:23:24	2026-02-14 20:05:07
344	92	\N	\N	\N	uz	{"title": null}	2025-12-28 06:24:26	2026-02-14 20:09:21
336	87	\N	\N	\N	ru	{"title": null}	2025-12-28 06:22:33	2026-02-14 20:18:00
337	87	\N	\N	\N	en	{"title": null}	2025-12-28 06:22:33	2026-02-14 20:18:00
321	83	\N	\N	\N	ru	{"title": null}	2025-12-28 06:17:03	2026-02-14 20:23:00
322	83	\N	\N	\N	en	{"title": null}	2025-12-28 06:17:03	2026-02-14 20:23:00
311	80	\N	\N	\N	uz	{"title": null}	2025-12-28 06:14:41	2026-02-14 20:29:45
495	150	148	Yillar	yillar-1	uz	{"title": "2025 - yilgi mavsum"}	2025-12-30 16:47:11	2026-02-24 08:34:57
433	132	\N	\N	\N	ru	{"title": null}	2025-12-29 12:30:29	2025-12-29 12:30:29
434	132	\N	\N	\N	en	{"title": null}	2025-12-29 12:30:29	2025-12-29 12:30:29
435	132	\N	\N	\N	\N	{"url": null}	2025-12-29 12:30:29	2025-12-29 12:30:29
458	139	\N	\N	\N	ru	{"title": null}	2025-12-29 12:44:36	2025-12-30 10:29:52
459	139	\N	\N	\N	en	{"title": null}	2025-12-29 12:44:36	2025-12-30 10:29:52
460	139	\N	\N	\N	\N	{"year": "2024mavsum"}	2025-12-29 12:44:36	2025-12-30 10:29:52
164	59	\N	\N	\N	ru	{"title": "Каждое место назначения – новая мечта!", "description": "Каждое место назначения – новая мечта! Путешествие в самые красивые и таинственные места Узбекистана ждет вас, чтобы вернуться с незабываемыми воспоминаниями! Здесь вас ждут великолепные природные пейзажи, исторические памятники древних городов и богатейшее культурное наследие. Каждое место пробуждает свою уникальную историю и эмоции. Каждое место назначения – это не только красота природы, но и магия, исходящая из сердца нашей страны, привлекающая каждого путешественника. Откройте для себя Узбекистан, вдохновитесь каждым его уголком, и когда вернетесь, в вашем сердце останутся незабываемые воспоминания!"}	2025-12-26 13:16:46	2026-02-14 16:40:38
147	15	\N	\N	\N	en	{"title": "Sanayev Bolidin Elamonovich", "description": "Deputy Chairman of the Board of the public foundation ”Vatandoshlar\\""}	2025-12-26 05:14:40	2026-02-13 05:20:54
151	56	\N	\N	\N	uz	{"title": "Video", "content": null, "description": null}	2025-12-26 06:41:10	2026-02-12 13:09:32
152	56	\N	\N	\N	ru	{"title": null, "content": null, "description": null}	2025-12-26 06:41:10	2026-02-12 13:09:32
133	52	\N	\N	\N	ru	{"title": "Мгновения Узбекистана"}	2025-12-25 13:32:21	2026-02-14 16:22:26
135	53	\N	\N	\N	uz	{"title": "O‘zbekiston – sirli o‘tmish va yorqin kelajak maskani!", "description": "O‘zbekiston – tarix va zamonaviylik uyg‘unligi! Bu yerda har bir qadam o‘ziga xos kashfiyot. So‘nggi yillarda mamlakat turizm, iqtisodiyot va xizmat ko‘rsatish sohalarida yangi bosqichga ko‘tarilib, sayyohlar uchun yanada qulay va qiziqarli makonga aylandi. Samarqand, Buxoro, Xiva kabi shaharlar o‘zining qadimiy ruhi bilan, Toshkent esa zamonaviy tarovati bilan mehmonlarni o‘ziga jalb qiladi. Bu yerda qadimiylik va yangilik birlashadi, mehmondo‘stlik esa har yurakni zabt etadi. O‘zbekiston – bu nafaqat sayohat, balki ilhom, kashfiyot va unutilmas taassurotlar manzili. Bu mo‘jizaviy diyorga qadam qo‘ying va yuragingizni bu yerga abadiy bog‘lang!"}	2025-12-25 13:35:56	2026-02-05 10:31:24
383	108	\N	\N	\N	uz	{"title": null}	2025-12-28 06:32:15	2026-02-14 19:16:18
384	108	\N	\N	\N	ru	{"title": null}	2025-12-28 06:32:15	2026-02-14 19:16:18
134	52	\N	\N	\N	en	{"title": "Moments of Uzbekistan"}	2025-12-25 13:32:21	2026-02-14 16:22:26
153	56	\N	\N	\N	en	{"title": null, "content": null, "description": null}	2025-12-26 06:41:10	2026-02-12 13:09:32
148	8	\N	\N	\N	\N	{"url": "https://vatandoshlar.7z7.uz/admin/pages/traditions/section/7/edit/8"}	2025-12-26 05:24:48	2026-02-17 09:24:16
154	52	\N	\N	\N	\N	{"url": null, "date": "2026-02-14T13:30"}	2025-12-26 11:06:46	2026-02-14 16:22:26
385	108	\N	\N	\N	en	{"title": null}	2025-12-28 06:32:15	2026-02-14 19:16:18
160	58	\N	\N	\N	uz	{"title": "Salom Toshkent!"}	2025-12-26 11:30:11	2026-02-14 16:20:29
161	58	\N	\N	\N	ru	{"title": "Привет, Ташкент!"}	2025-12-26 11:30:11	2026-02-14 16:20:29
162	58	\N	\N	\N	en	{"title": "Hello Tashkent!"}	2025-12-26 11:30:11	2026-02-14 16:20:29
149	9	\N	\N	\N	en	{"title": null, "description": null}	2025-12-26 05:28:45	2026-02-17 09:35:56
163	59	\N	\N	\N	uz	{"title": "Har bir manzil – yangi bir orzu!", "description": "Har bir manzil – yangi bir orzu! O'zbekistonning eng go'zal va sirli joylariga sayohat qilish, unutilmas xotiralar bilan qaytish uchun sizni kutmoqda! Bu yerda sizni ajoyib tabiat manzaralari, qadimiy shaharlarning tarixiy obidalari va madaniyatning eng boy meroslari kutib turibdi. Har bir manzil o'ziga xos hikoya va hissiyotlarni uyg'otadi. Har bir manzil – bu nafaqat tabiatning go'zalligi, balki yurtimizning yuragidan chiqib, har bir sayyohni o'ziga jalb qiladigan sehrdir. O'zbekistonni kashf eting, uning har bir burchagidan ilhom oling va qaytganingizda qalbingizda unutilmas xotiralar qoladi!"}	2025-12-26 13:16:46	2026-02-14 16:40:38
359	100	\N	\N	\N	uz	{"title": null}	2025-12-28 06:27:26	2026-02-14 19:45:19
156	58	52	Url	url	\N	{"url": null, "date": "2026-02-14T13:30"}	2025-12-26 11:10:39	2026-02-14 16:20:29
360	100	\N	\N	\N	ru	{"title": null}	2025-12-28 06:27:26	2026-02-14 19:45:19
361	100	\N	\N	\N	en	{"title": null}	2025-12-28 06:27:26	2026-02-14 19:45:19
312	80	\N	\N	\N	ru	{"title": null}	2025-12-28 06:14:41	2026-02-14 20:29:45
313	80	\N	\N	\N	en	{"title": null}	2025-12-28 06:14:41	2026-02-14 20:29:45
185	61	\N	\N	\N	en	{"title": "Andijan Region", "description": "Andijan Region – a water-rich and beautiful region located in the eastern part of the Fergana Valley, famous for its rich history and developed industry. The regional center, Andijan city, is one of the largest cities of Uzbekistan, a modern industrial and cultural center. This place is known throughout the world as the birthplace of Zahiriddin Muhammad Babur – the great poet, statesman, and founder of the Baburid dynasty. In Andijan Region, Babur's Garden, Jami Mosque, and other historical monuments have been preserved. The region is distinguished by automobile manufacturing, textile, and food industries. Andijan's fruit orchards, cotton fields, and green valleys create magnificent natural landscapes. The hospitality of the region's people, national crafts, and sweet melons are famous throughout Uzbekistan."}	2025-12-26 13:39:07	2026-02-14 20:34:52
806	235	\N	\N	\N	uz	{"title": "Daniya"}	2026-02-18 05:18:59	2026-02-18 05:18:59
447	135	\N	\N	\N	\N	{"year": "2023 mavzum"}	2025-12-29 12:34:27	2025-12-30 10:29:24
339	90	\N	\N	\N	ru	{"title": null}	2025-12-28 06:23:24	2026-02-14 20:05:07
444	135	\N	\N	\N	uz	{"title": "2023 yil"}	2025-12-29 12:34:27	2025-12-30 10:29:24
445	135	\N	\N	\N	ru	{"title": null}	2025-12-29 12:34:27	2025-12-30 10:29:24
446	135	\N	\N	\N	en	{"title": null}	2025-12-29 12:34:27	2025-12-30 10:29:24
556	167	\N	\N	\N	ru	{"title": null}	2026-01-05 07:09:42	2026-01-05 08:21:34
557	167	\N	\N	\N	en	{"title": null}	2026-01-05 07:09:42	2026-01-05 08:21:34
558	167	\N	\N	\N	\N	{"age": null, "email": null, "phone": null}	2026-01-05 07:09:42	2026-01-05 08:21:34
340	90	\N	\N	\N	en	{"title": null}	2025-12-28 06:23:24	2026-02-14 20:05:07
807	235	\N	\N	\N	ru	{"title": "Дания"}	2026-02-18 05:18:59	2026-02-18 05:18:59
314	81	\N	\N	\N	uz	{"title": null}	2025-12-28 06:14:55	2026-02-14 20:30:47
555	167	\N	\N	\N	uz	{"title": "Jahongir"}	2026-01-05 07:09:42	2026-01-05 08:21:34
570	170	\N	\N	\N	\N	{"age": null, "email": null, "phone": "941844444"}	2026-01-05 07:12:24	2026-01-05 08:22:48
432	132	\N	\N	\N	uz	{"title": "Chinor"}	2025-12-29 12:30:29	2025-12-29 12:30:29
571	171	\N	\N	\N	uz	{"title": "Forum va seminarlardan video"}	2026-01-05 07:13:02	2026-02-06 06:40:22
572	171	\N	\N	\N	ru	{"title": null}	2026-01-05 07:13:02	2026-02-06 06:40:22
387	109	\N	\N	\N	ru	{"title": null}	2025-12-28 06:35:07	2026-02-14 19:19:14
388	109	\N	\N	\N	en	{"title": null}	2025-12-28 06:35:07	2026-02-14 19:19:14
362	101	\N	\N	\N	uz	{"title": null}	2025-12-28 06:27:43	2026-02-14 19:46:33
386	109	\N	\N	\N	uz	{"title": null}	2025-12-28 06:35:07	2026-02-14 19:19:14
363	101	\N	\N	\N	ru	{"title": null}	2025-12-28 06:27:43	2026-02-14 19:46:33
364	101	\N	\N	\N	en	{"title": null}	2025-12-28 06:27:43	2026-02-14 19:46:33
315	81	\N	\N	\N	ru	{"title": null}	2025-12-28 06:14:55	2026-02-14 20:30:47
316	81	\N	\N	\N	en	{"title": null}	2025-12-28 06:14:55	2026-02-14 20:30:47
168	62	\N	\N	\N	\N	{"code": "UZ-BU", "path": "m387.311 352.308-3.466 3.299-3.08 2.04-.524.101-4.046 4.329-.322.946.138.791.653 1.102.763.809.754 1.075.212.469-.258.561-16.659 6.102-5.158 5.725-1.959-2.114-.377-.027-1.084.275-1.931 1.112-.92.239-.965.018-1.269-.165-.781-.386-2.713-2.233-2.638-1.838-6.243-4.797-1.673-1.075-4.303-3.162-1.205-1.185-1.057-1.277-.266-.579-.377-.34-.718-1.131-3.282-3.179-1.857-1.976-3.65-2.582-4.027-2.408-4.091-2.895-3.899-2.555-9.433-6.708-6.399-4.384-13.175-9.677-1.085-1.011-.836-1.185-.148-.487-.183-.827.055-.506-.267-.643-.119-1.608-1.297-1.902.019-.598.634-1.093.074-2.417-.35-.928-.129-1.131-.542-1.874-.055-1.048-.212-.708.037-.551.331-.836-.027-.929-.69-1.231-1.066-.965-.662-.974-.056-.469.46-1.415.267-1.351-.037-.285-1.214-.478-1.213-.771-1.214-1.333-1.168-.524-1.213-.799-.368-.515 5.774-6.993 4.22-4.715.726-3.492.028-1.415-.625-1.057-5.434-6.139-2.979-3.06 10.058-4.65-12.669-17.626.515-.257 3.374-.846 12.458-2.95.965-.073 3.071 6.157 1.278 1.893 1.977 2.132 2.197 1.425 3.255 1.746 1.443 1.452 1.913 3.997 1.287 4.733.524 1.277.809-.082.414-.34 1.875-.046 2.906.836 4.946 2.123 7.797 4.227 9.037 5.238 1.95 1.535.514.965.313 1.369-.441 2.049 3.126-.082 2.427-.212.506-.174 4.946-11.203.956-1.001 2.014-1.075.809.137 1.535 1.774.092 6.993 14.885 1.737.175-.45.754-4.126.524-.175 4.615-.533 3.485-.055 2.087-.349 1.039-2.463.662-1.93.414-.175.891.203.727 2.6 1.967 9.3 1.048 1.011.736.386.947.313 7.934 1.093 5.452.579 7.328 1.048-1.287 8.51-3.669 2.582-.156.947-1.333 3.795-3.08 3.804-.588.561-.865.349-3.539-.211-2.667-.496-1.848-.91-.754-.726-1.838-1.195-1.894-.11-1.021.441-.331.57.331 3.051-.414 4.007-1.186 5.247-2.326 4.393-1.958 2.269-4.045 2.454-.819.303-1.305 2.5 3.926 5.321 1.094 1.057 6.491 2.453.993.056 2.942-.717 4.514 3.391 4.036 8.629.331 1.057z", "offset": null}	2025-12-26 13:26:58	2026-02-14 20:31:44
808	235	\N	\N	\N	en	{"title": "Denmark"}	2026-02-18 05:18:59	2026-02-18 05:18:59
809	235	\N	\N	\N	\N	{"code": "DK"}	2026-02-18 05:18:59	2026-02-18 05:18:59
1513	480	478	Tashkilot haqida	nomi-7	uz	{"title": "Friends of Uzbekistan", "boss_at": "2023", "date_at": "2023", "description": "<p>Asosiy maqsad:</p><ul><li>O‘zbekistonni xalqaro miqyosda tanitish va uning madaniyati, tarixi hamda an’analarini targ‘ib qilish.</li><li>O‘zbekiston va boshqa davlatlar o‘rtasidagi do‘stlik va hamkorlikni mustahkamlash.</li></ul><p>Asosiy vazifalar:</p><ul><li>Madaniy tadbirlar, ko‘rgazmalar, uchrashuvlar va konferensiyalar tashkil etish.</li><li><span style=\\"font-size: 1rem; letter-spacing: 0.01rem;\\">O‘zbekiston madaniyati, san’ati va turizmini targ‘ib qilish.</span></li><li>Chet eldagi vatandoshlar bilan aloqalarni rivojlantirish va qo‘llab-quvvatlash.</li><li>Ta’lim, ilm-fan va madaniyat sohalarida hamkorlik loyihalarini yo‘lga qo‘yish.</li><li>Turli mamlakatlardagi tashkilotlar va muassasalar bilan hamkorlikni rivojlantirish.</li></ul>"}	2026-02-20 11:39:10	2026-02-20 11:44:11
542	163	\N	\N	\N	en	{"title": null}	2026-01-05 05:00:57	2026-02-23 10:21:53
540	163	\N	\N	\N	uz	{"title": "\\"Vatandoshlar\\" elektron gazetasining 3-soni"}	2026-01-05 05:00:57	2026-02-23 10:21:53
541	163	\N	\N	\N	ru	{"title": null}	2026-01-05 05:00:57	2026-02-23 10:21:53
1453	459	232	Nomi	nomi-5	uz	{"title": "Pittsburgdagi uzbeklar jamiyati.", "description": "АQShdagi vatandoshlarni birlashtirish, ular oʼrtasida hamjixatlikni mustahkamlash, oʼzbek urf-odatlari, qadriyatlari va ona-tilini asrab qolish"}	2026-02-19 11:47:32	2026-02-20 04:26:05
1454	459	232	Nomi	nomi-5	ru	{"title": null, "description": null}	2026-02-19 11:47:32	2026-02-20 04:26:05
1455	459	232	Nomi	nomi-5	en	{"title": null, "description": null}	2026-02-19 11:47:32	2026-02-20 04:26:05
1456	459	232	Nomi	nomi-5	\N	{"boss_at": "2020", "date_at": "2019"}	2026-02-19 11:47:32	2026-02-20 04:26:05
1668	531	\N	\N	\N	uz	{"title": "To'liq ismingiz", "value": null, "placeholder": "Ma'lumot kiriting"}	2026-02-25 05:57:19	2026-02-25 06:27:02
1669	531	\N	\N	\N	ru	{"title": null, "value": null, "placeholder": null}	2026-02-25 05:57:19	2026-02-25 06:27:02
1670	531	\N	\N	\N	en	{"title": null, "value": null, "placeholder": null}	2026-02-25 05:57:19	2026-02-25 06:27:02
1671	531	\N	\N	\N	\N	{"key": "name", "type": "text", "column": "8", "required": "1"}	2026-02-25 05:57:19	2026-02-25 06:27:02
1672	532	\N	\N	\N	uz	{"title": "Tug'ilgan sana", "value": null, "placeholder": "DD-MM-YYYY"}	2026-02-25 05:58:08	2026-02-25 06:27:16
1752	552	148	Form	form	uz	{"title": "Shahar/tuman", "value": null, "placeholder": "Tanlang"}	2026-02-25 08:27:20	2026-02-25 08:27:20
1753	552	148	Form	form	ru	{"title": null, "value": null, "placeholder": null}	2026-02-25 08:27:20	2026-02-25 08:27:20
1754	552	148	Form	form	en	{"title": null, "value": null, "placeholder": null}	2026-02-25 08:27:20	2026-02-25 08:27:20
1755	552	148	Form	form	\N	{"key": "city", "type": "text", "column": "6", "required": "1"}	2026-02-25 08:27:20	2026-02-25 08:27:20
341	91	\N	\N	\N	uz	{"title": null}	2025-12-28 06:23:42	2026-02-14 20:06:34
342	91	\N	\N	\N	ru	{"title": null}	2025-12-28 06:23:42	2026-02-14 20:06:34
343	91	\N	\N	\N	en	{"title": null}	2025-12-28 06:23:42	2026-02-14 20:06:34
192	64	\N	\N	\N	uz	{"title": "Jizzax", "description": "Jizzax viloyati – O'zbekistonning markazida, Samarqand va Toshkent o'rtasida joylashgan strategik ahamiyatga ega hudud bo'lib, qadimiy tarix va boy tabiiy boyliklari bilan ajralib turadi. Viloyat markazi Jizzax shahri qadimiy Ipak yo'li bo'yida joylashgan savdo-hunarmandchilik markazi sifatida tanilgan. Bu yerdagi Ipak yo'li xarobalari, qadimiy karvonsaroylar va tarixiy yodgorliklar ming yillik madaniy merosdan darak beradi. Jizzax viloyati zamonaviy sanoat, chorvachilik va dehqonchilik bilan rivojlanib, ayniqsa jun va teri ishlab chiqarish sohasida mashhurdir. Viloyatning tog'li hududlari, Nuratog' tizmasi va yaylovlari chorvadorlik uchun qulay sharoit yaratadi. Zarafshon daryosi boylami joylashgan Zomin tumani o'zining ajoyib tabiati, Zomin milliy bog'i va tog' kurortlari bilan mashhur bo'lib, har yili minglab sayyohlarni o'ziga jalb qiladi. Zomin hududidagi Suffa qal'asi, qadimiy ziyoratgohlar va tarixiy yodgorliklar viloyatning boy tarixini aks ettiradi. Jizzax xalqining mehmondo'stligi, an'anaviy oshpazlik san'ati va milliy hunarmandchiligi har bir tashrif buyuruvchini lol qoldiradi."}	2025-12-26 13:46:34	2026-02-14 20:14:19
193	64	\N	\N	\N	ru	{"title": "Джизакская область", "description": "Джизакская область – стратегически важный регион, расположенный в центре Узбекистана между Самаркандом и Ташкентом, выделяющийся древней историей и богатыми природными ресурсами. Областной центр город Джизак известен как торгово-ремесленный центр, расположенный на древнем Шелковом пути. Руины Шелкового пути, древние караван-сараи и исторические памятники свидетельствуют о тысячелетнем культурном наследии. Джизакская область развивается благодаря современной промышленности, животноводству и земледелию, особенно славится производством шерсти и кожи. Горные районы области, хребет Нуратау и пастбища создают благоприятные условия для животноводства. Расположенный вдоль реки Зарафшан, Заминский район славится своей великолепной природой, Заминским национальным парком и горными курортами, ежегодно привлекая тысячи туристов. Крепость Суффа, древние места паломничества и исторические памятники на территории Замина отражают богатую историю области. Гостеприимство джизакского народа, традиционное кулинарное искусство и национальные ремесла очаровывают каждого посетителя."}	2025-12-26 13:46:34	2026-02-14 20:14:19
559	168	\N	\N	\N	uz	{"title": "Murod"}	2026-01-05 07:10:19	2026-01-05 07:10:19
560	168	\N	\N	\N	ru	{"title": null}	2026-01-05 07:10:19	2026-01-05 07:10:19
561	168	\N	\N	\N	en	{"title": null}	2026-01-05 07:10:19	2026-01-05 07:10:19
562	168	\N	\N	\N	\N	{"age": null, "email": null, "phone": null}	2026-01-05 07:10:19	2026-01-05 07:10:19
563	169	\N	\N	\N	uz	{"title": "Mustafo"}	2026-01-05 07:10:54	2026-01-05 08:22:17
564	169	\N	\N	\N	ru	{"title": null}	2026-01-05 07:10:54	2026-01-05 08:22:17
194	64	\N	\N	\N	en	{"title": "Jizzakh", "description": "Jizzakh Region – a strategically important region located in the center of Uzbekistan between Samarkand and Tashkent, distinguished by its ancient history and rich natural resources. The regional center, Jizzakh city, is known as a trade and craft center located on the ancient Silk Road. Silk Road ruins, ancient caravanserais, and historical monuments testify to a thousand-year cultural heritage. Jizzakh Region is developing through modern industry, livestock farming, and agriculture, particularly famous for wool and leather production. The mountainous areas of the region, the Nuratau Range, and pastures create favorable conditions for livestock farming. Located along the Zarafshan River, Zaamin district is famous for its magnificent nature, Zaamin National Park, and mountain resorts, attracting thousands of tourists annually. Suffa Fortress, ancient pilgrimage sites, and historical monuments in the Zaamin area reflect the region's rich history. The hospitality of Jizzakh people, traditional culinary art, and national crafts captivate every visitor."}	2025-12-26 13:46:34	2026-02-14 20:14:19
565	169	\N	\N	\N	en	{"title": null}	2026-01-05 07:10:54	2026-01-05 08:22:17
573	171	\N	\N	\N	en	{"title": null}	2026-01-05 07:13:02	2026-02-06 06:40:22
574	171	\N	\N	\N	\N	{"age": null, "email": null, "phone": "941844444"}	2026-01-05 07:13:02	2026-02-06 06:40:22
543	164	\N	\N	\N	uz	{"title": "tt"}	2026-01-05 05:37:55	2026-02-06 06:41:06
544	164	\N	\N	\N	ru	{"title": null}	2026-01-05 05:37:55	2026-02-06 06:41:06
545	164	\N	\N	\N	en	{"title": null}	2026-01-05 05:37:55	2026-02-06 06:41:06
546	164	\N	\N	\N	\N	{"age": "18", "email": "sanayev@vatandoshlarfondi.uz", "phone": "+998(55) 502-22-50"}	2026-01-05 05:37:55	2026-02-06 06:41:06
390	110	\N	\N	\N	ru	{"title": null}	2025-12-28 06:35:30	2026-02-15 15:36:16
391	110	\N	\N	\N	en	{"title": null}	2025-12-28 06:35:30	2026-02-15 15:36:16
810	236	\N	\N	\N	uz	{"title": "Italiya"}	2026-02-18 05:22:03	2026-02-18 05:22:03
365	102	\N	\N	\N	uz	{"title": null}	2025-12-28 06:28:55	2026-02-14 19:30:40
366	102	\N	\N	\N	ru	{"title": null}	2025-12-28 06:28:55	2026-02-14 19:30:40
367	102	\N	\N	\N	en	{"title": null}	2025-12-28 06:28:55	2026-02-14 19:30:40
172	66	\N	\N	\N	\N	{"code": "UZ-NW", "path": "m458.232 252.709-.478 4.375-.202-.037-.267 2.692-6.169.203 1.039 9.778.662 1.167.874.533 3.925.965.23.211.212.487 1.443 6.304-.257.68-2.869 4.889-4.073 7.894-.671 1.645-1.158-3.189-1.71-2.444-.892-1.029-.534-.249-1.939 1.765-2.161 1.185-1.269.101-1.682-.229-.957-.726-.947-1.425-1.094-.082-1.02.174-.837.993-1.977 4.301-.542 4.512.23.321.496.184.341.662-.157 2.086-.809 5.624-.791 1.231-2.114 5.579.184.9.735.092 1.315-.845.754.064.165.414-.128 1.029-.396.57-3.208 3.023-1.499.698-8.192 1.774-1.122-.184-4.946-2.113-1.922-1.048-.422-.956-.92-1.424-5.038-1.902-.929-.157-.478.258-.322.523-.147.644.046.891-.386 5.33-1.682 5.091-.653 1.186-.478.276-.543.009-2.62-.809-.919-.45-7.953 2.683-.46.322-.074.34.304.707 1.361 1.406.891.745.865 1.332 1.241 4.797-.156.892-.469 1.342-1.076 2.15-.037.579.156.744.745 1.664 1.949 3.492-.367.395-.488.193-2.39.367-1.278.34-.736.35-1.075.744-.267-3.106-.331-1.057-4.036-8.629-4.515-3.391-2.942.717-.993-.055-6.491-2.454-1.094-1.057-3.925-5.321 1.305-2.499.818-.304 4.046-2.453 1.958-2.27 2.326-4.393 1.186-5.247.414-4.007-.331-3.051.331-.57 1.02-.441 1.894.11 1.839 1.195.754.726 1.848.91 2.666.496 3.54.211.864-.349.589-.56 3.08-3.805 1.333-3.795.156-.947 3.669-2.582 1.287-8.51-7.328-1.048-5.452-.579-7.934-1.093-.947-.313-.736-.386-1.048-1.01-1.968-9.301-.726-2.6-.892-.202-.413.174-.662 1.93-1.039 2.463-2.087.349-3.485.055-4.615.533-.524.175-.754 4.126-.175.45-14.885-1.736-.092-6.994-1.535-1.773-.81-.138-2.013 1.075-.956 1.002-4.947 11.202-.505.174-2.428.212-3.125.083.441-2.05-.313-1.369-.515-.965-1.949-1.535-9.038-5.238-7.796-4.227-4.946-2.123-2.906-.836-1.875.046-.414.34-.809.082-.524-1.277-1.287-4.733-1.913-3.997-1.443-1.452-3.255-1.746-2.197-1.425-1.977-2.132-1.278-1.893-3.071-6.157-.965.074-12.458 2.949-3.374.846-.515.257-19.234-26.347 11.814-6.525-6.197-11.165 1.159-14.492 25.431-47.98-14.196-3.842-5.378-9.64 38.945-7.581 18.802-3.318 3.2.625 2.767.331 8.918.965 5.453.349 2.206.386 13.037 1.002 12.541.615.184-.137.781-.037 9.672-4.751 6.436-2.812 4.027-2.013 1.894-.469.993-.101 1.536.065.763.294.698.533.911 1.047 5.268 11.598 1.857 1.755 3.31 3.437 10.003 8.896 1.379 5.578 6.105 19.657 11.557-5.44.322 28.764-.046 6.625-.534-.165-2.225-1.13h-.229l-.092 6.065-.837 1.011-.276 15.292.065 1.975 22.194 2.684 3.199 36.483z", "offset": null}	2025-12-26 13:29:58	2026-02-14 19:55:12
317	82	\N	\N	\N	uz	{"title": null}	2025-12-28 06:15:23	2026-02-14 20:31:27
318	82	\N	\N	\N	ru	{"title": null}	2025-12-28 06:15:23	2026-02-14 20:31:27
319	82	\N	\N	\N	en	{"title": null}	2025-12-28 06:15:23	2026-02-14 20:31:27
295	74	\N	\N	\N	en	{"title": null}	2025-12-28 06:10:13	2026-02-14 20:46:56
389	110	\N	\N	\N	uz	{"title": null}	2025-12-28 06:35:30	2026-02-15 15:36:16
811	236	\N	\N	\N	ru	{"title": "Италия"}	2026-02-18 05:22:03	2026-02-18 05:22:03
812	236	\N	\N	\N	en	{"title": "Italy"}	2026-02-18 05:22:03	2026-02-18 05:22:03
813	236	\N	\N	\N	\N	{"code": "IT"}	2026-02-18 05:22:03	2026-02-18 05:22:03
181	60	\N	\N	\N	ru	{"title": "Республика Каракалпакстан", "description": "Республика Каракалпакстан – автономия в составе Узбекистана, обширный регион с уникальными природными особенностями, расположенный на северо-западе страны. Столица республики город Нукус известен как современный центр культуры и искусства, где Государственный музей искусств имени Савицкого выделяется уникальными художественными коллекциями, известными во всем мире. На территории Каракалпакстана расположены важные исторические и экологические памятники, такие как город Муйнак, трагедия Аральского моря и древняя крепость Кунград. Плато Устюрт, озеро Судочье и заповедник Бадай-Тугай республики обладают уникальными природными пейзажами и редкой флорой и фауной. Руины времен древней Хорезмской цивилизации – Аяз-кала, Топрак-кала и Куня-Ургенч – внесены в список Всемирного наследия ЮНЕСКО. Богатая национальная культура каракалпакского народа, традиционные костюмы, музыкальное искусство и гостеприимство создают уникальный характер республики."}	2025-12-26 13:38:23	2026-02-14 20:41:41
566	169	\N	\N	\N	\N	{"age": null, "email": null, "phone": null}	2026-01-05 07:10:54	2026-01-05 08:22:17
575	172	\N	\N	\N	uz	{"title": "MAN"}	2026-01-05 07:14:23	2026-01-05 08:23:45
576	172	\N	\N	\N	ru	{"title": null}	2026-01-05 07:14:23	2026-01-05 08:23:45
577	172	\N	\N	\N	en	{"title": null}	2026-01-05 07:14:23	2026-01-05 08:23:45
578	172	\N	\N	\N	\N	{"age": null, "email": null, "phone": "M"}	2026-01-05 07:14:23	2026-01-05 08:23:45
345	92	\N	\N	\N	ru	{"title": null}	2025-12-28 06:24:26	2026-02-14 20:09:21
428	131	\N	\N	\N	uz	{"title": "Anor Tanlovi"}	2025-12-29 12:29:53	2025-12-29 13:02:43
346	92	\N	\N	\N	en	{"title": null}	2025-12-28 06:24:26	2026-02-14 20:09:21
535	161	\N	\N	\N	ru	{"title": null}	2026-01-05 04:59:44	2026-02-23 09:56:59
536	161	\N	\N	\N	en	{"title": null}	2026-01-05 04:59:44	2026-02-23 09:56:59
487	148	\N	\N	\N	uz	{"title": "ANOR", "description": "Anor ijtimoiy va ixtososlashgan milliy loyihaga hush kelibsiz", "description1": "<p><span data-metadata=\\"&lt;!--(figmeta)eyJmaWxlS2V5IjoicExEZG1NWFkxRENDdU1FbDRZb1dWYyIsInBhc3RlSUQiOjIxMDc3OTE5MDUsImRhdGFUeXBlIjoic2NlbmUifQo=(/figmeta)--&gt;\\"></span><span data-buffer=\\"&lt;!--(figma)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(/figma)--&gt;\\"></span><span style=\\"white-space:pre-wrap;\\">Siz bizning loyixamizda qatnashish imkoniyatiga egasiz. Qatnashish uchun Batafsil tugmasini bosing</span></p><p><span style=\\"white-space:pre-wrap;\\"><br></span></p><p><span data-metadata=\\"&lt;!--(figmeta)eyJmaWxlS2V5IjoicExEZG1NWFkxRENDdU1FbDRZb1dWYyIsInBhc3RlSUQiOjE0ODYxODE5NTYsImRhdGFUeXBlIjoic2NlbmUifQo=(/figmeta)--&gt;\\"></span><span data-buffer=\\"&lt;!--(figma)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(/figma)--&gt;\\"></span><span style=\\"white-space:pre-wrap;\\">Bu loyiha: </span></p><ul><li><span style=\\"white-space:pre-wrap;\\">Yuqori kayfiyatli</span></li><li><span style=\\"white-space:pre-wrap;\\">Juda maroqli </span></li><li><span style=\\"white-space:pre-wrap;\\">Adashgan vatandoshlarga yordam beradi </span></li><li><span style=\\"white-space:pre-wrap;\\">O’qish tizimini yaxshilaydi</span></li></ul>"}	2025-12-30 16:43:36	2026-02-25 12:40:43
534	161	\N	\N	\N	uz	{"title": "\\"Vatandoshlar\\" elektron gazetasining 1-soni"}	2026-01-05 04:59:44	2026-02-23 09:56:59
489	148	\N	\N	\N	en	{"title": "ANOR", "description": "ANOR", "description1": null}	2025-12-30 16:43:36	2026-02-25 12:40:43
490	148	\N	\N	\N	\N	{"video": "https://www.youtube.com/watch?v=UqvRkpzTMJU", "content": "Anor Loyihasi boshlandi", "project_status": "active"}	2025-12-30 16:43:36	2026-02-25 12:40:43
296	75	\N	\N	\N	uz	{"title": null}	2025-12-28 06:10:28	2026-02-14 20:47:35
297	75	\N	\N	\N	ru	{"title": null}	2025-12-28 06:10:28	2026-02-14 20:47:35
177	71	\N	\N	\N	\N	{"code": "UZ-TO", "path": "m648.862 198.618-.138-.35-.597-.468-.727-.349-3.061-2.757-.864-.497-1.609-.193-1.122-.643-.423-.018-.791.193-1.048.459-1.149 1.066-.625.028-.865-.313-.386.037-1.627 2.059-.938.634-.882.395-1.085.818-.644.018-.974-.928-.479.147-.533.515-.616.671-.772 1.268-.754.606-.506.827-.901.717-.689 1.002-.138 1.158-.837 1.654-1.011 2.748.046.183-.203.442-.68.238-.386-.018-1.131-1.038-.689-.193-.138-.579.101-1.48-.506-.836-2.335-1.278-2.473-2.177-.34-.148-.635.129-.34.423-.276 1.948-.202.34-.892.8-.276.634-1.453.882-.285.459.12 1.076.313 1.277-.074.993-.956.68-.883.284-.45.506-.497-.019-1.066.506-.819 1.195-.983.827-.405.698-.68 1.847-.543.928-2.932 1.471-1.233.882-.671 1.967-.294.275-.303.111-.331-.111-.147-.266.046-.515-.35-.616-.358-.064-.626.184-.239.285-1.517 3.667-2.693 1.102-1.104-.955-.68-.304h-.46l-1.535.965-1.876.303-.23-.119-.772.119-.285.184-.184.405-.487.487-.625.303-2.519.597-.479.212-1.121 1.047-.267.469-.873.652-1.196 1.278-.367.496-.46 1.434-.211.257-.681.349-1.121.322-.35-.055-.303.11-1.545 1.314-.616 1.011.019.478.303.496 1.076.699-.313.928-.377.193-2.032-.322-.487.211-.763.037-1.205.322-.432-.019-.919-.533-.515-.128-1.011.119-.331-.11-1.379.294-1.058.634-.588 1.746-.405.46-2.05 1.158-1.048 2.609-.607.423-.469-.055-.542-.533-.267-.11-.469.147-1.82 2.821-.175 2.491-.211.34-1.278 1.075-.276 1.654-.193.129-.782-.138-.625.422-.597.791-1.297 1.259-1.407 1.856-.68 1.057-.441 1.011-1.526 1.92-.662 1.535-.138 1.388-.157.321-1.222 1.112-1.683.662-.956.79 4.468 5.073 3.191 3.189 4.523 4.08 4.33 3.593.57.074 2.786 3.887-.459 4.319-.791 4.889-.929 4.559.009.974.129.569.46.975-.23 4.346 2.344.203.589-.046.965.34 1.002-.083.708-.23 1.196.285 1.802.037 1.029.57.442-.368-.773-1.948-.377-.386-1.268-.248-.377-.386.22-.781-.321-.533.165-.57 1.609.22.763-.055 1.039-.983.009-.836.304-.506-.019-1.112-.956-.763-.386-.459.009-.763-.267-.744-.367-.322.22-.781-.432-.175-.561-1.902-.386-.459.009-.763.322-.377.037-.698-.607-.524-1.232-1.7-.064-.303.248-.589 1.434-.965 1.674-.22.8.156.275-.073.239-.249-.027-.165.368-.689.441-.212.239-1.167-.515-1.13-.313-1.038.194-3.226.055-.294.303-.359.184-.873 1.692-2.38 1.508-.183.606.303 2.326.643 1.113.138.689.68.782 1.571.23 1.094.505.717 1.159.827.671.809.634.101.368.193.46 1.194.276.377.607.138 1.489-.101.855-.542 1.287-2.776.414-.367.653-.193 1.314.377.276-.028.865-.928 1.02-.607.395-.009 1.462.901.193.009 1.085-1.029.699-.451 1.866-.266.763-.331.975-.827 1.315-.515 2.188-2.132.285-.404.257-.8.451-.542.542-.101.947.377 1.048.165 1.343-.864.809-.358.662-.937 1.508-.91 1.103-.028.625-.211.34-.331.469-.928.009-.331-.266-.854.138-.662.625-.754.028-.698.275-.487-.257-1.177.101-.422.349-.258.368-.863.506-.552 1.195-.478.947.23-.184-.386.138-.809-.028-1.608-.22-2.141-.607-1.231-1.756-2.408-.616-6.709 2.731-3.777.625-1.773-.451-.928-.441-.515-.782-.515-1.112-1.332-1.076-.111-.459-.477-.58-1.351-.367-.248-1.205-.515-.984-.165-.891.055-.479.257-.753.092-.865-.221-1.149.083-.579-.34-.147-.34-.157-1.14.074-1.81.257-.68.377-.533 1.168-.496.634-.11 1.177.101 1.526-1.416 1.196.046.781-.367 1.389-1.342.533-.827.276-.211 1.903-1.039.496-.147 1.526-1.038.616-1.232.083-2.031.221-.45.57-.542 1.14-.515 1.995-1.397.303-1.112 1.03-.735.34-.386.681-1.406.965-.992 1.094-.524.598-.046.809.294.377-.009.156-.175.156-.753.203-.184.625.423.956.33.809.01.395-.138.819-.827.276-.469.147-1.673-.837-1.452.313-.827.597-.606.111-.671.156-.267.551-.266h.736l1.719.956.745.184h.708l.965-.478 1.186-1.011.626-.276 1.618-1.663.744-.285 2.464-2.353.993-.377.754-.027 1.168.285.368-.57.643-.496.414-.166.184-.257.092-1.443zm-79.271 47.263-.331.422.083.607-.359-.046-.147.101-.266.625-.046.441.128.313-.312.229-.441.69.524.689.156.505v.818l-.138.506-.873 1.047-.304.212-.588.082-.331-.229-.396-.855.148-.377-.662-.211-.993-.083-.993.8-.019.441-.524.064-.634-.129-.156-.229-.331.211-.148-.046-.303-.772-.441-.23-.304.166-.266-.193-.855-.212-.083-.312.11-1.342.129-.799.414-1.149.092-.772 1.103-1.213h.129l.092.165.947.193.763-.34.239-.312.193-.018 1.471.771.524-.101.506.249.331-.607.652.064.644-.689.552-.101.349-.57.414-.101.036.653.469.422z", "offset": "10,0"}	2025-12-26 13:32:47	2026-02-14 17:03:23
176	70	\N	\N	\N	\N	{"code": "UZ-SU", "path": "m527.068 422.243-.947 3.244-.129 1.131-2.114 2.224-1.508 2.848.064 1.443-.432 1.02.083.726-.322.818-2.298 1.075-3.724.644-.745 1.323-2.905 6.203-1.057 1.526-1.26.9-2.105 2.729-.966 2.234-1.167 2.233-1.462 1.406-1.094 3.565-.046 2.353.239 3.685-.515 6.12-.653 2.234-.625.404-.543-1.02-1.379-1.103-.68-.202-1.269.138-.386-.055-.791-.699-.919-.542-.561.083-1.26.505-.616.496-.358.46-.644.083-.386-.598-.386-1.259-.68-.661-.754-.368-.616.129-.524.349-1.72 1.581-1.241.422-1.057.625-1.159.101-1.691.432-.883.947-1.379.579-.497-.184-.79-.708-.156-1.406-.258-.45-.708-.34-.34-.8-.248-.248-.892-.349-.414-.312-.643.137-.423-.11-1.398-.781-.423-.652.331-1.406-.294-.772-1.591-.791-1.25-1.295-.395-.239-1.775-.662-1.728.119-3.292 1.462-1.452-.175-.754.064-2.051.699-1.792-.451-.874.01-1.011.34-1.471-.34-1.333.211-1.076-.11-1.646.064-1.204.496-.368-1.847.156-.606.396-.57.79-.579 1.039-.533 2.795-.836.276-.671.009-.69-.395-1.01-4.193-5.092-.239-1.369.515-5.164-.266-1.407v-.551l.413-2.858.681-1.645.671-1.029.708-.699.496-1.167.515-.671 2.096-1.222.396-.367.22-.763-.027-.818-.497-.965-.248-.827.956-3.924.396-1.149 10.646-11.119 3.255-1.701 1.683-1.176 2.225-2.233.413-.799.34-1.287.148-1.397.662-3.078 8.173-8.161 1.094-2.04.745-1.195.542-.588.414-.312 1.048-.304 1.315.065.919.294 1.297 1.314.496.165 1.232-3.951-.119-3.86-.138-.478-.35-.423-.937-1.929-.497-2.886.055-.368.414-.772.616-.523.469-.23.791-.239 3.668-.211.901-.533.736-.754.358.487.625.267.837-.294.57.22.956-.662 1.885-.174 1.241.753 1.352.129.965-1.241 1.885-.064.956-.505.414.009 1.02 1.066.938.23 1.692-.91 1.149.128 1.14.754.8 1.691.285.946 2.473 1.93.083.735-.129 1.14-.322.202.276 1.985-1.158.598-.543.827-.947.294-2.298.367-.322.515 2.326 3.382-.331.615-1.462.175-1.167 1.121.386 1.36.8 1.783-.009.414-.433.514-.303 4.88 2.225 2.95.919.744-.34 1.03-.855 1.332-.23.928.414.009 1.361-.597.423.009 1.535.864 1.296 2.206.194.726.073 1.25.202.211 1.232.441 1.333.653.92.634 1.811 2.325.018.349.662 1.213 1.003 1.369-.01.726z", "offset": "5,10"}	2025-12-26 13:32:12	2026-02-14 19:24:06
516	156	\N	\N	\N	ru	{"title": "CHINOR", "description": "CHINOR", "description1": null}	2025-12-31 01:02:51	2026-02-24 04:39:40
496	150	148	Yillar	yillar-1	ru	{"title": "Сезон 2025 года"}	2025-12-30 16:47:11	2026-02-24 08:34:57
497	150	148	Yillar	yillar-1	en	{"title": "2025 Season"}	2025-12-30 16:47:11	2026-02-24 08:34:57
547	165	\N	\N	\N	uz	{"title": "Transfor"}	2026-01-05 05:39:04	2026-02-06 06:41:40
488	148	\N	\N	\N	ru	{"title": "ANOR", "description": "ANOR", "description1": null}	2025-12-30 16:43:36	2026-02-25 12:40:43
517	156	\N	\N	\N	en	{"title": "CHINOR", "description": "CHINOR", "description1": null}	2025-12-31 01:02:51	2026-02-24 04:39:40
515	156	\N	\N	\N	uz	{"title": "CHINOR", "description": "CHINOR", "description1": "<p><span style=\\"letter-spacing: 0.14px;\\">Loyiha Haqida...</span></p>"}	2025-12-31 01:02:51	2026-02-24 04:39:40
548	165	\N	\N	\N	ru	{"title": null}	2026-01-05 05:39:04	2026-02-06 06:41:40
549	165	\N	\N	\N	en	{"title": null}	2026-01-05 05:39:04	2026-02-06 06:41:40
550	165	\N	\N	\N	\N	{"age": "43", "email": "sattarov@vatandoshlarfondi.uz", "phone": "+998(55) 502-22-55"}	2026-01-05 05:39:04	2026-02-06 06:41:40
369	103	\N	\N	\N	ru	{"title": null}	2025-12-28 06:29:11	2026-02-14 19:36:27
370	103	\N	\N	\N	en	{"title": null}	2025-12-28 06:29:11	2026-02-14 19:36:27
182	60	\N	\N	\N	en	{"title": "The Republic of Karakalpakstan", "description": "The Republic of Karakalpakstan – an autonomy within Uzbekistan, a vast region with unique natural features located in the northwest of the country. The capital of the republic, Nukus city, is known as a modern center of culture and art, where the Savitsky State Art Museum is distinguished by unique art collections famous throughout the world. Important historical and ecological monuments such as Moynaq city, the Aral Sea tragedy, and the ancient Kungrad Fortress are located on the territory of Karakalpakstan. The Ustyurt Plateau, Sudochye Lake, and Badai-Tugai Reserve of the republic possess unique natural landscapes and rare flora and fauna. Ruins from the ancient Khorezmian civilization – Ayaz-Kala, Toprak-Kala, and Kunya-Urgench – are inscribed on the UNESCO World Heritage List. The rich national culture of the Karakalpak people, traditional costumes, musical art, and hospitality create the unique character of the republic."}	2025-12-26 13:38:23	2026-02-14 20:41:41
368	103	\N	\N	\N	uz	{"title": null}	2025-12-28 06:29:11	2026-02-14 19:36:27
298	75	\N	\N	\N	en	{"title": null}	2025-12-28 06:10:28	2026-02-14 20:47:35
814	237	\N	\N	\N	uz	{"title": "Finlyandiya"}	2026-02-18 05:23:52	2026-02-18 05:23:52
815	237	\N	\N	\N	ru	{"title": "Финляндия"}	2026-02-18 05:23:52	2026-02-18 05:23:52
816	237	\N	\N	\N	en	{"title": "Finland"}	2026-02-18 05:23:52	2026-02-18 05:23:52
817	237	\N	\N	\N	\N	{"code": "FI"}	2026-02-18 05:23:52	2026-02-18 05:23:52
470	143	\N	\N	\N	uz	{"title": "<p><a href=\\"http://&lt;iframe width=&quot;560&quot; height=&quot;315&quot; src=&quot;https://www.youtube.com/embed/JhUEpd9GjRI?si=QapSvR0lTl0YTiAp&quot; title=&quot;YouTube video player&quot; frameborder=&quot;0&quot; allow=&quot;accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share&quot; referrerpolicy=&quot;strict-origin-when-cross-origin&quot; allowfullscreen&gt;&lt;/iframe&gt;\\" target=\\"_blank\\"><iframe width=\\"560\\" height=\\"315\\" src=\\"https://www.youtube.com/embed/JhUEpd9GjRI?si=QapSvR0lTl0YTiAp\\" title=\\"YouTube video player\\" frameborder=\\"0\\" allow=\\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\\" referrerpolicy=\\"strict-origin-when-cross-origin\\" allowfullscreen=\\"\\"></iframe></a><br></p>"}	2025-12-30 07:36:01	2025-12-30 07:36:01
471	143	\N	\N	\N	ru	{"title": null}	2025-12-30 07:36:01	2025-12-30 07:36:01
472	143	\N	\N	\N	en	{"title": null}	2025-12-30 07:36:01	2025-12-30 07:36:01
430	131	\N	\N	\N	en	{"title": null}	2025-12-29 12:29:53	2025-12-29 13:02:43
431	131	\N	\N	\N	\N	{"url": "www.youtube.com/embed/1AHaFE9NOYo?si=IDkDf0Zvw7cyALnS"}	2025-12-29 12:29:53	2025-12-29 13:02:43
189	63	\N	\N	\N	uz	{"title": "Farg'ona", "description": "Farg'ona viloyati – Farg'ona vodiysining markazida joylashgan sersuv va boy hudud bo'lib, rivojlangan sanoati va qishloq xo'jaligi bilan mashhur. Viloyat markazi Farg'ona shahri zamonaviy madaniy va iqtisodiy markaz hisoblanadi. Bu yerdagi Xo'qand xonligi davridagi tarixiy yodgorliklar, qadimiy madrasalar va ziyoratgohlar viloyatning boy madaniy merosidan darak beradi. Farg'ona viloyati neft va gaz ishlab chiqarish, kimyo sanoati hamda ipakchilik bilan ajralib turadi. Viloyatning paxta dalalari, meva bog'lari va yashil vodiylari ajoyib tabiiy manzaralarni yaratadi. Farg'ona xalqining mehmondo'stligi, milliy hunarmandchiligi va boy oshpazlik an'analari har bir mehmonni iliq qabul qiladi."}	2025-12-26 13:45:33	2026-02-14 20:22:01
323	84	\N	\N	\N	uz	{"title": null}	2025-12-28 06:17:19	2026-02-14 20:23:41
567	170	\N	\N	\N	uz	{"title": "bersz"}	2026-01-05 07:12:24	2026-01-05 08:22:48
568	170	\N	\N	\N	ru	{"title": null}	2026-01-05 07:12:24	2026-01-05 08:22:48
324	84	\N	\N	\N	ru	{"title": null}	2025-12-28 06:17:19	2026-02-14 20:23:41
325	84	\N	\N	\N	en	{"title": null}	2025-12-28 06:17:19	2026-02-14 20:23:41
326	85	\N	\N	\N	uz	{"title": null}	2025-12-28 06:20:50	2026-02-14 20:25:34
327	85	\N	\N	\N	ru	{"title": null}	2025-12-28 06:20:50	2026-02-14 20:25:34
328	85	\N	\N	\N	en	{"title": null}	2025-12-28 06:20:50	2026-02-14 20:25:34
299	76	\N	\N	\N	uz	{"title": null}	2025-12-28 06:10:55	2026-02-14 20:48:14
300	76	\N	\N	\N	ru	{"title": null}	2025-12-28 06:10:55	2026-02-14 20:48:14
569	170	\N	\N	\N	en	{"title": null}	2026-01-05 07:12:24	2026-01-05 08:22:48
374	105	\N	\N	\N	uz	{"title": null}	2025-12-28 06:30:40	2026-02-14 19:24:34
1592	507	503	Rahbar	rahbar-5	uz	{"title": "Abdumalik Ahmedov", "description": "Rahbari"}	2026-02-24 04:23:46	2026-02-24 09:27:34
1593	507	503	Rahbar	rahbar-5	ru	{"title": "Абдумалик Ахмедов", "description": "Руководитель"}	2026-02-24 04:23:46	2026-02-24 09:27:34
375	105	\N	\N	\N	ru	{"title": null}	2025-12-28 06:30:40	2026-02-14 19:24:34
376	105	\N	\N	\N	en	{"title": null}	2025-12-28 06:30:40	2026-02-14 19:24:34
371	104	\N	\N	\N	uz	{"title": null}	2025-12-28 06:29:41	2026-02-14 19:36:58
372	104	\N	\N	\N	ru	{"title": null}	2025-12-28 06:29:41	2026-02-14 19:36:58
373	104	\N	\N	\N	en	{"title": null}	2025-12-28 06:29:41	2026-02-14 19:36:58
203	67	\N	\N	\N	en	{"title": "Kashkadarya", "description": "Kashkadarya Region – a historically and culturally rich region located in the southern part of Uzbekistan, famous for its ancient cities and magnificent natural landscapes. The regional center, Karshi city – known by its ancient name Nakhshab, is a city with a thousand-year history. The ancient fortress of Karshi, Kok Gumbaz Mosque, Abdulaziz Khan Madrasah, and other historical monuments are unique examples of Islamic architecture. Kashkadarya is also famous for the city of Shakhrisabz – the birthplace of Amir Temur, where the Ak-Saray, Dorut Tilovat, and Dorus Saodat complexes are inscribed on the UNESCO World Heritage List. Ancient madrasahs, pilgrimage sites, and archaeological monuments in the Kitab and Guzar districts testify to the region's rich history. The mountainous areas of the region, green valleys, and national crafts in traditional villages continue to thrive today."}	2025-12-26 13:48:32	2026-02-14 19:49:45
347	96	\N	\N	\N	uz	{"title": null}	2025-12-28 06:25:23	2026-02-14 19:50:31
348	96	\N	\N	\N	ru	{"title": null}	2025-12-28 06:25:23	2026-02-14 19:50:31
349	96	\N	\N	\N	en	{"title": null}	2025-12-28 06:25:23	2026-02-14 19:50:31
350	97	\N	\N	\N	uz	{"title": null}	2025-12-28 06:25:45	2026-02-14 19:51:20
351	97	\N	\N	\N	ru	{"title": null}	2025-12-28 06:25:45	2026-02-14 19:51:20
352	97	\N	\N	\N	en	{"title": null}	2025-12-28 06:25:45	2026-02-14 19:51:20
200	66	\N	\N	\N	en	{"title": "Navoiy", "description": "Navoiy Region – a relatively young but rapidly developing region located in the center of Uzbekistan, distinguished by its rich natural resources and ancient historical monuments. The regional center, Navoiy city, is known as a modern industrial and cultural center. This region, located in the Kyzylkum Desert, is famous for mining gold, uranium, and other precious minerals. In Navoiy Region, unique natural sites such as Zarafshan city, Nurata Mountains, and Aydar Lake attract tourists. Ancient petroglyphs in the Nurata Mountains, Sarmishsay rock paintings, and archaeological monuments testify to a thousand-year history. Ancient caravanserais, fortresses, and pilgrimage sites along the Silk Road reflect the rich cultural heritage of Central Asia. The traditional way of life, agriculture, and livestock farming in the desert areas have been preserved to this day."}	2025-12-26 13:47:33	2026-02-14 19:55:12
301	76	\N	\N	\N	en	{"title": null}	2025-12-28 06:10:55	2026-02-14 20:48:14
818	238	\N	\N	\N	uz	{"title": "Chexiya"}	2026-02-18 05:25:38	2026-02-18 05:25:38
819	238	\N	\N	\N	ru	{"title": "Чехия"}	2026-02-18 05:25:38	2026-02-18 05:25:38
820	238	\N	\N	\N	en	{"title": "Czech Republic"}	2026-02-18 05:25:38	2026-02-18 05:25:38
821	238	\N	\N	\N	\N	{"code": "CZ"}	2026-02-18 05:25:38	2026-02-18 05:25:38
30	14	\N	\N	\N	ru	{"title": "Саттаров Одилджон Бердымуратович", "description": "Председатель правления общественного фонда «Ватандошлар»"}	2025-12-23 05:32:28	2026-02-24 07:59:41
1594	507	503	Rahbar	rahbar-5	en	{"title": "Abdumalik Ahmedov", "description": "Head"}	2026-02-24 04:23:46	2026-02-24 09:27:34
1595	507	503	Rahbar	rahbar-5	\N	{"email": "executive_management@mahalla.us", "phone": null}	2026-02-24 04:23:46	2026-02-24 09:27:34
579	173	\N	\N	\N	uz	{"title": "mbh0223"}	2026-01-05 07:22:35	2026-01-05 07:22:35
580	173	\N	\N	\N	ru	{"title": null}	2026-01-05 07:22:35	2026-01-05 07:22:35
581	173	\N	\N	\N	en	{"title": null}	2026-01-05 07:22:35	2026-01-05 07:22:35
582	173	\N	\N	\N	\N	{"age": null, "email": null, "phone": null}	2026-01-05 07:22:35	2026-01-05 07:22:35
551	166	\N	\N	\N	uz	{"title": "Biz barcha vatandoshlarni birlashtirib ularga kerakli mativatsiya"}	2026-01-05 05:39:36	2026-01-05 08:21:09
552	166	\N	\N	\N	ru	{"title": null}	2026-01-05 05:39:36	2026-01-05 08:21:09
553	166	\N	\N	\N	en	{"title": null}	2026-01-05 05:39:36	2026-01-05 08:21:09
554	166	\N	\N	\N	\N	{"age": "32", "email": "sadikov_bahodir@gmail.com", "phone": "+998(55) 502-22-99"}	2026-01-05 05:39:36	2026-01-05 08:21:09
329	86	\N	\N	\N	uz	{"title": null}	2025-12-28 06:22:02	2026-02-14 20:16:42
330	86	\N	\N	\N	ru	{"title": null}	2025-12-28 06:22:02	2026-02-14 20:16:42
331	86	\N	\N	\N	en	{"title": null}	2025-12-28 06:22:02	2026-02-14 20:16:42
234	86	64	video	video-4	\N	{"url": "https://youtu.be/WWgbG_z5LCE?si=ZiY7awv_YywPJ1Zt"}	2025-12-26 14:20:10	2026-02-14 20:16:42
235	87	64	video	video-4	\N	{"url": "https://youtu.be/l4XxG7Owlqw?si=oJ-3eX5egDRv1PA-"}	2025-12-26 14:20:28	2026-02-14 20:18:00
236	88	64	video	video-4	\N	{"url": "https://youtu.be/CU2bsaSUHnk?si=mOtxHnjCUSFmo4lf"}	2025-12-26 14:20:46	2026-02-14 20:19:05
231	83	63	video	video-3	\N	{"url": "https://youtu.be/k5Fx9WfEGe8?si=JproNJ7N2RjvGt0a"}	2025-12-26 14:18:56	2026-02-14 20:23:00
232	84	63	video	video-3	\N	{"url": "https://youtu.be/Uk5Engu_8xk?si=jE52NhsHTkRhgOt2"}	2025-12-26 14:19:13	2026-02-14 20:23:41
233	85	63	video	video-3	\N	{"url": "https://youtu.be/twPTNM8G_5E?si=kAz4EiCh8mS6iqXy"}	2025-12-26 14:19:30	2026-02-14 20:25:34
228	80	62	video	video-2	\N	{"url": "https://youtu.be/_OkJCK_79co?si=sqwAEb7jqj3jB2j8"}	2025-12-26 14:17:34	2026-02-14 20:29:45
229	81	62	video	video-2	\N	{"url": "https://youtu.be/_ZH1WsIr2Zk?si=Pe-7R02AwxdrCue2"}	2025-12-26 14:17:51	2026-02-14 20:30:47
210	70	\N	\N	\N	uz	{"title": "Surxondaryo", "description": "Surxondaryo viloyati – O'zbekistonning eng janubiy hududi bo'lib, qadimiy tarix, boy madaniy meros va noyob tabiiy go'zalliklari bilan ajralib turadi. Viloyatning eng qadimiy shahri va markazi bo'lgan Termizda va uning atrofida zardushtiylar, nestorianlar, buddistlar kabi turli xalqlarning shaharlari va qalʼalarining xarobalari, meʼmorchilik va arxeologiya obidalari, shuningdek islom meʼmorchiligi yodgorliklari saqlanib qolgan. Termizdan uncha uzoq bo'lmagan joyda esa, fil suyagidan yasalgan shaxmat donalari topilgan. Fayoz tepa, Qoratepa, Dalvarzintepa kabi qadimiy buddistik majmualar va Imom at-Termiziy, Hakim at-Termiziy maqbaralari kabi muqaddas ziyoratgohlar viloyatning boy tarixidan darak beradi. Surxondaryo Omudaryo boʻyidagi paxta dalalari, yashil vodiylar va Boysun tog'larining ajoyib manzaralari bilan har bir tashrif buyuruvchini maftun etadi."}	2025-12-26 13:51:09	2026-02-14 19:24:06
208	69	\N	\N	\N	ru	{"title": null, "description": null}	2025-12-26 13:49:52	2026-02-14 19:30:16
218	72	\N	\N	\N	en	{"title": "Khorezm", "description": "Khorezm Region – a historical territory that was the center of the ancient Khorezmshah state, famous for its rich cultural heritage and magnificent architectural monuments. Located not far from the regional center of Urgench, the city of Khiva is an open-air museum inscribed on the UNESCO World Heritage List. Inside Ichan-Kala, unique examples of Islamic architecture such as Kalta Minor, Tash Khovli, Juma Mosque, and the Mausoleum of Pahlavan Mahmud have been preserved. In the Khorezm territory, ruins of ancient cities such as Toprak-Kala, Ayaz-Kala, and Kunya-Urgench, archaeological layers, and cultural monuments testify to the most ancient civilizations of Central Asia. The natural landscapes along the Amu Darya and the beauty of the region's sandy deserts captivate every traveler."}	2025-12-26 13:52:31	2026-02-14 16:55:14
209	69	\N	\N	\N	en	{"title": null, "description": null}	2025-12-26 13:49:52	2026-02-14 19:30:16
230	82	62	video	video-2	\N	{"url": "https://youtu.be/9Mz0czLRT74?si=hJf26yMemIAHdINR"}	2025-12-26 14:18:09	2026-02-14 20:31:27
302	77	\N	\N	\N	uz	{"title": null}	2025-12-28 06:11:54	2026-02-14 20:35:53
303	77	\N	\N	\N	ru	{"title": null}	2025-12-28 06:11:54	2026-02-14 20:35:53
304	77	\N	\N	\N	en	{"title": null}	2025-12-28 06:11:54	2026-02-14 20:35:53
225	77	61	video	video-1	\N	{"url": "https://youtu.be/1kyocWKc5_w?si=RPJcVqL31nqJGTh5"}	2025-12-26 13:57:36	2026-02-14 20:35:53
226	78	61	video	video-1	\N	{"url": "https://youtu.be/y2DZVrR6WCo?si=JmyZ9J-bKJ_Sqy4y"}	2025-12-26 13:57:53	2026-02-14 20:37:26
227	79	61	video	video-1	\N	{"url": "https://youtu.be/qJ-L22_Fg3k?si=XD0ueLY6-Qjx01q7"}	2025-12-26 13:58:11	2026-02-14 20:38:48
222	74	60	video	video	\N	{"url": "https://youtu.be/n1o9aoZciU8?si=aKzIMpgPU2jvYsSL"}	2025-12-26 13:55:58	2026-02-14 20:46:56
223	75	60	video	video	\N	{"url": "https://youtu.be/P7psJ-aTsrk?si=HeMpHW7LEZ-_ADdV"}	2025-12-26 13:56:16	2026-02-14 20:47:35
224	76	60	video	video	\N	{"url": "https://youtu.be/6F62mOqHjqM?si=ozB32l8ZvNBhDHWC"}	2025-12-26 13:56:35	2026-02-14 20:48:14
538	162	\N	\N	\N	ru	{"title": null}	2026-01-05 05:00:18	2026-02-23 09:56:53
537	162	\N	\N	\N	uz	{"title": "\\"Vatandoshlar\\" elektron gazetasining 2-soni"}	2026-01-05 05:00:18	2026-02-23 09:56:53
539	162	\N	\N	\N	en	{"title": null}	2026-01-05 05:00:18	2026-02-23 09:56:53
899	261	\N	\N	\N	uz	{"title": "Tojikiston"}	2026-02-18 07:18:26	2026-02-18 07:18:55
902	261	\N	\N	\N	\N	{"code": "tj"}	2026-02-18 07:18:26	2026-02-18 07:18:55
823	239	\N	\N	\N	ru	{"title": "Швеция"}	2026-02-18 05:27:03	2026-02-18 09:17:16
824	239	\N	\N	\N	en	{"title": "Sweden"}	2026-02-18 05:27:03	2026-02-18 09:17:16
825	239	\N	\N	\N	\N	{"code": "SE"}	2026-02-18 05:27:03	2026-02-18 09:17:16
1596	508	150	Video	video-15	uz	{"title": "Yurtdoshlarni qo’llash 1"}	2026-02-24 04:47:30	2026-02-24 04:49:16
1597	508	150	Video	video-15	ru	{"title": null}	2026-02-24 04:47:30	2026-02-24 04:49:16
1598	508	150	Video	video-15	en	{"title": null}	2026-02-24 04:47:30	2026-02-24 04:49:16
1599	508	150	Video	video-15	\N	{"date_at": "2025-06-01T13:30"}	2026-02-24 04:47:30	2026-02-24 04:49:16
146	14	\N	\N	\N	en	{"title": "Sattarov Odiljon Berdimuratovich", "description": "Chairman of the Board of the public foundation ”Vatandoshlar\\""}	2025-12-26 05:14:06	2026-02-24 07:59:41
1673	532	\N	\N	\N	ru	{"title": null, "value": null, "placeholder": null}	2026-02-25 05:58:08	2026-02-25 06:27:16
1674	532	\N	\N	\N	en	{"title": null, "value": null, "placeholder": null}	2026-02-25 05:58:08	2026-02-25 06:27:16
1675	532	\N	\N	\N	\N	{"key": "birthdate", "type": "text", "column": "4", "required": "1"}	2026-02-25 05:58:08	2026-02-25 06:27:16
1676	533	\N	\N	\N	uz	{"title": "Jinsi", "value": "Erkak,Ayol", "placeholder": "Tanlang"}	2026-02-25 05:59:06	2026-02-25 06:27:21
436	133	\N	\N	\N	uz	{"title": "Malaka oshirish"}	2025-12-29 12:31:16	2025-12-29 12:31:16
437	133	\N	\N	\N	ru	{"title": null}	2025-12-29 12:31:16	2025-12-29 12:31:16
438	133	\N	\N	\N	en	{"title": null}	2025-12-29 12:31:16	2025-12-29 12:31:16
439	133	\N	\N	\N	\N	{"url": null}	2025-12-29 12:31:16	2025-12-29 12:31:16
241	90	89	video	video-6	\N	{"url": "https://youtu.be/bSivTtWAoK4?si=0JDD0Gsp2VBJlPVa"}	2025-12-26 14:26:17	2026-02-14 20:05:07
242	91	89	video	video-6	\N	{"url": "https://youtu.be/NcPSzOub-Xg?si=CeM9iQZJRfvKko4q"}	2025-12-26 14:26:32	2026-02-14 20:06:34
243	92	89	video	video-6	\N	{"url": "https://youtu.be/TEfa0pRu5wU?si=gXzP0bf_7nb3Rrsi"}	2025-12-26 14:26:48	2026-02-14 20:09:21
261	110	71	video	video-12	\N	{"url": "https://youtu.be/L_VPN2r2SG8?si=bkwQAtKUU9cz4d1P"}	2025-12-26 14:33:48	2026-02-15 15:36:16
584	3	\N	\N	\N	en	{"title": "E-books"}	2026-01-05 08:15:05	2026-02-13 10:17:25
583	2	\N	\N	\N	en	{"title": "Number of compatriots who participated"}	2026-01-05 08:12:34	2026-02-13 10:16:39
585	174	\N	\N	\N	uz	{"title": "Adabiyotlar"}	2026-01-05 08:15:32	2026-02-13 10:17:59
586	174	\N	\N	\N	ru	{"title": "Литература"}	2026-01-05 08:15:32	2026-02-13 10:17:59
587	174	\N	\N	\N	en	{"title": "Literature"}	2026-01-05 08:15:32	2026-02-13 10:17:59
266	115	73	video	video-14	\N	{"url": "https://youtu.be/I0noLTP53Bw?si=MnFb460CZPpvvJ5m"}	2025-12-26 14:36:11	2026-02-14 16:49:22
267	116	73	video	video-14	\N	{"url": "https://youtu.be/Op2s5WaKHZE?si=qq1By5xOTg0l00iB"}	2025-12-26 14:36:27	2026-02-14 16:50:03
262	111	72	video	video-13	\N	{"url": "https://youtu.be/CkBlQxN2wk0?si=SLG-CHL5SX6NlwGu"}	2025-12-26 14:34:51	2026-02-14 16:56:50
264	113	72	video	video-13	\N	{"url": "https://youtu.be/KrL6B40wBok?si=1rK077FumqvtMB59"}	2025-12-26 14:35:23	2026-02-14 16:58:58
263	112	72	video	video-13	\N	{"url": "https://youtu.be/Hv2apof4n0s?si=WHqG4nWAGFUTWzim"}	2025-12-26 14:35:10	2026-02-14 16:58:02
259	108	71	video	video-12	\N	{"url": "https://youtube.com/shorts/rT0xOZW2Zpg?si=qCYdrbugM44TGuNy"}	2025-12-26 14:33:17	2026-02-14 19:16:18
260	109	71	video	video-12	\N	{"url": "https://youtu.be/b2BmSkJaqTs?si=DBiRi7j8J3m8mlKI"}	2025-12-26 14:33:35	2026-02-14 19:19:14
256	105	70	video	video-11	\N	{"url": "https://youtu.be/jvGTkkKa6OI?si=tOykJFrvSBNYbWdb"}	2025-12-26 14:32:13	2026-02-14 19:24:34
377	106	\N	\N	\N	uz	{"title": null}	2025-12-28 06:30:53	2026-02-14 19:25:16
378	106	\N	\N	\N	ru	{"title": null}	2025-12-28 06:30:53	2026-02-14 19:25:16
379	106	\N	\N	\N	en	{"title": null}	2025-12-28 06:30:53	2026-02-14 19:25:16
257	106	70	video	video-11	\N	{"url": "https://youtu.be/pfCCMz1qHtc?si=4oeGwFvPqTE6CbSF"}	2025-12-26 14:32:30	2026-02-14 19:25:16
258	107	70	video	video-11	\N	{"url": "https://youtu.be/wdE1FTTR5q4?si=SYJsMgXup196Mf0g"}	2025-12-26 14:32:43	2026-02-14 19:27:09
253	102	69	video	video-10	\N	{"url": "https://youtu.be/BMDA77DdiQw?si=euENCFKrhhj0KVl1"}	2025-12-26 14:30:52	2026-02-14 19:30:40
255	104	69	video	video-10	\N	{"url": "https://youtu.be/KmnFO-0igTs?si=vX2uE8cxY221K9hY"}	2025-12-26 14:31:24	2026-02-14 19:36:58
254	103	69	video	video-10	\N	{"url": "https://youtu.be/S3F6r9kOM0U?si=upXOGso4iD0xT1CQ"}	2025-12-26 14:31:09	2026-02-14 19:36:27
250	99	68	video	video-9	\N	{"url": "https://youtu.be/9rArLIzKLNs?si=bZWJ3RG2s6XD2Juq"}	2025-12-26 14:29:51	2026-02-14 19:44:20
251	100	68	video	video-9	\N	{"url": "https://youtu.be/vabrXxXuWzY?si=8eQHjLo54tEEIym_"}	2025-12-26 14:30:05	2026-02-14 19:45:19
252	101	68	video	video-9	\N	{"url": "https://youtu.be/37lGuje4hfs?si=pWgjIEL650nZ4vA2"}	2025-12-26 14:30:18	2026-02-14 19:46:33
247	96	67	video	video-8	\N	{"url": "https://youtu.be/bslt3rFjrPE?si=ukjoFWQaAiVQrXuU"}	2025-12-26 14:28:39	2026-02-14 19:50:31
248	97	67	video	video-8	\N	{"url": "https://youtu.be/rYWucAPBMMo?si=XHRVjjUtOWvDUJLs"}	2025-12-26 14:28:53	2026-02-14 19:51:20
353	98	\N	\N	\N	uz	{"title": null}	2025-12-28 06:26:01	2026-02-14 19:52:14
354	98	\N	\N	\N	ru	{"title": null}	2025-12-28 06:26:01	2026-02-14 19:52:14
355	98	\N	\N	\N	en	{"title": null}	2025-12-28 06:26:01	2026-02-14 19:52:14
249	98	67	video	video-8	\N	{"url": "https://youtu.be/ehKbw1tkOFs?si=dmdSsaDMiAHbh33U"}	2025-12-26 14:29:06	2026-02-14 19:52:14
244	93	66	video	video-7	\N	{"url": "https://youtu.be/_m2DoVUWtL0?si=REdU_lOG-DYp-DsD"}	2025-12-26 14:27:29	2026-02-14 19:55:50
245	94	66	video	video-7	\N	{"url": "https://youtu.be/L-fxz-k9s5U?si=grp4pPtm5bF2uQ1e"}	2025-12-26 14:27:50	2026-02-14 19:56:32
246	95	66	video	video-7	\N	{"url": "https://youtu.be/_OBYsk50Sag?si=dKxi2gVIADM9xab8"}	2025-12-26 14:28:05	2026-02-14 19:57:26
826	240	\N	\N	\N	uz	{"title": "Lyuksemburg"}	2026-02-18 05:34:42	2026-02-18 05:34:42
827	240	\N	\N	\N	ru	{"title": "Люксембург"}	2026-02-18 05:34:42	2026-02-18 05:34:42
828	240	\N	\N	\N	en	{"title": "Luxembourg"}	2026-02-18 05:34:42	2026-02-18 05:34:42
829	240	\N	\N	\N	\N	{"code": "LU"}	2026-02-18 05:34:42	2026-02-18 05:34:42
1565	498	497	Tashkilot haqida	nomi-7	ru	{"title": "Американо-узбекская ассоциация", "description": "<p>Основные цели организации:</p><ul><li>Поддержка и объединение узбекской диаспоры, проживающей в США.</li><li>Содействие культурному, академическому и профессиональному обмену между народами США и Узбекистана.</li></ul><p>Основные задачи:</p><ul><li>Организация академических и социальных программ, включая создание возможностей для молодежи, студентов и профессионалов.</li><li>Поддержка обмена в области образования, культуры, языка и профессиональных навыков между Узбекистаном и США.</li><li>Укрепление сотрудничества через ресурсы, семинары и мероприятия для диаспоры.</li></ul>"}	2026-02-23 09:22:59	2026-02-23 09:22:59
1602	509	150	Video	video-15	en	{"title": null}	2026-02-24 04:47:35	2026-02-24 04:49:41
1603	509	150	Video	video-15	\N	{"date_at": "2025-06-01T13:30"}	2026-02-24 04:47:35	2026-02-24 04:49:41
1601	509	150	Video	video-15	ru	{"title": null}	2026-02-24 04:47:35	2026-02-24 04:49:41
1635	520	227	Yillar	yillar-1	uz	{"title": "2026 - yilgi mavsum"}	2026-02-24 08:16:30	2026-02-24 08:18:54
1636	520	227	Yillar	yillar-1	ru	{"title": null}	2026-02-24 08:16:30	2026-02-24 08:18:54
1637	520	227	Yillar	yillar-1	en	{"title": null}	2026-02-24 08:16:30	2026-02-24 08:18:54
170	64	\N	\N	\N	\N	{"code": "UZ-JI", "path": "m533.83 344.342-.441.23-.193 1.415-.294.937-.754.671-.993-.349-1.058.239-2.721-.432-1.71.744-.359-.11-.726-.699-.469-.22-1.305-.294-1.628-.193-1.158.129-.855.238-.681-.119-.937-.542-.681.092-2.05-.147-.892-.441-.68-.175-1.002.083-.552-.138-1.011-.781-.837-.34-1.26-.074-.845.092-1.72-.772-.882-.809-1.269-.073-2.234-1.516-.644.358-1.112.294-1.775-.763-.368-.009-.809.937-1.002.35-.588.413-.864 1.406-.534.147-1.314.028-3.66 1.369-.11.625.184 1.48-.377.468-2.041-.505-.423.101-.322.735-.018 1.204.294.469-4.165-3.511-.947-.965-.598-.882-.193-.873-.018-3.823.092-.34 2.96-4.815.699-.837.635-.496 1.985-.947 1.416-.349 1.196-.138-.074-.937-.984-5.477-.193-.221-10.913-2.325-4.423-.367-1.949-.735-5.36-3.612-.322-3.409.092-.322 1.14-.267.221-.147.414-1.231.064-.744-1.324-2.583-1.71-1.525-.772-3.768-.092-3.612.129-.707.763-1.682-.009-1.011-.883-2.003-4.239-.092-7.162-.846.671-1.645 4.073-7.894 2.869-4.889.257-.68-1.443-6.304-.212-.487-.229-.211-3.926-.965-.874-.533-.662-1.167-1.039-9.778 6.17-.202.266-2.693.203.037.478-4.375 15.997 1.204 4.266.478 2.501.009.782.515.799.119 1.15-.376 1.167-.184 14.168.432 1.297 1.185.8.212 1.884 2.288 3.053 2.83 1.351-1.194.773 1.093 2.804-1.819 1.269 1.185.542-.239.726.432-2.271.487-1.296 1.36 1.278 3.171-1.361 1.351.074 4.797-3.742.138-.671 2.095 1.324 1.838 2.243.625 5.305 3.124 3.301 3.704 3.484 1.231.405.349-.157 2.61-.312.561-1.71-.092-1.931.496-.441 4.494.147.248 1.94-.937.303-.092.147.184-.138.707-.708 1.838-4.551 10.146-.184 1.397.138.882.313.827.607.891.294.046 6.022.285 4.202-.156 3.696-.754 2.096-.726 6.555-1.507.285.625-.928 5.891-1.425.257-.083.129-2.657.772-.221.551.791.735 2.409 1.416 1.131-.028 1.976-.414 1.205-.514 2.638-.745 1.131-.505 3.154-.818 1.544-.193 2.897-.101.772.597.377 1.177.414 2.187-.295.606-.689.055-1.407-.33-.827-.01-.69.028-1.397.322-1.076.808-.193.956-.138.11-.423-.239-.276-1.185-.671-1.011-.598-.092-.533.184-.221.257-.027.487.322.524.864.864.046.579-.377 1.241.027.275 1.38 1.287 2.399 2.977.497 1.011.037.689-.184.635-.653.661-.745.092-.57-.285-.552-.864-.064-1.635-1.241-2.95-.662-.809-.368-.064-.432.202-.11.367.073 1.011.956 1.82.745 1.764.028.634-.331.736-.331.248-.846.193-.276.358-.248 1.314-.221.202-.423.102-.515-.386-.285-1.168-.717-.817-.423-.12-1.351 1.13-.469-.275-1.103-.138-.083 1.057.276 1.534-.294 1.204-.451.781-.23.846-.276.515-.588.248-.579.036-.386.469.248.588 1.728 2.463-.248 1.581-2.179 2.463z", "offset": "-15,-35"}	2025-12-26 13:28:53	2026-02-14 20:14:19
293	74	\N	\N	\N	uz	{"title": null}	2025-12-28 06:10:13	2026-02-14 20:46:56
294	74	\N	\N	\N	ru	{"title": null}	2025-12-28 06:10:13	2026-02-14 20:46:56
830	241	\N	\N	\N	uz	{"title": "Niderlandiya"}	2026-02-18 05:35:48	2026-02-18 05:35:48
831	241	\N	\N	\N	ru	{"title": "Нидерландия"}	2026-02-18 05:35:48	2026-02-18 05:35:48
832	241	\N	\N	\N	en	{"title": "Netherlands"}	2026-02-18 05:35:48	2026-02-18 05:35:48
429	131	\N	\N	\N	ru	{"title": null}	2025-12-29 12:29:53	2025-12-29 13:02:43
833	241	\N	\N	\N	\N	{"code": "NL"}	2026-02-18 05:35:48	2026-02-18 05:35:48
1465	463	234	tashkilot	tashkilot	\N	{"title": "tetsetsetste"}	2026-02-20 04:18:48	2026-02-20 04:18:48
268	93	\N	\N	\N	uz	{"title": null}	2025-12-27 14:23:30	2026-02-14 19:55:50
269	93	\N	\N	\N	ru	{"title": null}	2025-12-27 14:23:30	2026-02-14 19:55:50
270	93	\N	\N	\N	en	{"title": null}	2025-12-27 14:23:30	2026-02-14 19:55:50
271	94	\N	\N	\N	uz	{"title": null}	2025-12-27 14:23:56	2026-02-14 19:56:32
272	94	\N	\N	\N	ru	{"title": null}	2025-12-27 14:23:56	2026-02-14 19:56:32
588	174	\N	\N	\N	\N	{"number": "31500"}	2026-01-05 08:15:32	2026-02-13 10:17:59
273	94	\N	\N	\N	en	{"title": null}	2025-12-27 14:23:56	2026-02-14 19:56:32
274	95	\N	\N	\N	uz	{"title": null}	2025-12-27 14:24:21	2026-02-14 19:57:26
275	95	\N	\N	\N	ru	{"title": null}	2025-12-27 14:24:21	2026-02-14 19:57:26
276	95	\N	\N	\N	en	{"title": null}	2025-12-27 14:24:21	2026-02-14 19:57:26
292	4	\N	\N	\N	en	{"title": "Vatandoshlar jamoat fondi eng", "content": null, "content1": null, "description": null}	2025-12-27 19:41:11	2026-01-23 12:34:28
240	89	\N	\N	\N	\N	{"code": "UZ-NA", "path": "m688.919 258.371-.46-.772-.423-.266-.413-.064-.414.22-.966-.322-.698-.027-1.729 1.25-.322.073-.625-.275-1.6-1.03-1.048-.285-1.121-.128-1.067.726-.423-.202-.515-.046-1.489-.598-.294-.377.018-.808-.515-.055-.34-.184-.064-.193.588-1.838.846-1.48.717-.735.432-.753.515-1.241-.046-.23-.993-.533-.781-.946-.258-.598.12-1.194-.129-.34-.349-.258-.377.221-.313.515-.745.156-.229-.156-.056-.175.239-1.195-.57-.974-1.287-1.24-.965-2.031-.34-.092-.129.11-.101 1.553-.156.239-.285.064-.194-.377-.091-.624-.285-.249-.35-.027-.579.413-.11.368.377.607-.056.514-.248.193-.386-.239-.377-.652-.092-.423.083-.395.772-1.011.423-.763.064-.432-.22-1.295.119-.276-.055-.68.395-.827-.321-.561-1.048-.046-.331.092-.708.662-.699 1.25-.405.459-1.158.395-.221.322.046.386.294.22 1.049.101.524.212.459.717.12.625-.313 1.121-.404.744-.037.377.735 1.13-.266.607-.607.661-.331.644-.248.9-.202.009-.331-.229-.239.229-.295.662-.551.45-.157.533-.156.037-.23.873-.349.294-.552-.147-.561-.634-.367-.202-.809-.018-.387.321-.616.129-.754-.469-.294.065-1.324 1.58-.046.377.23.708-.239.781v.487l.166.34.79.34.276.662-.818 1.837-.294 1.829-.653 1.48-.028.34-.947 1.029-.487.037-.239-.156-.138-.267-.211-1.626-.212-.451-.726-.763-.359-.174-.496.009-.469.276-.322.377-.211 1.295-.368.699-.736.689-.469.11-.349-.101-.129-.276.203-2.196-.239-1.314-.24-.386-.873-.579-.276-.037-.57.267-.119.367.037.497-.286.211-.257-.055-.395-.974-.295-.009-.321.275-.432.662-.442-.019-.239.138-.763.809-.46.267-.367.027-1.113-.395-.377-.34-.561-.937-.735-.175-1.131-.735-.542.027-2.446 1.664-.515-.184-.496-1.13-.846-.791-.791-.496-.533-.781-.487-.46-.249-.036-.653.294-.432.625-.763 1.893-.276.404-.303.147-.791-.322-.459-.56-.203-.827.028-1.002.68-.873.166-.551-.092-.322-.57-.836-.23-.68-.064-1.645.386-.846.23-1.066-.451-1.884-2.344-3.749-.386-1.075-.175-.147-1.113-.313-.285.028-1.048.781-1.131-.055-1.397.441-.901.772-.377.68-1.545 1.277h-1.912l-.46-.496-.625 1.774-2.731 3.777.616 6.708 1.756 2.408.607 1.231.221 2.142.028 1.608-.138.808.183.386.414-.018.671.368.249.625 1.011.817.064.57.295.221.809 1.093.625.019.505 1.259.929 1.148.359.818 1.02 1.517.423 1.084.248.009.111.34.891.763.515 1.259.763.285.488.432.671.91-.441.349-.157-.083-.266.166.073.294-.175.266-.34.092-.524-.23-.432-1.112-.34 1.14.037.652.294.588.763-.22 1.131.092.781.413-.257.166.827.037.396.211.919.781.202.45.313-.082.239-.239 4.478-1.149 3.107-.561 6.206-.091v.202l-.34.478-1.25 1.525.763 1.81 1.728 1.701 5.13 2.508.368.074.699-.386 2.777-2.619.698-.919.69-1.333 1.131-.726 3.778-2.049 3.163-.947 1.747-1.112-2.023-2.453 1.867-1.737 1.103-.735 7.898-2.013 3.374.028.533.23.671.514 3.062.689 1.342.138 4.487-.404.487-.248.368-.423 1.158-5.385-.386-.239-.413-.533.147-.303 1.158-.276.487-.377.433-.937-.414-.754zm-64.781 13.5-2.924-3.961-1.122-.827-.928-.027-.175-.625.248-.432.671-.515-.248.349 1.104.469 1.388 1.627 1.59 2.159.589 1.452z", "offset": "10,-25"}	2025-12-26 14:25:11	2026-02-14 19:59:59
1566	498	497	Tashkilot haqida	nomi-7	en	{"title": "American-Uzbekistan Association", "description": "<p>Main Goals of the Organization:</p><ul><li>To support and unite the Uzbek diaspora living in the United States.</li><li>To promote cultural, academic, and professional exchange between the peoples of the U.S. and Uzbekistan.</li></ul><p>Main Tasks:</p><ul><li>Organizing academic and social programs, including creating opportunities for youth, students, and professionals.</li><li>Supporting exchange in education, culture, language, and professional skills between Uzbekistan and the U.S.</li><li>Strengthening collaboration through resources, seminars, and events for the diaspora community.</li></ul>"}	2026-02-23 09:22:59	2026-02-23 09:22:59
1567	498	497	Tashkilot haqida	nomi-7	\N	{"boss_at": "09/2019", "date_at": "09/2019"}	2026-02-23 09:22:59	2026-02-23 09:22:59
1600	509	150	Video	video-15	uz	{"title": "Yurtdoshlarni qo’llash"}	2026-02-24 04:47:35	2026-02-24 04:49:41
1638	521	520	Video	video-15	uz	{"title": "Video"}	2026-02-24 08:23:56	2026-02-24 08:23:56
1639	521	520	Video	video-15	ru	{"title": null}	2026-02-24 08:23:56	2026-02-24 08:23:56
1640	521	520	Video	video-15	en	{"title": null}	2026-02-24 08:23:56	2026-02-24 08:23:56
1641	521	520	Video	video-15	\N	{"date_at": "2025-06-01T13:30"}	2026-02-24 08:23:56	2026-02-24 08:23:56
883	256	\N	\N	\N	en	{"link": "https://uz.wikipedia.org/wiki/Uzreport_TV", "title": "https://uz.wikipedia.org/wiki/Uzreport_TV"}	2026-02-18 06:53:56	2026-02-24 12:18:51
882	256	\N	\N	\N	ru	{"link": "https://uz.wikipedia.org/wiki/Uzreport_TV", "title": "https://uz.wikipedia.org/wiki/Uzreport_TV"}	2026-02-18 06:53:56	2026-02-24 12:18:51
1677	533	\N	\N	\N	ru	{"title": null, "value": null, "placeholder": null}	2026-02-25 05:59:06	2026-02-25 06:27:21
1678	533	\N	\N	\N	en	{"title": null, "value": null, "placeholder": null}	2026-02-25 05:59:06	2026-02-25 06:27:21
190	63	\N	\N	\N	ru	{"title": "Ферганская область", "description": "Ферганская область – богатый водными ресурсами регион, расположенный в центре Ферганской долины, известный развитой промышленностью и сельским хозяйством. Областной центр город Фергана является современным культурным и экономическим центром. Исторические памятники времен Кокандского ханства, древние медресе и места паломничества свидетельствуют о богатом культурным наследии области. Ферганская область выделяется нефте- и газодобычей, химической промышленностью, а также шелководством. Хлопковые поля, фруктовые сады и зеленые долины области создают великолепные природные пейзажи. Гостеприимство ферганского народа, национальные ремесла и богатые кулинарные традиции тепло принимают каждого гостя."}	2025-12-26 13:45:33	2026-02-14 20:22:01
191	63	\N	\N	\N	en	{"title": "Fergana", "description": "Fergana Region – a water-rich region located in the center of the Fergana Valley, famous for its developed industry and agriculture. The regional center, Fergana city, is a modern cultural and economic center. Historical monuments from the Kokand Khanate period, ancient madrasahs, and pilgrimage sites testify to the region's rich cultural heritage. Fergana Region is distinguished by oil and gas production, chemical industry, and sericulture. The region's cotton fields, fruit orchards, and green valleys create magnificent natural landscapes. The hospitality of Fergana people, national crafts, and rich culinary traditions warmly welcome every guest."}	2025-12-26 13:45:33	2026-02-14 20:22:01
119	8	\N	\N	\N	en	{"title": "Our values unite us!", "description": "Our values unite us! Our values are our roots, the strength of our heart, and the bright path of our future. They connect us, unite the hearts of each of us, and give us the opportunity to achieve true success. We must be proud of these values because they elevate us and show the world our true strength. Staying faithful to our values, continuing them – this is necessary not only for our present day but also for our future. Our values are our eternal heritage!"}	2025-12-25 10:18:34	2026-02-17 09:24:16
834	242	\N	\N	\N	uz	{"title": "Portugaliya"}	2026-02-18 05:37:21	2026-02-18 05:37:21
17	8	\N	\N	\N	uz	{"title": "Qadriyatlarimiz bizni birlashtiradi!", "description": "Qadriyatlarimiz bizni birlashtiradi! Qadriyatlarimiz – bu bizning ildizlarimiz, qalbimizning kuchi va kelajagimizning yorqin yo‘li. Ular bizni bog‘laydi, har birimizning yuragimizni birlashtiradi va bizga chinakam muvaffaqiyatga erishish imkonini beradi. Biz bu qadriyatlar bilan faxrlanishimiz kerak, chunki ular bizni yuksaltiradi va dunyoga haqiqiy kuchimizni ko‘rsatadi. Qadriyatlarimizga sodiq qolish, ularni davom ettirish – bu nafaqat bugungi kunimiz, balki kelajagimiz uchun ham zarur. Qadriyatlarimiz – bu bizning abadiy merosimiz!"}	2025-12-23 05:10:29	2026-02-17 09:24:16
835	242	\N	\N	\N	ru	{"title": "Португалия"}	2026-02-18 05:37:21	2026-02-18 05:37:21
836	242	\N	\N	\N	en	{"title": "Portugal"}	2026-02-18 05:37:21	2026-02-18 05:37:21
837	242	\N	\N	\N	\N	{"code": "PT"}	2026-02-18 05:37:21	2026-02-18 05:37:21
1466	464	463	Rahbar	rahbar-5	uz	{"title": "asd", "description": "asdasd"}	2026-02-20 04:18:58	2026-02-20 04:18:58
1467	464	463	Rahbar	rahbar-5	ru	{"title": null, "description": null}	2026-02-20 04:18:58	2026-02-20 04:18:58
77	34	\N	\N	\N	uz	{"title": "Na'munali Yurtdoshlar"}	2025-12-23 06:22:39	2026-01-14 11:30:41
145	34	\N	\N	\N	en	{"title": null}	2025-12-26 05:11:42	2026-01-14 11:30:41
150	34	\N	\N	\N	\N	{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW", "url_title": "Na'munali Yurtdoshlar"}	2025-12-26 05:31:25	2026-01-14 11:30:41
640	188	\N	\N	\N	uz	{"title": "Google Map"}	2026-01-15 14:30:30	2026-01-15 14:33:02
596	176	\N	\N	\N	\N	{"number": "975"}	2026-01-05 08:17:25	2026-02-13 10:20:31
597	177	\N	\N	\N	uz	{"title": "Ko’ngillilar"}	2026-01-05 08:17:42	2026-02-13 10:21:04
598	177	\N	\N	\N	ru	{"title": "Волонтёры"}	2026-01-05 08:17:42	2026-02-13 10:21:04
599	177	\N	\N	\N	en	{"title": "Volunteers"}	2026-01-05 08:17:42	2026-02-13 10:21:04
600	177	\N	\N	\N	\N	{"number": "124"}	2026-01-05 08:17:42	2026-02-13 10:21:04
636	187	\N	\N	\N	uz	{"title": "text"}	2026-01-14 17:15:56	2026-01-22 09:24:10
637	187	\N	\N	\N	ru	{"title": null}	2026-01-14 17:15:56	2026-01-22 09:24:10
638	187	\N	\N	\N	en	{"title": null}	2026-01-14 17:15:56	2026-01-22 09:24:10
639	187	\N	\N	\N	\N	{"url": "dd", "url_title": "dd"}	2026-01-14 17:15:56	2026-01-22 09:24:10
610	19	\N	\N	\N	en	{"title": null}	2026-01-12 09:40:45	2026-02-06 07:32:56
611	19	\N	\N	\N	\N	{"code": "US"}	2026-01-12 09:40:45	2026-02-06 07:32:56
589	175	\N	\N	\N	uz	{"title": "Milliy atributlar"}	2026-01-05 08:16:14	2026-02-13 10:20:01
590	175	\N	\N	\N	ru	{"title": "Национальные атрибуты"}	2026-01-05 08:16:14	2026-02-13 10:20:01
591	175	\N	\N	\N	en	{"title": "National attributes"}	2026-01-05 08:16:14	2026-02-13 10:20:01
592	175	\N	\N	\N	\N	{"number": "9400"}	2026-01-05 08:16:14	2026-02-13 10:20:01
593	176	\N	\N	\N	uz	{"title": "O’tkazilgan tadbirlar"}	2026-01-05 08:17:25	2026-02-13 10:20:31
594	176	\N	\N	\N	ru	{"title": "Проведённые мероприятия"}	2026-01-05 08:17:25	2026-02-13 10:20:31
595	176	\N	\N	\N	en	{"title": "Events held"}	2026-01-05 08:17:25	2026-02-13 10:20:31
641	188	\N	\N	\N	ru	{"title": null}	2026-01-15 14:30:30	2026-01-15 14:33:02
642	188	\N	\N	\N	en	{"title": null}	2026-01-15 14:30:30	2026-01-15 14:33:02
643	188	\N	\N	\N	\N	{"map": "<iframe\\r\\n        src=\\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d749.4925232956783!2d69.25348876967365!3d41.287755348207035!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x38ae8aee77c2889f%3A0x1a0e4085e1b2ab8!2s77Q3%2B4M6%2C%20Babur%20Street%2045%2C%20Tashkent%2C%20Uzbekistan!5e0!3m2!1sen!2s!4v1766139483379!5m2!1sen!2s\\"\\r\\n        width=\\"600\\" height=\\"450\\" style=\\"border:0;\\" allowfullscreen=\\"\\" loading=\\"lazy\\"\\r\\n        referrerpolicy=\\"no-referrer-when-downgrade\\"></iframe>"}	2026-01-15 14:33:02	2026-01-15 14:33:02
179	73	\N	\N	\N	\N	{"code": "UZ-TK", "path": "m569.056 244.898.046-.524-.083-.128h-.221l-.275.229-.12.34-.69.212-.652.689-.644-.064-.331.606-.506-.248-.524.101-1.471-.772-.183.019-.24.312-.753.34-.947-.193-.102-.165h-.128l-1.104 1.213-.092.781-.413 1.149-.129.799-.11 1.342.082.312.855.202.267.193.304-.165.441.23.294.772.147.046.331-.212.156.23.635.119.524-.055.009-.441.993-.799 1.002.082.662.212-.147.377.395.863.341.23.579-.083.965-.965.35-.799-.065-1.084-.349-.671-.267-.248.441-.699.313-.23-.119-.312.046-.441.266-.625.138-.11.368.046-.083-.607.258-.248.11-.441-.101-.294-.221-.129z", "offset": "0,-30"}	2025-12-26 13:33:53	2026-02-14 16:55:43
169	63	\N	\N	\N	\N	{"code": "UZ-FA", "path": "m619.468 304.513.092-.607-.212-.505-.68-.607-2.675-1.204-1.499-.303-.919-.368h-.295l-.827.396-.395-.028-.423-.193-.304-.34-.423-1.02-.266-.285-.258-.092-.138-.68-.836-1.626-.055-.561.119-.184.745-.202.919-.744 1.094-.203 1.012-.523 1.884-.662h.736l.432-.377.11-.744.405-.405.129-.817.174-.368.368-.202.543-.074.707.065.442-.331.662-.019.395-.147.8-1.02 1.021-2.04.33-.349.598-.165.625-.671.469-.157.138-.257.377-.073.377-.46.892-.202.368.257.294.028.046-.607-.166-.909.285-.212.258.23.607-.037.404-.533.276-.919.533-.487.055-.239.313-.083.239-.238 4.477-1.149 3.099-.561 6.215-.092v.203l-.34.477-1.251 1.526.764 1.81 1.719 1.71 5.139 2.508.368.074.69-.386 2.776-2.619.699-.91.68-1.332 1.14-.736 3.779-2.049 3.163-.946 2.786 4.117.184-1.333 3.824.551 2.777 1.434.57.597 2.059 3.18 8.505 1.443h.303l.221-.156 2.069.413 3.686 1.176.285.772.102 3.318-.451.037-.984-.239-.358.073-.469 1.268-.276.46-.579.551-.423.221-.34.064-.543-.184-.818-.542-.423.956.414 1.571-.129.313-.588.652-.065.524-.266.368-1.26.376-.956 1.232-.469.349-.736 1.039-1.094.477-.855.791-.11.239.193.459.901.211.901.818-.064.451-1.021.946-.423.993-.266.294-.607.303-.57-.018-1.168-.846-1.857-.432-.441.359-.12.441.046.248.68 1.038.019.487-.69.46-.496-.028-2.29 1.462-1.213.386-.846.606-.322.055-.23-.128-.423-.782-.395-.468-.221-.065-.331-.367-.137-.331.156-1.746-.175-.744-.625-.837-.478-.331-.708-.073-1.131.11-.101.772.221 1.314-.193.873.073.515-.11.184-.267-.028-.745-.882h-.919l-.506.175-.846-.533-1.627-.726-.202-.497.175-1.24-.221-.478-1.195-.028-1.416-.367-.579-.46-1.003-1.13-.377-.248-.45-.138-.46.202-.57.055-.147-.285.083-.358-.294-.23-1.407.588-.69.092-.248-.092-.138-.248-.018-.919-1.416.101-.929-.312-.919-.083-.763.101-1.269.423-.901-.018-.561.193-2.353 1.635-1.793.322-1.903.827-.414.267-.129.248.285.845-.101.892-2.188.064-1.793.321-.248-.082-1.563 1.158-2.271 1.011-1.453.303-1.287.11-2.878.634-.763-.312-1.085-1.967-.294-.809-.662-.358-.487-.864.119-.101.065-1.176.34-.91-.506-1.608z", "offset": "10,-15"}	2025-12-26 13:28:16	2026-02-14 20:22:01
180	60	\N	\N	\N	uz	{"title": "Qoraqalpog'iston Respublikasi", "description": "Qoraqalpog'iston Respublikasi – O'zbekiston tarkibidagi avtonomiya bo'lib, mamlakatning shimoli-g'arbida joylashgan keng va o'ziga xos tabiiy xususiyatlarga ega hudud hisoblanadi. Respublika markazi Nukus shahri zamonaviy madaniyat va san'at markazi sifatida tanilgan bo'lib, bu yerdagi Savitskiy nomidagi davlat san'at muzeyi jahonga mashhur noyob san'at to'plamlari bilan ajralib turadi. Qoraqalpog'iston hududida Mo'ynoq shahri, Orol dengizi fojiasi va qadimiy Qo'ng'irot qal'asi kabi muhim tarixiy va ekologik yodgorliklar joylashgan. Respublikaning Ustyurt platosi, Sudochye ko'li va Badai-Tugai qo'riqxonasi noyob tabiiy manzaralar va noyob o'simlik va hayvonot dunyosiga ega. Qoraqalpog'istonning qadimiy Xorazm sivilizatsiyasi davridagi Ayoz qal'a, Toprak qal'a va Ko'hna Urganch xarobalari UNESCO Jahon merosi ro'yxatiga kiritilgan. Qoraqalpoq xalqining boy milliy madaniyati, an'anaviy kostyumlari, musiqa san'ati va mehmondo'stligi respublikaning o'ziga xos xarakterini yaratadi."}	2025-12-26 13:38:23	2026-02-14 20:41:41
166	60	\N	\N	\N	\N	{"code": "UZ-QR", "path": "m144.74 21.815.321 7.095-1.848 5.366-2.96 5-2.593 5.55-.928 3.888H134.7l-1.664.183-1.297 1.296-.551 2.408.744 4.255 1.113 2.407.745 2.592-2.225.744-2.777-1.48-2.225 1.297-1.664 3.703-2.225 3.887-2.032 2.224-2.777-1.663-.367-3.704-.184-5.734-1.113-1.48v-3.17h1.481l1.112 2.592 1.664.928 2.593-.928 1.296-2.776v-3.703l.929-2.96-2.786-1.663-2.96-2.407-.552-2.224 1.664-1.848 1.664-.367 1.848.928.184-7.582 2.593-.367-.184-2.96-2.225-.55-3.512-.552-1.297.928-1.48 1.847-2.032.928 1.297-2.03 2.592-4.807 1.665-2.407-.929-2.776-1.848-2.591.552-3.51.928-3.144 3.126-5.909zM109.508.311l-.165 3.262-1.481 2.96-.184 4.438-3.512 3.143-1.848 2.96-.184 5.366-2.408 2.408-1.113 5.183-2.776 4.438-1.849 4.99-.367 4.255.184 5.551 1.112 2.591 1.848 3.327-.368 2.408-2.776 7.765.368 4.807 2.031 4.806 2.032 2.407 2.777 1.296 3.705 1.48 2.777.184 2.409 1.847 1.848.551.928-1.847 1.48-.368 2.225.184 1.664-.744 4.625-1.48 2.409-1.112 1.48.928.745 3.327-1.664 2.031-2.602 1.682.928 3.327 2.032.928 1.664 1.663 4.809.745 2.409 2.03 2.776.368 5.554.551 4.073.184 3.328-2.03 2.225 1.295 1.112.928 3.512-.744 1.848-.552 3.329 1.112 4.624-.928 4.441-1.48 6.482-2.59.551-2.409h3.145l1.112-1.663-.919-1.654 1.48-3.143 5.737-4.623 4.257-4.254 2.593-4.623.744-3.51-.928-1.296-1.48-1.296-.929-1.847 3.567-.322 19.933 14.382 2.032 6.48 5.581 5.632 5.875 7.086.266.588.589.542 2.326 2.766 5.24 6.442 15.474 19.207 1.498 1.434.506.046 5.379 9.649 14.186 3.841-25.431 47.971-1.158 14.492 6.197 11.166-11.815 6.524 19.234 26.348 12.679 17.626-10.058 4.65-2.345 1.112-.598-.175-.248-.202-4.192-6.81-1.379-2.545-7.356-8.097-2.831-1.755-3.237-1.709-8.228-1.893-2.795-.019-.57.184-1.278.708-.717.818-1.076 2.113-.469 1.719-.662.707h-1.37l-2.069-1.323-.229-1.066-.341-.799-1.857-2.087-.653-.56-.68-.267-1.986-.33-1.296-.533-5.48-4.173-7.567-6.717-1.443-1.379-3.08-3.584-4.753-4.439-.635-.284-.616-.598-.34-.422-2.832-4.954-.377-2.26-.036-2.417-.157-.533-.358-.441-4.855-1.03-3.916 1.278-1.747.772-2.455 4.806-.202-.487-.46-.552-.506-.358-2.225-.763-.744-.468-1.637-2.013-.156.037-.304-.322-.809.184-1.158-1.14-.175-.744.175-.312.515-.414 2.592-.184.322-.413-.184-.735-.469-.671-.376-.892-.203-.864-.147-2.086-1.158-1.507-.028-.616.166-.441 1.002-.533.386.175.781.092.423-.101.414-.395.23-.359.018-.588-.45-1.094-.442-.514-.91-.552-1.609-.22-.533-.221-.754-.652-.763-1.029-.625-1.25-.579-.515-1.812-.588-.956-.772-.285.506-.423 1.314-.331.321-.459.01-1.655-.506-.626-.322-.422.019-.497-.193-1.811-.037-1.444.34h-1.388l-1.232.147-6.813.092-.524-.414-.671-1.286-.598-.276-.809-.974-3.714-3.703-.037-.368.423-1.139-.101-1.131-3.135-4.089-.432-.423-1.021-.607-.368-.055-1.002.276-.882.708-.524.22-2.391-.156-.643-.202-1.453-.791-2.087-.606-.616-.294-1.591-1.379-3.852-4.227-4.422-4.916-2.832-3.584-.441-.396-.028.782-.285 1.084.092.505.818.818.037.267-.156.478-.313.202-.386-.009-.506-.285h-.579l-.469.579v.156l.634.524.24.386-.387 2.003-.285.45-.45.276-1.057-.34-2.437.46-.984.055-1.213-.588-1.113-.221-1.094-.524-1.37-.377-2.666-.551-.827.028-1.306.523-.956.552-2.142 1.783-.57.055-.377.321-.166.634.294.699 1.71 1.24 2.18 1.223.91.349 1.24.23.415.496 2.454 5.698 1.196 1.883.524.625.174.864-.036 1.112.404.368.487-.12 2.896 1.82.883.726.12.652-.469.956-.34.239-.396.018-1.94-.459-1.719.349-.175-.616.111-1.856-.102-.965-.744-2.628-.653-1.232-.818-.909-1.15-.772-4.459-1.149-.735.046-2.004 1.038-1.196.442-.174-.092-.175-.662-.846-.597-.267-.34-.248-1.103-.781-.689-.883-.166-1.315.285-.91.625-.487-.009-.248.266-.368 1.682-.267.689-.294-.119-.68-.791-.405-.101-.616.203-.202.358-.258 1.424.313.717.818.754.405.661.303.993-.018.496-.34.965.027 1.296-.22 1.02.11 1.424-.184 1.48-.166.551-.312.359-.432.147-.782-.028-1.526-.634-.404.092-.258.478-.312 1.103.643 1.102.405 1.011-.175.386-.8.11-2.813-.477-2.382.817-1.627.855-.68.166-.552-.019-1.49-.91-1.719-.34-2.105-.165-4.753.257-1.802.671-2.317 1.14-2.014 1.47-1.158 1.002-1.03 1.479-.377.8-.625 1.461-.984 3.06-.56.781-1.04 1.011-.652.395-1.26.469-1.986.588-.671.404-.79.726-.847 1.765-.285 1.875-.413 1.681.046 2.528.275 2.462-.128 2.509.515 2.178.367.91.35.459-.019.221.331.147.488.947.22 1.056.083.736-.184 1.121v2.15l.386 2.886.276.91.35.661 1.7 2.426.837.019 1.793-.552.395.368.037.478-.294.652-.368.368-.487.303-1.82.634-.773.726-.423.809-.037 1.378-.294.616-.45.496-.506.267H42.85l-1.655-.405-3.64-.312-3.816-.542-6.206-.386-3.466-.074-5.406-.625-3.209-.239-1.728.01-4.763-.432-8.66-.359L.227 34.681l1.397-.359 1.315-.579 27.71-9.051.02-.12 1.535-.266.312-.322.929-.312 12.08-3.86L85.669 7.406l6.114-2.04 2.041-.423z", "offset": null}	2025-12-26 13:22:38	2026-02-14 20:41:41
838	243	\N	\N	\N	uz	{"title": "Latviya"}	2026-02-18 05:38:45	2026-02-18 05:38:45
839	243	\N	\N	\N	ru	{"title": "Латвия"}	2026-02-18 05:38:45	2026-02-18 05:38:45
840	243	\N	\N	\N	en	{"title": "Latvia"}	2026-02-18 05:38:45	2026-02-18 05:38:45
89	38	\N	\N	\N	uz	{"title": "Fondning tashkil topishi haqida", "content": null, "description": "\\"Vatandoshlar\\" jamoat fondi 2021 yil 11 avgustda O‘zbekiston Respublikasi Prezidentining PQ-5220-sonli qarori bilan xorijiy davlatlardagi vatandoshlarimiz bilan doimiy va samarali aloqalar o‘rnatish va rivojlantirish hamda yagona Vatani atrofida jipslashtirish maqsadida tashkil etilgan.  \\"Vatandoshlar\\" jamoat fondining vasiylik kengashi Fondning oliy organi hisoblanadi. Vasiylik kengashi tomonidan shakllantiriladigan Fond Boshqaruvi — Fondning ijro organi hisoblananadi.  O‘zbekiston Respublikasi Oliy Majlisi huzuridagi Nodavlat notijorat tashkilotlarini va fuqarolik jamiyatining boshqa institutlarini qo‘llab -quvvatlash jamoat fondi mablag‘larini boshqarish bo‘yicha Parlament komissiyasiga har yili asoslangan buyurtmanoma asosida Fondning asosiy vazifalarini bajarish doirasidagi tadbirlarni tashkil etish va o‘tkazishni moliyalashtirish uchun subsidiya shaklida zarur mablag‘larni ajratadi."}	2025-12-25 08:48:32	2026-02-12 13:04:56
841	243	\N	\N	\N	\N	{"code": "LV"}	2026-02-18 05:38:45	2026-02-18 05:38:45
216	72	\N	\N	\N	uz	{"title": "Xorazm", "description": "Xorazm viloyati – qadimiy Xorazmshohlar davlatining markazi bo'lgan tarixiy hudud bo'lib, boy madaniy meros va ajoyib meʼmorchilik yodgorliklari bilan mashhur. Viloyatning markazi Urganch shahridan uncha uzoq bo'lmagan joyda joylashgan Xiva shahri – UNESCO Jahon merosi roʻyxatiga kiritilgan ochiq osmon ostidagi muzeygadir. Ichan Qalʼa ichida, Kalta Minor, Tosh Hovli, Juma masjidi va Pahlavon Mahmud maqbarasi kabi noyob islom meʼmorchiligi namunalari saqlanib qolgan. Xorazm hududida Tuproqqalʼa, Ayozkalʼa va Ko'hna Urganch kabi qadimiy shaharlar xarobalari, arxeologik qatlamlar va madaniy yodgorliklar O'rta Osiyoning eng qadimiy sivilizatsiyalaridan darak beradi. Viloyatning Omudaryo boʻyidagi tabiiy manzaralari va qumli sahrolarining go'zalligi esa har bir sayyohni lol qoldiradi."}	2025-12-26 13:52:31	2026-02-14 16:55:14
822	239	\N	\N	\N	uz	{"title": "Shvetsiya"}	2026-02-18 05:27:03	2026-02-18 09:17:16
1468	464	463	Rahbar	rahbar-5	en	{"title": null, "description": null}	2026-02-20 04:18:58	2026-02-20 04:18:58
886	257	\N	\N	\N	en	{"link": "https://uz.wikipedia.org/wiki/O%CA%BBzbekiston_Yozuvchilar_uyushmasi", "title": "https://uz.wikipedia.org/wiki/O%CA%BBzbekiston_Yozuvchilar_uyushmasi"}	2026-02-18 06:54:50	2026-02-24 12:19:03
1642	522	156	Yillar	yillar-1	uz	{"title": null}	2026-02-24 08:39:03	2026-02-24 08:39:03
291	120	\N	\N	\N	en	{"title": "One goal, a million compatriots, one Motherland", "word1": null, "word2": null, "word3": null}	2025-12-27 19:14:10	2026-02-24 11:09:07
1469	464	463	Rahbar	rahbar-5	\N	{"email": "asdasd", "phone": "asdasd"}	2026-02-20 04:18:58	2026-02-20 04:18:58
885	257	\N	\N	\N	ru	{"link": "https://uz.wikipedia.org/wiki/O%CA%BBzbekiston_Yozuvchilar_uyushmasi", "title": "https://uz.wikipedia.org/wiki/O%CA%BBzbekiston_Yozuvchilar_uyushmasi"}	2026-02-18 06:54:50	2026-02-24 12:19:03
1643	522	156	Yillar	yillar-1	ru	{"title": null}	2026-02-24 08:39:03	2026-02-24 08:39:03
1644	522	156	Yillar	yillar-1	en	{"title": null}	2026-02-24 08:39:03	2026-02-24 08:39:03
649	190	\N	\N	\N	en	{"title": "Online Uzbek language learning platform", "description": "You can follow the link"}	2026-01-19 16:38:51	2026-02-20 05:55:34
843	244	\N	\N	\N	ru	{"title": "Литва"}	2026-02-18 05:40:38	2026-02-18 05:48:30
518	156	\N	\N	\N	\N	{"video": "https://www.youtube.com/watch?v=UqvRkpzTMJU", "content": "Universitet Loyihasi boshlandi", "last_date": "2025-06-01T13:30"}	2025-12-31 01:02:51	2026-02-24 04:39:40
661	194	\N	\N	\N	ru	{"title": "Скачайте мобильное приложение для изучения узбекского языка", "description": "Будем ждать ваших тёплых отзывов о нашем приложении."}	2026-01-20 06:40:04	2026-02-13 10:27:07
687	203	\N	\N	\N	uz	{"title": "Vatandoshlarni O‘zbekiston hududida tadbirkorlik, investitsiyaviy, ilmiy, madaniy va ma’rifiy faoliyat bilan shug‘ullanishga faol jalb qilish"}	2026-01-21 06:36:32	2026-02-13 05:36:20
650	191	\N	\N	\N	uz	{"title": "Mutoola"}	2026-01-19 17:46:56	2026-01-19 17:47:41
651	191	\N	\N	\N	ru	{"title": null}	2026-01-19 17:46:56	2026-01-19 17:47:41
652	191	\N	\N	\N	en	{"title": null}	2026-01-19 17:46:56	2026-01-19 17:47:41
653	192	\N	\N	\N	uz	{"title": "Mutoola2"}	2026-01-19 17:48:02	2026-01-19 17:48:02
654	192	\N	\N	\N	ru	{"title": null}	2026-01-19 17:48:02	2026-01-19 17:48:02
655	192	\N	\N	\N	en	{"title": null}	2026-01-19 17:48:02	2026-01-19 17:48:02
656	193	\N	\N	\N	uz	{"title": "Mutoola3"}	2026-01-19 17:48:22	2026-01-19 17:48:22
657	193	\N	\N	\N	ru	{"title": null}	2026-01-19 17:48:22	2026-01-19 17:48:22
658	193	\N	\N	\N	en	{"title": null}	2026-01-19 17:48:22	2026-01-19 17:48:22
39	18	\N	\N	\N	uz	{"title": "Fond faoliyatining asosiy yo‘nalishlaridan bu xorijda istiqomat qilayotgan vatandoshlar va ular tomonidan tuzilgan jamoat birlashmalari bilan hamkorlik aloqalarini yo‘lga qo‘yish va rivojlantirish. Shu bois vatandoshlar tomonidan tashkil etilgan jamoat birlashmalari faoliyatini rag‘batlantirish, ularga xorijda o‘zbek milliy madaniy markazlarini tashkil etishda amaliy yordam ko‘rsatish, vatandosh birlashmalari bilan hamkorlikda xorijda o‘zbek tili, madaniyati va an’analarini saqlab qolish va rivojlantirishga qaratilgan faoliyatni qo‘llab-quvvatlash va xorijda yurtimizning boy ilmiy, madaniy va ma’naviy merosini keng targ‘ib qilish va ommalashtirish, vatandoshlarga madaniy-ma’rifiy tadbirlarni tashkil etishda ko‘maklashish.x"}	2025-12-23 05:46:01	2026-01-20 06:39:23
659	18	\N	\N	\N	en	{"title": null}	2026-01-20 06:39:23	2026-01-20 06:39:23
1882	585	\N	\N	\N	ru	{"desc": null, "title": null}	2026-02-25 10:55:42	2026-02-25 11:00:45
1883	585	\N	\N	\N	en	{"desc": null, "title": null}	2026-02-25 10:55:42	2026-02-25 11:00:45
1881	585	\N	\N	\N	uz	{"desc": "<p>asdad&nbsp;</p>", "title": "adasd"}	2026-02-25 10:55:42	2026-02-25 11:00:45
688	203	\N	\N	\N	ru	{"title": "Налаживание и развитие партнерских отношений с общественными объединениями"}	2026-01-21 06:36:32	2026-02-13 05:36:20
689	203	\N	\N	\N	en	{"title": "Establishment and development of cooperation with public associations"}	2026-01-21 06:36:32	2026-02-13 05:36:20
663	195	\N	\N	\N	uz	{"title": "Yurtimizning boy ilmiy, madaniy va ma’naviy merosini keng targ‘ib qilish"}	2026-01-21 06:32:49	2026-02-13 05:41:25
664	195	\N	\N	\N	ru	{"title": "Широкая пропаганда богатого научного, культурного и духовного наследия нашей страны"}	2026-01-21 06:32:49	2026-02-13 05:41:25
665	195	\N	\N	\N	en	{"title": "Wide promotion of the rich scientific, cultural and spiritual heritage of our country"}	2026-01-21 06:32:49	2026-02-13 05:41:25
666	196	\N	\N	\N	uz	{"title": "Migratsiya va ta’lim sohalarida shartnomaviy-huquqiy hamkorlikni kengaytirish"}	2026-01-21 06:33:14	2026-02-13 05:42:05
667	196	\N	\N	\N	ru	{"title": "Расширение договорно-правового сотрудничества в сфере миграции и образования"}	2026-01-21 06:33:14	2026-02-13 05:42:05
668	196	\N	\N	\N	en	{"title": "Expansion of contractual-legal cooperation in the fields of migration and education"}	2026-01-21 06:33:14	2026-02-13 05:42:05
669	197	\N	\N	\N	uz	{"title": "Murakkab hayotiy vaziyatga tushib qolgan vatandoshlarni ijtimoiy qo‘llab-quvvatlash va huquqiy yordam ko‘rsatishga ko‘maklashish"}	2026-01-21 06:33:41	2026-02-13 05:42:49
670	197	\N	\N	\N	ru	{"title": "Содействие в оказании социальной поддержки и правовой помощи соотечественникам, оказавшимся в сложной жизненной ситуации"}	2026-01-21 06:33:41	2026-02-13 05:42:49
671	197	\N	\N	\N	en	{"title": "Assistance in providing social support and legal assistance to compatriots who are in a difficult life situation"}	2026-01-21 06:33:41	2026-02-13 05:42:49
673	198	\N	\N	\N	ru	{"title": "Стимулирование деятельности общественных объединений, созданных соотечественниками"}	2026-01-21 06:34:12	2026-02-13 05:43:35
675	199	\N	\N	\N	uz	{"title": "Xorijda o‘zbek milliy madaniy markazlarini tashkil etishda amaliy yordam ko‘rsatish"}	2026-01-21 06:34:48	2026-02-13 05:44:07
677	199	\N	\N	\N	en	{"title": "Providing practical assistance in establishing Uzbek national cultural centers abroad"}	2026-01-21 06:34:48	2026-02-13 05:44:07
678	200	\N	\N	\N	uz	{"title": "Vatandoshlarga madaniy-ma’rifiy tadbirlarni tashkil etishda ko‘maklashish"}	2026-01-21 06:35:22	2026-02-13 05:44:37
680	200	\N	\N	\N	en	{"title": "Organization of cultural and educational events for compatriots assistance in making"}	2026-01-21 06:35:22	2026-02-13 05:44:37
682	201	\N	\N	\N	ru	{"title": "Оказание содействия в обучении соотечественников узбекскому языку в высших учебных заведениях республики"}	2026-01-21 06:35:47	2026-02-13 05:45:07
683	201	\N	\N	\N	en	{"title": "Support our compatriots to receive education in the direction of Uzbek language in higher educational institutions of the Republic"}	2026-01-21 06:35:47	2026-02-13 05:45:07
685	202	\N	\N	\N	ru	{"title": "Поддержка научных, творческих поисков наших соотечественников, направленных на повышение престижа нашей страны"}	2026-01-21 06:36:09	2026-02-13 05:45:48
716	9	\N	\N	\N	\N	{"url": "https://www.youtube.com/embed/BHACKCNDMW8?si=AtPPS9WpLIT3_TaW"}	2026-01-22 09:36:27	2026-02-17 09:35:56
887	258	\N	\N	\N	uz	{"title": "Ukraina"}	2026-02-18 06:59:14	2026-02-18 07:01:43
19	9	\N	\N	\N	uz	{"title": "Moziydan saboq, bugundan yuksalish", "description": "Moziy va bugun – bu vaqtning ikki qutbi: o‘tgan zamonning ulug‘vorligi va bugunning yuksalishi. Bu yerda tariximizning buyuk sahifalari va hozirgi kunda yaratilayotgan yangi yutuqlar birlashadi. Moziy – bu bizni yuksaltirgan ildizlar, Bugun esa bizning yuksalishimiz, kuchimiz va kelajakka ishonchimizdir. Har bir qadriyat, har bir qadam, bizni kelajakka yetaklaydi. Moziyda o‘rgangan saboqlarimiz, bugunda amalga oshirgan ishlarimizga yo‘l ochadi. Moziy va Bugun – bu vaqtning qiyofasi, bizning kelajakka yo‘limiz!"}	2025-12-23 05:11:35	2026-02-17 09:35:56
701	207	\N	\N	\N	uz	{"title": "Xorijdagi ustozlar", "description": "Xorijda o'zbek tilini o'rgatayotgan ustozlar"}	2026-01-21 18:36:02	2026-02-13 09:50:52
717	212	\N	\N	\N	uz	{"title": "Birinchi guruh"}	2026-01-22 10:20:38	2026-02-06 06:52:33
727	205	\N	\N	\N	\N	{"url": "https://mutolaa.com/uz"}	2026-01-23 07:10:26	2026-02-13 11:02:41
708	209	\N	\N	\N	ru	{"title": "Узбекский энергетик в Германии", "description": "Узбекский энергетик в Германии  Германия | Yo'lovchi"}	2026-01-21 18:38:13	2026-02-13 10:08:48
709	209	\N	\N	\N	en	{"title": "Uzbek power engineer in Germany", "description": "Uzbek power engineer in Germany | Germany | Yo'lovchi"}	2026-01-21 18:38:13	2026-02-13 10:08:48
698	206	\N	\N	\N	uz	{"title": "PUMAdagi vatandosh", "description": "PUMAda ishlayotgan yagona o'zbek qizi"}	2026-01-21 18:35:24	2026-02-13 10:09:02
888	258	\N	\N	\N	ru	{"title": "Украина"}	2026-02-18 06:59:14	2026-02-18 07:01:43
889	258	\N	\N	\N	en	{"title": "Ukraine"}	2026-02-18 06:59:14	2026-02-18 07:01:43
844	244	\N	\N	\N	en	{"title": "Lithuania"}	2026-02-18 05:40:38	2026-02-18 05:48:30
845	244	\N	\N	\N	\N	{"code": "lt"}	2026-02-18 05:40:38	2026-02-18 05:48:30
718	212	\N	\N	\N	ru	{"title": null}	2026-01-22 10:20:38	2026-02-06 06:52:33
719	212	\N	\N	\N	en	{"title": null}	2026-01-22 10:20:38	2026-02-06 06:52:33
702	207	\N	\N	\N	ru	{"title": "Зарубежные учителя", "description": "Учителя, преподающие узбекский язык за рубежом"}	2026-01-21 18:36:02	2026-02-13 09:50:52
890	258	\N	\N	\N	\N	{"code": "ua"}	2026-02-18 06:59:14	2026-02-18 07:01:43
1470	465	456	tashkilot	tashkilot	\N	{"title": "Tomaris Uzbek Ladies Society"}	2026-02-20 04:48:35	2026-02-20 04:50:35
703	207	\N	\N	\N	en	{"title": "Foreign teachers or Overseas teachers", "description": "Teachers teaching the Uzbek language abroad"}	2026-01-21 18:36:02	2026-02-13 09:50:52
694	1	\N	\N	\N	en	{"title": "<span>Vatandoshlar </span> public foundation", "description": "The \\"Vatandoshlar\\" Public Foundation is a non-governmental organization aimed at strengthening spiritual ties with compatriots abroad, widely spreading the Uzbek language and culture, and attracting talented compatriots to the path of New Uzbekistan's development."}	2026-01-21 08:29:27	2026-02-23 10:38:15
726	194	\N	\N	\N	\N	{"link1": "https://apps.apple.com/ru/app/ozbekistonlikmiz/id6745947549", "link2": "https://play.google.com/store/apps/details?id=com.uzbekistonlikmiz&hl=en&pli=1"}	2026-01-23 06:58:27	2026-02-13 10:27:07
728	190	\N	\N	\N	\N	{"link1": "https://onatilim.vatandoshlar.uz/", "link2": "https://onatilim.vatandoshlar.uz/"}	2026-01-23 12:44:51	2026-02-20 05:55:34
695	205	\N	\N	\N	uz	{"title": "<span>“Mutolaa”</span> - eng sara audio va elektron kitoblar!", "url_title": "Mutolaa saytiga otish", "description": "O‘zbek tilidagi eng katta mobil kutubxonani hozir yuklab oling!"}	2026-01-21 12:01:01	2026-02-13 11:02:41
696	205	\N	\N	\N	ru	{"title": "<span>\\"Mutolaa\\"</span> - лучшие аудио- и электронные книги!", "url_title": "Перейти на сайт Mutolaa", "description": "Скачайте прямо сейчас крупнейшую мобильную библиотеку на узбекском языке!"}	2026-01-21 12:01:01	2026-02-13 11:02:41
697	205	\N	\N	\N	en	{"title": "<span>\\"Mutolaa\\"</span> - the best audio and e-books!", "url_title": "Go to Mutolaa website", "description": "Download the largest mobile library in Uzbek language now!"}	2026-01-21 12:01:01	2026-02-13 11:02:41
1	1	\N	\N	\N	uz	{"title": "<span>Vatandoshlar </span> jamoat fondi", "description": "\\"Vatandoshlar\\" jamoat fondi – xorijdagi yurtdoshlar bilan ma'naviy aloqalarni mustahkamlash, o'zbek tili va madaniyatini keng yoyish hamda iqtidorli vatandoshlarni Yangi O'zbekiston taraqqiyoti yo'liga jalb etishga qaratilgan nodavlat tashkilot."}	2025-12-23 04:43:11	2026-02-23 10:38:15
707	209	\N	\N	\N	uz	{"title": "Germaniyadagi o’zbek energetigi", "description": "Germaniyadagi o’zbek energetigi | Germaniya | Yo´lovchi"}	2026-01-21 18:38:13	2026-02-13 10:08:48
699	206	\N	\N	\N	ru	{"title": "Соотечественник в PUMA", "description": "Единственная узбекская девушка, работающая в PUMA"}	2026-01-21 18:35:24	2026-02-13 10:09:02
704	208	\N	\N	\N	uz	{"title": "Garvardagi vatandosh", "description": "Garvard bu katta muvaffaqiyatim emas!"}	2026-01-21 18:37:10	2026-02-13 09:49:11
720	213	\N	\N	\N	uz	{"title": "Ikkinchi guruh"}	2026-01-22 10:22:59	2026-02-06 06:46:10
721	213	\N	\N	\N	ru	{"title": null}	2026-01-22 10:22:59	2026-02-06 06:46:10
722	213	\N	\N	\N	en	{"title": null}	2026-01-22 10:22:59	2026-02-06 06:46:10
705	208	\N	\N	\N	ru	{"title": "Соотечественник в Гарварде", "description": "Гарвард – это не мой большой успех!"}	2026-01-21 18:37:10	2026-02-13 09:49:11
700	206	\N	\N	\N	en	{"title": "Compatriot at PUMA", "description": "The only Uzbek girl working at PUMA"}	2026-01-21 18:35:24	2026-02-13 10:09:02
706	208	\N	\N	\N	en	{"title": "Compatriot at Harvard", "description": "Harvard is not my big achievement!"}	2026-01-21 18:37:10	2026-02-13 09:49:11
729	208	\N	\N	\N	\N	{"url": "https://youtu.be/hmH1CeFZT38?si=jg7rqABSXPumPTKj"}	2026-01-23 12:48:46	2026-02-13 09:49:11
136	53	\N	\N	\N	ru	{"title": "Узбекистан – обитель таинственного прошлого и светлого будущего!", "description": "Узбекистан – гармония истории и современности! Здесь каждый шаг – это уникальное открытие. В последние годы страна вышла на новый уровень в сферах туризма, экономики и сервиса, став ещё более комфортным и увлекательным направлением для путешественников. Самарканд, Бухара и Хива привлекают гостей своим древним духом, а Ташкент – современным очарованием. Здесь сливаются древность и новизна, а гостеприимство покоряет каждое сердце. Узбекистан – это не просто путешествие, а источник вдохновения, открытий и незабываемых впечатлений. Ступите на эту чудесную землю и навсегда свяжите своё сердце с ней!"}	2025-12-25 13:35:56	2026-02-05 10:31:24
735	216	\N	\N	\N	en	{"title": "The memorandum didn't stay on paper — it's coming alive on stage", "description": "<p>In October 2025, creative tours across neighboring countries were organized under the \\"Friendship of Stages\\" project, initiated by the \\"Vatandoshlar\\" Public Foundation. The memorandum of cooperation signed between the Muqimi Uzbek State Academic Musical Theatre and the Babur Osh State Academic Uzbek Musical Drama Theatre of the Kyrgyz Republic is bearing fruit. Today, this agreement is turning into a tangible creative result — Doston Haqberdiyev, chief director of the Muqimi Theatre, is working on staging the production \\"Nodirai Davron.\\" The new performance will be a vivid symbol of friendship, cultural cooperation, and creative unity between the Uzbek and Kyrgyz peoples. 🎭 Soon, \\"Nodirai Davron\\" will be presented to the audience.</p>"}	2026-02-05 12:06:56	2026-02-06 07:21:05
757	221	\N	\N	\N	en	{"title": "A number of spiritual and educational events were organized on the occasion of the 585th anniversary of the birth of Hazrat Alisher Navoi.", "description": "<p>A number of spiritual and educational events were organized in the city of Baku in cooperation between the \\"Vatandoshlar\\" Public Foundation and the Embassy of Uzbekistan in Azerbaijan on the occasion of the 585th anniversary of the birth of the great thinker and sultan of the realm of words, Hazrat Alisher Navoi.<br>The events began with a flower-laying ceremony at the foot of the statue of Hazrat Navoi erected in the city of Baku. Deep respect was paid to the memory of our great ancestor.<br>Subsequently, a creative evening was held at the Azerbaijan Academy of Sciences with the participation of nearly one hundred participants. Ambassadors, professors-teachers, experienced researchers, students, as well as compatriots residing in Azerbaijan actively participated in this event. The creative evening served to widely promote the invaluable literary heritage of Hazrat Navoi and to strengthen the feelings of national pride and spirituality in the hearts of young people.</p>"}	2026-02-13 07:11:08	2026-02-13 07:11:32
187	62	\N	\N	\N	ru	{"title": "Бухарская область", "description": "Бухарская область – один из древнейших и священных регионов Узбекистана, известный во всем мире как один из центров исламской культуры и науки. Областной центр город Бухара – внесен в список Всемирного наследия ЮНЕСКО и называется \\"Звездой Востока\\". Минарет Калян, крепость Арк, мавзолей Саманидов, комплекс Пои-Калон и многочисленные медресе являются великолепными образцами исламской архитектуры. Бухара – родина великих исламских ученых, таких как Имам аль-Бухари и Бахауддин Накшбанд, с тысячелетней историей науки и просвещения. Древние базары области, ткачество и ювелирное ремесло продолжают жить и сегодня. Глубокая духовность бухарского народа, гостеприимство и богатые культурные традиции оставляют незабываемое впечатление в сердце каждого паломника."}	2025-12-26 13:44:40	2026-02-14 20:31:44
733	216	\N	\N	\N	uz	{"title": "Memorandum qog‘ozda qolmay, sahnada o‘zini ko‘rsatmoqda", "description": "<p>2025-yil oktabr oyida \\"Vatandoshlar\\" jamoat fondi tashabbusi bilan yo‘lga qo‘yilgan \\"Sahnalar do‘stligi\\" loyihasi doirasida qo‘shni davlatlar bo‘ylab ijodiy safarlar uyushtirilgan edi.</p><p>Mazkur loyiha doirasida Muqimiy nomidagi O‘zbekiston davlat akademik musiqali teatri hamda Qirg‘iziston Respublikasining Bobur nomidagi O‘sh davlat akademik o‘zbek musiqali drama teatri o‘rtasida imzolangan hamkorlik memorandumi o‘z samarasini bermoqda.</p><p>Bugun bu kelishuv aniq ijodiy natijaga aylanib, Muqimiy teatri bosh rejissyori Doston Haqberdiyev “Nodirai Davron” asarini sahnalashtirish ustida ish olib bormoqda. </p><p>Yangi spektakl - o‘zbek va qirg‘iz xalqlari o‘rtasidagi do‘stlik, madaniy hamkorlik va ijodiy birdamlikning yorqin timsoli bo’ladi.</p><p>🎭 Tez orada “Nodirai Davron” tomoshabinlar hukmiga havola etiladi.</p>"}	2026-02-05 12:06:56	2026-02-06 07:21:05
842	244	\N	\N	\N	uz	{"title": "Litva"}	2026-02-18 05:40:38	2026-02-18 05:48:30
846	245	\N	\N	\N	uz	{"title": "Estoniya"}	2026-02-18 05:49:32	2026-02-18 07:11:29
848	245	\N	\N	\N	en	{"title": "Estonia"}	2026-02-18 05:49:32	2026-02-18 07:11:29
1471	466	465	Nomi	nomi-5	uz	{"title": "Tomaris O‘zbek Ayollar Jamiyati", "description": "O‘zbek ayollarini birlashtirish, ularning huquq va manfaatlarini himoya qilish hamda ijtimoiy, madaniy va ma’rifiy faolligini oshirish tashkilotning asosiy maqsadidir. Tashkilot milliy qadriyat va an’analarni targ‘ib qiladi, ayollarning bilim va ko‘nikmalarini rivojlantirish uchun seminar va uchrashuvlar tashkil etadi. Shuningdek, ijtimoiy himoyaga muhtoj ayollarni qo‘llab-quvvatlaydi, xayriya tadbirlarini o‘tkazadi va turli tashkilotlar bilan hamkorlikni yo‘lga qo‘yadi."}	2026-02-20 04:50:10	2026-02-20 04:50:10
1472	466	465	Nomi	nomi-5	ru	{"title": "Общество узбекских женщин «Томарис»", "description": "Основной целью организации является объединение узбекских женщин, защита их прав и интересов, а также повышение их социальной, культурной и просветительской активности. Организация продвигает национальные ценности и традиции, организует семинары и встречи для развития знаний и навыков женщин. Также она поддерживает женщин, нуждающихся в социальной защите, проводит благотворительные мероприятия и налаживает сотрудничество с различными организациями."}	2026-02-20 04:50:10	2026-02-20 04:50:10
736	217	\N	\N	\N	uz	{"title": "14-yanvar — Vatan himoyachilari kuni munosabati bilan chin qalbdan muborakbod etamiz", "description": "<p>Ona yurtimiz tinchligi va osoyishtaligini ko'z qorachig'idek asrab kelayotgan barcha fidoyi va jasur Vatan posbonlarini O'zbekiston Respublikasi Qurolli Kuchlari tashkil etilganining 34 yilligi hamda 14-yanvar — Vatan himoyachilari kuni munosabati bilan chin qalbdan muborakbod etamiz. Bu sharafli kasb egalariga mustahkam sog'lik, oilaviy baxt hamda mas'uliyatli xizmat yo'lida yuksak marralar va ulkan zafarlar tilaymiz. 🇺🇿 Vatanimiz tinch, osmonimiz doimo musaffo bo'lsin!</p>"}	2026-02-05 12:10:24	2026-02-05 12:10:24
737	217	\N	\N	\N	ru	{"title": "От всей души поздравляем с 14 января — Днём защитников Родины!", "description": "<p>От всей души поздравляем всех преданных и отважных защитников Отечества, оберегающих мир и спокойствие нашей Родины, с 34-летием создания Вооружённых Сил Республики Узбекистан и Днём защитников Родины — 14 января. Желаем представителям этой почётной профессии крепкого здоровья, семейного счастья, высоких достижений и великих побед на пути ответственной службы. 🇺🇿 Пусть наша Родина будет мирной, а небо над ней — всегда ясным!</p>"}	2026-02-05 12:10:24	2026-02-05 12:10:24
738	217	\N	\N	\N	en	{"title": "We wholeheartedly congratulate you on January 14 — Defenders of the Homeland Day!", "description": "<p>We wholeheartedly congratulate all devoted and courageous defenders of our homeland, who safeguard the peace and tranquility of our nation, on the 34th anniversary of the establishment of the Armed Forces of the Republic of Uzbekistan and Defenders of the Homeland Day — January 14. We wish the bearers of this honorable profession strong health, family happiness, and great achievements and victories in their path of dedicated service. 🇺🇿 May our homeland remain peaceful and our skies forever clear!</p>"}	2026-02-05 12:10:24	2026-02-05 12:10:24
1884	586	\N	\N	\N	uz	{"desc": "<p>asdasd</p>", "title": null}	2026-02-25 11:00:19	2026-02-25 11:00:19
847	245	\N	\N	\N	ru	{"title": "Эстония"}	2026-02-18 05:49:32	2026-02-18 07:11:29
83	36	\N	\N	\N	uz	{"title": "Vatandoshlar", "content": null, "description": "“Vatandoshlar” jamoat fondi 2021 yil 11 avgustda tashkil etilgan. Bizning asosiy maqsadimiz- xorijda istiqomat qilayotgan vatandoshlarni tarixiy Vatani atrofida yanada jipslashtirish, ularning qalbi va ongida yurt bilan faxrlanish tuyg‘usini yuksaltirish, milliy o‘zlikni saqlab qolish, vatandoshlar va ular tomonidan tuzilgan jamoat birlashmalarini qo‘llab-quvvatlash, turli sohalarda faoliyat yuritayotgan vatandoshlarimizning salohiyatini mamlakatimiz taraqqiyotiga samarali yo‘naltirishdir!"}	2025-12-25 08:47:03	2026-02-12 12:34:06
734	216	\N	\N	\N	ru	{"title": "Меморандум не остался на бумаге — он воплощается на сцене", "description": "<p>В октябре 2025 года по инициативе общественного фонда «Ватандошлар» в рамках проекта «Дружба сцен» были организованы творческие поездки по соседним странам. Меморандум о сотрудничестве, подписанный между Узбекским государственным академическим музыкальным театром имени Мукими и Ошским государственным академическим узбекским музыкально-драматическим театром имени Бабура Кыргызской Республики, приносит свои плоды. Сегодня это соглашение обретает конкретный творческий результат — главный режиссёр театра Мукими Достон Хакбердиев работает над постановкой произведения «Нодираи Даврон». Новый спектакль станет ярким символом дружбы, культурного сотрудничества и творческого единства узбекского и кыргызского народов. 🎭 Скоро «Нодираи Даврон» будет представлен вниманию зрителей.</p>"}	2026-02-05 12:06:56	2026-02-06 07:21:05
84	36	\N	\N	\N	ru	{"title": "Vatandoshlar", "content": null, "description": "Общественный фонд \\"Ватанадошлар\\" создан 11 августа 2021 года. Наша главная цель - объединение соотечественников, проживающих за рубежом, вокруг своей исторической родины, воспитание в их сердцах и умах чувства гордости за Родину, сохранение национального самосознания, поддержка соотечественников и созданных ими общественных объединений, эффективное направление потенциала соотечественников, работающих в различных сферах, на развитие нашей страны!"}	2025-12-25 08:47:03	2026-02-12 12:34:06
739	36	\N	\N	\N	\N	{"url": null}	2026-02-12 12:34:06	2026-02-12 12:34:06
175	69	\N	\N	\N	\N	{"code": "UZ-SI", "path": "m548.082 310.43-1.48.891-1.186.304-2.197-.616-.902.404-5.001 1.599.929-5.89-.285-.625-6.556 1.507-2.096.726-3.696.753-4.202.157-6.022-.285-.294-.046-.607-.892-.312-.827-.138-.882.184-1.397 4.551-10.145.708-1.838.137-.708-.147-.184-.303.092-1.94.938-.147-.249.441-4.493 1.931-.497 1.71.092.313-.56.156-2.61 3.356 2.858 1.737-.46 1.756 1.443-.496 1.048 4.478 1.314.744-1.029 2.207.165 3.962-1.59-.772-1.92-2.216-1.186-1.039-3.023-3.015-4.163.8-6.847-.92-2.325.791-.827-.809-1.277-3.328-.212-.01-1.194 4.524.285.294.551 2.17-1.351-.019.221.286.082.183 1.103.616.23.736-.34.864.193.34.349-.128.303-1.324.506-.175.321-.028.515.497.974.368-.303 4.468 5.073 3.19 3.189 4.524 4.08 4.33 3.593.57.074 2.786 3.887-.46 4.319-.79 4.889-.929 4.558.018.974.129.57.46.965-.23 4.347-1.021-.322-2.362-.018-3.09.321z", "offset": "0,-20"}	2025-12-26 13:31:46	2026-02-14 19:30:16
742	39	\N	\N	\N	\N	{"url": null}	2026-02-12 12:53:30	2026-02-12 13:01:40
221	73	\N	\N	\N	en	{"title": "Tashkent city", "description": "Tashkent – the capital of Uzbekistan and one of its most ancient cities with a thousand-year history. Historical monuments such as the Hazrati Imam complex, Chorsu Bazaar, Amir Timur Square, and Kukeldash Madrasah testify to the rich cultural heritage of Central Asia. Located on the territory of the ancient city of Shash, Tashkent has preserved examples of Islamic architecture, ruins of ancient fortresses, and archaeological finds. In the Old City area, narrow streets and ancient buildings distinguished by their centuries-old history still retain their magic today. Together with its modern metro system and skyscrapers, Tashkent is a magnificent example of the harmonious fusion of past and present."}	2025-12-26 13:53:35	2026-02-14 16:55:43
741	56	\N	\N	\N	\N	{"url": "https://youtu.be/GXv2k2kWVTc?si=pQsT19Gvma6MwLGz"}	2026-02-12 12:39:45	2026-02-12 13:09:32
740	37	\N	\N	\N	\N	{"url": null}	2026-02-12 12:37:35	2026-02-13 05:31:07
90	38	\N	\N	\N	ru	{"title": "О создании фонда", "content": null, "description": "Общественный фонд \\"Ватандошлар\\" был создан Указом Президента Республики Узбекистан УП-№5220 от 11 августа 2021 года с целью установления, развития, постоянных и эффективных отношений с соотечественниками в зарубежных странах, а также для сплочения вокруг единогласной Родины.  Попечительский совет ОФ «Ватандошлар» является высшим органом. Попечительский совет формирует Правление Фонда. В свою очередь, Правление Фонда является исполнительным органом.  Парламентская комиссия «Фонда поддержки Негосударственных некоммерческих организаций и других институтов гражданского общества» при Олий Мажлисе Республики Узбекистан, предоставляет необходимые средства в виде субсидий для финансирования деятельности Фонда и проведения им ряда мероприятий в рамках реализации основных задач Фонда."}	2025-12-25 08:48:32	2026-02-12 13:04:56
91	38	\N	\N	\N	en	{"title": "About the establishment of the foundation", "content": null, "description": "The public foundation \\"Vatandoshlar\\" was established on August 11, 2021 by the decree of the President of the Republic of Uzbekistan No. PD-5220 in order to establish and develop permanent and effective relations with our compatriots in foreign countries and to unite around them to their Motherland.  The board of trustees of \\"Vatandoshlar\\" public foundation is the highest organ of the foundation. The Foundation Management formed by the Board of Trustees is considered the executive organ of the foundation.  The Parliamentary Commission for the Management of the Funds of the Public Fund for the Support of Non-Governmental Organizations and other Institutions of Civil Society under the Oliy Majlis of the Republic of Uzbekistan allocates the necessary funds in the form of subsidies to finance the organization and conduct of activities within the framework of the main tasks of the Fund."}	2025-12-25 08:48:32	2026-02-12 13:04:56
743	38	\N	\N	\N	\N	{"url": null}	2026-02-12 13:04:56	2026-02-12 13:04:56
186	62	\N	\N	\N	uz	{"title": "Buxoro", "description": "Buxoro viloyati – O'zbekistonning eng qadimiy va muqaddas hududlaridan biri bo'lib, islom madaniyati va ilm-fan markazlaridan biri sifatida butun dunyoga mashhur. Viloyat markazi Buxoro shahri – UNESCO Jahon merosi ro'yxatiga kiritilgan \\"Sharqning yulduzi\\" deb ataladi. Bu yerdagi Kalon minorasi, Ark qal'asi, Samoniylar maqbarasi, Po-i-Kalon majmuasi va ko'plab madrasalar islom me'morchiligining ajoyib namunalaridir. Buxoro Imom al-Buxoriy, Bahouddin Naqshband kabi buyuk islom olimlarining vatani bo'lib, ming yillik ilm-fan va ma'rifat tarixiga ega. Viloyatning qadimiy bozorlari, to'qimachilik va zargarlik hunarmandchiligi bugungi kunda ham jonli holda davom etmoqda. Buxoro xalqining chuqur ma'naviyati, mehmondo'stligi va boy madaniy an'analari har bir ziyoratchi qalbida unutilmas taassurot qoldiradi."}	2025-12-26 13:44:40	2026-02-14 20:31:44
86	37	\N	\N	\N	uz	{"title": "Fondning ramzi", "content": null, "description": "\\"Vatandoshlar\\" jamoat fondining ramzida asosan milliy qadriyatlarimizni anglatuvchi minoralar hamda tarixiy obidalarimizning naqshlarida aks etgan ko‘k rangdan foydalanilgan. Ko‘k rang – bu tinchlik va hotirjamlik ramzi bo‘lib, u yaxshilikni, donishmandlikni, halollikni va sadoqatni bildiradi. Markazda O‘zbekiston Respublikasining 30 yilligi munosabati bilan “Yangi O‘zbekiston” bog‘ida bunyod etilgan muhtasham obida “Mustaqillik monumenti” joy olgan. Obidaning eng yuqori qismida O‘zbekiston gerbidan ham o‘rin olgan “Humo qushi” tasvirlangan. Obidaning orqa tomonida globus tasviri tushirilgan bo‘lib, bu xorijda istiqomat qilayotgan vatandoshlar bilan ishlashni nazarda tutadi. Shuningdek, ramzda ochiq kaftlar keltirilgan bo‘lib, bu Fondning ochiqlik va qabul qilishlikni, halollik va samimiylikni, vatandoshlarni “Yangi O‘zbekiston” atrofida yanada jipslashishiga, ularga doimiy ravishda g‘amxo‘rlik qilishga ham tayyor ekanligini anglatadi."}	2025-12-25 08:48:11	2026-02-13 05:31:07
88	37	\N	\N	\N	en	{"title": "The symbol of the foundation", "content": null, "description": "The symbol of the public foundation \\"Vatandoshlar\\" mainly uses the blue color reflected in the patterns of minarets and historical monuments, which represent our national values. Blue is a symbol of peace and tranquility, and it represents goodness, wisdom, honesty and loyalty.                In the center, there is the \\"Monument of Independence\\" in the magnificent monument built in the \\"New Uzbekistan\\" park on the occasion of the 30th anniversary of the Republic of Uzbekistan. In the upper part of the monument, the \\"Humo\\" bird, which is part of the coat of arms of Uzbekistan, is depicted. On the back of the monument there is an image of a globe, which means working with compatriots living abroad.                 Together with, open palms are shown in the symbol, which means that the Foundation is ready to promote openness and acceptance, honesty and sincerity, to unite compatriots around the \\"New Uzbekistan\\" and to take care of them constantly."}	2025-12-25 08:48:11	2026-02-13 05:31:07
755	221	\N	\N	\N	uz	{"title": "Hazrat Alisher Navoiy tavalludining 585 yilligi munosabati bilan qator ma’naviy-ma’rifiy tadbirlar tashkil etildi.", "description": "<p>“Vatandoshlar” jamoat fondi hamda O‘zbekistonning Ozarbayjondagi elchixonasi hamkorligida Boku shahrida buyuk mutafakkir va so‘z mulkining sultoni Hazrat Alisher Navoiy tavalludining 585 yilligi munosabati bilan qator ma’naviy-ma’rifiy tadbirlar tashkil etildi.<br>Tadbirlar Hazrat Navoiyning Boku shahrida qad rostlagan haykali poyiga gul qo‘yish marosimi bilan boshlandi. Unda buyuk ajdodimiz xotirasiga chuqur ehtirom bajo keltirildi.</p><p>Shundan so‘ng Ozarbayjon Fanlar akademiyasida yuzga yaqin ishtirokchi qatnashgan ijodiy kecha bo‘lib o‘tdi. Mazkur tadbirda elchilar, professor-o‘qituvchilar, yetuk tadqiqotchilar, talabalar hamda Ozarbayjonda istiqomat qilayotgan vatandoshlar faol ishtirok etdilar. Ijodiy kecha Hazrat Navoiyning bebaho adabiy merosini keng targ‘ib etish, yoshlar qalbida milliy g‘urur va ma’naviyat tuyg‘ularini mustahkamlashga xizmat qildi.</p>"}	2026-02-13 07:11:08	2026-02-13 07:11:32
219	73	\N	\N	\N	uz	{"title": "Toshkent sh.", "description": "Toshkent – O'zbekistonning poytaxti va eng qadimiy shaharlaridan biri bo'lib, ming yillik tarixga ega. Bu yerdagi Xast Imom majmuasi, Chorsu bozori, Amir Temur maydoni va Ko'kaldosh madrasasi kabi tarixiy yodgorliklar O'rta Osiyoning boy madaniy merosidan darak beradi. Qadimgi Shosh shahri hududida joylashgan Toshkentda islom meʼmorchiligi namunalari, qadimiy qalʼalar xarobalari va arxeologik topilmalar saqlanib qolgan. Shaharning Eski shahar qismida, asr-asrlik tarixi bilan ajralib turadigan tor koʻchalar va qadimiy binolar bugungi kunda ham oʻz sihrini saqlab kelmoqda. Zamonaviy metropoliten va osmono'par binolar bilan birga, Toshkent o'tmish va hozirning uyg'un birlashgan ajoyib namunasi hisoblanadi."}	2025-12-26 13:53:35	2026-02-14 16:55:43
849	245	\N	\N	\N	\N	{"code": "ee"}	2026-02-18 05:49:32	2026-02-18 07:11:29
87	37	\N	\N	\N	ru	{"title": "Логотип фонда", "content": null, "description": "В символике общественного фонда \\"Ватандошлар\\" в основном используются башни, символизирующие наши национальные ценности. Также в узорах наших исторических памятников используются синий цвет. Синий цвет - символ мира и гармонии, который символизирует добро, мудрость, честность и верность.  В парке \\"Новый Узбекистан\\" по случаю 30-летия Республики Узбекистан был воздвигнут великолепный \\"Монумент независимости\\". На вершине памятника изображена \\"птица Хумо\\", на которой также изображен герб Узбекистана. На обратной стороне памятника изображен земной шар, что подразумевает работу с соотечественниками, проживающими за рубежом.  На символе также изображены раскрытые ладони, что означает, что Фонд также готов заботиться об открытости и принятии, честности и искренности, а граждане должны стать более сплоченными вокруг \\"Нового Узбекистана\\", постоянно заботиться о них."}	2025-12-25 08:48:11	2026-02-13 05:31:07
744	16	\N	\N	\N	en	{"title": "Establishment and development of cooperation with public associations"}	2026-02-13 05:39:50	2026-02-13 05:39:50
745	17	\N	\N	\N	en	{"title": "Assistance in the protection of the rights and freedoms of compatriots"}	2026-02-13 05:40:26	2026-02-13 05:40:26
672	198	\N	\N	\N	uz	{"title": "Vatandoshlar tomonidan tashkil etilgan jamoat birlashmalari faoliyatini rag‘batlantirish"}	2026-01-21 06:34:12	2026-02-13 05:43:35
674	198	\N	\N	\N	en	{"title": "Promotion of the activities of Public Associations organized by compatriots"}	2026-01-21 06:34:12	2026-02-13 05:43:35
676	199	\N	\N	\N	ru	{"title": "Оказание практической помощи в организации узбекских национальных культурных центров за рубежом"}	2026-01-21 06:34:48	2026-02-13 05:44:07
679	200	\N	\N	\N	ru	{"title": "Организация культурно-просветительских мероприятий для соотечественников помощь в достижении"}	2026-01-21 06:35:22	2026-02-13 05:44:37
681	201	\N	\N	\N	uz	{"title": "Vatandoshlarimizni respublika oliy ta’lim muassasalarida o‘zbek tili yo‘nalishi bo‘yicha ta’lim olishlariga ko‘mak ko‘rsatish"}	2026-01-21 06:35:47	2026-02-13 05:45:07
684	202	\N	\N	\N	uz	{"title": "Vatandoshlarimizni yurtimiz nufuzini oshirishga qaratilgan ilmiy, ijodiy izlanishlarini qo‘llab-quvvatlash"}	2026-01-21 06:36:09	2026-02-13 05:45:48
686	202	\N	\N	\N	en	{"title": "Support our compatriots for scientific, creative research aimed at increasing the prestige of our country"}	2026-01-21 06:36:09	2026-02-13 05:45:48
104	43	\N	\N	\N	uz	{"title": "“Vatandoshlar” jamoat fondi pul mablag‘ini kimdan oladi?", "description": "<p>Fond mablag‘larini shakllantirish manbalari etib:</p><p> - Davlat subsidiyasi va davlat ijtimoiy buyurtmalaridan kelib tushadigan mablag‘lar;</p><p> - Muassislar tomonidan ajratiladigan mablag‘lar;</p><p> - Yuridik va jismoniy shaxslarning homiylik xayriyalari;</p><p> - Yuridik va jismoniy shaxslar, xorijiy va xalqaro tashkilotlar, xorijiy davlatlarning grantlari;</p><p> - Fond mablag‘larini tijorat banklarida depozitga qo‘yishdan olinadigan daromadlar;</p><p> - Fondning tadbirkorlik faoliyatidan olinadigan daromadlar (foyda);</p><p> - Qonunchilik hujjatlarida taqiqlanmagan boshqa manbalar belgilangan.</p>"}	2025-12-25 09:50:30	2026-02-13 05:48:35
105	43	\N	\N	\N	ru	{"title": "3. От кого получает средства общественный фонд «Ватандошда»?", "description": "<p>Источниками формирования средств Фонда является:</p><p> - государственные субсидии и средства, поступающие от государственных социальных заказов;</p><p> - средства, выделяемые учредителями;</p><p> - благотворительные пожертвования юридических и физических лиц;</p><p> - гранты юридических и физических лиц, зарубежных и международных организаций, а также зарубежных государств;</p><p> - доходы, получаемые от размещения средств Фонда на депозиты коммерческих банков;</p><p> - доходы (прибыль), получаемые от предпринимательской деятельности Фонда;</p><p> - иные источники, не запрещенные актами законодательства.</p>"}	2025-12-25 09:50:30	2026-02-13 05:48:35
98	41	\N	\N	\N	uz	{"title": "Vatandosh kim?", "description": "O‘zbekiston hududidan tashqarida doimo istiqomat qiladigan yoki ta’lim olish, mehnat faoliyati bilan shug‘ullanish, oilaviy sabablar va boshqa sharoitlardan kelib chiqib, vaqtinchalik chet elda yurgan O‘zbekiston Respublikasi fuqarosi Xorijga chiqqan va chet el fuqaroligini olgan, Vataniga ma’naviy va madaniy nuqtai nazardan mansublikni his qilgan hamda O‘zbekiston Respublikasi bilan madaniy-gumanitar, ijtimoiy-iqtisodiy va boshqa aloqalarni rivojlantirishga harakat qilayotgan O‘zbekistondan chiqib ketgan shaxs va uning avlodi Etnik, til va madaniy-tarixiy nuqtai nazardan o‘zini o‘zbeklar yoki qoraqalpoqlar sifatida identifikatsiya qilgan hamda O‘zbekiston bilan har tomonlama aloqada bo‘lish xohishida bo‘lgan   xorijda istiqomat qilayotgan chet el fuqarolari va fuqaroligi bo‘lmagan shaxslar xorijda istiqomat  qilayotganlar."}	2025-12-25 09:49:29	2026-02-13 05:52:13
101	42	\N	\N	\N	uz	{"title": "“Vatandoshlar” jamoat fondi qanday tashkilot?", "description": "<p>Fond 2021 yil 11 avgustda O‘zbekiston Respublikasi Prezidentining PQ-5220-sonli qarori bilan xorijiy davlatlardagi vatandoshlarimiz bilan doimiy va samarali aloqalar o‘rnatish va rivojlantirish hamda yagona ona Vatan atrofida jiplashtirish maqsadida tashkil etilgan.</p>"}	2025-12-25 09:50:10	2026-02-13 05:52:55
103	42	\N	\N	\N	en	{"title": "2. What organization is the public fund \\"Vatandoshlar\\"?", "description": "<p>The public foundation \\"Vatandoshlar\\" was established on August 11, 2021 by the decree of the President of the Republic of Uzbekistan No.PD-5220 in order to establish and develop permanent and effective relations with our compatriots in foreign countries and to unite around them to their Motherland.</p>"}	2025-12-25 09:50:10	2026-02-13 05:52:55
850	246	\N	\N	\N	uz	{"title": "Turkiya"}	2026-02-18 05:53:53	2026-02-18 05:53:53
851	246	\N	\N	\N	ru	{"title": "Турция"}	2026-02-18 05:53:53	2026-02-18 05:53:53
852	246	\N	\N	\N	en	{"title": "Turkey"}	2026-02-18 05:53:53	2026-02-18 05:53:53
853	246	\N	\N	\N	\N	{"code": "tr"}	2026-02-18 05:53:53	2026-02-18 05:53:53
99	41	\N	\N	\N	ru	{"title": "1.Кто является соотечественникам ?", "description": "<p>Граждане Республики Узбекистан, постоянно проживающие за пределами территории Узбекистана либо временно пребывающие за рубежом в связи с учебой, трудовой деятельностью, семейными и другими обстоятельствами Выходцы из Узбекистана, выехавшие за рубеж и ставшие гражданами иностранного государства, а также их потомки, сохранившие чувство духовной и культурной причастности к Родине и стремящиеся к развитию дружественных культурно-гуманитарных, социально-экономических и других связей с Республикой Узбекистан; - иностранные граждане или лица без гражданства, проживающие за рубежом, идентифицирующие себя как узбеков или каракалпаков по этнической и языковой принадлежности, а также с культурно-исторической точки зрения и желающие поддерживать всестороннюю связь с Узбекистаном.</p>"}	2025-12-25 09:49:29	2026-02-13 05:52:13
102	42	\N	\N	\N	ru	{"title": "2. Какая организация Общественный фонд «Ватандошлар»?", "description": "<p>Фонд создан 11 августа 2021 года по постановлению Президента Республики Узбекистан № ПҚ-5220 в целях дальнейшего объединения соотечественников, проживающих за рубежом, вокруг исторической родины.</p>"}	2025-12-25 09:50:10	2026-02-13 05:52:55
188	62	\N	\N	\N	en	{"title": "Bukhara", "description": "Bukhara Region – one of the most ancient and sacred regions of Uzbekistan, famous throughout the world as one of the centers of Islamic culture and science. The regional center, Bukhara city, is inscribed on the UNESCO World Heritage List and is called the \\"Star of the East.\\" The Kalyan Minaret, Ark Fortress, Samanid Mausoleum, Poi-Kalyan complex, and numerous madrasahs are magnificent examples of Islamic architecture. Bukhara is the homeland of great Islamic scholars such as Imam al-Bukhari and Bahauddin Naqshband, with a thousand-year history of science and enlightenment. The region's ancient bazaars, weaving, and jewelry crafts continue to thrive today. The deep spirituality of the Bukhara people, their hospitality, and rich cultural traditions leave an unforgettable impression in the heart of every pilgrim."}	2025-12-26 13:44:40	2026-02-14 20:31:44
18	8	\N	\N	\N	ru	{"title": "Наши ценности объединяют нас!", "description": "Наши ценности объединяют нас! Наши ценности – это наши корни, сила нашего сердца и светлый путь нашего будущего. Они связывают нас, объединяют сердца каждого из нас и дают нам возможность достичь настоящего успеха. Мы должны гордиться этими ценностями, потому что они возвышают нас и показывают миру нашу истинную силу. Оставаться верными нашим ценностям, продолжать их – это необходимо не только для нашего сегодняшнего дня, но и для нашего будущего. Наши ценности – это наше вечное наследие!"}	2025-12-23 05:10:29	2026-02-17 09:24:16
854	247	\N	\N	\N	uz	{"title": "Janubiy Koreya"}	2026-02-18 06:00:01	2026-02-18 06:00:01
855	247	\N	\N	\N	ru	{"title": "Южная Корея"}	2026-02-18 06:00:01	2026-02-18 06:00:01
749	219	\N	\N	\N	uz	{"title": "Kuala-Lumpur shahrida buyuk mutafakkir, shoir va davlat arbobi Hazrat Alisher Navoiy tavalludining 585 yilligi keng nishonlandi.", "description": "<p>O‘zbekistonning Malayziyadagi elchixonasi hamda “Vatandoshlar” jamoat fondi tashabbusi bilan Kuala-Lumpur shahrida buyuk mutafakkir, shoir va davlat arbobi Hazrat Alisher Navoiy tavalludining 585 yilligi keng nishonlandi.</p><p>Ushbu sana munosabati bilan tashkil etilgan ma’naviy-ma’rifiy tadbirda O‘zbekiston elchixonasi vakillari, ta’lim muassasalari rahbarlari, o‘qituvchi va talabalar, shuningdek, Malayziyada tahsil olayotgan o‘zbekistonlik yoshlar ishtirok etdilar.</p><p>Tadbir davomida Alisher Navoiyning boy adabiy va falsafiy merosi, uning jahon adabiyoti va davlatchilik tarixidagi beqiyos o‘rni, shuningdek, yosh avlod ma’naviy tarbiyasidagi ahamiyati haqida so‘z yuritildi.</p><p>Shuningdek, “Vatandoshlar” jamoat fondi tomonidan Navoiy asarlari hamda bir qator badiiy adabiyotlar taqdim etildi.</p>"}	2026-02-13 07:05:44	2026-02-13 07:06:51
746	218	\N	\N	\N	uz	{"title": "Fond tuzilmasi"}	2026-02-13 06:10:45	2026-02-13 06:18:44
747	218	\N	\N	\N	ru	{"title": null}	2026-02-13 06:10:45	2026-02-13 06:18:44
748	218	\N	\N	\N	en	{"title": null}	2026-02-13 06:10:45	2026-02-13 06:18:44
856	247	\N	\N	\N	en	{"title": "South Korea"}	2026-02-18 06:00:01	2026-02-18 06:00:01
751	219	\N	\N	\N	en	{"title": "The 585th anniversary of the birth of the great thinker, poet and statesman Hazrat Alisher Navoi was widely celebrated in the city of Kuala Lumpur.", "description": "<p>The 585th anniversary of the birth of the great thinker, poet and statesman Hazrat Alisher Navoi was widely celebrated in the city of Kuala Lumpur on the initiative of the Embassy of Uzbekistan in Malaysia and the \\"Vatandoshlar\\" Public Foundation.<br>Representatives of the Embassy of Uzbekistan, heads of educational institutions, teachers and students, as well as Uzbek youth studying in Malaysia participated in the spiritual and educational event organized on the occasion of this date.<br>During the event, discussions were held about Alisher Navoi's rich literary and philosophical heritage, his incomparable place in the history of world literature and statehood, as well as his significance in the spiritual education of the younger generation.<br>Additionally, works of Navoi and a number of fiction books were presented by the \\"Vatandoshlar\\" Public Foundation.</p>"}	2026-02-13 07:05:44	2026-02-13 07:06:51
857	247	\N	\N	\N	\N	{"code": "kr"}	2026-02-18 06:00:01	2026-02-18 06:00:01
893	259	\N	\N	\N	en	{"title": "Kazakhstan"}	2026-02-18 07:12:03	2026-02-18 07:16:35
894	259	\N	\N	\N	\N	{"code": "kz"}	2026-02-18 07:12:03	2026-02-18 07:16:35
1473	466	465	Nomi	nomi-5	en	{"title": "Tomaris Uzbek Ladies Society", "description": "The main goal of the organization is to unite Uzbek women, protect their rights and interests, and enhance their social, cultural, and educational engagement. The organization promotes national values and traditions, organizes seminars and meetings to develop women's knowledge and skills. It also supports women in need of social protection, conducts charitable events, and establishes cooperation with various organizations."}	2026-02-20 04:50:10	2026-02-20 04:50:10
1474	466	465	Nomi	nomi-5	\N	{"boss_at": "19/10/2024", "date_at": "19/10/2024"}	2026-02-20 04:50:10	2026-02-20 04:50:10
750	219	\N	\N	\N	ru	{"title": "В городе Куала-Лумпур широко отмечалась 585-я годовщина со дня рождения великого мыслителя, поэта и государственного деятеля Хазрата Алишера Навои.", "description": "<p>По инициативе Посольства Узбекистана в Малайзии и общественного фонда \\"Ватандошлар\\" в городе Куала-Лумпур широко отмечалась 585-я годовщина со дня рождения великого мыслителя, поэта и государственного деятеля Хазрата Алишера Навои.<br>В духовно-просветительском мероприятии, организованном по случаю этой даты, приняли участие представители Посольства Узбекистана, руководители образовательных учреждений, преподаватели и студенты, а также узбекская молодёжь, обучающаяся в Малайзии.<br>В ходе мероприятия говорилось о богатом литературном и философском наследии Алишера Навои, его неоценимом месте в истории мировой литературы и государственности, а также о его значении в духовном воспитании молодого поколения.<br>Кроме того, общественным фондом \\"Ватандошлар\\" были представлены произведения Навои и ряд художественной литературы.</p>"}	2026-02-13 07:05:44	2026-02-13 07:06:51
752	220	\N	\N	\N	uz	{"title": "Qirg‘iziston Respublikasi, O‘sh shahrida buyuk mutafakkir, shoir va davlat arbobi Hazrat Alisher Navoiy tavalludining 585 yilligi keng nishonlandi.", "description": "<p>Mazkur ma’naviy-ma’rifiy tadbirda Qirg‘izistonda istiqomat qilayotgan vatandoshlarimiz faol ishtirok etib, ko‘tarinki kayfiyatda buyuk bobomiz merosiga bo‘lgan yuksak ehtirom va e’tiborni namoyon etdilar.</p><p>Tadbir davomida Alisher Navoiy ijodining ma’naviy ahamiyati, uning jahon adabiyoti va milliy o‘zlikni anglashdagi o‘rni alohida ta’kidlandi.</p>"}	2026-02-13 07:08:59	2026-02-13 07:09:39
753	220	\N	\N	\N	ru	{"title": "В городе Ош Кыргызской Республики широко отмечалась 585-я годовщина со дня рождения великого мыслителя, поэта и государственного деятеля Хазрата Алишера Навои.", "description": "<p>В городе Ош Кыргызской Республики широко отмечалась 585-я годовщина со дня рождения великого мыслителя, поэта и государственного деятеля Хазрата Алишера Навои.<br>Наши соотечественники, проживающие в Кыргызстане, приняли активное участие в данном духовно-просветительском мероприятии и в приподнятом настроении проявили высокое уважение и внимание к наследию нашего великого предка.<br>В ходе мероприятия особо подчеркивалось духовное значение творчества Алишера Навои, его место в мировой литературе и в осознании национальной идентичности.</p>"}	2026-02-13 07:08:59	2026-02-13 07:09:39
754	220	\N	\N	\N	en	{"title": "The 585th anniversary of the birth of the great thinker, poet and statesman Hazrat Alisher Navoi was widely celebrated in the city of Osh, Kyrgyz Republic.", "description": "<p>The 585th anniversary of the birth of the great thinker, poet and statesman Hazrat Alisher Navoi was widely celebrated in the city of Osh, Kyrgyz Republic.<br>Our compatriots residing in Kyrgyzstan actively participated in this spiritual and educational event and demonstrated high respect and attention to the legacy of our great ancestor in an uplifted mood.<br>During the event, the spiritual significance of Alisher Navoi's works, his place in world literature and in understanding national identity were particularly emphasized.</p>"}	2026-02-13 07:08:59	2026-02-13 07:09:39
183	61	\N	\N	\N	uz	{"title": "Andijon", "description": "Andijon viloyati – Farg'ona vodiysining sharqiy qismida joylashgan sersuv va go'zal hudud bo'lib, boy tarixi va rivojlangan sanoati bilan mashhur. Viloyat markazi Andijon shahri O'zbekistonning yirik shaharlaridan biri bo'lib, zamonaviy sanoat va madaniyat markazi hisoblanadi. Bu yer Zohiriddin Muhammad Bobur – buyuk shoiru davlat arbobi va Bobur Sulolasining asoschisining tug'ilgan joyi sifatida butun dunyoga tanilgan. Andijon viloyatida Bobur bog'i, Jome' masjidi va boshqa tarixiy yodgorliklar saqlanib qolgan. Viloyat avtomobilsozlik, to'qimachilik va oziq-ovqat sanoati bilan ajralib turadi. Andijonning meva bog'lari, paxta dalalari va yashil vodiylari ajoyib tabiiy manzaralarni yaratadi. Viloyat xalqining mehmondo'stligi, milliy hunarmandchiligi va shirin qovunlari butun O'zbekistonda mashhurdir."}	2025-12-26 13:39:07	2026-02-14 20:34:52
184	61	\N	\N	\N	ru	{"title": "Андижанская область", "description": "Андижанская область – богатый водными ресурсами и красивый регион, расположенный в восточной части Ферганской долины, известный богатой историей и развитой промышленностью. Областной центр город Андижан – один из крупнейших городов Узбекистана, современный промышленный и культурный центр. Это место известно во всем мире как родина Захириддина Мухаммада Бабура – великого поэта, государственного деятеля и основателя династии Бабуридов. В Андижанской области сохранились Сад Бабура, мечеть Джами и другие исторические памятники. Область выделяется автомобилестроением, текстильной и пищевой промышленностью. Фруктовые сады, хлопковые поля и зеленые долины Андижана создают великолепные природные пейзажи. Гостеприимство народа области, национальные ремесла и сладкие дыни известны по всему Узбекистану."}	2025-12-26 13:39:07	2026-02-14 20:34:52
858	248	\N	\N	\N	uz	{"title": "Yaponiya"}	2026-02-18 06:01:03	2026-02-18 06:01:03
859	248	\N	\N	\N	ru	{"title": "Япония"}	2026-02-18 06:01:03	2026-02-18 06:01:03
860	248	\N	\N	\N	en	{"title": "Japan"}	2026-02-18 06:01:03	2026-02-18 06:01:03
861	248	\N	\N	\N	\N	{"code": "jp"}	2026-02-18 06:01:03	2026-02-18 06:01:03
1885	586	\N	\N	\N	ru	{"desc": null, "title": null}	2026-02-25 11:00:19	2026-02-25 11:00:19
896	260	\N	\N	\N	ru	{"title": "Кыргызстан"}	2026-02-18 07:16:19	2026-02-18 07:17:18
897	260	\N	\N	\N	en	{"title": "Kyrgyzstan"}	2026-02-18 07:16:19	2026-02-18 07:17:18
756	221	\N	\N	\N	ru	{"title": "По случаю 585-й годовщины со дня рождения Хазрата Алишера Навои был организован ряд духовно-просветительских мероприятий.", "description": "<p>В сотрудничестве общественного фонда \\"Ватандошлар\\" и Посольства Узбекистана в Азербайджане в городе Баку был организован ряд духовно-просветительских мероприятий по случаю 585-й годовщины со дня рождения великого мыслителя и султана царства слова Хазрата Алишера Навои.<br>Мероприятия начались с церемонии возложения цветов к подножию памятника Хазрату Навои, установленного в городе Баку. При этом была выражена глубокая дань уважения памяти нашего великого предка.<br>Затем в Академии наук Азербайджана состоялся творческий вечер с участием около ста человек. В данном мероприятии приняли активное участие послы, профессора-преподаватели, опытные исследователи, студенты, а также соотечественники, проживающие в Азербайджане. Творческий вечер послужил широкой пропаганде бесценного литературного наследия Хазрата Навои, укреплению чувства национальной гордости и духовности в сердцах молодёжи.</p>"}	2026-02-13 07:11:08	2026-02-13 07:11:32
758	222	\N	\N	\N	uz	{"title": "Alisher Navoiy tavalludining 585 yilligi nishonlanmoqda", "description": "<p>Buyuk mutafakkir va shoir Alisher Navoiy tavalludining 585 yilligi Qirg‘izistonda yashayotgan vatandoshlarimiz ishtirokida keng nishonlanmoqda. Tadbirlar davomida Navoiy ijodi va boy ma’naviy merosi yodga olinib, milliy qadriyatlarimiz targ‘ib etilmoqda.</p>"}	2026-02-13 07:12:56	2026-02-13 07:12:56
759	222	\N	\N	\N	ru	{"title": "Отмечается 585-я годовщина со дня рождения Алишера Навои", "description": "<p>585-я годовщина со дня рождения великого мыслителя и поэта Алишера Навои широко отмечается с участием наших соотечественников, проживающих в Кыргызстане. В ходе мероприятий вспоминается творчество Навои и его богатое духовное наследие, пропагандируются наши национальные ценности.</p>"}	2026-02-13 07:12:56	2026-02-13 07:12:56
760	222	\N	\N	\N	en	{"title": "The 585th anniversary of the birth of Alisher Navoi is being celebrated", "description": "<p>The 585th anniversary of the birth of the great thinker and poet Alisher Navoi is being widely celebrated with the participation of our compatriots living in Kyrgyzstan. During the events, Navoi's works and his rich spiritual heritage are being commemorated, and our national values are being promoted.</p>"}	2026-02-13 07:12:56	2026-02-13 07:12:56
761	223	\N	\N	\N	uz	{"title": "Ashxobod shahrida buyuk mutafakkir va shoirlar – Alisher Navoiy hamda Zahiriddin Muhammad Bobur tavalludiga bag‘ishlangan ma’naviy-ma’rifiy tadbir o‘tkazildi.", "description": "<p>Ashxobod shahrida buyuk mutafakkir va shoirlar – Alisher Navoiy hamda Zahiriddin Muhammad Bobur tavalludiga bag‘ishlangan ma’naviy-ma’rifiy tadbir o‘tkazildi. </p><p>Mazkur tadbir davomida Navoiy va Boburning boy adabiy merosi, ularning jahon sivilizatsiyasi va turkiy adabiyot rivojida tutgan o‘rni haqida ma’ruzalar qilindi. Tadbir ishtirokchilari ulug‘ allomalar merosini asrab-avaylash va yosh avlod orasida keng targ‘ib etish muhimligini alohida ta’kidladilar.</p>"}	2026-02-13 07:14:31	2026-02-13 07:14:31
762	223	\N	\N	\N	ru	{"title": "В городе Ашхабад состоялось духовно-просветительское мероприятие, посвящённое дню рождения великих мыслителей и поэтов – Алишера Навои и Захириддина Мухаммада Бабура.", "description": "<p>В городе Ашхабад состоялось духовно-просветительское мероприятие, посвящённое дню рождения великих мыслителей и поэтов – Алишера Навои и Захириддина Мухаммада Бабура.<br>В ходе данного мероприятия были сделаны доклады о богатом литературном наследии Навои и Бабура, их месте в развитии мировой цивилизации и тюркской литературы. Участники мероприятия особо подчеркнули важность сохранения наследия великих учёных и широкой его пропаганды среди молодого поколения.</p>"}	2026-02-13 07:14:31	2026-02-13 07:14:31
763	223	\N	\N	\N	en	{"title": "A spiritual and educational event dedicated to the birth of the great thinkers and poets – Alisher Navoi and Zahiriddin Muhammad Babur – was held in the city of Ashgabat.", "description": "<p>A spiritual and educational event dedicated to the birth of the great thinkers and poets – Alisher Navoi and Zahiriddin Muhammad Babur – was held in the city of Ashgabat.<br>During this event, presentations were made about the rich literary heritage of Navoi and Babur, their place in the development of world civilization and Turkic literature. The participants of the event particularly emphasized the importance of preserving the legacy of the great scholars and widely promoting it among the younger generation.</p>"}	2026-02-13 07:14:31	2026-02-13 07:14:31
764	224	\N	\N	\N	uz	{"title": "Hazrat Alisher Navoiy tavalludining 585 yilligiga bag'ishlangan madaniy-ma'rifiy tadbir o'tkazildi.", "description": "<p>Sverdlovsk viloyatida faoliyat yuritayotgan \\"Ural va O‘zbekiston xalqlari hamdo‘stligi markazi\\" hamda “Vatandoshlar” jamoat fondi hamkorlikda buyuk mutafakkir, davlat arbobi va mumtoz adabiyotimizning beqiyos namoyondasi – Hazrat Alisher Navoiy tavalludining 585 yilligiga bag‘ishlangan madaniy-ma’rifiy tadbir o'tkazildi. </p><p>Ushbu tantanali anjuman doirasida Navoiy hazratlarining boy ilmiy-adabiy merosi, uning jahon sivilizatsiyasi rivojiga qo‘shgan ulkan hissasi, shuningdek, o‘zbek tili va milliy ma’naviyat taraqqiyotida tutgan o‘rni alohida ta’kidlandi. </p><p>Mazkur tadbir xalqlar o‘rtasidagi do‘stlik va hamjihatlikni mustahkamlash, yosh avlodni milliy qadriyatlar va ma’naviy meros ruhida tarbiyalashga xizmat qildi.</p>"}	2026-02-13 07:16:47	2026-02-13 07:16:47
1477	467	465	Rahbar	rahbar-5	en	{"title": ": Zamira Artikova", "description": null}	2026-02-20 04:52:53	2026-02-20 04:53:28
1478	467	465	Rahbar	rahbar-5	\N	{"email": "test 3", "phone": "test 2"}	2026-02-20 04:52:53	2026-02-20 04:53:28
1476	467	465	Rahbar	rahbar-5	ru	{"title": "Замирa Артикова", "description": null}	2026-02-20 04:52:53	2026-02-20 04:53:28
1604	510	19	tashkilotlar	tashkilot	\N	{"title": "Uzbek Community Center of San Francisco Bay Area"}	2026-02-24 05:12:32	2026-02-24 05:12:32
765	224	\N	\N	\N	ru	{"title": "Состоялось культурно-просветительское мероприятие, посвящённое 585-й годовщине со дня рождения Хазрата Алишера Навои.", "description": "<p>В сотрудничестве Центра дружбы народов Урала и Узбекистана, осуществляющего деятельность в Свердловской области, и общественного фонда \\"Ватандошлар\\" было проведено культурно-просветительское мероприятие, посвящённое 585-й годовщине со дня рождения великого мыслителя, государственного деятеля и бесподобного представителя нашей классической литературы – Хазрата Алишера Навои.<br>В рамках данного торжественного собрания особо подчёркивалось богатое научно-литературное наследие Навои, его огромный вклад в развитие мировой цивилизации, а также его место в развитии узбекского языка и национальной духовности.<br>Данное мероприятие послужило укреплению дружбы и солидарности между народами, воспитанию молодого поколения в духе национальных ценностей и духовного наследия.</p>"}	2026-02-13 07:16:47	2026-02-13 07:16:47
766	224	\N	\N	\N	en	{"title": "A cultural and educational event dedicated to the 585th anniversary of the birth of Hazrat Alisher Navoi was held.", "description": "<p>A cultural and educational event dedicated to the 585th anniversary of the birth of the great thinker, statesman and incomparable representative of our classical literature – Hazrat Alisher Navoi – was held in cooperation between the Center for Friendship of the Peoples of the Urals and Uzbekistan, operating in the Sverdlovsk region, and the \\"Vatandoshlar\\" Public Foundation.<br>Within the framework of this solemn gathering, the rich scientific and literary heritage of Navoi, his enormous contribution to the development of world civilization, as well as his place in the development of the Uzbek language and national spirituality were particularly emphasized.<br>This event served to strengthen friendship and solidarity between peoples, and to educate the younger generation in the spirit of national values and spiritual heritage.</p>"}	2026-02-13 07:16:47	2026-02-13 07:16:47
767	225	\N	\N	\N	uz	{"title": "Chimkent shahrida “Vatandoshlar” jamoat fondi tashabbusi bilan G'azal mulkining sultoni Mir Alisher Navoiy xotirasiga bag‘ishlangan qator ma’naviy-ma’rifiy tadbirlar o‘tkazildi.", "description": "<p>A.Navoiy nomidagi maktabda shoir byusti poyiga gul qo‘yildi, A.Boytursinov nomidagi maktabda esa o‘quvchilar ishtirokida sahna ko‘rinishlari va g‘azalxonlik tashkil etildi. O‘zbek drama teatrida Qozog‘istondagi o‘quvchi va talabalar o‘rtasida o‘tkazilgan “Navoiy o‘qishlari” tanlovining yakuniy bosqichi hamda g‘oliblarni taqdirlash marosimi bo‘lib o‘tdi.</p><p>✔️ Tadbirlar davomida 500 nafardan ortiq vatandoshlar, jumladan yoshlar qatnashdi. O‘zbekistondan tashrif buyurgan delegatsiya vakillari Hazrat Navoiyning bebaho merosi va o‘zbek tilining rivojiga qo‘shgan hissasi haqida ma’lumot berdi. </p><p>🎁 Yakunda ishtirokchilarga badiiy adabiyotlar va milliy cholg‘u asboblari sovg‘a qilindi.</p>"}	2026-02-13 07:23:54	2026-02-13 07:23:54
768	225	\N	\N	\N	ru	{"title": "В городе Шымкент по инициативе общественного фонда \\"Ватандошлар\\" был проведён ряд духовно-просветительских мероприятий, посвящённых памяти султана царства газелей Мир Алишера Навои.", "description": "<p>В школе имени А.Навои были возложены цветы к подножию бюста поэта, а в школе имени А.Байтурсынова были организованы театрализованные представления и чтение газелей с участием учащихся. В Узбекском драматическом театре состоялся финальный этап конкурса \\"Чтения Навои\\", проводимого среди учащихся и студентов в Казахстане, и церемония награждения победителей.<br>✔️ В мероприятиях приняли участие более 500 соотечественников, в том числе молодёжь. Представители делегации, прибывшей из Узбекистана, рассказали о бесценном наследии Хазрата Навои и его вкладе в развитие узбекского языка.<br>🎁 В завершение участникам были вручены в подарок художественная литература и национальные музыкальные инструменты.</p>"}	2026-02-13 07:23:54	2026-02-13 07:23:54
769	225	\N	\N	\N	en	{"title": "A number of spiritual and educational events dedicated to the memory of the sultan of the realm of ghazals, Mir Alisher Navoi, were held in the city of Shymkent on the initiative of the \\"Vatandoshlar\\" Public Foundation.", "description": "<p>Flowers were laid at the foot of the poet's bust at A. Navoi School, and theatrical performances and ghazal recitations were organized with the participation of students at A. Baitursynov School. The final stage of the \\"Navoi Readings\\" competition held among schoolchildren and students in Kazakhstan, as well as the award ceremony for the winners, took place at the Uzbek Drama Theater.<br>✔️ More than 500 compatriots, including young people, participated in the events. Representatives of the delegation from Uzbekistan provided information about the invaluable legacy of Hazrat Navoi and his contribution to the development of the Uzbek language.<br>🎁 At the end, participants were gifted fiction books and national musical instruments.</p>"}	2026-02-13 07:23:54	2026-02-13 07:23:54
1475	467	465	Rahbar	rahbar-5	uz	{"title": "Zamira Artikova", "description": "test 1"}	2026-02-20 04:52:53	2026-02-20 04:53:28
1568	499	497	Rahbar	rahbar-5	uz	{"title": "Kamilla Zakirova", "description": "Hamkor‑asoschi va Bosh direktor"}	2026-02-23 09:27:22	2026-02-24 09:27:54
1569	499	497	Rahbar	rahbar-5	ru	{"title": "Камилла Закирова", "description": "Соучредитель и генеральный директор"}	2026-02-23 09:27:22	2026-02-24 09:27:54
1679	533	\N	\N	\N	\N	{"key": "gender", "type": "select", "column": "4", "required": "1"}	2026-02-25 05:59:06	2026-02-25 06:27:21
1680	534	\N	\N	\N	uz	{"title": "E-mail", "value": null, "placeholder": "example@gmail.com"}	2026-02-25 06:00:00	2026-02-25 06:27:24
1681	534	\N	\N	\N	ru	{"title": null, "value": null, "placeholder": null}	2026-02-25 06:00:00	2026-02-25 06:27:24
1682	534	\N	\N	\N	en	{"title": null, "value": null, "placeholder": null}	2026-02-25 06:00:00	2026-02-25 06:27:24
1683	534	\N	\N	\N	\N	{"key": "email", "type": "email", "column": "4", "required": "1"}	2026-02-25 06:00:00	2026-02-25 06:27:24
1886	586	\N	\N	\N	en	{"desc": null, "title": null}	2026-02-25 11:00:19	2026-02-25 11:00:19
771	226	\N	\N	\N	ru	{"title": "В Баку отметили 585-летие Алишера Навои", "description": "<p>В Баку посольство нашей страны в Азербайджане и общественный фонд “Ватандошлар” провели торжественные мероприятия, посвященные 585-летию со дня рождения великого просветителя и поэта Алишера Навои.<br>Собрание началось с возложения цветов к подножию памятника Навои в Баку. В нем приняли участие послы Узбекистана, Кыргызстана и Таджикистана, ректоры Узбекского государственного университета мировых языков, Ташкентского государственного экономического университета, Узбекского государственного университета мировых языков, Узбекского национального педагогического университета имени Низами, Узбекского национального педагогического университета, представители общественного фонда «Ватандошлар», а также проживающие в Азербайджане наши соотечественники. </p><p>В этот же день в Академии наук Республики Азербайджан прошла научно-просветительная конференция, посвященная дню рождения Алишера Навои. В ней участвовали руководство Академии, академик Исо Хабиббайли, Чрезвычайный и Полномочный посол нашей страны в Баку Бахром Ашрафхонов, посол Турции в Азербайджане Бирол Акгун, представители общественного фонда «Ватандошлар», а также ученые, исследователи, студенты, общественные деятели и соотечественники. </p><p>Был отмечен вклад Алишера Навои в мировую литературу, его заслуги в укреплении духовного единства и культурной близости  тюркских народов. Наследие Навои способствует укреплению дружбы и духовной солидарности. </p><p>Прошедшие в Баку мероприятия направлены на широкую пропаганду в мире наследия великого просветителя, дальнейшее укрепление духовных связей между народами.</p>"}	2026-02-13 07:29:52	2026-02-13 07:30:35
770	226	\N	\N	\N	uz	{"title": "Bokuda Alisher Navoiyning 585 yilligi keng nishonlandi", "description": "<p>Yaqinda Boku shahrida yurtimizning Ozarbayjondagi elchixonasi hamda “Vatandoshlar” jamoat fondi hamkorligida buyuk mutafakkir, so‘z mulkining sultoni Hazrat Alisher Navoiy tavalludining 585 yilligiga bag‘ishlangan tantanali tadbirlar o‘tkazildi.<br>Yig‘in Boku shahrida qad rostlagan Navoiy haykali poyiga gul qo‘yish marosimi bilan boshlandi. Unda O‘zbekiston, Qirg‘iziston va Tojikiston elchilari, O‘zbekiston davlat jahon tillari universiteti, Toshkent davlat iqtisodiyot universiteti va Nizomiy nomidagi O‘zbekiston milliy pedagogika universiteti rektorlari, “Vatandoshlar” jamoat fondi vakillari, shuningdek, Ozarbayjonda istiqomat qilayotgan bir qator vatandoshlarimiz ishtirok etdi. </p><p>Shu kuni Ozarbayjon Respublikasi Fanlar akademiyasida Alisher Navoiy tavalludiga bag‘ishlangan ilmiy-ma’rifiy anjuman bo‘lib o‘tdi. Unda Ozarbayjon FA rahbariyati, akademik Iso Habibbayli, diyorimizning Bokudagi Favqulodda va muxtor elchisi Bahrom Ashrafxonov, Turkiyaning Ozarbayjondagi elchisi Birol Akgo‘n, “Vatandoshlar” jamoat fondi vakillari, shuningdek, bir qator olimlar, tadqiqotchilar, talabalar, jamoat arboblari va vatandoshlar ishtirok etishdi.</p><p>Anjuman davomida Hazrat Alisher Navoiyning jahon adabiyoti va ma’naviyati taraqqiyotida tutgan beqiyos o‘rni, uning turkiy xalqlar ma’naviy birligi va madaniy yaqinligini mustahkamlashdagi xizmatlari alohida ta’kidlandi. Ishtirokchilar Navoiy merosi bugungi kunda ham xalqlar o‘rtasida do‘stlik va ma’naviy hamjihatlikni mustahkamlashga xizmat qilayotganini qayd etdilar.</p><p>Bokuda o‘tkazilgan mazkur tadbirlar buyuk mutafakkir merosini xalqaro miqyosda keng targ‘ib etish, turkiy xalqlar o‘rtasidagi ma’naviy aloqalarni yanada mustahkamlashga qaratilgani bilan ahamiyatli bo‘ldi.</p>"}	2026-02-13 07:29:52	2026-02-13 07:30:35
772	226	\N	\N	\N	en	{"title": "The 585th anniversary of Alisher Navoi celebrated in Baku", "description": "<p>In Baku, the Embassy of the Republic of Uzbekistan in Azerbaijan and the Vatandoshlar Public Foundation held ceremonial events to mark the 585th anniversary of the birth of the great enlightener and poet Alisher Navoi.<br>The gathering began with a flower-laying ceremony at the Navoi’s monument in Baku. It was attended by the ambassadors of Uzbekistan, Kyrgyzstan, and Tajikistan, rectors of the Uzbekistan State World Languages University, the Tashkent State University of Economics, the Uzbek National Pedagogical University named after Nizami, representatives of the Vatandoshlar Public Foundation, as well as our compatriots residing in Azerbaijan.</p><p>On the same day, a scientific and educational conference dedicated to Alisher Navoi's birthday was held at the Azerbaijan National Academy of Sciences.</p><p>Participants highlighted Alisher Navoi’s contribution to world literature and his role in strengthening the spiritual unity and cultural affinity of Turkic peoples. Navoi’s legacy helps reinforce friendship and spiritual solidarity.</p>"}	2026-02-13 07:29:52	2026-02-13 07:30:35
660	194	\N	\N	\N	uz	{"title": "O’zbek tilini o’rganish mobil ilovasini yuklab oling", "description": "Ilovamiz haqida iliq fikrlaringizni kutib qolamiz."}	2026-01-20 06:40:04	2026-02-13 10:27:07
662	194	\N	\N	\N	en	{"title": "Download the mobile app for learning the Uzbek language", "description": "We look forward to your warm feedback about our app."}	2026-01-20 06:40:04	2026-02-13 10:27:07
774	227	\N	\N	\N	ru	{"title": "ALISHER NAVOIY", "description": "ALISHER NAVOIY", "description1": null}	2026-02-13 09:12:41	2026-02-24 08:15:43
775	227	\N	\N	\N	en	{"title": "ALISHER NAVOIY", "description": "ALISHER NAVOIY", "description1": null}	2026-02-13 09:12:41	2026-02-24 08:15:43
1479	468	19	tashkilot	tashkilot	\N	{"title": "Congress of Bukharian Jews in the United States and Canada"}	2026-02-20 05:15:56	2026-02-23 05:25:35
777	207	\N	\N	\N	\N	{"url": "https://youtu.be/0rUU3fyd6kE?si=04OxKJOc-4opuZ8L"}	2026-02-13 09:48:18	2026-02-13 09:50:52
778	209	\N	\N	\N	\N	{"url": "https://youtu.be/xB8j2ftdwUM?si=7kwApsf11F6Q8prc"}	2026-02-13 09:55:44	2026-02-13 10:08:48
779	206	\N	\N	\N	\N	{"url": "https://youtu.be/-xC8Y5Rwam4?si=NnoT37OZbMo7EGW1"}	2026-02-13 10:07:25	2026-02-13 10:09:02
781	228	52	Url	url	ru	{"title": "Союз молодых кинематографистов"}	2026-02-14 16:18:04	2026-02-14 16:20:59
782	228	52	Url	url	en	{"title": "The Union of Youth Cinematographers"}	2026-02-14 16:18:04	2026-02-14 16:20:59
783	228	52	Url	url	\N	{"url": null, "date": "2026-02-14T13:30"}	2026-02-14 16:18:04	2026-02-14 16:20:59
165	59	\N	\N	\N	en	{"title": "Every destination is a new dream!", "description": "Every destination is a new dream! A journey to the most beautiful and mysterious places of Uzbekistan awaits you, to return with unforgettable memories! Here, magnificent natural landscapes, historical monuments of ancient cities, and the richest cultural heritage await you. Each destination awakens its own unique story and emotions. Every destination is not only the beauty of nature but also magic emanating from the heart of our country, attracting every traveler. Discover Uzbekistan, draw inspiration from every corner of it, and when you return, unforgettable memories will remain in your heart!"}	2025-12-26 13:16:46	2026-02-14 16:40:38
784	229	\N	\N	\N	uz	{"title": "O'zbekiston"}	2026-02-14 16:19:36	2026-02-14 16:20:10
785	229	\N	\N	\N	ru	{"title": "Узбекистан"}	2026-02-14 16:19:36	2026-02-14 16:20:10
786	229	\N	\N	\N	en	{"title": "Uzbekistan"}	2026-02-14 16:19:36	2026-02-14 16:20:10
787	229	\N	\N	\N	\N	{"url": null, "date": "2026-02-14T13:30"}	2026-02-14 16:19:36	2026-02-14 16:20:10
780	228	52	Url	url	uz	{"title": "Yosh kinematografchilar"}	2026-02-14 16:18:04	2026-02-14 16:20:59
265	114	73	video	video-14	\N	{"url": "https://youtu.be/PJIL5e9FRus?si=uQCKwdfLGL0NMkMS"}	2025-12-26 14:35:56	2026-02-14 16:44:27
776	227	\N	\N	\N	\N	{"video": null, "content": null, "last_date": "2025-06-01T13:30"}	2026-02-13 09:12:41	2026-02-24 08:15:43
217	72	\N	\N	\N	ru	{"title": "Хорезмская область", "description": "Хорезмская область – исторический регион, бывший центром древнего государства Хорезмшахов, знаменитый богатым культурным наследием и великолепными архитектурными памятниками. Расположенный недалеко от областного центра города Ургенч, город Хива – музей под открытым небом, внесенный в список Всемирного наследия ЮНЕСКО. В Ичан-Кале сохранились уникальные образцы исламской архитектуры, такие как Кальта Минор, Таш-Ховли, мечеть Джума и мавзолей Пахлавана Махмуда. На территории Хорезма руины древних городов, таких как Топрак-Кала, Аяз-Кала и Куня-Ургенч, археологические слои и культурные памятники свидетельствуют о древнейших цивилизациях Центральной Азии. Природные пейзажи вдоль Амударьи и красота песчаных пустынь области очаровывают каждого путешественника."}	2025-12-26 13:52:31	2026-02-14 16:55:14
178	72	\N	\N	\N	\N	{"code": "UZ-XO", "path": "m259.77 287.025-1.159-2.628-.478-.69-.634-.56-.276-.744-.147-2.546-.423-.68-.239-.947-1.122-1.874-.082-1.122.147-1.084-.065-1.819-.137-.442-.23-2.619.211-1.488-.202-.368-.469-.193-.166-.662.019-.588-.267-.744-.68-.864-1.352-.717-.524-.101-.413-.239-.276-.514.174-.864-.34-.965-.432-.8-1.122-.671-1.728-1.819-1.039-.313-1.37-.928-1.866-2.215-.442-.275-1.167-.12-.607-.211-.451-.313-.376-.349-.258-.873-.349-.661-.782-.589-.432-.009-1.195.524-1.627-.129-.681-.202-1.48-.827-1.618-.266-.478.036-.432.285-.754 1.351.055 2.435-.414.736-.257 1.442-.396.837-.321.358-.451.303-.965.147-.138.129-1.536.175-.303-.092-1.214.046-.184-.12-.257.092-.644-.147-2.85-1.36-1.958-2.049-.313-.138-1.848.165-1.213-1.433-4.515-.202-.386.192-.956-.064-2.004.294-2.372-.11-1.545.285-3.613.009-4.376.276-.81-.046-2.39.395-.873-.055-.662-.221-2.979-1.783-2.676-2.389-5.617-3.832-3.099-1.774-1.066-.955-.524-1.14-.019-.634.147-.726.037-2.748.258-1.709.349-.744 1.968-1.838.229-.561v-1.075l-.248-.818-1.039-1.856-1.057-1.406-1.701-2.656-.349-1.379.478-1.139.515-2.068.22-.129.285.019.828.45.919-.018 1.821.661 1.02.487 1.177.965 1.094-.027.717.579.754.248.239-.368.671.009.239-.147.028-.404-.478-.643-1.039-.818-1.067-1.213-1.149-.524-1.517-.34-1.278-.8-.699-.781-.285-.661 2.455-4.807 1.747-.781 3.917-1.277 4.854 1.029.359.441.147.533.037 2.426.377 2.252 2.831 4.953.35.432.607.597.643.285 4.753 4.439 3.08 3.584 1.444 1.388 7.567 6.717 5.479 4.173 1.297.533 1.986.33.68.267.653.56 1.848 2.086.34.8.239 1.066 2.069 1.323h1.369l.662-.698.469-1.728 1.076-2.113.717-.809 1.278-.708.57-.184 2.795.01 8.229 1.893 3.236 1.709 2.832 1.755 7.355 8.097 1.379 2.545 4.193 6.81.248.202.598.175 2.344-1.122 2.979 3.061 5.434 6.138.625 1.057-.028 1.415-.726 3.493-4.22 4.714-5.774 6.993z", "offset": "0,-20"}	2025-12-26 13:33:21	2026-02-14 16:55:14
220	73	\N	\N	\N	ru	{"title": "Ташкент", "description": "Ташкент – столица Узбекистана и один из древнейших городов с тысячелетней историей. Здесь исторические памятники, такие как комплекс Хазрати Имам, базар Чорсу, площадь Амира Темура и медресе Кукельдаш, свидетельствуют о богатом культурном наследии Центральной Азии. Расположенный на территории древнего города Шаш, Ташкент сохранил образцы исламской архитектуры, руины древних крепостей и археологические находки. В части Старого города узкие улочки и древние здания, выделяющиеся своей вековой историей, до сих пор сохраняют свою магию. Вместе с современным метрополитеном и небоскребами Ташкент является прекрасным примером гармоничного слияния прошлого и настоящего."}	2025-12-26 13:53:35	2026-02-14 16:55:43
213	71	\N	\N	\N	uz	{"title": "Toshkent v.", "description": "Toshkent viloyati – O'zbekistonning eng rivojlangan va tarixiy jihatdan boy hududlaridan biri bo'lib, poytaxtni o'rab turgan go'zal tabiat va qadimiy yodgorliklar bilan ajralib turadi. Viloyat markazi Nurafshon shahridan boshqa, Chirchiq, Olmaliq, Angren kabi yirik shaharlari sanoat va madaniy markazlar hisoblanadi. Toshkent viloyatida Zangiota, Yunus Ota, Shoyhontohur kabi muqaddas ziyoratgohlar, qadimiy masjid va maqbaralar islom madaniyatining noyob namunalari sifatida saqlanib qolgan. Chimyon toғ kurortlari, Charvak suv ombori va Ugom-Chatqol milliy bog'i kabi tabiiy go'zalliklar har yili minglab sayyohlarni o'ziga jalb qiladi. Viloyatning tog'li hududlarida qadimiy qishloqlar, an'anaviy hunarmandchilik va boy tarixiy meros bugungi kunda ham jonli holda davom etmoqda."}	2025-12-26 13:51:53	2026-02-14 17:03:23
167	61	\N	\N	\N	\N	{"code": "UZ-AN", "path": "m689.854 294.45-.101-3.317-.285-.772-3.687-1.176-2.068-.414-.221.156h-.303l-8.505-1.443-2.059-3.179-.57-.598-2.777-1.433-3.825-.552-.183 1.333-2.786-4.117 1.747-1.112-2.023-2.454 1.866-1.746 1.094-.735 7.898-2.012 3.383.027.525.239.671.515 3.061.68 1.343.138 4.486-.405.488-.248.367-.413 1.159-5.395.22.138.616-.009 2.621-1.241.699-.165 1.121-.846 1.039-1.139.635-.065.137.166 1.214.321.892.625.818.046.726.368.791-.083.717.156.607.295.239 1.075-.092.597-.754 1.397.009.202.166.202.138-.018.423-.662.211-.046.221-.027.432.22.386.359 1.214 2.077.533.634.184 1.838.708.505 1.103.322 1.223.597 1.443.533.506-.184 1.673.267.865-.368.846-.174.625.193 2.032-.515.662.018.754.414 1.397 1.534.349.965.157.138.606.147.469-.036.598-.23.175-.276.588-.303.368-.441.533-.019.322-.193-.138-.496-.533-.367-.322-.451.395-1.305.212-.211.395.009.929 1.342.827.184 1.039.698.874-.478 1.379.064.395.35.211.891-.395 1.599-.395.561-.414.285-2.648 1.112-1.526.22-.579.8-1.067.735-1.287.717-.745.156-.046.211-.8.184-1.232.68-.919.882-1.416.46-1.039-.138-.726.101-.285.331-.046.294.129.404.349.423.028.312-.681.561-.092.386.166 2.518-.065.983-.597.193-.478-.275-.883-.901-1.379-.312-.294.34-.046.698-.8.579-.129.22-.193 1.287-.533.983-.616.147-.386-.036-1.278-1.03-1.352-.064-.634-.349-.837-.8-.469-.165-.625.266-.193-.036-1.26-1.535-.505-.919-1.278-1.075-.368-.175-.901.395-1.011.01-.368.496.138.257 1.03.349.294.285.423.947.965.294.377.514-.037.506-.322.367-.947.092-.248.175-.156.469.129.413.993-.101.239.34.211 1.351.451.487.22.689-1.048 2.454.258.763-.065.588-.156.147-.276.055-1.361-.349-.413-.248-1.425-1.471-.598-.422-.267-.092-.735.275-.294-.193-.46-.652-.267-.193-.827.009-.248-.101-.166-.368.303-1.038-.055-.23-.413-.248z", "offset": "5,-20"}	2025-12-26 13:25:28	2026-02-14 20:34:52
1482	469	468	Rahbar	rahbar-5	en	{"title": "Hagit Sofieva-Levieva", "description": null}	2026-02-20 05:31:51	2026-02-24 09:28:27
1483	469	468	Rahbar	rahbar-5	\N	{"email": "info@leviev.com", "phone": null}	2026-02-20 05:31:51	2026-02-24 09:28:27
1685	535	\N	\N	\N	ru	{"title": null, "value": null, "placeholder": null}	2026-02-25 06:00:51	2026-02-25 06:27:28
214	71	\N	\N	\N	ru	{"title": "Ташкентская область", "description": "Ташкентская область – один из наиболее развитых и исторически богатых регионов Узбекистана, выделяющийся прекрасной природой и древними памятниками, окружающими столицу. Помимо областного центра города Нурафшон, крупные города области, такие как Чирчик, Алмалык, Ангрен, являются промышленными и культурными центрами. В Ташкентской области сохранились священные места паломничества, такие как Зангиата, Юнус Ата, Шейхантаур, а также древние мечети и мавзолеи как уникальные образцы исламской культуры. Природные красоты, такие как горнолыжные курорты Чимган, Чарвакское водохранилище и национальный парк Угам-Чаткал, ежегодно привлекают тысячи туристов. В горных районах области древние поселения, традиционные ремесла и богатое историческое наследие продолжают жить и сегодня."}	2025-12-26 13:51:53	2026-02-14 17:03:23
215	71	\N	\N	\N	en	{"title": "Tashkent Region", "description": "Tashkent Region – one of the most developed and historically rich areas of Uzbekistan, distinguished by beautiful nature and ancient monuments surrounding the capital. Besides the regional center of Nurafshon, major cities of the region such as Chirchik, Almalyk, and Angren serve as industrial and cultural centers. In Tashkent Region, sacred pilgrimage sites such as Zangiota, Yunus Ota, and Shoyhontohur, as well as ancient mosques and mausoleums, have been preserved as unique examples of Islamic culture. Natural beauties such as the Chimgan mountain resorts, Charvak Reservoir, and Ugam-Chatkal National Park attract thousands of tourists annually. In the mountainous areas of the region, ancient villages, traditional crafts, and rich historical heritage continue to thrive today."}	2025-12-26 13:51:53	2026-02-14 17:03:23
211	70	\N	\N	\N	ru	{"title": "Сурхандарьинская область", "description": "Сурхандарьинская область – самый южный регион Узбекистана, выделяющийся древней историей, богатым культурным наследием и уникальными природными красотами. В древнейшем городе области и его центре Термезе и его окрестностях сохранились руины городов и крепостей различных народов, таких как зороастрийцы, несториане, буддисты, архитектурные и археологические памятники, а также памятники исламской архитектуры. Недалеко от Термеза были найдены шахматные фигуры, сделанные из слоновой кости. Древние буддийские комплексы, такие как Фаяз-тепа, Кара-тепа, Дальверзин-тепа, и священные места паломничества, такие как мавзолеи Имама ат-Термези и Хакима ат-Термези, свидетельствуют о богатой истории области. Сурхандарья очаровывает каждого посетителя хлопковыми полями вдоль Амударьи, зелеными долинами и великолепными пейзажами Байсунских гор."}	2025-12-26 13:51:09	2026-02-14 19:24:06
212	70	\N	\N	\N	en	{"title": "Surkhandarya", "description": "Surkhandarya Region – the southernmost region of Uzbekistan, distinguished by its ancient history, rich cultural heritage, and unique natural beauty. In the region's oldest city and center, Termez, and its surroundings, ruins of cities and fortresses of various peoples such as Zoroastrians, Nestorians, and Buddhists, architectural and archaeological monuments, as well as Islamic architectural landmarks have been preserved. Not far from Termez, chess pieces made from ivory were discovered. Ancient Buddhist complexes such as Fayaz Tepa, Karatepa, Dalvarzintepa, and sacred pilgrimage sites such as the mausoleums of Imam al-Termizi and Hakim al-Termizi testify to the region's rich history. Surkhandarya captivates every visitor with cotton fields along the Amu Darya, green valleys, and the magnificent landscapes of the Boysun Mountains."}	2025-12-26 13:51:09	2026-02-14 19:24:06
207	69	\N	\N	\N	uz	{"title": "Sirdaryo", "description": "Sirdaryo viloyati – O'zbekistonning markaziy qismida joylashgan kichik, ammo muhim viloyat bo'lib, boy qishloq xo'jaligi va tarixiy ahamiyati bilan ajralib turadi. Viloyat markazi Guliston shahri zamonaviy rivojlanayotgan shahar sifatida tanilgan. Sirdaryo daryosi bo'ylab cho'zilgan bu viloyat paxta va bug'doy yetishtirish bilan mashhur bo'lib, O'zbekistonning don ombori hisoblanadi. Viloyat hududida qadimiy Ipak yo'li yo'nalishi bo'ylab joylashgan tarixiy qishloqlar, karvonsaroylar va madaniy yodgorliklar saqlanib qolgan. Sirdaryo viloyatining keng dalalari, yashil bog'lari va an'anaviy dehqonchilik madaniyati bugungi kunda ham avloddan-avlodga o'tib kelmoqda. Viloyatning tinch va osoyishta muhiti, samimiy odamlari har bir mehmonni qalbidan qabul qiladi."}	2025-12-26 13:49:52	2026-02-14 19:30:16
788	230	69	video	video-10	uz	{"title": null}	2026-02-14 19:38:59	2026-02-14 19:38:59
789	230	69	video	video-10	ru	{"title": null}	2026-02-14 19:38:59	2026-02-14 19:38:59
790	230	69	video	video-10	en	{"title": null}	2026-02-14 19:38:59	2026-02-14 19:38:59
791	230	69	video	video-10	\N	{"url": "https://youtu.be/6Mr7cM4us_U?si=hE1pm8A94rOssVf2"}	2026-02-14 19:38:59	2026-02-14 19:38:59
204	68	\N	\N	\N	uz	{"title": "Samarqand", "description": "Samarqand viloyati – O'zbekistonning eng qadimiy va mashhur hududi bo'lib, jahon madaniyati va tarixining markazlaridan biri hisoblanadi. Viloyat markazi Samarqand shahri – UNESCO Jahon merosi ro'yxatiga kiritilgan \\"Sharq gavhari\\" deb ataladi. Bu yerdagi Registon maydoni, Gur Amir maqbarasi, Shohizinda majmuasi, Bibi Xonim masjidi va Ulug'bek rasadxonasi kabi noyob meʼmorchilik yodgorliklari butun dunyoga mashhur. Amir Temur va Temuriylar davridagi ajoyib madaniy meros, ko'k gumbazlar va naqshli devorlar Samarqandni haqiqiy ochiq osmon ostidagi muzeyga aylantirgan. Afrosiyob qadimiy shahri xarobalari, arxeologik qatlamlar va tarixiy yodgorliklar ming yillik tarixdan darak beradi. Samarqandning Ipak yo'li bo'yidagi strategik joylashuvi uni O'rta Osiyo savdo va madaniyat markaziga aylantirgan. Viloyatning boy an'analari, milliy hunarmandchilik va mehmondo'stligi har bir sayyohni lol qoldiradi."}	2025-12-26 13:49:13	2026-02-14 19:43:37
898	260	\N	\N	\N	\N	{"code": "kg"}	2026-02-18 07:16:19	2026-02-18 07:17:18
773	227	\N	\N	\N	uz	{"title": "ALISHER NAVOIY", "description": "ALISHER NAVOIY", "description1": null}	2026-02-13 09:12:41	2026-02-24 08:15:43
1687	535	\N	\N	\N	\N	{"key": "phone", "type": "tel", "column": "4", "required": "1"}	2026-02-25 06:00:51	2026-02-25 06:27:28
205	68	\N	\N	\N	ru	{"title": "Самаркандская область", "description": "Самаркандская область – древнейший и самый известный регион Узбекистана, являющийся одним из центров мировой культуры и истории. Областной центр город Самарканд – внесен в список Всемирного наследия ЮНЕСКО и называется \\"Жемчужиной Востока\\". Уникальные архитектурные памятники, такие как площадь Регистан, мавзолей Гур-Эмир, комплекс Шахи-Зинда, мечеть Биби-Ханым и обсерватория Улугбека, известны во всем мире. Великолепное культурное наследие эпохи Амира Темура и Темуридов, голубые купола и узорчатые стены превратили Самарканд в настоящий музей под открытым небом. Руины древнего города Афросиаб, археологические слои и исторические памятники свидетельствуют о тысячелетней истории. Стратегическое расположение Самарканда на Шелковом пути сделало его торговым и культурным центром Центральной Азии. Богатые традиции области, национальные ремесла и гостеприимство очаровывают каждого туриста."}	2025-12-26 13:49:13	2026-02-14 19:43:37
206	68	\N	\N	\N	en	{"title": "Samarkand", "description": "Samarkand Region – the most ancient and famous region of Uzbekistan, one of the centers of world culture and history. The regional center, Samarkand city, is inscribed on the UNESCO World Heritage List and is called the \\"Pearl of the East.\\" Unique architectural monuments such as Registan Square, Gur-e-Amir Mausoleum, Shah-i-Zinda complex, Bibi-Khanym Mosque, and Ulugh Beg Observatory are famous throughout the world. The magnificent cultural heritage of the era of Amir Temur and the Timurids, blue domes and patterned walls have turned Samarkand into a true open-air museum. The ruins of the ancient city of Afrasiab, archaeological layers, and historical monuments testify to a thousand-year history. Samarkand's strategic location on the Silk Road made it a trade and cultural center of Central Asia. The region's rich traditions, national crafts, and hospitality captivate every tourist."}	2025-12-26 13:49:13	2026-02-14 19:43:37
174	68	\N	\N	\N	\N	{"code": "UZ-SA", "path": "m489.969 359.172-.101.276-1.471-.285-.892.193-3.062 1.057-.211.267v.174l-.92.211-1.517-.294-3.53-1.093-2.354-1.002-4.1-1.167-.809.046-.396.441.065 1.636-.102.322-.386.441-.754.193-3.567.22-1.738-.138-.855-.487-.303-.441-.055-.533.423-1.562.101-1.158-.451-1.213-.579-.616-7.879-1.406-1.094.055-.745.258-.763.873-1.011 1.635-.754.883-3.347 1.433-.276.009-.634-.303-1.508-1.057-1.517-1.323-1.076-.689-.579-.147-6.942 1.718-3.006 1.535-2.032 1.268-1.407.037-2.831-.717-.662-.23-.203-.193-.082-1.369-2.547-4.273-3.034-3.501-3.963-.809-.036.303-.175.248-1.315.984-1.204.505-1.37.165-16.136-.487-.634-.147-1.949-3.492-.745-1.663-.156-.745.036-.579 1.076-2.15.469-1.342.156-.891-1.241-4.797-.864-1.333-.892-.744-1.361-1.406-.303-.708.074-.34.459-.321 7.953-2.684.919.451 2.621.808.542-.009.478-.276.653-1.185 1.683-5.091.386-5.33-.046-.892.147-.643.322-.524.478-.257.928.156 5.039 1.902.919 1.425.423.956 1.922 1.047 4.946 2.114 1.122.184 8.192-1.774 1.498-.698 3.209-3.024.395-.57.129-1.029-.166-.413-.753-.065-1.315.846-.736-.092-.184-.901 2.115-5.578.791-1.231.809-5.625.156-2.086-.34-.661-.497-.184-.229-.322.542-4.512 1.977-4.301.836-.992 1.021-.175 1.094.083.947 1.424.956.726 1.683.23 1.268-.101 2.161-1.186 1.94-1.764.533.248.892 1.029 1.71 2.445 1.159 3.189 7.162.845 4.238.092.883 2.003.009 1.011-.763 1.682-.129.708.092 3.611.772 3.768 1.711 1.526 1.324 2.582-.065.744-.414 1.232-.22.147-1.14.266-.092.322.322 3.409 5.36 3.612 1.949.735 4.422.368 10.913 2.325.194.22.983 5.477.074.938-1.195.138-1.416.349-1.986.946-.635.497-.698.836-2.961 4.815-.092.34.019 3.823.193.873.597.882.947.965 4.165 3.511 2.051 4.292.763 2.113.864 1.792.193.745z", "offset": "5,-10"}	2025-12-26 13:31:14	2026-02-14 19:43:37
201	67	\N	\N	\N	uz	{"title": "Qashqadaryo", "description": "Qashqadaryo viloyati – O'zbekistonning janubiy qismida joylashgan tarixiy va madaniy jihatdan boy hudud bo'lib, qadimiy shaharlar va ajoyib tabiiy manzaralar bilan mashhur. Viloyat markazi Qarshi shahri – qadimiy Nasaf nomi bilan tanilgan, ming yillik tarixga ega shahar hisoblanadi. Bu yerdagi Qarshinig qadimiy qal'asi, Kok Gumbaz masjidi, Abdulazizxon madrasasi va boshqa tarixiy yodgorliklar islom meʼmorchiligining noyob namunalaridir. Qashqadaryo Amir Temurning tug'ilgan joyi Shahrisabz shahri bilan ham mashhur bo'lib, bu yerdagi Oqsaroy, Dorut Tilovat va Dorussaodat majmualari UNESCO Jahon merosi ro'yxatiga kiritilgan. Kitob va Guzor tumanlaridagi qadimiy madrasalar, ziyoratgohlar va arxeologik yodgorliklar viloyatning boy tarixidan darak beradi. Viloyatning tog'li hududlari, yashil vodiylar va an'anaviy qishloqlardagi milliy hunarmandchilik bugungi kunda ham jonli holda davom etmoqda."}	2025-12-26 13:48:32	2026-02-14 19:49:45
202	67	\N	\N	\N	ru	{"title": "Кашкадарьинская область", "description": "Кашкадарьинская область – исторически и культурно богатый регион, расположенный в южной части Узбекистана, известный древними городами и великолепными природными пейзажами. Областной центр город Карши – известный под древним названием Насаф, город с тысячелетней историей. Древняя крепость Карши, мечеть Кок-Гумбаз, медресе Абдулазиз-хана и другие исторические памятники являются уникальными образцами исламской архитектуры. Кашкадарья также знаменита городом Шахрисабз – местом рождения Амира Темура, где комплексы Ак-Сарай, Дорут Тиловат и Дорус Саодат внесены в список Всемирного наследия ЮНЕСКО. Древние медресе, места паломничества и археологические памятники в районах Китаб и Гузар свидетельствуют о богатой истории области. Горные районы области, зеленые долины и национальные ремесла в традиционных селах продолжают жить и сегодня."}	2025-12-26 13:48:32	2026-02-14 19:49:45
792	231	\N	\N	\N	uz	{"title": "Fransiya"}	2026-02-18 04:50:14	2026-02-18 04:53:52
793	231	\N	\N	\N	ru	{"title": "Fransiya"}	2026-02-18 04:50:14	2026-02-18 04:53:52
794	231	\N	\N	\N	en	{"title": "Fransiya"}	2026-02-18 04:50:14	2026-02-18 04:53:52
795	231	\N	\N	\N	\N	{"code": "FR"}	2026-02-18 04:50:14	2026-02-18 04:53:52
1481	469	468	Rahbar	rahbar-5	ru	{"title": "Хагит Софиeва-Левиева", "description": null}	2026-02-20 05:31:51	2026-02-24 09:28:27
173	67	\N	\N	\N	\N	{"code": "UZ-QA", "path": "m387.311 352.308 1.075-.744.736-.35 1.278-.34 2.39-.367.488-.193.367-.395.635.147 16.135.487 1.37-.166 1.205-.505 1.314-.983.175-.249.037-.303 3.963.809 3.034 3.501 2.546 4.273.083 1.37.202.193.662.229 2.832.717 1.407-.037 2.032-1.268 3.006-1.534 6.942-1.719.579.147 1.076.689 1.517 1.324 1.507 1.057.635.303.276-.009 3.346-1.434.754-.882 1.011-1.636.764-.873.744-.257 1.094-.055 7.88 1.406.579.615.45 1.213-.101 1.158-.423 1.562.056.533.303.442.855.487 1.738.138 3.567-.221.754-.193.386-.441.101-.322-.064-1.636.395-.441.809-.046 4.101 1.167 2.353 1.002 3.531 1.094 1.517.294.919-.212.35 1.452 1.278 2.215.671.689.882.487 1.619.34.57.377.781.267.736.018.947-.202.993.175.937.432.598 1.534.524.212 1.462.073.257.267-.009.523-.322.469-.193 2.298.405 1.157.119 1.884.359.515-.736.754-.901.533-3.668.211-.791.239-.469.23-.616.523-.413.772-.056.368.497 2.886.938 1.929.349.423.138.478.12 3.86-1.232 3.951-.497-.165-1.296-1.314-.92-.294-1.314-.065-1.049.304-.413.312-.543.588-.744 1.195-1.095 2.04-8.173 8.161-.662 3.078-.147 1.397-.34 1.287-.414.799-2.225 2.233-1.683 1.176-3.254 1.701-10.647 11.119-.395 1.149-.956 3.924.248.827-2.198-2.564-.965-.616-1.361-.56-2.933-.322-2.418.754-.524.055-1.158-.303-1.131-.984-2.565-1.507-1.683-1.902-1.186-2.141-.432-.276-1.747-.101-3.218-.947-.579-.367-.459-.892-1.076-.367-.8-.12-.699-.735-.432-.156-1.259.064-.764-.248-.827-.551-1.756-1.802-.828-.22-.983.009-.892.248-.671 1.287-.515-.065-.129.092-.147.589-.34.156h-.487l-4.303-.882-9.13-3.603-1.793-1.029-5.893-3.796-1.701-1.369-2.482-2.316-6.997-6.984-.533-.358-2.51-1.149-3.218-1.222-2.703-1.259-1.591-1.158-.561-.607-8.256-5.1-2.501-1.746-5.093-4.714-1.094-1.204 5.157-5.725 16.66-6.102.258-.561-.212-.469-.754-1.075-.763-.809-.653-1.102-.138-.791.322-.946 4.046-4.329.524-.101 3.08-2.04z", "offset": "5,0"}	2025-12-26 13:30:35	2026-02-14 19:49:45
198	66	\N	\N	\N	uz	{"title": "Navoiy", "description": "Navoiy viloyati – O'zbekistonning markazida joylashgan nisbatan yosh, ammo tez sur'atlar bilan rivojlanayotgan viloyat bo'lib, boy tabiiy boyliklari va qadimiy tarixiy yodgorliklari bilan ajralib turadi. Viloyat markazi Navoiy shahri zamonaviy sanoat va madaniyat markazi sifatida tanilgan. Qizilqum cho'li ichida joylashgan bu viloyat oltin, uran va boshqa qimmatbaho minerallar qazib olish bilan mashhur. Navoiy viloyatida Zarafshon shahri, Nurota tog'lari va Aydarkul ko'li kabi noyob tabiiy joylar sayyohlarni o'ziga jalb qiladi. Nurota tog'laridagi qadimiy petrogliflar, Sarmishsoy tosh rasmlari va arxeologik yodgorliklar ming yillik tarixdan darak beradi. Viloyatning Ipak yo'li bo'yidagi qadimiy karvonsaroylar, qal'alar va ziyoratgohlar O'rta Osiyoning boy madaniy merosini aks ettiradi. Cho'l hududlaridagi an'anaviy hayot tarzi, dehqonchilik va chorvadorlik bugungi kunda ham saqlanib qolgan."}	2025-12-26 13:47:33	2026-02-14 19:55:12
199	66	\N	\N	\N	ru	{"title": "Навоийская область", "description": "Навоийская область – относительно молодая, но быстро развивающаяся область, расположенная в центре Узбекистана, выделяющаяся богатыми природными ресурсами и древними историческими памятниками. Областной центр город Навои известен как современный промышленный и культурный центр. Эта область, расположенная в пустыне Кызылкум, славится добычей золота, урана и других драгоценных минералов. В Навоийской области уникальные природные места, такие как город Зарафшан, горы Нурата и озеро Айдаркуль, привлекают туристов. Древние петроглифы в горах Нурата, наскальные рисунки Сармишсая и археологические памятники свидетельствуют о тысячелетней истории. Древние караван-сараи, крепости и места паломничества вдоль Шелкового пути отражают богатое культурное наследие Центральной Азии. Традиционный образ жизни, земледелие и животноводство в пустынных районах сохранились и по сей день."}	2025-12-26 13:47:33	2026-02-14 19:55:12
238	89	\N	\N	\N	ru	{"title": "Наманганская область", "description": "Наманганская область – регион с богатой историей, расположенный в северной части Ферганской долины, известный развитой промышленностью, животноводством и сельским хозяйством. Областной центр город Наманган – один из крупнейших городов Узбекистана, выделяющийся традициями ремесел и культурным наследием. Исторические памятники, такие как медресе Мулла Кыргыз, мавзолей Ходжаамбар-бобо и медресе Ата Валихон-тура, являются прекрасными образцами исламской архитектуры. Наманганская область славится выращиванием хлопка, шелководством и производством фруктов и овощей, считаясь одной из сельскохозяйственных столиц Узбекистана. Горные районы области, районы Чуст и Чарток известны по всему Узбекистану традиционным шитьем тюбетеек, гончарством и другими национальными ремеслами. Гостеприимство наманганского народа, богатые культурные традиции и сладости очаровывают каждого гостя."}	2025-12-26 14:25:11	2026-02-14 19:59:59
239	89	\N	\N	\N	en	{"title": "Namangan", "description": "Namangan Region – a region with rich history located in the northern part of the Fergana Valley, famous for its developed industry, livestock farming, and agriculture. The regional center, Namangan city, is one of the largest cities of Uzbekistan, distinguished by its craft traditions and cultural heritage. Historical monuments such as Mulla Kyrgyz Madrasah, Khodjaambar Bobo Mausoleum, and Ota Valikhon Tura Madrasah are beautiful examples of Islamic architecture. Namangan Region is famous for cotton growing, sericulture, and fruit and vegetable production, being considered one of the agricultural capitals of Uzbekistan. The mountainous areas of the region, Chust and Chartak districts, are known throughout Uzbekistan for traditional skullcap embroidery, pottery, and other national crafts. The hospitality of Namangan people, rich cultural traditions, and sweets captivate every guest."}	2025-12-26 14:25:11	2026-02-14 19:59:59
891	259	\N	\N	\N	uz	{"title": "Qozog‘iston"}	2026-02-18 07:12:03	2026-02-18 07:16:35
892	259	\N	\N	\N	ru	{"title": "Казахстан"}	2026-02-18 07:12:03	2026-02-18 07:16:35
1353	426	\N	\N	\N	uz	{"title": "Rossiya"}	2026-02-18 09:57:07	2026-02-18 09:57:07
1690	536	\N	\N	\N	en	{"title": null, "value": null, "placeholder": null}	2026-02-25 06:01:38	2026-02-25 06:27:32
647	190	\N	\N	\N	uz	{"title": "O'zbek tilini onlayn o'rganish platformasi", "description": "Siz havola orqali o’tishingiz mumkin"}	2026-01-19 16:38:51	2026-02-20 05:55:34
648	190	\N	\N	\N	ru	{"title": "Платформа для онлайн-изучения узбекского языка", "description": "Вы можете перейти по ссылке"}	2026-01-19 16:38:51	2026-02-20 05:55:34
1514	480	478	Tashkilot haqida	nomi-7	ru	{"title": "Друзья Узбекистана", "boss_at": "2023", "date_at": "2023", "description": "<p>Основная цель:</p><ul><li><span style=\\"font-size: 1rem; letter-spacing: 0.01rem;\\">Продвижение Узбекистана на международной арене и популяризация его культуры, истории и традиций.</span></li><li>Укрепление дружбы и сотрудничества между Узбекистаном и другими странами.</li></ul><p>Основные задачи:</p><ul><li><span style=\\"font-size: 1rem; letter-spacing: 0.01rem;\\">Организация культурных мероприятий, выставок, встреч и конференций</span></li><li><span style=\\"font-size: 1rem; letter-spacing: 0.01rem;\\">Популяризация культуры, искусства и туризма Узбекистана.</span></li><li>Развитие и поддержка связей с соотечественниками за рубежом.</li><li><span style=\\"font-size: 1rem; letter-spacing: 0.01rem;\\">Реализация совместных проектов в сфере образования, науки и культуры.</span></li><li><span style=\\"font-size: 1rem; letter-spacing: 0.01rem;\\">Развитие сотрудничества с организациями и учреждениями в различных странах.</span></li></ul>"}	2026-02-20 11:39:10	2026-02-20 11:44:11
1494	473	468	Tashkilot haqida	nomi-7	ru	{"title": "Конгресс бухарских евреев в США и Канаде", "description": "<p>Цели:</p><ul><li>Сохранение и развитие культуры, традиций и истории бухарских евреев.</li><li>Объединение соотечественников, проживающих в США и Канаде, и укрепление сотрудничества между ними.</li><li>Воспитание молодого поколения в духе национальных ценностей и вовлечение его в жизнь общины.</li><li>Развитие культурных связей с Узбекистаном и другими странами.</li></ul><p>Задачи:</p><ul><li>Организация культурных, просветительских и благотворительных мероприятий.</li><li>Оказание социальной и правовой помощи членам общины.</li><li>Поддержка образовательных инициатив, молодежных программ и общественных проектов.</li><li>Сотрудничество с организациями бухарских евреев в различных странах.</li></ul>"}	2026-02-20 06:51:55	2026-02-23 06:01:56
1605	511	510	Tashkilot haqida	nomi-7	uz	{"title": "San-Fransisko ko‘rfazi hududidagi O‘zbek Hamjamiyati Markazi (UCCSFBA)", "description": "<p>Maqsadlari</p><ul><li>San-Fransisko va atrofidagi hududda yashovchi o‘zbekistonliklar va ularning oilalarini birlashtirish.</li><li>O‘zbekiston madaniyati, an’analari va qadriyatlarini saqlash va keng targ‘ib qilish.</li><li>Yosh avlodni milliy qadriyatlar ruhida tarbiyalash va jamiyat hayotiga jalb qilish.</li></ul><p>Vazifalari</p><ul><li>Madaniy tadbirlar, bayramlar va festivalar tashkil etish (Navro‘z, Mustaqillik kuni va boshqalar).</li><li>O‘zbek tili, tarix va madaniyatini o‘rgatishga yo‘naltirilgan ta’limiy dasturlarni qo‘llab‑quvvatlash.</li><li>Yangi kelgan o‘zbekistonliklarga hayotga moslashish, ijtimoiy tarmoqlar va jamiyat bilan integratsiyada yordam berish.</li><li>Jamoa a’zolari o‘rtasida maslahatlashuv va hamkorlikni kuchaytirish hamda boshqa madaniy tashkilotlar bilan aloqalarni rivojlantirish.</li></ul>"}	2026-02-24 05:16:52	2026-02-24 05:16:52
1606	511	510	Tashkilot haqida	nomi-7	ru	{"title": "Узбекский общественный центр района залива Сан-Франциско (UCCSFBA)", "description": "<p>Цели</p><ul><li>Объединение узбекистанцев и их семей, проживающих в Сан-Франциско и окрестностях.</li><li>Сохранение и продвижение культуры, традиций и ценностей Узбекистана.</li><li>Воспитание молодежи в духе национальных ценностей и вовлечение их в жизнь сообщества.</li></ul><p>Задачи</p><ul><li>Организация культурных мероприятий, праздников и фестивалей (Навруз, День независимости и др.).</li><li>Поддержка образовательных программ, направленных на изучение узбекского языка, истории и культуры.</li><li>Помощь новым приезжим из Узбекистана в адаптации к жизни, социальным сетям и интеграции в общество.</li><li>Укрепление консультаций и сотрудничества среди членов сообщества, а также развитие связей с другими культурными организациями.</li></ul>"}	2026-02-24 05:16:52	2026-02-24 05:16:52
1607	511	510	Tashkilot haqida	nomi-7	en	{"title": "Uzbek Community Center of the San Francisco Bay Area (UCCSFBA)", "description": "<p>Goals</p><ul><li>To unite Uzbeks and their families living in San Francisco and surrounding areas.</li><li>To preserve and promote Uzbekistan’s culture, traditions, and values.</li><li>To educate the younger generation in national values and involve them in community life.</li></ul><p>Tasks</p><ul><li>Organizing cultural events, celebrations, and festivals (Navruz, Independence Day, etc.).</li><li>Supporting educational programs focused on teaching the Uzbek language, history, and culture.</li><li>Assisting newly arrived Uzbeks in adapting to life, social networks, and integration into the community.</li><li>Strengthening advisory support and collaboration among members and developing connections with other cultural organizations.</li></ul>"}	2026-02-24 05:16:52	2026-02-24 05:16:52
1571	499	497	Rahbar	rahbar-5	\N	{"email": "admin@americanuzbekistan.org", "phone": null}	2026-02-23 09:27:22	2026-02-24 09:27:54
1516	481	236	tashkilotlar	tashkilot	\N	{"title": "Uzbek Cultural Center in Italy"}	2026-02-20 12:23:34	2026-02-20 12:53:46
1540	473	\N	\N	\N	\N	{"boss_at": "2025", "date_at": "2018"}	2026-02-23 06:01:56	2026-02-23 06:01:56
1485	471	470	Rahbar	rahbar-5	uz	{"title": "Mirjalol Mengboev", "description": "Director"}	2026-02-20 05:58:00	2026-02-20 07:12:47
1486	471	470	Rahbar	rahbar-5	ru	{"title": "Ассоциация дружбы Нагоя и Узбекистана", "description": "Укрепление дружбы и сотрудничества между Японией, в частности городом Нагоя, и Узбекистаном.  Развитие взаимопонимания и уважения между двумя народами через культурные, образовательные и социальные мероприятия.  Продвижение узбекской культуры, традиций и национальной кухни в Японии.  Организация программ культурного обмена между гражданами Японии и Узбекистана.  Поддержка узбекской диаспоры в Японии и оказание информационно-консультационной помощи."}	2026-02-20 05:58:00	2026-02-20 07:12:47
1487	471	470	Rahbar	rahbar-5	en	{"title": "Friendship Association of Nagoya and Uzbekistan", "description": "To strengthen friendship and cooperation between Japan, particularly the city of Nagoya, and Uzbekistan.  To promote mutual understanding and respect between the two nations through cultural, educational, and social events.  To promote Uzbek culture, traditions, and national cuisine in Japan.  To organize cultural exchange programs between Japanese and Uzbek citizens.  To support the Uzbek diaspora in Japan and provide informational and advisory assistance."}	2026-02-20 05:58:00	2026-02-20 07:12:47
1488	471	470	Rahbar	rahbar-5	\N	{"email": "asd@asdlrs.ru", "phone": null}	2026-02-20 05:58:00	2026-02-20 07:12:47
1572	500	19	tashkilotlar	tashkilot	\N	{"title": "Atlanta uzbek community"}	2026-02-23 09:31:05	2026-02-23 09:31:42
1608	511	510	Tashkilot haqida	nomi-7	\N	{"boss_at": "2019", "date_at": "2019"}	2026-02-24 05:16:52	2026-02-24 05:16:52
1570	499	497	Rahbar	rahbar-5	en	{"title": "Kamilla Zakirova", "description": "Kamilla Zakirova is the Co-Founder and Chief Executive Officer of the American Uzbekistan Association (AUA). Specializing in climate change, food security, and agricultural sustainability, she has worked with leading international development organizations, including the World Wildlife Fund, United Nations Development Programme, and the World Bank. Kamilla holds a Master’s degree from Georgetown University’s School of Foreign Service and a Bachelor’s degree from Tashkent University of Information Technologies.  As a mother of three, Kamilla is deeply committed to investing in the children and youth of the Uzbek diaspora, as well as in communities across Uzbekistan."}	2026-02-23 09:27:22	2026-02-24 09:27:54
979	289	288	Nomi	nomi-5	uz	{"title": "Pittsburgdagi uzbeklar jamiyati", "description": "Tashkilotning asosiy maqsad va vazifalari:  АQShdagi vatandoshlarni birlashtirish, ular oʼrtasida hamjixatlikni mustahkamlash, oʼzbek urf-odatlari, qadriyatlari va ona-tilini asrab qolish"}	2026-02-18 09:46:15	2026-02-18 09:46:15
980	289	288	Nomi	nomi-5	ru	{"title": null, "description": null}	2026-02-18 09:46:15	2026-02-18 09:46:15
981	289	288	Nomi	nomi-5	en	{"title": null, "description": null}	2026-02-18 09:46:15	2026-02-18 09:46:15
982	289	288	Nomi	nomi-5	\N	{"boss_at": "12/12/2022", "date_at": "12/20/2018"}	2026-02-18 09:46:15	2026-02-18 09:46:15
983	290	288	Rahbar	rahbar-5	uz	{"title": "Sadikov Baxodir Talibjonovich", "description": "Sadikov Baxodir Talibjonovich"}	2026-02-18 09:46:15	2026-02-18 09:46:15
984	290	288	Rahbar	rahbar-5	ru	{"title": null, "description": null}	2026-02-18 09:46:15	2026-02-18 09:46:15
985	290	288	Rahbar	rahbar-5	en	{"title": null, "description": null}	2026-02-18 09:46:15	2026-02-18 09:46:15
986	290	288	Rahbar	rahbar-5	\N	{"email": "sattarov@vatandoshlarfondi.uz", "phone": "+998(55) 502-22-55"}	2026-02-18 09:46:15	2026-02-18 09:46:15
1684	535	\N	\N	\N	uz	{"title": "Telefon raqamingiz", "value": null, "placeholder": "Telefon raqamingiz"}	2026-02-25 06:00:51	2026-02-25 06:27:28
1686	535	\N	\N	\N	en	{"title": null, "value": null, "placeholder": null}	2026-02-25 06:00:51	2026-02-25 06:27:28
1691	536	\N	\N	\N	\N	{"key": "country", "type": "country", "column": "6", "required": "1"}	2026-02-25 06:01:38	2026-02-25 06:27:32
1756	553	148	Form	form	uz	{"title": "Fayl", "value": ".mp4, .jpg,.jpeg,.png,.pdf,.doc,.docx", "placeholder": "Video, rasm, hujjat, PDF, docx, excel va boshqalar"}	2026-02-25 08:28:22	2026-02-25 08:28:22
1757	553	148	Form	form	ru	{"title": null, "value": null, "placeholder": null}	2026-02-25 08:28:22	2026-02-25 08:28:22
1758	553	148	Form	form	en	{"title": null, "value": null, "placeholder": null}	2026-02-25 08:28:22	2026-02-25 08:28:22
1759	553	148	Form	form	\N	{"key": "image", "type": "file", "column": "12", "required": "1"}	2026-02-25 08:28:22	2026-02-25 08:28:22
1517	482	481	Tashkilot haqida	nomi-7	uz	{"title": "Italiyadagi O‘zbek Madaniy Markazi", "boss_at": "09/2023", "date_at": "09/2023", "description": "<p>Maqsadlar:</p><ul><li><span style=\\"font-size: 1rem; letter-spacing: 0.01rem;\\">O‘zbekiston madaniyatini Italiyada targ‘ib qilish.</span></li><li>Vatandoshlar bilan aloqalarni mustahkamlash.</li><li>Madaniy va ilmiy almashinuvni rivojlantirish.</li><li>O‘zbekiston turizmini oshirish.</li></ul><p>Vazifalar:</p><ul><li><span style=\\"font-size: 1rem; letter-spacing: 0.01rem;\\">Madaniy tadbirlar va ko‘rgazmalar tashkil etish.</span></li><li><span style=\\"font-size: 1rem; letter-spacing: 0.01rem;\\">O‘zbekiston tili va madaniyati bo‘yicha ta’limiy loyihalar.</span></li><li>Biznes va iqtisodiy hamkorlikni qo‘llab-quvvatlash.</li><li><p>Axborot va maslahat xizmatlari ko‘rsatish.</p></li></ul>"}	2026-02-20 12:50:51	2026-02-20 12:55:40
1518	482	481	Tashkilot haqida	nomi-7	ru	{"title": "Узбекский культурный центр в Италии", "boss_at": null, "date_at": null, "description": "<p>Цели:</p><ul><li>Продвижение культуры Узбекистана в Италии.</li><li>Укрепление связей с соотечественниками.</li><li>Развитие культурного и научного обмена.</li><li>Повышение туристической привлекательности Узбекистана.</li></ul><p>Задачи:</p><ul><li><span style=\\"font-size: 1rem; letter-spacing: 0.01rem;\\">Организация культурных мероприятий и выставок.</span></li><li>Образовательные проекты по узбекскому языку и культуре.</li><li>Поддержка бизнес- и экономического сотрудничества.</li><li>Предоставление информационных и консультационных услуг.</li></ul>"}	2026-02-20 12:50:51	2026-02-20 12:55:40
1519	482	481	Tashkilot haqida	nomi-7	en	{"title": "Uzbek Cultural Center in Italy", "boss_at": "09/2023", "date_at": "09/2023", "description": "<p>Goals:</p><ul><li>To promote Uzbekistan’s culture in Italy.</li><li>To strengthen relations with compatriots.</li><li>To develop cultural and academic exchanges.</li><li>To increase tourism in Uzbekistan.</li></ul><p>Tasks:</p><ul><li>Organizing cultural events and exhibitions.</li><li>Educational projects on the Uzbek language and culture.</li><li>Supporting business and economic cooperation.</li><li>Providing information and advisory services.</li></ul>"}	2026-02-20 12:50:51	2026-02-20 12:55:40
1541	490	232	Tashkilot haqida	nomi-7	uz	{"title": "Pittsburgdagi Uzbeklar Jamiyati", "description": "<p>Maqsadlari:</p><ul><li>AQSh, xususan Pittsburgh shahrida yashovchi o‘zbekistonliklarni birlashtirish.</li><li>Madaniy va milliy merosimizni saqlash va yosh avlodga yetkazish.</li></ul><p>Vazifalari:</p><ul><li>Madaniy tadbirlar, bayramlar va festivalarni tashkil etish.</li><li>A’zolar o‘rtasida ijtimoiy, ma’rifiy va maslahatlashuv faoliyatini yo‘lga qo‘yish.</li><li>Ta’lim, madaniyat va xayriya loyihalarini qo‘llab-quvvatlash.</li></ul>"}	2026-02-23 07:11:52	2026-02-23 07:31:24
1542	490	232	Tashkilot haqida	nomi-7	ru	{"title": "Ассоциация узбеков Питтсбурга", "description": "<p>Цели:</p><ul><li>Объединение узбекистанцев, проживающих в США, особенно в городе Питтсбург.</li><li>Сохранение нашего культурного и национального наследия и передача его молодому поколению.</li></ul><p>Задачи:</p><ul><li>Организация культурных мероприятий, праздников и фестивалей.</li><li>Проведение социально-просветительской и консультационной работы среди членов организации.</li><li>Поддержка образовательных, культурных и благотворительных проектов.</li></ul>"}	2026-02-23 07:11:52	2026-02-23 07:31:24
1543	490	232	Tashkilot haqida	nomi-7	en	{"title": "Uzbek Association of Pittsburgh", "description": "<p>Goals:</p><ul><li>To unite Uzbeks living in the United States, particularly in Pittsburgh.</li><li>To preserve our cultural and national heritage and pass it on to the younger generation.</li></ul><p>Tasks:</p><ul><li>Organizing cultural events, celebrations, and festivals.</li><li>Facilitating social, educational, and advisory activities among members.</li><li>Supporting educational, cultural, and charitable projects.</li></ul>"}	2026-02-23 07:11:52	2026-02-23 07:31:24
1544	490	232	Tashkilot haqida	nomi-7	\N	{"boss_at": "01/09/2019", "date_at": "01/09/2019"}	2026-02-23 07:11:52	2026-02-23 07:31:24
1573	501	500	Tashkilot haqida	nomi-7	uz	{"title": "Atlantadagi O‘zbek Jamiyati", "description": "<p>Maqsadlari:</p><ul><li>Atlanta va uning atrofidagi hududda yashovchi o‘zbekistonliklar va o‘zbek diasporasini birlashtirish hamda ularni qo‘llab‑quvvatlash.</li><li>O‘zbekiston madaniyati, an’analari, tili va urf‑odatlarini saqlash va targ‘ib qilish.</li><li>Jamoa a’zolari o‘rtasida ijtimoiy aloqalar va hamkorlikni mustahkamlash.</li></ul><p>Vazifalari:</p><ul><li>Madaniy va ijtimoiy tadbirlar, bayramlar, o‘zbek tili darslari va uchrashuvlarni tashkil etish — jumladan Navro‘z, O‘zbekiston Mustaqilligi kuni kabi tadbirlar.</li><li>Yangi kelgan o‘zbekistonliklarga turmushga moslashishda, ta’limda, til o‘rganishda va jamoat faoliyatida yordam berish.</li><li>Jamiyat ichida yoshlar, oilalar va kattalar uchun qo‘llab‑quvvatlash, maslahatlashuv va madaniy almashinuv dasturlarini yo‘lga qo‘yish.</li></ul>"}	2026-02-23 09:38:22	2026-02-23 09:38:22
1574	501	500	Tashkilot haqida	nomi-7	ru	{"title": "Узбекская община Атланты", "description": "<p>Цели:</p><ul><li>Объединение узбеков и узбекской диаспоры, проживающих в Атланте и его окрестностях, и оказание им поддержки.</li><li>Сохранение и популяризация культуры, традиций, языка и обычаев Узбекистана.</li><li>Укрепление социальных связей и сотрудничества между членами сообщества.</li></ul><p>Задачи:</p><ul><li>Организация культурных и социальных мероприятий, праздников, уроков узбекского языка и встреч — включая такие события, как Навруз и День независимости Узбекистана.</li><li>Помощь новым приезжим из Узбекистана в адаптации к жизни, обучении, изучении языка и участии в общественной деятельности.</li><li>Проведение программ поддержки, консультаций и культурного обмена для молодежи, семей и взрослых внутри сообщества.</li></ul>"}	2026-02-23 09:38:22	2026-02-23 09:38:22
1609	512	510	Rahbar	rahbar-5	uz	{"title": "Qudrat Rahimhodzhayev", "description": "San-Fransisko ko‘rfazi hududidagi O‘zbek Hamjamiyati Markazi rahbari (Prezident)"}	2026-02-24 05:21:10	2026-02-24 05:21:10
1645	523	19	tashkilotlar	tashkilot	\N	{"title": "Hamkor Uz Cincinnati Association"}	2026-02-24 10:50:32	2026-02-24 10:50:32
1484	470	248	tashkilot	tashkilot	\N	{"title": "Friendship Association of Nagoya and Uzbekistan"}	2026-02-20 05:51:40	2026-02-20 06:16:17
1520	483	481	Rahbar	rahbar-5	uz	{"title": "Kirgizova Komila Kamolovna", "description": null}	2026-02-20 12:53:16	2026-02-20 12:53:16
1521	483	481	Rahbar	rahbar-5	ru	{"title": "Киргизова Комила Камоловна", "description": null}	2026-02-20 12:53:16	2026-02-20 12:53:16
1522	483	481	Rahbar	rahbar-5	en	{"title": "Kirgizova Komila Kamolovna", "description": null}	2026-02-20 12:53:16	2026-02-20 12:53:16
1523	483	481	Rahbar	rahbar-5	\N	{"email": "https://www.linkedin.com/in/komila-kirgizova?utm_source=share_via&utm_content=profile&utm_medium=member_android", "phone": null}	2026-02-20 12:53:16	2026-02-20 12:53:16
1760	554	523	Rahbar	rahbar-5	uz	{"title": "Alimov Zafar Xojiakbarovich", "description": "Rahbar"}	2026-02-25 09:02:56	2026-02-25 09:02:56
1545	491	19	tashkilotlar	tashkilot	\N	{"title": "Turkistanian-American Association"}	2026-02-23 07:16:56	2026-02-23 07:33:33
1575	501	500	Tashkilot haqida	nomi-7	en	{"title": "Atlanta Uzbek Community", "description": "<p>Goals:</p><ul><li>To unite and support Uzbeks and the Uzbek diaspora living in Atlanta and its surrounding areas.</li><li>To preserve and promote Uzbekistan’s culture, traditions, language, and customs.</li><li>To strengthen social connections and cooperation among community members.</li></ul><p>Tasks:</p><ul><li>Organizing cultural and social events, celebrations, Uzbek language classes, and meetings — including events like Navruz and Uzbekistan Independence Day.</li><li>Assisting newly arrived Uzbeks with adapting to life, education, language learning, and community engagement.</li><li>Implementing support, advisory, and cultural exchange programs for youth, families, and adults within the community.</li></ul>"}	2026-02-23 09:38:22	2026-02-23 09:38:22
1576	501	500	Tashkilot haqida	nomi-7	\N	{"boss_at": "01/09/2017", "date_at": "01/09/2017"}	2026-02-23 09:38:22	2026-02-23 09:38:22
1610	512	510	Rahbar	rahbar-5	ru	{"title": "Кудрат Рахимходжаев", "description": "Президент Узбекского общественного центра района залива Сан-Франциско"}	2026-02-24 05:21:10	2026-02-24 05:21:10
1611	512	510	Rahbar	rahbar-5	en	{"title": "Qudrat Rahimhodzhayev", "description": "President of the Uzbek Community Center of the San Francisco Bay Area"}	2026-02-24 05:21:10	2026-02-24 05:21:10
1612	512	510	Rahbar	rahbar-5	\N	{"email": "info@uccsfba.org", "phone": null}	2026-02-24 05:21:10	2026-02-24 05:21:10
1646	524	523	Tashkilot haqida	nomi-7	uz	{"title": "Hamkor Uz Cincinnati Assotsiatsiyasi", "description": "<p>Maqsadlari</p><ul><li>Cincinnati va uning atrofida yashovchi o‘zbekistonliklarni birlashtirish.</li><li>O‘zbekiston madaniyati, an’analari va milliy qadriyatlarini saqlash va targ‘ib qilish.</li><li>Diaspora a’zolari o‘rtasida hamkorlik va o‘zaro yordamni rivojlantirish.</li></ul><p>Vazifalari</p><ul><li>Madaniy tadbirlar, uchrashuvlar va milliy bayramlarni tashkil etish.</li><li>Mahalliy jamiyat bilan madaniy almashinuvni rivojlantirish.</li><li>Vatandoshlarni qo‘llab-quvvatlash, maslahat va hamkorlik platformasini yaratish.</li><li>Jamoa loyihalarini amalga oshirish (masalan, diniy va madaniy markaz qurilishi tashabbuslari).</li></ul>"}	2026-02-24 10:55:14	2026-02-24 10:55:14
1647	524	523	Tashkilot haqida	nomi-7	ru	{"title": "Ассоциация «Hamkor Uz» в Цинциннати", "description": "<p>Цели</p><ul><li>Объединение выходцев из Узбекистана, проживающих в Цинциннати и близлежащих районах.</li><li>Сохранение и продвижение культуры, традиций и национальных ценностей Узбекистана.</li><li>Развитие сотрудничества и взаимопомощи среди членов диаспоры.</li></ul><p>Задачи</p><ul><li>Организация культурных мероприятий, встреч и национальных праздников.</li><li>Развитие культурного обмена с местным сообществом.</li><li>Поддержка соотечественников, создание платформы для консультаций и сотрудничества.</li><li>Реализация общественных проектов (например, инициатив по строительству религиозных и культурных центров).</li></ul>"}	2026-02-24 10:55:14	2026-02-24 10:55:14
1648	524	523	Tashkilot haqida	nomi-7	en	{"title": "Hamkor Uz Cincinnati Association", "description": "<p>Goals</p><ul><li>To unite people from Uzbekistan living in Cincinnati and nearby areas.</li><li>To preserve and promote Uzbekistan’s culture, traditions, and national values.</li><li>To develop cooperation and mutual support among diaspora members.</li></ul><p>Tasks</p><ul><li>Organizing cultural events, meetings, and national celebrations.</li><li>Promoting cultural exchange with the local community.</li><li>Supporting compatriots and creating a platform for advice and cooperation.</li><li>Implementing community projects (for example, initiatives to build religious and cultural centers).</li></ul>"}	2026-02-24 10:55:14	2026-02-24 10:55:14
1649	524	523	Tashkilot haqida	nomi-7	\N	{"boss_at": "27/08/2020", "date_at": "27/08/2020"}	2026-02-24 10:55:14	2026-02-24 10:55:14
1688	536	\N	\N	\N	uz	{"title": "Istiqomat qilayotgan davlatingiz", "value": null, "placeholder": "Tanlang"}	2026-02-25 06:01:38	2026-02-25 06:27:32
1689	536	\N	\N	\N	ru	{"title": null, "value": null, "placeholder": null}	2026-02-25 06:01:38	2026-02-25 06:27:32
1692	537	\N	\N	\N	uz	{"title": "Shahar/tuman", "value": null, "placeholder": "Tanlang"}	2026-02-25 06:02:19	2026-02-25 06:27:39
1693	537	\N	\N	\N	ru	{"title": null, "value": null, "placeholder": null}	2026-02-25 06:02:19	2026-02-25 06:27:39
1694	537	\N	\N	\N	en	{"title": null, "value": null, "placeholder": null}	2026-02-25 06:02:19	2026-02-25 06:27:39
1695	537	\N	\N	\N	\N	{"key": "city", "type": "text", "column": "6", "required": "1"}	2026-02-25 06:02:19	2026-02-25 06:27:39
1761	554	523	Rahbar	rahbar-5	ru	{"title": "Алимов Зафар Ходжиакбарович", "description": "Руководитель"}	2026-02-25 09:02:56	2026-02-25 09:02:56
1762	554	523	Rahbar	rahbar-5	en	{"title": "Alimov Zafar Khojiakbarovich", "description": "Head / Leader"}	2026-02-25 09:02:56	2026-02-25 09:02:56
1763	554	523	Rahbar	rahbar-5	\N	{"email": "Hamkor Uz Cincinnati Facebook", "phone": null}	2026-02-25 09:02:56	2026-02-25 09:02:56
1547	492	491	Tashkilot haqida	nomi-7	ru	{"title": "Туркестано-Американская Ассоциация", "description": "<p>Основные цели:</p><ul><li>Сохранение и широкое продвижение культуры, обычаев и истории Туркистана (особенно Узбекистана).</li><li>Объединение туркистанской общины в США и создание активного общества.</li><li>Развитие культурного обмена через предоставление американской общественности информации о религиозной жизни, традициях и культуре Туркистана.</li></ul><p>Основные задачи:</p><ul><li>Поддержка традиционных ценностей через организацию культурных мероприятий, программ и общественной деятельности.</li><li>Создание возможностей для членов сообщества работать с культурными, социальными и общественными ресурсами.</li><li>Поддержка программ, способствующих личному и социальному развитию туркистанской общины.</li></ul>"}	2026-02-23 07:25:35	2026-02-23 07:25:35
1548	492	491	Tashkilot haqida	nomi-7	en	{"title": "Turkistanian-American Association", "description": "<p>Main Goals:</p><ul><li>To preserve and widely promote the culture, customs, and history of Turkistan (especially Uzbekistan).</li><li>To unite the Turkistanian community in the U.S. and create an active society.</li><li>To foster cultural exchange by informing the general American public about Turkistan’s religious life, traditions, and culture.</li></ul><p>Main Tasks:</p><ul><li>Supporting traditional values through the organization of cultural events, programs, and community activities.</li><li>Providing members with opportunities to engage with cultural, social, and community resources.</li><li>Supporting programs that serve the personal and social development of the Turkistanian community.</li></ul>"}	2026-02-23 07:25:35	2026-02-23 07:25:35
1549	492	491	Tashkilot haqida	nomi-7	\N	{"boss_at": null, "date_at": "1958"}	2026-02-23 07:25:35	2026-02-23 07:25:35
1493	473	468	Tashkilot haqida	nomi-7	uz	{"title": "AQSh va Kanadadagi Buxoriy Yahudiylar Kongressi", "description": "<p>Maqsadlari:</p><ul><li>Buxoriy yahudiylarining madaniyati, an’analari va tarixini saqlash hamda rivojlantirish.</li><li>AQSh va Kanadada yashovchi vatandoshlarni birlashtirish va o‘zaro hamkorlikni kuchaytirish.</li><li>Yosh avlodni milliy qadriyatlar ruhida tarbiyalash va jamoa hayotiga jalb qilish.</li><li>O‘zbekiston va boshqa davlatlar bilan madaniy aloqalarni rivojlantirish.</li></ul><p>Vazifalari:</p><ul><li>Madaniy, ma’rifiy va xayriya tadbirlarini tashkil etish.</li><li>Jamoa a’zolariga ijtimoiy va huquqiy yordam ko‘rsatish.</li><li>Ta’lim, yoshlar dasturlari va jamoat loyihalarini qo‘llab-quvvatlash.</li><li>Turli mamlakatlardagi Buxoriy yahudiylar tashkilotlari bilan hamkorlik qilish.</li></ul>"}	2026-02-20 06:51:55	2026-02-23 06:01:56
1495	473	468	Tashkilot haqida	nomi-7	en	{"title": "Congress of Bukharian Jews in the United States and Canada", "description": "<p>Goals:</p><ul><li>To preserve and develop the culture, traditions, and history of Bukharian Jews.</li><li>To unite compatriots living in the United States and Canada and strengthen cooperation among them.</li><li>To educate the younger generation in the spirit of national values and involve them in community life.</li><li>To develop cultural relations with Uzbekistan and other countries.</li></ul><p>Tasks:</p><ul><li>Organizing cultural, educational, and charitable events.</li><li>Providing social and legal assistance to community members.</li><li>Supporting educational initiatives, youth programs, and community projects.</li><li>Cooperating with Bukharian Jewish organizations in different countries.</li></ul>"}	2026-02-20 06:51:55	2026-02-23 06:01:56
1546	492	491	Tashkilot haqida	nomi-7	uz	{"title": "Turkiston-Amerika Assotsiatsiyasi", "description": "<p>Asosiy maqsadlar:</p><ul><li>Turkistonian (ayniqsa O‘zbekiston) madaniyati, urf‑odatlari va tarixini saqlash, keng targ‘ib qilish.</li><li>AQShdagi Turkistonian jamoasini birlashtirish va faol jamiyat yaratish.</li><li>Amerikaning umumiy jamoatchiligiga Turkistonning diniy hayoti, an’analari va madaniyati haqida ma’lumot berish orqali madaniy almashinuvni rivojlantirish.</li></ul><p>Asosiy vazifalar:</p><ul><li>Madaniy tadbirlar, dasturlar va jamoat faoliyatini tashkil etish orqali an’anaviy qadriyatlarni qo‘llab‑quvvatlash.</li><li>A’zolarga madaniy, ijtimoiy va hamjamiyat resurslari bilan ishlash imkoniyatlarini yaratish.</li><li>Turkiston jamoasining shaxsiy va ijtimoiy o‘sishiga xizmat qiladigan dasturlarni qo‘llab‑quvvatlash.</li></ul>"}	2026-02-23 07:25:35	2026-02-23 07:25:35
2	1	\N	\N	\N	ru	{"title": "Общественный фонд <span>Ватандошлар </span>", "description": "Общественный фонд \\"Ватандошлар\\" – неправительственная организация, направленная на укрепление духовных связей с соотечественниками за рубежом, широкое распространение узбекского языка и культуры, а также привлечение талантливых соотечественников на путь развития Нового Узбекистана."}	2025-12-23 04:43:11	2026-02-23 10:38:15
289	120	\N	\N	\N	uz	{"title": "Vatandoshlar fondi", "word1": "- Vatan uchun", "word2": "- Yurt uchun", "word3": "- Millat uchun"}	2025-12-27 19:14:10	2026-02-24 11:09:07
290	120	\N	\N	\N	ru	{"title": "Одна цель, миллион соотечественников, единая Родина", "word1": null, "word2": null, "word3": null}	2025-12-27 19:14:10	2026-02-24 11:09:07
1698	538	\N	\N	\N	en	{"title": null, "value": null, "placeholder": null}	2026-02-25 06:05:42	2026-02-25 06:27:55
1699	538	\N	\N	\N	\N	{"key": "workplace", "type": "text", "column": "6", "required": "1"}	2026-02-25 06:05:42	2026-02-25 06:27:55
1764	555	19	tashkilotlar	tashkilot	\N	{"title": "Uzbek Cultural Center of New England"}	2026-02-25 09:14:35	2026-02-25 09:14:35
1696	538	\N	\N	\N	uz	{"title": "Ish joyi", "value": null, "placeholder": "Ma'lumot kiriting"}	2026-02-25 06:05:42	2026-02-25 06:27:55
1697	538	\N	\N	\N	ru	{"title": null, "value": null, "placeholder": null}	2026-02-25 06:05:42	2026-02-25 06:27:55
1716	543	\N	\N	\N	uz	{"title": "Instagram", "value": null, "placeholder": "Ma'lumot kiriting"}	2026-02-25 06:08:31	2026-02-25 06:28:23
1703	539	\N	\N	\N	\N	{"key": "position", "type": "text", "column": "6", "required": "1"}	2026-02-25 06:06:21	2026-02-25 06:28:01
1728	546	148	Form	form	uz	{"title": "To'liq ismingiz", "value": null, "placeholder": "Ma'lumot kiriting"}	2026-02-25 08:18:39	2026-02-25 08:18:39
1577	502	500	Rahbar	rahbar-5	uz	{"title": "Jay Hadjaev", "description": null}	2026-02-23 12:17:35	2026-02-23 12:23:17
1578	502	500	Rahbar	rahbar-5	ru	{"title": "Джей Хаджаев", "description": null}	2026-02-23 12:17:35	2026-02-23 12:23:17
1579	502	500	Rahbar	rahbar-5	en	{"title": "Jay Hadjaev", "description": null}	2026-02-23 12:17:35	2026-02-23 12:23:17
1580	502	500	Rahbar	rahbar-5	\N	{"email": "Atlanta Uzbek Community on Facebook", "phone": null}	2026-02-23 12:17:35	2026-02-23 12:23:17
1613	513	19	tashkilotlar	tashkilot	\N	{"title": "Yurtdosh Uzbek American Association"}	2026-02-24 05:28:11	2026-02-24 05:28:11
1550	493	491	Rahbar	rahbar-5	uz	{"title": "Abdullah Kwaja", "description": "Prezident"}	2026-02-23 07:36:08	2026-02-24 09:28:11
1551	493	491	Rahbar	rahbar-5	ru	{"title": "Абдулла Кважа", "description": "Президент"}	2026-02-23 07:36:08	2026-02-24 09:28:11
1552	493	491	Rahbar	rahbar-5	en	{"title": "Abdullah Kwaja", "description": "President"}	2026-02-23 07:36:08	2026-02-24 09:28:11
1553	493	491	Rahbar	rahbar-5	\N	{"email": "akwaja55@aol.com", "phone": null}	2026-02-23 07:36:08	2026-02-24 09:28:11
1729	546	148	Form	form	ru	{"title": null, "value": null, "placeholder": null}	2026-02-25 08:18:39	2026-02-25 08:18:39
881	256	\N	\N	\N	uz	{"link": "https://uz.wikipedia.org/wiki/Uzreport_TV", "title": "Uzreport TV"}	2026-02-18 06:53:56	2026-02-24 12:18:51
884	257	\N	\N	\N	uz	{"link": "https://uz.wikipedia.org/wiki/O%CA%BBzbekiston_Yozuvchilar_uyushmasi", "title": "O'zbekiston Yozuvchilari uyushmasi"}	2026-02-18 06:54:50	2026-02-24 12:19:03
1700	539	\N	\N	\N	uz	{"title": "Lavozimi", "value": null, "placeholder": "Ma'lumot kiriting"}	2026-02-25 06:06:21	2026-02-25 06:28:01
1701	539	\N	\N	\N	ru	{"title": null, "value": null, "placeholder": null}	2026-02-25 06:06:21	2026-02-25 06:28:01
1702	539	\N	\N	\N	en	{"title": null, "value": null, "placeholder": null}	2026-02-25 06:06:21	2026-02-25 06:28:01
1730	546	148	Form	form	en	{"title": null, "value": null, "placeholder": null}	2026-02-25 08:18:39	2026-02-25 08:18:39
1731	546	148	Form	form	\N	{"key": "name", "type": "text", "column": "8", "required": "1"}	2026-02-25 08:18:39	2026-02-25 08:18:39
1765	556	555	Tashkilot haqida	nomi-7	uz	{"title": "Shimoliy Angliyadagi O‘zbek Madaniyat Markazi", "description": "<p>Maqsadlar</p><ul><li>O‘zbekiston madaniyati, an’analari va san’atini New England mintaqasida targ‘ib qilish.</li><li>Mahalliy o‘zbek diasporasini birlashtirish va o‘zaro hamkorlikni rivojlantirish.</li><li>Yoshlar va avlodlar o‘rtasida ona tilini saqlash va rivojlantirish.</li></ul><p>Vazifalar</p><ul><li>Madaniy tadbirlar, konsertlar, ko‘rgazmalar va festival tashkil etish.</li><li>Ta’lim va madaniy loyihalarni qo‘llab‑quvvatlash (ona tili kurslari, tarixiy va san’at dasturlari).</li><li>Jamiyat a’zolari o‘rtasida ijtimoiy va madaniy hamkorlikni rivojlantirish.</li><li>O‘zbekiston va New England o‘rtasida madaniy aloqalarni mustahkamlash.</li></ul>"}	2026-02-25 09:22:18	2026-02-25 09:22:18
1766	556	555	Tashkilot haqida	nomi-7	ru	{"title": "Узбекский культурный центр Новой Англии", "description": "<p>Цели</p><ul><li>Продвигать культуру, традиции и искусство Узбекистана в регионе Нью-Ингленд.</li><li>Объединять местную узбекскую диаспору и развивать сотрудничество между её членами.</li><li>Сохранять и развивать родной язык среди молодежи и поколений.</li></ul><p>Задачи</p><ul><li>Организация культурных мероприятий, концертов, выставок и фестивалей.</li><li>Поддержка образовательных и культурных проектов (курсы родного языка, программы по истории и искусству).</li><li>Развитие социального и культурного сотрудничества среди членов сообщества.</li><li>Укрепление культурных связей между Узбекистаном и регионом Нью-Ингленд.</li></ul>"}	2026-02-25 09:22:18	2026-02-25 09:22:18
1767	556	555	Tashkilot haqida	nomi-7	en	{"title": "Uzbek Cultural Center of New England", "description": "<p>Goals</p><ul><li>To promote Uzbekistan’s culture, traditions, and arts in the New England region.</li><li>To unite the local Uzbek diaspora and foster cooperation among its members.</li><li>To preserve and develop the mother tongue among youth and future generations.</li></ul><p>Tasks</p><ul><li>Organizing cultural events, concerts, exhibitions, and festivals.</li><li>Supporting educational and cultural projects (mother tongue courses, history and arts programs).</li><li>Developing social and cultural cooperation among community members.</li><li>Strengthening cultural ties between Uzbekistan and New England.</li></ul>"}	2026-02-25 09:22:18	2026-02-25 09:22:18
1768	556	555	Tashkilot haqida	nomi-7	\N	{"boss_at": "10/2019", "date_at": "10/2019"}	2026-02-25 09:22:18	2026-02-25 09:22:18
1614	514	513	Tashkilot haqida	nomi-7	uz	{"title": "Yurtdosh O‘zbek-Amerika Assotsiatsiyasi", "description": "<p>Maqsadlari</p><ul><li>AQShda yashovchi o‘zbekistonliklarni birlashtirish va ularning o‘zaro hamkorligini rivojlantirish.</li><li>O‘zbekiston madaniyati, an’analari va qadriyatlarini saqlash va keng targ‘ib qilish.</li><li>Yosh avlodni milliy qadriyatlar ruhida tarbiyalash va jamiyat faoliyatiga jalb qilish.</li></ul><p>Vazifalari</p><ul><li>Madaniy tadbirlar, bayramlar va jamoat uchrashuvlarini tashkil etish (Navro‘z, Mustaqillik kuni va boshqa milliy tadbirlar).</li><li>O‘zbek tili, tarix va madaniyatini o‘rgatishga yo‘naltirilgan ta’limiy va ma’rifiy dasturlarni amalga oshirish.</li><li>Diaspora a’zolariga ijtimoiy, huquqiy va maslahat xizmatlarini ko‘rsatish.</li><li>Boshqa madaniy va jamoat tashkilotlari bilan hamkorlik qilib, jamiyatni rivojlantirish.</li></ul>"}	2026-02-24 05:59:33	2026-02-24 06:05:58
1615	514	513	Tashkilot haqida	nomi-7	ru	{"title": "Ассоциация узбеков-американцев «Юртдош»", "description": "<p>Цели</p><ul><li>Объединение узбекистанцев, проживающих в США, и развитие их сотрудничества.</li><li>Сохранение и продвижение культуры, традиций и ценностей Узбекистана.</li><li>Воспитание молодежи в духе национальных ценностей и вовлечение её в деятельность общества.</li></ul><p>Задачи</p><ul><li>Организация культурных мероприятий, праздников и общественных встреч (Навруз, День независимости и другие национальные события).</li><li>Реализация образовательных и просветительских программ, направленных на изучение узбекского языка, истории и культуры.</li><li>Предоставление членам диаспоры социальных, юридических и консультационных услуг.</li><li>Развитие общества через сотрудничество с другими культурными и общественными организациями.</li></ul>"}	2026-02-24 05:59:33	2026-02-24 06:05:58
1616	514	513	Tashkilot haqida	nomi-7	en	{"title": "Yurtdosh Uzbek American Association", "description": "<p>Goals</p><ul><li>To unite Uzbeks living in the United States and foster cooperation among them.</li><li>To preserve and promote Uzbekistan’s culture, traditions, and values.</li><li>To educate the younger generation in national values and engage them in community activities.</li></ul><p>Tasks</p><ul><li>Organizing cultural events, celebrations, and community meetings (Navruz, Independence Day, and other national events).</li><li>Implementing educational and cultural programs focused on the Uzbek language, history, and culture.</li><li>Providing social, legal, and advisory services to diaspora members.</li><li>Developing the community through collaboration with other cultural and civic organizations.</li></ul>"}	2026-02-24 05:59:33	2026-02-24 06:05:58
1496	474	470	Tashkilot haqida	nomi-7	uz	{"title": "Nagoya va O‘zbekiston Do‘stlik Assotsiatsiyasi", "boss_at": "2025", "date_at": "2020", "description": "Yaponiya, xususan Nagoya shahri hamda Oʻzbekiston o‘rtasida do‘stlik va hamkorlikni mustahkamlash. Madaniy, ta’limiy va ijtimoiy tadbirlar orqali ikki xalq o‘rtasida o‘zaro tushunish va hurmatni rivojlantirish. O‘zbek madaniyati, an’analari va milliy taomlarini Yaponiyada targ‘ib qilish. Yapon va o‘zbek fuqarolari o‘rtasida madaniy almashinuv dasturlarini tashkil etish. Yaponiyadagi o‘zbek diasporasini qo‘llab-quvvatlash va axborot-maslahat yordami ko‘rsatish."}	2026-02-20 07:18:46	2026-02-20 07:24:45
1497	474	470	Tashkilot haqida	nomi-7	ru	{"title": null, "boss_at": null, "date_at": null, "description": null}	2026-02-20 07:18:46	2026-02-20 07:24:45
1498	474	470	Tashkilot haqida	nomi-7	en	{"title": null, "boss_at": null, "date_at": null, "description": null}	2026-02-20 07:18:46	2026-02-20 07:24:45
1554	494	19	tashkilotlar	tashkilot	\N	{"title": "Uzbek American Association of Florida"}	2026-02-23 07:41:09	2026-02-23 07:47:18
1581	503	19	tashkilotlar	tashkilot	\N	{"title": "Mahalla USA"}	2026-02-23 12:26:08	2026-02-23 12:26:08
1617	514	513	Tashkilot haqida	nomi-7	\N	{"boss_at": "29/07/2015", "date_at": "29/07/2015"}	2026-02-24 05:59:34	2026-02-24 06:05:58
1650	525	\N	\N	\N	uz	{"link": "https://uz.wikipedia.org/wiki/Shanxay_hamkorlik_tashkiloti", "title": "https://uz.wikipedia.org/wiki/Shanxay_hamkorlik_tashkiloti"}	2026-02-24 12:18:42	2026-02-24 12:18:42
1651	525	\N	\N	\N	ru	{"link": "https://uz.wikipedia.org/wiki/Shanxay_hamkorlik_tashkiloti", "title": "https://uz.wikipedia.org/wiki/Shanxay_hamkorlik_tashkiloti"}	2026-02-24 12:18:42	2026-02-24 12:18:42
1652	525	\N	\N	\N	en	{"link": "https://uz.wikipedia.org/wiki/Shanxay_hamkorlik_tashkiloti", "title": "https://uz.wikipedia.org/wiki/Shanxay_hamkorlik_tashkiloti"}	2026-02-24 12:18:42	2026-02-24 12:18:42
1704	540	\N	\N	\N	uz	{"title": "Ma'lumoti", "value": null, "placeholder": "Ma'lumot kiriting"}	2026-02-25 06:07:03	2026-02-25 06:28:06
1705	540	\N	\N	\N	ru	{"title": null, "value": null, "placeholder": null}	2026-02-25 06:07:03	2026-02-25 06:28:06
1706	540	\N	\N	\N	en	{"title": null, "value": null, "placeholder": null}	2026-02-25 06:07:03	2026-02-25 06:28:06
1707	540	\N	\N	\N	\N	{"key": "education", "type": "text", "column": "6", "required": "1"}	2026-02-25 06:07:03	2026-02-25 06:28:06
1732	547	148	Form	form	uz	{"title": "Tug'ilgan sana", "value": null, "placeholder": "DD-MM-YYYY"}	2026-02-25 08:24:20	2026-02-25 08:24:20
1733	547	148	Form	form	ru	{"title": null, "value": null, "placeholder": null}	2026-02-25 08:24:20	2026-02-25 08:24:20
1734	547	148	Form	form	en	{"title": null, "value": null, "placeholder": null}	2026-02-25 08:24:20	2026-02-25 08:24:20
1735	547	148	Form	form	\N	{"key": "birthdate", "type": "text", "column": "4", "required": "1"}	2026-02-25 08:24:20	2026-02-25 08:24:20
1769	557	555	Rahbar	rahbar-5	uz	{"title": "Maksudov Ilkhom Alizhonovich", "description": "Prezident"}	2026-02-25 09:32:58	2026-02-25 09:32:58
1770	557	555	Rahbar	rahbar-5	ru	{"title": "Максудов Илхом Ализхонович", "description": "Президент"}	2026-02-25 09:32:58	2026-02-25 09:32:58
1771	557	555	Rahbar	rahbar-5	en	{"title": "Maksudov Ilkhom Alizhonovich", "description": "President"}	2026-02-25 09:32:58	2026-02-25 09:32:58
1772	557	555	Rahbar	rahbar-5	\N	{"email": "info@uccne.org", "phone": null}	2026-02-25 09:32:58	2026-02-25 09:32:58
1785	561	156	Form	form	uz	{"title": "E-mail", "value": null, "placeholder": "example@gmail.com"}	2026-02-25 10:25:02	2026-02-25 10:25:02
1786	561	156	Form	form	ru	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:25:02	2026-02-25 10:25:02
1787	561	156	Form	form	en	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:25:02	2026-02-25 10:25:02
1788	561	156	Form	form	\N	{"key": "email", "type": "email", "column": "4", "required": "1"}	2026-02-25 10:25:02	2026-02-25 10:25:02
1555	495	494	Tashkilot haqida	nomi-7	uz	{"title": "Floridadagi O‘zbek-Amerika Assotsiatsiyasi", "description": "<p>Asosiy maqsadlar:</p><ul><li>Florida shtatidagi o‘zbek hamjamiyatining madaniy merosi, an’analari va qadriyatlarini saqlash va keng targ‘ib qilish.</li><li>AQSh jamiyati bilan o‘zbek madaniyati o‘rtasida ko‘prik yaratish hamda o‘zaro tushunishni mustahkamlash.</li><li>Yangi kelganlarga hayotga moslashish, ingliz tilini o‘rganish va ijtimoiy tarmoqlarni kengaytirishda ko‘mak berish.</li></ul><p>Asosiy vazifalar:</p><ul><li>Navro‘z, Mustaqillik kuni kabi milliy bayramlar va madaniy tadbirlarni tashkil etish.</li><li>Uzbek tili, tarbiya va madaniy bilimlarni yosh avlodga yetkazishga yo‘naltirilgan dasturlarni qo‘llab‑quvvatlash.</li><li>A’zolarga ijtimoiy, ta’limiy va kasbiy resurslar bo‘yicha xizmatlar ko‘rsatish.</li><li>Boshqa madaniy tashkilotlar bilan hamkorlik orqali jamiyatni yanada mustahkamlash.</li></ul>"}	2026-02-23 07:45:23	2026-02-23 07:46:40
1557	495	494	Tashkilot haqida	nomi-7	en	{"title": "Uzbek American Association of Florida", "description": "<p>Main Goals:</p><ul><li>To preserve and widely promote the cultural heritage, traditions, and values of the Uzbek community in Florida.</li><li>To build a bridge between Uzbek culture and American society and strengthen mutual understanding.</li><li>To assist newcomers in adapting to life, learning English, and expanding social networks.</li></ul><p>Main Tasks:</p><ul><li>Organizing national holidays and cultural events, such as Navruz and Independence Day.</li><li>Supporting programs aimed at passing on Uzbek language, education, and cultural knowledge to the younger generation.</li><li>Providing members with social, educational, and professional support services.</li><li>Strengthening the community through collaboration with other cultural organizations.</li></ul>"}	2026-02-23 07:45:23	2026-02-23 07:46:40
1499	475	\N	\N	\N	uz	{"desc": "<p align=\\"left\\">Davlat bayrog‘i O‘zbekiston Respublikasining 1991 yil 18 noyabrdagi 407-XII-sonli “O‘zbekiston Respublikasining Davlat bayrog‘i to‘g‘risida”gi Qonuni bilan tasdiqlangan.</p><p align=\\"left\\">O‘zbekiston Respublikasining Davlat bayrog‘i O‘zbekiston Respublikasi davlat suverenitetining ramzidir.</p><p align=\\"left\\">O‘zbekiston Respublikasining Davlat bayrog‘i xalqaro munosabatlarda O‘zbekiston Respublikasining timsoli bo‘ladi.</p><p align=\\"left\\">O‘zbekiston Respublikasining Davlat bayrog‘i — bayroqning butun uzunligi bo‘ylab o‘tgan to‘q moviy rang, oq rang va to‘q yashil rangli uchta endan tarkib topgan to‘g‘ri to‘rtburchak shaklidagi matodir.</p><p><br></p>", "title": "O'zbekiston Respublikasi Davlat bayrog'i"}	2026-02-20 08:34:21	2026-02-20 08:40:18
1500	475	\N	\N	\N	ru	{"desc": null, "title": null}	2026-02-20 08:34:21	2026-02-20 08:40:18
1501	475	\N	\N	\N	en	{"desc": null, "title": null}	2026-02-20 08:34:21	2026-02-20 08:40:18
1558	495	494	Tashkilot haqida	nomi-7	\N	{"boss_at": "23/04/2020", "date_at": "23/04/2020"}	2026-02-23 07:45:23	2026-02-23 07:46:40
1618	515	513	Rahbar	rahbar-5	uz	{"title": "Ziyamov Sharofiddin Xusnitdinovich", "description": "Prezident"}	2026-02-24 06:05:35	2026-02-24 09:27:16
1619	515	513	Rahbar	rahbar-5	ru	{"title": "Зиямов Шарофиддин Хуснитдинович", "description": "Президент"}	2026-02-24 06:05:35	2026-02-24 09:27:16
1620	515	513	Rahbar	rahbar-5	en	{"title": "Ziyamov Sharofiddin Khusnitdinovich", "description": "President"}	2026-02-24 06:05:35	2026-02-24 09:27:16
1621	515	513	Rahbar	rahbar-5	\N	{"email": "yurtdosh1991@gmail.com", "phone": null}	2026-02-24 06:05:35	2026-02-24 09:27:16
1653	526	\N	\N	\N	uz	{"link": "https://gov.uz/oz/mfa", "title": "https://gov.uz/oz/mfa"}	2026-02-24 12:32:56	2026-02-24 12:32:56
1654	526	\N	\N	\N	ru	{"link": "https://gov.uz/oz/mfa", "title": "https://gov.uz/oz/mfa"}	2026-02-24 12:32:56	2026-02-24 12:32:56
1655	526	\N	\N	\N	en	{"link": "https://gov.uz/oz/mfa", "title": "https://gov.uz/oz/mfa"}	2026-02-24 12:32:56	2026-02-24 12:32:56
1708	541	\N	\N	\N	uz	{"title": "Mutaxassisligi", "value": null, "placeholder": "Mutaxassislikni kiriting"}	2026-02-25 06:07:31	2026-02-25 06:28:12
1709	541	\N	\N	\N	ru	{"title": null, "value": null, "placeholder": null}	2026-02-25 06:07:31	2026-02-25 06:28:12
1710	541	\N	\N	\N	en	{"title": null, "value": null, "placeholder": null}	2026-02-25 06:07:31	2026-02-25 06:28:12
1711	541	\N	\N	\N	\N	{"key": "job", "type": "text", "column": "6", "required": "1"}	2026-02-25 06:07:31	2026-02-25 06:28:12
1736	548	148	Form	form	uz	{"title": "Jinsi", "value": "Erkak,Ayol", "placeholder": "Tanlang"}	2026-02-25 08:24:54	2026-02-25 08:24:54
1737	548	148	Form	form	ru	{"title": null, "value": null, "placeholder": null}	2026-02-25 08:24:54	2026-02-25 08:24:54
1738	548	148	Form	form	en	{"title": null, "value": null, "placeholder": null}	2026-02-25 08:24:54	2026-02-25 08:24:54
1739	548	148	Form	form	\N	{"key": "gender", "type": "select", "column": "4", "required": "1"}	2026-02-25 08:24:54	2026-02-25 08:24:54
1773	558	156	Form	form	uz	{"title": "To'liq ismingiz", "value": null, "placeholder": "Ma'lumot kiriting"}	2026-02-25 10:23:46	2026-02-25 10:23:46
1774	558	156	Form	form	ru	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:23:46	2026-02-25 10:23:46
1775	558	156	Form	form	en	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:23:46	2026-02-25 10:23:46
1776	558	156	Form	form	\N	{"key": "name", "type": "text", "column": "8", "required": "1"}	2026-02-25 10:23:46	2026-02-25 10:23:46
1332	418	\N	\N	\N	en	{"title": "China"}	2026-02-18 09:55:12	2026-02-18 09:57:21
1789	562	156	Form	form	uz	{"title": "Telefon raqamingiz", "value": null, "placeholder": "Telefon raqamingiz"}	2026-02-25 10:25:22	2026-02-25 10:25:22
1790	562	156	Form	form	ru	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:25:22	2026-02-25 10:25:22
1791	562	156	Form	form	en	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:25:22	2026-02-25 10:25:22
1792	562	156	Form	form	\N	{"key": "phone", "type": "tel", "column": "4", "required": "1"}	2026-02-25 10:25:22	2026-02-25 10:25:22
1801	565	156	Form	form	uz	{"title": "Ish joyi", "value": null, "placeholder": "Ma'lumot kiriting"}	2026-02-25 10:30:58	2026-02-25 10:30:58
1802	565	156	Form	form	ru	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:30:58	2026-02-25 10:30:58
1803	565	156	Form	form	en	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:30:58	2026-02-25 10:30:58
1804	565	156	Form	form	\N	{"key": "workplace", "type": "text", "column": "6", "required": "1"}	2026-02-25 10:30:58	2026-02-25 10:30:58
1813	568	156	Form	form	uz	{"title": "Mutaxassisligi", "value": null, "placeholder": "Mutaxassislikni kiriting"}	2026-02-25 10:31:51	2026-02-25 10:31:51
1814	568	156	Form	form	ru	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:31:51	2026-02-25 10:31:51
1815	568	156	Form	form	en	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:31:51	2026-02-25 10:31:51
1816	568	156	Form	form	\N	{"key": "job", "type": "text", "column": "6", "required": "1"}	2026-02-25 10:31:51	2026-02-25 10:31:51
1622	516	19	tashkilotlar	tashkilot	\N	{"title": "Uzbek American Association of Chicago"}	2026-02-24 06:15:59	2026-02-24 06:15:59
1502	476	\N	\N	\N	uz	{"desc": "<p>Davlat gerbi O‘zbekiston Respublikasining 1992 yil 2 iyuldagi 616-XII-sonli “O‘zbekiston Respublikasi davlat gerbi to’g’risida”gi Qonuni bilan tasdiqlangan.</p><p>O‘zbekiston Respublikasi Davlat gerbi quyidagi ko‘rinishga ega: tog‘lar, daryolar va so‘l tomoni bug‘doy boshoqlaridan, o‘ng tomoni esa chanoqlari ochilgan g‘o‘za shoxlaridan iborat chambarga o‘ralgan gullagan vodiy uzra quyosh zarrin nurlarini sochib turadi.</p><p>Gerbning yuqori qismida Respublika hurligining ramzi sifatida sakkizburchak tasvirlangan bo‘lib, uning ichki qismida yarim oy va yulduz tasvirlangan. Gerbning markazida baxt va erksevarlik ramzi — qanotlarini yozgan Humo qushi tasvirlangan. Gerbning pastki qismida O‘zbekiston Respublikasi Davlat bayrog‘ini ifoda etuvchi chambar lentasining bantida “O‘zbekiston” deb yozib qo‘yilgan.</p><p><br></p>", "title": "O‘zbekiston Respublikasi Davlat gerbi"}	2026-02-20 08:43:24	2026-02-20 09:11:54
1503	476	\N	\N	\N	ru	{"desc": null, "title": null}	2026-02-20 08:43:24	2026-02-20 09:11:54
1504	476	\N	\N	\N	en	{"desc": null, "title": null}	2026-02-20 08:43:24	2026-02-20 09:11:54
1656	527	\N	\N	\N	uz	{"link": "https://gov.uz/oz/icc", "title": "https://gov.uz/oz/icc"}	2026-02-24 12:36:50	2026-02-24 12:36:50
1657	527	\N	\N	\N	ru	{"link": "https://gov.uz/oz/icc", "title": "https://gov.uz/oz/icc"}	2026-02-24 12:36:50	2026-02-24 12:36:50
1658	527	\N	\N	\N	en	{"link": "https://gov.uz/oz/icc", "title": "https://gov.uz/oz/icc"}	2026-02-24 12:36:50	2026-02-24 12:36:50
1712	542	\N	\N	\N	uz	{"title": "Telegram", "value": null, "placeholder": "Ma'lumot kiriting"}	2026-02-25 06:08:06	2026-02-25 06:28:19
1713	542	\N	\N	\N	ru	{"title": null, "value": null, "placeholder": null}	2026-02-25 06:08:06	2026-02-25 06:28:19
1714	542	\N	\N	\N	en	{"title": null, "value": null, "placeholder": null}	2026-02-25 06:08:06	2026-02-25 06:28:19
1715	542	\N	\N	\N	\N	{"key": "telegram", "type": "text", "column": "4", "required": "0"}	2026-02-25 06:08:06	2026-02-25 06:28:19
1740	549	148	Form	form	uz	{"title": "E-mail", "value": null, "placeholder": "example@gmail.com"}	2026-02-25 08:25:39	2026-02-25 08:25:39
1741	549	148	Form	form	ru	{"title": null, "value": null, "placeholder": null}	2026-02-25 08:25:39	2026-02-25 08:25:39
1742	549	148	Form	form	en	{"title": null, "value": null, "placeholder": null}	2026-02-25 08:25:39	2026-02-25 08:25:39
1743	549	148	Form	form	\N	{"key": "email", "type": "email", "column": "4", "required": "1"}	2026-02-25 08:25:39	2026-02-25 08:25:39
1777	559	156	Form	form	uz	{"title": "Tug'ilgan sana", "value": null, "placeholder": "DD-MM-YYYY"}	2026-02-25 10:24:09	2026-02-25 10:24:09
1778	559	156	Form	form	ru	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:24:09	2026-02-25 10:24:09
1779	559	156	Form	form	en	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:24:09	2026-02-25 10:24:09
1780	559	156	Form	form	\N	{"key": "birthdate", "type": "text", "column": "4", "required": "1"}	2026-02-25 10:24:09	2026-02-25 10:24:09
1793	563	156	Form	form	uz	{"title": "Istiqomat qilayotgan davlatingiz", "value": null, "placeholder": "Tanlang"}	2026-02-25 10:25:45	2026-02-25 10:25:45
1794	563	156	Form	form	ru	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:25:45	2026-02-25 10:25:45
1795	563	156	Form	form	en	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:25:45	2026-02-25 10:25:45
1796	563	156	Form	form	\N	{"key": "country", "type": "country", "column": "6", "required": "1"}	2026-02-25 10:25:45	2026-02-25 10:25:45
1805	566	156	Form	form	uz	{"title": "Lavozimi", "value": null, "placeholder": "Ma'lumot kiriting"}	2026-02-25 10:31:18	2026-02-25 10:31:18
1806	566	156	Form	form	ru	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:31:18	2026-02-25 10:31:18
1807	566	156	Form	form	en	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:31:18	2026-02-25 10:31:18
1808	566	156	Form	form	\N	{"key": "position", "type": "text", "column": "6", "required": "1"}	2026-02-25 10:31:18	2026-02-25 10:31:18
1817	569	156	Form	form	uz	{"title": "Telegram", "value": null, "placeholder": "Ma'lumot kiriting"}	2026-02-25 10:32:12	2026-02-25 10:32:12
1818	569	156	Form	form	ru	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:32:12	2026-02-25 10:32:12
1819	569	156	Form	form	en	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:32:12	2026-02-25 10:32:12
1820	569	156	Form	form	\N	{"key": "telegram", "type": "text", "column": "4", "required": "0"}	2026-02-25 10:32:12	2026-02-25 10:32:12
1825	571	156	Form	form	uz	{"title": "WhatsApp", "value": null, "placeholder": "Ma'lumot kiriting"}	2026-02-25 10:32:59	2026-02-25 10:32:59
1826	571	156	Form	form	ru	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:32:59	2026-02-25 10:32:59
1827	571	156	Form	form	en	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:32:59	2026-02-25 10:32:59
1828	571	156	Form	form	\N	{"key": "whatsapp", "type": "text", "column": "4", "required": "0"}	2026-02-25 10:32:59	2026-02-25 10:32:59
1833	573	227	Form	form	uz	{"title": "To'liq ismingiz", "value": null, "placeholder": "Ma'lumot kiriting"}	2026-02-25 10:34:33	2026-02-25 10:34:33
1834	573	227	Form	form	ru	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:34:33	2026-02-25 10:34:33
1835	573	227	Form	form	en	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:34:33	2026-02-25 10:34:33
1836	573	227	Form	form	\N	{"key": "name", "type": "text", "column": "8", "required": "1"}	2026-02-25 10:34:33	2026-02-25 10:34:33
1841	575	227	Form	form	uz	{"title": "Jinsi", "value": "Erkak,Ayol", "placeholder": "Tanlang"}	2026-02-25 10:35:14	2026-02-25 10:35:14
1842	575	227	Form	form	ru	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:35:14	2026-02-25 10:35:14
1843	575	227	Form	form	en	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:35:14	2026-02-25 10:35:14
1844	575	227	Form	form	\N	{"key": "gender", "type": "select", "column": "4", "required": "1"}	2026-02-25 10:35:14	2026-02-25 10:35:14
1849	577	227	Form	form	uz	{"title": "Telefon raqamingiz", "value": null, "placeholder": "Telefon raqamingiz"}	2026-02-25 10:35:48	2026-02-25 10:35:48
1850	577	227	Form	form	ru	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:35:48	2026-02-25 10:35:48
1851	577	227	Form	form	en	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:35:48	2026-02-25 10:35:48
1852	577	227	Form	form	\N	{"key": "phone", "type": "tel", "column": "4", "required": "1"}	2026-02-25 10:35:48	2026-02-25 10:35:48
1853	578	227	Form	form	uz	{"title": "Istiqomat qilayotgan davlatingiz", "value": null, "placeholder": "Tanlang"}	2026-02-25 10:36:08	2026-02-25 10:36:08
1854	578	227	Form	form	ru	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:36:08	2026-02-25 10:36:08
1354	426	\N	\N	\N	ru	{"title": "Россия"}	2026-02-18 09:57:07	2026-02-18 09:57:07
1355	426	\N	\N	\N	en	{"title": "Russia"}	2026-02-18 09:57:07	2026-02-18 09:57:07
1356	426	\N	\N	\N	\N	{"code": "ru"}	2026-02-18 09:57:07	2026-02-18 09:57:07
1556	495	494	Tashkilot haqida	nomi-7	ru	{"title": "Узбекско-американская ассоциация Флориды", "description": "<p>Основные цели:</p><ul><li>Сохранение и широкое продвижение культурного наследия, традиций и ценностей узбекской общины во Флориде.</li><li>Создание моста между узбекской культурой и американским обществом, укрепление взаимопонимания.</li><li>Помощь новым приезжим в адаптации к жизни, изучении английского языка и расширении социальных связей.</li></ul><p>Основные задачи:</p><ul><li>Организация национальных праздников и культурных мероприятий, таких как Навруз и День независимости.</li><li>Поддержка программ, направленных на передачу узбекского языка, воспитания и культурных знаний молодому поколению.</li><li>Предоставление членам общины услуг в области социальной, образовательной и профессиональной поддержки.</li><li>Укрепление общины через сотрудничество с другими культурными организациями.</li></ul>"}	2026-02-23 07:45:23	2026-02-23 07:46:40
1623	517	516	Tashkilot haqida	nomi-7	uz	{"title": "Chikagodagi O‘zbek-Amerika Assotsiatsiyasi", "description": "<p>Maqsadlari</p><ul><li>Chicago va AQShning atrofidagi hududlarda yashovchi o‘zbek diaspora jamoasini birlashtirish va qo‘llab‑quvvatlash.</li><li>O‘zbekiston madaniyati, an’analari, tarixi va qadriyatlarini saqlab qolish hamda keng targ‘ib qilish.</li><li>Mahalliy hamjamiyatlar bilan birgalikda madaniy almashinuv va ijtimoiy hamkorlikni rivojlantirish.</li></ul><p>Vazifalari</p><ul><li>O‘zbekiston milliy bayramlari, madaniy tadbirlar va jamoat yig‘ilishlarini tashkil etish (masalan, Mustaqillik kuni, Skokie Festival of Cultures kabi tadbirlar).</li><li>O‘zbek tili, Qur’on, tarix va madaniyat bo‘yicha ta’limiy dasturlar va maktablarni qo‘llab‑quvvatlash.</li><li>Jamiyat a’zolari uchun ijtimoiy va madaniy qo‘llab‑quvvatlash xizmatlarini ko‘rsatish.</li></ul>"}	2026-02-24 06:28:13	2026-02-24 06:28:13
1505	477	\N	\N	\N	uz	{"desc": "<p>O‘zbekiston Respublikasi Davlat madhiyasining matni va musiqasi O‘zbekiston Respublikasining 1992 yil 10 dekabrdagi 768-XII-sonli “O‘zbekiston Respublikasining Davlat madhiyasi to‘g‘risida”gi Qonuni bilan tasdiqlangan.</p>\\r\\n<p>O‘zbekiston Respublikasining Davlat madhiyasi O‘zbekiston Respublikasi Davlat suverenitetining ramzidir.</p>\\r\\n<p>O‘zbekiston Respublikasining Davlat madhiyasiga zo‘r ehtirom bilan qarash O‘zbekiston Respublikasi har bir fuqarosining vatanparvarlik burchi hisoblanadi. Davlat madhiyasining so‘zi Abdulla Oripov tomonidan yozilgan bo‘lib, musiqasi\\r\\n    Mutal Burxonov tomonidan bastalangan.</p>\\r\\n<p>Serquyosh hur o‘lkam, elga baxt, najot,<br>Sen o‘zing do‘stlarga yo‘ldosh, mehribon!<br>Yashnagay to abad ilmu fan, ijod,<br>Shuhrating porlasin toki bor jahon!</p>\\r\\n<p>Naqorat:</p><p>Oltin bu vodiylar - jon O‘zbekiston,<br> Ajdodlar mardona ruhi senga yor!<br>Ulug‘ xalq qudrati jo‘sh urgan zamon,<br>Olamni mahliyo aylagan diyor!</p>\\r\\n<p>Bag‘ri keng o‘zbekning o‘chmas iymoni,<br> Erkin, yosh avlodlar senga zo‘r qanot!<br>Istiqlol mash’ali tinchlik posboni,<br>Xaqsevar, ona yurt, mangu bo‘l obod!</p>\\r\\n<p>Naqorat:</p>\\r\\n<p>Oltin bu vodiylar - jon O‘zbekiston,<br>Ajdodlar mardona ruhi senga yor!<br>Ulug‘ xalq qudrati jo‘sh urgan zamon,<br>Olamni mahliyo aylagan diyor!</p>", "title": "O'zbekiston Respublikasining davlat madhiyasi"}	2026-02-20 08:57:36	2026-02-20 09:05:29
1506	477	\N	\N	\N	ru	{"desc": null, "title": null}	2026-02-20 08:57:36	2026-02-20 09:05:29
1507	477	\N	\N	\N	en	{"desc": null, "title": null}	2026-02-20 08:57:36	2026-02-20 09:05:29
1624	517	516	Tashkilot haqida	nomi-7	ru	{"title": "Узбекско-американская ассоциация Чикаго", "description": "<p><span style=\\"font-size: 1rem; letter-spacing: 0.01rem;\\">Цели</span></p><ul><li>Объединение и поддержка узбекской диаспоры, проживающей в Чикаго и прилегающих районах США.</li><li>Сохранение и продвижение культуры, традиций, истории и ценностей Узбекистана.</li><li>Развитие культурного обмена и социального сотрудничества совместно с местными сообществами.</li></ul><p>Задачи</p><ul><li>Организация национальных праздников Узбекистана, культурных мероприятий и общественных собраний (например, День независимости, Skokie Festival of Cultures и др.).</li><li>Поддержка образовательных программ и школ по изучению узбекского языка, Корана, истории и культуры.</li><li>Предоставление социально-культурной поддержки членам сообщества.</li></ul>"}	2026-02-24 06:28:13	2026-02-24 06:28:13
1625	517	516	Tashkilot haqida	nomi-7	en	{"title": "Uzbek American Association of Chicago", "description": "<p>Goals</p><ul><li>To unite and support the Uzbek diaspora living in Chicago and surrounding areas of the U.S.</li><li>To preserve and promote Uzbekistan’s culture, traditions, history, and values.</li><li>To foster cultural exchange and social cooperation with local communities.</li></ul><p>Tasks</p><ul><li>Organizing Uzbekistan’s national holidays, cultural events, and community gatherings (e.g., Independence Day, Skokie Festival of Cultures).</li><li>Supporting educational programs and schools teaching Uzbek language, the Quran, history, and culture.</li><li>Providing social and cultural support services for community members.</li></ul>"}	2026-02-24 06:28:13	2026-02-24 06:28:13
1626	517	516	Tashkilot haqida	nomi-7	\N	{"boss_at": "2009", "date_at": "2009"}	2026-02-24 06:28:13	2026-02-24 06:28:13
1659	528	\N	\N	\N	uz	{"link": "https://eyuf.uz/", "title": "https://eyuf.uz/"}	2026-02-24 12:38:42	2026-02-24 12:38:42
1660	528	\N	\N	\N	ru	{"link": "https://eyuf.uz/", "title": "https://eyuf.uz/"}	2026-02-24 12:38:42	2026-02-24 12:38:42
1661	528	\N	\N	\N	en	{"link": "https://eyuf.uz/", "title": "https://eyuf.uz/"}	2026-02-24 12:38:42	2026-02-24 12:38:42
1717	543	\N	\N	\N	ru	{"title": null, "value": null, "placeholder": null}	2026-02-25 06:08:31	2026-02-25 06:28:23
1718	543	\N	\N	\N	en	{"title": null, "value": null, "placeholder": null}	2026-02-25 06:08:31	2026-02-25 06:28:23
1719	543	\N	\N	\N	\N	{"key": "instagram", "type": "text", "column": "4", "required": "0"}	2026-02-25 06:08:31	2026-02-25 06:28:23
1744	550	148	Form	form	uz	{"title": "Telefon raqamingiz", "value": null, "placeholder": "Telefon raqamingiz"}	2026-02-25 08:26:02	2026-02-25 08:26:02
1330	418	\N	\N	\N	uz	{"title": "Xitoy"}	2026-02-18 09:55:12	2026-02-18 09:57:21
1331	418	\N	\N	\N	ru	{"title": "Китай"}	2026-02-18 09:55:12	2026-02-18 09:57:21
1333	418	\N	\N	\N	\N	{"code": "cn"}	2026-02-18 09:55:12	2026-02-18 09:57:21
1508	478	231	tashkilotlar	tashkilot	\N	{"title": "Les Amis d’Ouzbékistan"}	2026-02-20 11:36:02	2026-02-20 11:36:02
1539	489	456	tashkilotlar	tashkilot	\N	{"title": "Tomaris Uzbek Ladies Society"}	2026-02-23 05:18:03	2026-02-23 05:18:03
1559	496	494	Rahbar	rahbar-5	uz	{"title": "Nodir Rasulev", "description": "Rahbar"}	2026-02-23 07:50:10	2026-02-23 07:52:45
1560	496	494	Rahbar	rahbar-5	ru	{"title": "Нодир Расулев", "description": "Руководитель"}	2026-02-23 07:50:10	2026-02-23 07:52:45
1561	496	494	Rahbar	rahbar-5	en	{"title": "Nodir Rasulev", "description": "Head"}	2026-02-23 07:50:10	2026-02-23 07:52:45
1562	496	494	Rahbar	rahbar-5	\N	{"email": "info@uaaf.us", "phone": null}	2026-02-23 07:50:10	2026-02-23 07:52:45
1627	518	516	Rahbar	rahbar-5	uz	{"title": "Sharipov Olim Goziyevich", "description": "Chikagodagi O‘zbek-Amerika Assotsiatsiyasi rahbari (Prezident)"}	2026-02-24 06:31:15	2026-02-24 09:26:41
1628	518	516	Rahbar	rahbar-5	ru	{"title": "Шарипов Олим Гозиевич", "description": "Президент Узбекско-американской ассоциации Чикаго"}	2026-02-24 06:31:15	2026-02-24 09:26:41
1629	518	516	Rahbar	rahbar-5	en	{"title": "Sharipov Olim Goziyevich", "description": "President of the Uzbek American Association of Chicago"}	2026-02-24 06:31:15	2026-02-24 09:26:41
1630	518	516	Rahbar	rahbar-5	\N	{"email": "info@uzbekchicago.org", "phone": null}	2026-02-24 06:31:15	2026-02-24 09:26:41
1662	529	\N	\N	\N	uz	{"link": "https://gov.uz/oz/migration", "title": "https://gov.uz/oz/migration"}	2026-02-24 12:40:07	2026-02-24 12:40:07
1663	529	\N	\N	\N	ru	{"link": "https://gov.uz/oz/migration", "title": "https://gov.uz/oz/migration"}	2026-02-24 12:40:07	2026-02-24 12:40:07
1664	529	\N	\N	\N	en	{"link": "https://gov.uz/oz/migration", "title": "https://gov.uz/oz/migration"}	2026-02-24 12:40:07	2026-02-24 12:40:07
1720	544	\N	\N	\N	uz	{"title": "WhatsApp", "value": null, "placeholder": "Ma'lumot kiriting"}	2026-02-25 06:08:57	2026-02-25 07:36:28
1721	544	\N	\N	\N	ru	{"title": null, "value": null, "placeholder": null}	2026-02-25 06:08:57	2026-02-25 07:36:28
1722	544	\N	\N	\N	en	{"title": null, "value": null, "placeholder": null}	2026-02-25 06:08:57	2026-02-25 07:36:28
1723	544	\N	\N	\N	\N	{"key": "whatsapp", "type": "text", "column": "4", "required": "0"}	2026-02-25 06:08:57	2026-02-25 07:36:28
1745	550	148	Form	form	ru	{"title": null, "value": null, "placeholder": null}	2026-02-25 08:26:02	2026-02-25 08:26:02
1746	550	148	Form	form	en	{"title": null, "value": null, "placeholder": null}	2026-02-25 08:26:02	2026-02-25 08:26:02
1747	550	148	Form	form	\N	{"key": "phone", "type": "tel", "column": "4", "required": "1"}	2026-02-25 08:26:02	2026-02-25 08:26:02
1781	560	156	Form	form	uz	{"title": "Jinsi", "value": "Erkak,Ayol", "placeholder": "Tanlang"}	2026-02-25 10:24:43	2026-02-25 10:24:43
1782	560	156	Form	form	ru	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:24:43	2026-02-25 10:24:43
1783	560	156	Form	form	en	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:24:43	2026-02-25 10:24:43
1784	560	156	Form	form	\N	{"key": "gender", "type": "select", "column": "4", "required": "1"}	2026-02-25 10:24:43	2026-02-25 10:24:43
1797	564	156	Form	form	uz	{"title": "Shahar/tuman", "value": null, "placeholder": "Tanlang"}	2026-02-25 10:26:07	2026-02-25 10:26:07
1798	564	156	Form	form	ru	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:26:07	2026-02-25 10:26:07
1799	564	156	Form	form	en	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:26:07	2026-02-25 10:26:07
1800	564	156	Form	form	\N	{"key": "city", "type": "text", "column": "6", "required": "1"}	2026-02-25 10:26:07	2026-02-25 10:26:07
1809	567	156	Form	form	uz	{"title": "Ma'lumoti", "value": null, "placeholder": "Ma'lumot kiriting"}	2026-02-25 10:31:34	2026-02-25 10:31:34
1810	567	156	Form	form	ru	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:31:34	2026-02-25 10:31:34
1811	567	156	Form	form	en	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:31:34	2026-02-25 10:31:34
1812	567	156	Form	form	\N	{"key": "education", "type": "text", "column": "6", "required": "1"}	2026-02-25 10:31:34	2026-02-25 10:31:34
1821	570	156	Form	form	uz	{"title": "Instagram", "value": null, "placeholder": "Ma'lumot kiriting"}	2026-02-25 10:32:44	2026-02-25 10:32:44
1822	570	156	Form	form	ru	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:32:44	2026-02-25 10:32:44
1823	570	156	Form	form	en	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:32:44	2026-02-25 10:32:44
1824	570	156	Form	form	\N	{"key": "instagram", "type": "text", "column": "4", "required": "0"}	2026-02-25 10:32:44	2026-02-25 10:32:44
1829	572	156	Form	form	uz	{"title": "Fayl", "value": ".mp4, .jpg,.jpeg,.png,.pdf,.doc,.docx", "placeholder": "Video, rasm, hujjat, PDF, docx, excel va boshqalar"}	2026-02-25 10:33:19	2026-02-25 10:33:19
1830	572	156	Form	form	ru	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:33:19	2026-02-25 10:33:19
1831	572	156	Form	form	en	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:33:19	2026-02-25 10:33:19
1832	572	156	Form	form	\N	{"key": "image", "type": "file", "column": "12", "required": "1"}	2026-02-25 10:33:19	2026-02-25 10:33:19
1837	574	227	Form	form	uz	{"title": "Tug'ilgan sana", "value": null, "placeholder": "DD-MM-YYYY"}	2026-02-25 10:34:50	2026-02-25 10:34:50
1838	574	227	Form	form	ru	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:34:50	2026-02-25 10:34:50
1839	574	227	Form	form	en	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:34:50	2026-02-25 10:34:50
1840	574	227	Form	form	\N	{"key": "birthdate", "type": "text", "column": "4", "required": "1"}	2026-02-25 10:34:50	2026-02-25 10:34:50
1845	576	227	Form	form	uz	{"title": "E-mail", "value": null, "placeholder": "example@gmail.com"}	2026-02-25 10:35:32	2026-02-25 10:35:32
1846	576	227	Form	form	ru	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:35:32	2026-02-25 10:35:32
1847	576	227	Form	form	en	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:35:32	2026-02-25 10:35:32
1848	576	227	Form	form	\N	{"key": "email", "type": "email", "column": "4", "required": "1"}	2026-02-25 10:35:32	2026-02-25 10:35:32
1855	578	227	Form	form	en	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:36:08	2026-02-25 10:36:08
1509	479	478	Rahbar	rahbar-5	uz	{"title": "Aygul Bekimbetova Falzon", "description": "test 1"}	2026-02-20 11:38:06	2026-02-20 11:44:52
1510	479	478	Rahbar	rahbar-5	ru	{"title": "Друзья Узбекистана", "description": null}	2026-02-20 11:38:06	2026-02-20 11:44:52
1511	479	478	Rahbar	rahbar-5	en	{"title": "Friends of Uzbekistan", "description": "test 1"}	2026-02-20 11:38:06	2026-02-20 11:44:52
1512	479	478	Rahbar	rahbar-5	\N	{"email": "lesamisdouzbekistan", "phone": "test2"}	2026-02-20 11:38:06	2026-02-20 11:44:52
1563	497	19	tashkilotlar	tashkilot	\N	{"title": "American-Uzbekistan Association"}	2026-02-23 07:56:59	2026-02-23 07:57:17
1588	506	503	Tashkilot haqida	nomi-7	uz	{"title": "Mahalla USA", "description": "<p>Asosiy maqsadlari</p><ul><li>AQShda yashovchi o‘zbekistonliklar va Markaziy Osiyo diasporasini birlashtirish.</li><li>O‘zbek milliy qadriyatlari, madaniyati va an’analarini saqlash va rivojlantirish.</li><li>Vatandoshlarning yangi muhitga moslashishiga yordam berish hamda jamoaviy hamkorlikni kuchaytirish.</li></ul><p>Asosiy vazifalari</p><ul><li>Sport musobaqalari, ayniqsa futbol turnirlari orqali jamoani birlashtirish.</li><li>Ta’limiy va madaniy loyihalarni tashkil etish (masalan, o‘zbek tili maktablari va bolalar markazlari).</li><li>Xayriya va jamoat tadbirlarini o‘tkazish, yoshlarni faol hayot tarziga jalb qilish.</li></ul>"}	2026-02-24 04:19:59	2026-02-24 04:26:10
1589	506	503	Tashkilot haqida	nomi-7	ru	{"title": "Махалла США", "description": "<p>Основные цели</p><p>Объединение узбекистанцев и диаспоры Центральной Азии, проживающих в США.</p><p>Сохранение и развитие узбекских национальных ценностей, культуры и традиций.</p><p>Помощь соотечественникам в адаптации к новой среде и укрепление общественного сотрудничества.</p><p>Основные задачи</p><p>Объединение сообщества через спортивные мероприятия, особенно футбольные турниры.</p><p>Организация образовательных и культурных проектов (например, школы узбекского языка и детские центры).</p><p>Проведение благотворительных и общественных мероприятий, вовлечение молодежи в активный образ жизни.</p>"}	2026-02-24 04:19:59	2026-02-24 04:26:10
1590	506	503	Tashkilot haqida	nomi-7	en	{"title": "Mahalla USA19/", "description": "<p>Main Goals</p><p>To unite Uzbeks and the Central Asian diaspora living in the United States.</p><p>To preserve and promote Uzbek national values, culture, and traditions.</p><p>To help compatriots adapt to a new environment and strengthen community cooperation.</p><p>Main Tasks</p><p>Bringing the community together through sports events, especially football tournaments.</p><p>Organizing educational and cultural projects (such as Uzbek language schools and children’s centers).</p><p>Holding charity and community events and encouraging youth participation in an active lifestyle.</p>"}	2026-02-24 04:19:59	2026-02-24 04:26:10
1591	506	503	Tashkilot haqida	nomi-7	\N	{"boss_at": "19/07/2019", "date_at": "19/07/2019"}	2026-02-24 04:19:59	2026-02-24 04:26:10
1631	519	150	Video	video-15	uz	{"title": "Yurtdoshlarni qo’llash 2"}	2026-02-24 06:38:50	2026-02-24 06:38:50
1632	519	150	Video	video-15	ru	{"title": null}	2026-02-24 06:38:50	2026-02-24 06:38:50
1633	519	150	Video	video-15	en	{"title": null}	2026-02-24 06:38:50	2026-02-24 06:38:50
1634	519	150	Video	video-15	\N	{"date_at": "2025-06-01T13:30"}	2026-02-24 06:38:50	2026-02-24 06:38:50
1480	469	468	Rahbar	rahbar-5	uz	{"title": "Hagit Sofieva-Levieva", "description": null}	2026-02-20 05:31:51	2026-02-24 09:28:27
1724	545	\N	\N	\N	uz	{"title": "Fayl", "value": ".mp4, .jpg,.jpeg,.png,.pdf,.doc,.docx", "placeholder": "Video, rasm, hujjat, PDF, docx, excel va boshqalar"}	2026-02-25 06:10:28	2026-02-25 06:28:36
1666	530	\N	\N	\N	ru	{"desc": null, "title": null}	2026-02-25 04:52:31	2026-02-25 10:55:30
1725	545	\N	\N	\N	ru	{"title": null, "value": null, "placeholder": null}	2026-02-25 06:10:28	2026-02-25 06:28:36
1726	545	\N	\N	\N	en	{"title": null, "value": null, "placeholder": null}	2026-02-25 06:10:28	2026-02-25 06:28:36
1727	545	\N	\N	\N	\N	{"key": "image", "type": "file", "column": "12", "required": "1"}	2026-02-25 06:10:28	2026-02-25 06:28:36
1667	530	\N	\N	\N	en	{"desc": null, "title": null}	2026-02-25 04:52:31	2026-02-25 10:55:30
1748	551	148	Form	form	uz	{"title": "Istiqomat qilayotgan davlatingiz", "value": null, "placeholder": "Tanlang"}	2026-02-25 08:26:37	2026-02-25 08:26:37
1749	551	148	Form	form	ru	{"title": null, "value": null, "placeholder": null}	2026-02-25 08:26:37	2026-02-25 08:26:37
1750	551	148	Form	form	en	{"title": null, "value": null, "placeholder": null}	2026-02-25 08:26:37	2026-02-25 08:26:37
1751	551	148	Form	form	\N	{"key": "country", "type": "country", "column": "6", "required": "1"}	2026-02-25 08:26:37	2026-02-25 08:26:37
1665	530	\N	\N	\N	uz	{"desc": "<p>BREAK            THE            LAYOUT            WITH            MASSIVE            SPACING<span style=\\"font-size: 1rem; letter-spacing: 0.01rem;\\">BREAK            THE            LAYOUT            WITH            MASSIVE            SPACING</span><span style=\\"font-size: 1rem; letter-spacing: 0.01rem;\\">BREAK            THE            LAYOUT            WITH            MASSIVE            SPACING</span><span style=\\"font-size: 1rem; letter-spacing: 0.01rem;\\">BREAK            THE            LAYOUT            WITH            MASSIVE            SPACING</span><span style=\\"font-size: 1rem; letter-spacing: 0.01rem;\\">BREAK            THE            LAYOUT            WITH            MASSIVE            SPACING</span><span style=\\"font-size: 1rem; letter-spacing: 0.01rem;\\">BREAK            THE            LAYOUT            WITH            MASSIVE            SPACING</span><span style=\\"font-size: 1rem; letter-spacing: 0.01rem;\\">BREAK            THE            LAYOUT            WITH            MASSIVE            SPACING</span><span style=\\"font-size: 1rem; letter-spacing: 0.01rem;\\">BREAK            THE            LAYOUT            WITH            MASSIVE            SPACING</span><span style=\\"font-size: 1rem; letter-spacing: 0.01rem;\\">BREAK            THE            LAYOUT            WITH            MASSIVE            SPACING</span><span style=\\"font-size: 1rem; letter-spacing: 0.01rem;\\">BREAK            THE            LAYOUT            WITH            MASSIVE            SPACING</span><span style=\\"font-size: 1rem; letter-spacing: 0.01rem;\\">BREAK            THE            LAYOUT            WITH            MASSIVE            SPACING</span><span style=\\"font-size: 1rem; letter-spacing: 0.01rem;\\">BREAK            THE            LAYOUT            WITH            MASSIVE            SPACING</span><span style=\\"font-size: 1rem; letter-spacing: 0.01rem;\\">BREAK            THE            LAYOUT            WITH            MASSIVE            SPACING</span><span style=\\"font-size: 1rem; letter-spacing: 0.01rem;\\">BREAK            THE            LAYOUT            WITH            MASSIVE            SPACING</span><span style=\\"font-size: 1rem; letter-spacing: 0.01rem;\\">BREAK            THE            LAYOUT            WITH            MASSIVE            SPACING</span><span style=\\"font-size: 1rem; letter-spacing: 0.01rem;\\">BREAK            THE            LAYOUT            WITH            MASSIVE            SPACING</span><span style=\\"font-size: 1rem; letter-spacing: 0.01rem;\\">BREAK            THE            LAYOUT            WITH            MASSIVE            SPACING</span><span style=\\"font-size: 1rem; letter-spacing: 0.01rem;\\">BREAK            THE            LAYOUT            WITH            MASSIVE            SPACING</span></p>", "title": "testsdf"}	2026-02-25 04:52:31	2026-02-25 10:55:30
1856	578	227	Form	form	\N	{"key": "country", "type": "country", "column": "6", "required": "1"}	2026-02-25 10:36:08	2026-02-25 10:36:08
1857	579	227	Form	form	uz	{"title": "Shahar/tuman", "value": null, "placeholder": "Tanlang"}	2026-02-25 10:36:24	2026-02-25 10:36:24
1858	579	227	Form	form	ru	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:36:24	2026-02-25 10:36:24
1859	579	227	Form	form	en	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:36:24	2026-02-25 10:36:24
1860	579	227	Form	form	\N	{"key": "city", "type": "text", "column": "6", "required": "1"}	2026-02-25 10:36:24	2026-02-25 10:36:24
1861	580	227	Form	form	uz	{"title": "Ish joyi", "value": null, "placeholder": "Ma'lumot kiriting"}	2026-02-25 10:36:40	2026-02-25 10:36:40
1862	580	227	Form	form	ru	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:36:40	2026-02-25 10:36:40
1863	580	227	Form	form	en	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:36:40	2026-02-25 10:36:40
1864	580	227	Form	form	\N	{"key": "workplace", "type": "text", "column": "6", "required": "1"}	2026-02-25 10:36:40	2026-02-25 10:36:40
1865	581	227	Form	form	uz	{"title": "Lavozimi", "value": null, "placeholder": "Ma'lumot kiriting"}	2026-02-25 10:36:55	2026-02-25 10:36:55
1866	581	227	Form	form	ru	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:36:55	2026-02-25 10:36:55
1867	581	227	Form	form	en	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:36:55	2026-02-25 10:36:55
1868	581	227	Form	form	\N	{"key": "position", "type": "text", "column": "6", "required": "1"}	2026-02-25 10:36:55	2026-02-25 10:36:55
1869	582	227	Form	form	uz	{"title": "Ma'lumoti", "value": null, "placeholder": "Ma'lumot kiriting"}	2026-02-25 10:37:14	2026-02-25 10:37:14
1870	582	227	Form	form	ru	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:37:14	2026-02-25 10:37:14
1871	582	227	Form	form	en	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:37:14	2026-02-25 10:37:14
1872	582	227	Form	form	\N	{"key": "education", "type": "text", "column": "6", "required": "1"}	2026-02-25 10:37:14	2026-02-25 10:37:14
1873	583	227	Form	form	uz	{"title": "Mutaxassisligi", "value": null, "placeholder": "Mutaxassislikni kiriting"}	2026-02-25 10:37:34	2026-02-25 10:37:34
1874	583	227	Form	form	ru	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:37:34	2026-02-25 10:37:34
1875	583	227	Form	form	en	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:37:34	2026-02-25 10:37:34
1876	583	227	Form	form	\N	{"key": "job", "type": "text", "column": "6", "required": "1"}	2026-02-25 10:37:34	2026-02-25 10:37:34
1877	584	227	Form	form	uz	{"title": "Fayl", "value": ".mp4, .jpg,.jpeg,.png,.pdf,.doc,.docx", "placeholder": "Video, rasm, hujjat, PDF, docx, excel va boshqalar"}	2026-02-25 10:38:04	2026-02-25 10:38:04
1878	584	227	Form	form	ru	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:38:04	2026-02-25 10:38:04
1879	584	227	Form	form	en	{"title": null, "value": null, "placeholder": null}	2026-02-25 10:38:04	2026-02-25 10:38:04
1880	584	227	Form	form	\N	{"key": "image", "type": "file", "column": "12", "required": "1"}	2026-02-25 10:38:04	2026-02-25 10:38:04
1887	587	19	tashkilotlar	tashkilot	\N	{"title": "Uzbek Cultural Center of Virginia"}	2026-02-25 11:05:41	2026-02-25 11:05:41
1892	589	587	Tashkilot haqida	nomi-7	uz	{"title": "Virjiniyadagi O‘zbek Madaniyat Markazi", "description": "<p>Maqsadlar</p><ul><li>O‘zbekiston madaniyati, an’analari va san’atini Virginia va atrof hududlarda targ‘ib qilish.</li><li>Mahalliy o‘zbek diasporasini birlashtirish va o‘zaro hamkorlikni rivojlantirish.</li><li>Yoshlar va avlodlar o‘rtasida ona tilini saqlash va rivojlantirish.</li></ul><p>Vazifalar</p><ul><li>Madaniy tadbirlar, konsertlar, ko‘rgazmalar va festival tashkil etish.</li><li>Ta’lim va madaniy loyihalarni qo‘llab‑quvvatlash (ona tili kurslari, tarixiy va san’at dasturlari).</li><li>Jamiyat a’zolari o‘rtasida ijtimoiy va madaniy hamkorlikni rivojlantirish.</li><li>O‘zbekiston va Virginia hamda atrof hududlar o‘rtasida madaniy aloqalarni mustahkamlash.</li></ul>"}	2026-02-25 11:19:47	2026-02-25 11:19:47
1893	589	587	Tashkilot haqida	nomi-7	ru	{"title": "Узбекский культурный центр Вирджинии", "description": "<p>Цели</p><ul><li>Продвигать культуру, традиции и искусство Узбекистана в Вирджинии и соседних регионах.</li><li>Объединять местную узбекскую диаспору и развивать сотрудничество между её членами.</li><li>Сохранять и развивать родной язык среди молодежи и поколений.</li></ul><p>Задачи</p><ul><li>Организация культурных мероприятий, концертов, выставок и фестивалей.</li><li>Поддержка образовательных и культурных проектов (курсы родного языка, программы по истории и искусству).</li><li>Развитие социального и культурного сотрудничества среди членов сообщества.</li><li>Укрепление культурных связей между Узбекистаном и Вирджинией и соседними регионами.</li></ul>"}	2026-02-25 11:19:47	2026-02-25 11:19:47
1894	589	587	Tashkilot haqida	nomi-7	en	{"title": "Uzbek Cultural Center of Virginia", "description": "<p>Goals</p><ul><li>To promote Uzbekistan’s culture, traditions, and arts in Virginia and surrounding areas.</li><li>To unite the local Uzbek diaspora and foster cooperation among its members.</li><li>To preserve and develop the mother tongue among youth and future generations.</li></ul><p>Tasks</p><ul><li>Organizing cultural events, concerts, exhibitions, and festivals.</li><li>Supporting educational and cultural projects (mother tongue courses, history and arts programs).</li><li>Developing social and cultural cooperation among community members.</li><li>Strengthening cultural ties between Uzbekistan and Virginia and neighboring areas.</li></ul>"}	2026-02-25 11:19:47	2026-02-25 11:19:47
1895	589	587	Tashkilot haqida	nomi-7	\N	{"boss_at": "23/03/2023", "date_at": "23/03/2023"}	2026-02-25 11:19:47	2026-02-25 11:19:47
1896	590	587	Rahbar	rahbar-5	uz	{"title": "Burhon Nabiyev", "description": "Bosh direktor"}	2026-02-26 04:19:44	2026-02-26 04:20:44
1897	590	587	Rahbar	rahbar-5	ru	{"title": "Бурхон Набиев", "description": "Главный директор"}	2026-02-26 04:19:44	2026-02-26 04:20:44
1898	590	587	Rahbar	rahbar-5	en	{"title": "Burhon Nabiyev", "description": "Main Director"}	2026-02-26 04:19:44	2026-02-26 04:20:44
1899	590	587	Rahbar	rahbar-5	\N	{"email": "info_uccva@uccva.org", "phone": null}	2026-02-26 04:19:44	2026-02-26 04:20:44
1900	591	19	tashkilotlar	tashkilot	\N	{"title": "turan association"}	2026-02-26 04:21:30	2026-02-26 04:21:30
\.


--
-- Data for Name: page_sections; Type: TABLE DATA; Schema: public; Owner: vatandoshlar_usr
--

COPY public.page_sections (id, menu_main_id, sort_order, status, slug, category, category_slug, parent_id, created_at, updated_at, publish_at, modal_status) FROM stdin;
523	23	522	t	hamkor-uz-cincinnati-association	tashkilotlar	tashkilot	19	2026-02-24 10:50:32	2026-02-24 10:50:32	2026-02-24 00:00:00	\N
5	11	5	t	o-zbekiston-sirli-o-tmish-va-yorqin-kelajak-maskani	\N	\N	\N	2025-12-23 05:06:24	2025-12-23 05:06:24	\N	\N
6	12	6	t	forum-va-seminarlardan-video	\N	\N	\N	2025-12-23 05:07:48	2025-12-23 05:07:48	\N	\N
7	12	7	t	fotogalareya	\N	\N	\N	2025-12-23 05:08:27	2025-12-23 05:08:27	\N	\N
13	19	13	t	oliy-maqsadimiz-xorijdagi-vatandoshlarni-vatan-atrofida-birlashtirish-ularning-qalbi-va-ongida-yurtdan-faxrlanish-tuyg-usini-yuksaltirish-milliy-o-zlikni-asrashdir	\N	\N	\N	2025-12-23 05:30:06	2025-12-23 05:30:06	\N	\N
52	30	52	t	o-zbekiston-lahzalari	\N	\N	\N	2025-12-25 13:32:21	2026-02-14 16:22:26	2026-02-05 00:00:00	\N
3	3	3	t	elektron-kitoblar	\N	\N	\N	2025-12-23 04:45:52	2026-02-13 10:17:25	2026-02-13 00:00:00	\N
475	60	474	t	o-zbekiston-respublikasi-davlat-bayrog-i	\N	\N	\N	2026-02-20 08:34:21	2026-02-20 08:40:18	2026-02-20 00:00:00	\N
492	23	491	t	turkiston-amerika-assotsiatsiyasi	Tashkilot haqida	nomi-7	491	2026-02-23 07:25:35	2026-02-23 07:25:35	2026-02-23 00:00:00	\N
1	2	1	t	span-vatandoshlar-span-jamoat-fondi	\N	\N	\N	2025-12-23 04:43:11	2026-02-23 10:38:15	2026-01-21 00:00:00	\N
500	23	499	t	atlanta-uzbek-community	tashkilotlar	tashkilot	19	2026-02-23 09:31:05	2026-02-23 09:31:42	2026-02-23 00:00:00	\N
531	64	530	t	to-liq-ismingiz	\N	\N	\N	2026-02-25 05:57:19	2026-02-25 06:27:02	2026-02-25 00:00:00	\N
35	17	35	t		\N	\N	\N	2025-12-25 08:29:18	2025-12-25 08:29:18	\N	\N
12	18	12	t	fondning-ramzi	\N	\N	\N	2025-12-23 05:29:07	2025-12-25 08:31:46	\N	\N
540	64	539	t	ma-lumoti	\N	\N	\N	2026-02-25 06:07:03	2026-02-25 06:28:06	2026-02-25 00:00:00	\N
48	28	48	t	forum-va-seminarlardan-csfdgrthfyj	\N	\N	\N	2025-12-25 13:22:39	2025-12-25 13:22:39	\N	\N
50	29	50	t	o-zbekiston-sirli-o-tmish-va-yorqin-kelajak-maskanidfvhg	\N	\N	\N	2025-12-25 13:23:52	2025-12-25 13:23:52	\N	\N
51	29	51	t	fotogalareyacdvfghjkl-xcdsgrtyu7io	\N	\N	\N	2025-12-25 13:24:51	2025-12-25 13:24:51	\N	\N
14	14	14	t	sattarov-odiljon-berdimuratovich	\N	\N	\N	2025-12-23 05:32:28	2026-02-24 07:59:41	2026-02-13 00:00:00	\N
590	23	589	f	burhon-nabiyev	Rahbar	rahbar-5	587	2026-02-26 04:19:44	2026-02-26 04:20:44	2026-02-26 00:00:00	f
34	27	34	t	na-munali-yurtdoshlar	\N	\N	\N	2025-12-23 06:22:39	2026-01-14 11:30:41	2026-01-14 11:30:31	\N
71	33	71	t	toshkent-v	\N	\N	\N	2025-12-26 13:32:47	2026-02-14 17:03:23	2026-01-19 00:00:00	\N
74	33	74	t		video	video	60	2025-12-26 13:55:58	2026-02-14 20:46:56	2026-02-15 00:00:00	\N
73	33	73	t	toshkent-sh	\N	\N	\N	2025-12-26 13:33:53	2026-02-14 16:55:43	2026-01-19 00:00:00	\N
115	33	115	t		video	video-14	73	2025-12-26 14:36:11	2026-02-14 16:49:22	2026-02-14 00:00:00	\N
18	22	18	t		\N	\N	\N	2025-12-23 05:46:01	2026-01-20 06:39:23	2026-01-20 06:39:16	\N
15	14	15	t	sanayev-bolidin-elamonovich	\N	\N	\N	2025-12-23 05:33:13	2026-02-13 05:20:54	2026-02-13 00:00:00	\N
17	15	2	t	vatandoshlarning-huquq-va-erkinliklarini-himoya-qilishga-ko-maklashish	\N	\N	\N	2025-12-23 05:34:27	2026-02-13 05:40:26	2026-02-13 00:00:00	\N
56	24	38	t	video	\N	\N	\N	2025-12-26 06:41:10	2026-02-12 13:09:32	2026-01-19 00:00:00	\N
555	23	554	t	uzbek-cultural-center-of-new-england	tashkilotlar	tashkilot	19	2026-02-25 09:14:35	2026-02-25 09:14:35	2026-02-25 00:00:00	\N
4	4	4	f	vatandoshlar-jamoat-fondi	\N	\N	\N	2025-12-23 04:50:44	2026-02-02 18:43:36	2026-01-23 17:33:52	\N
58	30	58	t	salom-toshkent	Url	url	52	2025-12-26 11:10:39	2026-02-14 16:20:29	2026-01-22 00:00:00	\N
59	32	59	t	har-bir-manzil-yangi-bir-orzuss	\N	\N	\N	2025-12-26 13:16:46	2026-02-14 16:40:38	2026-02-14 00:00:00	\N
8	7	8	t	qadriyatlarimiz-bizni-birlashtiradi	\N	\N	\N	2025-12-23 05:10:29	2026-02-17 09:24:16	2026-02-14 00:00:00	\N
38	24	39	t	fondning-tashkil-topishi-haqida	\N	\N	\N	2025-12-25 08:48:32	2026-02-12 13:04:56	2026-01-19 00:00:00	\N
53	31	53	t	sirli-ozbekiston	\N	\N	\N	2025-12-25 13:35:56	2026-02-05 10:31:24	2026-02-05 00:00:00	\N
54	31	54	t	fotogalareya11	\N	\N	\N	2025-12-25 13:36:22	2026-02-05 10:33:31	2026-02-05 00:00:00	\N
2	3	2	t	qatnashgan-vatandoshlar-soni	\N	\N	\N	2025-12-23 04:45:01	2026-02-13 10:16:39	2026-01-22 00:00:00	\N
36	24	36	t	vatandoshlar	\N	\N	\N	2025-12-25 08:47:03	2026-02-12 12:34:06	2026-01-19 00:00:00	\N
19	23	19	t	aqsh	\N	\N	\N	2025-12-23 05:47:39	2026-02-06 07:32:56	2026-02-06 00:00:00	\N
37	24	37	t	fondning-ramzi1	\N	\N	\N	2025-12-25 08:48:11	2026-02-13 05:31:07	2026-01-19 00:00:00	\N
40	15	3	t	o-zbek-tili-madaniyati-va-an-analarini-saqlab-qolish-va-rivojlantirish	\N	\N	\N	2025-12-25 09:42:07	2026-02-13 05:40:51	2026-02-13 00:00:00	\N
43	16	43	t	vatandoshlar-jamoat-fondi-pul-mablag-ini-kimdan-oladi	\N	\N	\N	2025-12-25 09:50:30	2026-02-13 05:48:35	2026-01-23 00:00:00	\N
41	16	41	t	vatandosh-kim	\N	\N	\N	2025-12-25 09:49:29	2026-02-13 05:52:13	2026-02-13 00:00:00	\N
42	16	42	t	vatandoshlar-jamoat-fondi-qanday-tashkilot	\N	\N	\N	2025-12-25 09:50:10	2026-02-13 05:52:55	2026-02-13 00:00:00	\N
222	26	221	t	alisher-navoiy-tavalludining-585-yilligi-nishonlanmoqda	\N	\N	\N	2026-02-13 07:12:56	2026-02-13 07:12:56	2026-02-09 00:00:00	\N
224	26	223	t	hazrat-alisher-navoiy-tavalludining-585-yilligiga-bag-ishlangan-madaniy-ma-rifiy-tadbir-o-tkazildi	\N	\N	\N	2026-02-13 07:16:47	2026-02-13 07:16:47	2026-02-09 00:00:00	\N
9	9	9	t	moziydan-saboq-bugundan-yuksalish	\N	\N	\N	2025-12-23 05:11:35	2026-02-17 09:35:56	2026-01-22 00:00:00	\N
114	33	114	t		video	video-14	73	2025-12-26 14:35:56	2026-02-14 16:44:27	2026-02-14 00:00:00	\N
111	33	111	t		video	video-13	72	2025-12-26 14:34:51	2026-02-14 16:56:50	2026-02-14 00:00:00	\N
116	33	116	t		video	video-14	73	2025-12-26 14:36:27	2026-02-14 16:50:03	2026-02-14 00:00:00	\N
72	33	72	t	xorazm	\N	\N	\N	2025-12-26 13:33:21	2026-02-14 16:55:14	2026-01-17 00:00:00	\N
113	33	113	t		video	video-13	72	2025-12-26 14:35:23	2026-02-14 16:58:58	2026-02-14 00:00:00	\N
112	33	112	t		video	video-13	72	2025-12-26 14:35:10	2026-02-14 16:58:02	2026-02-14 00:00:00	\N
70	33	70	t	surxondaryo	\N	\N	\N	2025-12-26 13:32:12	2026-02-14 19:24:06	2026-02-15 00:00:00	\N
69	33	69	t	sirdaryo	\N	\N	\N	2025-12-26 13:31:46	2026-02-14 19:30:16	2026-02-15 00:00:00	\N
68	33	68	t	samarqand	\N	\N	\N	2025-12-26 13:31:14	2026-02-14 19:43:37	2026-02-15 00:00:00	\N
67	33	67	t	qashqadaryo	\N	\N	\N	2025-12-26 13:30:35	2026-02-14 19:49:45	2026-02-15 00:00:00	\N
66	33	66	t	navoiy	\N	\N	\N	2025-12-26 13:29:58	2026-02-14 19:55:12	2026-02-15 00:00:00	\N
93	33	93	t		video	video-7	66	2025-12-26 14:27:29	2026-02-14 19:55:50	2026-02-15 00:00:00	\N
94	33	94	t		video	video-7	66	2025-12-26 14:27:50	2026-02-14 19:56:32	2026-02-15 00:00:00	\N
95	33	95	t		video	video-7	66	2025-12-26 14:28:05	2026-02-14 19:57:26	2026-02-15 00:00:00	\N
89	33	66	t	namanganvs	\N	\N	\N	2025-12-26 14:25:11	2026-02-14 19:59:59	2026-02-15 00:00:00	\N
64	33	64	t	jizzax	\N	\N	\N	2025-12-26 13:28:53	2026-02-14 20:14:19	2026-02-15 00:00:00	\N
63	33	63	t	farg-ona	\N	\N	\N	2025-12-26 13:28:16	2026-02-14 20:22:01	2026-02-15 00:00:00	\N
61	33	61	t	andijon	\N	\N	\N	2025-12-26 13:25:28	2026-02-14 20:34:52	2026-02-15 00:00:00	\N
62	33	62	t	buxoro	\N	\N	\N	2025-12-26 13:26:58	2026-02-14 20:31:44	2026-02-15 00:00:00	\N
60	33	60	t	qoraqalpog-iston-respublikasi	\N	\N	\N	2025-12-26 13:22:38	2026-02-14 20:41:41	2026-01-17 00:00:00	\N
75	33	75	t		video	video	60	2025-12-26 13:56:16	2026-02-14 20:47:35	2026-02-15 00:00:00	\N
76	33	76	t		video	video	60	2025-12-26 13:56:35	2026-02-14 20:48:14	2026-02-15 00:00:00	\N
493	23	492	t	abdullah-kwaja	Rahbar	rahbar-5	491	2026-02-23 07:36:08	2026-02-24 09:28:11	2026-02-23 00:00:00	\N
458	23	457	t	sadikov-baxodir-talibjonovich	Rahbar	rahbar-5	232	2026-02-19 11:23:35	2026-02-24 09:28:40	2026-02-19 00:00:00	\N
524	23	523	t	hamkor-uz-cincinnati-assotsiatsiyasi	Tashkilot haqida	nomi-7	523	2026-02-24 10:55:14	2026-02-24 10:55:14	2026-02-24 00:00:00	\N
532	64	531	t	tug-ilgan-sana	\N	\N	\N	2026-02-25 05:58:08	2026-02-25 06:27:16	2026-02-25 00:00:00	\N
173	45	173	f	mbh0223	\N	\N	\N	2026-01-05 07:22:35	2026-02-03 19:12:01	\N	\N
132	40	132	t	chinor	\N	\N	\N	2025-12-29 12:30:29	2025-12-29 12:30:29	\N	\N
133	40	133	t	malaka-oshirish	\N	\N	\N	2025-12-29 12:31:16	2025-12-29 12:31:16	\N	\N
134	40	134	t	maktab-loyihasi	\N	\N	\N	2025-12-29 12:31:57	2025-12-29 12:31:57	\N	\N
135	41	135	t	2023-yil	\N	\N	\N	2025-12-29 12:34:27	2025-12-29 12:39:21	\N	\N
139	41	139	t	2024-yil	\N	\N	\N	2025-12-29 12:44:36	2025-12-29 12:44:36	\N	\N
131	40	131	t	anor-tanlovi	\N	\N	\N	2025-12-29 12:29:53	2025-12-29 12:47:40	\N	\N
143	42	143	t		\N	\N	\N	2025-12-30 07:36:01	2025-12-30 07:36:01	\N	\N
172	45	172	f	man	\N	\N	\N	2026-01-05 07:14:23	2026-02-03 19:12:01	\N	\N
587	23	586	t	uzbek-cultural-center-of-virginia	tashkilotlar	tashkilot	19	2026-02-25 11:05:41	2026-02-25 11:05:41	2026-02-25 00:00:00	f
541	64	540	t	mutaxassisligi	\N	\N	\N	2026-02-25 06:07:31	2026-02-25 06:28:12	2026-02-25 00:00:00	\N
591	23	590	t	turan-association	tashkilotlar	tashkilot	19	2026-02-26 04:21:30	2026-02-26 04:21:30	2026-02-26 00:00:00	f
556	23	555	t	shimoliy-angliyadagi-o-zbek-madaniyat-markazi	Tashkilot haqida	nomi-7	555	2026-02-25 09:22:18	2026-02-25 09:22:18	2026-02-25 00:00:00	\N
170	45	170	f	bersz	\N	\N	\N	2026-01-05 07:12:23	2026-02-03 19:12:03	\N	\N
169	45	169	f	mustafo	\N	\N	\N	2026-01-05 07:10:54	2026-02-03 19:12:03	\N	\N
167	45	167	f	jahongir	\N	\N	\N	2026-01-05 07:09:42	2026-02-03 19:12:04	\N	\N
168	45	168	f	murod	\N	\N	\N	2026-01-05 07:10:19	2026-02-03 19:12:06	\N	\N
467	23	466	t	zamira-artikova	Rahbar	rahbar-5	465	2026-02-20 04:52:53	2026-02-20 04:53:28	2026-02-20 00:00:00	\N
476	61	475	t	o-zbekiston-respublikasi-davlat-gerbi	\N	\N	\N	2026-02-20 08:43:24	2026-02-20 09:11:54	2026-02-20 00:00:00	\N
501	23	500	t	atlantadagi-o-zbek-jamiyati	Tashkilot haqida	nomi-7	500	2026-02-23 09:38:22	2026-02-23 09:38:22	2026-02-23 00:00:00	\N
161	46	161	t	vatandoshlar-elektron-gazetasining-1-soni	\N	\N	\N	2026-01-05 04:59:44	2026-02-23 09:56:59	2026-02-23 00:00:00	\N
162	46	162	t	vatandoshlar-elektron-gazetasining-2-soni	\N	\N	\N	2026-01-05 05:00:18	2026-02-23 09:56:53	2026-02-23 00:00:00	\N
513	23	512	t	yurtdosh-uzbek-american-association	tashkilotlar	tashkilot	19	2026-02-24 05:28:11	2026-02-24 05:28:11	2026-02-24 00:00:00	\N
166	45	166	f	biz-barcha-vatandoshlarni-birlashtirib-ularga-kerakli-mativatsiyacc	\N	\N	\N	2026-01-05 05:39:36	2026-02-03 19:12:06	\N	\N
216	26	215	t	memorandum-qog-ozda-qolmay-sahnada-o-zini-ko-rsatmoqda	\N	\N	\N	2026-02-05 12:06:56	2026-02-06 07:21:05	2026-02-05 00:00:00	\N
171	45	171	f	forum-va-seminarlardan-videodd	\N	\N	\N	2026-01-05 07:13:02	2026-02-06 06:40:22	2026-02-06 00:00:00	\N
165	45	165	f	transfor	\N	\N	\N	2026-01-05 05:39:04	2026-02-06 06:41:40	2026-02-06 00:00:00	\N
39	24	40	t	oliy-maqsadimiz-xorijdagi-vatandoshlarni-vatan-atrofida-birlashtirish-ularning-qalbi-va-ongida-yurtdan-faxrlanish-tuyg-usini-yuksaltirish-milliy-o-zlikni-asrashdirv	\N	\N	\N	2025-12-25 08:50:21	2026-02-12 13:01:40	2026-02-12 00:00:00	\N
220	26	219	t	qirg-iziston-respublikasi-o-sh-shahrida-buyuk-mutafakkir-shoir-va-davlat-arbobi-hazrat-alisher-navoiy-tavalludining-585-yilligi-keng-nishonlandi	\N	\N	\N	2026-02-13 07:08:59	2026-02-13 07:09:39	2026-02-09 00:00:00	\N
218	58	217	f	fond-tuzilmasi	\N	\N	\N	2026-02-13 06:10:45	2026-02-13 06:18:44	2026-02-13 00:00:00	\N
174	3	174	t	adabiyotlar	\N	\N	\N	2026-01-05 08:15:32	2026-02-13 10:17:59	2026-02-13 00:00:00	\N
175	3	175	t	milliy-atributlar	\N	\N	\N	2026-01-05 08:16:14	2026-02-13 10:20:01	2026-02-13 00:00:00	\N
176	3	176	t	o-tkazilgan-tadbirlar	\N	\N	\N	2026-01-05 08:17:25	2026-02-13 10:20:31	2026-02-13 00:00:00	\N
108	33	108	t		video	video-12	71	2025-12-26 14:33:17	2026-02-14 19:16:18	2026-02-15 00:00:00	\N
109	33	109	t		video	video-12	71	2025-12-26 14:33:35	2026-02-14 19:19:14	2026-02-15 00:00:00	\N
105	33	105	t		video	video-11	70	2025-12-26 14:32:13	2026-02-14 19:24:34	2026-02-15 00:00:00	\N
106	33	106	t		video	video-11	70	2025-12-26 14:32:30	2026-02-14 19:25:16	2026-02-15 00:00:00	\N
107	33	107	t		video	video-11	70	2025-12-26 14:32:43	2026-02-14 19:27:09	2026-02-15 00:00:00	\N
102	33	102	t		video	video-10	69	2025-12-26 14:30:52	2026-02-14 19:30:40	2026-02-15 00:00:00	\N
104	33	104	t		video	video-10	69	2025-12-26 14:31:24	2026-02-14 19:36:58	2026-02-15 00:00:00	\N
103	33	103	t		video	video-10	69	2025-12-26 14:31:09	2026-02-14 19:36:27	2026-02-15 00:00:00	\N
99	33	99	t		video	video-9	68	2025-12-26 14:29:51	2026-02-14 19:44:20	2026-02-15 00:00:00	\N
100	33	100	t		video	video-9	68	2025-12-26 14:30:05	2026-02-14 19:45:19	2026-02-15 00:00:00	\N
101	33	101	t		video	video-9	68	2025-12-26 14:30:18	2026-02-14 19:46:33	2026-02-15 00:00:00	\N
96	33	96	t		video	video-8	67	2025-12-26 14:28:39	2026-02-14 19:50:31	2026-02-15 00:00:00	\N
97	33	97	t		video	video-8	67	2025-12-26 14:28:53	2026-02-14 19:51:20	2026-02-15 00:00:00	\N
98	33	98	t		video	video-8	67	2025-12-26 14:29:06	2026-02-14 19:52:14	2026-02-15 00:00:00	\N
90	33	90	t		video	video-6	89	2025-12-26 14:26:17	2026-02-14 20:05:07	2026-02-15 00:00:00	\N
91	33	91	t		video	video-6	89	2025-12-26 14:26:32	2026-02-14 20:06:34	2026-02-15 00:00:00	\N
92	33	92	t		video	video-6	89	2025-12-26 14:26:48	2026-02-14 20:09:21	2026-02-15 00:00:00	\N
86	33	86	t		video	video-4	64	2025-12-26 14:20:10	2026-02-14 20:16:42	2026-02-15 00:00:00	\N
87	33	87	t		video	video-4	64	2025-12-26 14:20:28	2026-02-14 20:18:00	2026-02-15 00:00:00	\N
88	33	88	t		video	video-4	64	2025-12-26 14:20:46	2026-02-14 20:19:05	2026-02-15 00:00:00	\N
83	33	83	t		video	video-3	63	2025-12-26 14:18:56	2026-02-14 20:23:00	2026-02-15 00:00:00	\N
84	33	84	t		video	video-3	63	2025-12-26 14:19:13	2026-02-14 20:23:41	2026-02-15 00:00:00	\N
85	33	85	t		video	video-3	63	2025-12-26 14:19:30	2026-02-14 20:25:34	2026-02-15 00:00:00	\N
80	33	80	t		video	video-2	62	2025-12-26 14:17:34	2026-02-14 20:29:45	2026-02-15 00:00:00	\N
81	33	81	t		video	video-2	62	2025-12-26 14:17:51	2026-02-14 20:30:47	2026-02-15 00:00:00	\N
82	33	82	t		video	video-2	62	2025-12-26 14:18:09	2026-02-14 20:31:27	2026-02-15 00:00:00	\N
77	33	77	t		video	video-1	61	2025-12-26 13:57:36	2026-02-14 20:35:53	2026-02-15 00:00:00	\N
78	33	78	t		video	video-1	61	2025-12-26 13:57:53	2026-02-14 20:37:26	2026-02-15 00:00:00	\N
79	33	79	t		video	video-1	61	2025-12-26 13:58:11	2026-02-14 20:38:48	2026-02-15 00:00:00	\N
110	33	110	t		video	video-12	71	2025-12-26 14:33:48	2026-02-15 15:36:16	2026-02-15 00:00:00	\N
120	35	120	t	vatandoshlar-fondi	\N	\N	\N	2025-12-27 19:14:10	2026-02-24 11:09:07	2026-01-17 00:00:00	\N
190	47	1	t	o-zbek-tilini-onlayn-o-rganish-platformasi	\N	\N	\N	2026-01-19 16:38:51	2026-02-20 05:55:34	2026-01-19 00:00:00	\N
213	53	212	t	ikkinchi-guruh	\N	\N	\N	2026-01-22 10:22:59	2026-02-06 06:46:10	2026-01-22 00:00:00	\N
221	26	220	t	hazrat-alisher-navoiy-tavalludining-585-yilligi-munosabati-bilan-qator-ma-naviy-ma-rifiy-tadbirlar-tashkil-etildi	\N	\N	\N	2026-02-13 07:11:08	2026-02-13 07:11:32	2026-02-09 00:00:00	\N
188	44	188	t	google-map	\N	\N	\N	2026-01-15 14:30:30	2026-01-15 14:33:02	2026-01-15 14:29:15	\N
209	52	1	t	germaniyadagi-o-zbek-energetigi	\N	\N	\N	2026-01-21 18:38:13	2026-02-13 10:08:48	2026-01-21 00:00:00	\N
227	38	226	t	alisher-navoiy	\N	\N	\N	2026-02-13 09:12:41	2026-02-25 12:40:43	2026-02-13 00:00:00	f
231	23	230	t	fransiya	\N	\N	\N	2026-02-18 04:50:14	2026-02-18 04:53:52	2026-02-18 00:00:00	\N
477	62	476	t	o-zbekiston-respublikasining-davlat-madhiyasi	\N	\N	\N	2026-02-20 08:57:36	2026-02-20 09:05:29	2026-02-20 00:00:00	\N
223	26	222	t	ashxobod-shahrida-buyuk-mutafakkir-va-shoirlar-alisher-navoiy-hamda-zahiriddin-muhammad-bobur-tavalludiga-bag-ishlangan-ma-naviy-ma-rifiy-tadbir-o-tkazildi	\N	\N	\N	2026-02-13 07:14:31	2026-02-13 07:14:31	2026-02-09 00:00:00	\N
191	50	1	t	mutoola1	\N	\N	\N	2026-01-19 17:46:56	2026-01-19 17:47:41	2026-01-19 17:46:43	\N
192	50	1	t	mutoola2	\N	\N	\N	2026-01-19 17:48:02	2026-01-19 17:48:02	2026-01-19 17:47:43	\N
193	50	1	t	mutoola3	\N	\N	\N	2026-01-19 17:48:22	2026-01-19 17:48:22	2026-01-19 17:48:06	\N
225	26	224	t	chimkent-shahrida-vatandoshlar-jamoat-fondi-tashabbusi-bilan-g-azal-mulkining-sultoni-mir-alisher-navoiy-xotirasiga-bag-ishlangan-qator-ma-naviy-ma-rifiy-tadbirlar-o-tkazildi	\N	\N	\N	2026-02-13 07:23:54	2026-02-13 07:23:54	2026-02-11 00:00:00	\N
206	52	1	t	pumadagi-vatandosh	\N	\N	\N	2026-01-21 18:35:24	2026-02-13 10:09:02	2026-01-21 00:00:00	\N
212	53	211	t	birinchi-guruh	\N	\N	\N	2026-01-22 10:20:38	2026-02-06 06:52:33	2026-01-22 00:00:00	\N
525	59	524	t	https-uz-wikipedia-org-wiki-shanxay_hamkorlik_tashkiloti	\N	\N	\N	2026-02-24 12:18:42	2026-02-24 12:18:42	2026-02-24 00:00:00	\N
468	23	467	t	congress-of-bukharian-jews-in-the-united-states-and-canada	tashkilot	tashkilot	19	2026-02-20 05:15:56	2026-02-23 05:25:35	2026-02-20 00:00:00	\N
217	26	216	t	14-yanvar-vatan-himoyachilari-kuni-munosabati-bilan-chin-qalbdan-muborakbod-etamiz	\N	\N	\N	2026-02-05 12:10:24	2026-02-05 12:10:24	2026-01-14 00:00:00	\N
203	15	12	t	vatandoshlarni-o-zbekiston-hududida-tadbirkorlik-investitsiyaviy-ilmiy-madaniy-va-ma-rifiy-faoliyat-bilan-shug-ullanishga-faol-jalb-qilish	\N	\N	\N	2026-01-21 06:36:32	2026-02-13 05:36:20	2026-01-21 00:00:00	\N
164	45	164	f	tt	\N	\N	\N	2026-01-05 05:37:55	2026-02-06 06:41:06	2026-02-06 00:00:00	\N
16	15	1	t	jamoat-birlashmalari-bilan-hamkorlik-aloqalarini-yo-lga-qo-yish-va-rivojlantirish	\N	\N	\N	2025-12-23 05:34:07	2026-02-13 05:39:50	2026-02-13 00:00:00	\N
195	15	4	t	yurtimizning-boy-ilmiy-madaniy-va-ma-naviy-merosini-keng-targ-ib-qilish	\N	\N	\N	2026-01-21 06:32:49	2026-02-13 05:41:25	2026-01-21 00:00:00	\N
494	23	493	t	uzbek-american-association-of-florida	tashkilotlar	tashkilot	19	2026-02-23 07:41:09	2026-02-23 07:47:18	2026-02-23 00:00:00	\N
196	15	5	t	migratsiya-va-ta-lim-sohalarida-shartnomaviy-huquqiy-hamkorlikni-kengaytirish	\N	\N	\N	2026-01-21 06:33:14	2026-02-13 05:42:05	2026-01-21 00:00:00	\N
197	15	6	t	murakkab-hayotiy-vaziyatga-tushib-qolgan-vatandoshlarni-ijtimoiy-qo-llab-quvvatlash-va-huquqiy-yordam-ko-rsatishga-ko-maklashish	\N	\N	\N	2026-01-21 06:33:41	2026-02-13 05:42:49	2026-01-21 00:00:00	\N
198	15	7	t	vatandoshlar-tomonidan-tashkil-etilgan-jamoat-birlashmalari-faoliyatini-rag-batlantirish	\N	\N	\N	2026-01-21 06:34:12	2026-02-13 05:43:35	2026-01-21 00:00:00	\N
199	15	8	t	xorijda-o-zbek-milliy-madaniy-markazlarini-tashkil-etishda-amaliy-yordam-ko-rsatish	\N	\N	\N	2026-01-21 06:34:48	2026-02-13 05:44:07	2026-01-21 00:00:00	\N
200	15	9	t	vatandoshlarga-madaniy-ma-rifiy-tadbirlarni-tashkil-etishda-ko-maklashish	\N	\N	\N	2026-01-21 06:35:22	2026-02-13 05:44:37	2026-01-21 00:00:00	\N
201	15	10	t	vatandoshlarimizni-respublika-oliy-ta-lim-muassasalarida-o-zbek-tili-yo-nalishi-bo-yicha-ta-lim-olishlariga-ko-mak-ko-rsatish	\N	\N	\N	2026-01-21 06:35:47	2026-02-13 05:45:07	2026-01-21 00:00:00	\N
202	15	11	t	vatandoshlarimizni-yurtimiz-nufuzini-oshirishga-qaratilgan-ilmiy-ijodiy-izlanishlarini-qo-llab-quvvatlash	\N	\N	\N	2026-01-21 06:36:09	2026-02-13 05:45:48	2026-01-21 00:00:00	\N
232	23	231	t	uzbek-association-of-pittsburgh	tashkilot	tashkilot	19	2026-02-18 04:58:39	2026-02-23 07:54:59	2026-02-18 00:00:00	\N
226	26	225	t	bokuda-alisher-navoiyning-585-yilligi-keng-nishonlandi	\N	\N	\N	2026-02-13 07:29:52	2026-02-13 07:30:35	2026-02-11 00:00:00	\N
219	26	218	t	kuala-lumpur-shahrida-buyuk-mutafakkir-shoir	\N	\N	\N	2026-02-13 07:05:44	2026-02-13 07:06:51	2026-02-09 00:00:00	\N
163	46	163	t	vatandoshlar-elektron-gazetasining-3-soni	\N	\N	\N	2026-01-05 05:00:57	2026-02-23 10:21:53	2026-02-23 00:00:00	\N
177	3	177	t	ko-ngillilar	\N	\N	\N	2026-01-05 08:17:42	2026-02-13 10:21:04	2026-02-13 00:00:00	\N
502	23	501	t	jay-hadjaev	Rahbar	rahbar-5	500	2026-02-23 12:17:35	2026-02-23 12:23:17	2026-02-23 00:00:00	\N
194	47	2	t	o-zbek-tilini-o-rganish-mobil-ilovasini-yuklab-oling	\N	\N	\N	2026-01-20 06:40:04	2026-02-13 10:27:07	2026-01-20 00:00:00	\N
187	27	187	t	text	\N	\N	\N	2026-01-14 17:15:56	2026-01-22 09:24:10	2026-01-14 17:15:40	\N
234	23	233	t	germaniya	\N	\N	\N	2026-02-18 05:15:43	2026-02-18 05:15:43	2026-02-18 00:00:00	\N
208	52	1	t	garvardagi-vatandosh	\N	\N	\N	2026-01-21 18:37:10	2026-02-13 09:49:11	2026-01-21 00:00:00	\N
207	52	1	t	xorijdagi-ustozlar	\N	\N	\N	2026-01-21 18:36:02	2026-02-13 09:50:52	2026-01-21 00:00:00	\N
205	51	1	t	span-mutolaa-span-eng-sara-audio-va-elektron-kitoblar	\N	\N	\N	2026-01-21 12:01:01	2026-02-13 11:02:41	2026-01-21 00:00:00	\N
233	23	232	t	Canada	\N	\N	\N	2026-02-18 05:13:31	2026-02-18 05:16:14	2026-02-18 00:00:00	\N
235	23	234	t	Denmark	\N	\N	\N	2026-02-18 05:18:59	2026-02-18 05:18:59	2026-02-18 00:00:00	\N
236	23	235	t	Italy	\N	\N	\N	2026-02-18 05:22:03	2026-02-18 05:22:03	2026-02-18 00:00:00	\N
229	30	228	t	o-zbekiston	\N	\N	\N	2026-02-14 16:19:36	2026-02-14 16:20:10	2026-02-14 00:00:00	\N
228	30	227	t	yosh-kinematografchilar	Url	url	52	2026-02-14 16:18:04	2026-02-14 16:20:59	2026-02-14 00:00:00	\N
230	33	229	t		video	video-10	69	2026-02-14 19:38:59	2026-02-14 19:38:59	2026-02-15 00:00:00	\N
237	23	236	t	Finland	\N	\N	\N	2026-02-18 05:23:52	2026-02-18 05:23:52	2026-02-18 00:00:00	\N
238	23	237	t	Czech-Republic	\N	\N	\N	2026-02-18 05:25:38	2026-02-18 05:25:38	2026-02-18 00:00:00	\N
240	23	239	t	Luxembourg	\N	\N	\N	2026-02-18 05:34:42	2026-02-18 05:34:42	2026-02-18 00:00:00	\N
241	23	240	t	niderlandiya	\N	\N	\N	2026-02-18 05:35:48	2026-02-18 05:35:48	2026-02-18 00:00:00	\N
242	23	241	t	portugaliya	\N	\N	\N	2026-02-18 05:37:21	2026-02-18 05:37:21	2026-02-18 00:00:00	\N
243	23	242	t	latviya	\N	\N	\N	2026-02-18 05:38:45	2026-02-18 05:38:45	2026-02-18 00:00:00	\N
246	23	245	t	turkiya	\N	\N	\N	2026-02-18 05:53:53	2026-02-18 05:53:53	2026-02-18 00:00:00	\N
244	23	243	t	litva	\N	\N	\N	2026-02-18 05:40:38	2026-02-18 05:48:30	2026-02-18 00:00:00	\N
247	23	246	t	janubiy-koreya	\N	\N	\N	2026-02-18 06:00:01	2026-02-18 06:00:01	2026-02-18 00:00:00	\N
248	23	247	t	yaponiya	\N	\N	\N	2026-02-18 06:01:03	2026-02-18 06:01:03	2026-02-18 00:00:00	\N
239	23	238	t	shvetsiya	\N	\N	\N	2026-02-18 05:27:03	2026-02-18 09:17:16	2026-02-18 00:00:00	\N
456	23	455	t	buyuk-britaniya	\N	\N	\N	2026-02-19 04:50:51	2026-02-19 04:50:51	2026-02-19 00:00:00	\N
507	23	506	t	abdumalik-ahmedov	Rahbar	rahbar-5	503	2026-02-24 04:23:46	2026-02-24 09:27:34	2026-02-24 00:00:00	\N
469	23	468	t	hagit-sofieva-levieva	Rahbar	rahbar-5	468	2026-02-20 05:31:51	2026-02-24 09:28:27	2026-02-20 00:00:00	\N
256	59	255	t	uzreport-tv	\N	\N	\N	2026-02-18 06:53:56	2026-02-24 12:18:51	2026-02-18 00:00:00	\N
478	23	477	t	les-amis-d-ouzb-kistan	tashkilotlar	tashkilot	231	2026-02-20 11:36:02	2026-02-20 11:36:02	2026-02-20 00:00:00	\N
589	23	588	t	virjiniyadagi-o-zbek-madaniyat-markazi-1305	Tashkilot haqida	nomi-7	587	2026-02-25 11:19:47	2026-02-25 11:19:47	2026-02-25 00:00:00	f
495	23	494	t	floridadagi-o-zbek-amerika-assotsiatsiyasi	Tashkilot haqida	nomi-7	494	2026-02-23 07:45:23	2026-02-23 07:46:40	2026-02-23 00:00:00	\N
503	23	502	t	mahalla-usa	tashkilotlar	tashkilot	19	2026-02-23 12:26:08	2026-02-23 12:26:08	2026-02-23 00:00:00	\N
515	23	514	t	ziyamov-sharofiddin-xusnitdinovich	Rahbar	rahbar-5	513	2026-02-24 06:05:35	2026-02-24 09:27:16	2026-02-24 00:00:00	\N
542	64	541	t	telegram	\N	\N	\N	2026-02-25 06:08:06	2026-02-25 06:28:19	2026-02-25 00:00:00	\N
534	64	533	t	e-mail	\N	\N	\N	2026-02-25 06:00:00	2026-02-25 07:12:31	2026-02-25 00:00:00	\N
557	23	556	t	maksudov-ilkhom-alizhonovich	Rahbar	rahbar-5	555	2026-02-25 09:32:58	2026-02-25 09:32:58	2026-02-25 00:00:00	\N
520	38	519	t	2026-yilgi-mavsum	Yillar	yillar-1	227	2026-02-24 08:16:30	2026-02-25 12:40:43	2026-02-24 00:00:00	f
547	38	546	t	tug-ilgan-sana-723	Form	form	148	2026-02-25 08:24:20	2026-02-25 12:40:43	2026-02-25 00:00:00	f
548	38	547	t	jinsi-554	Form	form	148	2026-02-25 08:24:54	2026-02-25 12:40:43	2026-02-25 00:00:00	f
559	38	558	t	tug-ilgan-sana-1107	Form	form	156	2026-02-25 10:24:09	2026-02-25 12:40:43	2026-02-25 00:00:00	f
566	38	565	t	lavozimi-956	Form	form	156	2026-02-25 10:31:18	2026-02-25 12:40:43	2026-02-25 00:00:00	f
573	38	572	t	to-liq-ismingiz-1321	Form	form	227	2026-02-25 10:34:33	2026-02-25 12:40:43	2026-02-25 00:00:00	f
580	38	579	t	ish-joyi-837	Form	form	227	2026-02-25 10:36:40	2026-02-25 12:40:43	2026-02-25 00:00:00	f
521	38	520	t	video-983	Video	video-15	520	2026-02-24 08:23:56	2026-02-25 12:40:43	2026-02-24 00:00:00	f
150	38	150	t	2025-yilgi-mavsum	Yillar	yillar-1	148	2025-12-30 16:47:11	2026-02-25 12:40:43	2026-02-24 00:00:00	f
156	38	156	t	chinor-loyihasi	\N	\N	\N	2025-12-31 01:02:51	2026-02-25 12:40:43	2026-01-19 00:00:00	f
522	38	521	t		Yillar	yillar-1	156	2026-02-24 08:39:03	2026-02-25 12:40:43	2026-02-24 00:00:00	f
549	38	548	t	e-mail-1108	Form	form	148	2026-02-25 08:25:39	2026-02-25 12:40:43	2026-02-25 00:00:00	f
560	38	559	t	jinsi-1905	Form	form	156	2026-02-25 10:24:43	2026-02-25 12:40:43	2026-02-25 00:00:00	f
567	38	566	t	ma-lumoti-1711	Form	form	156	2026-02-25 10:31:34	2026-02-25 12:40:43	2026-02-25 00:00:00	f
470	23	469	t	friendship-association-of-nagoya-and-uzbekistan	tashkilot	tashkilot	248	2026-02-20 05:51:40	2026-02-20 06:16:17	2026-02-20 00:00:00	\N
257	59	256	t	o-zbekiston-yozuvchilari-uyushmasi	\N	\N	\N	2026-02-18 06:54:50	2026-02-24 12:19:03	2026-02-18 00:00:00	\N
526	59	525	t	https-gov-uz-oz-mfa	\N	\N	\N	2026-02-24 12:32:56	2026-02-24 12:32:56	2026-02-24 00:00:00	\N
479	23	478	t	aygul-bekimbetova-falzon	Rahbar	rahbar-5	478	2026-02-20 11:38:06	2026-02-20 11:44:52	2026-02-20 00:00:00	\N
514	23	513	t	yurtdosh-o-zbek-amerika-assotsiatsiyasi	Tashkilot haqida	nomi-7	513	2026-02-24 05:59:33	2026-02-24 06:05:58	2026-02-24 00:00:00	\N
543	64	542	t	instagram	\N	\N	\N	2026-02-25 06:08:31	2026-02-25 06:28:23	2026-02-25 00:00:00	\N
535	64	534	t	telefon-raqamingiz	\N	\N	\N	2026-02-25 06:00:51	2026-02-25 07:13:10	2026-02-25 00:00:00	\N
574	38	573	t	tug-ilgan-sana-9	Form	form	227	2026-02-25 10:34:50	2026-02-25 12:40:43	2026-02-25 00:00:00	f
581	38	580	t	lavozimi-1801	Form	form	227	2026-02-25 10:36:55	2026-02-25 12:40:43	2026-02-25 00:00:00	f
508	38	507	t	yurtdoshlarni-qo-llash-1	Video	video-15	150	2026-02-24 04:47:30	2026-02-25 12:40:43	2026-02-24 00:00:00	f
550	38	549	t	telefon-raqamingiz-1209	Form	form	148	2026-02-25 08:26:02	2026-02-25 12:40:43	2026-02-25 00:00:00	f
561	38	560	t	e-mail-1524	Form	form	156	2026-02-25 10:25:02	2026-02-25 12:40:43	2026-02-25 00:00:00	f
568	38	567	t	mutaxassisligi-1766	Form	form	156	2026-02-25 10:31:51	2026-02-25 12:40:43	2026-02-25 00:00:00	f
575	38	574	t	jinsi-1027	Form	form	227	2026-02-25 10:35:14	2026-02-25 12:40:43	2026-02-25 00:00:00	f
582	38	581	t	ma-lumoti-1162	Form	form	227	2026-02-25 10:37:14	2026-02-25 12:40:43	2026-02-25 00:00:00	f
148	38	148	t	anor	\N	\N	\N	2025-12-30 16:43:36	2026-02-25 12:40:43	2026-01-14 00:00:00	t
258	23	257	t	ukraina	\N	\N	\N	2026-02-18 06:59:14	2026-02-18 07:01:43	2026-02-18 00:00:00	\N
245	23	244	t	estoniya	\N	\N	\N	2026-02-18 05:49:32	2026-02-18 07:11:29	2026-02-18 00:00:00	\N
259	23	258	t	qozog-iston	\N	\N	\N	2026-02-18 07:12:03	2026-02-18 07:16:35	2026-02-18 00:00:00	\N
260	23	259	t	qirg-iziston	\N	\N	\N	2026-02-18 07:16:19	2026-02-18 07:17:18	2026-02-18 00:00:00	\N
261	23	260	t	tojikiston	\N	\N	\N	2026-02-18 07:18:26	2026-02-18 07:18:55	2026-02-18 00:00:00	\N
527	59	526	t	https-gov-uz-oz-icc	\N	\N	\N	2026-02-24 12:36:50	2026-02-24 12:36:50	2026-02-24 00:00:00	\N
536	64	535	t	istiqomat-qilayotgan-davlatingiz	\N	\N	\N	2026-02-25 06:01:38	2026-02-25 06:27:32	2026-02-25 00:00:00	\N
471	23	470	t	mirjalol-mengboev4	Rahbar	rahbar-5	470	2026-02-20 05:58:00	2026-02-20 07:12:47	2026-02-20 00:00:00	\N
544	64	543	t	whatsapp	\N	\N	\N	2026-02-25 06:08:57	2026-02-25 07:36:28	2026-02-25 00:00:00	\N
480	23	479	t	friends-of-uzbekistan	Tashkilot haqida	nomi-7	478	2026-02-20 11:39:10	2026-02-20 11:44:11	2026-02-20 00:00:00	\N
496	23	495	t	nodir-rasulev	Rahbar	rahbar-5	494	2026-02-23 07:50:10	2026-02-23 07:52:45	2026-02-23 00:00:00	\N
516	23	515	t	uzbek-american-association-of-chicago	tashkilotlar	tashkilot	19	2026-02-24 06:15:59	2026-02-24 06:15:59	2026-02-24 00:00:00	\N
290	23	289	f	sadikov-baxodir-talibjonovich-copy-2-copy-1-copy-2	Rahbar	rahbar-5	288	2026-02-18 09:46:15	2026-02-18 09:46:15	\N	\N
551	38	550	t	istiqomat-qilayotgan-davlatingiz-114	Form	form	148	2026-02-25 08:26:37	2026-02-25 12:40:43	2026-02-25 00:00:00	f
562	38	561	t	telefon-raqamingiz-908	Form	form	156	2026-02-25 10:25:22	2026-02-25 12:40:43	2026-02-25 00:00:00	f
569	38	568	t	telegram-820	Form	form	156	2026-02-25 10:32:12	2026-02-25 12:40:43	2026-02-25 00:00:00	f
509	38	508	t	yurtdoshlarni-qo-llash	Video	video-15	150	2026-02-24 04:47:35	2026-02-25 12:40:43	2026-02-24 00:00:00	f
576	38	575	t	e-mail-705	Form	form	227	2026-02-25 10:35:32	2026-02-25 12:40:43	2026-02-25 00:00:00	f
583	38	582	t	mutaxassisligi-716	Form	form	227	2026-02-25 10:37:34	2026-02-25 12:40:43	2026-02-25 00:00:00	f
463	23	462	t	tetsetsetste	tashkilot	tashkilot	234	2026-02-20 04:18:48	2026-02-20 04:18:48	2026-02-20 00:00:00	\N
528	59	527	t	https-eyuf-uz	\N	\N	\N	2026-02-24 12:38:42	2026-02-24 12:38:42	2026-02-24 00:00:00	\N
537	64	536	t	shahar-tuman	\N	\N	\N	2026-02-25 06:02:19	2026-02-25 06:27:39	2026-02-25 00:00:00	\N
545	64	544	t	fayl	\N	\N	\N	2026-02-25 06:10:28	2026-02-25 06:28:36	2026-02-25 00:00:00	\N
481	23	480	t	uzbek-cultural-center-in-italy	tashkilotlar	tashkilot	236	2026-02-20 12:23:34	2026-02-20 12:53:46	2026-02-20 00:00:00	\N
489	23	488	t	tomaris-uzbek-ladies-society	tashkilotlar	tashkilot	456	2026-02-23 05:18:03	2026-02-23 05:18:03	2026-02-23 00:00:00	\N
497	23	496	t	american-uzbekistan-association	tashkilotlar	tashkilot	19	2026-02-23 07:56:59	2026-02-23 07:57:17	2026-02-23 00:00:00	\N
510	23	509	t	uzbek-community-center-of-san-francisco-bay-area	tashkilotlar	tashkilot	19	2026-02-24 05:12:32	2026-02-24 05:12:32	2026-02-24 00:00:00	\N
517	23	516	t	chikagodagi-o-zbek-amerika-assotsiatsiyasi	Tashkilot haqida	nomi-7	516	2026-02-24 06:28:13	2026-02-24 06:28:13	2026-02-24 00:00:00	\N
552	38	551	t	shahar-tuman-1337	Form	form	148	2026-02-25 08:27:20	2026-02-25 12:40:43	2026-02-25 00:00:00	f
563	38	562	t	istiqomat-qilayotgan-davlatingiz-30	Form	form	156	2026-02-25 10:25:45	2026-02-25 12:40:43	2026-02-25 00:00:00	f
570	38	569	t	instagram-510	Form	form	156	2026-02-25 10:32:44	2026-02-25 12:40:43	2026-02-25 00:00:00	f
577	38	576	t	telefon-raqamingiz-1104	Form	form	227	2026-02-25 10:35:48	2026-02-25 12:40:43	2026-02-25 00:00:00	f
584	38	583	t	fayl-1570	Form	form	227	2026-02-25 10:38:04	2026-02-25 12:40:43	2026-02-25 00:00:00	f
464	23	463	t	asd	Rahbar	rahbar-5	463	2026-02-20 04:18:58	2026-02-20 04:18:58	2026-02-20 00:00:00	\N
529	59	528	t	https-gov-uz-oz-migration	\N	\N	\N	2026-02-24 12:40:07	2026-02-24 12:40:07	2026-02-24 00:00:00	\N
482	23	481	t	italiyadagi-o-zbek-madaniy-markazi	Tashkilot haqida	nomi-7	481	2026-02-20 12:50:51	2026-02-20 12:55:40	2026-02-20 00:00:00	\N
533	64	532	t	jinsi	\N	\N	\N	2026-02-25 05:59:06	2026-02-25 06:27:21	2026-02-25 00:00:00	\N
473	23	472	t	aqsh-va-kanadadagi-buxoriy-yahudiylar-kongressi	Tashkilot haqida	nomi-7	468	2026-02-20 06:51:55	2026-02-23 06:01:56	2026-02-20 00:00:00	\N
490	23	489	t	pittsburgdagi-uzbeklar-jamiyati-123	Tashkilot haqida	nomi-7	232	2026-02-23 07:11:52	2026-02-23 07:31:24	2026-02-23 00:00:00	\N
498	23	497	t	amerika-o-zbekiston-assotsiatsiyasi	Tashkilot haqida	nomi-7	497	2026-02-23 09:22:59	2026-02-23 09:22:59	2026-02-23 00:00:00	\N
538	64	537	t	ish-joyi	\N	\N	\N	2026-02-25 06:05:42	2026-02-25 07:13:09	2026-02-25 00:00:00	\N
511	23	510	t	san-fransisko-ko-rfazi-hududidagi-o-zbek-hamjamiyati-markazi-uccsfba	Tashkilot haqida	nomi-7	510	2026-02-24 05:16:52	2026-02-24 05:16:52	2026-02-24 00:00:00	\N
518	23	517	t	sharipov-olim-goziyevich	Rahbar	rahbar-5	516	2026-02-24 06:31:15	2026-02-24 09:26:41	2026-02-24 00:00:00	\N
553	38	552	t	fayl-671	Form	form	148	2026-02-25 08:28:22	2026-02-25 12:40:43	2026-02-25 00:00:00	f
564	38	563	t	shahar-tuman-969	Form	form	156	2026-02-25 10:26:07	2026-02-25 12:40:43	2026-02-25 00:00:00	f
571	38	570	t	whatsapp-344	Form	form	156	2026-02-25 10:32:59	2026-02-25 12:40:43	2026-02-25 00:00:00	f
578	38	577	t	istiqomat-qilayotgan-davlatingiz-648	Form	form	227	2026-02-25 10:36:08	2026-02-25 12:40:43	2026-02-25 00:00:00	f
585	63	584	f	adasd	\N	\N	\N	2026-02-25 10:55:42	2026-02-25 11:00:45	2026-02-25 00:00:00	f
418	23	417	t	xitoy	\N	\N	\N	2026-02-18 09:55:12	2026-02-18 09:57:21	2026-02-18 00:00:00	\N
499	23	498	t	kamilla-zakirova	Rahbar	rahbar-5	497	2026-02-23 09:27:22	2026-02-24 09:27:54	2026-02-23 00:00:00	\N
426	23	425	t	rossiya	\N	\N	\N	2026-02-18 09:57:07	2026-02-18 09:57:07	2026-02-18 00:00:00	\N
539	64	538	t	lavozimi	\N	\N	\N	2026-02-25 06:06:21	2026-02-25 06:28:01	2026-02-25 00:00:00	\N
474	23	473	t	nagoya-va-o-zbekiston-do-stlik-assotsiatsiyasi	Tashkilot haqida	nomi-7	470	2026-02-20 07:18:46	2026-02-20 07:24:45	2026-02-20 00:00:00	\N
554	23	553	t	alimov-zafar-xojiakbarovich	Rahbar	rahbar-5	523	2026-02-25 09:02:56	2026-02-25 09:02:56	2026-02-25 00:00:00	\N
483	23	482	t	kirgizova-komila-kamolovna	Rahbar	rahbar-5	481	2026-02-20 12:53:16	2026-02-20 12:53:16	2026-02-20 00:00:00	\N
491	23	490	t	turkistanian-american-association	tashkilotlar	tashkilot	19	2026-02-23 07:16:56	2026-02-23 07:33:33	2026-02-23 00:00:00	\N
506	23	505	t	mahalla-usa-1-	Tashkilot haqida	nomi-7	503	2026-02-24 04:19:59	2026-02-24 04:26:10	2026-02-24 00:00:00	\N
512	23	511	t	qudrat-rahimhodzhayev	Rahbar	rahbar-5	510	2026-02-24 05:21:10	2026-02-24 05:21:10	2026-02-24 00:00:00	\N
530	63	529	t	testsdf	\N	\N	\N	2026-02-25 04:52:31	2026-02-25 11:00:32	2026-02-25 00:00:00	f
586	63	585	t		\N	\N	\N	2026-02-25 11:00:19	2026-02-25 11:00:32	2026-02-25 00:00:00	f
546	38	545	t	to-liq-ismingiz-795	Form	form	148	2026-02-25 08:18:39	2026-02-25 12:40:43	2026-02-25 00:00:00	f
558	38	557	t	to-liq-ismingiz-1942	Form	form	156	2026-02-25 10:23:46	2026-02-25 12:40:43	2026-02-25 00:00:00	f
565	38	564	t	ish-joyi-162	Form	form	156	2026-02-25 10:30:58	2026-02-25 12:40:43	2026-02-25 00:00:00	f
519	38	518	t	yurtdoshlarni-qo-llash-2	Video	video-15	150	2026-02-24 06:38:50	2026-02-25 12:40:43	2026-02-24 00:00:00	f
572	38	571	t	fayl-1837	Form	form	156	2026-02-25 10:33:19	2026-02-25 12:40:43	2026-02-25 00:00:00	f
579	38	578	t	shahar-tuman-850	Form	form	227	2026-02-25 10:36:24	2026-02-25 12:40:43	2026-02-25 00:00:00	f
\.


--
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: vatandoshlar_usr
--

COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: vatandoshlar_usr
--

COPY public.permissions (id, name, sort_order, created_at, updated_at) FROM stdin;
1	given	0	2026-01-14 12:33:50	2026-01-14 12:33:50
2	not_given	0	2026-01-14 13:21:36	2026-01-14 13:21:36
\.


--
-- Data for Name: role_menu_permissions; Type: TABLE DATA; Schema: public; Owner: vatandoshlar_usr
--

COPY public.role_menu_permissions (id, role_id, menu_main_id, permission_id, created_at, updated_at) FROM stdin;
42	4	20	1	2026-02-18 04:14:51	2026-02-18 04:14:51
43	4	21	1	2026-02-18 04:14:51	2026-02-18 04:14:51
44	4	25	1	2026-02-18 04:14:51	2026-02-18 04:14:51
45	4	26	1	2026-02-18 04:14:51	2026-02-18 04:14:51
16	3	13	1	2026-01-27 09:29:57	2026-01-27 09:29:57
17	3	15	1	2026-01-27 09:29:57	2026-01-27 09:29:57
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: vatandoshlar_usr
--

COPY public.roles (id, name, sort_order, created_at, updated_at, status) FROM stdin;
1	admin	0	\N	\N	t
2	moderator	0	\N	2026-01-22 06:36:29	f
3	test-role	0	2026-01-27 09:25:50	2026-01-27 09:25:50	t
4	birlashma	0	2026-02-18 04:14:51	2026-02-18 04:14:51	t
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: vatandoshlar_usr
--

COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
Ebk30JTihEOfko2Folq4iqLb0VItg2tPBs1dJYGm	\N	95.130.227.60	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36	YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUEhWOXlhOE9keksyUXZWdGZMSDlXVzE1Rm5qS1VCT1VKN0JjMVVpdiI7czo2OiJsb2NhbGUiO3M6MjoidXoiO3M6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjI2OiJodHRwOi8vdmF0YW5kb3NobGFyLjd6Ny51eiI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==	1769089324
jmBfGmgucpnRNG8N4j1EQKHpVypoIrNOGWhLHmcg	\N	95.130.227.60	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36	YTo0OntzOjY6Il90b2tlbiI7czo0MDoiRUpsWWE1UGxVcWppT2kzZXlGZ3BZdWx0bjl5aWZUd0E0T2NqZVBOMCI7czo2OiJsb2NhbGUiO3M6MjoidXoiO3M6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjI2OiJodHRwOi8vdmF0YW5kb3NobGFyLjd6Ny51eiI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==	1769095683
fZu0rSQCJjpOrek5ABnmO2TvvksDG4OnlrTiin1n	\N	95.130.227.60	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36	YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMmxUYUFKblRYZjFBcFlwUTBZVmcwd2FXQ0lKakxoY2xFVVZTN2NzTCI7czo2OiJsb2NhbGUiO3M6MjoidXoiO3M6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjI2OiJodHRwOi8vdmF0YW5kb3NobGFyLjd6Ny51eiI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==	1769097606
WoSSVN6QGmbtcyBrxRSZXL8JABiYdCLjCA3dBLlQ	\N	95.130.227.60	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36	YTo0OntzOjY6Il90b2tlbiI7czo0MDoiN0daVjZuNjNvb0xHY0NQSFEydWNSNkRnQlNaWERocVBPMzQ1cG5FNiI7czo2OiJsb2NhbGUiO3M6MjoidXoiO3M6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjI2OiJodHRwOi8vdmF0YW5kb3NobGFyLjd6Ny51eiI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==	1769090164
Jq3W4aTgyAw6cAgAMrfrqNKBT5XuKWWXcUYHZjGv	\N	213.206.63.164	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0	YTo0OntzOjY6Il90b2tlbiI7czo0MDoiRnB3T2pWYnR4M0lsRjFYcThSR01VYUxudGN5VjJlM2RzVkRYeGZMRiI7czo2OiJsb2NhbGUiO3M6MjoidXoiO3M6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjQwOiJodHRwczovL3ZhdGFuZG9zaGxhci43ejcudXovdXovbWVkaWF0ZWthIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1769090294
IwpxixXrNVrF1jfBuvQiD9H0ADiOayGv3c88q1aZ	\N	95.130.227.60	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36	YTo0OntzOjY6Il90b2tlbiI7czo0MDoidkdxYkhMcGlINGx4NEtuYnJ1T1NqTU9TZ0VyOUcxQTFYeE1mc3ZMNiI7czo2OiJsb2NhbGUiO3M6MjoidXoiO3M6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjI2OiJodHRwOi8vdmF0YW5kb3NobGFyLjd6Ny51eiI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==	1769092924
MFAquBX3yVXPpYXelA5tfGY7LFy7LbG76wU6yHF5	\N	95.130.227.60	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36	YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUjVhb0F6ZFVKMVU3Mmo5eWExOXFIVFVUeFc3ZzhZVUxoU2NtNjc2ViI7czo2OiJsb2NhbGUiO3M6MjoidXoiO3M6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjI2OiJodHRwOi8vdmF0YW5kb3NobGFyLjd6Ny51eiI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==	1769088482
dkBTitqmY1Ajy2gEf8H9yOxa7woqRBmPLewM2h1U	\N	95.130.227.60	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36	YTo0OntzOjY6Il90b2tlbiI7czo0MDoiS0tPTTJPZHgzV3ZKUjNXWWxTU0k5amtsVFNqUzZ1WGNHTTQ0WmJGTiI7czo2OiJsb2NhbGUiO3M6MjoidXoiO3M6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjI2OiJodHRwOi8vdmF0YW5kb3NobGFyLjd6Ny51eiI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==	1769094843
6YapdWKAkmCmRwUU3rmDvwBKQBkn9x6KOpP0glKv	1	213.206.63.164	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	YTo2OntzOjY6Il90b2tlbiI7czo0MDoiVmdKMVQ4blNQNTJ2Rnh4YktSMWpnajV3ZzV1YUNVWlVQSEtwRzY5NyI7czo2OiJsb2NhbGUiO3M6MjoidXoiO3M6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjI3OiJodHRwczovL3ZhdGFuZG9zaGxhci43ejcudXoiO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjE6e3M6ODoiaW50ZW5kZWQiO3M6MzM6Imh0dHBzOi8vdmF0YW5kb3NobGFyLjd6Ny51ei9hZG1pbiI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==	1769095221
KLNStOelFdIRsTTtn5sBFWjm4xryexegMSSJdgdK	\N	95.130.227.60	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36	YTo0OntzOjY6Il90b2tlbiI7czo0MDoibHhvcVdTVFljM0lPeVVoTWw5SWVYWlNFNmFHWDhtSzhmZWZ2QmU5ViI7czo2OiJsb2NhbGUiO3M6MjoidXoiO3M6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjI2OiJodHRwOi8vdmF0YW5kb3NobGFyLjd6Ny51eiI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==	1769093764
Lry4KCZbmY4eWWI5T4XoBPvcNDwvVIHVFYREmCNh	\N	213.206.63.164	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0	YTo0OntzOjY6Il90b2tlbiI7czo0MDoiNjNUU2JrOU82TEpQTTFTbklzR05uZ0x0SnRzTlFteFh4RzhnUjV0NCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0MjoiaHR0cHM6Ly92YXRhbmRvc2hsYXIuN3o3LnV6L2FkbWluL3NldHRpbmdzIjt9czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDI6Imh0dHBzOi8vdmF0YW5kb3NobGFyLjd6Ny51ei9hZG1pbi9zZXR0aW5ncyI7czo1OiJyb3V0ZSI7czoxNDoiYWRtaW4uc2V0dGluZ3MiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1769091814
ZcxuZMprPvjbCONYUnRihjnMutuHEby2DaM3fSd3	1	213.206.63.164	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0	YTo2OntzOjY6Il90b2tlbiI7czo0MDoiWUxnVHVVRnFmajlSN21WQ052Z3BLd2NLTzVScmhjamJxalRzYW5VbSI7czo2OiJsb2NhbGUiO3M6MjoidXoiO3M6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjMzOiJodHRwczovL3ZhdGFuZG9zaGxhci43ejcudXovYWRtaW4iO3M6NToicm91dGUiO3M6MTE6ImFkbWluLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo2NjoiaHR0cHM6Ly92YXRhbmRvc2hsYXIuN3o3LnV6L2FkbWluL3BhZ2VzL21lZGlhdGVrYS9zZWN0aW9uLzI3L2l0ZW1zIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9	1769092097
kNwyx6A7pu9WRcauIdpORELFkjWW1n13GYdFWCYz	\N	213.206.63.164	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiR3pQQzRYbkIza296dDM4UUhpdlpwWjE3YXkwUzBDS0M2ekZrajhMOCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vdmF0YW5kb3NobGFyLjd6Ny51ei9sb2dpbiI7czo1OiJyb3V0ZSI7czo1OiJsb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1769091814
CY6Zzhh1VanraKMxuA8TF1Gi7EZFuxA3ZONYAgkk	\N	95.130.227.60	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36	YTo0OntzOjY6Il90b2tlbiI7czo0MDoiY0JhamlnTmRIbldsSmlwNlRwNXhvVU1HS3FWWWpiRmszU2VxcjZ6YiI7czo2OiJsb2NhbGUiO3M6MjoidXoiO3M6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjI2OiJodHRwOi8vdmF0YW5kb3NobGFyLjd6Ny51eiI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==	1769094003
kKIvBrsvWCYTKDL57eoQQS5uum3HLlhB9TPvyDYN	1	195.158.2.216	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	YTo2OntzOjY6Il90b2tlbiI7czo0MDoiOVRZaEtZYVZFU0ptQ3NDUExMQkhCWjAwNTZ3bXJ5VU45b09PcFViSSI7czo2OiJsb2NhbGUiO3M6MjoidXoiO3M6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjQxOiJodHRwczovL3ZhdGFuZG9zaGxhci43ejcudXovdXovdXpiZWtpc3RhbiI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMzoiaHR0cHM6Ly92YXRhbmRvc2hsYXIuN3o3LnV6L2FkbWluIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9	1769098201
lWJ45scWuZk88svAxKHYvHhoUTAEzQXJV0798S3R	\N	213.206.63.164	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0	YTo0OntzOjY6Il90b2tlbiI7czo0MDoiOTlzbElvdkE1S1JsbTR4R20wVTkwS1lEWU9iTU82MmozNVBGelh1ViI7czo2OiJsb2NhbGUiO3M6MjoidXoiO3M6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjQwOiJodHRwczovL3ZhdGFuZG9zaGxhci43ejcudXovdXovbWVkaWF0ZWthIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1769090843
snC2UYzCjieSVHZodzgFuActWCxDb8NLm8AZqhda	1	213.206.63.164	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	YTo2OntzOjY6Il90b2tlbiI7czo0MDoiT1hTbGRjWjgzd0lMY3NFWWk0TEZxVDFKMXVVdDdiUnB6bkdhb01DNiI7czo2OiJsb2NhbGUiO3M6MjoidXoiO3M6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjMwOiJodHRwczovL3ZhdGFuZG9zaGxhci43ejcudXovdXoiO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjE6e3M6ODoiaW50ZW5kZWQiO3M6MzM6Imh0dHBzOi8vdmF0YW5kb3NobGFyLjd6Ny51ei9hZG1pbiI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==	1769091122
1n9ZQe2IgBeFin6WRQITifWU1afMbiKdsAexaShb	\N	95.130.227.60	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36	YTo0OntzOjY6Il90b2tlbiI7czo0MDoiT0V1cW5HaUJBYk5xVDVCeTBzQjlFcWM0SEMxTDltWVFZeGZTUTJsRCI7czo2OiJsb2NhbGUiO3M6MjoidXoiO3M6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjI2OiJodHRwOi8vdmF0YW5kb3NobGFyLjd6Ny51eiI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==	1769091244
IYfjJvZ9nbqjd14OGP3zqMCGF3hWOqFwNkiGQ5Nc	\N	149.154.161.213	TelegramBot (like TwitterBot)	YTo0OntzOjY6Il90b2tlbiI7czo0MDoiTlpjdzZreGNzU3B3d2lmdzB4a2lXMHZ3S2lPeHoyTWlkRkJucklmbyI7czo2OiJsb2NhbGUiO3M6MjoidXoiO3M6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjg4OiJodHRwczovL3ZhdGFuZG9zaGxhci43ejcudXovdXovbmV3cy9iYWFkYS12YXRhbmRvc2hsYXItbWludGFxYXZpeS1mb3J1bWktYm8tbGliLW8tdG1vcWRhIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1769095159
WmZwbvdrXdPI12aVGQqqHhtWklJJRps5LxvxTGst	\N	95.130.227.60	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36	YTo0OntzOjY6Il90b2tlbiI7czo0MDoiS1FjbUZaSGxUM1IxS1RVdnJGQTZ4VENuM1BDTzdUeU5zMzlEeThETiI7czo2OiJsb2NhbGUiO3M6MjoidXoiO3M6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjI2OiJodHRwOi8vdmF0YW5kb3NobGFyLjd6Ny51eiI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==	1769096522
p56qF4A4Qx3QijHBDAlvy45drXg9u1fKszs1WdaW	\N	95.130.227.60	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36	YTo0OntzOjY6Il90b2tlbiI7czo0MDoiYjJ2cG5PU09wSlZjcldjQUY4dE9EN0RLTno3RjBIbDQ0TEM4YjFUeiI7czo2OiJsb2NhbGUiO3M6MjoidXoiO3M6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjI2OiJodHRwOi8vdmF0YW5kb3NobGFyLjd6Ny51eiI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==	1769092085
DBrlKHnSpC4CnwpWsmCSRMnQo6NF7lL7k7Ro28a0	\N	95.130.227.60	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36	YTo0OntzOjY6Il90b2tlbiI7czo0MDoicVJkQ3VtWkNoUmFKejJzNTNBeVR2VkxIUk1nTDhMMVpLcGloRmQ0MyI7czo2OiJsb2NhbGUiO3M6MjoidXoiO3M6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjI2OiJodHRwOi8vdmF0YW5kb3NobGFyLjd6Ny51eiI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==	1769097364
4rgN7ZBisxbBeQvaxbiLtRCbTgXDyDw311cMyx2m	\N	149.154.161.218	TelegramBot (like TwitterBot)	YTo0OntzOjY6Il90b2tlbiI7czo0MDoidW1iZ1VoQzJ4MTF5R2lVaEY0SkRxbUg0ZThqbWZ0azJSZVduT01rYSI7czo2OiJsb2NhbGUiO3M6MjoidXoiO3M6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjM5OiJodHRwczovL3ZhdGFuZG9zaGxhci43ejcudXovdXovY29udGFjdHMiO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1769088110
ttmqGgnXjpFjEYuBm3XKsKEGHHMQyvAUZDwjmK6P	\N	95.130.227.60	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36	YTo0OntzOjY6Il90b2tlbiI7czo0MDoiVW1tM3dKdjFQanFLOWJqZ3RBWHBDYVJEcnZhekx3UGhDd3BxTHBXeSI7czo2OiJsb2NhbGUiO3M6MjoidXoiO3M6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjI2OiJodHRwOi8vdmF0YW5kb3NobGFyLjd6Ny51eiI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==	1769090404
pf4cjMCD98qL9G7IpRMZGH8x6LrvNli1ne4DA9nJ	\N	213.206.63.164	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0	YTo0OntzOjY6Il90b2tlbiI7czo0MDoiaGFtVERNcUtTblBib21BOWdmc0pwMVNnVmN2c1RKV0JobjVvYURHMSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo2OToiaHR0cHM6Ly92YXRhbmRvc2hsYXIuN3o3LnV6L2FkbWluL3BhZ2VzL21lZGlhdGVrYS9zZWN0aW9uLzI3L2VkaXQvMTg3Ijt9czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njk6Imh0dHBzOi8vdmF0YW5kb3NobGFyLjd6Ny51ei9hZG1pbi9wYWdlcy9tZWRpYXRla2Evc2VjdGlvbi8yNy9lZGl0LzE4NyI7czo1OiJyb3V0ZSI7czoyNDoiYWRtaW4ucGFnZXMuc2VjdGlvbi5lZGl0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==	1769091253
ADx4HmeGD9jQkBi9wTOdhEHz2FM0zSPhSmMOAHAl	\N	213.206.63.164	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiUXV3dGZsemtJVm45blNlcER1VUtTYkExU0o0MTdRZnE3cTdLVXZibiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vdmF0YW5kb3NobGFyLjd6Ny51ei9sb2dpbiI7czo1OiJyb3V0ZSI7czo1OiJsb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1769091253
5XTJou10kUdVLP4ND1WpWIRZ9RiycFBjtDJMSP8y	1	213.206.63.164	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0	YTo2OntzOjY6Il90b2tlbiI7czo0MDoiUEFqVEh2SmlpYzhuczI3eWtZQ2dyOVVaNzJQaU03QlRGNFpIWndzNCI7czo2OiJsb2NhbGUiO3M6MjoidXoiO3M6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjQwOiJodHRwczovL3ZhdGFuZG9zaGxhci43ejcudXovdXovbWVkaWF0ZWthIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjM6InVybCI7YToxOntzOjg6ImludGVuZGVkIjtzOjMzOiJodHRwczovL3ZhdGFuZG9zaGxhci43ejcudXovYWRtaW4iO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=	1769090289
\.


--
-- Data for Name: setting_images; Type: TABLE DATA; Schema: public; Owner: vatandoshlar_usr
--

COPY public.setting_images (id, setting_id, image, compressed, type, size, main, status, created_at, updated_at, sort_order, poster) FROM stdin;
2	1	settings/a0e178d2-8396-456a-b547-a15e69f4ca64127.jpg	\N	image/jpeg	268394	f	t	2026-01-20 09:49:11	2026-01-20 09:49:11	\N	\N
3	1	settings/a0e3313c-3d27-490e-91bf-6e109a4f36c4157.png	\N	image/png	98609	t	t	2026-01-21 06:20:40	2026-01-21 06:20:45	\N	\N
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: vatandoshlar_usr
--

COPY public.settings (id, title, meta_description, meta_keywords, email, status, main_page_id, admin_ips, created_at, updated_at, search_ids, sorting_ids, bot_token, chat_id, week_short, week_long, month_long, month_short, default_lang) FROM stdin;
1	{"en": "Vatandoshlar jamoat fondi", "ru": "Vatandoshlar jamoat fondi", "uz": "Vatandoshlar jamoat fondi"}	{"en": "Vatandoshlar jamoat fondi", "ru": "Vatandoshlar jamoat fondi", "uz": "Vatandoshlar jamoat fondi2"}	{"en": "Vatandoshlar, Diaspora, Uzbekistan, Vatan", "ru": "Vatandoshlar, Diaspora, Uzbekistan, Vatan", "uz": "Vatandoshlar, Diaspora, Uzbekistan, Vatan"}	\N	f	38	\N	2025-12-20 15:22:52	2026-02-23 10:05:17	["6","26","38","14","16"]	["26","46"]	8049502986:AAGzJE9gJn6iKBNA-rhQApbQAZiJMclI5vI	-1003829691351	{"en": "Sun, Mon, Tue, Wed, Thu, Fri, Sat", "ru": "Вс, Пн, Вт, Ср, Чт, Пт, Сб", "uz": "Yak, Du, Se, Ch, Pa, Ju, Sha"}	{"en": "Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday", "ru": "Воскресенье, Понедельник, Вторник, Среда, Четверг, Пятница, Суббота", "uz": "Yakshanba, Dushanba, Seshanba, Chorshanba, Payshanba, Juma, Shanba"}	{"en": "January, February, March, April, May, June, July, August, September, October, November, December", "ru": "Январь, Февраль, Март, Апрель, Май, Июнь, Июль, Август, Сентябрь, Октябрь, Ноябрь, Декабрь", "uz": "Yanvar, Fevral, Mart, Aprel, May, Iyun, Iyul, Avgust, Sentyabr, Oktyabr, Noyabr, Dekabr"}	{"en": "Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec", "ru": "Янв, Фев, Мар, Апр, Май, Июн, Июл, Авг, Сен, Окт, Ноя, Дек", "uz": "Yan, Fev, Mar, Apr, May, Iyn, Iyl, Avg, Sen, Okt, Noy, Dek"}	uz
\.


--
-- Data for Name: socials; Type: TABLE DATA; Schema: public; Owner: vatandoshlar_usr
--

COPY public.socials (id, name, icon, url, key, status, created_at, updated_at) FROM stdin;
2	facebook	i-facebook	https://fb.com/vatandoshlarfondi	\N	t	2026-01-19 05:36:05	2026-01-19 05:36:05
1	telegram	i-telegram	https://t.me/vatandoshlar_fond	\N	t	2026-01-19 05:29:50	2026-01-22 06:56:31
3	instagram	i-instagram	https://www.instagram.com/vatandoshlar_fondi	\N	t	2026-01-19 05:36:21	2026-01-22 14:36:49
4	youtube	i-youtube	https://www.youtube.com/@vatandoshlar	\N	t	2026-01-19 05:36:42	2026-01-22 14:37:12
\.


--
-- Data for Name: supports; Type: TABLE DATA; Schema: public; Owner: vatandoshlar_usr
--

COPY public.supports (id, data, created_at, updated_at, type, user_id, chat_id) FROM stdin;
61	{"name": "Asad", "email": "yam@gmail.com", "phone": "+998 90-597-55-54", "description": "yZSH"}	2026-01-09 05:13:50	2026-01-09 05:13:50	form	\N	\N
97	{"city": "sirdaryo", "name": "Asad", "email": "wq@gmail.com", "phone": "905975554", "gender": "female", "country": "uzbekistan", "position": "Junior", "telegram": null, "whatsapp": null, "birthdate": "2026-01-01", "education": "boshlangich", "instagram": null, "workplace": "ProEnd", "specialization": "orta"}	2026-01-09 10:48:01	2026-01-09 10:48:01	participation	\N	\N
98	{"city": "fergana", "name": "Asad", "email": "wq@gmail.com", "phone": "905975554", "gender": "male", "country": "uzbekistan", "position": "Junior", "telegram": null, "whatsapp": null, "birthdate": "2026-01-01", "education": "boshlangich", "instagram": null, "workplace": "ProEnd", "specialization": "orta"}	2026-01-09 11:15:49	2026-01-09 11:15:49	participation	\N	\N
99	{"name": "saasfs", "email": "wq@gmail.com", "phone": "+998 90-597-55-54", "description": "csdvfxsf"}	2026-01-09 12:08:27	2026-01-09 12:08:27	form	\N	\N
100	{"name": "cdfvd", "email": "qwerty@gmail.com", "phone": "+998 90-597-55-54", "description": "wefvregdt"}	2026-01-09 12:15:45	2026-01-09 12:15:45	form	\N	\N
101	{"name": "asdasd", "email": "asdasds@asd.ru", "phone": "+998 23-423-42-34", "description": "asd asd asd asd"}	2026-01-12 10:14:42	2026-01-12 10:14:42	form	\N	\N
102	{"name": "asdasdsd", "email": "asdasd@asd.ru", "phone": "+998 24-234-23-42", "description": "ada das dasd asd"}	2026-01-12 10:17:04	2026-01-12 10:17:04	form	\N	\N
110	{"job": "27", "name": "frthtrfhrh", "address": "reehe", "birthdate": "2026-01-05", "extra_info": "te@gmail.xin", "description": "fsdgggfe"}	2026-01-12 13:01:26	2026-01-12 13:01:26	application	\N	\N
112	{"name": "cfsvds", "email": "qwerty@gmail.com", "phone": "+998 41-242-41-23", "description": "caca"}	2026-01-14 12:23:13	2026-01-14 12:23:13	form	\N	\N
113	{"name": "cfsvds", "email": "qwerty@gmail.com", "phone": "+998 41-242-41-23", "description": "caca"}	2026-01-14 12:23:13	2026-01-14 12:23:13	form	\N	\N
114	{"job": "34", "name": "gol", "address": "x cx x", "birthdate": "2026-01-11", "extra_info": "cxxc@gmIail.com", "description": "fdbvfdbdb"}	2026-01-14 18:59:28	2026-01-14 18:59:28	application	\N	\N
115	{"job": "Oshpazimiz", "name": "f vbgfv", "address": "c c c", "birthdate": "2025-12-30", "extra_info": "cxxc", "description": "daaa"}	2026-01-14 19:01:35	2026-01-14 19:01:35	application	\N	\N
116	{"job": "Oshpazimiz", "name": "csdvdfv", "address": "vdvdvds", "birthdate": "2026-01-22", "extra_info": "DSFBRDFF", "description": "c  vfgbgfbd"}	2026-01-14 19:08:10	2026-01-14 19:08:10	application	\N	\N
1	{"job": "Oshpazimiz", "name": "asdaa", "address": "asda", "birthdate": "2022-12-31", "extra_info": "dasdaad", "description": "adasd"}	2026-01-19 06:29:48	2026-01-19 06:29:48	application	\N	\N
2	{"name": "Muhammadali", "email": "yam@gmail.com", "phone": "+998 90-597-55-54", "description": "Salom"}	2026-01-19 10:10:01	2026-01-19 10:10:01	form	\N	\N
3	{"name": "Muhammadali", "email": "qwerty@gmail.com", "phone": "+998 41-242-41-23", "description": "Salom"}	2026-01-19 10:10:26	2026-01-19 10:10:26	form	\N	\N
4	{"name": "asdadasada", "email": "sadas@Eawdsa.dsa", "phone": "+998 21-313-13-11", "description": "adsada"}	2026-01-19 10:56:41	2026-01-19 10:56:41	form	\N	\N
109	{"city": "tashkent", "name": "asdasdsad", "email": "joha_gamer@mail.ru", "phone": "+998 23-423-42-34", "gender": "male", "country": "uzbekistan", "position": "adasdasd", "telegram": "a sdas dasd asd", "whatsapp": "a sdad sa", "birthdate": "06-01-2026", "education": "ыфв", "instagram": "a sda da dads", "workplace": "asdsad", "specialization": "asdasdasd ada dad ads"}	2026-01-12 12:30:04	2026-01-22 08:37:34	participation	1	\N
106	{"city": "fergana", "name": "jftj", "email": "rser@gmail.cvlm", "phone": "+998 24-524-77-74", "gender": "female", "country": "uzbekistan", "position": "fgsgsggw", "telegram": null, "whatsapp": null, "birthdate": "2000-02-05", "education": "fstgsgwsgrg", "instagram": null, "workplace": "hdffhd", "specialization": "gwgwgwghw"}	2026-01-12 11:00:16	2026-01-22 08:39:01	participation	1	\N
63	{"city": "tashkent", "name": "saasfs", "email": "yam@gmail.com", "phone": "905975554", "gender": "male", "country": "uzbekistan", "position": "Junior", "telegram": null, "whatsapp": null, "birthdate": "2026-01-07", "education": "boshlangich", "instagram": null, "workplace": "ProEnd", "specialization": "orta"}	2026-01-09 07:15:17	2026-01-22 08:39:09	participation	1	\N
64	{"city": "tashkent", "name": "Asad", "email": "qwerty@gmail.com", "phone": "905975554", "gender": "male", "country": "uzbekistan", "position": "Junior", "telegram": null, "whatsapp": null, "birthdate": "2026-01-09", "education": "boshlangich", "instagram": null, "workplace": "ProEnd", "specialization": "orta"}	2026-01-09 07:19:13	2026-01-22 08:40:11	participation	1	\N
103	{"city": "tashkent", "name": "dfgbdgd", "email": "ww@gmail.cmno", "phone": "+998 55-220-42-42", "gender": "male", "country": "uzbekistan", "position": "frhrtfgne", "telegram": null, "whatsapp": null, "birthdate": "2026-01-07", "education": "ertghrehrt", "instagram": null, "workplace": "twete4", "specialization": "jtjtyjrytjtrj"}	2026-01-12 10:54:26	2026-01-22 08:40:19	participation	1	\N
108	{"city": "tashkent", "name": "asdasdsad", "email": "joha_gamer@mail.ru", "phone": "+998 23-423-42-34", "gender": "male", "country": "uzbekistan", "position": "adasdasd", "telegram": "a sdas dasd asd", "whatsapp": "a sdad sa", "birthdate": "06-01-2026", "education": "ыфв", "instagram": "a sda da dads", "workplace": "asdsad", "specialization": "asdasdasd ada dad ads"}	2026-01-12 12:29:43	2026-01-23 15:43:18	participation	1	\N
105	{"city": "fergana", "name": "jftj", "email": "rser@gmail.cvlm", "phone": "+998 24-524-77-74", "gender": "female", "country": "uzbekistan", "position": "fgsgsggw", "telegram": null, "whatsapp": null, "birthdate": "2000-02-05", "education": "fstgsgwsgrg", "instagram": null, "workplace": "hdffhd", "specialization": "gwgwgwghw"}	2026-01-12 10:59:20	2026-01-23 15:43:30	participation	1	\N
104	{"city": "fergana", "name": "jftj", "email": "rser@gmail.cvlm", "phone": "+998 24-524-77-74", "gender": "female", "country": "uzbekistan", "position": "fgsgsggw", "telegram": null, "whatsapp": null, "birthdate": "2000-02-05", "education": "fstgsgwsgrg", "instagram": null, "workplace": "hdffhd", "specialization": "gwgwgwghw"}	2026-01-12 10:58:16	2026-01-24 13:50:45	participation	1	\N
7	{"name": "Asad", "email": "qwerty@gmail.com", "phone": "+998 90-597-55-54", "description": "ewvew"}	2026-01-19 11:16:05	2026-01-19 11:16:05	form	\N	\N
9	{"name": "Muhammadali", "email": "as@gnai.vom", "phone": "+998 32-333-33-21", "description": "cx"}	2026-01-19 11:31:53	2026-01-19 11:31:53	form	\N	\N
117	{"name": "asda", "email": "3asda@s.adf", "phone": "+998 23-112-32-11", "description": "asda"}	2026-01-20 08:35:36	2026-01-20 08:35:36	form	\N	\N
118	{"name": "asda", "email": "asdas2@das.sdf", "phone": "+998 21-312-31-31", "description": "sda"}	2026-01-20 08:46:55	2026-01-20 08:46:55	form	\N	\N
119	{"name": "asda", "email": "sda@das.sf", "phone": "+998 21-313-12-13", "description": "aas"}	2026-01-20 08:48:07	2026-01-20 08:48:07	form	\N	\N
120	{"name": "asda", "email": "d@d12.df", "phone": "+998 23-123-11-31", "description": "a"}	2026-01-20 08:49:33	2026-01-20 08:49:33	form	\N	\N
121	{"name": "213", "email": "231@d.sd", "phone": "+998 21-321-31-31", "description": "1231"}	2026-01-20 08:50:57	2026-01-20 08:50:57	form	\N	\N
122	{"name": "asd", "email": "2das@ds.s", "phone": "+998 23-313-13-13", "description": "adsada"}	2026-01-20 08:52:32	2026-01-20 08:52:32	form	\N	\N
123	{"name": "asda", "email": "2adsdas@dsa.sdafds", "phone": "+998 23-123-23-13", "description": "asdadas"}	2026-01-20 08:53:11	2026-01-20 08:53:11	form	\N	\N
124	{"name": "test", "email": "fasfd@asdfsaf.aretre", "phone": "+998 33-145-00-04", "description": "gsdfgdsf"}	2026-01-21 08:13:22	2026-01-21 08:13:22	form	\N	\N
126	{"name": "adfsgadfgda", "email": "sgdfgsdfg@twe.wetwet", "phone": "+998 41-234-12-41", "description": "gsdfgds"}	2026-01-21 08:15:47	2026-01-21 08:15:47	form	\N	\N
127	{"name": "Asad", "email": "wq@gmail.com", "phone": "+241 45 757-55-67", "description": "VFBED"}	2026-01-21 13:03:46	2026-01-21 13:03:46	form	\N	\N
13	{"city": "jizzakh", "name": "saasfs", "email": "qwerty@gmail.com", "phone": "+998 41-242-41-23", "gender": "male", "country": "Gvatemala", "position": "Junior", "telegram": null, "whatsapp": null, "birthdate": "06-01-2026", "education": "sdfsdf", "instagram": null, "workplace": "sdfsdsfsd", "specialization": "orta"}	2026-01-19 12:00:12	2026-01-22 08:37:10	participation	1	\N
111	{"city": "sirdaryo", "name": "asdasdsad", "email": "joha_gamer@mail.ru", "phone": "+998 23-423-42-34", "gender": "female", "country": "uzbekistan", "position": "adasdasd", "telegram": null, "whatsapp": null, "birthdate": "16-01-2026", "education": "adasd", "instagram": null, "workplace": "asdsad", "specialization": "asdasdasd ada dad ads"}	2026-01-12 13:06:21	2026-01-22 08:37:19	participation	1	\N
128	{"name": "aLI", "email": "wq@gmail.com", "phone": "+220 43 643-64-36", "description": "casca"}	2026-01-21 13:05:23	2026-01-22 08:40:32	form	1	\N
125	{"name": "vxcvbxzcv", "email": "sadfgsdfg@masdfsd.twerterw", "phone": "+998 34-345-63-42", "description": "gsdfgdsf"}	2026-01-21 08:15:19	2026-01-22 08:40:35	form	1	\N
129	{"name": "asdasdasd", "email": "asdasd@asdads.sdu", "phone": "+998 32 423-42-34", "description": "adasd asd asd"}	2026-01-22 08:42:07	2026-01-22 08:42:07	form	\N	\N
130	{"name": "tet", "email": "asda@ds.sdf", "phone": "+998 21 312-31-23", "description": "dasfdfd"}	2026-01-22 11:53:10	2026-01-22 11:53:10	form	\N	\N
131	{"name": "test", "email": "asdad@asdad.ds", "phone": "+998 23 123-21-31", "description": "asda"}	2026-01-22 11:54:56	2026-01-22 11:54:56	form	\N	\N
132	{"name": "tetetetest", "email": "dsadas@ds.dd", "phone": "+998 23 132-13-12", "description": "ddas"}	2026-01-22 11:58:01	2026-01-22 11:58:01	form	\N	\N
133	{"name": "asdada", "email": "asdad@dsd.sd", "phone": "+998 21 312-31-23", "description": "asdada"}	2026-01-22 11:58:32	2026-01-22 11:58:32	form	\N	\N
134	{"name": "te", "email": "aAS2@dsd.f", "phone": "+998 23 123-21-32", "description": "d"}	2026-01-22 11:58:47	2026-01-22 11:58:47	form	\N	\N
135	{"name": "tadsa", "email": "sdfsfds@asdasd.sdf", "phone": "+998 23 123-21-31", "description": "sdfsfss"}	2026-01-22 11:59:23	2026-01-22 11:59:23	form	\N	\N
136	{"name": "asad", "email": "sds@sd.ds", "phone": "+998 21 312-32-11", "description": "adada"}	2026-01-22 12:03:21	2026-01-22 12:03:21	form	\N	\N
137	{"name": "wsd231312", "email": "122131@asa.dsds", "phone": "+998 12 313-13-13", "description": "asada"}	2026-01-22 12:03:34	2026-01-22 12:03:34	form	\N	\N
138	{"name": "asd", "email": "asda@asdadsadsd.asd", "phone": "+998 21 312-33-13", "description": "asd"}	2026-01-22 13:12:06	2026-01-22 13:12:06	form	\N	\N
139	{"name": "123131", "email": "asd@sada.ds", "phone": "+998 12 313-11-32", "description": "asdada"}	2026-01-22 13:13:14	2026-01-22 13:13:14	form	\N	\N
140	{"name": "Muhammadali Azizov", "email": "wweqe@gmail.com", "phone": "+998 32 535-33-64", "description": "fsegseges"}	2026-01-22 13:31:12	2026-01-22 13:31:12	form	\N	\N
141	{"name": "fdhq2", "email": "qwerty@gmail.com", "phone": "+998 63 463-46-43", "description": "vsdds"}	2026-01-22 13:32:22	2026-01-22 13:32:22	form	\N	\N
142	{"name": "gzfgdg", "email": "dfghhfg@adf.tre", "phone": "+998 56 756-75-67", "description": "jfgjh"}	2026-01-22 16:14:16	2026-01-22 16:14:16	form	\N	\N
143	{"name": "asdasd", "email": "asdas@asd.ru", "phone": "+998 23 423-42-34", "description": "asdasdasd"}	2026-01-23 07:31:24	2026-01-23 07:31:24	form	\N	\N
144	{"name": "asdasdasd", "email": "asda@asd.ru", "phone": "+998 23 423-42-34", "description": "asdasdas dasd"}	2026-01-23 07:31:40	2026-01-23 07:31:40	form	\N	\N
145	{"name": "asdasdad", "email": "asdasd@asd.ru", "phone": "+998 34 234-23-42", "description": "asdasdsa"}	2026-01-23 07:35:23	2026-01-23 07:35:23	form	\N	\N
146	{"name": "asda", "email": "2@2.s", "phone": "+998 21 321-21-32", "description": "sda"}	2026-01-23 07:37:16	2026-01-23 07:37:16	form	\N	\N
147	{"name": "123", "email": "2@2.2", "phone": "+998 21 231-13-13", "description": "dsa"}	2026-01-23 07:37:55	2026-01-23 07:37:55	form	\N	\N
148	{"name": "123213", "email": "as@sda.sd", "phone": "+998 12 323-13-13", "description": "s"}	2026-01-23 07:38:16	2026-01-23 07:38:16	form	\N	\N
149	{"name": "asdad", "email": "ada@sdad.sadf", "phone": "+998 23 132-13-13", "description": "asdsad"}	2026-01-23 08:56:12	2026-01-23 08:56:12	form	\N	\N
150	{"name": "asda", "email": "sda2@ds.dsd", "phone": "+998 21 321-31-1_", "description": "as"}	2026-01-23 08:58:37	2026-01-23 08:58:37	form	\N	\N
151	{"name": "asda", "email": "asa@sd.sdad", "phone": "+998 23 213-11-1_", "description": "asda"}	2026-01-23 08:59:23	2026-01-23 08:59:23	form	\N	\N
153	{"name": "Saidakbar", "email": "info@proend.uz", "phone": "+998 33 145-00-04", "description": "test matn"}	2026-01-28 10:03:08	2026-01-28 10:03:08	form	\N	-1003249220292
154	{"name": "hfghdgh", "email": "sfgsdfg@fasd.reaw", "phone": "+998 33 145-00-04", "description": "gsdfgsdfg"}	2026-01-28 10:03:41	2026-01-28 10:04:10	form	1	-1003249220292
156	{"name": "gsdfgdsf", "email": "fasdfasd@dfasdf.gsdfg", "phone": "+998 41 234-12-34", "description": "gsdfgsdfg"}	2026-01-28 10:07:23	2026-01-28 10:07:23	form	\N	\N
152	{"name": "asda2132", "email": "asd@asd.df", "phone": "+998 21 312-31-13", "description": "asd"}	2026-01-23 09:00:38	2026-01-28 10:13:14	form	1	\N
155	{"name": "test Saidakbar", "email": "fasfs@afsd.ut", "phone": "+998 33 145-00-04", "description": "bxcvbxcb"}	2026-01-28 10:04:39	2026-01-28 10:13:28	form	1	-1003249220292
157	{"job": "Musiqachi", "name": "S.M.R", "address": "Mirzo Ulug'bek", "birthdate": "2026-01-17", "extra_info": "+998331450004", "description": "test taklif"}	2026-01-28 10:14:45	2026-01-28 10:15:00	application	1	\N
158	{"city": "adsasd", "name": "фывфыв", "email": "asdasd@sad.ru", "phone": "+998 24 234-23-42", "gender": "male", "country": "Gaiti", "position": "asdasd", "telegram": "adas", "whatsapp": "asd", "birthdate": "16-01-2026", "education": "asdasd", "instagram": "asd", "workplace": "adasd", "specialization": "Musiqachi"}	2026-01-28 10:30:51	2026-01-28 10:30:51	participation	\N	\N
159	{"city": "asdasd", "name": "adasdasdasd", "email": "asdasd@asd.ru", "phone": "+998 23 423-42-34", "gender": "female", "country": "Gaiti", "position": "asdasd", "telegram": "asda", "whatsapp": "asd", "birthdate": "13-01-2026", "education": "asdasd", "instagram": "asd", "workplace": "asdasd", "specialization": "Musiqachi"}	2026-01-28 10:38:35	2026-01-28 10:38:35	participation	\N	\N
160	{"city": "asdasd", "name": "asdasd", "email": "sdfsdf@asd.ru", "phone": "+998 23 423-42-34", "gender": "male", "country": "Gvineya", "position": "adsasd", "telegram": "adssad", "whatsapp": "asdasdasd", "birthdate": "13-01-2026", "education": "adasd", "instagram": "adsasd", "workplace": "asdasd", "specialization": "Musiqachi"}	2026-01-28 11:50:07	2026-01-28 11:50:07	participation	\N	\N
161	{"city": "asdsa", "name": "asdasd", "email": "ads@asd.ru", "phone": "+998 98 989-89-89", "gender": "male", "country": "Vatikan", "position": "adasd", "telegram": "adasd", "whatsapp": "ad", "birthdate": "08-01-2026", "education": "adsasd", "instagram": "adas", "workplace": "asdasd", "specialization": "Musiqachi"}	2026-01-28 11:54:23	2026-01-28 11:54:23	participation	\N	\N
163	{"name": "asdasd", "email": "adasd@sad.ru", "phone": "+998 23 532-45-34", "description": "asda dsasdasd sasd asd"}	2026-01-28 11:58:04	2026-01-28 16:01:05	form	1	\N
162	{"city": "Tashkent", "name": "test", "email": "adads@sad.ru", "phone": "+998 23 423-42-34", "gender": "male", "country": "Gaiti", "position": "Lavozimisadd", "telegram": "tele", "whatsapp": "wahtsasd", "birthdate": "13-01-2026", "education": "masdalsda", "instagram": "instasd", "workplace": "asdasd", "specialization": "Musiqachi"}	2026-01-28 11:56:26	2026-01-28 16:01:12	participation	1	\N
164	{"name": "Saidakbar", "email": "info@proend.uz", "phone": "+998 33 145-00-04", "description": "test matn"}	2026-01-29 12:22:44	2026-01-29 12:22:59	form	1	\N
165	{"name": "asdasdads test", "email": "asd@asd.ruy", "phone": "+998 23 423-42-34", "description": "as dasd as dasdas dasdasd"}	2026-02-13 09:47:07	2026-02-13 09:47:07	form	\N	\N
167	{"line": "560", "pageUrl": "https://vatandoshlar.7z7.uz/uz/contacts", "selectedText": "og'lan"}	2026-02-13 10:14:48	2026-02-13 10:17:51	textError	1	\N
166	{"line": "560", "pageUrl": "https://vatandoshlar.7z7.uz/uz/contacts", "selectedText": "Bog'la"}	2026-02-13 10:11:48	2026-02-13 10:18:07	textError	1	\N
168	{"line": "2431", "pageUrl": "https://vatandoshlar.7z7.uz/uz/contacts", "selectedText": "O'zbekiston, Toshkent shahri, Y"}	2026-02-13 10:18:33	2026-02-13 10:18:33	textError	\N	\N
169	{"line": "610", "pageUrl": "https://vatandoshlar.7z7.uz/", "selectedText": "sad, million vatandosh, yagona Vatan"}	2026-02-13 10:42:02	2026-02-13 10:42:02	textError	\N	\N
170	{"line": "1468", "pageUrl": "https://vatandoshlar.7z7.uz/uz", "selectedText": "Vatandoshlar"}	2026-02-13 10:44:09	2026-02-13 10:44:09	textError	\N	\N
171	{"line": "1468", "pageUrl": "https://vatandoshlar.7z7.uz/uz", "selectedText": "Vatandoshlar"}	2026-02-13 10:44:09	2026-02-13 10:44:09	textError	\N	\N
172	{"line": "1468", "pageUrl": "https://vatandoshlar.7z7.uz/uz", "selectedText": "Vatandoshlar"}	2026-02-13 10:44:10	2026-02-13 10:44:10	textError	\N	\N
173	{"line": "1397", "pageUrl": "https://vatandoshlar.7z7.uz/", "selectedText": "aat yu"}	2026-02-13 10:57:00	2026-02-13 10:57:00	textError	\N	\N
174	{"line": "1397", "pageUrl": "https://vatandoshlar.7z7.uz/", "selectedText": "aat yu"}	2026-02-13 10:57:00	2026-02-13 10:57:00	textError	\N	\N
175	{"line": "576", "pageUrl": "https://vatandoshlar.7z7.uz/uz", "selectedText": "ir maqsad, mi"}	2026-02-16 04:49:56	2026-02-16 04:49:56	textError	\N	\N
176	{"line": "1522", "pageUrl": "https://vatandoshlar.7z7.uz/uz", "selectedText": "ish, ularning huquqlarini himoya qilish va Vatan taraqqiyotiga hissa qo'shishlariga yordam beruvchi notijorat tashkilot."}	2026-02-17 09:44:08	2026-02-17 09:44:08	textError	\N	\N
177	{"name": "fds", "email": "fsdfads@gmail.com", "phone": "+998 13 223-12-31", "description": "fdsafsda"}	2026-02-17 09:44:49	2026-02-17 09:44:49	form	\N	\N
178	{"name": "fdsafdsa", "email": "fdsafdsa@gmaiul.comff", "phone": "+998 13 223-12-31", "description": "fsdafdsafdsa"}	2026-02-17 09:45:26	2026-02-17 09:45:26	form	\N	\N
179	{"line": "626", "pageUrl": "https://vatandoshlar.7z7.uz/uz", "selectedText": "\\"Vatandoshlar\\" jamoat fondi — xorijdagi vatandoshlarimiz bilan mustahkam aloqalar o'rnatish, ularning huquq va manfaatlarini"}	2026-02-17 09:45:55	2026-02-17 09:45:55	textError	\N	\N
180	{"line": "626", "pageUrl": "https://vatandoshlar.7z7.uz/uz", "selectedText": "\\"Vatandoshlar\\" jamoat fondi — xorijdagi vatandoshlarimiz bilan mustahkam aloqalar o'rnatish, ularning huquq va manfaatlarini"}	2026-02-17 09:45:55	2026-02-17 09:45:55	textError	\N	\N
181	{"job": "Musiqachi", "name": "gfdsgdfs", "address": "fdsafsdafsda", "birthdate": "2000-01-22", "extra_info": "fsdafsad", "description": "fsdfsad"}	2026-02-17 09:47:17	2026-02-18 04:59:03	application	7	\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: vatandoshlar_usr
--

COPY public.users (id, name, username, status, password, role_id, email, email_verified_at, remember_token, created_at, updated_at) FROM stdin;
1	Admin	admin	t	$2y$12$IdkZ.NfglZq6MhMc5ZI2buef.eMXylpbETW9tRtKsK2g06N.URDP2	1	\N	\N	\N	\N	\N
5	admin	Administrator	t	$2y$12$DDfw68V3BuFA0r3ucoA9O.EyhbTt9Dwm2cLi3SKU.IY27/ctTfg4W	2	\N	\N	\N	2026-01-14 18:18:26	2026-01-14 18:18:26
2	Moderator	moderator	f	$2y$12$6ZkAf8mM7gBLGpKS61RCku6S8hnXw3Sj5mcPzt5OTyHXM83QtD6C6	2	\N	\N	\N	\N	2026-01-24 13:29:04
3	Editor	editor	f	$2y$12$xmCOMOGc46IeFlCVSHaM5ujFkUnN5VgiPhHgNkR8VR.IEWnIKEw4S	2	\N	\N	\N	\N	2026-01-24 13:29:05
4	Asilvbek	Gerino	f	$2y$12$QxaBPJXJbwCC5q/qQSW2..jENwdw2VEWqne0CpGiRWiJ.JMalpaxi	2	\N	\N	\N	2026-01-14 18:13:01	2026-01-24 13:29:05
6	said	said	t	$2y$12$ee0uKc5bnt/5CKWEuj6CX..D5FB1tsC6rRkhd8LlXEqKAbqlhz0YC	3	\N	\N	\N	2026-01-27 09:18:25	2026-01-27 09:25:59
7	Amirjon	birlashma	t	$2y$12$A0iLU365dWhwQxwUYfZX0uRB6P7xMZQlvqSv9VuYnTvhNf7tI7EXS	1	\N	\N	\N	2026-02-18 04:16:06	2026-02-18 05:24:47
\.


--
-- Data for Name: view_counts; Type: TABLE DATA; Schema: public; Owner: vatandoshlar_usr
--

COPY public.view_counts (id, viewable_type, viewable_id, ip_address, user_agent, created_at, updated_at, page_section_created_at) FROM stdin;
13	App\\Models\\PageSection	33	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	2026-01-06 09:31:35	2026-01-06 09:31:35	\N
14	App\\Models\\PageSection	117	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	2026-01-07 16:22:48	2026-01-07 16:22:48	\N
15	App\\Models\\PageSection	117	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0	2026-01-09 11:50:54	2026-01-09 11:50:54	\N
16	App\\Models\\PageSection	117	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	2026-01-12 06:29:37	2026-01-12 06:29:37	\N
17	App\\Models\\PageSection	33	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	2026-01-12 06:30:02	2026-01-12 06:30:02	\N
18	App\\Models\\PageSection	119	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	2026-01-12 08:22:40	2026-01-12 08:22:40	\N
19	App\\Models\\PageSection	33	172.24.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	2026-01-14 04:57:12	2026-01-14 04:57:12	\N
20	App\\Models\\PageSection	118	172.24.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	2026-01-14 08:27:13	2026-01-14 08:27:13	\N
21	App\\Models\\PageSection	117	172.24.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	2026-01-14 08:27:28	2026-01-14 08:27:28	\N
22	App\\Models\\PageSection	119	172.24.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	2026-01-14 08:27:34	2026-01-14 08:27:34	\N
1	App\\Models\\PageSection	117	84.54.122.33	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	2026-01-17 10:00:36	2026-01-17 10:00:36	\N
2	App\\Models\\PageSection	33	84.54.122.33	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	2026-01-17 10:16:39	2026-01-17 10:16:39	\N
3	App\\Models\\PageSection	118	84.54.122.33	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	2026-01-17 11:15:04	2026-01-17 11:15:04	\N
4	App\\Models\\PageSection	119	84.54.122.33	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	2026-01-17 12:06:38	2026-01-17 12:06:38	\N
5	App\\Models\\PageSection	117	216.73.216.134	Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)	2026-01-17 12:22:17	2026-01-17 12:22:17	\N
6	App\\Models\\PageSection	118	216.73.216.134	Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)	2026-01-17 12:22:23	2026-01-17 12:22:23	\N
7	App\\Models\\PageSection	119	216.73.216.134	Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)	2026-01-17 12:23:24	2026-01-17 12:23:24	\N
8	App\\Models\\PageSection	33	216.73.216.134	Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)	2026-01-17 12:23:29	2026-01-17 12:23:29	\N
9	App\\Models\\PageSection	118	84.54.84.143	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	2026-01-17 13:38:11	2026-01-17 13:38:11	\N
10	App\\Models\\PageSection	119	213.206.63.164	Mozilla/5.0 (iPhone; CPU iPhone OS 14_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.3 Mobile/15E148 Safari/604.1	2026-01-19 05:49:05	2026-01-19 05:49:05	\N
11	App\\Models\\PageSection	117	213.206.63.164	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	2026-01-19 09:03:33	2026-01-19 09:03:33	\N
12	App\\Models\\PageSection	118	213.206.63.164	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	2026-01-19 10:40:49	2026-01-19 10:40:49	\N
23	App\\Models\\PageSection	33	195.158.2.216	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0	2026-01-19 12:42:01	2026-01-19 12:42:01	\N
24	App\\Models\\PageSection	117	195.158.2.216	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0	2026-01-19 12:42:01	2026-01-19 12:42:01	\N
25	App\\Models\\PageSection	118	195.158.2.216	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0	2026-01-19 12:42:03	2026-01-19 12:42:03	\N
26	App\\Models\\PageSection	118	213.206.63.164	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0	2026-01-19 12:42:10	2026-01-19 12:42:10	\N
27	App\\Models\\PageSection	119	74.7.241.59	Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.3; +https://openai.com/gptbot)	2026-01-20 10:32:25	2026-01-20 10:32:25	\N
28	App\\Models\\PageSection	118	74.7.241.59	Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.3; +https://openai.com/gptbot)	2026-01-20 10:32:26	2026-01-20 10:32:26	\N
29	App\\Models\\PageSection	117	74.7.241.59	Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.3; +https://openai.com/gptbot)	2026-01-20 10:32:31	2026-01-20 10:32:31	\N
30	App\\Models\\PageSection	33	74.7.241.59	Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.3; +https://openai.com/gptbot)	2026-01-20 10:35:32	2026-01-20 10:35:32	\N
31	App\\Models\\PageSection	117	213.206.63.164	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-01-20 11:12:29	2026-01-20 11:12:29	\N
32	App\\Models\\PageSection	33	213.206.63.164	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	2026-01-20 11:32:08	2026-01-20 11:32:08	\N
33	App\\Models\\PageSection	119	213.206.63.164	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	2026-01-20 11:32:30	2026-01-20 11:32:30	\N
34	App\\Models\\PageSection	33	90.156.197.174	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	2026-01-20 13:49:00	2026-01-20 13:49:00	\N
35	App\\Models\\PageSection	119	90.156.197.174	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	2026-01-20 13:49:18	2026-01-20 13:49:18	\N
36	App\\Models\\PageSection	204	213.206.63.164	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-01-21 07:53:14	2026-01-21 07:53:14	\N
37	App\\Models\\PageSection	204	213.206.63.164	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	2026-01-21 10:43:54	2026-01-21 10:43:54	\N
38	App\\Models\\PageSection	33	213.206.63.164	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-01-21 11:07:53	2026-01-21 11:07:53	\N
39	App\\Models\\PageSection	204	84.54.80.177	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	2026-01-21 21:09:53	2026-01-21 21:09:53	\N
40	App\\Models\\PageSection	210	213.206.63.164	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0	2026-01-22 05:30:42	2026-01-22 05:30:42	\N
41	App\\Models\\PageSection	117	213.206.63.164	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0	2026-01-22 06:02:43	2026-01-22 06:02:43	\N
42	App\\Models\\PageSection	211	213.206.63.164	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0	2026-01-22 06:02:45	2026-01-22 06:02:45	\N
43	App\\Models\\PageSection	33	213.206.63.164	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0	2026-01-22 06:02:57	2026-01-22 06:02:57	\N
44	App\\Models\\PageSection	119	213.206.63.164	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0	2026-01-22 06:03:00	2026-01-22 06:03:00	\N
45	App\\Models\\PageSection	211	213.206.63.164	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-01-22 06:15:30	2026-01-22 06:15:30	\N
46	App\\Models\\PageSection	118	213.206.63.164	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-01-22 09:03:14	2026-01-22 09:03:14	\N
47	App\\Models\\PageSection	118	149.154.161.235	TelegramBot (like TwitterBot)	2026-01-22 09:17:56	2026-01-22 09:17:56	\N
48	App\\Models\\PageSection	211	149.154.161.236	TelegramBot (like TwitterBot)	2026-01-22 09:18:13	2026-01-22 09:18:13	\N
49	App\\Models\\PageSection	117	90.156.197.210	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-01-22 12:11:08	2026-01-22 12:11:08	\N
50	App\\Models\\PageSection	211	213.206.63.164	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	2026-01-22 13:27:44	2026-01-22 13:27:44	\N
51	App\\Models\\PageSection	211	195.158.2.216	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-01-22 14:54:45	2026-01-22 14:54:45	\N
52	App\\Models\\PageSection	214	213.206.63.164	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-01-22 15:09:35	2026-01-22 15:09:35	\N
53	App\\Models\\PageSection	214	195.158.2.216	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-01-22 15:15:22	2026-01-22 15:15:22	\N
54	App\\Models\\PageSection	118	195.158.2.216	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-01-22 15:18:58	2026-01-22 15:18:58	\N
55	App\\Models\\PageSection	119	195.158.2.216	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-01-22 15:19:05	2026-01-22 15:19:05	\N
56	App\\Models\\PageSection	211	149.154.161.213	TelegramBot (like TwitterBot)	2026-01-22 15:19:19	2026-01-22 15:19:19	\N
57	App\\Models\\PageSection	214	213.230.72.155	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-01-22 16:57:02	2026-01-22 16:57:02	\N
58	App\\Models\\PageSection	214	84.54.92.157	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	2026-01-23 11:21:24	2026-01-23 11:21:24	\N
59	App\\Models\\PageSection	119	84.54.92.157	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	2026-01-23 11:52:13	2026-01-23 11:52:13	\N
60	App\\Models\\PageSection	118	84.54.92.157	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	2026-01-23 11:52:16	2026-01-23 11:52:16	\N
61	App\\Models\\PageSection	33	84.54.92.157	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	2026-01-23 11:52:19	2026-01-23 11:52:19	\N
62	App\\Models\\PageSection	117	84.54.92.157	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	2026-01-23 11:52:25	2026-01-23 11:52:25	\N
63	App\\Models\\PageSection	211	84.54.92.157	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	2026-01-23 11:52:32	2026-01-23 11:52:32	\N
64	App\\Models\\PageSection	211	149.154.161.202	TelegramBot (like TwitterBot)	2026-01-23 11:53:13	2026-01-23 11:53:13	\N
65	App\\Models\\PageSection	211	84.54.92.157	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-01-23 11:55:07	2026-01-23 11:55:07	\N
66	App\\Models\\PageSection	211	149.154.161.217	TelegramBot (like TwitterBot)	2026-01-23 12:02:12	2026-01-23 12:02:12	\N
67	App\\Models\\PageSection	211	149.154.161.246	TelegramBot (like TwitterBot)	2026-01-23 12:02:14	2026-01-23 12:02:14	\N
68	App\\Models\\PageSection	211	149.154.161.203	TelegramBot (like TwitterBot)	2026-01-23 12:02:20	2026-01-23 12:02:20	\N
69	App\\Models\\PageSection	214	84.54.92.157	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-01-24 11:50:01	2026-01-24 11:50:01	\N
70	App\\Models\\PageSection	33	84.54.92.157	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-01-24 12:02:19	2026-01-24 12:02:19	\N
71	App\\Models\\PageSection	211	74.7.242.50	Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.3; +https://openai.com/gptbot)	2026-01-27 00:58:51	2026-01-27 00:58:51	\N
72	App\\Models\\PageSection	214	74.7.242.50	Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.3; +https://openai.com/gptbot)	2026-01-27 00:59:18	2026-01-27 00:59:18	\N
73	App\\Models\\PageSection	214	84.54.94.131	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-01-27 09:05:53	2026-01-27 09:05:53	2026-01-22 13:44:13
74	App\\Models\\PageSection	214	157.245.217.212	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	2026-02-02 10:14:01	2026-02-02 10:14:01	2026-01-22 13:44:13
75	App\\Models\\PageSection	214	213.230.88.110	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-02-02 12:02:34	2026-02-02 12:02:34	2026-01-22 13:44:13
76	App\\Models\\PageSection	211	84.54.122.37	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-02-03 12:42:21	2026-02-03 12:42:21	2026-01-22 05:29:16
77	App\\Models\\PageSection	117	84.54.122.37	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-02-03 12:42:29	2026-02-03 12:42:29	2025-12-27 16:57:51
78	App\\Models\\PageSection	119	84.54.122.37	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-02-03 12:42:44	2026-02-03 12:42:44	2025-12-27 17:01:20
79	App\\Models\\PageSection	118	84.54.122.37	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-02-03 12:42:47	2026-02-03 12:42:47	2025-12-27 16:59:20
80	App\\Models\\PageSection	33	84.54.122.37	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-02-03 12:42:51	2026-02-03 12:42:51	2025-12-23 06:21:44
81	App\\Models\\PageSection	214	84.54.80.241	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-02-03 18:29:35	2026-02-03 18:29:35	2026-01-22 13:44:13
82	App\\Models\\PageSection	215	84.54.80.241	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-02-03 18:29:42	2026-02-03 18:29:42	2026-02-03 18:29:24
83	App\\Models\\PageSection	211	84.54.80.241	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-02-03 18:45:48	2026-02-03 18:45:48	2026-01-22 05:29:16
84	App\\Models\\PageSection	214	82.215.102.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0	2026-02-03 18:59:10	2026-02-03 18:59:10	2026-01-22 13:44:13
85	App\\Models\\PageSection	117	82.215.102.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0	2026-02-03 19:26:19	2026-02-03 19:26:19	2025-12-27 16:57:51
86	App\\Models\\PageSection	211	82.215.102.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0	2026-02-03 19:26:22	2026-02-03 19:26:22	2026-01-22 05:29:16
87	App\\Models\\PageSection	211	195.158.9.219	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-02-05 09:43:02	2026-02-05 09:43:02	2026-01-22 05:29:16
88	App\\Models\\PageSection	214	195.158.9.219	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-02-05 09:43:29	2026-02-05 09:43:29	2026-01-22 13:44:13
89	App\\Models\\PageSection	214	195.158.2.216	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-02-05 09:49:45	2026-02-05 09:49:45	2026-01-22 13:44:13
90	App\\Models\\PageSection	214	144.124.192.249	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-02-05 11:21:57	2026-02-05 11:21:57	2026-01-22 13:44:13
91	App\\Models\\PageSection	216	195.158.9.219	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-02-05 12:07:03	2026-02-05 12:07:03	2026-02-05 12:06:56
92	App\\Models\\PageSection	216	149.154.161.250	TelegramBot (like TwitterBot)	2026-02-05 12:07:51	2026-02-05 12:07:51	2026-02-05 12:06:56
93	App\\Models\\PageSection	217	144.124.192.249	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-02-05 14:33:10	2026-02-05 14:33:10	2026-02-05 12:10:24
94	App\\Models\\PageSection	216	144.124.192.249	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-02-05 14:33:28	2026-02-05 14:33:28	2026-02-05 12:06:56
95	App\\Models\\PageSection	215	74.7.241.10	Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.3; +https://openai.com/gptbot)	2026-02-05 18:13:49	2026-02-05 18:13:49	2026-02-03 18:29:24
96	App\\Models\\PageSection	217	74.7.241.10	Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.3; +https://openai.com/gptbot)	2026-02-05 18:14:04	2026-02-05 18:14:04	2026-02-05 12:10:24
97	App\\Models\\PageSection	216	74.7.241.10	Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.3; +https://openai.com/gptbot)	2026-02-05 18:14:10	2026-02-05 18:14:10	2026-02-05 12:06:56
98	App\\Models\\PageSection	33	195.158.2.216	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-02-06 05:31:24	2026-02-06 05:31:24	2025-12-23 06:21:44
99	App\\Models\\PageSection	217	195.158.2.216	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-02-06 05:31:59	2026-02-06 05:31:59	2026-02-05 12:10:24
100	App\\Models\\PageSection	215	195.158.2.216	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-02-06 05:32:13	2026-02-06 05:32:13	2026-02-03 18:29:24
101	App\\Models\\PageSection	33	144.124.192.249	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-02-06 05:52:48	2026-02-06 05:52:48	2025-12-23 06:21:44
102	App\\Models\\PageSection	216	144.124.192.249	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0	2026-02-06 07:03:17	2026-02-06 07:03:17	2026-02-05 12:06:56
103	App\\Models\\PageSection	215	144.124.192.249	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0	2026-02-06 07:12:59	2026-02-06 07:12:59	2026-02-03 18:29:24
104	App\\Models\\PageSection	218	144.124.192.249	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0	2026-02-06 07:14:11	2026-02-06 07:14:11	2026-02-06 07:14:05
105	App\\Models\\PageSection	216	195.158.2.216	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0	2026-02-06 08:07:01	2026-02-06 08:07:01	2026-02-05 12:06:56
106	App\\Models\\PageSection	33	144.124.192.249	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0	2026-02-06 09:01:53	2026-02-06 09:01:53	2025-12-23 06:21:44
107	App\\Models\\PageSection	216	195.158.9.219	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	2026-02-06 10:39:14	2026-02-06 10:39:14	2026-02-05 12:06:56
108	App\\Models\\PageSection	33	188.113.205.198	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36	2026-02-07 09:09:48	2026-02-07 09:09:48	2025-12-23 06:21:44
109	App\\Models\\PageSection	216	188.113.205.198	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36	2026-02-07 09:10:37	2026-02-07 09:10:37	2026-02-05 12:06:56
110	App\\Models\\PageSection	216	185.213.230.30	Mozilla/5.0 (iPhone; CPU iPhone OS 18_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.0 Mobile/23A341 Safari/604.1	2026-02-08 20:31:02	2026-02-08 20:31:02	2026-02-05 12:06:56
111	App\\Models\\PageSection	217	195.158.9.219	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-02-09 06:40:32	2026-02-09 06:40:32	2026-02-05 12:10:24
112	App\\Models\\PageSection	215	144.124.192.119	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0	2026-02-10 08:22:51	2026-02-10 08:22:51	2026-02-03 18:29:24
113	App\\Models\\PageSection	33	185.213.229.52	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-02-10 15:26:36	2026-02-10 15:26:36	2025-12-23 06:21:44
114	App\\Models\\PageSection	219	195.158.9.219	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-02-13 07:06:19	2026-02-13 07:06:19	2026-02-13 07:05:44
115	App\\Models\\PageSection	219	149.154.161.221	TelegramBot (like TwitterBot)	2026-02-13 07:07:18	2026-02-13 07:07:18	2026-02-13 07:05:44
116	App\\Models\\PageSection	219	95.161.76.26	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36	2026-02-13 07:07:25	2026-02-13 07:07:25	2026-02-13 07:05:44
117	App\\Models\\PageSection	219	144.124.192.187	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0	2026-02-13 07:08:01	2026-02-13 07:08:01	2026-02-13 07:05:44
118	App\\Models\\PageSection	219	149.154.161.236	TelegramBot (like TwitterBot)	2026-02-13 07:08:19	2026-02-13 07:08:19	2026-02-13 07:05:44
119	App\\Models\\PageSection	219	95.161.76.41	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62	2026-02-13 07:08:26	2026-02-13 07:08:26	2026-02-13 07:05:44
120	App\\Models\\PageSection	219	149.154.161.198	TelegramBot (like TwitterBot)	2026-02-13 07:09:21	2026-02-13 07:09:21	2026-02-13 07:05:44
121	App\\Models\\PageSection	219	95.161.76.3	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36	2026-02-13 07:09:27	2026-02-13 07:09:27	2026-02-13 07:05:44
122	App\\Models\\PageSection	222	195.158.9.219	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-02-13 07:14:44	2026-02-13 07:14:44	2026-02-13 07:12:56
123	App\\Models\\PageSection	224	195.158.9.219	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-02-13 07:16:59	2026-02-13 07:16:59	2026-02-13 07:16:47
124	App\\Models\\PageSection	220	195.158.9.219	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-02-13 07:17:24	2026-02-13 07:17:24	2026-02-13 07:08:59
125	App\\Models\\PageSection	219	195.158.2.216	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0	2026-02-13 07:17:24	2026-02-13 07:17:24	2026-02-13 07:05:44
126	App\\Models\\PageSection	225	195.158.9.219	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-02-13 07:24:13	2026-02-13 07:24:13	2026-02-13 07:23:54
127	App\\Models\\PageSection	226	195.158.9.219	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-02-13 07:31:03	2026-02-13 07:31:03	2026-02-13 07:29:52
128	App\\Models\\PageSection	221	195.158.9.219	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-02-13 07:31:11	2026-02-13 07:31:11	2026-02-13 07:11:08
129	App\\Models\\PageSection	223	195.158.9.219	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-02-13 07:31:15	2026-02-13 07:31:15	2026-02-13 07:14:31
130	App\\Models\\PageSection	33	195.158.9.219	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-02-13 07:31:44	2026-02-13 07:31:44	2025-12-23 06:21:44
131	App\\Models\\PageSection	225	144.124.192.187	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1	2026-02-13 10:10:48	2026-02-13 10:10:48	2026-02-13 07:23:54
132	App\\Models\\PageSection	222	144.124.192.187	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1	2026-02-13 10:11:40	2026-02-13 10:11:40	2026-02-13 07:12:56
133	App\\Models\\PageSection	226	185.213.229.15	Mozilla/5.0 (iPhone; CPU iPhone OS 26_0_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/145.0.7632.55 Mobile/15E148 Safari/604.1	2026-02-14 07:22:08	2026-02-14 07:22:08	2026-02-13 07:29:52
134	App\\Models\\PageSection	222	185.213.229.15	Mozilla/5.0 (iPhone; CPU iPhone OS 26_0_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/145.0.7632.55 Mobile/15E148 Safari/604.1	2026-02-14 07:54:04	2026-02-14 07:54:04	2026-02-13 07:12:56
135	App\\Models\\PageSection	223	144.124.192.187	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-02-14 09:04:09	2026-02-14 09:04:09	2026-02-13 07:14:31
136	App\\Models\\PageSection	226	144.124.192.187	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-02-14 10:14:35	2026-02-14 10:14:35	2026-02-13 07:29:52
137	App\\Models\\PageSection	219	213.230.72.61	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-02-15 15:55:56	2026-02-15 15:55:56	2026-02-13 07:05:44
138	App\\Models\\PageSection	226	195.158.9.219	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-02-16 04:48:17	2026-02-16 04:48:17	2026-02-13 07:29:52
139	App\\Models\\PageSection	225	195.158.9.219	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-02-16 04:48:37	2026-02-16 04:48:37	2026-02-13 07:23:54
140	App\\Models\\PageSection	220	144.124.196.6	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-02-16 14:37:53	2026-02-16 14:37:53	2026-02-13 07:08:59
141	App\\Models\\PageSection	219	144.124.196.6	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-02-17 06:40:35	2026-02-17 06:40:35	2026-02-13 07:05:44
142	App\\Models\\PageSection	217	144.124.196.6	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	2026-02-17 06:52:31	2026-02-17 06:52:31	2026-02-05 12:10:24
143	App\\Models\\PageSection	220	74.7.227.177	Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.3; +https://openai.com/gptbot)	2026-02-17 08:42:18	2026-02-17 08:42:18	2026-02-13 07:08:59
144	App\\Models\\PageSection	225	74.7.227.177	Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.3; +https://openai.com/gptbot)	2026-02-17 08:42:44	2026-02-17 08:42:44	2026-02-13 07:23:54
145	App\\Models\\PageSection	222	74.7.227.177	Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.3; +https://openai.com/gptbot)	2026-02-17 08:43:01	2026-02-17 08:43:01	2026-02-13 07:12:56
146	App\\Models\\PageSection	226	74.7.227.177	Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.3; +https://openai.com/gptbot)	2026-02-17 08:44:30	2026-02-17 08:44:30	2026-02-13 07:29:52
147	App\\Models\\PageSection	220	144.124.196.11	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	2026-02-20 07:05:07	2026-02-20 07:05:07	2026-02-13 07:08:59
148	App\\Models\\PageSection	223	74.7.243.242	Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.3; +https://openai.com/gptbot)	2026-02-20 08:31:54	2026-02-20 08:31:54	2026-02-13 07:14:31
149	App\\Models\\PageSection	219	74.7.243.242	Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.3; +https://openai.com/gptbot)	2026-02-20 08:35:57	2026-02-20 08:35:57	2026-02-13 07:05:44
150	App\\Models\\PageSection	224	74.7.243.242	Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.3; +https://openai.com/gptbot)	2026-02-20 08:38:49	2026-02-20 08:38:49	2026-02-13 07:16:47
151	App\\Models\\PageSection	221	74.7.243.242	Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.3; +https://openai.com/gptbot)	2026-02-20 08:38:49	2026-02-20 08:38:49	2026-02-13 07:11:08
152	App\\Models\\PageSection	226	195.158.9.219	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	2026-02-23 07:32:04	2026-02-23 07:32:04	2026-02-13 07:29:52
153	App\\Models\\PageSection	161	144.124.192.45	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	2026-02-23 12:14:11	2026-02-23 12:14:11	2026-01-05 04:59:44
154	App\\Models\\PageSection	162	144.124.192.45	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	2026-02-23 12:17:09	2026-02-23 12:17:09	2026-01-05 05:00:18
155	App\\Models\\PageSection	163	144.124.192.45	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	2026-02-23 12:17:11	2026-02-23 12:17:11	2026-01-05 05:00:57
156	App\\Models\\PageSection	161	194.93.24.238	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	2026-02-23 14:04:23	2026-02-23 14:04:23	2026-01-05 04:59:44
157	App\\Models\\PageSection	162	74.7.241.62	Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.3; +https://openai.com/gptbot)	2026-02-24 07:27:16	2026-02-24 07:27:16	2026-01-05 05:00:18
158	App\\Models\\PageSection	163	74.7.241.62	Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.3; +https://openai.com/gptbot)	2026-02-24 07:27:16	2026-02-24 07:27:16	2026-01-05 05:00:57
159	App\\Models\\PageSection	161	74.7.241.62	Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.3; +https://openai.com/gptbot)	2026-02-24 07:27:20	2026-02-24 07:27:20	2026-01-05 04:59:44
160	App\\Models\\PageSection	161	195.158.9.219	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	2026-02-24 10:41:28	2026-02-24 10:41:28	2026-01-05 04:59:44
161	App\\Models\\PageSection	222	144.124.192.45	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0	2026-02-24 12:36:57	2026-02-24 12:36:57	2026-02-13 07:12:56
162	App\\Models\\PageSection	226	144.124.192.45	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	2026-02-26 03:58:16	2026-02-26 03:58:16	2026-02-13 07:29:52
\.


--
-- Name: content_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vatandoshlar_usr
--

SELECT pg_catalog.setval('public.content_images_id_seq', 3, true);


--
-- Name: content_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vatandoshlar_usr
--

SELECT pg_catalog.setval('public.content_settings_id_seq', 1, false);


--
-- Name: content_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vatandoshlar_usr
--

SELECT pg_catalog.setval('public.content_translations_id_seq', 1, false);


--
-- Name: contents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vatandoshlar_usr
--

SELECT pg_catalog.setval('public.contents_id_seq', 1, false);


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vatandoshlar_usr
--

SELECT pg_catalog.setval('public.countries_id_seq', 1, false);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vatandoshlar_usr
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: form_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vatandoshlar_usr
--

SELECT pg_catalog.setval('public.form_images_id_seq', 4, true);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vatandoshlar_usr
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- Name: lang_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vatandoshlar_usr
--

SELECT pg_catalog.setval('public.lang_images_id_seq', 10, true);


--
-- Name: langs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vatandoshlar_usr
--

SELECT pg_catalog.setval('public.langs_id_seq', 1, false);


--
-- Name: menu_main_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vatandoshlar_usr
--

SELECT pg_catalog.setval('public.menu_main_images_id_seq', 1, false);


--
-- Name: menu_main_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vatandoshlar_usr
--

SELECT pg_catalog.setval('public.menu_main_settings_id_seq', 1, false);


--
-- Name: menu_main_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vatandoshlar_usr
--

SELECT pg_catalog.setval('public.menu_main_translations_id_seq', 1, false);


--
-- Name: menu_mains_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vatandoshlar_usr
--

SELECT pg_catalog.setval('public.menu_mains_id_seq', 1, false);


--
-- Name: menus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vatandoshlar_usr
--

SELECT pg_catalog.setval('public.menus_id_seq', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vatandoshlar_usr
--

SELECT pg_catalog.setval('public.migrations_id_seq', 1, false);


--
-- Name: order_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vatandoshlar_usr
--

SELECT pg_catalog.setval('public.order_settings_id_seq', 1, false);


--
-- Name: page_section_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vatandoshlar_usr
--

SELECT pg_catalog.setval('public.page_section_images_id_seq', 14, true);


--
-- Name: page_section_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vatandoshlar_usr
--

SELECT pg_catalog.setval('public.page_section_settings_id_seq', 1, false);


--
-- Name: page_section_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vatandoshlar_usr
--

SELECT pg_catalog.setval('public.page_section_translations_id_seq', 1, false);


--
-- Name: page_sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vatandoshlar_usr
--

SELECT pg_catalog.setval('public.page_sections_id_seq', 2, true);


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vatandoshlar_usr
--

SELECT pg_catalog.setval('public.permissions_id_seq', 1, false);


--
-- Name: role_menu_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vatandoshlar_usr
--

SELECT pg_catalog.setval('public.role_menu_permissions_id_seq', 45, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vatandoshlar_usr
--

SELECT pg_catalog.setval('public.roles_id_seq', 1, false);


--
-- Name: setting_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vatandoshlar_usr
--

SELECT pg_catalog.setval('public.setting_images_id_seq', 1, false);


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vatandoshlar_usr
--

SELECT pg_catalog.setval('public.settings_id_seq', 1, false);


--
-- Name: socials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vatandoshlar_usr
--

SELECT pg_catalog.setval('public.socials_id_seq', 4, true);


--
-- Name: supports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vatandoshlar_usr
--

SELECT pg_catalog.setval('public.supports_id_seq', 13, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vatandoshlar_usr
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: view_counts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vatandoshlar_usr
--

SELECT pg_catalog.setval('public.view_counts_id_seq', 26, true);


--
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: vatandoshlar_usr
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: vatandoshlar_usr
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- Name: content_images content_images_pkey; Type: CONSTRAINT; Schema: public; Owner: vatandoshlar_usr
--

ALTER TABLE ONLY public.content_images
    ADD CONSTRAINT content_images_pkey PRIMARY KEY (id);


--
-- Name: content_settings content_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: vatandoshlar_usr
--

ALTER TABLE ONLY public.content_settings
    ADD CONSTRAINT content_settings_pkey PRIMARY KEY (id);


--
-- Name: content_translations content_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: vatandoshlar_usr
--

ALTER TABLE ONLY public.content_translations
    ADD CONSTRAINT content_translations_pkey PRIMARY KEY (id);


--
-- Name: contents contents_pkey; Type: CONSTRAINT; Schema: public; Owner: vatandoshlar_usr
--

ALTER TABLE ONLY public.contents
    ADD CONSTRAINT contents_pkey PRIMARY KEY (id);


--
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: vatandoshlar_usr
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: vatandoshlar_usr
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: form_images form_images_pkey; Type: CONSTRAINT; Schema: public; Owner: vatandoshlar_usr
--

ALTER TABLE ONLY public.form_images
    ADD CONSTRAINT form_images_pkey PRIMARY KEY (id);


--
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: vatandoshlar_usr
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: vatandoshlar_usr
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: lang_images lang_images_pkey; Type: CONSTRAINT; Schema: public; Owner: vatandoshlar_usr
--

ALTER TABLE ONLY public.lang_images
    ADD CONSTRAINT lang_images_pkey PRIMARY KEY (id);


--
-- Name: langs langs_pkey; Type: CONSTRAINT; Schema: public; Owner: vatandoshlar_usr
--

ALTER TABLE ONLY public.langs
    ADD CONSTRAINT langs_pkey PRIMARY KEY (id);


--
-- Name: menu_main_images menu_main_images_pkey; Type: CONSTRAINT; Schema: public; Owner: vatandoshlar_usr
--

ALTER TABLE ONLY public.menu_main_images
    ADD CONSTRAINT menu_main_images_pkey PRIMARY KEY (id);


--
-- Name: menu_main_settings menu_main_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: vatandoshlar_usr
--

ALTER TABLE ONLY public.menu_main_settings
    ADD CONSTRAINT menu_main_settings_pkey PRIMARY KEY (id);


--
-- Name: menu_main_translations menu_main_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: vatandoshlar_usr
--

ALTER TABLE ONLY public.menu_main_translations
    ADD CONSTRAINT menu_main_translations_pkey PRIMARY KEY (id);


--
-- Name: menu_mains menu_mains_pkey; Type: CONSTRAINT; Schema: public; Owner: vatandoshlar_usr
--

ALTER TABLE ONLY public.menu_mains
    ADD CONSTRAINT menu_mains_pkey PRIMARY KEY (id);


--
-- Name: menus menus_pkey; Type: CONSTRAINT; Schema: public; Owner: vatandoshlar_usr
--

ALTER TABLE ONLY public.menus
    ADD CONSTRAINT menus_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: vatandoshlar_usr
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: order_settings order_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: vatandoshlar_usr
--

ALTER TABLE ONLY public.order_settings
    ADD CONSTRAINT order_settings_pkey PRIMARY KEY (id);


--
-- Name: page_section_blocks page_section_blocks_pkey; Type: CONSTRAINT; Schema: public; Owner: vatandoshlar_usr
--

ALTER TABLE ONLY public.page_section_blocks
    ADD CONSTRAINT page_section_blocks_pkey PRIMARY KEY (id);


--
-- Name: page_section_images page_section_images_pkey; Type: CONSTRAINT; Schema: public; Owner: vatandoshlar_usr
--

ALTER TABLE ONLY public.page_section_images
    ADD CONSTRAINT page_section_images_pkey PRIMARY KEY (id);


--
-- Name: page_section_settings page_section_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: vatandoshlar_usr
--

ALTER TABLE ONLY public.page_section_settings
    ADD CONSTRAINT page_section_settings_pkey PRIMARY KEY (id);


--
-- Name: page_section_translations page_section_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: vatandoshlar_usr
--

ALTER TABLE ONLY public.page_section_translations
    ADD CONSTRAINT page_section_translations_pkey PRIMARY KEY (id);


--
-- Name: page_sections page_sections_pkey; Type: CONSTRAINT; Schema: public; Owner: vatandoshlar_usr
--

ALTER TABLE ONLY public.page_sections
    ADD CONSTRAINT page_sections_pkey PRIMARY KEY (id);


--
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: vatandoshlar_usr
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: vatandoshlar_usr
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: role_menu_permissions role_menu_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: vatandoshlar_usr
--

ALTER TABLE ONLY public.role_menu_permissions
    ADD CONSTRAINT role_menu_permissions_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: vatandoshlar_usr
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: vatandoshlar_usr
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: setting_images setting_images_pkey; Type: CONSTRAINT; Schema: public; Owner: vatandoshlar_usr
--

ALTER TABLE ONLY public.setting_images
    ADD CONSTRAINT setting_images_pkey PRIMARY KEY (id);


--
-- Name: settings settings_pkey; Type: CONSTRAINT; Schema: public; Owner: vatandoshlar_usr
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- Name: socials socials_pkey; Type: CONSTRAINT; Schema: public; Owner: vatandoshlar_usr
--

ALTER TABLE ONLY public.socials
    ADD CONSTRAINT socials_pkey PRIMARY KEY (id);


--
-- Name: supports supports_pkey; Type: CONSTRAINT; Schema: public; Owner: vatandoshlar_usr
--

ALTER TABLE ONLY public.supports
    ADD CONSTRAINT supports_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: vatandoshlar_usr
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: view_counts view_counts_pkey; Type: CONSTRAINT; Schema: public; Owner: vatandoshlar_usr
--

ALTER TABLE ONLY public.view_counts
    ADD CONSTRAINT view_counts_pkey PRIMARY KEY (id);


--
-- Name: content_images_main_index; Type: INDEX; Schema: public; Owner: vatandoshlar_usr
--

CREATE INDEX content_images_main_index ON public.content_images USING btree (main);


--
-- Name: content_settings_key_is_translatable_status_sort_order_index; Type: INDEX; Schema: public; Owner: vatandoshlar_usr
--

CREATE INDEX content_settings_key_is_translatable_status_sort_order_index ON public.content_settings USING btree (key, is_translatable, status, sort_order);


--
-- Name: content_translations_locale_index; Type: INDEX; Schema: public; Owner: vatandoshlar_usr
--

CREATE INDEX content_translations_locale_index ON public.content_translations USING btree (locale);


--
-- Name: contents_type_slug_status_sort_order_index; Type: INDEX; Schema: public; Owner: vatandoshlar_usr
--

CREATE INDEX contents_type_slug_status_sort_order_index ON public.contents USING btree (type, slug, status, sort_order);


--
-- Name: failed_jobs_uuid_unique; Type: INDEX; Schema: public; Owner: vatandoshlar_usr
--

CREATE UNIQUE INDEX failed_jobs_uuid_unique ON public.failed_jobs USING btree (uuid);


--
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: vatandoshlar_usr
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- Name: lang_images_main_index; Type: INDEX; Schema: public; Owner: vatandoshlar_usr
--

CREATE INDEX lang_images_main_index ON public.lang_images USING btree (main);


--
-- Name: langs_code_unique; Type: INDEX; Schema: public; Owner: vatandoshlar_usr
--

CREATE UNIQUE INDEX langs_code_unique ON public.langs USING btree (code);


--
-- Name: menu_main_images_main_index; Type: INDEX; Schema: public; Owner: vatandoshlar_usr
--

CREATE INDEX menu_main_images_main_index ON public.menu_main_images USING btree (main);


--
-- Name: menu_main_settings_key_is_translatable_status_sort_order_index; Type: INDEX; Schema: public; Owner: vatandoshlar_usr
--

CREATE INDEX menu_main_settings_key_is_translatable_status_sort_order_index ON public.menu_main_settings USING btree (key, is_translatable, status, sort_order);


--
-- Name: menu_main_translations_locale_index; Type: INDEX; Schema: public; Owner: vatandoshlar_usr
--

CREATE INDEX menu_main_translations_locale_index ON public.menu_main_translations USING btree (locale);


--
-- Name: menu_mains_type_slug_status_sort_order_index; Type: INDEX; Schema: public; Owner: vatandoshlar_usr
--

CREATE INDEX menu_mains_type_slug_status_sort_order_index ON public.menu_mains USING btree (type, slug, status, sort_order);


--
-- Name: page_section_images_main_status_category_category_slug_page_sec; Type: INDEX; Schema: public; Owner: vatandoshlar_usr
--

CREATE INDEX page_section_images_main_status_category_category_slug_page_sec ON public.page_section_images USING btree (main, status, category, category_slug, page_section_parent_id, page_section_id);


--
-- Name: page_section_settings_key_is_translatable_status_sort_order_cat; Type: INDEX; Schema: public; Owner: vatandoshlar_usr
--

CREATE INDEX page_section_settings_key_is_translatable_status_sort_order_cat ON public.page_section_settings USING btree (key, is_translatable, status, sort_order, category, category_slug);


--
-- Name: page_section_translations_locale_category_page_section_id_page_; Type: INDEX; Schema: public; Owner: vatandoshlar_usr
--

CREATE INDEX page_section_translations_locale_category_page_section_id_page_ ON public.page_section_translations USING btree (locale, category, page_section_id, page_section_parent_id, category_slug);


--
-- Name: page_sections_status_sort_order_menu_main_id_category_category_; Type: INDEX; Schema: public; Owner: vatandoshlar_usr
--

CREATE INDEX page_sections_status_sort_order_menu_main_id_category_category_ ON public.page_sections USING btree (status, sort_order, menu_main_id, category, category_slug, parent_id);


--
-- Name: role_menu_permissions_role_id_menu_main_id_permission_id_index; Type: INDEX; Schema: public; Owner: vatandoshlar_usr
--

CREATE INDEX role_menu_permissions_role_id_menu_main_id_permission_id_index ON public.role_menu_permissions USING btree (role_id, menu_main_id, permission_id);


--
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: vatandoshlar_usr
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: vatandoshlar_usr
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- Name: setting_images_main_index; Type: INDEX; Schema: public; Owner: vatandoshlar_usr
--

CREATE INDEX setting_images_main_index ON public.setting_images USING btree (main);


--
-- Name: users_username_unique; Type: INDEX; Schema: public; Owner: vatandoshlar_usr
--

CREATE UNIQUE INDEX users_username_unique ON public.users USING btree (username);


--
-- Name: view_counts_viewable_type_viewable_id_index; Type: INDEX; Schema: public; Owner: vatandoshlar_usr
--

CREATE INDEX view_counts_viewable_type_viewable_id_index ON public.view_counts USING btree (viewable_type, viewable_id);


--
-- Name: content_images content_images_content_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: vatandoshlar_usr
--

ALTER TABLE ONLY public.content_images
    ADD CONSTRAINT content_images_content_id_foreign FOREIGN KEY (content_id) REFERENCES public.contents(id);


--
-- Name: content_translations content_translations_content_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: vatandoshlar_usr
--

ALTER TABLE ONLY public.content_translations
    ADD CONSTRAINT content_translations_content_id_foreign FOREIGN KEY (content_id) REFERENCES public.contents(id) ON DELETE CASCADE;


--
-- Name: contents contents_parent_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: vatandoshlar_usr
--

ALTER TABLE ONLY public.contents
    ADD CONSTRAINT contents_parent_id_foreign FOREIGN KEY (parent_id) REFERENCES public.contents(id);


--
-- Name: menu_main_images menu_main_images_menu_main_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: vatandoshlar_usr
--

ALTER TABLE ONLY public.menu_main_images
    ADD CONSTRAINT menu_main_images_menu_main_id_foreign FOREIGN KEY (menu_main_id) REFERENCES public.menu_mains(id);


--
-- Name: menu_main_translations menu_main_translations_menu_main_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: vatandoshlar_usr
--

ALTER TABLE ONLY public.menu_main_translations
    ADD CONSTRAINT menu_main_translations_menu_main_id_foreign FOREIGN KEY (menu_main_id) REFERENCES public.menu_mains(id) ON DELETE CASCADE;


--
-- Name: menu_mains menu_mains_parent_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: vatandoshlar_usr
--

ALTER TABLE ONLY public.menu_mains
    ADD CONSTRAINT menu_mains_parent_id_foreign FOREIGN KEY (parent_id) REFERENCES public.menu_mains(id);


--
-- Name: role_menu_permissions role_menu_permissions_menu_main_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: vatandoshlar_usr
--

ALTER TABLE ONLY public.role_menu_permissions
    ADD CONSTRAINT role_menu_permissions_menu_main_id_foreign FOREIGN KEY (menu_main_id) REFERENCES public.menu_mains(id) ON DELETE CASCADE;


--
-- Name: role_menu_permissions role_menu_permissions_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: vatandoshlar_usr
--

ALTER TABLE ONLY public.role_menu_permissions
    ADD CONSTRAINT role_menu_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- Name: role_menu_permissions role_menu_permissions_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: vatandoshlar_usr
--

ALTER TABLE ONLY public.role_menu_permissions
    ADD CONSTRAINT role_menu_permissions_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- Name: setting_images setting_images_setting_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: vatandoshlar_usr
--

ALTER TABLE ONLY public.setting_images
    ADD CONSTRAINT setting_images_setting_id_foreign FOREIGN KEY (setting_id) REFERENCES public.settings(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO vatandoshlar_7z7_db_grp;


--
-- PostgreSQL database dump complete
--

\unrestrict cch8ZEr0yjhNL2IhxKZTtm8CBHEou69d3lvKCFgnSfEAo6iEBCYzpUUgqz49abL


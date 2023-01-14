--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE keycloak;




--
-- Drop roles
--

DROP ROLE postgres;


--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:/GzFOMA8k08TUKteIoQ0AA==$8cQ6Kym0QxRfwhcVDx3MY4r63LalZeBxsHakJcwhWfE=:Sbs6bonYWFsumPByNWWzu3eJchH75ryrzDkEM7hXhKQ=';






--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Debian 14.5-1.pgdg110+1)
-- Dumped by pg_dump version 14.5 (Debian 14.5-1.pgdg110+1)

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO postgres;

\connect template1

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
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: postgres
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "keycloak" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Debian 14.5-1.pgdg110+1)
-- Dumped by pg_dump version 14.5 (Debian 14.5-1.pgdg110+1)

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
-- Name: keycloak; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE keycloak WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE keycloak OWNER TO postgres;

\connect keycloak

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin_event_entity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64)
);


ALTER TABLE public.admin_event_entity OWNER TO postgres;

--
-- Name: associated_policy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE public.associated_policy OWNER TO postgres;

--
-- Name: authentication_execution; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);


ALTER TABLE public.authentication_execution OWNER TO postgres;

--
-- Name: authentication_flow; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);


ALTER TABLE public.authentication_flow OWNER TO postgres;

--
-- Name: authenticator_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.authenticator_config OWNER TO postgres;

--
-- Name: authenticator_config_entry; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.authenticator_config_entry OWNER TO postgres;

--
-- Name: broker_link; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE public.broker_link OWNER TO postgres;

--
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL,
    always_display_in_console boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client OWNER TO postgres;

--
-- Name: client_attributes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.client_attributes OWNER TO postgres;

--
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE public.client_auth_flow_bindings OWNER TO postgres;

--
-- Name: client_initial_access; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE public.client_initial_access OWNER TO postgres;

--
-- Name: client_node_registrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_node_registrations OWNER TO postgres;

--
-- Name: client_scope; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE public.client_scope OWNER TO postgres;

--
-- Name: client_scope_attributes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_scope_attributes OWNER TO postgres;

--
-- Name: client_scope_client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_scope_client (
    client_id character varying(255) NOT NULL,
    scope_id character varying(255) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client_scope_client OWNER TO postgres;

--
-- Name: client_scope_role_mapping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_scope_role_mapping OWNER TO postgres;

--
-- Name: client_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_session (
    id character varying(36) NOT NULL,
    client_id character varying(36),
    redirect_uri character varying(255),
    state character varying(255),
    "timestamp" integer,
    session_id character varying(36),
    auth_method character varying(255),
    realm_id character varying(255),
    auth_user_id character varying(36),
    current_action character varying(36)
);


ALTER TABLE public.client_session OWNER TO postgres;

--
-- Name: client_session_auth_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_session_auth_status (
    authenticator character varying(36) NOT NULL,
    status integer,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_auth_status OWNER TO postgres;

--
-- Name: client_session_note; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_session_note (
    name character varying(255) NOT NULL,
    value character varying(255),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_note OWNER TO postgres;

--
-- Name: client_session_prot_mapper; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_session_prot_mapper (
    protocol_mapper_id character varying(36) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_prot_mapper OWNER TO postgres;

--
-- Name: client_session_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_session_role (
    role_id character varying(255) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_role OWNER TO postgres;

--
-- Name: client_user_session_note; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_user_session_note (
    name character varying(255) NOT NULL,
    value character varying(2048),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_user_session_note OWNER TO postgres;

--
-- Name: component; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);


ALTER TABLE public.component OWNER TO postgres;

--
-- Name: component_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(4000)
);


ALTER TABLE public.component_config OWNER TO postgres;

--
-- Name: composite_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE public.composite_role OWNER TO postgres;

--
-- Name: credential; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    user_id character varying(36),
    created_date bigint,
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.credential OWNER TO postgres;

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO postgres;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO postgres;

--
-- Name: default_client_scope; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.default_client_scope OWNER TO postgres;

--
-- Name: event_entity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255)
);


ALTER TABLE public.event_entity OWNER TO postgres;

--
-- Name: fed_user_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024)
);


ALTER TABLE public.fed_user_attribute OWNER TO postgres;

--
-- Name: fed_user_consent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.fed_user_consent OWNER TO postgres;

--
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.fed_user_consent_cl_scope OWNER TO postgres;

--
-- Name: fed_user_credential; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fed_user_credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    created_date bigint,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.fed_user_credential OWNER TO postgres;

--
-- Name: fed_user_group_membership; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_group_membership OWNER TO postgres;

--
-- Name: fed_user_required_action; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_required_action OWNER TO postgres;

--
-- Name: fed_user_role_mapping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_role_mapping OWNER TO postgres;

--
-- Name: federated_identity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_identity OWNER TO postgres;

--
-- Name: federated_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_user OWNER TO postgres;

--
-- Name: group_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_attribute OWNER TO postgres;

--
-- Name: group_role_mapping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_role_mapping OWNER TO postgres;

--
-- Name: identity_provider; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL
);


ALTER TABLE public.identity_provider OWNER TO postgres;

--
-- Name: identity_provider_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.identity_provider_config OWNER TO postgres;

--
-- Name: identity_provider_mapper; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.identity_provider_mapper OWNER TO postgres;

--
-- Name: idp_mapper_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.idp_mapper_config OWNER TO postgres;

--
-- Name: keycloak_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36)
);


ALTER TABLE public.keycloak_group OWNER TO postgres;

--
-- Name: keycloak_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);


ALTER TABLE public.keycloak_role OWNER TO postgres;

--
-- Name: migration_model; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.migration_model OWNER TO postgres;

--
-- Name: offline_client_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL
);


ALTER TABLE public.offline_client_session OWNER TO postgres;

--
-- Name: offline_user_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.offline_user_session OWNER TO postgres;

--
-- Name: policy_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.policy_config OWNER TO postgres;

--
-- Name: protocol_mapper; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE public.protocol_mapper OWNER TO postgres;

--
-- Name: protocol_mapper_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.protocol_mapper_config OWNER TO postgres;

--
-- Name: realm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL,
    default_role character varying(255)
);


ALTER TABLE public.realm OWNER TO postgres;

--
-- Name: realm_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    value text
);


ALTER TABLE public.realm_attribute OWNER TO postgres;

--
-- Name: realm_default_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_groups OWNER TO postgres;

--
-- Name: realm_enabled_event_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_enabled_event_types OWNER TO postgres;

--
-- Name: realm_events_listeners; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_events_listeners OWNER TO postgres;

--
-- Name: realm_localizations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm_localizations (
    realm_id character varying(255) NOT NULL,
    locale character varying(255) NOT NULL,
    texts text NOT NULL
);


ALTER TABLE public.realm_localizations OWNER TO postgres;

--
-- Name: realm_required_credential; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_required_credential OWNER TO postgres;

--
-- Name: realm_smtp_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.realm_smtp_config OWNER TO postgres;

--
-- Name: realm_supported_locales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_supported_locales OWNER TO postgres;

--
-- Name: redirect_uris; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.redirect_uris OWNER TO postgres;

--
-- Name: required_action_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.required_action_config OWNER TO postgres;

--
-- Name: required_action_provider; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);


ALTER TABLE public.required_action_provider OWNER TO postgres;

--
-- Name: resource_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_attribute OWNER TO postgres;

--
-- Name: resource_policy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_policy OWNER TO postgres;

--
-- Name: resource_scope; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_scope OWNER TO postgres;

--
-- Name: resource_server; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode character varying(15) NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.resource_server OWNER TO postgres;

--
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(255) NOT NULL,
    requester character varying(255) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);


ALTER TABLE public.resource_server_perm_ticket OWNER TO postgres;

--
-- Name: resource_server_policy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy character varying(20),
    logic character varying(20),
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);


ALTER TABLE public.resource_server_policy OWNER TO postgres;

--
-- Name: resource_server_resource; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_resource OWNER TO postgres;

--
-- Name: resource_server_scope; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_scope OWNER TO postgres;

--
-- Name: resource_uris; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.resource_uris OWNER TO postgres;

--
-- Name: role_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE public.role_attribute OWNER TO postgres;

--
-- Name: scope_mapping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_mapping OWNER TO postgres;

--
-- Name: scope_policy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_policy OWNER TO postgres;

--
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL
);


ALTER TABLE public.user_attribute OWNER TO postgres;

--
-- Name: user_consent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.user_consent OWNER TO postgres;

--
-- Name: user_consent_client_scope; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.user_consent_client_scope OWNER TO postgres;

--
-- Name: user_entity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(255),
    not_before integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_entity OWNER TO postgres;

--
-- Name: user_federation_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_config OWNER TO postgres;

--
-- Name: user_federation_mapper; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.user_federation_mapper OWNER TO postgres;

--
-- Name: user_federation_mapper_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_mapper_config OWNER TO postgres;

--
-- Name: user_federation_provider; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.user_federation_provider OWNER TO postgres;

--
-- Name: user_group_membership; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_group_membership OWNER TO postgres;

--
-- Name: user_required_action; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE public.user_required_action OWNER TO postgres;

--
-- Name: user_role_mapping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_role_mapping OWNER TO postgres;

--
-- Name: user_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_session (
    id character varying(36) NOT NULL,
    auth_method character varying(255),
    ip_address character varying(255),
    last_session_refresh integer,
    login_username character varying(255),
    realm_id character varying(255),
    remember_me boolean DEFAULT false NOT NULL,
    started integer,
    user_id character varying(255),
    user_session_state integer,
    broker_session_id character varying(255),
    broker_user_id character varying(255)
);


ALTER TABLE public.user_session OWNER TO postgres;

--
-- Name: user_session_note; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_session_note (
    user_session character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(2048)
);


ALTER TABLE public.user_session_note OWNER TO postgres;

--
-- Name: username_login_failure; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.username_login_failure (
    realm_id character varying(36) NOT NULL,
    username character varying(255) NOT NULL,
    failed_login_not_before integer,
    last_failure bigint,
    last_ip_failure character varying(255),
    num_failures integer
);


ALTER TABLE public.username_login_failure OWNER TO postgres;

--
-- Name: web_origins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.web_origins OWNER TO postgres;

--
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type) FROM stdin;
\.


--
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.associated_policy (policy_id, associated_policy_id) FROM stdin;
\.


--
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
d2852d99-2ccd-40ea-8487-b5a64276c78d	\N	auth-cookie	ed653c96-d204-406a-87eb-480232fd55a1	60c2d667-3d9c-4263-ba9b-53424355f00d	2	10	f	\N	\N
5a2fc2e2-b633-4982-90d4-e5c1b48e613d	\N	auth-spnego	ed653c96-d204-406a-87eb-480232fd55a1	60c2d667-3d9c-4263-ba9b-53424355f00d	3	20	f	\N	\N
a8c09999-98ca-4ddd-8f6c-1632fc53d931	\N	identity-provider-redirector	ed653c96-d204-406a-87eb-480232fd55a1	60c2d667-3d9c-4263-ba9b-53424355f00d	2	25	f	\N	\N
accec18d-4712-4ea1-877a-3a7e451fbc25	\N	\N	ed653c96-d204-406a-87eb-480232fd55a1	60c2d667-3d9c-4263-ba9b-53424355f00d	2	30	t	8d75d32e-d218-4095-9318-872fb9c018de	\N
cf5051fb-4873-4462-b422-031e5d9fbd8b	\N	auth-username-password-form	ed653c96-d204-406a-87eb-480232fd55a1	8d75d32e-d218-4095-9318-872fb9c018de	0	10	f	\N	\N
3e622d26-cd6e-4dee-bf63-78671d82a3ad	\N	\N	ed653c96-d204-406a-87eb-480232fd55a1	8d75d32e-d218-4095-9318-872fb9c018de	1	20	t	1f7eb2ea-d45a-4c16-b33a-30b16a4bf83c	\N
0cba5404-0eae-41fd-a46d-36d3221b3684	\N	conditional-user-configured	ed653c96-d204-406a-87eb-480232fd55a1	1f7eb2ea-d45a-4c16-b33a-30b16a4bf83c	0	10	f	\N	\N
f84e637a-2562-48e0-ba79-e8dda98eaaaa	\N	auth-otp-form	ed653c96-d204-406a-87eb-480232fd55a1	1f7eb2ea-d45a-4c16-b33a-30b16a4bf83c	0	20	f	\N	\N
17d81f1e-5896-4d26-8deb-fe6508c492e9	\N	direct-grant-validate-username	ed653c96-d204-406a-87eb-480232fd55a1	dc694f88-b0f3-4ee0-ba16-af52d2f1f68d	0	10	f	\N	\N
48996953-0d4b-4cfd-a2e5-910c93b84b13	\N	direct-grant-validate-password	ed653c96-d204-406a-87eb-480232fd55a1	dc694f88-b0f3-4ee0-ba16-af52d2f1f68d	0	20	f	\N	\N
8296fcf6-c5fe-4636-8e64-c807492ee93a	\N	\N	ed653c96-d204-406a-87eb-480232fd55a1	dc694f88-b0f3-4ee0-ba16-af52d2f1f68d	1	30	t	3744006b-5f68-4539-beaf-fe01b8dc1656	\N
51af1f3e-9f93-407b-9ab5-5a98ac80acf2	\N	conditional-user-configured	ed653c96-d204-406a-87eb-480232fd55a1	3744006b-5f68-4539-beaf-fe01b8dc1656	0	10	f	\N	\N
7a945c16-e2fb-4ab6-a286-0e3e5651219e	\N	direct-grant-validate-otp	ed653c96-d204-406a-87eb-480232fd55a1	3744006b-5f68-4539-beaf-fe01b8dc1656	0	20	f	\N	\N
85c6c422-345c-4a9e-8a0c-e8676042e074	\N	registration-page-form	ed653c96-d204-406a-87eb-480232fd55a1	aecab760-f9d1-47ea-af7f-e4f6c01069b3	0	10	t	18fe7cc3-206e-4e70-913a-6ce2ce5ba860	\N
41208471-283d-4a2f-88bd-75931aeead6a	\N	registration-user-creation	ed653c96-d204-406a-87eb-480232fd55a1	18fe7cc3-206e-4e70-913a-6ce2ce5ba860	0	20	f	\N	\N
533fc8f1-5ce1-4b09-a236-8975bdf4cf0d	\N	registration-profile-action	ed653c96-d204-406a-87eb-480232fd55a1	18fe7cc3-206e-4e70-913a-6ce2ce5ba860	0	40	f	\N	\N
dce493a1-bdf7-4996-a5e5-f18f9eda623e	\N	registration-password-action	ed653c96-d204-406a-87eb-480232fd55a1	18fe7cc3-206e-4e70-913a-6ce2ce5ba860	0	50	f	\N	\N
5b950e65-d41d-4b51-80f1-7eba01cef035	\N	registration-recaptcha-action	ed653c96-d204-406a-87eb-480232fd55a1	18fe7cc3-206e-4e70-913a-6ce2ce5ba860	3	60	f	\N	\N
fea9ef17-a14a-4bc8-ab2d-68f18f5583b0	\N	reset-credentials-choose-user	ed653c96-d204-406a-87eb-480232fd55a1	812fb493-fa37-4b30-8935-8f24a5a8482f	0	10	f	\N	\N
7316a24c-d597-4862-84ae-b4cef5f3af73	\N	reset-credential-email	ed653c96-d204-406a-87eb-480232fd55a1	812fb493-fa37-4b30-8935-8f24a5a8482f	0	20	f	\N	\N
90f4730b-2a03-489d-a4ce-20ea869a8154	\N	reset-password	ed653c96-d204-406a-87eb-480232fd55a1	812fb493-fa37-4b30-8935-8f24a5a8482f	0	30	f	\N	\N
eade14f8-3924-4e5b-895a-25674815da47	\N	\N	ed653c96-d204-406a-87eb-480232fd55a1	812fb493-fa37-4b30-8935-8f24a5a8482f	1	40	t	2592e3ca-d449-42b8-a4b7-8a6b9c9892b3	\N
e2be89ab-9c06-4d85-ab77-ac4116082982	\N	conditional-user-configured	ed653c96-d204-406a-87eb-480232fd55a1	2592e3ca-d449-42b8-a4b7-8a6b9c9892b3	0	10	f	\N	\N
beeda61f-9778-4500-add0-5730dbaf09a2	\N	reset-otp	ed653c96-d204-406a-87eb-480232fd55a1	2592e3ca-d449-42b8-a4b7-8a6b9c9892b3	0	20	f	\N	\N
d3643c94-eebf-439c-9a49-762ff02b8f09	\N	client-secret	ed653c96-d204-406a-87eb-480232fd55a1	227b05c7-af05-4e42-ae60-6384208e7e85	2	10	f	\N	\N
a861a448-5449-4098-a2b1-b16499407b45	\N	client-jwt	ed653c96-d204-406a-87eb-480232fd55a1	227b05c7-af05-4e42-ae60-6384208e7e85	2	20	f	\N	\N
e20613c4-51e9-4420-8b38-f2d4d71ef9df	\N	client-secret-jwt	ed653c96-d204-406a-87eb-480232fd55a1	227b05c7-af05-4e42-ae60-6384208e7e85	2	30	f	\N	\N
be057f9c-f0cf-40f3-93ea-de311b7a142c	\N	client-x509	ed653c96-d204-406a-87eb-480232fd55a1	227b05c7-af05-4e42-ae60-6384208e7e85	2	40	f	\N	\N
f2adf998-22ad-4e28-a740-091f89c83432	\N	idp-review-profile	ed653c96-d204-406a-87eb-480232fd55a1	13bde06e-2e0f-412a-8216-bcd500aac8ce	0	10	f	\N	ecbf73fa-2f19-4429-be71-a3cf49f2fe45
ad810b07-f323-49e5-a1fa-bcf4df023215	\N	\N	ed653c96-d204-406a-87eb-480232fd55a1	13bde06e-2e0f-412a-8216-bcd500aac8ce	0	20	t	b071e0f3-64db-4872-82ef-1b852b341727	\N
d428c2e9-2021-4ff8-b1cc-d86ce7414013	\N	idp-create-user-if-unique	ed653c96-d204-406a-87eb-480232fd55a1	b071e0f3-64db-4872-82ef-1b852b341727	2	10	f	\N	972b9db5-dc6f-4851-b37f-c058ff8d3f43
6c504225-8697-4efd-8c22-feb376ee4d54	\N	\N	ed653c96-d204-406a-87eb-480232fd55a1	b071e0f3-64db-4872-82ef-1b852b341727	2	20	t	74c743dc-278a-4948-8831-9ba185005235	\N
2b7a76f3-6ac8-4cbc-a78d-3a3b02634112	\N	idp-confirm-link	ed653c96-d204-406a-87eb-480232fd55a1	74c743dc-278a-4948-8831-9ba185005235	0	10	f	\N	\N
276d393c-e1ed-4385-ad1a-bf8a2b400e43	\N	\N	ed653c96-d204-406a-87eb-480232fd55a1	74c743dc-278a-4948-8831-9ba185005235	0	20	t	bbc9726e-23a5-4cea-a0da-92d4943e34e9	\N
8c4ae2e3-ff61-4358-828b-908924282c0f	\N	idp-email-verification	ed653c96-d204-406a-87eb-480232fd55a1	bbc9726e-23a5-4cea-a0da-92d4943e34e9	2	10	f	\N	\N
33c9f639-bfc3-4b56-93d0-d93f42b7722a	\N	\N	ed653c96-d204-406a-87eb-480232fd55a1	bbc9726e-23a5-4cea-a0da-92d4943e34e9	2	20	t	eb942ac6-26fd-4384-832b-ab7621bc0868	\N
fa689bbb-3408-497e-91bb-a8bf6aa0df95	\N	idp-username-password-form	ed653c96-d204-406a-87eb-480232fd55a1	eb942ac6-26fd-4384-832b-ab7621bc0868	0	10	f	\N	\N
657da370-fb29-4820-8fbe-91a8b663adc5	\N	\N	ed653c96-d204-406a-87eb-480232fd55a1	eb942ac6-26fd-4384-832b-ab7621bc0868	1	20	t	b303ac47-177f-4290-8e44-f0e215f43cfc	\N
8f992ec1-f19e-4b2b-a164-89c83d2218d4	\N	conditional-user-configured	ed653c96-d204-406a-87eb-480232fd55a1	b303ac47-177f-4290-8e44-f0e215f43cfc	0	10	f	\N	\N
e0a7a9d4-f97a-4ba2-899d-bf71c6da9385	\N	auth-otp-form	ed653c96-d204-406a-87eb-480232fd55a1	b303ac47-177f-4290-8e44-f0e215f43cfc	0	20	f	\N	\N
fa03c4bc-d92f-40b9-a72b-b0d45d71ee8b	\N	http-basic-authenticator	ed653c96-d204-406a-87eb-480232fd55a1	36011a26-510a-4317-866a-6adf1f61dd55	0	10	f	\N	\N
e32cea62-18b8-49c5-bfb3-c32e87553249	\N	docker-http-basic-authenticator	ed653c96-d204-406a-87eb-480232fd55a1	306fe7f5-29dd-4259-878a-826f70536be0	0	10	f	\N	\N
bb38062a-85e6-4d79-9ccb-5c61d025523d	\N	no-cookie-redirect	ed653c96-d204-406a-87eb-480232fd55a1	efeec28d-4773-412b-921b-688d47872263	0	10	f	\N	\N
ccedbdce-6c7a-4fe2-bc77-354387fe247d	\N	\N	ed653c96-d204-406a-87eb-480232fd55a1	efeec28d-4773-412b-921b-688d47872263	0	20	t	07416bf1-c048-426b-9fc3-9cba2f567929	\N
ce33d608-9cb2-45c1-9871-0c692a2c8356	\N	basic-auth	ed653c96-d204-406a-87eb-480232fd55a1	07416bf1-c048-426b-9fc3-9cba2f567929	0	10	f	\N	\N
d185839c-61e1-40ab-88b3-e9d5df044dbf	\N	basic-auth-otp	ed653c96-d204-406a-87eb-480232fd55a1	07416bf1-c048-426b-9fc3-9cba2f567929	3	20	f	\N	\N
667492bc-a999-4db5-9663-13269cb1109c	\N	auth-spnego	ed653c96-d204-406a-87eb-480232fd55a1	07416bf1-c048-426b-9fc3-9cba2f567929	3	30	f	\N	\N
7cc4fde4-78d3-4a9b-9c0f-e6e17b832c71	\N	auth-cookie	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	d2ae0d16-aac3-4e4f-b144-28de798165c1	2	10	f	\N	\N
bfd332e8-0171-4051-9024-fc6135b485e0	\N	auth-spnego	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	d2ae0d16-aac3-4e4f-b144-28de798165c1	3	20	f	\N	\N
f5fde222-03b3-4c1f-bd4e-30dcebb90ba3	\N	identity-provider-redirector	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	d2ae0d16-aac3-4e4f-b144-28de798165c1	2	25	f	\N	\N
ba163f51-68f3-4a31-b9af-3d0ae7d49a8d	\N	\N	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	d2ae0d16-aac3-4e4f-b144-28de798165c1	2	30	t	99b1f40f-1172-4042-b34e-bf595b3fa10c	\N
770de2dc-6a5c-4d55-9b3b-cdb32534fb79	\N	auth-username-password-form	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	99b1f40f-1172-4042-b34e-bf595b3fa10c	0	10	f	\N	\N
eadcd217-7d1d-4d13-aae4-d51f610d8762	\N	\N	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	99b1f40f-1172-4042-b34e-bf595b3fa10c	1	20	t	a3bc360f-2bde-4a8e-a559-67d160904486	\N
9ad75ad8-eb75-4c03-9f90-76db9d5da02d	\N	conditional-user-configured	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	a3bc360f-2bde-4a8e-a559-67d160904486	0	10	f	\N	\N
d03d77f7-96e6-48fc-af4a-d24bb7ab90cb	\N	auth-otp-form	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	a3bc360f-2bde-4a8e-a559-67d160904486	0	20	f	\N	\N
27c39096-f872-4b3c-8b0c-70b998956cbe	\N	direct-grant-validate-username	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	d283690f-4180-457d-a9eb-92348d3465f1	0	10	f	\N	\N
a1184161-3a87-46c6-b801-04d265e5d2ae	\N	direct-grant-validate-password	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	d283690f-4180-457d-a9eb-92348d3465f1	0	20	f	\N	\N
7f8c290b-4fc8-4a45-a528-d5dda7ebff3e	\N	\N	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	d283690f-4180-457d-a9eb-92348d3465f1	1	30	t	b1ceed78-c7b3-44e8-91c3-939f330db430	\N
ede64f94-ea34-494f-a2c0-f7be7f02b390	\N	conditional-user-configured	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	b1ceed78-c7b3-44e8-91c3-939f330db430	0	10	f	\N	\N
04354d50-0f61-404c-867a-03cbc0bc5356	\N	direct-grant-validate-otp	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	b1ceed78-c7b3-44e8-91c3-939f330db430	0	20	f	\N	\N
6fca08d8-a220-4c4e-8b0b-acfd970f7baf	\N	registration-page-form	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	f231fb4a-d0a6-4eb8-ab5a-0435d6f9928e	0	10	t	da1c909a-952e-4fc9-ae93-4a73ed36a71f	\N
0b35b0c5-a707-4731-acef-a936b4b5f792	\N	registration-user-creation	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	da1c909a-952e-4fc9-ae93-4a73ed36a71f	0	20	f	\N	\N
ac500f43-5ca6-4747-975c-d9c175fea591	\N	registration-profile-action	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	da1c909a-952e-4fc9-ae93-4a73ed36a71f	0	40	f	\N	\N
284ca5f5-3d90-4d4d-ad07-a2185cd62426	\N	registration-password-action	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	da1c909a-952e-4fc9-ae93-4a73ed36a71f	0	50	f	\N	\N
b8a973f6-bd39-437d-b2b2-3067233d95a2	\N	registration-recaptcha-action	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	da1c909a-952e-4fc9-ae93-4a73ed36a71f	3	60	f	\N	\N
2b1169db-480b-404c-9e99-0741d334e878	\N	reset-credentials-choose-user	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	f8dc7cc4-8385-457c-8504-8b57ffa32862	0	10	f	\N	\N
347db728-b1e2-47ed-8507-82977342184b	\N	reset-credential-email	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	f8dc7cc4-8385-457c-8504-8b57ffa32862	0	20	f	\N	\N
593528b9-24fb-43b7-85c4-d212285dc421	\N	reset-password	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	f8dc7cc4-8385-457c-8504-8b57ffa32862	0	30	f	\N	\N
4776ffab-534e-4c50-8820-fc4a72cf4346	\N	\N	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	f8dc7cc4-8385-457c-8504-8b57ffa32862	1	40	t	1f9e6b6e-9eda-4c87-a245-2fe83a977758	\N
774b25f2-56bd-42b5-9aea-224743103914	\N	conditional-user-configured	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	1f9e6b6e-9eda-4c87-a245-2fe83a977758	0	10	f	\N	\N
24c1f281-4378-47be-bf95-8ce8572b8d65	\N	reset-otp	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	1f9e6b6e-9eda-4c87-a245-2fe83a977758	0	20	f	\N	\N
3b448ef0-ba7c-4a32-9700-829da274edc4	\N	client-secret	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	5d5bb5b7-3ae4-47c9-ab91-bf88cda1235f	2	10	f	\N	\N
a252b4d0-c4fa-4cf2-88d9-2fb2b35192dc	\N	client-jwt	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	5d5bb5b7-3ae4-47c9-ab91-bf88cda1235f	2	20	f	\N	\N
d0acb47c-d450-429d-9fcc-cfcf1cfc7497	\N	client-secret-jwt	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	5d5bb5b7-3ae4-47c9-ab91-bf88cda1235f	2	30	f	\N	\N
90514bf9-f9f4-4db6-a6c5-789d0938e48c	\N	client-x509	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	5d5bb5b7-3ae4-47c9-ab91-bf88cda1235f	2	40	f	\N	\N
da5c3db0-3a5a-4e42-9a03-bca6e57095f7	\N	idp-review-profile	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	b206b505-ae58-4239-b4af-d342c47decde	0	10	f	\N	248db262-3a88-42d1-a9dd-2463db5f5992
ad5fc666-3c22-4b55-a197-85388317fd94	\N	\N	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	b206b505-ae58-4239-b4af-d342c47decde	0	20	t	5c14a653-7600-48c4-b6b2-45b756277f70	\N
a4ffa2d5-5cd0-435e-abe1-d966a259f0d2	\N	idp-create-user-if-unique	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	5c14a653-7600-48c4-b6b2-45b756277f70	2	10	f	\N	14c6b8dd-86d6-4ab1-9bd6-d0f730f19d2d
53ddbc0a-4520-47e9-a343-941e1245e462	\N	\N	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	5c14a653-7600-48c4-b6b2-45b756277f70	2	20	t	eead0ea3-c3b4-4ea5-bd92-a2fdc903db87	\N
db296395-e349-4baa-98b2-413c86e120a2	\N	idp-confirm-link	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	eead0ea3-c3b4-4ea5-bd92-a2fdc903db87	0	10	f	\N	\N
0a503c8c-0a45-4d96-ba09-c08cec7b49ef	\N	\N	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	eead0ea3-c3b4-4ea5-bd92-a2fdc903db87	0	20	t	bd6c158e-d3b5-44c4-a8fc-b7d28cad9786	\N
184d302f-d690-4700-9d81-d566f8c9eb78	\N	idp-email-verification	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	bd6c158e-d3b5-44c4-a8fc-b7d28cad9786	2	10	f	\N	\N
2dd8bbce-8fd1-402d-9e56-c8085cb0c471	\N	\N	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	bd6c158e-d3b5-44c4-a8fc-b7d28cad9786	2	20	t	15bf5916-25f8-4d9c-8296-0959b885e4ca	\N
f87e4aab-1c9b-4bf3-8312-c6a3cb13a744	\N	idp-username-password-form	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	15bf5916-25f8-4d9c-8296-0959b885e4ca	0	10	f	\N	\N
7b6c5105-19be-4f10-9d0d-186e7725814f	\N	\N	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	15bf5916-25f8-4d9c-8296-0959b885e4ca	1	20	t	300edbd6-c5f6-4aba-96c2-d3889cf5083b	\N
d3e9db86-257e-4b01-8318-e12a6956bcde	\N	conditional-user-configured	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	300edbd6-c5f6-4aba-96c2-d3889cf5083b	0	10	f	\N	\N
1d95e4d4-b7f1-4309-a3e1-f4928dc34b9c	\N	auth-otp-form	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	300edbd6-c5f6-4aba-96c2-d3889cf5083b	0	20	f	\N	\N
de80805a-db94-46f5-a64e-39e4b61a935b	\N	http-basic-authenticator	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	315a27f4-184d-49b8-87e8-5d1716ca876f	0	10	f	\N	\N
15ad3df9-6d96-4172-8b4d-a00e5c4fede8	\N	docker-http-basic-authenticator	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	214f3452-01b4-4b9c-8116-cdd70f51a9a7	0	10	f	\N	\N
79153a8e-e872-46ef-bc94-17aaf47879d7	\N	no-cookie-redirect	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	65786116-4db6-4f40-8b49-39415414e340	0	10	f	\N	\N
1f5ea5f4-3071-401b-8e75-f5fcf3b93520	\N	\N	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	65786116-4db6-4f40-8b49-39415414e340	0	20	t	dd3dfc60-c5cf-44a1-8d97-de415c8549d3	\N
a72bf6da-ca70-43bb-9968-2327bdda9f79	\N	basic-auth	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	dd3dfc60-c5cf-44a1-8d97-de415c8549d3	0	10	f	\N	\N
42913687-3733-48a2-9458-ea12b24590bd	\N	basic-auth-otp	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	dd3dfc60-c5cf-44a1-8d97-de415c8549d3	3	20	f	\N	\N
9ed5e5ad-26b4-4e50-b3ad-6f680aad4321	\N	auth-spnego	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	dd3dfc60-c5cf-44a1-8d97-de415c8549d3	3	30	f	\N	\N
\.


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
60c2d667-3d9c-4263-ba9b-53424355f00d	browser	browser based authentication	ed653c96-d204-406a-87eb-480232fd55a1	basic-flow	t	t
8d75d32e-d218-4095-9318-872fb9c018de	forms	Username, password, otp and other auth forms.	ed653c96-d204-406a-87eb-480232fd55a1	basic-flow	f	t
1f7eb2ea-d45a-4c16-b33a-30b16a4bf83c	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	ed653c96-d204-406a-87eb-480232fd55a1	basic-flow	f	t
dc694f88-b0f3-4ee0-ba16-af52d2f1f68d	direct grant	OpenID Connect Resource Owner Grant	ed653c96-d204-406a-87eb-480232fd55a1	basic-flow	t	t
3744006b-5f68-4539-beaf-fe01b8dc1656	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	ed653c96-d204-406a-87eb-480232fd55a1	basic-flow	f	t
aecab760-f9d1-47ea-af7f-e4f6c01069b3	registration	registration flow	ed653c96-d204-406a-87eb-480232fd55a1	basic-flow	t	t
18fe7cc3-206e-4e70-913a-6ce2ce5ba860	registration form	registration form	ed653c96-d204-406a-87eb-480232fd55a1	form-flow	f	t
812fb493-fa37-4b30-8935-8f24a5a8482f	reset credentials	Reset credentials for a user if they forgot their password or something	ed653c96-d204-406a-87eb-480232fd55a1	basic-flow	t	t
2592e3ca-d449-42b8-a4b7-8a6b9c9892b3	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	ed653c96-d204-406a-87eb-480232fd55a1	basic-flow	f	t
227b05c7-af05-4e42-ae60-6384208e7e85	clients	Base authentication for clients	ed653c96-d204-406a-87eb-480232fd55a1	client-flow	t	t
13bde06e-2e0f-412a-8216-bcd500aac8ce	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	ed653c96-d204-406a-87eb-480232fd55a1	basic-flow	t	t
b071e0f3-64db-4872-82ef-1b852b341727	User creation or linking	Flow for the existing/non-existing user alternatives	ed653c96-d204-406a-87eb-480232fd55a1	basic-flow	f	t
74c743dc-278a-4948-8831-9ba185005235	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	ed653c96-d204-406a-87eb-480232fd55a1	basic-flow	f	t
bbc9726e-23a5-4cea-a0da-92d4943e34e9	Account verification options	Method with which to verity the existing account	ed653c96-d204-406a-87eb-480232fd55a1	basic-flow	f	t
eb942ac6-26fd-4384-832b-ab7621bc0868	Verify Existing Account by Re-authentication	Reauthentication of existing account	ed653c96-d204-406a-87eb-480232fd55a1	basic-flow	f	t
b303ac47-177f-4290-8e44-f0e215f43cfc	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	ed653c96-d204-406a-87eb-480232fd55a1	basic-flow	f	t
36011a26-510a-4317-866a-6adf1f61dd55	saml ecp	SAML ECP Profile Authentication Flow	ed653c96-d204-406a-87eb-480232fd55a1	basic-flow	t	t
306fe7f5-29dd-4259-878a-826f70536be0	docker auth	Used by Docker clients to authenticate against the IDP	ed653c96-d204-406a-87eb-480232fd55a1	basic-flow	t	t
efeec28d-4773-412b-921b-688d47872263	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	ed653c96-d204-406a-87eb-480232fd55a1	basic-flow	t	t
07416bf1-c048-426b-9fc3-9cba2f567929	Authentication Options	Authentication options.	ed653c96-d204-406a-87eb-480232fd55a1	basic-flow	f	t
d2ae0d16-aac3-4e4f-b144-28de798165c1	browser	browser based authentication	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	basic-flow	t	t
99b1f40f-1172-4042-b34e-bf595b3fa10c	forms	Username, password, otp and other auth forms.	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	basic-flow	f	t
a3bc360f-2bde-4a8e-a559-67d160904486	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	basic-flow	f	t
d283690f-4180-457d-a9eb-92348d3465f1	direct grant	OpenID Connect Resource Owner Grant	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	basic-flow	t	t
b1ceed78-c7b3-44e8-91c3-939f330db430	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	basic-flow	f	t
f231fb4a-d0a6-4eb8-ab5a-0435d6f9928e	registration	registration flow	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	basic-flow	t	t
da1c909a-952e-4fc9-ae93-4a73ed36a71f	registration form	registration form	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	form-flow	f	t
f8dc7cc4-8385-457c-8504-8b57ffa32862	reset credentials	Reset credentials for a user if they forgot their password or something	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	basic-flow	t	t
1f9e6b6e-9eda-4c87-a245-2fe83a977758	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	basic-flow	f	t
5d5bb5b7-3ae4-47c9-ab91-bf88cda1235f	clients	Base authentication for clients	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	client-flow	t	t
b206b505-ae58-4239-b4af-d342c47decde	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	basic-flow	t	t
5c14a653-7600-48c4-b6b2-45b756277f70	User creation or linking	Flow for the existing/non-existing user alternatives	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	basic-flow	f	t
eead0ea3-c3b4-4ea5-bd92-a2fdc903db87	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	basic-flow	f	t
bd6c158e-d3b5-44c4-a8fc-b7d28cad9786	Account verification options	Method with which to verity the existing account	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	basic-flow	f	t
15bf5916-25f8-4d9c-8296-0959b885e4ca	Verify Existing Account by Re-authentication	Reauthentication of existing account	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	basic-flow	f	t
300edbd6-c5f6-4aba-96c2-d3889cf5083b	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	basic-flow	f	t
315a27f4-184d-49b8-87e8-5d1716ca876f	saml ecp	SAML ECP Profile Authentication Flow	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	basic-flow	t	t
214f3452-01b4-4b9c-8116-cdd70f51a9a7	docker auth	Used by Docker clients to authenticate against the IDP	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	basic-flow	t	t
65786116-4db6-4f40-8b49-39415414e340	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	basic-flow	t	t
dd3dfc60-c5cf-44a1-8d97-de415c8549d3	Authentication Options	Authentication options.	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	basic-flow	f	t
\.


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
ecbf73fa-2f19-4429-be71-a3cf49f2fe45	review profile config	ed653c96-d204-406a-87eb-480232fd55a1
972b9db5-dc6f-4851-b37f-c058ff8d3f43	create unique user config	ed653c96-d204-406a-87eb-480232fd55a1
248db262-3a88-42d1-a9dd-2463db5f5992	review profile config	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b
14c6b8dd-86d6-4ab1-9bd6-d0f730f19d2d	create unique user config	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b
\.


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
972b9db5-dc6f-4851-b37f-c058ff8d3f43	false	require.password.update.after.registration
ecbf73fa-2f19-4429-be71-a3cf49f2fe45	missing	update.profile.on.first.login
14c6b8dd-86d6-4ab1-9bd6-d0f730f19d2d	false	require.password.update.after.registration
248db262-3a88-42d1-a9dd-2463db5f5992	missing	update.profile.on.first.login
\.


--
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) FROM stdin;
cc69d4ac-613b-442f-9172-e9fbbe3713a6	t	f	master-realm	0	f	\N	\N	t	\N	f	ed653c96-d204-406a-87eb-480232fd55a1	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f	f
2ee7c2bd-4595-4051-9d9d-d2ff38d48b77	t	f	account	0	t	\N	/realms/master/account/	f	\N	f	ed653c96-d204-406a-87eb-480232fd55a1	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
40769b04-17bb-4591-a58c-2c907a9ebdb5	t	f	account-console	0	t	\N	/realms/master/account/	f	\N	f	ed653c96-d204-406a-87eb-480232fd55a1	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
dee79bdb-64d7-40bd-a111-604cb1f65e74	t	f	broker	0	f	\N	\N	t	\N	f	ed653c96-d204-406a-87eb-480232fd55a1	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
1f7b7a6b-eff4-4444-b795-8aa2fd42d2bf	t	f	security-admin-console	0	t	\N	/admin/master/console/	f	\N	f	ed653c96-d204-406a-87eb-480232fd55a1	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
ab5efe34-8cc9-4ed1-bb73-47965cff84b2	t	f	admin-cli	0	t	\N	\N	f	\N	f	ed653c96-d204-406a-87eb-480232fd55a1	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
1db87cbc-4e3e-4104-a855-9e27efa13d6b	t	f	test-realm	0	f	\N	\N	t	\N	f	ed653c96-d204-406a-87eb-480232fd55a1	\N	0	f	f	test Realm	f	client-secret	\N	\N	\N	t	f	f	f
8323aa5b-3489-4ab6-8c1e-c06c18a1b8e4	t	f	realm-management	0	f	\N	\N	t	\N	f	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f	f
89d81758-e376-4a88-8c4f-04abd723cbd5	t	f	account	0	t	\N	/realms/test/account/	f	\N	f	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
3b8f664f-bcb6-4c46-88bf-5de4859f7df1	t	f	account-console	0	t	\N	/realms/test/account/	f	\N	f	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
da029bff-f743-40f1-8b2e-07a068c91300	t	f	broker	0	f	\N	\N	t	\N	f	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
2336441a-166e-49b5-baaf-c3cf0fc1d28c	t	f	security-admin-console	0	t	\N	/admin/test/console/	f	\N	f	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
14eedc6c-7549-44cb-805d-a0cfb84aa053	t	f	admin-cli	0	t	\N	\N	f	\N	f	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
\.


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_attributes (client_id, name, value) FROM stdin;
2ee7c2bd-4595-4051-9d9d-d2ff38d48b77	post.logout.redirect.uris	+
40769b04-17bb-4591-a58c-2c907a9ebdb5	post.logout.redirect.uris	+
40769b04-17bb-4591-a58c-2c907a9ebdb5	pkce.code.challenge.method	S256
1f7b7a6b-eff4-4444-b795-8aa2fd42d2bf	post.logout.redirect.uris	+
1f7b7a6b-eff4-4444-b795-8aa2fd42d2bf	pkce.code.challenge.method	S256
89d81758-e376-4a88-8c4f-04abd723cbd5	post.logout.redirect.uris	+
3b8f664f-bcb6-4c46-88bf-5de4859f7df1	post.logout.redirect.uris	+
3b8f664f-bcb6-4c46-88bf-5de4859f7df1	pkce.code.challenge.method	S256
2336441a-166e-49b5-baaf-c3cf0fc1d28c	post.logout.redirect.uris	+
2336441a-166e-49b5-baaf-c3cf0fc1d28c	pkce.code.challenge.method	S256
\.


--
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
\.


--
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
\.


--
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_node_registrations (client_id, value, name) FROM stdin;
\.


--
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_scope (id, name, realm_id, description, protocol) FROM stdin;
1b86fb36-4687-45a7-a825-7b6a8f0eddd7	offline_access	ed653c96-d204-406a-87eb-480232fd55a1	OpenID Connect built-in scope: offline_access	openid-connect
cff11f69-6ba2-4598-be0b-577271a3ca9c	role_list	ed653c96-d204-406a-87eb-480232fd55a1	SAML role list	saml
7c95c951-40f9-460f-be3e-a3b415f7cc92	profile	ed653c96-d204-406a-87eb-480232fd55a1	OpenID Connect built-in scope: profile	openid-connect
6fda0bf2-5ee2-4680-ab70-bb913b4e71c9	email	ed653c96-d204-406a-87eb-480232fd55a1	OpenID Connect built-in scope: email	openid-connect
cb002b51-9594-47ce-a496-366f2096eb91	address	ed653c96-d204-406a-87eb-480232fd55a1	OpenID Connect built-in scope: address	openid-connect
974db0db-2c63-4552-80a8-5cff64bf494b	phone	ed653c96-d204-406a-87eb-480232fd55a1	OpenID Connect built-in scope: phone	openid-connect
c7ce5ff3-bad4-44be-9aa1-d53defcce75d	roles	ed653c96-d204-406a-87eb-480232fd55a1	OpenID Connect scope for add user roles to the access token	openid-connect
e32ce8e7-7193-4a84-ab89-a810f01b7ee4	web-origins	ed653c96-d204-406a-87eb-480232fd55a1	OpenID Connect scope for add allowed web origins to the access token	openid-connect
719ccaeb-d45e-48e6-8eb7-ef88e23cb716	microprofile-jwt	ed653c96-d204-406a-87eb-480232fd55a1	Microprofile - JWT built-in scope	openid-connect
fc0ce346-d0af-4b0d-9c9d-ea3197c70395	acr	ed653c96-d204-406a-87eb-480232fd55a1	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
5c637451-0c01-47a2-a06b-7c92f0b8fdf9	offline_access	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	OpenID Connect built-in scope: offline_access	openid-connect
d77f8f45-f174-4aed-89d9-6f9f3d90b27e	role_list	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	SAML role list	saml
ea7594ed-2481-4575-bdb7-1f26fbf02d1b	profile	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	OpenID Connect built-in scope: profile	openid-connect
d42f7179-13dc-4a13-bdfe-a5e48566cf5b	email	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	OpenID Connect built-in scope: email	openid-connect
6d8af9a6-9705-45ba-97ab-8b184758b103	address	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	OpenID Connect built-in scope: address	openid-connect
63224374-feb6-49f6-9f08-6c850caf7d93	phone	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	OpenID Connect built-in scope: phone	openid-connect
b40a4c98-cb8f-4cad-a98b-18e4f3403ced	roles	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	OpenID Connect scope for add user roles to the access token	openid-connect
5cf75d32-57d9-4e62-8f11-2f7cfaae88c4	web-origins	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	OpenID Connect scope for add allowed web origins to the access token	openid-connect
5baab7b4-ec68-4ee1-bf09-37378bf16f21	microprofile-jwt	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	Microprofile - JWT built-in scope	openid-connect
7d1cfd7d-fd70-4c17-8e7a-91b3e8d06f82	acr	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
\.


--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_scope_attributes (scope_id, value, name) FROM stdin;
1b86fb36-4687-45a7-a825-7b6a8f0eddd7	true	display.on.consent.screen
1b86fb36-4687-45a7-a825-7b6a8f0eddd7	${offlineAccessScopeConsentText}	consent.screen.text
cff11f69-6ba2-4598-be0b-577271a3ca9c	true	display.on.consent.screen
cff11f69-6ba2-4598-be0b-577271a3ca9c	${samlRoleListScopeConsentText}	consent.screen.text
7c95c951-40f9-460f-be3e-a3b415f7cc92	true	display.on.consent.screen
7c95c951-40f9-460f-be3e-a3b415f7cc92	${profileScopeConsentText}	consent.screen.text
7c95c951-40f9-460f-be3e-a3b415f7cc92	true	include.in.token.scope
6fda0bf2-5ee2-4680-ab70-bb913b4e71c9	true	display.on.consent.screen
6fda0bf2-5ee2-4680-ab70-bb913b4e71c9	${emailScopeConsentText}	consent.screen.text
6fda0bf2-5ee2-4680-ab70-bb913b4e71c9	true	include.in.token.scope
cb002b51-9594-47ce-a496-366f2096eb91	true	display.on.consent.screen
cb002b51-9594-47ce-a496-366f2096eb91	${addressScopeConsentText}	consent.screen.text
cb002b51-9594-47ce-a496-366f2096eb91	true	include.in.token.scope
974db0db-2c63-4552-80a8-5cff64bf494b	true	display.on.consent.screen
974db0db-2c63-4552-80a8-5cff64bf494b	${phoneScopeConsentText}	consent.screen.text
974db0db-2c63-4552-80a8-5cff64bf494b	true	include.in.token.scope
c7ce5ff3-bad4-44be-9aa1-d53defcce75d	true	display.on.consent.screen
c7ce5ff3-bad4-44be-9aa1-d53defcce75d	${rolesScopeConsentText}	consent.screen.text
c7ce5ff3-bad4-44be-9aa1-d53defcce75d	false	include.in.token.scope
e32ce8e7-7193-4a84-ab89-a810f01b7ee4	false	display.on.consent.screen
e32ce8e7-7193-4a84-ab89-a810f01b7ee4		consent.screen.text
e32ce8e7-7193-4a84-ab89-a810f01b7ee4	false	include.in.token.scope
719ccaeb-d45e-48e6-8eb7-ef88e23cb716	false	display.on.consent.screen
719ccaeb-d45e-48e6-8eb7-ef88e23cb716	true	include.in.token.scope
fc0ce346-d0af-4b0d-9c9d-ea3197c70395	false	display.on.consent.screen
fc0ce346-d0af-4b0d-9c9d-ea3197c70395	false	include.in.token.scope
5c637451-0c01-47a2-a06b-7c92f0b8fdf9	true	display.on.consent.screen
5c637451-0c01-47a2-a06b-7c92f0b8fdf9	${offlineAccessScopeConsentText}	consent.screen.text
d77f8f45-f174-4aed-89d9-6f9f3d90b27e	true	display.on.consent.screen
d77f8f45-f174-4aed-89d9-6f9f3d90b27e	${samlRoleListScopeConsentText}	consent.screen.text
ea7594ed-2481-4575-bdb7-1f26fbf02d1b	true	display.on.consent.screen
ea7594ed-2481-4575-bdb7-1f26fbf02d1b	${profileScopeConsentText}	consent.screen.text
ea7594ed-2481-4575-bdb7-1f26fbf02d1b	true	include.in.token.scope
d42f7179-13dc-4a13-bdfe-a5e48566cf5b	true	display.on.consent.screen
d42f7179-13dc-4a13-bdfe-a5e48566cf5b	${emailScopeConsentText}	consent.screen.text
d42f7179-13dc-4a13-bdfe-a5e48566cf5b	true	include.in.token.scope
6d8af9a6-9705-45ba-97ab-8b184758b103	true	display.on.consent.screen
6d8af9a6-9705-45ba-97ab-8b184758b103	${addressScopeConsentText}	consent.screen.text
6d8af9a6-9705-45ba-97ab-8b184758b103	true	include.in.token.scope
63224374-feb6-49f6-9f08-6c850caf7d93	true	display.on.consent.screen
63224374-feb6-49f6-9f08-6c850caf7d93	${phoneScopeConsentText}	consent.screen.text
63224374-feb6-49f6-9f08-6c850caf7d93	true	include.in.token.scope
b40a4c98-cb8f-4cad-a98b-18e4f3403ced	true	display.on.consent.screen
b40a4c98-cb8f-4cad-a98b-18e4f3403ced	${rolesScopeConsentText}	consent.screen.text
b40a4c98-cb8f-4cad-a98b-18e4f3403ced	false	include.in.token.scope
5cf75d32-57d9-4e62-8f11-2f7cfaae88c4	false	display.on.consent.screen
5cf75d32-57d9-4e62-8f11-2f7cfaae88c4		consent.screen.text
5cf75d32-57d9-4e62-8f11-2f7cfaae88c4	false	include.in.token.scope
5baab7b4-ec68-4ee1-bf09-37378bf16f21	false	display.on.consent.screen
5baab7b4-ec68-4ee1-bf09-37378bf16f21	true	include.in.token.scope
7d1cfd7d-fd70-4c17-8e7a-91b3e8d06f82	false	display.on.consent.screen
7d1cfd7d-fd70-4c17-8e7a-91b3e8d06f82	false	include.in.token.scope
\.


--
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
2ee7c2bd-4595-4051-9d9d-d2ff38d48b77	6fda0bf2-5ee2-4680-ab70-bb913b4e71c9	t
2ee7c2bd-4595-4051-9d9d-d2ff38d48b77	c7ce5ff3-bad4-44be-9aa1-d53defcce75d	t
2ee7c2bd-4595-4051-9d9d-d2ff38d48b77	7c95c951-40f9-460f-be3e-a3b415f7cc92	t
2ee7c2bd-4595-4051-9d9d-d2ff38d48b77	fc0ce346-d0af-4b0d-9c9d-ea3197c70395	t
2ee7c2bd-4595-4051-9d9d-d2ff38d48b77	e32ce8e7-7193-4a84-ab89-a810f01b7ee4	t
2ee7c2bd-4595-4051-9d9d-d2ff38d48b77	719ccaeb-d45e-48e6-8eb7-ef88e23cb716	f
2ee7c2bd-4595-4051-9d9d-d2ff38d48b77	cb002b51-9594-47ce-a496-366f2096eb91	f
2ee7c2bd-4595-4051-9d9d-d2ff38d48b77	974db0db-2c63-4552-80a8-5cff64bf494b	f
2ee7c2bd-4595-4051-9d9d-d2ff38d48b77	1b86fb36-4687-45a7-a825-7b6a8f0eddd7	f
40769b04-17bb-4591-a58c-2c907a9ebdb5	6fda0bf2-5ee2-4680-ab70-bb913b4e71c9	t
40769b04-17bb-4591-a58c-2c907a9ebdb5	c7ce5ff3-bad4-44be-9aa1-d53defcce75d	t
40769b04-17bb-4591-a58c-2c907a9ebdb5	7c95c951-40f9-460f-be3e-a3b415f7cc92	t
40769b04-17bb-4591-a58c-2c907a9ebdb5	fc0ce346-d0af-4b0d-9c9d-ea3197c70395	t
40769b04-17bb-4591-a58c-2c907a9ebdb5	e32ce8e7-7193-4a84-ab89-a810f01b7ee4	t
40769b04-17bb-4591-a58c-2c907a9ebdb5	719ccaeb-d45e-48e6-8eb7-ef88e23cb716	f
40769b04-17bb-4591-a58c-2c907a9ebdb5	cb002b51-9594-47ce-a496-366f2096eb91	f
40769b04-17bb-4591-a58c-2c907a9ebdb5	974db0db-2c63-4552-80a8-5cff64bf494b	f
40769b04-17bb-4591-a58c-2c907a9ebdb5	1b86fb36-4687-45a7-a825-7b6a8f0eddd7	f
ab5efe34-8cc9-4ed1-bb73-47965cff84b2	6fda0bf2-5ee2-4680-ab70-bb913b4e71c9	t
ab5efe34-8cc9-4ed1-bb73-47965cff84b2	c7ce5ff3-bad4-44be-9aa1-d53defcce75d	t
ab5efe34-8cc9-4ed1-bb73-47965cff84b2	7c95c951-40f9-460f-be3e-a3b415f7cc92	t
ab5efe34-8cc9-4ed1-bb73-47965cff84b2	fc0ce346-d0af-4b0d-9c9d-ea3197c70395	t
ab5efe34-8cc9-4ed1-bb73-47965cff84b2	e32ce8e7-7193-4a84-ab89-a810f01b7ee4	t
ab5efe34-8cc9-4ed1-bb73-47965cff84b2	719ccaeb-d45e-48e6-8eb7-ef88e23cb716	f
ab5efe34-8cc9-4ed1-bb73-47965cff84b2	cb002b51-9594-47ce-a496-366f2096eb91	f
ab5efe34-8cc9-4ed1-bb73-47965cff84b2	974db0db-2c63-4552-80a8-5cff64bf494b	f
ab5efe34-8cc9-4ed1-bb73-47965cff84b2	1b86fb36-4687-45a7-a825-7b6a8f0eddd7	f
dee79bdb-64d7-40bd-a111-604cb1f65e74	6fda0bf2-5ee2-4680-ab70-bb913b4e71c9	t
dee79bdb-64d7-40bd-a111-604cb1f65e74	c7ce5ff3-bad4-44be-9aa1-d53defcce75d	t
dee79bdb-64d7-40bd-a111-604cb1f65e74	7c95c951-40f9-460f-be3e-a3b415f7cc92	t
dee79bdb-64d7-40bd-a111-604cb1f65e74	fc0ce346-d0af-4b0d-9c9d-ea3197c70395	t
dee79bdb-64d7-40bd-a111-604cb1f65e74	e32ce8e7-7193-4a84-ab89-a810f01b7ee4	t
dee79bdb-64d7-40bd-a111-604cb1f65e74	719ccaeb-d45e-48e6-8eb7-ef88e23cb716	f
dee79bdb-64d7-40bd-a111-604cb1f65e74	cb002b51-9594-47ce-a496-366f2096eb91	f
dee79bdb-64d7-40bd-a111-604cb1f65e74	974db0db-2c63-4552-80a8-5cff64bf494b	f
dee79bdb-64d7-40bd-a111-604cb1f65e74	1b86fb36-4687-45a7-a825-7b6a8f0eddd7	f
cc69d4ac-613b-442f-9172-e9fbbe3713a6	6fda0bf2-5ee2-4680-ab70-bb913b4e71c9	t
cc69d4ac-613b-442f-9172-e9fbbe3713a6	c7ce5ff3-bad4-44be-9aa1-d53defcce75d	t
cc69d4ac-613b-442f-9172-e9fbbe3713a6	7c95c951-40f9-460f-be3e-a3b415f7cc92	t
cc69d4ac-613b-442f-9172-e9fbbe3713a6	fc0ce346-d0af-4b0d-9c9d-ea3197c70395	t
cc69d4ac-613b-442f-9172-e9fbbe3713a6	e32ce8e7-7193-4a84-ab89-a810f01b7ee4	t
cc69d4ac-613b-442f-9172-e9fbbe3713a6	719ccaeb-d45e-48e6-8eb7-ef88e23cb716	f
cc69d4ac-613b-442f-9172-e9fbbe3713a6	cb002b51-9594-47ce-a496-366f2096eb91	f
cc69d4ac-613b-442f-9172-e9fbbe3713a6	974db0db-2c63-4552-80a8-5cff64bf494b	f
cc69d4ac-613b-442f-9172-e9fbbe3713a6	1b86fb36-4687-45a7-a825-7b6a8f0eddd7	f
1f7b7a6b-eff4-4444-b795-8aa2fd42d2bf	6fda0bf2-5ee2-4680-ab70-bb913b4e71c9	t
1f7b7a6b-eff4-4444-b795-8aa2fd42d2bf	c7ce5ff3-bad4-44be-9aa1-d53defcce75d	t
1f7b7a6b-eff4-4444-b795-8aa2fd42d2bf	7c95c951-40f9-460f-be3e-a3b415f7cc92	t
1f7b7a6b-eff4-4444-b795-8aa2fd42d2bf	fc0ce346-d0af-4b0d-9c9d-ea3197c70395	t
1f7b7a6b-eff4-4444-b795-8aa2fd42d2bf	e32ce8e7-7193-4a84-ab89-a810f01b7ee4	t
1f7b7a6b-eff4-4444-b795-8aa2fd42d2bf	719ccaeb-d45e-48e6-8eb7-ef88e23cb716	f
1f7b7a6b-eff4-4444-b795-8aa2fd42d2bf	cb002b51-9594-47ce-a496-366f2096eb91	f
1f7b7a6b-eff4-4444-b795-8aa2fd42d2bf	974db0db-2c63-4552-80a8-5cff64bf494b	f
1f7b7a6b-eff4-4444-b795-8aa2fd42d2bf	1b86fb36-4687-45a7-a825-7b6a8f0eddd7	f
89d81758-e376-4a88-8c4f-04abd723cbd5	5cf75d32-57d9-4e62-8f11-2f7cfaae88c4	t
89d81758-e376-4a88-8c4f-04abd723cbd5	b40a4c98-cb8f-4cad-a98b-18e4f3403ced	t
89d81758-e376-4a88-8c4f-04abd723cbd5	7d1cfd7d-fd70-4c17-8e7a-91b3e8d06f82	t
89d81758-e376-4a88-8c4f-04abd723cbd5	d42f7179-13dc-4a13-bdfe-a5e48566cf5b	t
89d81758-e376-4a88-8c4f-04abd723cbd5	ea7594ed-2481-4575-bdb7-1f26fbf02d1b	t
89d81758-e376-4a88-8c4f-04abd723cbd5	63224374-feb6-49f6-9f08-6c850caf7d93	f
89d81758-e376-4a88-8c4f-04abd723cbd5	5baab7b4-ec68-4ee1-bf09-37378bf16f21	f
89d81758-e376-4a88-8c4f-04abd723cbd5	6d8af9a6-9705-45ba-97ab-8b184758b103	f
89d81758-e376-4a88-8c4f-04abd723cbd5	5c637451-0c01-47a2-a06b-7c92f0b8fdf9	f
3b8f664f-bcb6-4c46-88bf-5de4859f7df1	5cf75d32-57d9-4e62-8f11-2f7cfaae88c4	t
3b8f664f-bcb6-4c46-88bf-5de4859f7df1	b40a4c98-cb8f-4cad-a98b-18e4f3403ced	t
3b8f664f-bcb6-4c46-88bf-5de4859f7df1	7d1cfd7d-fd70-4c17-8e7a-91b3e8d06f82	t
3b8f664f-bcb6-4c46-88bf-5de4859f7df1	d42f7179-13dc-4a13-bdfe-a5e48566cf5b	t
3b8f664f-bcb6-4c46-88bf-5de4859f7df1	ea7594ed-2481-4575-bdb7-1f26fbf02d1b	t
3b8f664f-bcb6-4c46-88bf-5de4859f7df1	63224374-feb6-49f6-9f08-6c850caf7d93	f
3b8f664f-bcb6-4c46-88bf-5de4859f7df1	5baab7b4-ec68-4ee1-bf09-37378bf16f21	f
3b8f664f-bcb6-4c46-88bf-5de4859f7df1	6d8af9a6-9705-45ba-97ab-8b184758b103	f
3b8f664f-bcb6-4c46-88bf-5de4859f7df1	5c637451-0c01-47a2-a06b-7c92f0b8fdf9	f
14eedc6c-7549-44cb-805d-a0cfb84aa053	5cf75d32-57d9-4e62-8f11-2f7cfaae88c4	t
14eedc6c-7549-44cb-805d-a0cfb84aa053	b40a4c98-cb8f-4cad-a98b-18e4f3403ced	t
14eedc6c-7549-44cb-805d-a0cfb84aa053	7d1cfd7d-fd70-4c17-8e7a-91b3e8d06f82	t
14eedc6c-7549-44cb-805d-a0cfb84aa053	d42f7179-13dc-4a13-bdfe-a5e48566cf5b	t
14eedc6c-7549-44cb-805d-a0cfb84aa053	ea7594ed-2481-4575-bdb7-1f26fbf02d1b	t
14eedc6c-7549-44cb-805d-a0cfb84aa053	63224374-feb6-49f6-9f08-6c850caf7d93	f
14eedc6c-7549-44cb-805d-a0cfb84aa053	5baab7b4-ec68-4ee1-bf09-37378bf16f21	f
14eedc6c-7549-44cb-805d-a0cfb84aa053	6d8af9a6-9705-45ba-97ab-8b184758b103	f
14eedc6c-7549-44cb-805d-a0cfb84aa053	5c637451-0c01-47a2-a06b-7c92f0b8fdf9	f
da029bff-f743-40f1-8b2e-07a068c91300	5cf75d32-57d9-4e62-8f11-2f7cfaae88c4	t
da029bff-f743-40f1-8b2e-07a068c91300	b40a4c98-cb8f-4cad-a98b-18e4f3403ced	t
da029bff-f743-40f1-8b2e-07a068c91300	7d1cfd7d-fd70-4c17-8e7a-91b3e8d06f82	t
da029bff-f743-40f1-8b2e-07a068c91300	d42f7179-13dc-4a13-bdfe-a5e48566cf5b	t
da029bff-f743-40f1-8b2e-07a068c91300	ea7594ed-2481-4575-bdb7-1f26fbf02d1b	t
da029bff-f743-40f1-8b2e-07a068c91300	63224374-feb6-49f6-9f08-6c850caf7d93	f
da029bff-f743-40f1-8b2e-07a068c91300	5baab7b4-ec68-4ee1-bf09-37378bf16f21	f
da029bff-f743-40f1-8b2e-07a068c91300	6d8af9a6-9705-45ba-97ab-8b184758b103	f
da029bff-f743-40f1-8b2e-07a068c91300	5c637451-0c01-47a2-a06b-7c92f0b8fdf9	f
8323aa5b-3489-4ab6-8c1e-c06c18a1b8e4	5cf75d32-57d9-4e62-8f11-2f7cfaae88c4	t
8323aa5b-3489-4ab6-8c1e-c06c18a1b8e4	b40a4c98-cb8f-4cad-a98b-18e4f3403ced	t
8323aa5b-3489-4ab6-8c1e-c06c18a1b8e4	7d1cfd7d-fd70-4c17-8e7a-91b3e8d06f82	t
8323aa5b-3489-4ab6-8c1e-c06c18a1b8e4	d42f7179-13dc-4a13-bdfe-a5e48566cf5b	t
8323aa5b-3489-4ab6-8c1e-c06c18a1b8e4	ea7594ed-2481-4575-bdb7-1f26fbf02d1b	t
8323aa5b-3489-4ab6-8c1e-c06c18a1b8e4	63224374-feb6-49f6-9f08-6c850caf7d93	f
8323aa5b-3489-4ab6-8c1e-c06c18a1b8e4	5baab7b4-ec68-4ee1-bf09-37378bf16f21	f
8323aa5b-3489-4ab6-8c1e-c06c18a1b8e4	6d8af9a6-9705-45ba-97ab-8b184758b103	f
8323aa5b-3489-4ab6-8c1e-c06c18a1b8e4	5c637451-0c01-47a2-a06b-7c92f0b8fdf9	f
2336441a-166e-49b5-baaf-c3cf0fc1d28c	5cf75d32-57d9-4e62-8f11-2f7cfaae88c4	t
2336441a-166e-49b5-baaf-c3cf0fc1d28c	b40a4c98-cb8f-4cad-a98b-18e4f3403ced	t
2336441a-166e-49b5-baaf-c3cf0fc1d28c	7d1cfd7d-fd70-4c17-8e7a-91b3e8d06f82	t
2336441a-166e-49b5-baaf-c3cf0fc1d28c	d42f7179-13dc-4a13-bdfe-a5e48566cf5b	t
2336441a-166e-49b5-baaf-c3cf0fc1d28c	ea7594ed-2481-4575-bdb7-1f26fbf02d1b	t
2336441a-166e-49b5-baaf-c3cf0fc1d28c	63224374-feb6-49f6-9f08-6c850caf7d93	f
2336441a-166e-49b5-baaf-c3cf0fc1d28c	5baab7b4-ec68-4ee1-bf09-37378bf16f21	f
2336441a-166e-49b5-baaf-c3cf0fc1d28c	6d8af9a6-9705-45ba-97ab-8b184758b103	f
2336441a-166e-49b5-baaf-c3cf0fc1d28c	5c637451-0c01-47a2-a06b-7c92f0b8fdf9	f
\.


--
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_scope_role_mapping (scope_id, role_id) FROM stdin;
1b86fb36-4687-45a7-a825-7b6a8f0eddd7	cdbce1cc-8efe-4ba2-99d8-b882e989989b
5c637451-0c01-47a2-a06b-7c92f0b8fdf9	53bf1da7-e54f-4c1b-be78-ee19fa699aaa
\.


--
-- Data for Name: client_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_session (id, client_id, redirect_uri, state, "timestamp", session_id, auth_method, realm_id, auth_user_id, current_action) FROM stdin;
\.


--
-- Data for Name: client_session_auth_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_session_auth_status (authenticator, status, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_note; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_prot_mapper; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_session_prot_mapper (protocol_mapper_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_session_role (role_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_user_session_note; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_user_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
6ac2f193-5e67-48d7-8299-0301ef58a512	Trusted Hosts	ed653c96-d204-406a-87eb-480232fd55a1	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	ed653c96-d204-406a-87eb-480232fd55a1	anonymous
db4ae535-1488-4515-8bb1-a902028aa578	Consent Required	ed653c96-d204-406a-87eb-480232fd55a1	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	ed653c96-d204-406a-87eb-480232fd55a1	anonymous
c3d2820d-2051-4a34-a5cb-7264eb15c548	Full Scope Disabled	ed653c96-d204-406a-87eb-480232fd55a1	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	ed653c96-d204-406a-87eb-480232fd55a1	anonymous
4858834e-4d28-4888-9a3f-f20b4a6e1cd9	Max Clients Limit	ed653c96-d204-406a-87eb-480232fd55a1	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	ed653c96-d204-406a-87eb-480232fd55a1	anonymous
a2519f44-ca59-4343-94fb-66d4d15c9033	Allowed Protocol Mapper Types	ed653c96-d204-406a-87eb-480232fd55a1	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	ed653c96-d204-406a-87eb-480232fd55a1	anonymous
39d867db-3046-4bd5-ac3c-ebfbb19179c6	Allowed Client Scopes	ed653c96-d204-406a-87eb-480232fd55a1	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	ed653c96-d204-406a-87eb-480232fd55a1	anonymous
d599dba1-9d54-49e2-936c-af182b52e259	Allowed Protocol Mapper Types	ed653c96-d204-406a-87eb-480232fd55a1	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	ed653c96-d204-406a-87eb-480232fd55a1	authenticated
15ed9d80-dd36-4b78-9560-09dd557dbb28	Allowed Client Scopes	ed653c96-d204-406a-87eb-480232fd55a1	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	ed653c96-d204-406a-87eb-480232fd55a1	authenticated
97ba86c2-e594-4451-b790-cc5901b053ba	rsa-generated	ed653c96-d204-406a-87eb-480232fd55a1	rsa-generated	org.keycloak.keys.KeyProvider	ed653c96-d204-406a-87eb-480232fd55a1	\N
6fc7a64b-ff88-4470-b05f-166accee2c95	rsa-enc-generated	ed653c96-d204-406a-87eb-480232fd55a1	rsa-enc-generated	org.keycloak.keys.KeyProvider	ed653c96-d204-406a-87eb-480232fd55a1	\N
9bafe225-ae84-4c2c-bf1a-15e2c380683e	hmac-generated	ed653c96-d204-406a-87eb-480232fd55a1	hmac-generated	org.keycloak.keys.KeyProvider	ed653c96-d204-406a-87eb-480232fd55a1	\N
39cca108-e3d8-4c5b-9966-b5b2faaa9234	aes-generated	ed653c96-d204-406a-87eb-480232fd55a1	aes-generated	org.keycloak.keys.KeyProvider	ed653c96-d204-406a-87eb-480232fd55a1	\N
54530ba7-e4f5-4937-9949-f6a74f5a57c8	rsa-generated	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	rsa-generated	org.keycloak.keys.KeyProvider	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	\N
20a6c68e-ed5b-4d11-96a9-2e8c954ed2dc	rsa-enc-generated	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	rsa-enc-generated	org.keycloak.keys.KeyProvider	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	\N
029ab632-c5f8-4044-8ae1-414f2704ba3a	hmac-generated	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	hmac-generated	org.keycloak.keys.KeyProvider	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	\N
24317dbd-7095-4658-9f3e-f2dd27f5de9e	aes-generated	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	aes-generated	org.keycloak.keys.KeyProvider	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	\N
d49b6616-a4ca-446c-903a-14a4389d6895	Trusted Hosts	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	anonymous
c3763bf7-a00c-4ea1-bf2f-f8c8dd0037bb	Consent Required	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	anonymous
af9b01be-aea1-4ec8-9690-5825196b6881	Full Scope Disabled	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	anonymous
bd62f316-0a0b-4c5e-b243-825a40346e0a	Max Clients Limit	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	anonymous
33103b4f-6f22-4455-83b8-d5ebf7b9d619	Allowed Protocol Mapper Types	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	anonymous
d9aed8be-b36a-493d-964d-390455ad1e27	Allowed Client Scopes	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	anonymous
1a9cc05e-f5af-455f-aa22-c20b86e2a788	Allowed Protocol Mapper Types	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	authenticated
c2f204bc-a5c2-4c20-b32d-a7425f995d74	Allowed Client Scopes	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	authenticated
\.


--
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.component_config (id, component_id, name, value) FROM stdin;
701c952f-efb3-4a79-8bb5-1d02ec91a1a3	15ed9d80-dd36-4b78-9560-09dd557dbb28	allow-default-scopes	true
eb6bfaf5-5ba3-45a1-a439-bd0550b3e8f9	d599dba1-9d54-49e2-936c-af182b52e259	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
3061b88c-6826-4d6c-a702-db6a638dfd1f	d599dba1-9d54-49e2-936c-af182b52e259	allowed-protocol-mapper-types	saml-user-property-mapper
4c1aee7f-e298-4751-a58c-a742c2723f32	d599dba1-9d54-49e2-936c-af182b52e259	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
46c388a2-4ecc-4617-80b5-076afd1c9abd	d599dba1-9d54-49e2-936c-af182b52e259	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
23aef6c3-bb7b-4c96-a6dd-472051f0d64d	d599dba1-9d54-49e2-936c-af182b52e259	allowed-protocol-mapper-types	oidc-full-name-mapper
7680851e-7ba7-4984-8fd4-382c43591a1c	d599dba1-9d54-49e2-936c-af182b52e259	allowed-protocol-mapper-types	oidc-address-mapper
985aaa97-20ba-49dd-91fb-6947407ea66b	d599dba1-9d54-49e2-936c-af182b52e259	allowed-protocol-mapper-types	saml-role-list-mapper
9ac63a7f-e672-4e23-b578-f18609b24149	d599dba1-9d54-49e2-936c-af182b52e259	allowed-protocol-mapper-types	saml-user-attribute-mapper
da66be35-1666-4efc-94fb-48d34f8ebd64	39d867db-3046-4bd5-ac3c-ebfbb19179c6	allow-default-scopes	true
0ce19677-e165-46a7-8c57-8f805f81a4ce	6ac2f193-5e67-48d7-8299-0301ef58a512	client-uris-must-match	true
6be7a0f7-ed46-49af-8b1c-d5ed6a3043c0	6ac2f193-5e67-48d7-8299-0301ef58a512	host-sending-registration-request-must-match	true
ea987c64-a999-467e-8c7f-f54403475e2d	4858834e-4d28-4888-9a3f-f20b4a6e1cd9	max-clients	200
17c4d8ce-7a9a-463b-b6b8-0513d69d3a34	a2519f44-ca59-4343-94fb-66d4d15c9033	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
62fd9ba8-a974-472b-be17-c84f12f36e52	a2519f44-ca59-4343-94fb-66d4d15c9033	allowed-protocol-mapper-types	oidc-full-name-mapper
3f26070a-29db-49ae-8a3c-6a135c17acea	a2519f44-ca59-4343-94fb-66d4d15c9033	allowed-protocol-mapper-types	saml-user-property-mapper
3abbb5d7-ee15-4677-9765-1bf208452242	a2519f44-ca59-4343-94fb-66d4d15c9033	allowed-protocol-mapper-types	saml-role-list-mapper
85d142dd-d68a-43f2-9570-ff69ed35716c	a2519f44-ca59-4343-94fb-66d4d15c9033	allowed-protocol-mapper-types	oidc-address-mapper
8282fa33-fd19-457e-a475-7281507146f2	a2519f44-ca59-4343-94fb-66d4d15c9033	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
15cf7d79-9e8d-4146-bf02-aa9cb1c5dc96	a2519f44-ca59-4343-94fb-66d4d15c9033	allowed-protocol-mapper-types	saml-user-attribute-mapper
c28a5c4d-a29e-42d3-b0f5-32706e2af77d	a2519f44-ca59-4343-94fb-66d4d15c9033	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
d419af1a-d1b1-4db4-b7ec-59697e9f80d8	6fc7a64b-ff88-4470-b05f-166accee2c95	privateKey	MIIEpQIBAAKCAQEA7hjeVBm4vpM6IMREwVrwVMNdV3KDcS5i0VfQGIKxl7icZMBLLT9K95oAm55f0MZM7Jo7shNsqsK1ZkZCZqOWfgCM+x4F39Qs//evchI9Pa8HvQhn9yJ99NugI2lS2weCfO+NjujNYH2Cum5UQixHDtPZeORNr+8c3GKh6c/TYsmJxykkHoEou+eqz86XwuAiYm1QXuE4xjIsHj/X8z4FmDIFHrXQ+Im7gYlBngO0573p0zTEjCEKf6lWsGMXjqe3SJ3WpgKUvcQij4RBIPYamhXJoTR5H3r8Okeh6YNIPhtc4o5BNrQUj3Aqf00buRVsXZ3Xiukhrwzx8na15ouHIwIDAQABAoIBABf49AWms1Wo0Cz1ZfDL3a/DHdZMptRR9cwbGc4l9oiOo1x3iforyboFTPNeLkqAdMVLwB/tWb8VrJr4Dv5zkRbtqkQsYS4ImGFLSGRlVrorsc1EF+enluP86vI1zAxWhLpcijWt1ePVr0BjFGO3Po5NITPNVM8WdaLw4Vl/vcpPy7FEiLXGONQJCvx53O9jPrH3AN3c4F79Y6ccZzjCpAW9bs4awtrQ9AsT+cIk0Wl/FYipjwDbdaZGyTbwRabZOi8gjuy08kVWQPTc937Ed9I96CdCi3l4mh60jEgq/vzUuqDlrx94xxjVapQ7mouw+8si96t+YGmpiCEoZHsQLu0CgYEA+r+0blEUCL0CvY9AG2yoXIRnpFnuXnRqlIoz+SI9tCy+oPzLJ5htslqJ01nS0B5V1iuucubD1K8ncDfB+p/XDs5WQmkkOz8VHAuWJFiQG+aGGQR970UfENZE/2jHNGbl8DrZS7GWcItMLjZuvjW6kEZEpiH4GgVphrs9WMNQUJcCgYEA8xVWGbYcsgkuLJFRWHWi3jQ9d9fMnA5STd1Uxp7NvE8rcOAxRe++CWw12XT+iI4HQil9cox/MiOX0h0WzJ54yEb2KYRlMDk8lU1Tph0wpWIeQJ54eV0ez6iTsjUIEv5seoApMXRv4xNtCwWHpNRSjs2zwINXQ0qqi8wu4iJpA1UCgYEAqigXT9kzSC7DQlGIhlO4+HddQZlJec10WfJjDIgg6TiH8AU781Wr8yEfcE3/Ef3T7+9ahVx1vclScQNVXjbDoKeCv7RLwuyu7YYrT+TNfjF0BFwY/ZqhVzKgRdYbgELnfJrixEvxs9PDUYTcp7UcMjWM9lQM4dOUZbqACdEYmmcCgYEAsvAq4GRpfTk6zz3txpNZ3/5OnVCy4tG8Dmt2Q3uU8SDKVp4CR3wyxRbuEPSJhhYfC7olCVSZMVx4HwigxuGFAdES1f8KydPoX/N7NxXXwHaY1HKTNquwyaZLiux01B6L1iVPrYML9flP1MQuVMyjNVIBFx7X9sYZAy27+WThLr0CgYEAhFFLqYhUXR0NQTlJgiOS07Lr+C7wmlHX3Q7AnSYxXOisf7wnNe4gvIxiH/2d0UmVK7ij8uorSz2NAw+jzDqdwwp07NX+udcB1H81QDWXPRhd0U84G/8cxE//hqKPkiT7jqHdkfpJz4mzQ/c0KW/pQVTJqH4mPPSEOAKICTwLZrs=
e9a72b18-fb78-44da-8299-07d4c7c536c5	6fc7a64b-ff88-4470-b05f-166accee2c95	keyUse	ENC
f7391ff7-233a-4631-8d2f-e8ca0054750e	6fc7a64b-ff88-4470-b05f-166accee2c95	certificate	MIICmzCCAYMCBgGFpxJczjANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMwMTEyMTczOTM2WhcNMzMwMTEyMTc0MTE2WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDuGN5UGbi+kzogxETBWvBUw11XcoNxLmLRV9AYgrGXuJxkwEstP0r3mgCbnl/QxkzsmjuyE2yqwrVmRkJmo5Z+AIz7HgXf1Cz/969yEj09rwe9CGf3In3026AjaVLbB4J8742O6M1gfYK6blRCLEcO09l45E2v7xzcYqHpz9NiyYnHKSQegSi756rPzpfC4CJibVBe4TjGMiweP9fzPgWYMgUetdD4ibuBiUGeA7TnvenTNMSMIQp/qVawYxeOp7dIndamApS9xCKPhEEg9hqaFcmhNHkfevw6R6Hpg0g+G1zijkE2tBSPcCp/TRu5FWxdndeK6SGvDPHydrXmi4cjAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAOl4V4vsYhGofCSGhAnFHHH73OnGNdkIWT1C0OeEor70ch5yw1fK0U6tXCxiUHkwwHqXurcfvTeUibPmo55j0kJnkjPIDYbOZNwH/UaZrO/qQvV9k6l9mjN/vY9O1IIr/A5BAyiL4Z9GxutJ8yWAg7CBW809Zj9+GFxjDFsrb2SEl5fVStwXPOFoaOnLARMrx/uZkL8b/NwfVG94RffsBhhBN79rcrfTFfEnKDz+ltvhcYsWwecaLaV4b3TIAJLV0nr65POVjhteNoOF3llKEw3ABeeFwxrquODMNgEFFO7ao4pX39Gf/tWScJJlninPhmLUyWib3AkAwuFhBFwcLgc=
eeb7e94b-bb6f-418e-915b-e80ff03ffc9a	6fc7a64b-ff88-4470-b05f-166accee2c95	priority	100
8f3baf8f-d270-483a-a6c9-63131adc0d51	6fc7a64b-ff88-4470-b05f-166accee2c95	algorithm	RSA-OAEP
439f9ff5-e8c4-4728-8c7a-b9c424a7d27e	97ba86c2-e594-4451-b790-cc5901b053ba	privateKey	MIIEowIBAAKCAQEAmb0qHokea7Ez7t+W/1aC+a6VZzoyXdDXvbIHKcy11zGGCs6lzQWTZLtF8lTzeprKtOYMiZwzvx1weLK2cvsV9N3RNOCQ75SzULd2kcs2GprXuhyAEDM0iLgBraFjqKINC1M084SJQA43sl3nwTV2Dk88VxGJl1SV8zQwQ7WekvYuU+uVAG7OUuoYUcbyCwa2M4UBvTOYN3Wx4IZEnIn9tw68U0KImmp9hDkQlzQjgX6iJJSkAwXoi8X8J06FF+hBZ41Tx+/EM5V2ssLUnpjlE6B5HUKVZR+mEiOGF8TOk8uXBQ/ARwgumyrCSVQKhccaB2KKeB4/6vpik7GhaldQpQIDAQABAoIBABV+fQUH5q49ItBNh67rSXnfDsRVPqAfMrUyzrg+sVhaHtjOoMpT8pItcfoPe9Bdvo7MGwn3l28rjoNReRtaP2zyFkMY99Ux1QrT8PUxPr85fC++Yak3f4DIjnOCvOGMG9wZe1hl5J/asllzB5PbsEW6jj/IvpPfH5fWaWkOBhLwYNCb706OwG9ffZbw/7cYIBLrgkKjsUaYPVplmn6PI6rCprdk9q/EFzX6EJNhidg/2M+UuF9y4+r+rWD0kOBdfRzIFckAXBxrZCQq48dekEAu2vT/j1qilYoMt0glILbKAYdtoy8vLMf/2PgxS01HNov4Yc9wWTw5SS2E1muuLYECgYEAxoB6+9Cb7jU1y4yUOIQEKNfQ5UrwtdSnX6OhUBmnb6ovGS9VhLReh7BaGWCEHWXA+6RB8wD7sNVHfVYQbOcDgYwa0mF/oNg7mUDr3oiDOjKH1lD/R9jJElTkcrl1+YNH1pNpatJJhCS6AUpYf2gwYny5uLQBR+wL0/ttFlOLx+8CgYEAxkVf6Vv8LfOvd6eVoXWnmsIyee15woIhW9mSHh4uyTqXn7r+gMlI3BDH1cH0DNagkFCPQ/b/GMccXI4iLajkhZrt9qQbDy5wM2+hsQgDIFWlvFHt8oQWpZDHO+mVg4VWXoEFZ20UT4PL69Xd8RQhfOQ+ow5ouMMbtI0lvLHvfKsCgYA3WWfxg0+XclrXsRE7WQRX5yWmaekIqo0pC9VVInIfntKXMS2lXS3mo/Pbk6ADGnZfNIP3IFUOD8ppVnAqDZharRhlhS4zSVgE+adLW8FLnv9lcRxdikM2y1kP7ErLEiIb4OrKEGzTXfJHndVjYUfsjl6y8+5PgbAiob7fNNiLHQKBgCEmBiQQ0feoz0RVC2pELnJsV14VOw8vDH67wHcymqXgGuuEqvpDLOBGGfL+C1x+IbgfD+TQDdRJrc83oDU8EIDZ50EeLLv8Cpw+5KyhZ0xnpV733611MggaTYURx4KGr2r7bTjefs/QfC6AwiuFLxgfXO2MAiwpyp8EHjQPF7gjAoGBAMWdhgajntJuoTr67X2R/pGS1G3tZdqruYrMhpLmkKeA8XQ7dTn13HWY5o/mYBHy5IaLYZoh8M0BnNChRtdHjaMegX9cq9F8971kFIPWHUcVs2EtluLa+vrzs0knvUNa7g5wdN/ueJmwqktYGuZn9W/rcqrVGMHhFLuG3lAbuU2G
24a20df7-0e65-4e7e-a9e4-4d50a2013fd3	97ba86c2-e594-4451-b790-cc5901b053ba	keyUse	SIG
27828f41-d1fb-4424-9b7c-e7fd5ea54d33	97ba86c2-e594-4451-b790-cc5901b053ba	priority	100
8f505947-23cc-452d-a019-e39c17518af9	97ba86c2-e594-4451-b790-cc5901b053ba	certificate	MIICmzCCAYMCBgGFpxJcWjANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMwMTEyMTczOTM2WhcNMzMwMTEyMTc0MTE2WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCZvSoeiR5rsTPu35b/VoL5rpVnOjJd0Ne9sgcpzLXXMYYKzqXNBZNku0XyVPN6msq05gyJnDO/HXB4srZy+xX03dE04JDvlLNQt3aRyzYamte6HIAQMzSIuAGtoWOoog0LUzTzhIlADjeyXefBNXYOTzxXEYmXVJXzNDBDtZ6S9i5T65UAbs5S6hhRxvILBrYzhQG9M5g3dbHghkScif23DrxTQoiaan2EORCXNCOBfqIklKQDBeiLxfwnToUX6EFnjVPH78QzlXaywtSemOUToHkdQpVlH6YSI4YXxM6Ty5cFD8BHCC6bKsJJVAqFxxoHYop4Hj/q+mKTsaFqV1ClAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAJN9MOAB1ymCi9YN3d+IWBW5skIwYB8B/U6P/Rdsi/B2d0dK4erKsgkT/Wdjz3xgxZrvkzGJAEDxW1tMtVtChwL0BfDbIm1ZVXZDnhDa/dAXOnz5fBB4Qjlql/sZJLDa8l5p0nW8DzRMpA7cU/5K8Gvr2u7KzY/tLWBHxCps+rfTssnOcQ3vC98uHeLAjRIHMo77cghRk55rG5Zvlr8r79bnDp7RPQ2o3tICo8SEFDPTLWKCmeTe3C2O1n/T602v7zoCSNhvMsPgCoHlZrb1XE2JWy6FdWzyiYIfkd5L63NoALyYWxq2UflpLH11aAPiKZmLxu8Zbe8xw95t9ZAGHa0=
4a0045f5-2d43-4527-9b66-bf4fe1f26d57	39cca108-e3d8-4c5b-9966-b5b2faaa9234	secret	AyAvPMmizv7IlFa1Z0sJ2w
03f694fb-265e-4cb9-bfcc-99efcdd7bc79	39cca108-e3d8-4c5b-9966-b5b2faaa9234	kid	836a389f-aff0-4f63-9763-421336f9932e
c92a0f3d-d894-46da-a215-967a8799b992	39cca108-e3d8-4c5b-9966-b5b2faaa9234	priority	100
496cded5-e7a3-4938-8ec2-fea435c572ab	9bafe225-ae84-4c2c-bf1a-15e2c380683e	kid	25c78909-39b7-465f-bd8f-54616e7f7202
6b38b529-1646-4680-9c23-d632e73ece2d	9bafe225-ae84-4c2c-bf1a-15e2c380683e	secret	yLqx5o78q6XpQBD919KC1cd6-k-4RSqsM9_jfJmDqNs6DLLMCnzEbt7G_WlIg150iuJWXHSlIyJnfYifV4SFFQ
4dfefbb8-92b9-488d-9601-32872b1b8f38	9bafe225-ae84-4c2c-bf1a-15e2c380683e	priority	100
87e28e23-793e-4180-ac99-ab547686b7df	9bafe225-ae84-4c2c-bf1a-15e2c380683e	algorithm	HS256
c8d0e0ac-6a5d-4892-b01d-27b44b92364e	20a6c68e-ed5b-4d11-96a9-2e8c954ed2dc	priority	100
253999e9-f14c-40d7-acb2-a7d81c5f8072	20a6c68e-ed5b-4d11-96a9-2e8c954ed2dc	keyUse	ENC
ed7bd5c7-8a70-420b-9be7-699f9a06d0ba	20a6c68e-ed5b-4d11-96a9-2e8c954ed2dc	certificate	MIIClzCCAX8CBgGFpxsBwTANBgkqhkiG9w0BAQsFADAPMQ0wCwYDVQQDDAR0ZXN0MB4XDTIzMDExMjE3NDkwM1oXDTMzMDExMjE3NTA0M1owDzENMAsGA1UEAwwEdGVzdDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALVASjerhgHCkv9V+jroDlGutlFWURCMTsN5GVvNR6Gz/42S9q2F6xFDXgjr/Q1cnGqg+gBSac/k78f39i+8zUGlHJA2rbiy6qX9DdDLfHLY4SCkrhxqSipgpXnicR5aeTo/YuVCbqcBHe8L5Mfeb9QfQSzvZebehDFoaQOQGPDtEoYmZ+LM2TqnlLNx5mKbjHXuI2l/Hum13CtdZcMhUCcB+yAtRU76f8yWZcDX8hlRUdyKpmzyiWYvZJMffdXYz18jh29MSizvPMllfGQ6TmTuKxS6YrMWZ2IhxpP2TYnNITi279ujrGlTsjfP4G6MRt9TlWCMNy1rYMQh3v+R+1kCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEATvvcwOJ5xUPzDs7fZlZdSOOjWr5qqL7Dkh4rzGCZprun4/fxOKDZUIJQ9AU42Vbf+W9A8/XpRijJ0rg1s6fjL8x9tdV3pw8dQk5mhPKacgL5B1ohseuQYU8YkJqOeBQhc9iS/OLFZAIQF+2hpZygF6z9cEP84Rkf3ydja33ZadhzsGRtuu2OwL/st/YaDOWKwU1LrIldcWuiF1OMnuEdjHdEE0sIBxRKo71AvsWZlQniNBEYyHJT3/WlyMPHEP5u2f37b7n+FQK0MF3X+3HZNZYgZyLq7hZxkm7EAKnd7UqzIsXeQTbwPp4Aa2HHQdfB6MwE71X7P6ThYyt2U1CcXg==
c9075deb-5958-489f-9c5d-0553691bd3f4	20a6c68e-ed5b-4d11-96a9-2e8c954ed2dc	algorithm	RSA-OAEP
b413debc-e5c6-4589-a359-792b21a6626c	20a6c68e-ed5b-4d11-96a9-2e8c954ed2dc	privateKey	MIIEpQIBAAKCAQEAtUBKN6uGAcKS/1X6OugOUa62UVZREIxOw3kZW81HobP/jZL2rYXrEUNeCOv9DVycaqD6AFJpz+Tvx/f2L7zNQaUckDatuLLqpf0N0Mt8ctjhIKSuHGpKKmCleeJxHlp5Oj9i5UJupwEd7wvkx95v1B9BLO9l5t6EMWhpA5AY8O0ShiZn4szZOqeUs3HmYpuMde4jaX8e6bXcK11lwyFQJwH7IC1FTvp/zJZlwNfyGVFR3IqmbPKJZi9kkx991djPXyOHb0xKLO88yWV8ZDpOZO4rFLpisxZnYiHGk/ZNic0hOLbv26OsaVOyN8/gboxG31OVYIw3LWtgxCHe/5H7WQIDAQABAoIBAArLawgk/uCGtTDADvy4YpbuifTu6DnNM2ksoowfPhGFOfZ1btvPhpwS+CwdmubzcazfjLgdcGgVZUrya371Fn/e/KQhn4fJHxS27R5W6iDgZgsGx8hRM7zRn/VR/UTupDrp+MK46cRoOn9IxO2644vddykdEmN1M+gJ5Pw1dijOChQmvGDO0WfLkLyju2ioz0se2Y/gAGvyNgAbbsFFWIlcSRMRYnL28pt/d15HXlDg3bGnxz2o3kTiWeRB+e4tlXv5P0p28QWIFLexZdxYNJkXNj7O7bGYSTjQVhzydAUuFFo5jO42HynLYcxmvaf/mYghZR8zbe76Q6ytj9brjPECgYEA2dZWI7dzoNyFsGf84qDdwE5gVGbSmadWbkzL9PNbzN5XFytaXbyn5d60cjrksmdsGA1QQ3LIZqAmaWdjASD+iJ2wmdAJpow67F5DnjjWxDMNp4qFg8NqT1SV3IlldCbDYy1V5rNlV5vzhSEKvrc8/lX5tXykU6D4IZAUxZF3/bECgYEA1QEfY34/Z8OsZ4Hn35E5cWrc55EYWE1CjJW+pft4sEWvzj97jD3HFwKQEIvlH+rhPqlgjK3clQdN2wRkUNFRLXnJW0F4Ts6mimWqG6SNDYp5k0WGJJ0+yVDLpXuUH16Fteyf2eRIPktkjE4IsTdUbhhtzhwHn/c/fu0icGS0eikCgYEAqD+NxIRawHHSqA+JGJla7L8cU9Qe8SJ39TVHime0DaXk6jZH04J0w2yhPmESZmDO8jzGM3IiKnGjeWGq7CJJtcblsccmzQYeNJYR79DCwEMWVsL8oGp8X81a+jz8qRuPabiIUmlY6rO/AKImpGrupxpMhcpBOX5oZ7Pa90WFweECgYEAynAsstRz0lyH6D/wbeyJ2Z8kn/ioWJPlIdPXw8yCYZV5ht2SwDCenOHUpcUvV+xVcsZreohq0kCE4BkGdkDZlAzhMBfDDbMdWP9Scr8rR6lJ7ovu97Fy0MY3JemTV1TwY3ymV+G8P2hMAYTQgg0B8zjIc1D0djX4ZNtfFc7AMDECgYEAvifQed03XnuOzsMr5NvpusW++B4kvdAoFNgnVgHJKSUOcVLLhsuUcI1eGeSW/YIqT8FZ666vdNcxNToq89V+IbUuHGIJ0Z+JKwJlI34vzVuy9b0FOJEPxa4na/1cxyvIl40UtADrkr57Nlq+b9Ks7VXM/OVe+g4JPCkGhVSifWc=
b20982bf-eb4e-4014-b76f-bc76d56a5f8b	24317dbd-7095-4658-9f3e-f2dd27f5de9e	secret	RyJaYE0GfcG-BSnxxOXm2w
ffe1cd29-62a2-4dbb-a84b-2e6d5aacfdc7	24317dbd-7095-4658-9f3e-f2dd27f5de9e	priority	100
22d2155a-9439-4770-9c17-02e46e58d768	24317dbd-7095-4658-9f3e-f2dd27f5de9e	kid	997882f0-ef42-4b31-8f97-df4077b86383
d5dc17ad-b15d-4628-afa6-44aaef4e1416	54530ba7-e4f5-4937-9949-f6a74f5a57c8	priority	100
e6bd959e-9dde-4e7b-9b8a-a3f711891570	54530ba7-e4f5-4937-9949-f6a74f5a57c8	keyUse	SIG
e85cdfd1-d264-4745-bbe0-9b9289ed4f84	54530ba7-e4f5-4937-9949-f6a74f5a57c8	privateKey	MIIEoQIBAAKCAQEA3XirpfnRdTz//jOsHylKIwWv1UoHYb7okVCMCirO5/J9QZaxTiUN+hbEnRacWVZqX8QUhfiMWJZy0YytGjZnxA9sK9kEVJ8NzZXfuvsj5UVnIfX+LVrDCqA08Nxpjf0XToO3vFV9WnbKgAkZrzMsh0K3xi8ap1Qcc3PDztqD4zcfz8LY6mYrQJLINANTb1lgodfnFAeF/dBTqMgRuLk7CoEJav+KrvJtHIHmRvSVp9Asf6JqlGy4JRPMwEhZVrbDwsWli9kqQpBVVDwML9z3cVxxJ0BUdwLWWyt3q9WD9kxZ9OYQELFvt1QCR3ANfo08LGt+Ny73zS+glLfDhsPNPwIDAQABAoH/b975k8eHVtXRGqV0WvjJgXmnDvG1IKN6cHB59ONTDkwP8gpJ7DaflvZPqxi5ewgOeR47E9esMaW+3Zc5Kdiarw+e845/8fWn0BQQplQJzcY5sWL3aCwY3TaTeM4mzLbuUMlcxHULfdn/3eAopCtSm/k022rSj4eG15eT1NqpicPwPAQQzW+VORDF1VEtmlzCf+kBOYhQ9wR7KSndmyKJUH4LZtAnfGC1rihfoSbIVamY7Ob4kgzGctAipReV8d8qYSt7sGB2E4GsYhkpALAj5ZhGve+Lbe6nSxIHRjGgX+gTqSuCP9lzKdAU0evcPIDeSPh2g1ZI3vSakVHE/N1BAoGBAPSIX3Qf7PPK+KEmpqSOiBpn/VrzFeBhtjQO8bX5wB6rpSpAHWLcUBLX3XbRIDqgbrqxYa5aOauw4fPaFpFXb0k2dki3tvtzCch6cRzM6PeAyawe0sI7Ikmde1vK9kJBvxMx68ZUgcQifDCZqBD3lYGh2bksqLIgoNmmLFMDZ30vAoGBAOfbcfVTxmVw7L3gnPi8n1jhwt4L23puBZ0KwpDcjdBA4XCEBjdoYCCSrX3or5D8/0Y4ZHYdtRRKeagVpvlNgQKXaTNPCZBU9nkowMC/ygfU7g6wVkQT2UJBO3aZur6ZpdXtpWRWZpCwbzQzmhGYdfASaULW4iIxoBtcilHQY0zxAoGAadMizBSM7Syn0MXzVD/CsvrR8CxHCWX//iOBg2lkNWG/Brvce84wcRcuZp82PWj0wqLFTTkKwDy6bFezcI7QQHTrV6j57XPphfNHRFmBcKsxm+Vy/E+vFQCsRBtf22isklgGWzxzNDhgWoAE9eLPttweZz7mesAYHFkH0Z0lik0CgYAchnwjwbXT/yuxRLQrShGUvtnZtb2/909LfepoJipwZ7sUu7mEEZxaBZHAvuLyxJ2nhwKdIZSItYz4KAnN/EIWDojL3jp//mQAjgoA7NevVPwg5IMIhySgqSPmuI0oLAEiK8XAbXza6koUMxEOfyJrcehvZ76UlGRtWVpPLIM7EQKBgQCNW/eaX0N6DXorGKzA1anXrHlLE4iFmiUsmnwcet7I3vyesU/QIVmPayx28TxnZNls6j4NWgB15u2q1ON/afeFOWKZuNA1L0u17e7ksaxuvNeXj0ziqOTrK0twvgtXzuglkzIxWTR8lnBR/4QH4XBu7W3nLhAGjy4O95BtgCcJCQ==
84449dea-3ba9-4a70-b8e2-4929b1dffb63	54530ba7-e4f5-4937-9949-f6a74f5a57c8	certificate	MIIClzCCAX8CBgGFpxsAvTANBgkqhkiG9w0BAQsFADAPMQ0wCwYDVQQDDAR0ZXN0MB4XDTIzMDExMjE3NDkwMloXDTMzMDExMjE3NTA0MlowDzENMAsGA1UEAwwEdGVzdDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAN14q6X50XU8//4zrB8pSiMFr9VKB2G+6JFQjAoqzufyfUGWsU4lDfoWxJ0WnFlWal/EFIX4jFiWctGMrRo2Z8QPbCvZBFSfDc2V37r7I+VFZyH1/i1awwqgNPDcaY39F06Dt7xVfVp2yoAJGa8zLIdCt8YvGqdUHHNzw87ag+M3H8/C2OpmK0CSyDQDU29ZYKHX5xQHhf3QU6jIEbi5OwqBCWr/iq7ybRyB5kb0lafQLH+iapRsuCUTzMBIWVa2w8LFpYvZKkKQVVQ8DC/c93FccSdAVHcC1lsrd6vVg/ZMWfTmEBCxb7dUAkdwDX6NPCxrfjcu980voJS3w4bDzT8CAwEAATANBgkqhkiG9w0BAQsFAAOCAQEALzxJMxDsXSa91o5k4WhkOB0e04kJTEtsCgv+bW+DcHnSQAuLKYUOoxh3PzXSEYUU0ttCwglcSVqX8Y8tgAa03XMYECse+wLbLFGyXn4mpUjMx7MeUh1LpH9LwxNXuJGn81oiPfxVyK9rzPgGoxLZzz11wQM+ZQ+5uKGICby+VF7kiT0FE70Th4UiiV8xnzmVAIqLnP77Tv52otPRFZTIVVA9R2coofuv2pbeChv5N0qDvUji9m35X2NHQrQHHtLU3igKJ7BcAhKJWR/hA9AfqpY4ppCTY0HmsTmf0QGX9PX/dVdySXOfU5tp3fZAa42VDkfuyEsaD03bVM5D+SaUGg==
5f8a644b-afdc-49d7-b7da-e561f40ae158	029ab632-c5f8-4044-8ae1-414f2704ba3a	priority	100
96a43528-bf6d-4f2b-9a6a-ce8176e967cf	029ab632-c5f8-4044-8ae1-414f2704ba3a	kid	0f9d8132-329c-4fe6-a559-ed79e244a946
558939ce-4ec6-405c-8ed8-bd50aaea8245	029ab632-c5f8-4044-8ae1-414f2704ba3a	secret	xxREoxTBkkFw-s36W6amCvxCilF_ZcVpVrtoseBpX5H3jDDK1fMHjONzH3C2uF6BRIPC3YWYYNL3TPppqXDsvg
c0d753b7-edc6-4ec9-9bf8-a134589c9e62	029ab632-c5f8-4044-8ae1-414f2704ba3a	algorithm	HS256
d6b99b62-0b3e-4b36-b34e-09692c18b6f5	d49b6616-a4ca-446c-903a-14a4389d6895	client-uris-must-match	true
a61936d8-bb1d-4ffd-845b-94176cf40b5e	d49b6616-a4ca-446c-903a-14a4389d6895	host-sending-registration-request-must-match	true
11b8b33e-c556-4107-af2a-df09e00807f0	d9aed8be-b36a-493d-964d-390455ad1e27	allow-default-scopes	true
be3d5324-d74e-425f-8800-d3444bf53d88	1a9cc05e-f5af-455f-aa22-c20b86e2a788	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
b86cb47b-cc2f-4bcb-a9b5-7d093b72df15	1a9cc05e-f5af-455f-aa22-c20b86e2a788	allowed-protocol-mapper-types	oidc-full-name-mapper
47208202-b916-4ef4-a7bb-1f6605707fd4	1a9cc05e-f5af-455f-aa22-c20b86e2a788	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
fe15c270-aae9-41e3-bfdd-f8088d9959d0	1a9cc05e-f5af-455f-aa22-c20b86e2a788	allowed-protocol-mapper-types	saml-role-list-mapper
3cf1453d-06ab-4585-826c-19e09bf1ee27	1a9cc05e-f5af-455f-aa22-c20b86e2a788	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
2c019b17-5faf-4752-acbc-dd4e5302f7fc	1a9cc05e-f5af-455f-aa22-c20b86e2a788	allowed-protocol-mapper-types	saml-user-attribute-mapper
2d300f9f-0b98-4292-9907-8088a1b6e1e2	1a9cc05e-f5af-455f-aa22-c20b86e2a788	allowed-protocol-mapper-types	saml-user-property-mapper
5a005fc8-0dfd-417f-8169-fa35efc00300	1a9cc05e-f5af-455f-aa22-c20b86e2a788	allowed-protocol-mapper-types	oidc-address-mapper
cf820be4-23a5-4f57-82ea-b3816f5ff29e	bd62f316-0a0b-4c5e-b243-825a40346e0a	max-clients	200
697c7dc0-bb92-4d17-82b8-99f3375e8e39	c2f204bc-a5c2-4c20-b32d-a7425f995d74	allow-default-scopes	true
0bc28d68-bc14-4469-aedd-d026bb27511b	33103b4f-6f22-4455-83b8-d5ebf7b9d619	allowed-protocol-mapper-types	saml-user-property-mapper
826ef0cd-41b4-4a65-8544-b0e164ead581	33103b4f-6f22-4455-83b8-d5ebf7b9d619	allowed-protocol-mapper-types	oidc-full-name-mapper
0e118a4f-6d89-4413-a982-12b073eb8c33	33103b4f-6f22-4455-83b8-d5ebf7b9d619	allowed-protocol-mapper-types	oidc-address-mapper
3d22e126-5dbe-4bd7-9315-440b9af248c1	33103b4f-6f22-4455-83b8-d5ebf7b9d619	allowed-protocol-mapper-types	saml-user-attribute-mapper
cbb6a0d9-a36f-44e3-8743-d4b5fc2a097d	33103b4f-6f22-4455-83b8-d5ebf7b9d619	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
b7ed0d24-e27a-463e-b216-83cc1fd528eb	33103b4f-6f22-4455-83b8-d5ebf7b9d619	allowed-protocol-mapper-types	saml-role-list-mapper
c4671501-1d49-4fc5-9ad1-f164131de199	33103b4f-6f22-4455-83b8-d5ebf7b9d619	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
d133c8b8-5e02-428e-b11d-f550793987ae	33103b4f-6f22-4455-83b8-d5ebf7b9d619	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
\.


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.composite_role (composite, child_role) FROM stdin;
d3f330d9-872a-43a1-ad1c-3d50c3e433bf	37b4e52f-9812-4594-813b-df78c334e74d
d3f330d9-872a-43a1-ad1c-3d50c3e433bf	1d702457-b160-426b-adf8-08bf69930ecd
d3f330d9-872a-43a1-ad1c-3d50c3e433bf	16ed6f81-e8ff-43f4-95cc-4dd82ec70108
d3f330d9-872a-43a1-ad1c-3d50c3e433bf	9637793f-c901-4d0d-b7bb-6cc4ca80de2d
d3f330d9-872a-43a1-ad1c-3d50c3e433bf	ed6f662a-3b73-4502-bce3-16d5cc972774
d3f330d9-872a-43a1-ad1c-3d50c3e433bf	89b0848d-08a0-4e12-a9d7-eb09aeb3d5e9
d3f330d9-872a-43a1-ad1c-3d50c3e433bf	b43c9055-1fb1-4494-8412-9956a7573770
d3f330d9-872a-43a1-ad1c-3d50c3e433bf	e3fbe38c-d083-45d2-93ee-723208841da0
d3f330d9-872a-43a1-ad1c-3d50c3e433bf	92cb4a9e-5121-412b-9d40-631332f76b07
d3f330d9-872a-43a1-ad1c-3d50c3e433bf	a42d9a82-ea65-42e4-a266-4570bbdb0cd1
d3f330d9-872a-43a1-ad1c-3d50c3e433bf	d9b790b2-c775-421a-b241-08816c3635f4
d3f330d9-872a-43a1-ad1c-3d50c3e433bf	b183d0e5-6ea8-4789-8d28-32da7de4cbad
d3f330d9-872a-43a1-ad1c-3d50c3e433bf	0c68b501-a3c0-43ca-9d26-82eef34a4958
d3f330d9-872a-43a1-ad1c-3d50c3e433bf	31f9df84-e7ad-4b61-8386-163a0d740f19
d3f330d9-872a-43a1-ad1c-3d50c3e433bf	2bd9176d-f5f6-4d0f-828a-d62c5585350c
d3f330d9-872a-43a1-ad1c-3d50c3e433bf	8e428c8e-f243-4d4d-ae9f-ba2479b597a0
d3f330d9-872a-43a1-ad1c-3d50c3e433bf	89759928-0f73-401d-8724-2a78c135aeb9
d3f330d9-872a-43a1-ad1c-3d50c3e433bf	a001b681-03b1-4add-825d-034c57e21dd6
9637793f-c901-4d0d-b7bb-6cc4ca80de2d	2bd9176d-f5f6-4d0f-828a-d62c5585350c
9637793f-c901-4d0d-b7bb-6cc4ca80de2d	a001b681-03b1-4add-825d-034c57e21dd6
ae024e4f-1d3f-4176-aee0-c30ff292f424	1bf87b56-5452-445a-98da-24edab464e15
ed6f662a-3b73-4502-bce3-16d5cc972774	8e428c8e-f243-4d4d-ae9f-ba2479b597a0
ae024e4f-1d3f-4176-aee0-c30ff292f424	de0f28a4-f1ad-48d8-89e4-c1e015b646b8
de0f28a4-f1ad-48d8-89e4-c1e015b646b8	fb435ff8-0355-4707-ae7d-79efa31c0618
538eae08-4c53-484c-81ec-140142c32afc	3fa49b76-4d75-428a-8456-82a6b38f4e27
d3f330d9-872a-43a1-ad1c-3d50c3e433bf	c7ffdd0e-19bc-4606-9a45-8a18de667b4a
ae024e4f-1d3f-4176-aee0-c30ff292f424	cdbce1cc-8efe-4ba2-99d8-b882e989989b
ae024e4f-1d3f-4176-aee0-c30ff292f424	92c3c60e-e449-498b-9c32-4d14cc4bf7da
d3f330d9-872a-43a1-ad1c-3d50c3e433bf	2b6fbf76-fb18-4a08-accf-c77a0d5daf78
d3f330d9-872a-43a1-ad1c-3d50c3e433bf	80cb9f90-3858-46a1-a137-1412227ee775
d3f330d9-872a-43a1-ad1c-3d50c3e433bf	3291817c-21dc-4627-ad73-4a568799fd55
d3f330d9-872a-43a1-ad1c-3d50c3e433bf	126298f0-0927-4b5c-aaab-142f61b04f34
d3f330d9-872a-43a1-ad1c-3d50c3e433bf	0f1f3303-5d7f-44c5-9f70-36e5c4de6b4c
d3f330d9-872a-43a1-ad1c-3d50c3e433bf	c6477839-f980-467d-b912-86b245537188
d3f330d9-872a-43a1-ad1c-3d50c3e433bf	b6367c05-15ff-4014-97cf-dc1bbb2ff83f
d3f330d9-872a-43a1-ad1c-3d50c3e433bf	4fd73ff3-40dc-4eaf-94a4-d6cad0197e77
d3f330d9-872a-43a1-ad1c-3d50c3e433bf	1815faf1-d688-4c4d-b730-f0c99d63928a
d3f330d9-872a-43a1-ad1c-3d50c3e433bf	80b0e4af-7013-4077-af8c-9d4178a4fdae
d3f330d9-872a-43a1-ad1c-3d50c3e433bf	28dc0eeb-8fa9-4342-9745-e502746c232b
d3f330d9-872a-43a1-ad1c-3d50c3e433bf	b40755cf-4210-4d66-94f4-9237ab4c8b45
d3f330d9-872a-43a1-ad1c-3d50c3e433bf	2bada08f-8bd6-4ad9-bd28-f6df13291c2d
d3f330d9-872a-43a1-ad1c-3d50c3e433bf	dcd8d251-878e-4e24-9bbd-a5d59845ae58
d3f330d9-872a-43a1-ad1c-3d50c3e433bf	efe166fd-e712-4ccd-b7d8-27dbdfa2678a
d3f330d9-872a-43a1-ad1c-3d50c3e433bf	6da7c2f5-9817-42b8-8ac5-bd981064f96f
d3f330d9-872a-43a1-ad1c-3d50c3e433bf	8469995b-ecb8-419a-9f71-0a951f441e05
126298f0-0927-4b5c-aaab-142f61b04f34	efe166fd-e712-4ccd-b7d8-27dbdfa2678a
3291817c-21dc-4627-ad73-4a568799fd55	8469995b-ecb8-419a-9f71-0a951f441e05
3291817c-21dc-4627-ad73-4a568799fd55	dcd8d251-878e-4e24-9bbd-a5d59845ae58
98e7cd5e-7894-4b36-ad10-928371abb0e8	510c6978-9339-49a4-a302-cb2b41ba6a88
98e7cd5e-7894-4b36-ad10-928371abb0e8	965c300c-f088-4109-b34f-7a75bad832af
98e7cd5e-7894-4b36-ad10-928371abb0e8	b95a7dd7-5d29-4768-9bf1-d61cf3d944ec
98e7cd5e-7894-4b36-ad10-928371abb0e8	c082cc3c-d8a8-4c69-8160-54128332e162
98e7cd5e-7894-4b36-ad10-928371abb0e8	e213115b-368c-40f4-ae72-548005fc080d
98e7cd5e-7894-4b36-ad10-928371abb0e8	ed171b6a-94ce-4044-b687-fdb44b690600
98e7cd5e-7894-4b36-ad10-928371abb0e8	199a513d-ddd2-47ed-a16e-5b7736a13797
98e7cd5e-7894-4b36-ad10-928371abb0e8	f01ff1fc-4855-44a8-b7f8-c6732652ce02
98e7cd5e-7894-4b36-ad10-928371abb0e8	90bc5226-9465-421b-9072-125804287b59
98e7cd5e-7894-4b36-ad10-928371abb0e8	120020ef-d5bf-4d2e-b80f-7e3991737157
98e7cd5e-7894-4b36-ad10-928371abb0e8	2d04fe22-db8b-4766-9862-f9dcd2ab6d2c
98e7cd5e-7894-4b36-ad10-928371abb0e8	ec2816f5-4cac-415e-a996-c17029b5520e
98e7cd5e-7894-4b36-ad10-928371abb0e8	a86736f4-43d0-4119-b9b0-0b43c98aa7d8
98e7cd5e-7894-4b36-ad10-928371abb0e8	4ac0c61e-50be-4ca3-ada1-e75565e51001
98e7cd5e-7894-4b36-ad10-928371abb0e8	6fd91920-801f-4cc9-838b-4807a6980eba
98e7cd5e-7894-4b36-ad10-928371abb0e8	93202f3a-9e10-4af4-a3db-79f63bcedb05
98e7cd5e-7894-4b36-ad10-928371abb0e8	e1925ab9-ecfe-426a-8c42-066492063416
9cf2d423-80ec-40f4-892d-c4e90dd550ec	a6eca10d-c76c-4a76-822f-400458d8482e
b95a7dd7-5d29-4768-9bf1-d61cf3d944ec	e1925ab9-ecfe-426a-8c42-066492063416
b95a7dd7-5d29-4768-9bf1-d61cf3d944ec	4ac0c61e-50be-4ca3-ada1-e75565e51001
c082cc3c-d8a8-4c69-8160-54128332e162	6fd91920-801f-4cc9-838b-4807a6980eba
9cf2d423-80ec-40f4-892d-c4e90dd550ec	e35d9f32-9cb8-4f3a-b104-49964a8b869d
e35d9f32-9cb8-4f3a-b104-49964a8b869d	3451f405-dcdf-4c8a-9798-4bf23eec5b4e
a92010ea-0080-4537-9037-6e5f63bab924	c51e067a-13cb-4334-992e-29ea327f2194
d3f330d9-872a-43a1-ad1c-3d50c3e433bf	179f451a-2a52-44ae-81e3-6f5ddf20e5e0
98e7cd5e-7894-4b36-ad10-928371abb0e8	e842fb23-0225-4dd1-a805-45cd7b7b41d8
9cf2d423-80ec-40f4-892d-c4e90dd550ec	53bf1da7-e54f-4c1b-be78-ee19fa699aaa
9cf2d423-80ec-40f4-892d-c4e90dd550ec	a02375ab-0b86-43ca-a028-5d0b334299f3
\.


--
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) FROM stdin;
3c9c45fb-5431-4a78-94c2-9531c0016fca	\N	password	9627d75e-c84c-4a58-86d7-78dfe1cb7ad1	1673545277158	\N	{"value":"mv90FfM003KVsYajNnxvREDcHC3GcjVucYKZKY9O754yww22c9IqK2w5mG6I7h58j3dl8kthsPR8h+Ik05q2Qw==","salt":"TjnsXKx4n3eSfSUpSNVp/Q==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2023-01-12 17:41:13.808431	1	EXECUTED	8:bda77d94bf90182a1e30c24f1c155ec7	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.8.0	\N	\N	3545273613
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2023-01-12 17:41:13.81309	2	MARK_RAN	8:1ecb330f30986693d1cba9ab579fa219	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.8.0	\N	\N	3545273613
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2023-01-12 17:41:13.843737	3	EXECUTED	8:cb7ace19bc6d959f305605d255d4c843	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	4.8.0	\N	\N	3545273613
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2023-01-12 17:41:13.845791	4	EXECUTED	8:80230013e961310e6872e871be424a63	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	4.8.0	\N	\N	3545273613
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2023-01-12 17:41:13.88502	5	EXECUTED	8:67f4c20929126adc0c8e9bf48279d244	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.8.0	\N	\N	3545273613
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2023-01-12 17:41:13.886467	6	MARK_RAN	8:7311018b0b8179ce14628ab412bb6783	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.8.0	\N	\N	3545273613
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2023-01-12 17:41:13.934686	7	EXECUTED	8:037ba1216c3640f8785ee6b8e7c8e3c1	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.8.0	\N	\N	3545273613
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2023-01-12 17:41:13.936479	8	MARK_RAN	8:7fe6ffe4af4df289b3157de32c624263	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.8.0	\N	\N	3545273613
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2023-01-12 17:41:13.938882	9	EXECUTED	8:9c136bc3187083a98745c7d03bc8a303	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	4.8.0	\N	\N	3545273613
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2023-01-12 17:41:13.978775	10	EXECUTED	8:b5f09474dca81fb56a97cf5b6553d331	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	4.8.0	\N	\N	3545273613
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2023-01-12 17:41:14.001861	11	EXECUTED	8:ca924f31bd2a3b219fdcfe78c82dacf4	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.8.0	\N	\N	3545273613
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2023-01-12 17:41:14.003278	12	MARK_RAN	8:8acad7483e106416bcfa6f3b824a16cd	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.8.0	\N	\N	3545273613
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2023-01-12 17:41:14.010329	13	EXECUTED	8:9b1266d17f4f87c78226f5055408fd5e	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.8.0	\N	\N	3545273613
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2023-01-12 17:41:14.01803	14	EXECUTED	8:d80ec4ab6dbfe573550ff72396c7e910	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	4.8.0	\N	\N	3545273613
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2023-01-12 17:41:14.018746	15	MARK_RAN	8:d86eb172171e7c20b9c849b584d147b2	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	3545273613
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2023-01-12 17:41:14.019415	16	MARK_RAN	8:5735f46f0fa60689deb0ecdc2a0dea22	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	4.8.0	\N	\N	3545273613
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2023-01-12 17:41:14.020051	17	EXECUTED	8:d41d8cd98f00b204e9800998ecf8427e	empty		\N	4.8.0	\N	\N	3545273613
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2023-01-12 17:41:14.03873	18	EXECUTED	8:5c1a8fd2014ac7fc43b90a700f117b23	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	4.8.0	\N	\N	3545273613
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2023-01-12 17:41:14.05607	19	EXECUTED	8:1f6c2c2dfc362aff4ed75b3f0ef6b331	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.8.0	\N	\N	3545273613
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2023-01-12 17:41:14.058454	20	EXECUTED	8:dee9246280915712591f83a127665107	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.8.0	\N	\N	3545273613
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-01-12 17:41:14.22966	45	EXECUTED	8:a164ae073c56ffdbc98a615493609a52	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	4.8.0	\N	\N	3545273613
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2023-01-12 17:41:14.059255	21	MARK_RAN	8:9eb2ee1fa8ad1c5e426421a6f8fdfa6a	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.8.0	\N	\N	3545273613
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2023-01-12 17:41:14.060542	22	MARK_RAN	8:dee9246280915712591f83a127665107	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.8.0	\N	\N	3545273613
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2023-01-12 17:41:14.06898	23	EXECUTED	8:d9fa18ffa355320395b86270680dd4fe	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	4.8.0	\N	\N	3545273613
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2023-01-12 17:41:14.070582	24	EXECUTED	8:90cff506fedb06141ffc1c71c4a1214c	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.8.0	\N	\N	3545273613
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2023-01-12 17:41:14.071192	25	MARK_RAN	8:11a788aed4961d6d29c427c063af828c	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.8.0	\N	\N	3545273613
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2023-01-12 17:41:14.081782	26	EXECUTED	8:a4218e51e1faf380518cce2af5d39b43	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	4.8.0	\N	\N	3545273613
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2023-01-12 17:41:14.108917	27	EXECUTED	8:d9e9a1bfaa644da9952456050f07bbdc	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	4.8.0	\N	\N	3545273613
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2023-01-12 17:41:14.110247	28	EXECUTED	8:d1bf991a6163c0acbfe664b615314505	update tableName=RESOURCE_SERVER_POLICY		\N	4.8.0	\N	\N	3545273613
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2023-01-12 17:41:14.132715	29	EXECUTED	8:88a743a1e87ec5e30bf603da68058a8c	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	4.8.0	\N	\N	3545273613
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2023-01-12 17:41:14.138555	30	EXECUTED	8:c5517863c875d325dea463d00ec26d7a	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	4.8.0	\N	\N	3545273613
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2023-01-12 17:41:14.146552	31	EXECUTED	8:ada8b4833b74a498f376d7136bc7d327	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	4.8.0	\N	\N	3545273613
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2023-01-12 17:41:14.148375	32	EXECUTED	8:b9b73c8ea7299457f99fcbb825c263ba	customChange		\N	4.8.0	\N	\N	3545273613
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2023-01-12 17:41:14.150576	33	EXECUTED	8:07724333e625ccfcfc5adc63d57314f3	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	3545273613
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2023-01-12 17:41:14.151288	34	MARK_RAN	8:8b6fd445958882efe55deb26fc541a7b	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.8.0	\N	\N	3545273613
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2023-01-12 17:41:14.163038	35	EXECUTED	8:29b29cfebfd12600897680147277a9d7	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.8.0	\N	\N	3545273613
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2023-01-12 17:41:14.164686	36	EXECUTED	8:73ad77ca8fd0410c7f9f15a471fa52bc	addColumn tableName=REALM		\N	4.8.0	\N	\N	3545273613
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2023-01-12 17:41:14.166842	37	EXECUTED	8:64f27a6fdcad57f6f9153210f2ec1bdb	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	3545273613
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2023-01-12 17:41:14.168198	38	EXECUTED	8:27180251182e6c31846c2ddab4bc5781	addColumn tableName=FED_USER_CONSENT		\N	4.8.0	\N	\N	3545273613
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2023-01-12 17:41:14.169654	39	EXECUTED	8:d56f201bfcfa7a1413eb3e9bc02978f9	addColumn tableName=IDENTITY_PROVIDER		\N	4.8.0	\N	\N	3545273613
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2023-01-12 17:41:14.170552	40	MARK_RAN	8:91f5522bf6afdc2077dfab57fbd3455c	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	4.8.0	\N	\N	3545273613
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2023-01-12 17:41:14.171167	41	MARK_RAN	8:0f01b554f256c22caeb7d8aee3a1cdc8	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	4.8.0	\N	\N	3545273613
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2023-01-12 17:41:14.173227	42	EXECUTED	8:ab91cf9cee415867ade0e2df9651a947	customChange		\N	4.8.0	\N	\N	3545273613
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2023-01-12 17:41:14.226398	43	EXECUTED	8:ceac9b1889e97d602caf373eadb0d4b7	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	4.8.0	\N	\N	3545273613
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2023-01-12 17:41:14.22798	44	EXECUTED	8:84b986e628fe8f7fd8fd3c275c5259f2	addColumn tableName=USER_ENTITY		\N	4.8.0	\N	\N	3545273613
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-01-12 17:41:14.231764	46	EXECUTED	8:70a2b4f1f4bd4dbf487114bdb1810e64	customChange		\N	4.8.0	\N	\N	3545273613
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-01-12 17:41:14.232471	47	MARK_RAN	8:7be68b71d2f5b94b8df2e824f2860fa2	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	4.8.0	\N	\N	3545273613
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-01-12 17:41:14.249085	48	EXECUTED	8:bab7c631093c3861d6cf6144cd944982	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	4.8.0	\N	\N	3545273613
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-01-12 17:41:14.251375	49	EXECUTED	8:fa809ac11877d74d76fe40869916daad	addColumn tableName=REALM		\N	4.8.0	\N	\N	3545273613
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2023-01-12 17:41:14.269722	50	EXECUTED	8:fac23540a40208f5f5e326f6ceb4d291	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	4.8.0	\N	\N	3545273613
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2023-01-12 17:41:14.282983	51	EXECUTED	8:2612d1b8a97e2b5588c346e817307593	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	4.8.0	\N	\N	3545273613
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2023-01-12 17:41:14.284644	52	EXECUTED	8:9842f155c5db2206c88bcb5d1046e941	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	3545273613
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2023-01-12 17:41:14.285916	53	EXECUTED	8:2e12e06e45498406db72d5b3da5bbc76	update tableName=REALM		\N	4.8.0	\N	\N	3545273613
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2023-01-12 17:41:14.287131	54	EXECUTED	8:33560e7c7989250c40da3abdabdc75a4	update tableName=CLIENT		\N	4.8.0	\N	\N	3545273613
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2023-01-12 17:41:14.290841	55	EXECUTED	8:87a8d8542046817a9107c7eb9cbad1cd	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	4.8.0	\N	\N	3545273613
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2023-01-12 17:41:14.294382	56	EXECUTED	8:3ea08490a70215ed0088c273d776311e	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	4.8.0	\N	\N	3545273613
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2023-01-12 17:41:14.305388	57	EXECUTED	8:2d56697c8723d4592ab608ce14b6ed68	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	4.8.0	\N	\N	3545273613
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2023-01-12 17:41:14.34628	58	EXECUTED	8:3e423e249f6068ea2bbe48bf907f9d86	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	4.8.0	\N	\N	3545273613
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2023-01-12 17:41:14.358632	59	EXECUTED	8:15cabee5e5df0ff099510a0fc03e4103	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	4.8.0	\N	\N	3545273613
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2023-01-12 17:41:14.362065	60	EXECUTED	8:4b80200af916ac54d2ffbfc47918ab0e	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	4.8.0	\N	\N	3545273613
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2023-01-12 17:41:14.366217	61	EXECUTED	8:66564cd5e168045d52252c5027485bbb	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	4.8.0	\N	\N	3545273613
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2023-01-12 17:41:14.368154	62	EXECUTED	8:1c7064fafb030222be2bd16ccf690f6f	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	4.8.0	\N	\N	3545273613
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2023-01-12 17:41:14.369387	63	EXECUTED	8:2de18a0dce10cdda5c7e65c9b719b6e5	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	4.8.0	\N	\N	3545273613
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2023-01-12 17:41:14.371415	64	EXECUTED	8:03e413dd182dcbd5c57e41c34d0ef682	update tableName=REQUIRED_ACTION_PROVIDER		\N	4.8.0	\N	\N	3545273613
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2023-01-12 17:41:14.37379	65	EXECUTED	8:d27b42bb2571c18fbe3fe4e4fb7582a7	update tableName=RESOURCE_SERVER_RESOURCE		\N	4.8.0	\N	\N	3545273613
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2023-01-12 17:41:14.380719	66	EXECUTED	8:698baf84d9fd0027e9192717c2154fb8	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	4.8.0	\N	\N	3545273613
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2023-01-12 17:41:14.382624	67	EXECUTED	8:ced8822edf0f75ef26eb51582f9a821a	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	4.8.0	\N	\N	3545273613
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2023-01-12 17:41:14.384108	68	EXECUTED	8:f0abba004cf429e8afc43056df06487d	addColumn tableName=REALM		\N	4.8.0	\N	\N	3545273613
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2023-01-12 17:41:14.388121	69	EXECUTED	8:6662f8b0b611caa359fcf13bf63b4e24	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	4.8.0	\N	\N	3545273613
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2023-01-12 17:41:14.390831	70	EXECUTED	8:9e6b8009560f684250bdbdf97670d39e	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	4.8.0	\N	\N	3545273613
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2023-01-12 17:41:14.392525	71	EXECUTED	8:4223f561f3b8dc655846562b57bb502e	addColumn tableName=RESOURCE_SERVER		\N	4.8.0	\N	\N	3545273613
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-01-12 17:41:14.395357	72	EXECUTED	8:215a31c398b363ce383a2b301202f29e	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	4.8.0	\N	\N	3545273613
8.0.0-updating-credential-data-not-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-01-12 17:41:14.398507	73	EXECUTED	8:83f7a671792ca98b3cbd3a1a34862d3d	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.8.0	\N	\N	3545273613
8.0.0-updating-credential-data-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-01-12 17:41:14.39942	74	MARK_RAN	8:f58ad148698cf30707a6efbdf8061aa7	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.8.0	\N	\N	3545273613
8.0.0-credential-cleanup-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-01-12 17:41:14.408701	75	EXECUTED	8:79e4fd6c6442980e58d52ffc3ee7b19c	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	4.8.0	\N	\N	3545273613
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-01-12 17:41:14.411874	76	EXECUTED	8:87af6a1e6d241ca4b15801d1f86a297d	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	4.8.0	\N	\N	3545273613
9.0.0-always-display-client	keycloak	META-INF/jpa-changelog-9.0.0.xml	2023-01-12 17:41:14.413519	77	EXECUTED	8:b44f8d9b7b6ea455305a6d72a200ed15	addColumn tableName=CLIENT		\N	4.8.0	\N	\N	3545273613
9.0.0-drop-constraints-for-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2023-01-12 17:41:14.414431	78	MARK_RAN	8:2d8ed5aaaeffd0cb004c046b4a903ac5	dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...		\N	4.8.0	\N	\N	3545273613
9.0.0-increase-column-size-federated-fk	keycloak	META-INF/jpa-changelog-9.0.0.xml	2023-01-12 17:41:14.421835	79	EXECUTED	8:e290c01fcbc275326c511633f6e2acde	modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...		\N	4.8.0	\N	\N	3545273613
9.0.0-recreate-constraints-after-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2023-01-12 17:41:14.422619	80	MARK_RAN	8:c9db8784c33cea210872ac2d805439f8	addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...		\N	4.8.0	\N	\N	3545273613
9.0.1-add-index-to-client.client_id	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-01-12 17:41:14.4244	81	EXECUTED	8:95b676ce8fc546a1fcfb4c92fae4add5	createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT		\N	4.8.0	\N	\N	3545273613
9.0.1-KEYCLOAK-12579-drop-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-01-12 17:41:14.425014	82	MARK_RAN	8:38a6b2a41f5651018b1aca93a41401e5	dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	3545273613
9.0.1-KEYCLOAK-12579-add-not-null-constraint	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-01-12 17:41:14.426292	83	EXECUTED	8:3fb99bcad86a0229783123ac52f7609c	addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	3545273613
9.0.1-KEYCLOAK-12579-recreate-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-01-12 17:41:14.426862	84	MARK_RAN	8:64f27a6fdcad57f6f9153210f2ec1bdb	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	3545273613
9.0.1-add-index-to-events	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-01-12 17:41:14.428589	85	EXECUTED	8:ab4f863f39adafd4c862f7ec01890abc	createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY		\N	4.8.0	\N	\N	3545273613
map-remove-ri	keycloak	META-INF/jpa-changelog-11.0.0.xml	2023-01-12 17:41:14.430581	86	EXECUTED	8:13c419a0eb336e91ee3a3bf8fda6e2a7	dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9		\N	4.8.0	\N	\N	3545273613
map-remove-ri	keycloak	META-INF/jpa-changelog-12.0.0.xml	2023-01-12 17:41:14.433744	87	EXECUTED	8:e3fb1e698e0471487f51af1ed80fe3ac	dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...		\N	4.8.0	\N	\N	3545273613
12.1.0-add-realm-localization-table	keycloak	META-INF/jpa-changelog-12.0.0.xml	2023-01-12 17:41:14.437659	88	EXECUTED	8:babadb686aab7b56562817e60bf0abd0	createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS		\N	4.8.0	\N	\N	3545273613
default-roles	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-01-12 17:41:14.44027	89	EXECUTED	8:72d03345fda8e2f17093d08801947773	addColumn tableName=REALM; customChange		\N	4.8.0	\N	\N	3545273613
default-roles-cleanup	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-01-12 17:41:14.44255	90	EXECUTED	8:61c9233951bd96ffecd9ba75f7d978a4	dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES		\N	4.8.0	\N	\N	3545273613
13.0.0-KEYCLOAK-16844	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-01-12 17:41:14.444535	91	EXECUTED	8:ea82e6ad945cec250af6372767b25525	createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	3545273613
map-remove-ri-13.0.0	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-01-12 17:41:14.448282	92	EXECUTED	8:d3f4a33f41d960ddacd7e2ef30d126b3	dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...		\N	4.8.0	\N	\N	3545273613
13.0.0-KEYCLOAK-17992-drop-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-01-12 17:41:14.44933	93	MARK_RAN	8:1284a27fbd049d65831cb6fc07c8a783	dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT		\N	4.8.0	\N	\N	3545273613
13.0.0-increase-column-size-federated	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-01-12 17:41:14.453214	94	EXECUTED	8:9d11b619db2ae27c25853b8a37cd0dea	modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT		\N	4.8.0	\N	\N	3545273613
13.0.0-KEYCLOAK-17992-recreate-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-01-12 17:41:14.454152	95	MARK_RAN	8:3002bb3997451bb9e8bac5c5cd8d6327	addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...		\N	4.8.0	\N	\N	3545273613
json-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-01-12 17:41:14.45633	96	EXECUTED	8:dfbee0d6237a23ef4ccbb7a4e063c163	addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE		\N	4.8.0	\N	\N	3545273613
14.0.0-KEYCLOAK-11019	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-01-12 17:41:14.46026	97	EXECUTED	8:75f3e372df18d38c62734eebb986b960	createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	3545273613
14.0.0-KEYCLOAK-18286	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-01-12 17:41:14.461095	98	MARK_RAN	8:7fee73eddf84a6035691512c85637eef	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	3545273613
14.0.0-KEYCLOAK-18286-revert	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-01-12 17:41:14.467641	99	MARK_RAN	8:7a11134ab12820f999fbf3bb13c3adc8	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	3545273613
14.0.0-KEYCLOAK-18286-supported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-01-12 17:41:14.470822	100	EXECUTED	8:c0f6eaac1f3be773ffe54cb5b8482b70	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	3545273613
14.0.0-KEYCLOAK-18286-unsupported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-01-12 17:41:14.471725	101	MARK_RAN	8:18186f0008b86e0f0f49b0c4d0e842ac	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	3545273613
KEYCLOAK-17267-add-index-to-user-attributes	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-01-12 17:41:14.47372	102	EXECUTED	8:09c2780bcb23b310a7019d217dc7b433	createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE		\N	4.8.0	\N	\N	3545273613
KEYCLOAK-18146-add-saml-art-binding-identifier	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-01-12 17:41:14.475931	103	EXECUTED	8:276a44955eab693c970a42880197fff2	customChange		\N	4.8.0	\N	\N	3545273613
15.0.0-KEYCLOAK-18467	keycloak	META-INF/jpa-changelog-15.0.0.xml	2023-01-12 17:41:14.479116	104	EXECUTED	8:ba8ee3b694d043f2bfc1a1079d0760d7	addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...		\N	4.8.0	\N	\N	3545273613
17.0.0-9562	keycloak	META-INF/jpa-changelog-17.0.0.xml	2023-01-12 17:41:14.481411	105	EXECUTED	8:5e06b1d75f5d17685485e610c2851b17	createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY		\N	4.8.0	\N	\N	3545273613
18.0.0-10625-IDX_ADMIN_EVENT_TIME	keycloak	META-INF/jpa-changelog-18.0.0.xml	2023-01-12 17:41:14.483637	106	EXECUTED	8:4b80546c1dc550ac552ee7b24a4ab7c0	createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY		\N	4.8.0	\N	\N	3545273613
19.0.0-10135	keycloak	META-INF/jpa-changelog-19.0.0.xml	2023-01-12 17:41:14.486376	107	EXECUTED	8:af510cd1bb2ab6339c45372f3e491696	customChange		\N	4.8.0	\N	\N	3545273613
20.0.0-12964-supported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2023-01-12 17:41:14.489089	108	EXECUTED	8:05c99fc610845ef66ee812b7921af0ef	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.8.0	\N	\N	3545273613
20.0.0-12964-unsupported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2023-01-12 17:41:14.490078	109	MARK_RAN	8:314e803baf2f1ec315b3464e398b8247	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.8.0	\N	\N	3545273613
client-attributes-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-20.0.0.xml	2023-01-12 17:41:14.493191	110	EXECUTED	8:56e4677e7e12556f70b604c573840100	addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	3545273613
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
1000	f	\N	\N
1001	f	\N	\N
\.


--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
ed653c96-d204-406a-87eb-480232fd55a1	1b86fb36-4687-45a7-a825-7b6a8f0eddd7	f
ed653c96-d204-406a-87eb-480232fd55a1	cff11f69-6ba2-4598-be0b-577271a3ca9c	t
ed653c96-d204-406a-87eb-480232fd55a1	7c95c951-40f9-460f-be3e-a3b415f7cc92	t
ed653c96-d204-406a-87eb-480232fd55a1	6fda0bf2-5ee2-4680-ab70-bb913b4e71c9	t
ed653c96-d204-406a-87eb-480232fd55a1	cb002b51-9594-47ce-a496-366f2096eb91	f
ed653c96-d204-406a-87eb-480232fd55a1	974db0db-2c63-4552-80a8-5cff64bf494b	f
ed653c96-d204-406a-87eb-480232fd55a1	c7ce5ff3-bad4-44be-9aa1-d53defcce75d	t
ed653c96-d204-406a-87eb-480232fd55a1	e32ce8e7-7193-4a84-ab89-a810f01b7ee4	t
ed653c96-d204-406a-87eb-480232fd55a1	719ccaeb-d45e-48e6-8eb7-ef88e23cb716	f
ed653c96-d204-406a-87eb-480232fd55a1	fc0ce346-d0af-4b0d-9c9d-ea3197c70395	t
2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	5c637451-0c01-47a2-a06b-7c92f0b8fdf9	f
2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	d77f8f45-f174-4aed-89d9-6f9f3d90b27e	t
2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	ea7594ed-2481-4575-bdb7-1f26fbf02d1b	t
2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	d42f7179-13dc-4a13-bdfe-a5e48566cf5b	t
2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	6d8af9a6-9705-45ba-97ab-8b184758b103	f
2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	63224374-feb6-49f6-9f08-6c850caf7d93	f
2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	b40a4c98-cb8f-4cad-a98b-18e4f3403ced	t
2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	5cf75d32-57d9-4e62-8f11-2f7cfaae88c4	t
2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	5baab7b4-ec68-4ee1-bf09-37378bf16f21	f
2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	7d1cfd7d-fd70-4c17-8e7a-91b3e8d06f82	t
\.


--
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id) FROM stdin;
\.


--
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value) FROM stdin;
\.


--
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fed_user_credential (id, salt, type, created_date, user_id, realm_id, storage_provider_id, user_label, secret_data, credential_data, priority) FROM stdin;
\.


--
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.federated_user (id, storage_provider_id, realm_id) FROM stdin;
\.


--
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.group_attribute (id, name, value, group_id) FROM stdin;
\.


--
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.group_role_mapping (role_id, group_id) FROM stdin;
\.


--
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only) FROM stdin;
\.


--
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.identity_provider_config (identity_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
\.


--
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.keycloak_group (id, name, parent_group, realm_id) FROM stdin;
\.


--
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
ae024e4f-1d3f-4176-aee0-c30ff292f424	ed653c96-d204-406a-87eb-480232fd55a1	f	${role_default-roles}	default-roles-master	ed653c96-d204-406a-87eb-480232fd55a1	\N	\N
37b4e52f-9812-4594-813b-df78c334e74d	ed653c96-d204-406a-87eb-480232fd55a1	f	${role_create-realm}	create-realm	ed653c96-d204-406a-87eb-480232fd55a1	\N	\N
d3f330d9-872a-43a1-ad1c-3d50c3e433bf	ed653c96-d204-406a-87eb-480232fd55a1	f	${role_admin}	admin	ed653c96-d204-406a-87eb-480232fd55a1	\N	\N
1d702457-b160-426b-adf8-08bf69930ecd	cc69d4ac-613b-442f-9172-e9fbbe3713a6	t	${role_create-client}	create-client	ed653c96-d204-406a-87eb-480232fd55a1	cc69d4ac-613b-442f-9172-e9fbbe3713a6	\N
16ed6f81-e8ff-43f4-95cc-4dd82ec70108	cc69d4ac-613b-442f-9172-e9fbbe3713a6	t	${role_view-realm}	view-realm	ed653c96-d204-406a-87eb-480232fd55a1	cc69d4ac-613b-442f-9172-e9fbbe3713a6	\N
9637793f-c901-4d0d-b7bb-6cc4ca80de2d	cc69d4ac-613b-442f-9172-e9fbbe3713a6	t	${role_view-users}	view-users	ed653c96-d204-406a-87eb-480232fd55a1	cc69d4ac-613b-442f-9172-e9fbbe3713a6	\N
ed6f662a-3b73-4502-bce3-16d5cc972774	cc69d4ac-613b-442f-9172-e9fbbe3713a6	t	${role_view-clients}	view-clients	ed653c96-d204-406a-87eb-480232fd55a1	cc69d4ac-613b-442f-9172-e9fbbe3713a6	\N
89b0848d-08a0-4e12-a9d7-eb09aeb3d5e9	cc69d4ac-613b-442f-9172-e9fbbe3713a6	t	${role_view-events}	view-events	ed653c96-d204-406a-87eb-480232fd55a1	cc69d4ac-613b-442f-9172-e9fbbe3713a6	\N
b43c9055-1fb1-4494-8412-9956a7573770	cc69d4ac-613b-442f-9172-e9fbbe3713a6	t	${role_view-identity-providers}	view-identity-providers	ed653c96-d204-406a-87eb-480232fd55a1	cc69d4ac-613b-442f-9172-e9fbbe3713a6	\N
e3fbe38c-d083-45d2-93ee-723208841da0	cc69d4ac-613b-442f-9172-e9fbbe3713a6	t	${role_view-authorization}	view-authorization	ed653c96-d204-406a-87eb-480232fd55a1	cc69d4ac-613b-442f-9172-e9fbbe3713a6	\N
92cb4a9e-5121-412b-9d40-631332f76b07	cc69d4ac-613b-442f-9172-e9fbbe3713a6	t	${role_manage-realm}	manage-realm	ed653c96-d204-406a-87eb-480232fd55a1	cc69d4ac-613b-442f-9172-e9fbbe3713a6	\N
a42d9a82-ea65-42e4-a266-4570bbdb0cd1	cc69d4ac-613b-442f-9172-e9fbbe3713a6	t	${role_manage-users}	manage-users	ed653c96-d204-406a-87eb-480232fd55a1	cc69d4ac-613b-442f-9172-e9fbbe3713a6	\N
d9b790b2-c775-421a-b241-08816c3635f4	cc69d4ac-613b-442f-9172-e9fbbe3713a6	t	${role_manage-clients}	manage-clients	ed653c96-d204-406a-87eb-480232fd55a1	cc69d4ac-613b-442f-9172-e9fbbe3713a6	\N
b183d0e5-6ea8-4789-8d28-32da7de4cbad	cc69d4ac-613b-442f-9172-e9fbbe3713a6	t	${role_manage-events}	manage-events	ed653c96-d204-406a-87eb-480232fd55a1	cc69d4ac-613b-442f-9172-e9fbbe3713a6	\N
0c68b501-a3c0-43ca-9d26-82eef34a4958	cc69d4ac-613b-442f-9172-e9fbbe3713a6	t	${role_manage-identity-providers}	manage-identity-providers	ed653c96-d204-406a-87eb-480232fd55a1	cc69d4ac-613b-442f-9172-e9fbbe3713a6	\N
31f9df84-e7ad-4b61-8386-163a0d740f19	cc69d4ac-613b-442f-9172-e9fbbe3713a6	t	${role_manage-authorization}	manage-authorization	ed653c96-d204-406a-87eb-480232fd55a1	cc69d4ac-613b-442f-9172-e9fbbe3713a6	\N
2bd9176d-f5f6-4d0f-828a-d62c5585350c	cc69d4ac-613b-442f-9172-e9fbbe3713a6	t	${role_query-users}	query-users	ed653c96-d204-406a-87eb-480232fd55a1	cc69d4ac-613b-442f-9172-e9fbbe3713a6	\N
8e428c8e-f243-4d4d-ae9f-ba2479b597a0	cc69d4ac-613b-442f-9172-e9fbbe3713a6	t	${role_query-clients}	query-clients	ed653c96-d204-406a-87eb-480232fd55a1	cc69d4ac-613b-442f-9172-e9fbbe3713a6	\N
89759928-0f73-401d-8724-2a78c135aeb9	cc69d4ac-613b-442f-9172-e9fbbe3713a6	t	${role_query-realms}	query-realms	ed653c96-d204-406a-87eb-480232fd55a1	cc69d4ac-613b-442f-9172-e9fbbe3713a6	\N
a001b681-03b1-4add-825d-034c57e21dd6	cc69d4ac-613b-442f-9172-e9fbbe3713a6	t	${role_query-groups}	query-groups	ed653c96-d204-406a-87eb-480232fd55a1	cc69d4ac-613b-442f-9172-e9fbbe3713a6	\N
1bf87b56-5452-445a-98da-24edab464e15	2ee7c2bd-4595-4051-9d9d-d2ff38d48b77	t	${role_view-profile}	view-profile	ed653c96-d204-406a-87eb-480232fd55a1	2ee7c2bd-4595-4051-9d9d-d2ff38d48b77	\N
de0f28a4-f1ad-48d8-89e4-c1e015b646b8	2ee7c2bd-4595-4051-9d9d-d2ff38d48b77	t	${role_manage-account}	manage-account	ed653c96-d204-406a-87eb-480232fd55a1	2ee7c2bd-4595-4051-9d9d-d2ff38d48b77	\N
fb435ff8-0355-4707-ae7d-79efa31c0618	2ee7c2bd-4595-4051-9d9d-d2ff38d48b77	t	${role_manage-account-links}	manage-account-links	ed653c96-d204-406a-87eb-480232fd55a1	2ee7c2bd-4595-4051-9d9d-d2ff38d48b77	\N
f7b9a185-f8f4-4257-8295-ceb89e1886c4	2ee7c2bd-4595-4051-9d9d-d2ff38d48b77	t	${role_view-applications}	view-applications	ed653c96-d204-406a-87eb-480232fd55a1	2ee7c2bd-4595-4051-9d9d-d2ff38d48b77	\N
3fa49b76-4d75-428a-8456-82a6b38f4e27	2ee7c2bd-4595-4051-9d9d-d2ff38d48b77	t	${role_view-consent}	view-consent	ed653c96-d204-406a-87eb-480232fd55a1	2ee7c2bd-4595-4051-9d9d-d2ff38d48b77	\N
538eae08-4c53-484c-81ec-140142c32afc	2ee7c2bd-4595-4051-9d9d-d2ff38d48b77	t	${role_manage-consent}	manage-consent	ed653c96-d204-406a-87eb-480232fd55a1	2ee7c2bd-4595-4051-9d9d-d2ff38d48b77	\N
6f02a589-3d96-44e7-a283-e5a6be00fe7b	2ee7c2bd-4595-4051-9d9d-d2ff38d48b77	t	${role_view-groups}	view-groups	ed653c96-d204-406a-87eb-480232fd55a1	2ee7c2bd-4595-4051-9d9d-d2ff38d48b77	\N
6f47d206-1304-40e7-8a8b-0fdbbd2da2a7	2ee7c2bd-4595-4051-9d9d-d2ff38d48b77	t	${role_delete-account}	delete-account	ed653c96-d204-406a-87eb-480232fd55a1	2ee7c2bd-4595-4051-9d9d-d2ff38d48b77	\N
488df034-f88c-4ef2-88ab-8e606a4fa3a6	dee79bdb-64d7-40bd-a111-604cb1f65e74	t	${role_read-token}	read-token	ed653c96-d204-406a-87eb-480232fd55a1	dee79bdb-64d7-40bd-a111-604cb1f65e74	\N
c7ffdd0e-19bc-4606-9a45-8a18de667b4a	cc69d4ac-613b-442f-9172-e9fbbe3713a6	t	${role_impersonation}	impersonation	ed653c96-d204-406a-87eb-480232fd55a1	cc69d4ac-613b-442f-9172-e9fbbe3713a6	\N
cdbce1cc-8efe-4ba2-99d8-b882e989989b	ed653c96-d204-406a-87eb-480232fd55a1	f	${role_offline-access}	offline_access	ed653c96-d204-406a-87eb-480232fd55a1	\N	\N
92c3c60e-e449-498b-9c32-4d14cc4bf7da	ed653c96-d204-406a-87eb-480232fd55a1	f	${role_uma_authorization}	uma_authorization	ed653c96-d204-406a-87eb-480232fd55a1	\N	\N
9cf2d423-80ec-40f4-892d-c4e90dd550ec	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	f	${role_default-roles}	default-roles-test	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	\N	\N
2b6fbf76-fb18-4a08-accf-c77a0d5daf78	1db87cbc-4e3e-4104-a855-9e27efa13d6b	t	${role_create-client}	create-client	ed653c96-d204-406a-87eb-480232fd55a1	1db87cbc-4e3e-4104-a855-9e27efa13d6b	\N
80cb9f90-3858-46a1-a137-1412227ee775	1db87cbc-4e3e-4104-a855-9e27efa13d6b	t	${role_view-realm}	view-realm	ed653c96-d204-406a-87eb-480232fd55a1	1db87cbc-4e3e-4104-a855-9e27efa13d6b	\N
3291817c-21dc-4627-ad73-4a568799fd55	1db87cbc-4e3e-4104-a855-9e27efa13d6b	t	${role_view-users}	view-users	ed653c96-d204-406a-87eb-480232fd55a1	1db87cbc-4e3e-4104-a855-9e27efa13d6b	\N
126298f0-0927-4b5c-aaab-142f61b04f34	1db87cbc-4e3e-4104-a855-9e27efa13d6b	t	${role_view-clients}	view-clients	ed653c96-d204-406a-87eb-480232fd55a1	1db87cbc-4e3e-4104-a855-9e27efa13d6b	\N
0f1f3303-5d7f-44c5-9f70-36e5c4de6b4c	1db87cbc-4e3e-4104-a855-9e27efa13d6b	t	${role_view-events}	view-events	ed653c96-d204-406a-87eb-480232fd55a1	1db87cbc-4e3e-4104-a855-9e27efa13d6b	\N
c6477839-f980-467d-b912-86b245537188	1db87cbc-4e3e-4104-a855-9e27efa13d6b	t	${role_view-identity-providers}	view-identity-providers	ed653c96-d204-406a-87eb-480232fd55a1	1db87cbc-4e3e-4104-a855-9e27efa13d6b	\N
b6367c05-15ff-4014-97cf-dc1bbb2ff83f	1db87cbc-4e3e-4104-a855-9e27efa13d6b	t	${role_view-authorization}	view-authorization	ed653c96-d204-406a-87eb-480232fd55a1	1db87cbc-4e3e-4104-a855-9e27efa13d6b	\N
4fd73ff3-40dc-4eaf-94a4-d6cad0197e77	1db87cbc-4e3e-4104-a855-9e27efa13d6b	t	${role_manage-realm}	manage-realm	ed653c96-d204-406a-87eb-480232fd55a1	1db87cbc-4e3e-4104-a855-9e27efa13d6b	\N
1815faf1-d688-4c4d-b730-f0c99d63928a	1db87cbc-4e3e-4104-a855-9e27efa13d6b	t	${role_manage-users}	manage-users	ed653c96-d204-406a-87eb-480232fd55a1	1db87cbc-4e3e-4104-a855-9e27efa13d6b	\N
80b0e4af-7013-4077-af8c-9d4178a4fdae	1db87cbc-4e3e-4104-a855-9e27efa13d6b	t	${role_manage-clients}	manage-clients	ed653c96-d204-406a-87eb-480232fd55a1	1db87cbc-4e3e-4104-a855-9e27efa13d6b	\N
28dc0eeb-8fa9-4342-9745-e502746c232b	1db87cbc-4e3e-4104-a855-9e27efa13d6b	t	${role_manage-events}	manage-events	ed653c96-d204-406a-87eb-480232fd55a1	1db87cbc-4e3e-4104-a855-9e27efa13d6b	\N
b40755cf-4210-4d66-94f4-9237ab4c8b45	1db87cbc-4e3e-4104-a855-9e27efa13d6b	t	${role_manage-identity-providers}	manage-identity-providers	ed653c96-d204-406a-87eb-480232fd55a1	1db87cbc-4e3e-4104-a855-9e27efa13d6b	\N
2bada08f-8bd6-4ad9-bd28-f6df13291c2d	1db87cbc-4e3e-4104-a855-9e27efa13d6b	t	${role_manage-authorization}	manage-authorization	ed653c96-d204-406a-87eb-480232fd55a1	1db87cbc-4e3e-4104-a855-9e27efa13d6b	\N
dcd8d251-878e-4e24-9bbd-a5d59845ae58	1db87cbc-4e3e-4104-a855-9e27efa13d6b	t	${role_query-users}	query-users	ed653c96-d204-406a-87eb-480232fd55a1	1db87cbc-4e3e-4104-a855-9e27efa13d6b	\N
efe166fd-e712-4ccd-b7d8-27dbdfa2678a	1db87cbc-4e3e-4104-a855-9e27efa13d6b	t	${role_query-clients}	query-clients	ed653c96-d204-406a-87eb-480232fd55a1	1db87cbc-4e3e-4104-a855-9e27efa13d6b	\N
6da7c2f5-9817-42b8-8ac5-bd981064f96f	1db87cbc-4e3e-4104-a855-9e27efa13d6b	t	${role_query-realms}	query-realms	ed653c96-d204-406a-87eb-480232fd55a1	1db87cbc-4e3e-4104-a855-9e27efa13d6b	\N
8469995b-ecb8-419a-9f71-0a951f441e05	1db87cbc-4e3e-4104-a855-9e27efa13d6b	t	${role_query-groups}	query-groups	ed653c96-d204-406a-87eb-480232fd55a1	1db87cbc-4e3e-4104-a855-9e27efa13d6b	\N
98e7cd5e-7894-4b36-ad10-928371abb0e8	8323aa5b-3489-4ab6-8c1e-c06c18a1b8e4	t	${role_realm-admin}	realm-admin	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	8323aa5b-3489-4ab6-8c1e-c06c18a1b8e4	\N
510c6978-9339-49a4-a302-cb2b41ba6a88	8323aa5b-3489-4ab6-8c1e-c06c18a1b8e4	t	${role_create-client}	create-client	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	8323aa5b-3489-4ab6-8c1e-c06c18a1b8e4	\N
965c300c-f088-4109-b34f-7a75bad832af	8323aa5b-3489-4ab6-8c1e-c06c18a1b8e4	t	${role_view-realm}	view-realm	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	8323aa5b-3489-4ab6-8c1e-c06c18a1b8e4	\N
b95a7dd7-5d29-4768-9bf1-d61cf3d944ec	8323aa5b-3489-4ab6-8c1e-c06c18a1b8e4	t	${role_view-users}	view-users	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	8323aa5b-3489-4ab6-8c1e-c06c18a1b8e4	\N
c082cc3c-d8a8-4c69-8160-54128332e162	8323aa5b-3489-4ab6-8c1e-c06c18a1b8e4	t	${role_view-clients}	view-clients	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	8323aa5b-3489-4ab6-8c1e-c06c18a1b8e4	\N
e213115b-368c-40f4-ae72-548005fc080d	8323aa5b-3489-4ab6-8c1e-c06c18a1b8e4	t	${role_view-events}	view-events	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	8323aa5b-3489-4ab6-8c1e-c06c18a1b8e4	\N
ed171b6a-94ce-4044-b687-fdb44b690600	8323aa5b-3489-4ab6-8c1e-c06c18a1b8e4	t	${role_view-identity-providers}	view-identity-providers	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	8323aa5b-3489-4ab6-8c1e-c06c18a1b8e4	\N
199a513d-ddd2-47ed-a16e-5b7736a13797	8323aa5b-3489-4ab6-8c1e-c06c18a1b8e4	t	${role_view-authorization}	view-authorization	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	8323aa5b-3489-4ab6-8c1e-c06c18a1b8e4	\N
f01ff1fc-4855-44a8-b7f8-c6732652ce02	8323aa5b-3489-4ab6-8c1e-c06c18a1b8e4	t	${role_manage-realm}	manage-realm	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	8323aa5b-3489-4ab6-8c1e-c06c18a1b8e4	\N
90bc5226-9465-421b-9072-125804287b59	8323aa5b-3489-4ab6-8c1e-c06c18a1b8e4	t	${role_manage-users}	manage-users	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	8323aa5b-3489-4ab6-8c1e-c06c18a1b8e4	\N
120020ef-d5bf-4d2e-b80f-7e3991737157	8323aa5b-3489-4ab6-8c1e-c06c18a1b8e4	t	${role_manage-clients}	manage-clients	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	8323aa5b-3489-4ab6-8c1e-c06c18a1b8e4	\N
2d04fe22-db8b-4766-9862-f9dcd2ab6d2c	8323aa5b-3489-4ab6-8c1e-c06c18a1b8e4	t	${role_manage-events}	manage-events	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	8323aa5b-3489-4ab6-8c1e-c06c18a1b8e4	\N
ec2816f5-4cac-415e-a996-c17029b5520e	8323aa5b-3489-4ab6-8c1e-c06c18a1b8e4	t	${role_manage-identity-providers}	manage-identity-providers	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	8323aa5b-3489-4ab6-8c1e-c06c18a1b8e4	\N
a86736f4-43d0-4119-b9b0-0b43c98aa7d8	8323aa5b-3489-4ab6-8c1e-c06c18a1b8e4	t	${role_manage-authorization}	manage-authorization	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	8323aa5b-3489-4ab6-8c1e-c06c18a1b8e4	\N
4ac0c61e-50be-4ca3-ada1-e75565e51001	8323aa5b-3489-4ab6-8c1e-c06c18a1b8e4	t	${role_query-users}	query-users	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	8323aa5b-3489-4ab6-8c1e-c06c18a1b8e4	\N
6fd91920-801f-4cc9-838b-4807a6980eba	8323aa5b-3489-4ab6-8c1e-c06c18a1b8e4	t	${role_query-clients}	query-clients	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	8323aa5b-3489-4ab6-8c1e-c06c18a1b8e4	\N
93202f3a-9e10-4af4-a3db-79f63bcedb05	8323aa5b-3489-4ab6-8c1e-c06c18a1b8e4	t	${role_query-realms}	query-realms	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	8323aa5b-3489-4ab6-8c1e-c06c18a1b8e4	\N
e1925ab9-ecfe-426a-8c42-066492063416	8323aa5b-3489-4ab6-8c1e-c06c18a1b8e4	t	${role_query-groups}	query-groups	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	8323aa5b-3489-4ab6-8c1e-c06c18a1b8e4	\N
a6eca10d-c76c-4a76-822f-400458d8482e	89d81758-e376-4a88-8c4f-04abd723cbd5	t	${role_view-profile}	view-profile	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	89d81758-e376-4a88-8c4f-04abd723cbd5	\N
e35d9f32-9cb8-4f3a-b104-49964a8b869d	89d81758-e376-4a88-8c4f-04abd723cbd5	t	${role_manage-account}	manage-account	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	89d81758-e376-4a88-8c4f-04abd723cbd5	\N
3451f405-dcdf-4c8a-9798-4bf23eec5b4e	89d81758-e376-4a88-8c4f-04abd723cbd5	t	${role_manage-account-links}	manage-account-links	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	89d81758-e376-4a88-8c4f-04abd723cbd5	\N
042015ad-d069-4e20-8d65-c47d49aa9530	89d81758-e376-4a88-8c4f-04abd723cbd5	t	${role_view-applications}	view-applications	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	89d81758-e376-4a88-8c4f-04abd723cbd5	\N
c51e067a-13cb-4334-992e-29ea327f2194	89d81758-e376-4a88-8c4f-04abd723cbd5	t	${role_view-consent}	view-consent	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	89d81758-e376-4a88-8c4f-04abd723cbd5	\N
a92010ea-0080-4537-9037-6e5f63bab924	89d81758-e376-4a88-8c4f-04abd723cbd5	t	${role_manage-consent}	manage-consent	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	89d81758-e376-4a88-8c4f-04abd723cbd5	\N
e9751a88-d5a6-411d-8b33-7cffb6445a2d	89d81758-e376-4a88-8c4f-04abd723cbd5	t	${role_view-groups}	view-groups	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	89d81758-e376-4a88-8c4f-04abd723cbd5	\N
1d903699-4b71-4f0e-a142-cc1aed6c68b8	89d81758-e376-4a88-8c4f-04abd723cbd5	t	${role_delete-account}	delete-account	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	89d81758-e376-4a88-8c4f-04abd723cbd5	\N
179f451a-2a52-44ae-81e3-6f5ddf20e5e0	1db87cbc-4e3e-4104-a855-9e27efa13d6b	t	${role_impersonation}	impersonation	ed653c96-d204-406a-87eb-480232fd55a1	1db87cbc-4e3e-4104-a855-9e27efa13d6b	\N
e842fb23-0225-4dd1-a805-45cd7b7b41d8	8323aa5b-3489-4ab6-8c1e-c06c18a1b8e4	t	${role_impersonation}	impersonation	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	8323aa5b-3489-4ab6-8c1e-c06c18a1b8e4	\N
7d57614b-59d6-4faf-ae37-765fe759327d	da029bff-f743-40f1-8b2e-07a068c91300	t	${role_read-token}	read-token	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	da029bff-f743-40f1-8b2e-07a068c91300	\N
53bf1da7-e54f-4c1b-be78-ee19fa699aaa	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	f	${role_offline-access}	offline_access	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	\N	\N
a02375ab-0b86-43ca-a028-5d0b334299f3	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	f	${role_uma_authorization}	uma_authorization	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	\N	\N
\.


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migration_model (id, version, update_time) FROM stdin;
uht9r	20.0.2	1673545275
\.


--
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh) FROM stdin;
\.


--
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.policy_config (policy_id, name, value) FROM stdin;
\.


--
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
12a1a008-66dc-4bba-b109-5f302d0b4ecf	audience resolve	openid-connect	oidc-audience-resolve-mapper	40769b04-17bb-4591-a58c-2c907a9ebdb5	\N
1bcaaf62-1ff7-4a40-8731-7a71df4e5539	locale	openid-connect	oidc-usermodel-attribute-mapper	1f7b7a6b-eff4-4444-b795-8aa2fd42d2bf	\N
9f3fbb7a-0529-416a-8ef7-e93348a66fcb	role list	saml	saml-role-list-mapper	\N	cff11f69-6ba2-4598-be0b-577271a3ca9c
7e793fbe-3acf-4caa-82d1-6017fd3bd260	full name	openid-connect	oidc-full-name-mapper	\N	7c95c951-40f9-460f-be3e-a3b415f7cc92
badc9a80-7285-47cb-95c8-6f78205bccd7	family name	openid-connect	oidc-usermodel-property-mapper	\N	7c95c951-40f9-460f-be3e-a3b415f7cc92
6109e43c-01bf-4875-99d6-ecf30f4dad6e	given name	openid-connect	oidc-usermodel-property-mapper	\N	7c95c951-40f9-460f-be3e-a3b415f7cc92
c3cc68c3-e106-4ac1-af53-0acb6a842f32	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	7c95c951-40f9-460f-be3e-a3b415f7cc92
3c19af97-c826-4475-9ef1-75249b33ea17	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	7c95c951-40f9-460f-be3e-a3b415f7cc92
cfe7e549-f246-4cfe-84dc-1949ca6579e4	username	openid-connect	oidc-usermodel-property-mapper	\N	7c95c951-40f9-460f-be3e-a3b415f7cc92
92c07db8-2e4b-4b56-a37a-a03c0402e57f	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	7c95c951-40f9-460f-be3e-a3b415f7cc92
bf932f7c-1834-4b80-b41d-f0022af662e5	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	7c95c951-40f9-460f-be3e-a3b415f7cc92
6573c2c6-5c42-4dbf-a747-271dfe958f5e	website	openid-connect	oidc-usermodel-attribute-mapper	\N	7c95c951-40f9-460f-be3e-a3b415f7cc92
e6ea4f8c-4de9-4842-96eb-df351130ab90	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	7c95c951-40f9-460f-be3e-a3b415f7cc92
e49a8e3d-a67c-4a51-8d38-d8f7f6f57e66	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	7c95c951-40f9-460f-be3e-a3b415f7cc92
1928ed46-f81a-4af1-94ef-4283621fa853	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	7c95c951-40f9-460f-be3e-a3b415f7cc92
dfc89d13-5166-4dcb-9505-08257556f668	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	7c95c951-40f9-460f-be3e-a3b415f7cc92
f4e41cbd-83a0-4a0c-9932-bcf55ed17c56	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	7c95c951-40f9-460f-be3e-a3b415f7cc92
5bb2757a-2456-4a9a-a578-44cb18080d25	email	openid-connect	oidc-usermodel-property-mapper	\N	6fda0bf2-5ee2-4680-ab70-bb913b4e71c9
4d1e71c3-3301-4e7d-82d0-fa215dd54a17	email verified	openid-connect	oidc-usermodel-property-mapper	\N	6fda0bf2-5ee2-4680-ab70-bb913b4e71c9
56b5d95e-10ff-4950-b136-0cb454be9430	address	openid-connect	oidc-address-mapper	\N	cb002b51-9594-47ce-a496-366f2096eb91
f1cf6ba4-70ed-4f41-9110-5e323f187329	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	974db0db-2c63-4552-80a8-5cff64bf494b
ef76a480-21f7-4419-88ca-8f6ee5b1fc4d	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	974db0db-2c63-4552-80a8-5cff64bf494b
c04df645-cf60-4735-8650-d7aa72379877	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	c7ce5ff3-bad4-44be-9aa1-d53defcce75d
29c17253-8af6-4b9e-afc4-2fa1b1666579	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	c7ce5ff3-bad4-44be-9aa1-d53defcce75d
7b27e060-aabe-4235-a402-4b0a43f7ccf3	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	c7ce5ff3-bad4-44be-9aa1-d53defcce75d
d74bd571-0740-4509-983c-86118094b040	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	e32ce8e7-7193-4a84-ab89-a810f01b7ee4
9d24b256-e71a-4f55-86bc-95d544bc79d5	upn	openid-connect	oidc-usermodel-property-mapper	\N	719ccaeb-d45e-48e6-8eb7-ef88e23cb716
a765e71b-245a-4918-aabe-efe2b7079a87	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	719ccaeb-d45e-48e6-8eb7-ef88e23cb716
cdc56294-0aae-4888-b0ec-f9a6c246101d	acr loa level	openid-connect	oidc-acr-mapper	\N	fc0ce346-d0af-4b0d-9c9d-ea3197c70395
73b1421d-f434-4e94-a4f0-1bd638adfc62	audience resolve	openid-connect	oidc-audience-resolve-mapper	3b8f664f-bcb6-4c46-88bf-5de4859f7df1	\N
3d94aaff-c0ed-4b3b-859d-672bfe74235c	role list	saml	saml-role-list-mapper	\N	d77f8f45-f174-4aed-89d9-6f9f3d90b27e
2b1d195f-5c01-49b7-853a-c5eb16d4659e	full name	openid-connect	oidc-full-name-mapper	\N	ea7594ed-2481-4575-bdb7-1f26fbf02d1b
d27a8de1-c658-4aa1-993a-f662ef14e1d9	family name	openid-connect	oidc-usermodel-property-mapper	\N	ea7594ed-2481-4575-bdb7-1f26fbf02d1b
dcce5cf0-f86b-4e2f-9e9d-913a8ad0b402	given name	openid-connect	oidc-usermodel-property-mapper	\N	ea7594ed-2481-4575-bdb7-1f26fbf02d1b
60c297ac-5655-4d7e-8006-79ee869b3790	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	ea7594ed-2481-4575-bdb7-1f26fbf02d1b
75406c9d-47f6-4c2b-bac0-017df43d1d31	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	ea7594ed-2481-4575-bdb7-1f26fbf02d1b
9b1f69ca-8dbb-410a-8096-db2e2a979f96	username	openid-connect	oidc-usermodel-property-mapper	\N	ea7594ed-2481-4575-bdb7-1f26fbf02d1b
43b5f4c8-9065-493e-a6c3-5fac8974fbd5	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	ea7594ed-2481-4575-bdb7-1f26fbf02d1b
187cfa96-ad5f-4402-beb0-16112e2942c0	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	ea7594ed-2481-4575-bdb7-1f26fbf02d1b
47753bda-b51f-4da8-8125-a7773a22180c	website	openid-connect	oidc-usermodel-attribute-mapper	\N	ea7594ed-2481-4575-bdb7-1f26fbf02d1b
fdabb172-2926-44a2-9d2c-831cf3896672	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	ea7594ed-2481-4575-bdb7-1f26fbf02d1b
5673bb4e-5e8b-4fc7-ae53-683732d80272	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	ea7594ed-2481-4575-bdb7-1f26fbf02d1b
a58eba29-be4c-4513-aea7-1982cd20bc5d	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	ea7594ed-2481-4575-bdb7-1f26fbf02d1b
e19bdad1-8224-4242-ada9-cfd325141785	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	ea7594ed-2481-4575-bdb7-1f26fbf02d1b
683a9646-f237-4295-bb94-e248a490eb91	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	ea7594ed-2481-4575-bdb7-1f26fbf02d1b
4b126374-72bc-477e-a85b-daf61a35b816	email	openid-connect	oidc-usermodel-property-mapper	\N	d42f7179-13dc-4a13-bdfe-a5e48566cf5b
04bfa2b4-a568-4616-b4e6-284153a32832	email verified	openid-connect	oidc-usermodel-property-mapper	\N	d42f7179-13dc-4a13-bdfe-a5e48566cf5b
b3b946e6-bfb6-41e0-be78-c521b03073e4	address	openid-connect	oidc-address-mapper	\N	6d8af9a6-9705-45ba-97ab-8b184758b103
29cd7086-58ff-4a28-bcae-76002ab1aee9	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	63224374-feb6-49f6-9f08-6c850caf7d93
cbeaee8e-be12-4736-9089-d17462ae7197	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	63224374-feb6-49f6-9f08-6c850caf7d93
48097ceb-fc1e-483a-bb58-ad2f423c6bc5	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	b40a4c98-cb8f-4cad-a98b-18e4f3403ced
8cc309c9-fbfc-4cfd-b00d-19369299120d	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	b40a4c98-cb8f-4cad-a98b-18e4f3403ced
ad1ca5f1-acfd-4b2c-9682-614ca02d1b1e	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	b40a4c98-cb8f-4cad-a98b-18e4f3403ced
a1c9688a-dec5-4097-8909-cb29ba3bbccb	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	5cf75d32-57d9-4e62-8f11-2f7cfaae88c4
fb64fa50-bd8b-469d-9c36-1820109a080f	upn	openid-connect	oidc-usermodel-property-mapper	\N	5baab7b4-ec68-4ee1-bf09-37378bf16f21
e447faf2-20b9-45c5-9698-a53ac0fe071f	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	5baab7b4-ec68-4ee1-bf09-37378bf16f21
e17e9ae2-82eb-4f5f-b160-e2233e130666	acr loa level	openid-connect	oidc-acr-mapper	\N	7d1cfd7d-fd70-4c17-8e7a-91b3e8d06f82
b6fa53d7-c44b-4eae-b44c-0a0ecc26bc01	locale	openid-connect	oidc-usermodel-attribute-mapper	2336441a-166e-49b5-baaf-c3cf0fc1d28c	\N
\.


--
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
1bcaaf62-1ff7-4a40-8731-7a71df4e5539	true	userinfo.token.claim
1bcaaf62-1ff7-4a40-8731-7a71df4e5539	locale	user.attribute
1bcaaf62-1ff7-4a40-8731-7a71df4e5539	true	id.token.claim
1bcaaf62-1ff7-4a40-8731-7a71df4e5539	true	access.token.claim
1bcaaf62-1ff7-4a40-8731-7a71df4e5539	locale	claim.name
1bcaaf62-1ff7-4a40-8731-7a71df4e5539	String	jsonType.label
9f3fbb7a-0529-416a-8ef7-e93348a66fcb	false	single
9f3fbb7a-0529-416a-8ef7-e93348a66fcb	Basic	attribute.nameformat
9f3fbb7a-0529-416a-8ef7-e93348a66fcb	Role	attribute.name
1928ed46-f81a-4af1-94ef-4283621fa853	true	userinfo.token.claim
1928ed46-f81a-4af1-94ef-4283621fa853	zoneinfo	user.attribute
1928ed46-f81a-4af1-94ef-4283621fa853	true	id.token.claim
1928ed46-f81a-4af1-94ef-4283621fa853	true	access.token.claim
1928ed46-f81a-4af1-94ef-4283621fa853	zoneinfo	claim.name
1928ed46-f81a-4af1-94ef-4283621fa853	String	jsonType.label
3c19af97-c826-4475-9ef1-75249b33ea17	true	userinfo.token.claim
3c19af97-c826-4475-9ef1-75249b33ea17	nickname	user.attribute
3c19af97-c826-4475-9ef1-75249b33ea17	true	id.token.claim
3c19af97-c826-4475-9ef1-75249b33ea17	true	access.token.claim
3c19af97-c826-4475-9ef1-75249b33ea17	nickname	claim.name
3c19af97-c826-4475-9ef1-75249b33ea17	String	jsonType.label
6109e43c-01bf-4875-99d6-ecf30f4dad6e	true	userinfo.token.claim
6109e43c-01bf-4875-99d6-ecf30f4dad6e	firstName	user.attribute
6109e43c-01bf-4875-99d6-ecf30f4dad6e	true	id.token.claim
6109e43c-01bf-4875-99d6-ecf30f4dad6e	true	access.token.claim
6109e43c-01bf-4875-99d6-ecf30f4dad6e	given_name	claim.name
6109e43c-01bf-4875-99d6-ecf30f4dad6e	String	jsonType.label
6573c2c6-5c42-4dbf-a747-271dfe958f5e	true	userinfo.token.claim
6573c2c6-5c42-4dbf-a747-271dfe958f5e	website	user.attribute
6573c2c6-5c42-4dbf-a747-271dfe958f5e	true	id.token.claim
6573c2c6-5c42-4dbf-a747-271dfe958f5e	true	access.token.claim
6573c2c6-5c42-4dbf-a747-271dfe958f5e	website	claim.name
6573c2c6-5c42-4dbf-a747-271dfe958f5e	String	jsonType.label
7e793fbe-3acf-4caa-82d1-6017fd3bd260	true	userinfo.token.claim
7e793fbe-3acf-4caa-82d1-6017fd3bd260	true	id.token.claim
7e793fbe-3acf-4caa-82d1-6017fd3bd260	true	access.token.claim
92c07db8-2e4b-4b56-a37a-a03c0402e57f	true	userinfo.token.claim
92c07db8-2e4b-4b56-a37a-a03c0402e57f	profile	user.attribute
92c07db8-2e4b-4b56-a37a-a03c0402e57f	true	id.token.claim
92c07db8-2e4b-4b56-a37a-a03c0402e57f	true	access.token.claim
92c07db8-2e4b-4b56-a37a-a03c0402e57f	profile	claim.name
92c07db8-2e4b-4b56-a37a-a03c0402e57f	String	jsonType.label
badc9a80-7285-47cb-95c8-6f78205bccd7	true	userinfo.token.claim
badc9a80-7285-47cb-95c8-6f78205bccd7	lastName	user.attribute
badc9a80-7285-47cb-95c8-6f78205bccd7	true	id.token.claim
badc9a80-7285-47cb-95c8-6f78205bccd7	true	access.token.claim
badc9a80-7285-47cb-95c8-6f78205bccd7	family_name	claim.name
badc9a80-7285-47cb-95c8-6f78205bccd7	String	jsonType.label
bf932f7c-1834-4b80-b41d-f0022af662e5	true	userinfo.token.claim
bf932f7c-1834-4b80-b41d-f0022af662e5	picture	user.attribute
bf932f7c-1834-4b80-b41d-f0022af662e5	true	id.token.claim
bf932f7c-1834-4b80-b41d-f0022af662e5	true	access.token.claim
bf932f7c-1834-4b80-b41d-f0022af662e5	picture	claim.name
bf932f7c-1834-4b80-b41d-f0022af662e5	String	jsonType.label
c3cc68c3-e106-4ac1-af53-0acb6a842f32	true	userinfo.token.claim
c3cc68c3-e106-4ac1-af53-0acb6a842f32	middleName	user.attribute
c3cc68c3-e106-4ac1-af53-0acb6a842f32	true	id.token.claim
c3cc68c3-e106-4ac1-af53-0acb6a842f32	true	access.token.claim
c3cc68c3-e106-4ac1-af53-0acb6a842f32	middle_name	claim.name
c3cc68c3-e106-4ac1-af53-0acb6a842f32	String	jsonType.label
cfe7e549-f246-4cfe-84dc-1949ca6579e4	true	userinfo.token.claim
cfe7e549-f246-4cfe-84dc-1949ca6579e4	username	user.attribute
cfe7e549-f246-4cfe-84dc-1949ca6579e4	true	id.token.claim
cfe7e549-f246-4cfe-84dc-1949ca6579e4	true	access.token.claim
cfe7e549-f246-4cfe-84dc-1949ca6579e4	preferred_username	claim.name
cfe7e549-f246-4cfe-84dc-1949ca6579e4	String	jsonType.label
dfc89d13-5166-4dcb-9505-08257556f668	true	userinfo.token.claim
dfc89d13-5166-4dcb-9505-08257556f668	locale	user.attribute
dfc89d13-5166-4dcb-9505-08257556f668	true	id.token.claim
dfc89d13-5166-4dcb-9505-08257556f668	true	access.token.claim
dfc89d13-5166-4dcb-9505-08257556f668	locale	claim.name
dfc89d13-5166-4dcb-9505-08257556f668	String	jsonType.label
e49a8e3d-a67c-4a51-8d38-d8f7f6f57e66	true	userinfo.token.claim
e49a8e3d-a67c-4a51-8d38-d8f7f6f57e66	birthdate	user.attribute
e49a8e3d-a67c-4a51-8d38-d8f7f6f57e66	true	id.token.claim
e49a8e3d-a67c-4a51-8d38-d8f7f6f57e66	true	access.token.claim
e49a8e3d-a67c-4a51-8d38-d8f7f6f57e66	birthdate	claim.name
e49a8e3d-a67c-4a51-8d38-d8f7f6f57e66	String	jsonType.label
e6ea4f8c-4de9-4842-96eb-df351130ab90	true	userinfo.token.claim
e6ea4f8c-4de9-4842-96eb-df351130ab90	gender	user.attribute
e6ea4f8c-4de9-4842-96eb-df351130ab90	true	id.token.claim
e6ea4f8c-4de9-4842-96eb-df351130ab90	true	access.token.claim
e6ea4f8c-4de9-4842-96eb-df351130ab90	gender	claim.name
e6ea4f8c-4de9-4842-96eb-df351130ab90	String	jsonType.label
f4e41cbd-83a0-4a0c-9932-bcf55ed17c56	true	userinfo.token.claim
f4e41cbd-83a0-4a0c-9932-bcf55ed17c56	updatedAt	user.attribute
f4e41cbd-83a0-4a0c-9932-bcf55ed17c56	true	id.token.claim
f4e41cbd-83a0-4a0c-9932-bcf55ed17c56	true	access.token.claim
f4e41cbd-83a0-4a0c-9932-bcf55ed17c56	updated_at	claim.name
f4e41cbd-83a0-4a0c-9932-bcf55ed17c56	long	jsonType.label
4d1e71c3-3301-4e7d-82d0-fa215dd54a17	true	userinfo.token.claim
4d1e71c3-3301-4e7d-82d0-fa215dd54a17	emailVerified	user.attribute
4d1e71c3-3301-4e7d-82d0-fa215dd54a17	true	id.token.claim
4d1e71c3-3301-4e7d-82d0-fa215dd54a17	true	access.token.claim
4d1e71c3-3301-4e7d-82d0-fa215dd54a17	email_verified	claim.name
4d1e71c3-3301-4e7d-82d0-fa215dd54a17	boolean	jsonType.label
5bb2757a-2456-4a9a-a578-44cb18080d25	true	userinfo.token.claim
5bb2757a-2456-4a9a-a578-44cb18080d25	email	user.attribute
5bb2757a-2456-4a9a-a578-44cb18080d25	true	id.token.claim
5bb2757a-2456-4a9a-a578-44cb18080d25	true	access.token.claim
5bb2757a-2456-4a9a-a578-44cb18080d25	email	claim.name
5bb2757a-2456-4a9a-a578-44cb18080d25	String	jsonType.label
56b5d95e-10ff-4950-b136-0cb454be9430	formatted	user.attribute.formatted
56b5d95e-10ff-4950-b136-0cb454be9430	country	user.attribute.country
56b5d95e-10ff-4950-b136-0cb454be9430	postal_code	user.attribute.postal_code
56b5d95e-10ff-4950-b136-0cb454be9430	true	userinfo.token.claim
56b5d95e-10ff-4950-b136-0cb454be9430	street	user.attribute.street
56b5d95e-10ff-4950-b136-0cb454be9430	true	id.token.claim
56b5d95e-10ff-4950-b136-0cb454be9430	region	user.attribute.region
56b5d95e-10ff-4950-b136-0cb454be9430	true	access.token.claim
56b5d95e-10ff-4950-b136-0cb454be9430	locality	user.attribute.locality
ef76a480-21f7-4419-88ca-8f6ee5b1fc4d	true	userinfo.token.claim
ef76a480-21f7-4419-88ca-8f6ee5b1fc4d	phoneNumberVerified	user.attribute
ef76a480-21f7-4419-88ca-8f6ee5b1fc4d	true	id.token.claim
ef76a480-21f7-4419-88ca-8f6ee5b1fc4d	true	access.token.claim
ef76a480-21f7-4419-88ca-8f6ee5b1fc4d	phone_number_verified	claim.name
ef76a480-21f7-4419-88ca-8f6ee5b1fc4d	boolean	jsonType.label
f1cf6ba4-70ed-4f41-9110-5e323f187329	true	userinfo.token.claim
f1cf6ba4-70ed-4f41-9110-5e323f187329	phoneNumber	user.attribute
f1cf6ba4-70ed-4f41-9110-5e323f187329	true	id.token.claim
f1cf6ba4-70ed-4f41-9110-5e323f187329	true	access.token.claim
f1cf6ba4-70ed-4f41-9110-5e323f187329	phone_number	claim.name
f1cf6ba4-70ed-4f41-9110-5e323f187329	String	jsonType.label
29c17253-8af6-4b9e-afc4-2fa1b1666579	true	multivalued
29c17253-8af6-4b9e-afc4-2fa1b1666579	foo	user.attribute
29c17253-8af6-4b9e-afc4-2fa1b1666579	true	access.token.claim
29c17253-8af6-4b9e-afc4-2fa1b1666579	resource_access.${client_id}.roles	claim.name
29c17253-8af6-4b9e-afc4-2fa1b1666579	String	jsonType.label
c04df645-cf60-4735-8650-d7aa72379877	true	multivalued
c04df645-cf60-4735-8650-d7aa72379877	foo	user.attribute
c04df645-cf60-4735-8650-d7aa72379877	true	access.token.claim
c04df645-cf60-4735-8650-d7aa72379877	realm_access.roles	claim.name
c04df645-cf60-4735-8650-d7aa72379877	String	jsonType.label
9d24b256-e71a-4f55-86bc-95d544bc79d5	true	userinfo.token.claim
9d24b256-e71a-4f55-86bc-95d544bc79d5	username	user.attribute
9d24b256-e71a-4f55-86bc-95d544bc79d5	true	id.token.claim
9d24b256-e71a-4f55-86bc-95d544bc79d5	true	access.token.claim
9d24b256-e71a-4f55-86bc-95d544bc79d5	upn	claim.name
9d24b256-e71a-4f55-86bc-95d544bc79d5	String	jsonType.label
a765e71b-245a-4918-aabe-efe2b7079a87	true	multivalued
a765e71b-245a-4918-aabe-efe2b7079a87	foo	user.attribute
a765e71b-245a-4918-aabe-efe2b7079a87	true	id.token.claim
a765e71b-245a-4918-aabe-efe2b7079a87	true	access.token.claim
a765e71b-245a-4918-aabe-efe2b7079a87	groups	claim.name
a765e71b-245a-4918-aabe-efe2b7079a87	String	jsonType.label
cdc56294-0aae-4888-b0ec-f9a6c246101d	true	id.token.claim
cdc56294-0aae-4888-b0ec-f9a6c246101d	true	access.token.claim
3d94aaff-c0ed-4b3b-859d-672bfe74235c	false	single
3d94aaff-c0ed-4b3b-859d-672bfe74235c	Basic	attribute.nameformat
3d94aaff-c0ed-4b3b-859d-672bfe74235c	Role	attribute.name
187cfa96-ad5f-4402-beb0-16112e2942c0	true	userinfo.token.claim
187cfa96-ad5f-4402-beb0-16112e2942c0	picture	user.attribute
187cfa96-ad5f-4402-beb0-16112e2942c0	true	id.token.claim
187cfa96-ad5f-4402-beb0-16112e2942c0	true	access.token.claim
187cfa96-ad5f-4402-beb0-16112e2942c0	picture	claim.name
187cfa96-ad5f-4402-beb0-16112e2942c0	String	jsonType.label
2b1d195f-5c01-49b7-853a-c5eb16d4659e	true	userinfo.token.claim
2b1d195f-5c01-49b7-853a-c5eb16d4659e	true	id.token.claim
2b1d195f-5c01-49b7-853a-c5eb16d4659e	true	access.token.claim
43b5f4c8-9065-493e-a6c3-5fac8974fbd5	true	userinfo.token.claim
43b5f4c8-9065-493e-a6c3-5fac8974fbd5	profile	user.attribute
43b5f4c8-9065-493e-a6c3-5fac8974fbd5	true	id.token.claim
43b5f4c8-9065-493e-a6c3-5fac8974fbd5	true	access.token.claim
43b5f4c8-9065-493e-a6c3-5fac8974fbd5	profile	claim.name
43b5f4c8-9065-493e-a6c3-5fac8974fbd5	String	jsonType.label
47753bda-b51f-4da8-8125-a7773a22180c	true	userinfo.token.claim
47753bda-b51f-4da8-8125-a7773a22180c	website	user.attribute
47753bda-b51f-4da8-8125-a7773a22180c	true	id.token.claim
47753bda-b51f-4da8-8125-a7773a22180c	true	access.token.claim
47753bda-b51f-4da8-8125-a7773a22180c	website	claim.name
47753bda-b51f-4da8-8125-a7773a22180c	String	jsonType.label
5673bb4e-5e8b-4fc7-ae53-683732d80272	true	userinfo.token.claim
5673bb4e-5e8b-4fc7-ae53-683732d80272	birthdate	user.attribute
5673bb4e-5e8b-4fc7-ae53-683732d80272	true	id.token.claim
5673bb4e-5e8b-4fc7-ae53-683732d80272	true	access.token.claim
5673bb4e-5e8b-4fc7-ae53-683732d80272	birthdate	claim.name
5673bb4e-5e8b-4fc7-ae53-683732d80272	String	jsonType.label
60c297ac-5655-4d7e-8006-79ee869b3790	true	userinfo.token.claim
60c297ac-5655-4d7e-8006-79ee869b3790	middleName	user.attribute
60c297ac-5655-4d7e-8006-79ee869b3790	true	id.token.claim
60c297ac-5655-4d7e-8006-79ee869b3790	true	access.token.claim
60c297ac-5655-4d7e-8006-79ee869b3790	middle_name	claim.name
60c297ac-5655-4d7e-8006-79ee869b3790	String	jsonType.label
683a9646-f237-4295-bb94-e248a490eb91	true	userinfo.token.claim
683a9646-f237-4295-bb94-e248a490eb91	updatedAt	user.attribute
683a9646-f237-4295-bb94-e248a490eb91	true	id.token.claim
683a9646-f237-4295-bb94-e248a490eb91	true	access.token.claim
683a9646-f237-4295-bb94-e248a490eb91	updated_at	claim.name
683a9646-f237-4295-bb94-e248a490eb91	long	jsonType.label
75406c9d-47f6-4c2b-bac0-017df43d1d31	true	userinfo.token.claim
75406c9d-47f6-4c2b-bac0-017df43d1d31	nickname	user.attribute
75406c9d-47f6-4c2b-bac0-017df43d1d31	true	id.token.claim
75406c9d-47f6-4c2b-bac0-017df43d1d31	true	access.token.claim
75406c9d-47f6-4c2b-bac0-017df43d1d31	nickname	claim.name
75406c9d-47f6-4c2b-bac0-017df43d1d31	String	jsonType.label
9b1f69ca-8dbb-410a-8096-db2e2a979f96	true	userinfo.token.claim
9b1f69ca-8dbb-410a-8096-db2e2a979f96	username	user.attribute
9b1f69ca-8dbb-410a-8096-db2e2a979f96	true	id.token.claim
9b1f69ca-8dbb-410a-8096-db2e2a979f96	true	access.token.claim
9b1f69ca-8dbb-410a-8096-db2e2a979f96	preferred_username	claim.name
9b1f69ca-8dbb-410a-8096-db2e2a979f96	String	jsonType.label
a58eba29-be4c-4513-aea7-1982cd20bc5d	true	userinfo.token.claim
a58eba29-be4c-4513-aea7-1982cd20bc5d	zoneinfo	user.attribute
a58eba29-be4c-4513-aea7-1982cd20bc5d	true	id.token.claim
a58eba29-be4c-4513-aea7-1982cd20bc5d	true	access.token.claim
a58eba29-be4c-4513-aea7-1982cd20bc5d	zoneinfo	claim.name
a58eba29-be4c-4513-aea7-1982cd20bc5d	String	jsonType.label
d27a8de1-c658-4aa1-993a-f662ef14e1d9	true	userinfo.token.claim
d27a8de1-c658-4aa1-993a-f662ef14e1d9	lastName	user.attribute
d27a8de1-c658-4aa1-993a-f662ef14e1d9	true	id.token.claim
d27a8de1-c658-4aa1-993a-f662ef14e1d9	true	access.token.claim
d27a8de1-c658-4aa1-993a-f662ef14e1d9	family_name	claim.name
d27a8de1-c658-4aa1-993a-f662ef14e1d9	String	jsonType.label
dcce5cf0-f86b-4e2f-9e9d-913a8ad0b402	true	userinfo.token.claim
dcce5cf0-f86b-4e2f-9e9d-913a8ad0b402	firstName	user.attribute
dcce5cf0-f86b-4e2f-9e9d-913a8ad0b402	true	id.token.claim
dcce5cf0-f86b-4e2f-9e9d-913a8ad0b402	true	access.token.claim
dcce5cf0-f86b-4e2f-9e9d-913a8ad0b402	given_name	claim.name
dcce5cf0-f86b-4e2f-9e9d-913a8ad0b402	String	jsonType.label
e19bdad1-8224-4242-ada9-cfd325141785	true	userinfo.token.claim
e19bdad1-8224-4242-ada9-cfd325141785	locale	user.attribute
e19bdad1-8224-4242-ada9-cfd325141785	true	id.token.claim
e19bdad1-8224-4242-ada9-cfd325141785	true	access.token.claim
e19bdad1-8224-4242-ada9-cfd325141785	locale	claim.name
e19bdad1-8224-4242-ada9-cfd325141785	String	jsonType.label
fdabb172-2926-44a2-9d2c-831cf3896672	true	userinfo.token.claim
fdabb172-2926-44a2-9d2c-831cf3896672	gender	user.attribute
fdabb172-2926-44a2-9d2c-831cf3896672	true	id.token.claim
fdabb172-2926-44a2-9d2c-831cf3896672	true	access.token.claim
fdabb172-2926-44a2-9d2c-831cf3896672	gender	claim.name
fdabb172-2926-44a2-9d2c-831cf3896672	String	jsonType.label
04bfa2b4-a568-4616-b4e6-284153a32832	true	userinfo.token.claim
04bfa2b4-a568-4616-b4e6-284153a32832	emailVerified	user.attribute
04bfa2b4-a568-4616-b4e6-284153a32832	true	id.token.claim
04bfa2b4-a568-4616-b4e6-284153a32832	true	access.token.claim
04bfa2b4-a568-4616-b4e6-284153a32832	email_verified	claim.name
04bfa2b4-a568-4616-b4e6-284153a32832	boolean	jsonType.label
4b126374-72bc-477e-a85b-daf61a35b816	true	userinfo.token.claim
4b126374-72bc-477e-a85b-daf61a35b816	email	user.attribute
4b126374-72bc-477e-a85b-daf61a35b816	true	id.token.claim
4b126374-72bc-477e-a85b-daf61a35b816	true	access.token.claim
4b126374-72bc-477e-a85b-daf61a35b816	email	claim.name
4b126374-72bc-477e-a85b-daf61a35b816	String	jsonType.label
b3b946e6-bfb6-41e0-be78-c521b03073e4	formatted	user.attribute.formatted
b3b946e6-bfb6-41e0-be78-c521b03073e4	country	user.attribute.country
b3b946e6-bfb6-41e0-be78-c521b03073e4	postal_code	user.attribute.postal_code
b3b946e6-bfb6-41e0-be78-c521b03073e4	true	userinfo.token.claim
b3b946e6-bfb6-41e0-be78-c521b03073e4	street	user.attribute.street
b3b946e6-bfb6-41e0-be78-c521b03073e4	true	id.token.claim
b3b946e6-bfb6-41e0-be78-c521b03073e4	region	user.attribute.region
b3b946e6-bfb6-41e0-be78-c521b03073e4	true	access.token.claim
b3b946e6-bfb6-41e0-be78-c521b03073e4	locality	user.attribute.locality
29cd7086-58ff-4a28-bcae-76002ab1aee9	true	userinfo.token.claim
29cd7086-58ff-4a28-bcae-76002ab1aee9	phoneNumber	user.attribute
29cd7086-58ff-4a28-bcae-76002ab1aee9	true	id.token.claim
29cd7086-58ff-4a28-bcae-76002ab1aee9	true	access.token.claim
29cd7086-58ff-4a28-bcae-76002ab1aee9	phone_number	claim.name
29cd7086-58ff-4a28-bcae-76002ab1aee9	String	jsonType.label
cbeaee8e-be12-4736-9089-d17462ae7197	true	userinfo.token.claim
cbeaee8e-be12-4736-9089-d17462ae7197	phoneNumberVerified	user.attribute
cbeaee8e-be12-4736-9089-d17462ae7197	true	id.token.claim
cbeaee8e-be12-4736-9089-d17462ae7197	true	access.token.claim
cbeaee8e-be12-4736-9089-d17462ae7197	phone_number_verified	claim.name
cbeaee8e-be12-4736-9089-d17462ae7197	boolean	jsonType.label
48097ceb-fc1e-483a-bb58-ad2f423c6bc5	true	multivalued
48097ceb-fc1e-483a-bb58-ad2f423c6bc5	foo	user.attribute
48097ceb-fc1e-483a-bb58-ad2f423c6bc5	true	access.token.claim
48097ceb-fc1e-483a-bb58-ad2f423c6bc5	realm_access.roles	claim.name
48097ceb-fc1e-483a-bb58-ad2f423c6bc5	String	jsonType.label
8cc309c9-fbfc-4cfd-b00d-19369299120d	true	multivalued
8cc309c9-fbfc-4cfd-b00d-19369299120d	foo	user.attribute
8cc309c9-fbfc-4cfd-b00d-19369299120d	true	access.token.claim
8cc309c9-fbfc-4cfd-b00d-19369299120d	resource_access.${client_id}.roles	claim.name
8cc309c9-fbfc-4cfd-b00d-19369299120d	String	jsonType.label
e447faf2-20b9-45c5-9698-a53ac0fe071f	true	multivalued
e447faf2-20b9-45c5-9698-a53ac0fe071f	foo	user.attribute
e447faf2-20b9-45c5-9698-a53ac0fe071f	true	id.token.claim
e447faf2-20b9-45c5-9698-a53ac0fe071f	true	access.token.claim
e447faf2-20b9-45c5-9698-a53ac0fe071f	groups	claim.name
e447faf2-20b9-45c5-9698-a53ac0fe071f	String	jsonType.label
fb64fa50-bd8b-469d-9c36-1820109a080f	true	userinfo.token.claim
fb64fa50-bd8b-469d-9c36-1820109a080f	username	user.attribute
fb64fa50-bd8b-469d-9c36-1820109a080f	true	id.token.claim
fb64fa50-bd8b-469d-9c36-1820109a080f	true	access.token.claim
fb64fa50-bd8b-469d-9c36-1820109a080f	upn	claim.name
fb64fa50-bd8b-469d-9c36-1820109a080f	String	jsonType.label
e17e9ae2-82eb-4f5f-b160-e2233e130666	true	id.token.claim
e17e9ae2-82eb-4f5f-b160-e2233e130666	true	access.token.claim
b6fa53d7-c44b-4eae-b44c-0a0ecc26bc01	true	userinfo.token.claim
b6fa53d7-c44b-4eae-b44c-0a0ecc26bc01	locale	user.attribute
b6fa53d7-c44b-4eae-b44c-0a0ecc26bc01	true	id.token.claim
b6fa53d7-c44b-4eae-b44c-0a0ecc26bc01	true	access.token.claim
b6fa53d7-c44b-4eae-b44c-0a0ecc26bc01	locale	claim.name
b6fa53d7-c44b-4eae-b44c-0a0ecc26bc01	String	jsonType.label
\.


--
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) FROM stdin;
ed653c96-d204-406a-87eb-480232fd55a1	60	300	60	\N	\N	\N	t	f	0	\N	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	cc69d4ac-613b-442f-9172-e9fbbe3713a6	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	60c2d667-3d9c-4263-ba9b-53424355f00d	aecab760-f9d1-47ea-af7f-e4f6c01069b3	dc694f88-b0f3-4ee0-ba16-af52d2f1f68d	812fb493-fa37-4b30-8935-8f24a5a8482f	227b05c7-af05-4e42-ae60-6384208e7e85	2592000	f	900	t	f	306fe7f5-29dd-4259-878a-826f70536be0	0	f	0	0	ae024e4f-1d3f-4176-aee0-c30ff292f424
2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	60	300	300	\N	\N	\N	t	f	0	\N	test	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	1db87cbc-4e3e-4104-a855-9e27efa13d6b	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	d2ae0d16-aac3-4e4f-b144-28de798165c1	f231fb4a-d0a6-4eb8-ab5a-0435d6f9928e	d283690f-4180-457d-a9eb-92348d3465f1	f8dc7cc4-8385-457c-8504-8b57ffa32862	5d5bb5b7-3ae4-47c9-ab91-bf88cda1235f	2592000	f	900	t	f	214f3452-01b4-4b9c-8116-cdd70f51a9a7	0	f	0	0	9cf2d423-80ec-40f4-892d-c4e90dd550ec
\.


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm_attribute (name, realm_id, value) FROM stdin;
_browser_header.contentSecurityPolicyReportOnly	ed653c96-d204-406a-87eb-480232fd55a1	
_browser_header.xContentTypeOptions	ed653c96-d204-406a-87eb-480232fd55a1	nosniff
_browser_header.xRobotsTag	ed653c96-d204-406a-87eb-480232fd55a1	none
_browser_header.xFrameOptions	ed653c96-d204-406a-87eb-480232fd55a1	SAMEORIGIN
_browser_header.contentSecurityPolicy	ed653c96-d204-406a-87eb-480232fd55a1	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	ed653c96-d204-406a-87eb-480232fd55a1	1; mode=block
_browser_header.strictTransportSecurity	ed653c96-d204-406a-87eb-480232fd55a1	max-age=31536000; includeSubDomains
bruteForceProtected	ed653c96-d204-406a-87eb-480232fd55a1	false
permanentLockout	ed653c96-d204-406a-87eb-480232fd55a1	false
maxFailureWaitSeconds	ed653c96-d204-406a-87eb-480232fd55a1	900
minimumQuickLoginWaitSeconds	ed653c96-d204-406a-87eb-480232fd55a1	60
waitIncrementSeconds	ed653c96-d204-406a-87eb-480232fd55a1	60
quickLoginCheckMilliSeconds	ed653c96-d204-406a-87eb-480232fd55a1	1000
maxDeltaTimeSeconds	ed653c96-d204-406a-87eb-480232fd55a1	43200
failureFactor	ed653c96-d204-406a-87eb-480232fd55a1	30
realmReusableOtpCode	ed653c96-d204-406a-87eb-480232fd55a1	false
displayName	ed653c96-d204-406a-87eb-480232fd55a1	Keycloak
displayNameHtml	ed653c96-d204-406a-87eb-480232fd55a1	<div class="kc-logo-text"><span>Keycloak</span></div>
defaultSignatureAlgorithm	ed653c96-d204-406a-87eb-480232fd55a1	RS256
offlineSessionMaxLifespanEnabled	ed653c96-d204-406a-87eb-480232fd55a1	false
offlineSessionMaxLifespan	ed653c96-d204-406a-87eb-480232fd55a1	5184000
_browser_header.contentSecurityPolicyReportOnly	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	
_browser_header.xContentTypeOptions	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	nosniff
_browser_header.xRobotsTag	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	none
_browser_header.xFrameOptions	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	SAMEORIGIN
_browser_header.contentSecurityPolicy	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	1; mode=block
_browser_header.strictTransportSecurity	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	max-age=31536000; includeSubDomains
bruteForceProtected	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	false
permanentLockout	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	false
maxFailureWaitSeconds	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	900
minimumQuickLoginWaitSeconds	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	60
waitIncrementSeconds	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	60
quickLoginCheckMilliSeconds	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	1000
maxDeltaTimeSeconds	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	43200
failureFactor	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	30
realmReusableOtpCode	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	false
defaultSignatureAlgorithm	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	RS256
offlineSessionMaxLifespanEnabled	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	false
offlineSessionMaxLifespan	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	5184000
actionTokenGeneratedByAdminLifespan	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	43200
actionTokenGeneratedByUserLifespan	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	300
oauth2DeviceCodeLifespan	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	600
oauth2DevicePollingInterval	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	5
webAuthnPolicyRpEntityName	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	keycloak
webAuthnPolicySignatureAlgorithms	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	ES256
webAuthnPolicyRpId	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	
webAuthnPolicyAttestationConveyancePreference	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	not specified
webAuthnPolicyAuthenticatorAttachment	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	not specified
webAuthnPolicyRequireResidentKey	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	not specified
webAuthnPolicyUserVerificationRequirement	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	not specified
webAuthnPolicyCreateTimeout	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	0
webAuthnPolicyAvoidSameAuthenticatorRegister	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	false
webAuthnPolicyRpEntityNamePasswordless	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	ES256
webAuthnPolicyRpIdPasswordless	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	
webAuthnPolicyAttestationConveyancePreferencePasswordless	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	not specified
webAuthnPolicyRequireResidentKeyPasswordless	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	not specified
webAuthnPolicyUserVerificationRequirementPasswordless	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	not specified
webAuthnPolicyCreateTimeoutPasswordless	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	false
cibaBackchannelTokenDeliveryMode	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	poll
cibaExpiresIn	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	120
cibaInterval	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	5
cibaAuthRequestedUserHint	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	login_hint
parRequestUriLifespan	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	60
\.


--
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm_default_groups (realm_id, group_id) FROM stdin;
\.


--
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm_enabled_event_types (realm_id, value) FROM stdin;
\.


--
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm_events_listeners (realm_id, value) FROM stdin;
ed653c96-d204-406a-87eb-480232fd55a1	jboss-logging
2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	jboss-logging
\.


--
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm_localizations (realm_id, locale, texts) FROM stdin;
\.


--
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
password	password	t	t	ed653c96-d204-406a-87eb-480232fd55a1
password	password	t	t	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b
\.


--
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm_smtp_config (realm_id, value, name) FROM stdin;
\.


--
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm_supported_locales (realm_id, value) FROM stdin;
\.


--
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.redirect_uris (client_id, value) FROM stdin;
2ee7c2bd-4595-4051-9d9d-d2ff38d48b77	/realms/master/account/*
40769b04-17bb-4591-a58c-2c907a9ebdb5	/realms/master/account/*
1f7b7a6b-eff4-4444-b795-8aa2fd42d2bf	/admin/master/console/*
89d81758-e376-4a88-8c4f-04abd723cbd5	/realms/test/account/*
3b8f664f-bcb6-4c46-88bf-5de4859f7df1	/realms/test/account/*
2336441a-166e-49b5-baaf-c3cf0fc1d28c	/admin/test/console/*
\.


--
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.required_action_config (required_action_id, value, name) FROM stdin;
\.


--
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
a83386e3-c419-44b7-b078-f31fd340f069	VERIFY_EMAIL	Verify Email	ed653c96-d204-406a-87eb-480232fd55a1	t	f	VERIFY_EMAIL	50
2f69bfd1-a370-4bb7-90b1-8ad88720fe11	UPDATE_PROFILE	Update Profile	ed653c96-d204-406a-87eb-480232fd55a1	t	f	UPDATE_PROFILE	40
42658adf-824a-4102-978b-05ac6bf62e08	CONFIGURE_TOTP	Configure OTP	ed653c96-d204-406a-87eb-480232fd55a1	t	f	CONFIGURE_TOTP	10
bd3809fc-887a-4626-b191-800ceb690335	UPDATE_PASSWORD	Update Password	ed653c96-d204-406a-87eb-480232fd55a1	t	f	UPDATE_PASSWORD	30
c37491a1-bc28-412a-84b3-9025e447c29c	terms_and_conditions	Terms and Conditions	ed653c96-d204-406a-87eb-480232fd55a1	f	f	terms_and_conditions	20
e325680f-ff6e-4904-aac1-5afb9b2784b3	delete_account	Delete Account	ed653c96-d204-406a-87eb-480232fd55a1	f	f	delete_account	60
d5184c4c-caac-4987-aa83-29e9eb875c41	update_user_locale	Update User Locale	ed653c96-d204-406a-87eb-480232fd55a1	t	f	update_user_locale	1000
a63fe076-e88e-491b-9ac0-a633ea15633a	webauthn-register	Webauthn Register	ed653c96-d204-406a-87eb-480232fd55a1	t	f	webauthn-register	70
6a333613-418e-4aba-bb15-15c72594ecd7	webauthn-register-passwordless	Webauthn Register Passwordless	ed653c96-d204-406a-87eb-480232fd55a1	t	f	webauthn-register-passwordless	80
78d42092-402d-4395-985d-6c6f30bfcb29	VERIFY_EMAIL	Verify Email	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	t	f	VERIFY_EMAIL	50
1f21e16d-e11b-4f81-8943-1d3e73e964c5	UPDATE_PROFILE	Update Profile	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	t	f	UPDATE_PROFILE	40
f2bc5e00-1f87-4337-be49-8c56082e0008	CONFIGURE_TOTP	Configure OTP	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	t	f	CONFIGURE_TOTP	10
afbbfa21-d63b-4683-bcc8-f5b49d785a51	UPDATE_PASSWORD	Update Password	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	t	f	UPDATE_PASSWORD	30
6d7af827-116c-4522-9f10-d19f81f5c534	terms_and_conditions	Terms and Conditions	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	f	f	terms_and_conditions	20
1cb4ca49-4a23-4e02-bd50-031f9ca9bd1d	delete_account	Delete Account	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	f	f	delete_account	60
c5de1c9d-d0af-4976-81c8-884218722c53	update_user_locale	Update User Locale	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	t	f	update_user_locale	1000
6eacdf15-7055-486f-ae17-2046ef73e24b	webauthn-register	Webauthn Register	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	t	f	webauthn-register	70
3705f250-0c42-4076-b68f-c57d58f569ba	webauthn-register-passwordless	Webauthn Register Passwordless	2db6bf44-3cc5-4ecb-8b7d-7ee84968975b	t	f	webauthn-register-passwordless	80
\.


--
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_attribute (id, name, value, resource_id) FROM stdin;
\.


--
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_policy (resource_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_scope (resource_id, scope_id) FROM stdin;
\.


--
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
\.


--
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
\.


--
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
\.


--
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
\.


--
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_uris (resource_id, value) FROM stdin;
\.


--
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role_attribute (id, role_id, name, value) FROM stdin;
\.


--
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scope_mapping (client_id, role_id) FROM stdin;
40769b04-17bb-4591-a58c-2c907a9ebdb5	de0f28a4-f1ad-48d8-89e4-c1e015b646b8
40769b04-17bb-4591-a58c-2c907a9ebdb5	6f02a589-3d96-44e7-a283-e5a6be00fe7b
3b8f664f-bcb6-4c46-88bf-5de4859f7df1	e9751a88-d5a6-411d-8b33-7cffb6445a2d
3b8f664f-bcb6-4c46-88bf-5de4859f7df1	e35d9f32-9cb8-4f3a-b104-49964a8b869d
\.


--
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scope_policy (scope_id, policy_id) FROM stdin;
\.


--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_attribute (name, value, user_id, id) FROM stdin;
\.


--
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
9627d75e-c84c-4a58-86d7-78dfe1cb7ad1	\N	d97f7ecb-8ecb-4e24-badd-9b7e43348d91	f	t	\N	\N	\N	ed653c96-d204-406a-87eb-480232fd55a1	admin	1673545276994	\N	0
\.


--
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
\.


--
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_group_membership (group_id, user_id) FROM stdin;
\.


--
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_required_action (user_id, required_action) FROM stdin;
\.


--
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_role_mapping (role_id, user_id) FROM stdin;
ae024e4f-1d3f-4176-aee0-c30ff292f424	9627d75e-c84c-4a58-86d7-78dfe1cb7ad1
d3f330d9-872a-43a1-ad1c-3d50c3e433bf	9627d75e-c84c-4a58-86d7-78dfe1cb7ad1
2b6fbf76-fb18-4a08-accf-c77a0d5daf78	9627d75e-c84c-4a58-86d7-78dfe1cb7ad1
80cb9f90-3858-46a1-a137-1412227ee775	9627d75e-c84c-4a58-86d7-78dfe1cb7ad1
3291817c-21dc-4627-ad73-4a568799fd55	9627d75e-c84c-4a58-86d7-78dfe1cb7ad1
126298f0-0927-4b5c-aaab-142f61b04f34	9627d75e-c84c-4a58-86d7-78dfe1cb7ad1
0f1f3303-5d7f-44c5-9f70-36e5c4de6b4c	9627d75e-c84c-4a58-86d7-78dfe1cb7ad1
c6477839-f980-467d-b912-86b245537188	9627d75e-c84c-4a58-86d7-78dfe1cb7ad1
b6367c05-15ff-4014-97cf-dc1bbb2ff83f	9627d75e-c84c-4a58-86d7-78dfe1cb7ad1
4fd73ff3-40dc-4eaf-94a4-d6cad0197e77	9627d75e-c84c-4a58-86d7-78dfe1cb7ad1
1815faf1-d688-4c4d-b730-f0c99d63928a	9627d75e-c84c-4a58-86d7-78dfe1cb7ad1
80b0e4af-7013-4077-af8c-9d4178a4fdae	9627d75e-c84c-4a58-86d7-78dfe1cb7ad1
28dc0eeb-8fa9-4342-9745-e502746c232b	9627d75e-c84c-4a58-86d7-78dfe1cb7ad1
b40755cf-4210-4d66-94f4-9237ab4c8b45	9627d75e-c84c-4a58-86d7-78dfe1cb7ad1
2bada08f-8bd6-4ad9-bd28-f6df13291c2d	9627d75e-c84c-4a58-86d7-78dfe1cb7ad1
dcd8d251-878e-4e24-9bbd-a5d59845ae58	9627d75e-c84c-4a58-86d7-78dfe1cb7ad1
efe166fd-e712-4ccd-b7d8-27dbdfa2678a	9627d75e-c84c-4a58-86d7-78dfe1cb7ad1
6da7c2f5-9817-42b8-8ac5-bd981064f96f	9627d75e-c84c-4a58-86d7-78dfe1cb7ad1
8469995b-ecb8-419a-9f71-0a951f441e05	9627d75e-c84c-4a58-86d7-78dfe1cb7ad1
\.


--
-- Data for Name: user_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_session (id, auth_method, ip_address, last_session_refresh, login_username, realm_id, remember_me, started, user_id, user_session_state, broker_session_id, broker_user_id) FROM stdin;
\.


--
-- Data for Name: user_session_note; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_session_note (user_session, name, value) FROM stdin;
\.


--
-- Data for Name: username_login_failure; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.username_login_failure (realm_id, username, failed_login_not_before, last_failure, last_ip_failure, num_failures) FROM stdin;
\.


--
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.web_origins (client_id, value) FROM stdin;
1f7b7a6b-eff4-4444-b795-8aa2fd42d2bf	+
2336441a-166e-49b5-baaf-c3cf0fc1d28c	+
\.


--
-- Name: username_login_failure CONSTRAINT_17-2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);


--
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- Name: client_user_session_note constr_cl_usr_ses_note; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT constr_cl_usr_ses_note PRIMARY KEY (client_session, name);


--
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- Name: client_session_role constraint_5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT constraint_5 PRIMARY KEY (client_session, role_id);


--
-- Name: user_session constraint_57; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_session
    ADD CONSTRAINT constraint_57 PRIMARY KEY (id);


--
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- Name: client_session_note constraint_5e; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT constraint_5e PRIMARY KEY (client_session, name);


--
-- Name: client constraint_7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- Name: client_session constraint_8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT constraint_8 PRIMARY KEY (id);


--
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- Name: client_session_auth_status constraint_auth_status_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT constraint_auth_status_pk PRIMARY KEY (client_session, authenticator);


--
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- Name: client_session_prot_mapper constraint_cs_pmp_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT constraint_cs_pmp_pk PRIMARY KEY (client_session, protocol_mapper_id);


--
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: user_session_note constraint_usn_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT constraint_usn_pk PRIMARY KEY (user_session, name);


--
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- Name: realm_localizations realm_localizations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);


--
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: user_consent uk_jkuwuvd56ontgsuhogm8uewrt; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt UNIQUE (client_id, client_storage_provider, external_client_id, user_id);


--
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- Name: idx_admin_event_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_admin_event_time ON public.admin_event_entity USING btree (realm_id, admin_event_time);


--
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);


--
-- Name: idx_auth_config_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);


--
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);


--
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);


--
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);


--
-- Name: idx_cl_clscope; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);


--
-- Name: idx_client_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_client_id ON public.client USING btree (client_id);


--
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);


--
-- Name: idx_client_session_session; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_client_session_session ON public.client_session USING btree (session_id);


--
-- Name: idx_clscope_attrs; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);


--
-- Name: idx_clscope_cl; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);


--
-- Name: idx_clscope_protmap; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);


--
-- Name: idx_clscope_role; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);


--
-- Name: idx_compo_config_compo; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);


--
-- Name: idx_component_provider_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);


--
-- Name: idx_component_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);


--
-- Name: idx_composite; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_composite ON public.composite_role USING btree (composite);


--
-- Name: idx_composite_child; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);


--
-- Name: idx_defcls_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);


--
-- Name: idx_defcls_scope; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);


--
-- Name: idx_event_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_event_time ON public.event_entity USING btree (realm_id, event_time);


--
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);


--
-- Name: idx_fedidentity_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);


--
-- Name: idx_fu_attribute; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- Name: idx_fu_consent; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);


--
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);


--
-- Name: idx_fu_credential; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);


--
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);


--
-- Name: idx_fu_group_membership; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);


--
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);


--
-- Name: idx_fu_required_action; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);


--
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);


--
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);


--
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- Name: idx_group_att_by_name_value; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_group_att_by_name_value ON public.group_attribute USING btree (name, ((value)::character varying(250)));


--
-- Name: idx_group_attr_group; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);


--
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);


--
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);


--
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);


--
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


--
-- Name: idx_offline_css_preload; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_offline_css_preload ON public.offline_client_session USING btree (client_id, offline_flag);


--
-- Name: idx_offline_uss_by_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_offline_uss_by_user ON public.offline_user_session USING btree (user_id, realm_id, offline_flag);


--
-- Name: idx_offline_uss_by_usersess; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_offline_uss_by_usersess ON public.offline_user_session USING btree (realm_id, offline_flag, user_session_id);


--
-- Name: idx_offline_uss_createdon; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_offline_uss_createdon ON public.offline_user_session USING btree (created_on);


--
-- Name: idx_offline_uss_preload; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_offline_uss_preload ON public.offline_user_session USING btree (offline_flag, created_on, user_session_id);


--
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);


--
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);


--
-- Name: idx_realm_clscope; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);


--
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);


--
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);


--
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);


--
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);


--
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);


--
-- Name: idx_redir_uri_client; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);


--
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);


--
-- Name: idx_res_policy_policy; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);


--
-- Name: idx_res_scope_scope; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);


--
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);


--
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);


--
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);


--
-- Name: idx_role_attribute; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);


--
-- Name: idx_role_clscope; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);


--
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);


--
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);


--
-- Name: idx_update_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);


--
-- Name: idx_us_sess_id_on_cl_sess; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_us_sess_id_on_cl_sess ON public.offline_client_session USING btree (user_session_id);


--
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);


--
-- Name: idx_user_attribute; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);


--
-- Name: idx_user_attribute_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_attribute_name ON public.user_attribute USING btree (name, value);


--
-- Name: idx_user_consent; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);


--
-- Name: idx_user_credential; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);


--
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_email ON public.user_entity USING btree (email);


--
-- Name: idx_user_group_mapping; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);


--
-- Name: idx_user_reqactions; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);


--
-- Name: idx_user_role_mapping; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);


--
-- Name: idx_user_service_account; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_service_account ON public.user_entity USING btree (realm_id, service_account_client_link);


--
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);


--
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);


--
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);


--
-- Name: idx_web_orig_client; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);


--
-- Name: client_session_auth_status auth_status_constraint; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT auth_status_constraint FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client_session_note fk5edfb00ff51c2736; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT fk5edfb00ff51c2736 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: user_session_note fk5edfb00ff51d3472; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT fk5edfb00ff51d3472 FOREIGN KEY (user_session) REFERENCES public.user_session(id);


--
-- Name: client_session_role fk_11b7sgqw18i532811v7o2dv76; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT fk_11b7sgqw18i532811v7o2dv76 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session_prot_mapper fk_33a8sgqw18i532811v7o2dk89; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT fk_33a8sgqw18i532811v7o2dk89 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);


--
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);


--
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);


--
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session fk_b4ao2vcvat6ukau74wbwtfqo1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1 FOREIGN KEY (session_id) REFERENCES public.user_session(id);


--
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_user_session_note fk_cl_usr_ses_note; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT fk_cl_usr_ses_note FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);


--
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);


--
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);


--
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);


--
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Debian 14.5-1.pgdg110+1)
-- Dumped by pg_dump version 14.5 (Debian 14.5-1.pgdg110+1)

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--


create database keycloak;
\c keycloak
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
create table meeting
(
    id                  varchar(255) not null
        constraint meeting_pkey
            primary key,
    deleted             boolean      not null,
    created_by          varchar(255),
    created_date        bigint       not null,
    last_modified_date  bigint       not null,
    updated_by          varchar(255),
    calendar_event_id   varchar(255),
    description         varchar(255),
    end_date            bigint       not null,
    event_id            varchar(255),
    meetingurl          varchar(255),
    organizer           varchar(255),
    provider_account    varchar(255),
    start_date          bigint       not null,
    title               varchar(255),
    meeting_provider_id varchar(255) not null
        constraint fkjkgxrtrc8rptecmwe6u8fb52x
            references meeting_provider
);

alter table meeting
    owner to postgres;

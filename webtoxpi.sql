--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.0
-- Dumped by pg_dump version 9.5.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: webtoxpi; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE webtoxpi WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';


ALTER DATABASE webtoxpi OWNER TO postgres;

\connect webtoxpi

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: chemicals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE chemicals (
    id character varying(5),
    sample character varying(10),
    category character varying(10),
    cas character varying(15),
    toxpibio character varying(10),
    toxpichemo character varying(10),
    toxpibiochemo character varying(10)
);


ALTER TABLE chemicals OWNER TO postgres;

--
-- Name: columnheaders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE columnheaders (
    id bigint NOT NULL,
    parent_id bigint,
    columntype_id bigint NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    notes character varying(255),
    color integer,
    registereddt timestamp without time zone NOT NULL
);


ALTER TABLE columnheaders OWNER TO postgres;

--
-- Name: columnheaders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE columnheaders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE columnheaders_id_seq OWNER TO postgres;

--
-- Name: columntypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE columntypes (
    id bigint NOT NULL,
    parent_id bigint,
    project_id bigint NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    notes character varying(255),
    registereddt timestamp without time zone NOT NULL
);


ALTER TABLE columntypes OWNER TO postgres;

--
-- Name: columntypes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE columntypes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE columntypes_id_seq OWNER TO postgres;

--
-- Name: columntypestempl; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE columntypestempl (
    id bigint NOT NULL,
    parent_id bigint,
    code character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    projecttype_id bigint NOT NULL
);


ALTER TABLE columntypestempl OWNER TO postgres;

--
-- Name: columntypestempl_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE columntypestempl_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE columntypestempl_id_seq OWNER TO postgres;

--
-- Name: components; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE components (
    id bigint NOT NULL,
    columnheader_id bigint,
    project_id bigint NOT NULL,
    unit bigint NOT NULL,
    updatedby bigint NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    notes character varying(255),
    color integer,
    updateddt timestamp without time zone NOT NULL
);


ALTER TABLE components OWNER TO postgres;

--
-- Name: components_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE components_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE components_id_seq OWNER TO postgres;

--
-- Name: fdc_pah; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE fdc_pah (
    category character varying(50),
    cas character varying(50),
    code character varying(50),
    tp_code character varying(50),
    batch character varying(50),
    method character varying(50),
    pah character varying(200),
    mg_kg character varying(50),
    remarks character varying(200),
    row_id integer NOT NULL
);


ALTER TABLE fdc_pah OWNER TO postgres;

--
-- Name: fdc_pah_row_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE fdc_pah_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fdc_pah_row_id_seq OWNER TO postgres;

--
-- Name: fdc_pah_row_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE fdc_pah_row_id_seq OWNED BY fdc_pah.row_id;


--
-- Name: file_tracking; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE file_tracking (
    row_id integer NOT NULL,
    project_id character varying(20),
    project_name character varying(200),
    file_name character varying(20),
    file_path character varying(200)
);


ALTER TABLE file_tracking OWNER TO postgres;

--
-- Name: file_tracking_row_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE file_tracking_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE file_tracking_row_id_seq OWNER TO postgres;

--
-- Name: file_tracking_row_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE file_tracking_row_id_seq OWNED BY file_tracking.row_id;


--
-- Name: fileupload; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE fileupload (
    entity_id integer NOT NULL,
    project_id integer NOT NULL,
    filename text NOT NULL,
    filelocation text NOT NULL,
    createdby integer NOT NULL,
    lastmodifiedby integer,
    registereddt timestamp without time zone,
    lastupdatedt timestamp without time zone
);


ALTER TABLE fileupload OWNER TO postgres;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hibernate_sequence OWNER TO postgres;

--
-- Name: id1_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id1_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE id1_seq OWNER TO postgres;

--
-- Name: id_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE id_seq1 OWNER TO postgres;

--
-- Name: importinfo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE importinfo (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    transactiondate timestamp without time zone NOT NULL,
    notes character varying(255) NOT NULL,
    file bytea NOT NULL,
    filename character varying(255) NOT NULL
);


ALTER TABLE importinfo OWNER TO postgres;

--
-- Name: importinfo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE importinfo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE importinfo_id_seq OWNER TO postgres;

--
-- Name: notes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE notes (
    id bigint NOT NULL,
    updatedby bigint NOT NULL,
    code character varying(255) NOT NULL,
    note character varying(255),
    owner_id integer NOT NULL,
    ownertype bytea NOT NULL,
    visible boolean NOT NULL,
    updateddt timestamp without time zone NOT NULL
);


ALTER TABLE notes OWNER TO postgres;

--
-- Name: notes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE notes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE notes_id_seq OWNER TO postgres;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE orders (
    id bigint NOT NULL,
    rowheader_id bigint,
    order_id bigint NOT NULL
);


ALTER TABLE orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE orders_id_seq OWNER TO postgres;

--
-- Name: ordersequence_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ordersequence_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ordersequence_id_seq OWNER TO postgres;

--
-- Name: proj_access; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE proj_access (
    row_id integer NOT NULL,
    project_id character varying(20),
    project_name character varying(200),
    user_name character varying(20),
    permission character varying(20)
);


ALTER TABLE proj_access OWNER TO postgres;

--
-- Name: proj_access_row_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE proj_access_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE proj_access_row_id_seq OWNER TO postgres;

--
-- Name: proj_access_row_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE proj_access_row_id_seq OWNED BY proj_access.row_id;


--
-- Name: projectaccess; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE projectaccess (
    id bigint DEFAULT nextval('id1_seq'::regclass) NOT NULL,
    project_id integer NOT NULL,
    user_id integer NOT NULL,
    read character(1) DEFAULT NULL::bpchar,
    write character(1) DEFAULT NULL::bpchar,
    is_active character(1) DEFAULT NULL::bpchar,
    createddt timestamp without time zone,
    lastupdateddat timestamp without time zone
);


ALTER TABLE projectaccess OWNER TO postgres;

--
-- Name: projectmanagers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE projectmanagers (
    project_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE projectmanagers OWNER TO postgres;

--
-- Name: projectmembers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE projectmembers (
    project_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE projectmembers OWNER TO postgres;

--
-- Name: projectreviewers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE projectreviewers (
    project_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE projectreviewers OWNER TO postgres;

--
-- Name: projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE projects (
    project_id bigint NOT NULL,
    projecttype bigint NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    access integer NOT NULL,
    status integer NOT NULL,
    notes character varying(255),
    starts timestamp without time zone,
    ends timestamp without time zone,
    registereddt timestamp without time zone DEFAULT ('now'::text)::date NOT NULL,
    lastupdatedt timestamp without time zone DEFAULT ('now'::text)::date NOT NULL,
    createdby bigint NOT NULL,
    lastmodifiedby bigint NOT NULL,
    version bigint NOT NULL,
    owner_id character varying(100),
    owner_login character varying(100)
);


ALTER TABLE projects OWNER TO postgres;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE projects_id_seq OWNER TO postgres;

--
-- Name: projecttypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE projecttypes (
    id bigint NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    notes character varying(255),
    registereddt timestamp without time zone NOT NULL,
    lastvisitdt timestamp without time zone NOT NULL
);


ALTER TABLE projecttypes OWNER TO postgres;

--
-- Name: projecttypes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE projecttypes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE projecttypes_id_seq OWNER TO postgres;

--
-- Name: projectusermapping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE projectusermapping (
    id integer NOT NULL,
    user_id integer NOT NULL,
    project_id integer NOT NULL,
    role integer NOT NULL,
    registereddt timestamp without time zone,
    lastvisitdt timestamp without time zone,
    is_active character(1) NOT NULL
);


ALTER TABLE projectusermapping OWNER TO postgres;

--
-- Name: results; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE results (
    id bigint NOT NULL,
    component_id bigint NOT NULL,
    project_id bigint NOT NULL,
    updatedby bigint NOT NULL,
    order_id bigint NOT NULL,
    strresult character varying(255),
    updateddt timestamp without time zone NOT NULL
);


ALTER TABLE results OWNER TO postgres;

--
-- Name: results_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE results_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE results_id_seq OWNER TO postgres;

--
-- Name: resultshistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE resultshistory (
    id bigint NOT NULL,
    results bigint NOT NULL,
    updatedby bigint NOT NULL,
    oldstrresult character varying(255),
    newstrresult character varying(255),
    updateddt timestamp without time zone NOT NULL
);


ALTER TABLE resultshistory OWNER TO postgres;

--
-- Name: resultshistory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE resultshistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE resultshistory_id_seq OWNER TO postgres;

--
-- Name: rowheaders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE rowheaders (
    id bigint NOT NULL,
    rowtype_id bigint NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    notes character varying(255),
    color integer,
    registereddt timestamp without time zone NOT NULL
);


ALTER TABLE rowheaders OWNER TO postgres;

--
-- Name: rowheaders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rowheaders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rowheaders_id_seq OWNER TO postgres;

--
-- Name: rowtypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE rowtypes (
    id bigint NOT NULL,
    project_id bigint NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    showorder integer,
    notes character varying(255),
    registereddt timestamp without time zone NOT NULL
);


ALTER TABLE rowtypes OWNER TO postgres;

--
-- Name: rowtypes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rowtypes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rowtypes_id_seq OWNER TO postgres;

--
-- Name: rowtypestempl; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE rowtypestempl (
    id bigint NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    showorder integer,
    projecttype_id bigint NOT NULL
);


ALTER TABLE rowtypestempl OWNER TO postgres;

--
-- Name: rowtypestempl_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rowtypestempl_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rowtypestempl_id_seq OWNER TO postgres;

--
-- Name: sample_inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE sample_inventory (
    sample_number character varying,
    cas character varying,
    ec_number character varying,
    substance_name character varying,
    category character varying,
    substance_description character varying,
    availability character varying,
    row_id integer NOT NULL
);


ALTER TABLE sample_inventory OWNER TO postgres;

--
-- Name: sample_inventory_row_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sample_inventory_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sample_inventory_row_id_seq OWNER TO postgres;

--
-- Name: sample_inventory_row_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE sample_inventory_row_id_seq OWNED BY sample_inventory.row_id;


--
-- Name: sequences; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE sequences (
    id bigint NOT NULL
);


ALTER TABLE sequences OWNER TO postgres;

--
-- Name: units; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE units (
    id bigint NOT NULL,
    parent_id bigint,
    updatedby bigint NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255),
    volumeof numeric(7,0),
    updateddt timestamp without time zone NOT NULL,
    relatedunit bigint
);


ALTER TABLE units OWNER TO postgres;

--
-- Name: units_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE units_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE units_id_seq OWNER TO postgres;

--
-- Name: userroles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE userroles (
    id bigint NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    notes character varying(255),
    registereddt timestamp without time zone NOT NULL,
    lastvisitdt timestamp without time zone NOT NULL
);


ALTER TABLE userroles OWNER TO postgres;

--
-- Name: userroles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE userroles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE userroles_id_seq OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users (
    user_id bigint NOT NULL,
    login character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    role integer NOT NULL,
    firstname character varying(255) NOT NULL,
    lastname character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    phone character varying(255) NOT NULL,
    address1 character varying(255) NOT NULL,
    address2 character varying(255),
    country character varying(255) NOT NULL,
    state character varying(255) NOT NULL,
    zip character varying(255) NOT NULL,
    city character varying(255) NOT NULL,
    sex character varying(255),
    website character varying(255),
    interests character varying(255),
    birthday timestamp without time zone,
    organization character varying(255),
    organaddress character varying(255),
    photo bytea,
    notes character varying(255),
    registereddt timestamp without time zone,
    lastvisitdt timestamp without time zone,
    approved character varying(20),
    admin character varying(20),
    folder_location character varying(200)
);


ALTER TABLE users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO postgres;

--
-- Name: row_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fdc_pah ALTER COLUMN row_id SET DEFAULT nextval('fdc_pah_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY file_tracking ALTER COLUMN row_id SET DEFAULT nextval('file_tracking_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proj_access ALTER COLUMN row_id SET DEFAULT nextval('proj_access_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sample_inventory ALTER COLUMN row_id SET DEFAULT nextval('sample_inventory_row_id_seq'::regclass);


--
-- Data for Name: chemicals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY chemicals (id, sample, category, cas, toxpibio, toxpichemo, toxpibiochemo) FROM stdin;
1	CON-01	SRGO	64741-43-1	9.0	9.0	2.8
2	CON-02	SRGO	68814-87-9	8.2	9.6	2.7
3	CON-03	SRGO	68814-87-9	5.9	10.1	2.1
4	CON-04	SRGO	68915-96-8	9.5	8.3	2.7
5	CON-05	SRGO	64741-43-1	7.9	8.6	2.4
6	CON-07	OGO	64742-46-7	4.1	11.1	1.8
7	CON-09	OGO	64742-80-9	5.6	10.5	2.0
8	CON-12	VHGO	64741-49-7	10.8	9.5	3.2
9	CON-13	VHGO	64741-58-8	11.5	7.8	3.0
10	CON-14	VHGO	64741-77-1	8.7	9.7	2.7
11	CON-15	VHGO	64742-87-6	9.9	9.6	3.1
12	CON-16i	VHGO	68334-30-5	8.8	12.7	2.9
13	CON-16ii	VHGO	68334-30-5	7.9	10.6	2.8
14	CON-17	VHGO	68476-30-2	6.3	11.3	2.5
15	CON-18	VHGO	68476-31-3	10.2	8.5	3.2
16	CON-20	VHGO	92045-24-4	10.5	8.1	2.8
17	CON-26	RAE	64742-10-5	1.2	4.3	0.4
18	CON-27	RAE	91995-70-9	2.7	4.4	0.7
19	A083/13	HFO	68476-33-5	6.6	-	1.3
20	A087/13	HFOe	68476-33-5	3.6	-	0.8
21	A092/13	HFOe	68476-33-5	5.4	-	1.2
\.


--
-- Data for Name: columnheaders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY columnheaders (id, parent_id, columntype_id, code, name, notes, color, registereddt) FROM stdin;
\.


--
-- Name: columnheaders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('columnheaders_id_seq', 1, false);


--
-- Data for Name: columntypes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY columntypes (id, parent_id, project_id, code, name, notes, registereddt) FROM stdin;
1	\N	1	WEIGHT	Weight	\N	2015-10-16 16:34:10.589
3	2	1	SOURCE	Source	\N	2015-10-16 16:34:10.589
4	1	1	GROUP	Group	\N	2015-10-16 16:34:10.589
2	4	1	TYPE	Type	\N	2015-10-16 16:34:10.589
6	5	2	SOURCE	Source	\N	2015-10-16 16:34:59.477
7	\N	2	WEIGHT	Weight	\N	2015-10-16 16:34:59.477
8	7	2	GROUP	Group	\N	2015-10-16 16:34:59.477
5	8	2	TYPE	Type	\N	2015-10-16 16:34:59.477
10	9	3	TYPE	Type	\N	2016-09-19 09:53:13.117
11	\N	3	WEIGHT	Weight	\N	2016-09-19 09:53:13.116
12	10	3	SOURCE	Source	\N	2016-09-19 09:53:13.117
9	11	3	GROUP	Group	\N	2016-09-19 09:53:13.117
13	\N	4	WEIGHT	Weight	\N	2016-09-19 10:01:35.929
14	13	4	GROUP	Group	\N	2016-09-19 10:01:35.929
16	14	4	TYPE	Type	\N	2016-09-19 10:01:35.929
15	16	4	SOURCE	Source	\N	2016-09-19 10:01:35.929
\.


--
-- Name: columntypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('columntypes_id_seq', 16, true);


--
-- Data for Name: columntypestempl; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY columntypestempl (id, parent_id, code, name, projecttype_id) FROM stdin;
1	\N	WEIGHT	Weight	1
2	1	GROUP	Group	1
3	2	TYPE	Type	1
4	3	SOURCE	Source	1
5	\N	WEIGHT	Weight	2
6	1	GROUP	Group	2
7	2	TYPE	Type	2
8	3	SOURCE	Source	2
\.


--
-- Name: columntypestempl_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('columntypestempl_id_seq', 8, true);


--
-- Data for Name: components; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY components (id, columnheader_id, project_id, unit, updatedby, code, name, notes, color, updateddt) FROM stdin;
\.


--
-- Name: components_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('components_id_seq', 1, false);


--
-- Data for Name: fdc_pah; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY fdc_pah (category, cas, code, tp_code, batch, method, pah, mg_kg, remarks, row_id) FROM stdin;
Category	CAS	Code	TP Code	Batch	Method	PAH	mg / kg	Remarks	1
Bitumen	100684-40-0	CON_25	\N	\N	\N	1-Methylnaphthalene	13.367	Ignored	2
Bitumen	100684-40-0	CON_25	\N	\N	\N	2-Methylnaphthalene	20.661	Ignored	3
Bitumen	100684-40-0	CON_25	\N	\N	\N	Acenaphthene	4.658	Ignored	4
Bitumen	100684-40-0	CON_25	\N	\N	\N	Acenaphthylene	0.231	Ignored	5
Bitumen	100684-40-0	CON_25	\N	\N	\N	Anthanthrene	14.586	Ignored	6
Bitumen	100684-40-0	CON_25	\N	\N	\N	Anthracene	5.969	Ignored	7
Bitumen	100684-40-0	CON_25	\N	\N	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	58.470	Ignored	8
Bitumen	100684-40-0	CON_25	\N	\N	\N	Benzo[a]pyrene	44.700	Ignored	9
Bitumen	100684-40-0	CON_25	\N	\N	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	19.303	Ignored	10
Bitumen	100684-40-0	CON_25	\N	\N	\N	Benzo[b]naphtho[2,1-d]thiophene	10.061	Ignored	11
Bitumen	100684-40-0	CON_25	\N	\N	\N	Benzo[c]phenanthrene	4.461	Ignored	12
Bitumen	100684-40-0	CON_25	\N	\N	\N	Benzo[e]pyrene	47.210	Ignored	13
Bitumen	100684-40-0	CON_25	\N	\N	\N	Benzo[g,h,i]fluoranthene	4.489	Ignored	14
Bitumen	100684-40-0	CON_25	\N	\N	\N	Benzo[g,h,i]perylene	77.697	Ignored	15
Bitumen	100684-40-0	CON_25	\N	\N	\N	Benzo[j]fluoranthene	4.613	Ignored	16
Bitumen	100684-40-0	CON_25	\N	\N	\N	Benzo[k]fluoranthene	4.806	Ignored	17
Bitumen	100684-40-0	CON_25	\N	\N	\N	Chrysene/Benzo[a]phenanthrene	77.361	Ignored	18
Bitumen	100684-40-0	CON_25	\N	\N	\N	Coronene	22.915	Ignored	19
Bitumen	100684-40-0	CON_25	\N	\N	\N	Cyclopenta[cd]pyrene	ND	Ignored	20
Bitumen	100684-40-0	CON_25	\N	\N	\N	Dibenzo[a,h]anthracene	4.852	Ignored	21
Bitumen	100684-40-0	CON_25	\N	\N	\N	Fluoranthene	18.064	Ignored	22
Bitumen	100684-40-0	CON_25	\N	\N	\N	Fluorene	7.730	Ignored	23
Bitumen	100684-40-0	CON_25	\N	\N	\N	Indeno[1,2,3-cd]pyrene	5.824	Ignored	24
Bitumen	100684-40-0	CON_25	\N	\N	\N	Naphthalene	6.217	Ignored	25
Bitumen	100684-40-0	CON_25	\N	\N	\N	Perylene	18.907	Ignored	26
Bitumen	100684-40-0	CON_25	\N	\N	\N	Phenanthrene	128.125	Ignored	27
Bitumen	100684-40-0	CON_25	\N	\N	\N	Pyrene	116.684	Ignored	28
Bitumen	100684-40-0	CON_25	\N	\N	\N	Triphenylene	36.106	Ignored	29
Bitumen	64741-56-6	C_BIT03	\N	\N	\N	Acenaphthene	0.741	Ignored	30
Bitumen	64741-56-6	C_BIT03	\N	\N	\N	Acenaphthylene	0.309	Ignored	31
Bitumen	64741-56-6	C_BIT03	\N	\N	\N	Anthracene	0.387	Ignored	32
Bitumen	64741-56-6	C_BIT03	\N	\N	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	ND	Ignored	33
Bitumen	64741-56-6	C_BIT03	\N	\N	\N	Benzo[a]pyrene	0.226	Ignored	34
Bitumen	64741-56-6	C_BIT03	\N	\N	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	0.167	Ignored	35
Bitumen	64741-56-6	C_BIT03	\N	\N	\N	Benzo[g,h,i]perylene	1.220	Ignored	36
Bitumen	64741-56-6	C_BIT03	\N	\N	\N	Benzo[k]fluoranthene	ND	Ignored	37
Bitumen	64741-56-6	C_BIT03	\N	\N	\N	Chrysene/Benzo[a]phenanthrene	0.296	Ignored	38
Bitumen	64741-56-6	C_BIT03	\N	\N	\N	Dibenzo[a,h]anthracene	0.169	Ignored	39
Bitumen	64741-56-6	C_BIT03	\N	\N	\N	Fluoranthene	0.217	Ignored	40
Bitumen	64741-56-6	C_BIT03	\N	\N	\N	Fluorene	3.960	Ignored	41
Bitumen	64741-56-6	C_BIT03	\N	\N	\N	Indeno[1,2,3-cd]pyrene	ND	Ignored	42
Bitumen	64741-56-6	C_BIT03	\N	\N	\N	Naphthalene	1.490	Ignored	43
Bitumen	64741-56-6	C_BIT03	\N	\N	\N	Phenanthrene	8.010	Ignored	44
Bitumen	64741-56-6	C_BIT03	\N	\N	\N	Pyrene	0.387	Ignored	45
Bitumen	64741-56-6	C_BIT06	\N	\N	\N	Acenaphthene	0.137	Ignored	46
Bitumen	64741-56-6	C_BIT06	\N	\N	\N	Acenaphthylene	ND	Ignored	47
Bitumen	64741-56-6	C_BIT06	\N	\N	\N	Anthracene	ND	Ignored	48
Bitumen	64741-56-6	C_BIT06	\N	\N	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	ND	Ignored	49
Bitumen	64741-56-6	C_BIT06	\N	\N	\N	Benzo[a]pyrene	0.235	Ignored	50
Bitumen	64741-56-6	C_BIT06	\N	\N	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	0.347	Ignored	51
Bitumen	64741-56-6	C_BIT06	\N	\N	\N	Benzo[g,h,i]perylene	2.190	Ignored	52
Bitumen	64741-56-6	C_BIT06	\N	\N	\N	Benzo[k]fluoranthene	ND	Ignored	53
Bitumen	64741-56-6	C_BIT06	\N	\N	\N	Chrysene/Benzo[a]phenanthrene	0.271	Ignored	54
Bitumen	64741-56-6	C_BIT06	\N	\N	\N	Dibenzo[a,h]anthracene	ND	Ignored	55
Bitumen	64741-56-6	C_BIT06	\N	\N	\N	Fluoranthene	0.128	Ignored	56
Bitumen	64741-56-6	C_BIT06	\N	\N	\N	Fluorene	0.545	Ignored	57
Bitumen	64741-56-6	C_BIT06	\N	\N	\N	Indeno[1,2,3-cd]pyrene	0.380	Ignored	58
Bitumen	64741-56-6	C_BIT06	\N	\N	\N	Naphthalene	0.276	Ignored	59
Bitumen	64741-56-6	C_BIT06	\N	\N	\N	Phenanthrene	0.306	Ignored	60
Bitumen	64741-56-6	C_BIT06	\N	\N	\N	Pyrene	0.237	Ignored	61
Bitumen	64741-56-6	TP526	\N	2003 Vacuum distillation Vacuum residue	\N	Acenaphthene	0.200	\N	62
Bitumen	64741-56-6	TP526	\N	2003 Vacuum distillation Vacuum residue	\N	Acenaphthylene	0.160	\N	63
Bitumen	64741-56-6	TP526	\N	2003 Vacuum distillation Vacuum residue	\N	Anthracene	0.230	\N	64
Bitumen	64741-56-6	TP526	\N	2003 Vacuum distillation Vacuum residue	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	0.150	\N	65
Bitumen	64741-56-6	TP526	\N	2003 Vacuum distillation Vacuum residue	\N	Benzo[a]fluorene	ND	\N	66
Bitumen	64741-56-6	TP526	\N	2003 Vacuum distillation Vacuum residue	\N	Benzo[a]pyrene	0.610	\N	67
Bitumen	64741-56-6	TP526	\N	2003 Vacuum distillation Vacuum residue	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	0.920	\N	68
Bitumen	64741-56-6	TP526	\N	2003 Vacuum distillation Vacuum residue	\N	Benzo[b]fluorene	ND	\N	69
Bitumen	64741-56-6	TP526	\N	2003 Vacuum distillation Vacuum residue	\N	Benzo[e]pyrene	3.100	\N	70
Bitumen	64741-56-6	TP526	\N	2003 Vacuum distillation Vacuum residue	\N	Benzo[g,h,i]perylene	4.900	\N	71
Bitumen	64741-56-6	TP526	\N	2003 Vacuum distillation Vacuum residue	\N	Benzo[k]fluoranthene	0.020	\N	72
Bitumen	64741-56-6	TP526	\N	2003 Vacuum distillation Vacuum residue	\N	Chrysene/Benzo[a]phenanthrene	0.220	\N	73
Bitumen	64741-56-6	TP526	\N	2003 Vacuum distillation Vacuum residue	\N	Dibenzo[a,h]anthracene	1.500	\N	74
Bitumen	64741-56-6	TP526	\N	2003 Vacuum distillation Vacuum residue	\N	Fluoranthene	0.038	\N	75
Bitumen	64741-56-6	TP526	\N	2003 Vacuum distillation Vacuum residue	\N	Fluorene	0.720	\N	76
Bitumen	64741-56-6	TP526	\N	2003 Vacuum distillation Vacuum residue	\N	Indeno[1,2,3-cd]pyrene	0.480	\N	77
Bitumen	64741-56-6	TP526	\N	2003 Vacuum distillation Vacuum residue	\N	Naphthalene	0.170	\N	78
Bitumen	64741-56-6	TP526	\N	2003 Vacuum distillation Vacuum residue	\N	Perylene	ND	\N	79
Bitumen	64741-56-6	TP526	\N	2003 Vacuum distillation Vacuum residue	\N	Phenanthrene	0.450	\N	80
Bitumen	64741-56-6	TP526	\N	2003 Vacuum distillation Vacuum residue	\N	Pyrene	0.290	\N	81
Bitumen	64741-56-6	TP526	\N	2003 Vacuum distillation Vacuum residue	\N	Triphenylene	0.650	\N	82
Bitumen	64741-56-6	TP527	\N	1999 Vacuum distillation Vacuum residue	\N	Acenaphthene	ND	\N	83
Bitumen	64741-56-6	TP527	\N	1999 Vacuum distillation Vacuum residue	\N	Acenaphthylene	ND	\N	84
Bitumen	64741-56-6	TP527	\N	1999 Vacuum distillation Vacuum residue	\N	Anthracene	ND	\N	85
Bitumen	64741-56-6	TP527	\N	1999 Vacuum distillation Vacuum residue	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	1.900	\N	86
Bitumen	64741-56-6	TP527	\N	1999 Vacuum distillation Vacuum residue	\N	Benzo[a]fluorene	3.800	\N	87
Bitumen	64741-56-6	TP527	\N	1999 Vacuum distillation Vacuum residue	\N	Benzo[a]pyrene	2.900	\N	88
Bitumen	64741-56-6	TP527	\N	1999 Vacuum distillation Vacuum residue	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	6.200	\N	89
Bitumen	64741-56-6	TP527	\N	1999 Vacuum distillation Vacuum residue	\N	Benzo[b]fluorene	1.400	\N	90
Bitumen	64741-56-6	TP527	\N	1999 Vacuum distillation Vacuum residue	\N	Benzo[e]pyrene	13.000	\N	91
Bitumen	64741-56-6	TP527	\N	1999 Vacuum distillation Vacuum residue	\N	Benzo[g,h,i]perylene	4.700	\N	92
Bitumen	64741-56-6	TP527	\N	1999 Vacuum distillation Vacuum residue	\N	Benzo[k]fluoranthene	0.760	\N	93
Bitumen	64741-56-6	TP527	\N	1999 Vacuum distillation Vacuum residue	\N	Chrysene+Triphenylene	7.600	\N	94
Bitumen	64741-56-6	TP527	\N	1999 Vacuum distillation Vacuum residue	\N	Dibenzo[a,h]anthracene	3.000	\N	95
Bitumen	64741-56-6	TP527	\N	1999 Vacuum distillation Vacuum residue	\N	Fluoranthene	ND	\N	96
Bitumen	64741-56-6	TP527	\N	1999 Vacuum distillation Vacuum residue	\N	Fluorene	ND	\N	97
Bitumen	64741-56-6	TP527	\N	1999 Vacuum distillation Vacuum residue	\N	Indeno[1,2,3-cd]pyrene	0.830	\N	98
Bitumen	64741-56-6	TP527	\N	1999 Vacuum distillation Vacuum residue	\N	Naphthalene	ND	\N	99
Bitumen	64741-56-6	TP527	\N	1999 Vacuum distillation Vacuum residue	\N	Perylene	12.000	\N	100
Bitumen	64741-56-6	TP527	\N	1999 Vacuum distillation Vacuum residue	\N	Phenanthrene	0.950	\N	101
Bitumen	64741-56-6	TP527	\N	1999 Vacuum distillation Vacuum residue	\N	Pyrene	0.710	\N	102
Bitumen	64741-56-6	TP527	\N	1999 Vacuum distillation Vacuum residue	\N	Triphenylene	In Chrysene	\N	103
Bitumen	64741-56-6	TP528	\N	1999 Vacuum distillation Vacuum residue	\N	Acenaphthene	ND	Ignored	104
Bitumen	64741-56-6	TP528	\N	1999 Vacuum distillation Vacuum residue	\N	Acenaphthylene	ND	Ignored	105
Bitumen	64741-56-6	TP528	\N	1999 Vacuum distillation Vacuum residue	\N	Anthracene	ND	Ignored	106
Bitumen	64741-56-6	TP528	\N	1999 Vacuum distillation Vacuum residue	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	ND	Ignored	107
Bitumen	64741-56-6	TP528	\N	1999 Vacuum distillation Vacuum residue	\N	Benzo[a]fluorene	ND	Ignored	108
Bitumen	64741-56-6	TP528	\N	1999 Vacuum distillation Vacuum residue	\N	Benzo[a]pyrene	ND	Ignored	109
Bitumen	64741-56-6	TP528	\N	1999 Vacuum distillation Vacuum residue	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	ND	Ignored	110
Bitumen	64741-56-6	TP528	\N	1999 Vacuum distillation Vacuum residue	\N	Benzo[b]fluorene	ND	Ignored	111
Bitumen	64741-56-6	TP528	\N	1999 Vacuum distillation Vacuum residue	\N	Benzo[e]pyrene	1.000	Ignored	112
Bitumen	64741-56-6	TP528	\N	1999 Vacuum distillation Vacuum residue	\N	Benzo[g,h,i]perylene	2.200	Ignored	113
Bitumen	64741-56-6	TP528	\N	1999 Vacuum distillation Vacuum residue	\N	Benzo[k]fluoranthene	ND	Ignored	114
Bitumen	64741-56-6	TP528	\N	1999 Vacuum distillation Vacuum residue	\N	Chrysene+Triphenylene	ND	Ignored	115
Bitumen	64741-56-6	TP528	\N	1999 Vacuum distillation Vacuum residue	\N	Dibenzo[a,h]anthracene	ND	Ignored	116
Bitumen	64741-56-6	TP528	\N	1999 Vacuum distillation Vacuum residue	\N	Fluoranthene	ND	Ignored	117
Bitumen	64741-56-6	TP528	\N	1999 Vacuum distillation Vacuum residue	\N	Fluorene	ND	Ignored	118
Bitumen	64741-56-6	TP528	\N	1999 Vacuum distillation Vacuum residue	\N	Indeno[1,2,3-cd]pyrene	ND	Ignored	119
Bitumen	64741-56-6	TP528	\N	1999 Vacuum distillation Vacuum residue	\N	Naphthalene	ND	Ignored	120
Bitumen	64741-56-6	TP528	\N	1999 Vacuum distillation Vacuum residue	\N	Perylene	1.800	Ignored	121
Bitumen	64741-56-6	TP528	\N	1999 Vacuum distillation Vacuum residue	\N	Phenanthrene	ND	Ignored	122
Bitumen	64741-56-6	TP528	\N	1999 Vacuum distillation Vacuum residue	\N	Pyrene	ND	Ignored	123
Bitumen	64741-56-6	TP528	\N	1999 Vacuum distillation Vacuum residue	\N	Triphenylene	In Chrysene	Ignored	124
Bitumen	64741-56-6	TP540	\N	B	\N	Acenaphthene	0.480	\N	125
Bitumen	64741-56-6	TP540	\N	B	\N	Acenaphthylene	0.180	\N	126
Bitumen	64741-56-6	TP540	\N	B	\N	Anthracene	0.580	\N	127
Bitumen	64741-56-6	TP540	\N	B	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	2.130	\N	128
Bitumen	64741-56-6	TP540	\N	B	\N	Benzo[a]pyrene	1.270	\N	129
Bitumen	64741-56-6	TP540	\N	B	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	3.310	\N	130
Bitumen	64741-56-6	TP540	\N	B	\N	Benzo[g,h,i]perylene	2.900	\N	131
Bitumen	64741-56-6	TP540	\N	B	\N	Benzo[k]fluoranthene	0.270	\N	132
Bitumen	64741-56-6	TP540	\N	B	\N	Chrysene/Benzo[a]phenanthrene	5.100	\N	133
Bitumen	64741-56-6	TP540	\N	B	\N	Dibenzo[a,h]anthracene	1.030	\N	134
Bitumen	64741-56-6	TP540	\N	B	\N	Fluoranthene	1.400	\N	135
Bitumen	64741-56-6	TP540	\N	B	\N	Fluorene	1.450	\N	136
Bitumen	64741-56-6	TP540	\N	B	\N	Indeno[1,2,3-cd]pyrene	0.540	\N	137
Bitumen	64741-56-6	TP540	\N	B	\N	Naphthalene	0.610	\N	138
Bitumen	64741-56-6	TP540	\N	B	\N	Phenanthrene	9.190	\N	139
Bitumen	64741-56-6	TP540	\N	B	\N	Pyrene	3.630	\N	140
Bitumen	64741-56-6	TP541	\N	K	\N	Acenaphthene	0.090	\N	141
Bitumen	64741-56-6	TP541	\N	K	\N	Acenaphthylene	0.020	\N	142
Bitumen	64741-56-6	TP541	\N	K	\N	Anthracene	0.580	\N	143
Bitumen	64741-56-6	TP541	\N	K	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	4.890	\N	144
Bitumen	64741-56-6	TP541	\N	K	\N	Benzo[a]pyrene	1.180	\N	145
Bitumen	64741-56-6	TP541	\N	K	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	2.550	\N	146
Bitumen	64741-56-6	TP541	\N	K	\N	Benzo[g,h,i]perylene	1.130	\N	147
Bitumen	64741-56-6	TP541	\N	K	\N	Benzo[k]fluoranthene	0.550	\N	148
Bitumen	64741-56-6	TP541	\N	K	\N	Chrysene/Benzo[a]phenanthrene	4.720	\N	149
Bitumen	64741-56-6	TP541	\N	K	\N	Dibenzo[a,h]anthracene	0.580	\N	150
Bitumen	64741-56-6	TP541	\N	K	\N	Fluoranthene	0.200	\N	151
Bitumen	64741-56-6	TP541	\N	K	\N	Fluorene	0.360	\N	152
Bitumen	64741-56-6	TP541	\N	K	\N	Indeno[1,2,3-cd]pyrene	0.250	\N	153
Bitumen	64741-56-6	TP541	\N	K	\N	Naphthalene	0.030	\N	154
Bitumen	64741-56-6	TP541	\N	K	\N	Phenanthrene	3.790	\N	155
Bitumen	64741-56-6	TP541	\N	K	\N	Pyrene	1.400	\N	156
Bitumen	64741-56-6	TP542	\N	M	\N	Acenaphthene	0.100	\N	157
Bitumen	64741-56-6	TP542	\N	M	\N	Acenaphthylene	0.040	\N	158
Bitumen	64741-56-6	TP542	\N	M	\N	Anthracene	0.500	\N	159
Bitumen	64741-56-6	TP542	\N	M	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	4.380	\N	160
Bitumen	64741-56-6	TP542	\N	M	\N	Benzo[a]pyrene	0.900	\N	161
Bitumen	64741-56-6	TP542	\N	M	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	2.120	\N	162
Bitumen	64741-56-6	TP542	\N	M	\N	Benzo[g,h,i]perylene	1.810	\N	163
Bitumen	64741-56-6	TP542	\N	M	\N	Benzo[k]fluoranthene	0.450	\N	164
Bitumen	64741-56-6	TP542	\N	M	\N	Chrysene/Benzo[a]phenanthrene	3.920	\N	165
Bitumen	64741-56-6	TP542	\N	M	\N	Dibenzo[a,h]anthracene	0.910	\N	166
Bitumen	64741-56-6	TP542	\N	M	\N	Fluoranthene	0.470	\N	167
Bitumen	64741-56-6	TP542	\N	M	\N	Fluorene	0.180	\N	168
Bitumen	64741-56-6	TP542	\N	M	\N	Indeno[1,2,3-cd]pyrene	0.640	\N	169
Bitumen	64741-56-6	TP542	\N	M	\N	Naphthalene	0.120	\N	170
Bitumen	64741-56-6	TP542	\N	M	\N	Phenanthrene	3.170	\N	171
Bitumen	64741-56-6	TP542	\N	M	\N	Pyrene	1.140	\N	172
Bitumen	64742-85-4	TP028	\N	727	DIN ISO 11465, EPA 1625	Acenaphthene	0.010	\N	173
Bitumen	64742-85-4	TP028	\N	727	DIN ISO 11465, EPA 1625	Acenaphthylene	ND	\N	174
Bitumen	64742-85-4	TP028	\N	727	DIN ISO 11465, EPA 1625	Anthracene	0.070	\N	175
Bitumen	64742-85-4	TP028	\N	727	DIN ISO 11465, EPA 1625	Benzo[a]anthracene/Benzo[b]phenanthrene	0.190	\N	176
Bitumen	64742-85-4	TP028	\N	727	DIN ISO 11465, EPA 1625	Benzo[a]pyrene	0.120	\N	177
Bitumen	64742-85-4	TP028	\N	727	DIN ISO 11465, EPA 1625	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	0.160	\N	178
Bitumen	64742-85-4	TP028	\N	727	DIN ISO 11465, EPA 1625	Benzo[g,h,i]perylene	6.170	\N	179
Bitumen	64742-85-4	TP028	\N	727	DIN ISO 11465, EPA 1625	Benzo[k]fluoranthene	0.060	\N	180
Bitumen	64742-85-4	TP028	\N	727	DIN ISO 11465, EPA 1625	Chrysene/Benzo[a]phenanthrene	0.140	\N	181
Bitumen	64742-85-4	TP028	\N	727	DIN ISO 11465, EPA 1625	Dibenzo[a,h]anthracene	0.560	\N	182
Bitumen	64742-85-4	TP028	\N	727	DIN ISO 11465, EPA 1625	Fluoranthene	0.690	\N	183
Bitumen	64742-85-4	TP028	\N	727	DIN ISO 11465, EPA 1625	Fluorene	0.040	\N	184
Bitumen	64742-85-4	TP028	\N	727	DIN ISO 11465, EPA 1625	Indeno[1,2,3-cd]pyrene	0.240	\N	185
Bitumen	64742-85-4	TP028	\N	727	DIN ISO 11465, EPA 1625	Naphthalene	0.010	\N	186
Bitumen	64742-85-4	TP028	\N	727	DIN ISO 11465, EPA 1625	Phenanthrene	0.260	\N	187
Bitumen	64742-85-4	TP028	\N	727	DIN ISO 11465, EPA 1625	Pyrene	1.050	\N	188
Bitumen	8052-42-4	C_BIT02	\N	\N	\N	Acenaphthene	ND	Ignored	189
Bitumen	8052-42-4	C_BIT02	\N	\N	\N	Acenaphthylene	ND	Ignored	190
Bitumen	8052-42-4	C_BIT02	\N	\N	\N	Anthracene	ND	Ignored	191
Bitumen	8052-42-4	C_BIT02	\N	\N	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	ND	Ignored	192
Bitumen	8052-42-4	C_BIT02	\N	\N	\N	Benzo[a]pyrene	ND	Ignored	193
Bitumen	8052-42-4	C_BIT02	\N	\N	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	0.322	Ignored	194
Bitumen	8052-42-4	C_BIT02	\N	\N	\N	Benzo[g,h,i]perylene	4.960	Ignored	195
Bitumen	8052-42-4	C_BIT02	\N	\N	\N	Benzo[k]fluoranthene	ND	Ignored	196
Bitumen	8052-42-4	C_BIT02	\N	\N	\N	Chrysene/Benzo[a]phenanthrene	0.250	Ignored	197
Bitumen	8052-42-4	C_BIT02	\N	\N	\N	Dibenzo[a,h]anthracene	0.504	Ignored	198
Bitumen	8052-42-4	C_BIT02	\N	\N	\N	Fluoranthene	ND	Ignored	199
Bitumen	8052-42-4	C_BIT02	\N	\N	\N	Fluorene	0.176	Ignored	200
Bitumen	8052-42-4	C_BIT02	\N	\N	\N	Indeno[1,2,3-cd]pyrene	0.519	Ignored	201
Bitumen	8052-42-4	C_BIT02	\N	\N	\N	Naphthalene	0.167	Ignored	202
Bitumen	8052-42-4	C_BIT02	\N	\N	\N	Phenanthrene	0.178	Ignored	203
Bitumen	8052-42-4	C_BIT02	\N	\N	\N	Pyrene	0.138	Ignored	204
Bitumen	8052-42-4	C_BIT05	\N	\N	\N	Acenaphthene	ND	Ignored	205
Bitumen	8052-42-4	C_BIT05	\N	\N	\N	Acenaphthylene	ND	Ignored	206
Bitumen	8052-42-4	C_BIT05	\N	\N	\N	Anthracene	ND	Ignored	207
Bitumen	8052-42-4	C_BIT05	\N	\N	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	ND	Ignored	208
Bitumen	8052-42-4	C_BIT05	\N	\N	\N	Benzo[a]pyrene	4.980	Ignored	209
Bitumen	8052-42-4	C_BIT05	\N	\N	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	1.620	Ignored	210
Bitumen	8052-42-4	C_BIT05	\N	\N	\N	Benzo[g,h,i]perylene	ND	Ignored	211
Bitumen	8052-42-4	C_BIT05	\N	\N	\N	Benzo[k]fluoranthene	ND	Ignored	212
Bitumen	8052-42-4	C_BIT05	\N	\N	\N	Chrysene/Benzo[a]phenanthrene	ND	Ignored	213
Bitumen	8052-42-4	C_BIT05	\N	\N	\N	Dibenzo[a,h]anthracene	ND	Ignored	214
Bitumen	8052-42-4	C_BIT05	\N	\N	\N	Fluoranthene	ND	Ignored	215
Bitumen	8052-42-4	C_BIT05	\N	\N	\N	Fluorene	0.305	Ignored	216
Bitumen	8052-42-4	C_BIT05	\N	\N	\N	Indeno[1,2,3-cd]pyrene	ND	Ignored	217
Bitumen	8052-42-4	C_BIT05	\N	\N	\N	Naphthalene	0.606	Ignored	218
Bitumen	8052-42-4	C_BIT05	\N	\N	\N	Phenanthrene	0.118	Ignored	219
Bitumen	8052-42-4	C_BIT05	\N	\N	\N	Pyrene	ND	Ignored	220
Bitumen	8052-42-4	CON_21	\N	\N	\N	1-Methylnaphthalene	0.305	Ignored	221
Bitumen	8052-42-4	CON_21	\N	\N	\N	2-Methylnaphthalene	0.551	Ignored	222
Bitumen	8052-42-4	CON_21	\N	\N	\N	Acenaphthene	4.722	Ignored	223
Bitumen	8052-42-4	CON_21	\N	\N	\N	Acenaphthylene	ND	Ignored	224
Bitumen	8052-42-4	CON_21	\N	\N	\N	Anthanthrene	10.582	Ignored	225
Bitumen	8052-42-4	CON_21	\N	\N	\N	Anthracene	1.531	Ignored	226
Bitumen	8052-42-4	CON_21	\N	\N	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	22.653	Ignored	227
Bitumen	8052-42-4	CON_21	\N	\N	\N	Benzo[a]pyrene	39.650	Ignored	228
Bitumen	8052-42-4	CON_21	\N	\N	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	33.131	Ignored	229
Bitumen	8052-42-4	CON_21	\N	\N	\N	Benzo[b]naphtho[2,1-d]thiophene	3.180	Ignored	230
Bitumen	8052-42-4	CON_21	\N	\N	\N	Benzo[c]phenanthrene	1.075	Ignored	231
Bitumen	8052-42-4	CON_21	\N	\N	\N	Benzo[e]pyrene	26.612	Ignored	232
Bitumen	8052-42-4	CON_21	\N	\N	\N	Benzo[g,h,i]fluoranthene	1.714	Ignored	233
Bitumen	8052-42-4	CON_21	\N	\N	\N	Benzo[g,h,i]perylene	30.771	Ignored	234
Bitumen	8052-42-4	CON_21	\N	\N	\N	Benzo[j]fluoranthene	13.927	Ignored	235
Bitumen	8052-42-4	CON_21	\N	\N	\N	Benzo[k]fluoranthene	16.561	Ignored	236
Bitumen	8052-42-4	CON_21	\N	\N	\N	Chrysene/Benzo[a]phenanthrene	21.506	Ignored	237
Bitumen	8052-42-4	CON_21	\N	\N	\N	Coronene	5.118	Ignored	238
Bitumen	8052-42-4	CON_21	\N	\N	\N	Cyclopenta[cd]pyrene	ND	Ignored	239
Bitumen	8052-42-4	CON_21	\N	\N	\N	Dibenzo[a,h]anthracene	6.987	Ignored	240
Bitumen	8052-42-4	CON_21	\N	\N	\N	Fluoranthene	21.869	Ignored	241
Bitumen	8052-42-4	CON_21	\N	\N	\N	Fluorene	6.677	Ignored	242
Bitumen	8052-42-4	CON_21	\N	\N	\N	Indeno[1,2,3-cd]pyrene	33.002	Ignored	243
Bitumen	8052-42-4	CON_21	\N	\N	\N	Naphthalene	0.926	Ignored	244
Bitumen	8052-42-4	CON_21	\N	\N	\N	Perylene	12.256	Ignored	245
Bitumen	8052-42-4	CON_21	\N	\N	\N	Phenanthrene	6.677	Ignored	246
Bitumen	8052-42-4	CON_21	\N	\N	\N	Pyrene	20.047	Ignored	247
Bitumen	8052-42-4	CON_21	\N	\N	\N	Triphenylene	4.095	Ignored	248
Bitumen	8052-42-4	H107	\N	\N	\N	Acenaphthene	2.100	Ignored	249
Bitumen	8052-42-4	H107	\N	\N	\N	Acenaphthylene	ND	Ignored	250
Bitumen	8052-42-4	H107	\N	\N	\N	Anthracene	3.100	Ignored	251
Bitumen	8052-42-4	H107	\N	\N	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	10.100	Ignored	252
Bitumen	8052-42-4	H107	\N	\N	\N	Benzo[a]pyrene	2.100	Ignored	253
Bitumen	8052-42-4	H107	\N	\N	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	ND	Ignored	254
Bitumen	8052-42-4	H107	\N	\N	\N	Benzo[g,h,i]perylene	2.700	Ignored	255
Bitumen	8052-42-4	H107	\N	\N	\N	Benzo[k]fluoranthene	3.400	Ignored	256
Bitumen	8052-42-4	H107	\N	\N	\N	Chrysene/Benzo[a]phenanthrene	50.600	Ignored	257
Bitumen	8052-42-4	H107	\N	\N	\N	Dibenzo[a,h]anthracene	3.200	Ignored	258
Bitumen	8052-42-4	H107	\N	\N	\N	Fluoranthene	24.300	Ignored	259
Bitumen	8052-42-4	H107	\N	\N	\N	Fluorene	ND	Ignored	260
Bitumen	8052-42-4	H107	\N	\N	\N	Indeno[1,2,3-cd]pyrene	1.400	Ignored	261
Bitumen	8052-42-4	H107	\N	\N	\N	Naphthalene	28.700	Ignored	262
Bitumen	8052-42-4	H107	\N	\N	\N	Phenanthrene	5.500	Ignored	263
Bitumen	8052-42-4	H107	\N	\N	\N	Pyrene	ND	Ignored	264
Bitumen	8052-42-4	H108	\N	\N	\N	Acenaphthene	3.400	Ignored	265
Bitumen	8052-42-4	H108	\N	\N	\N	Acenaphthylene	ND	Ignored	266
Bitumen	8052-42-4	H108	\N	\N	\N	Anthracene	ND	Ignored	267
Bitumen	8052-42-4	H108	\N	\N	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	ND	Ignored	268
Bitumen	8052-42-4	H108	\N	\N	\N	Benzo[a]pyrene	13.100	Ignored	269
Bitumen	8052-42-4	H108	\N	\N	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	29.000	Ignored	270
Bitumen	8052-42-4	H108	\N	\N	\N	Benzo[g,h,i]perylene	4.500	Ignored	271
Bitumen	8052-42-4	H108	\N	\N	\N	Benzo[k]fluoranthene	9.100	Ignored	272
Bitumen	8052-42-4	H108	\N	\N	\N	Chrysene/Benzo[a]phenanthrene	35.000	Ignored	273
Bitumen	8052-42-4	H108	\N	\N	\N	Dibenzo[a,h]anthracene	5.400	Ignored	274
Bitumen	8052-42-4	H108	\N	\N	\N	Fluoranthene	31.000	Ignored	275
Bitumen	8052-42-4	H108	\N	\N	\N	Fluorene	1.000	Ignored	276
Bitumen	8052-42-4	H108	\N	\N	\N	Indeno[1,2,3-cd]pyrene	2.100	Ignored	277
Bitumen	8052-42-4	H108	\N	\N	\N	Naphthalene	ND	Ignored	278
Bitumen	8052-42-4	H108	\N	\N	\N	Phenanthrene	14.300	Ignored	279
Bitumen	8052-42-4	H108	\N	\N	\N	Pyrene	10.900	Ignored	280
Bitumen	8052-42-4	H109	\N	\N	\N	Acenaphthene	3.700	Ignored	281
Bitumen	8052-42-4	H109	\N	\N	\N	Acenaphthylene	ND	Ignored	282
Bitumen	8052-42-4	H109	\N	\N	\N	Anthracene	7.300	Ignored	283
Bitumen	8052-42-4	H109	\N	\N	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	5.000	Ignored	284
Bitumen	8052-42-4	H109	\N	\N	\N	Benzo[a]pyrene	7.100	Ignored	285
Bitumen	8052-42-4	H109	\N	\N	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	36.300	Ignored	286
Bitumen	8052-42-4	H109	\N	\N	\N	Benzo[g,h,i]perylene	1.900	Ignored	287
Bitumen	8052-42-4	H109	\N	\N	\N	Benzo[k]fluoranthene	8.400	Ignored	288
Bitumen	8052-42-4	H109	\N	\N	\N	Chrysene/Benzo[a]phenanthrene	72.000	Ignored	289
Bitumen	8052-42-4	H109	\N	\N	\N	Dibenzo[a,h]anthracene	8.600	Ignored	290
Bitumen	8052-42-4	H109	\N	\N	\N	Fluoranthene	40.000	Ignored	291
Bitumen	8052-42-4	H109	\N	\N	\N	Fluorene	1.200	Ignored	292
Bitumen	8052-42-4	H109	\N	\N	\N	Indeno[1,2,3-cd]pyrene	7.100	Ignored	293
Bitumen	8052-42-4	H109	\N	\N	\N	Naphthalene	ND	Ignored	294
Bitumen	8052-42-4	H109	\N	\N	\N	Phenanthrene	11.200	Ignored	295
Bitumen	8052-42-4	H109	\N	\N	\N	Pyrene	8.300	Ignored	296
Bitumen	8052-42-4	J102	\N	110118516	40602	Anthracene	0.080	Incomplete	297
Bitumen	8052-42-4	J102	\N	110118516	40602	Benzo[a]pyrene	0.180	Incomplete	298
Bitumen	8052-42-4	J102	\N	110118516	40602	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	0.140	Incomplete	299
Bitumen	8052-42-4	J102	\N	110118516	40602	Benzo[g,h,i]perylene	1.000	Incomplete	300
Bitumen	8052-42-4	J102	\N	110118516	40602	Benzo[k]fluoranthene	0.080	Incomplete	301
Bitumen	8052-42-4	J102	\N	110118516	40602	Dibenzo[a,h]anthracene	0.200	Incomplete	302
Bitumen	8052-42-4	J102	\N	110118516	40602	Indeno[1,2,3-cd]pyrene	0.390	Incomplete	303
Bitumen	8052-42-4	TP032	\N	bitumen 160/220	GC	Benzo[a]anthracene/Benzo[b]phenanthrene	ND	Incomplete	304
Bitumen	8052-42-4	TP032	\N	bitumen 160/220	GC	Benzo[a]pyrene	0.400	Incomplete	305
Bitumen	8052-42-4	TP032	\N	bitumen 160/220	GC	Benzo[b,j,k]fluoranthene	ND	Incomplete	306
Bitumen	8052-42-4	TP032	\N	bitumen 160/220	GC	Benzo[e]pyrene	1.100	Incomplete	307
Bitumen	8052-42-4	TP032	\N	bitumen 160/220	GC	Chrysene/Benzo[a]phenanthrene	1.000	Incomplete	308
Bitumen	8052-42-4	TP032	\N	bitumen 160/220	GC	Dibenzo[a,h]anthracene	0.800	Incomplete	309
Bitumen	8052-42-4	TP183	\N	\N	UV-DAD/VIS	Anthracene	ND	Incomplete	310
Bitumen	8052-42-4	TP183	\N	\N	UV-DAD/VIS	Benzo[a]anthracene/Benzo[b]phenanthrene	ND	Incomplete	311
Bitumen	8052-42-4	TP183	\N	\N	UV-DAD/VIS	Benzo[a]fluoranthene	0.038	Incomplete	312
Bitumen	8052-42-4	TP183	\N	\N	UV-DAD/VIS	Benzo[a]pyrene	0.077	Incomplete	313
Bitumen	8052-42-4	TP183	\N	\N	UV-DAD/VIS	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	0.039	Incomplete	314
Bitumen	8052-42-4	TP183	\N	\N	UV-DAD/VIS	Benzo[e]pyrene	0.103	Incomplete	315
Bitumen	8052-42-4	TP183	\N	\N	UV-DAD/VIS	Benzo[g,h,i]perylene	0.010	Incomplete	316
Bitumen	8052-42-4	TP183	\N	\N	UV-DAD/VIS	Benzo[k]fluoranthene	0.046	Incomplete	317
Bitumen	8052-42-4	TP183	\N	\N	UV-DAD/VIS	Chrysene/Benzo[a]phenanthrene	0.033	Incomplete	318
Bitumen	8052-42-4	TP183	\N	\N	UV-DAD/VIS	Dibenzo[a,h]anthracene	0.001	Incomplete	319
Bitumen	8052-42-4	TP183	\N	\N	UV-DAD/VIS	Fluoranthene	0.002	Incomplete	320
Bitumen	8052-42-4	TP183	\N	\N	UV-DAD/VIS	Indeno[1,2,3-cd]pyrene	0.001	Incomplete	321
Bitumen	8052-42-4	TP183	\N	\N	UV-DAD/VIS	Phenanthrene	ND	Incomplete	322
Bitumen	8052-42-4	TP183	\N	\N	UV-DAD/VIS	Pyrene	0.008	Incomplete	323
Bitumen	8052-42-4	TP188	\N	3846/1 	UNI EN 15527/2008	Acenaphthene	ND	Pyrene missing	324
Bitumen	8052-42-4	TP188	\N	3846/1 	UNI EN 15527/2008	Acenaphthylene	ND	Pyrene missing	325
Bitumen	8052-42-4	TP188	\N	3846/1 	UNI EN 15527/2008	Anthracene	ND	Pyrene missing	326
Bitumen	8052-42-4	TP188	\N	3846/1 	UNI EN 15527/2008	Benzo[a]anthracene/Benzo[b]phenanthrene	ND	Pyrene missing	327
Bitumen	8052-42-4	TP188	\N	3846/1 	UNI EN 15527/2008	Benzo[a]pyrene	0.860	Pyrene missing	328
Bitumen	8052-42-4	TP188	\N	3846/1 	UNI EN 15527/2008	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	ND	Pyrene missing	329
Bitumen	8052-42-4	TP188	\N	3846/1 	UNI EN 15527/2008	Benzo[e]pyrene	1.440	\N	330
Bitumen	8052-42-4	TP188	\N	3846/1 	UNI EN 15527/2008	Benzo[g,h,i]perylene	4.640	Pyrene missing	331
Bitumen	8052-42-4	TP188	\N	3846/1 	UNI EN 15527/2008	Benzo[j]fluoranthene	ND	\N	332
Bitumen	8052-42-4	TP188	\N	3846/1 	UNI EN 15527/2008	Benzo[k]fluoranthene	ND	Pyrene missing	333
Bitumen	8052-42-4	TP188	\N	3846/1 	UNI EN 15527/2008	Chrysene/Benzo[a]phenanthrene	ND	Pyrene missing	334
Bitumen	8052-42-4	TP188	\N	3846/1 	UNI EN 15527/2008	Dibenzo[a,e]pyrene	3.930	\N	335
Bitumen	8052-42-4	TP188	\N	3846/1 	UNI EN 15527/2008	Dibenzo[a,h]anthracene	0.730	Pyrene missing	336
Bitumen	8052-42-4	TP188	\N	3846/1 	UNI EN 15527/2008	Dibenzo[a,h]pyrene	0.990	\N	337
Bitumen	8052-42-4	TP188	\N	3846/1 	UNI EN 15527/2008	Dibenzo[a,i]pyrene	2.970	\N	338
Bitumen	8052-42-4	TP188	\N	3846/1 	UNI EN 15527/2008	Dibenzo[a,l]pyrene	1.470	\N	339
Bitumen	8052-42-4	TP188	\N	3846/1 	UNI EN 15527/2008	Fluoranthene	ND	Pyrene missing	340
Bitumen	8052-42-4	TP188	\N	3846/1 	UNI EN 15527/2008	Fluorene	ND	Pyrene missing	341
Bitumen	8052-42-4	TP188	\N	3846/1 	UNI EN 15527/2008	Indeno[1,2,3-cd]pyrene	0.920	Pyrene missing	342
Bitumen	8052-42-4	TP188	\N	3846/1 	UNI EN 15527/2008	Naphthalene	2.300	Pyrene missing	343
Bitumen	8052-42-4	TP188	\N	3846/1 	UNI EN 15527/2008	Phenanthrene	0.820	Pyrene missing	344
Bitumen	8052-42-4	TP529	\N	2003 SRN 250	\N	Acenaphthene	0.530	\N	345
Bitumen	8052-42-4	TP529	\N	2003 SRN 250	\N	Acenaphthylene	0.260	\N	346
Bitumen	8052-42-4	TP529	\N	2003 SRN 250	\N	Anthracene	0.600	\N	347
Bitumen	8052-42-4	TP529	\N	2003 SRN 250	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	0.560	\N	348
Bitumen	8052-42-4	TP529	\N	2003 SRN 250	\N	Benzo[a]fluorene	ND	\N	349
Bitumen	8052-42-4	TP529	\N	2003 SRN 250	\N	Benzo[a]pyrene	0.900	\N	350
Bitumen	8052-42-4	TP529	\N	2003 SRN 250	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	1.100	\N	351
Bitumen	8052-42-4	TP529	\N	2003 SRN 250	\N	Benzo[b]fluorene	ND	\N	352
Bitumen	8052-42-4	TP529	\N	2003 SRN 250	\N	Benzo[e]pyrene	0.640	\N	353
Bitumen	8052-42-4	TP529	\N	2003 SRN 250	\N	Benzo[g,h,i]perylene	2.900	\N	354
Bitumen	8052-42-4	TP529	\N	2003 SRN 250	\N	Benzo[k]fluoranthene	0.130	\N	355
Bitumen	8052-42-4	TP529	\N	2003 SRN 250	\N	Chrysene/Benzo[a]phenanthrene	1.100	\N	356
Bitumen	8052-42-4	TP529	\N	2003 SRN 250	\N	Dibenzo[a,h]anthracene	0.710	\N	357
Bitumen	8052-42-4	TP529	\N	2003 SRN 250	\N	Fluoranthene	0.240	\N	358
Bitumen	8052-42-4	TP529	\N	2003 SRN 250	\N	Fluorene	1.000	\N	359
Bitumen	8052-42-4	TP529	\N	2003 SRN 250	\N	Indeno[1,2,3-cd]pyrene	0.450	\N	360
Bitumen	8052-42-4	TP529	\N	2003 SRN 250	\N	Naphthalene	1.600	\N	361
Bitumen	8052-42-4	TP529	\N	2003 SRN 250	\N	Perylene	ND	\N	362
Bitumen	8052-42-4	TP529	\N	2003 SRN 250	\N	Phenanthrene	2.900	\N	363
Bitumen	8052-42-4	TP529	\N	2003 SRN 250	\N	Pyrene	1.100	\N	364
Bitumen	8052-42-4	TP529	\N	2003 SRN 250	\N	Triphenylene	0.240	\N	365
Bitumen	8052-42-4	TP530	\N	2003 SRN 15 pen	\N	Acenaphthene	0.120	\N	366
Bitumen	8052-42-4	TP530	\N	2003 SRN 15 pen	\N	Acenaphthylene	0.120	\N	367
Bitumen	8052-42-4	TP530	\N	2003 SRN 15 pen	\N	Anthracene	0.079	\N	368
Bitumen	8052-42-4	TP530	\N	2003 SRN 15 pen	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	0.100	\N	369
Bitumen	8052-42-4	TP530	\N	2003 SRN 15 pen	\N	Benzo[a]fluorene	ND	\N	370
Bitumen	8052-42-4	TP530	\N	2003 SRN 15 pen	\N	Benzo[a]pyrene	0.870	\N	371
Bitumen	8052-42-4	TP530	\N	2003 SRN 15 pen	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	1.000	\N	372
Bitumen	8052-42-4	TP530	\N	2003 SRN 15 pen	\N	Benzo[b]fluorene	ND	\N	373
Bitumen	8052-42-4	TP530	\N	2003 SRN 15 pen	\N	Benzo[e]pyrene	2.800	\N	374
Bitumen	8052-42-4	TP530	\N	2003 SRN 15 pen	\N	Benzo[g,h,i]perylene	1.600	\N	375
Bitumen	8052-42-4	TP530	\N	2003 SRN 15 pen	\N	Benzo[k]fluoranthene	0.011	\N	376
Bitumen	8052-42-4	TP530	\N	2003 SRN 15 pen	\N	Chrysene/Benzo[a]phenanthrene	0.360	\N	377
Bitumen	8052-42-4	TP530	\N	2003 SRN 15 pen	\N	Dibenzo[a,h]anthracene	0.830	\N	378
Bitumen	8052-42-4	TP530	\N	2003 SRN 15 pen	\N	Fluoranthene	0.034	\N	379
Bitumen	8052-42-4	TP530	\N	2003 SRN 15 pen	\N	Fluorene	0.210	\N	380
Bitumen	8052-42-4	TP530	\N	2003 SRN 15 pen	\N	Indeno[1,2,3-cd]pyrene	0.420	\N	381
Bitumen	8052-42-4	TP530	\N	2003 SRN 15 pen	\N	Naphthalene	0.200	\N	382
Bitumen	8052-42-4	TP530	\N	2003 SRN 15 pen	\N	Perylene	ND	\N	383
Bitumen	8052-42-4	TP530	\N	2003 SRN 15 pen	\N	Phenanthrene	0.130	\N	384
Bitumen	8052-42-4	TP530	\N	2003 SRN 15 pen	\N	Pyrene	0.100	\N	385
Bitumen	8052-42-4	TP530	\N	2003 SRN 15 pen	\N	Triphenylene	1.100	\N	386
Bitumen	8052-42-4	TP531	\N	2003 SRN 15 pen	\N	Acenaphthene	0.190	\N	387
Bitumen	8052-42-4	TP531	\N	2003 SRN 15 pen	\N	Acenaphthylene	0.350	\N	388
Bitumen	8052-42-4	TP531	\N	2003 SRN 15 pen	\N	Anthracene	0.160	\N	389
Bitumen	8052-42-4	TP531	\N	2003 SRN 15 pen	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	0.210	\N	390
Bitumen	8052-42-4	TP531	\N	2003 SRN 15 pen	\N	Benzo[a]fluorene	ND	\N	391
Bitumen	8052-42-4	TP531	\N	2003 SRN 15 pen	\N	Benzo[a]pyrene	1.200	\N	392
Bitumen	8052-42-4	TP531	\N	2003 SRN 15 pen	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	1.600	\N	393
Bitumen	8052-42-4	TP531	\N	2003 SRN 15 pen	\N	Benzo[b]fluorene	ND	\N	394
Bitumen	8052-42-4	TP531	\N	2003 SRN 15 pen	\N	Benzo[e]pyrene	4.000	\N	395
Bitumen	8052-42-4	TP531	\N	2003 SRN 15 pen	\N	Benzo[g,h,i]perylene	2.700	\N	396
Bitumen	8052-42-4	TP531	\N	2003 SRN 15 pen	\N	Benzo[k]fluoranthene	0.046	\N	397
Bitumen	8052-42-4	TP531	\N	2003 SRN 15 pen	\N	Chrysene/Benzo[a]phenanthrene	0.520	\N	398
Bitumen	8052-42-4	TP531	\N	2003 SRN 15 pen	\N	Dibenzo[a,h]anthracene	1.100	\N	399
Bitumen	8052-42-4	TP531	\N	2003 SRN 15 pen	\N	Fluoranthene	0.081	\N	400
Bitumen	8052-42-4	TP531	\N	2003 SRN 15 pen	\N	Fluorene	0.380	\N	401
Bitumen	8052-42-4	TP531	\N	2003 SRN 15 pen	\N	Indeno[1,2,3-cd]pyrene	0.380	\N	402
Bitumen	8052-42-4	TP531	\N	2003 SRN 15 pen	\N	Naphthalene	0.230	\N	403
Bitumen	8052-42-4	TP531	\N	2003 SRN 15 pen	\N	Perylene	ND	\N	404
Bitumen	8052-42-4	TP531	\N	2003 SRN 15 pen	\N	Phenanthrene	0.240	\N	405
Bitumen	8052-42-4	TP531	\N	2003 SRN 15 pen	\N	Pyrene	0.190	\N	406
Bitumen	8052-42-4	TP531	\N	2003 SRN 15 pen	\N	Triphenylene	0.890	\N	407
Bitumen	8052-42-4	TP532	\N	2003 SRN 160/220	\N	Acenaphthene	0.240	\N	408
Bitumen	8052-42-4	TP532	\N	2003 SRN 160/220	\N	Acenaphthylene	0.180	\N	409
Bitumen	8052-42-4	TP532	\N	2003 SRN 160/220	\N	Anthracene	1.000	\N	410
Bitumen	8052-42-4	TP532	\N	2003 SRN 160/220	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	3.400	\N	411
Bitumen	8052-42-4	TP532	\N	2003 SRN 160/220	\N	Benzo[a]fluorene	ND	\N	412
Bitumen	8052-42-4	TP532	\N	2003 SRN 160/220	\N	Benzo[a]pyrene	4.500	\N	413
Bitumen	8052-42-4	TP532	\N	2003 SRN 160/220	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	8.200	\N	414
Bitumen	8052-42-4	TP532	\N	2003 SRN 160/220	\N	Benzo[b]fluorene	ND	\N	415
Bitumen	8052-42-4	TP532	\N	2003 SRN 160/220	\N	Benzo[e]pyrene	6.200	\N	416
Bitumen	8052-42-4	TP532	\N	2003 SRN 160/220	\N	Benzo[g,h,i]perylene	4.800	\N	417
Bitumen	8052-42-4	TP532	\N	2003 SRN 160/220	\N	Benzo[k]fluoranthene	0.220	\N	418
Bitumen	8052-42-4	TP532	\N	2003 SRN 160/220	\N	Chrysene/Benzo[a]phenanthrene	7.600	\N	419
Bitumen	8052-42-4	TP532	\N	2003 SRN 160/220	\N	Dibenzo[a,h]anthracene	2.500	\N	420
Bitumen	8052-42-4	TP532	\N	2003 SRN 160/220	\N	Fluoranthene	1.000	\N	421
Bitumen	8052-42-4	TP532	\N	2003 SRN 160/220	\N	Fluorene	0.780	\N	422
Bitumen	8052-42-4	TP532	\N	2003 SRN 160/220	\N	Indeno[1,2,3-cd]pyrene	0.920	\N	423
Bitumen	8052-42-4	TP532	\N	2003 SRN 160/220	\N	Naphthalene	0.140	\N	424
Bitumen	8052-42-4	TP532	\N	2003 SRN 160/220	\N	Perylene	ND	\N	425
Bitumen	8052-42-4	TP532	\N	2003 SRN 160/220	\N	Phenanthrene	5.900	\N	426
Bitumen	8052-42-4	TP532	\N	2003 SRN 160/220	\N	Pyrene	6.800	\N	427
Bitumen	8052-42-4	TP532	\N	2003 SRN 160/220	\N	Triphenylene	2.400	\N	428
Bitumen	8052-42-4	TP533	\N	2003 SRN 160/220	\N	Acenaphthene	0.190	\N	429
Bitumen	8052-42-4	TP533	\N	2003 SRN 160/220	\N	Acenaphthylene	0.130	\N	430
Bitumen	8052-42-4	TP533	\N	2003 SRN 160/220	\N	Anthracene	0.180	\N	431
Bitumen	8052-42-4	TP533	\N	2003 SRN 160/220	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	0.240	\N	432
Bitumen	8052-42-4	TP533	\N	2003 SRN 160/220	\N	Benzo[a]fluorene	ND	\N	433
Bitumen	8052-42-4	TP533	\N	2003 SRN 160/220	\N	Benzo[a]pyrene	0.720	\N	434
Bitumen	8052-42-4	TP533	\N	2003 SRN 160/220	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	1.000	\N	435
Bitumen	8052-42-4	TP533	\N	2003 SRN 160/220	\N	Benzo[b]fluorene	ND	\N	436
Bitumen	8052-42-4	TP533	\N	2003 SRN 160/220	\N	Benzo[e]pyrene	5.200	\N	437
Bitumen	8052-42-4	TP533	\N	2003 SRN 160/220	\N	Benzo[g,h,i]perylene	2.200	\N	438
Bitumen	8052-42-4	TP533	\N	2003 SRN 160/220	\N	Benzo[k]fluoranthene	0.051	\N	439
Bitumen	8052-42-4	TP533	\N	2003 SRN 160/220	\N	Chrysene/Benzo[a]phenanthrene	0.570	\N	440
Bitumen	8052-42-4	TP533	\N	2003 SRN 160/220	\N	Dibenzo[a,h]anthracene	0.630	\N	441
Bitumen	8052-42-4	TP533	\N	2003 SRN 160/220	\N	Fluoranthene	0.086	\N	442
Bitumen	8052-42-4	TP533	\N	2003 SRN 160/220	\N	Fluorene	0.390	\N	443
Bitumen	8052-42-4	TP533	\N	2003 SRN 160/220	\N	Indeno[1,2,3-cd]pyrene	0.420	\N	444
Bitumen	8052-42-4	TP533	\N	2003 SRN 160/220	\N	Naphthalene	0.370	\N	445
Bitumen	8052-42-4	TP533	\N	2003 SRN 160/220	\N	Perylene	ND	\N	446
Bitumen	8052-42-4	TP533	\N	2003 SRN 160/220	\N	Phenanthrene	0.450	\N	447
Bitumen	8052-42-4	TP533	\N	2003 SRN 160/220	\N	Pyrene	0.330	\N	448
Bitumen	8052-42-4	TP533	\N	2003 SRN 160/220	\N	Triphenylene	3.400	\N	449
Bitumen	8052-42-4	TP534	\N	2003 SRN 160/220	\N	Acenaphthene	0.150	\N	450
Bitumen	8052-42-4	TP534	\N	2003 SRN 160/220	\N	Acenaphthylene	0.110	\N	451
Bitumen	8052-42-4	TP534	\N	2003 SRN 160/220	\N	Anthracene	0.110	\N	452
Bitumen	8052-42-4	TP534	\N	2003 SRN 160/220	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	0.055	\N	453
Bitumen	8052-42-4	TP534	\N	2003 SRN 160/220	\N	Benzo[a]fluorene	ND	\N	454
Bitumen	8052-42-4	TP534	\N	2003 SRN 160/220	\N	Benzo[a]pyrene	0.200	\N	455
Bitumen	8052-42-4	TP534	\N	2003 SRN 160/220	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	0.240	\N	456
Bitumen	8052-42-4	TP534	\N	2003 SRN 160/220	\N	Benzo[b]fluorene	ND	\N	457
Bitumen	8052-42-4	TP534	\N	2003 SRN 160/220	\N	Benzo[e]pyrene	38.000	\N	458
Bitumen	8052-42-4	TP534	\N	2003 SRN 160/220	\N	Benzo[g,h,i]perylene	0.990	\N	459
Bitumen	8052-42-4	TP534	\N	2003 SRN 160/220	\N	Benzo[k]fluoranthene	0.013	\N	460
Bitumen	8052-42-4	TP534	\N	2003 SRN 160/220	\N	Chrysene/Benzo[a]phenanthrene	0.160	\N	461
Bitumen	8052-42-4	TP534	\N	2003 SRN 160/220	\N	Dibenzo[a,h]anthracene	0.260	\N	462
Bitumen	8052-42-4	TP534	\N	2003 SRN 160/220	\N	Fluoranthene	0.040	\N	463
Bitumen	8052-42-4	TP534	\N	2003 SRN 160/220	\N	Fluorene	0.290	\N	464
Bitumen	8052-42-4	TP534	\N	2003 SRN 160/220	\N	Indeno[1,2,3-cd]pyrene	0.150	\N	465
Bitumen	8052-42-4	TP534	\N	2003 SRN 160/220	\N	Naphthalene	0.140	\N	466
Bitumen	8052-42-4	TP534	\N	2003 SRN 160/220	\N	Perylene	ND	\N	467
Bitumen	8052-42-4	TP534	\N	2003 SRN 160/220	\N	Phenanthrene	0.310	\N	468
Bitumen	8052-42-4	TP534	\N	2003 SRN 160/220	\N	Pyrene	0.120	\N	469
Bitumen	8052-42-4	TP534	\N	2003 SRN 160/220	\N	Triphenylene	15.000	\N	470
Bitumen	8052-42-4	TP535	\N	2003 SRN 20 pen	\N	Acenaphthene	0.220	\N	471
Bitumen	8052-42-4	TP535	\N	2003 SRN 20 pen	\N	Acenaphthylene	0.130	\N	472
Bitumen	8052-42-4	TP535	\N	2003 SRN 20 pen	\N	Anthracene	0.210	\N	473
Bitumen	8052-42-4	TP535	\N	2003 SRN 20 pen	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	0.480	\N	474
Bitumen	8052-42-4	TP535	\N	2003 SRN 20 pen	\N	Benzo[a]fluorene	ND	\N	475
Bitumen	8052-42-4	TP535	\N	2003 SRN 20 pen	\N	Benzo[a]pyrene	1.900	\N	476
Bitumen	8052-42-4	TP535	\N	2003 SRN 20 pen	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	2.700	\N	477
Bitumen	8052-42-4	TP535	\N	2003 SRN 20 pen	\N	Benzo[b]fluorene	ND	\N	478
Bitumen	8052-42-4	TP535	\N	2003 SRN 20 pen	\N	Benzo[e]pyrene	4.200	\N	479
Bitumen	8052-42-4	TP535	\N	2003 SRN 20 pen	\N	Benzo[g,h,i]perylene	4.100	\N	480
Bitumen	8052-42-4	TP535	\N	2003 SRN 20 pen	\N	Benzo[k]fluoranthene	0.100	\N	481
Bitumen	8052-42-4	TP535	\N	2003 SRN 20 pen	\N	Chrysene/Benzo[a]phenanthrene	0.970	\N	482
Bitumen	8052-42-4	TP535	\N	2003 SRN 20 pen	\N	Dibenzo[a,h]anthracene	1.600	\N	483
Bitumen	8052-42-4	TP535	\N	2003 SRN 20 pen	\N	Fluoranthene	0.110	\N	484
Bitumen	8052-42-4	TP535	\N	2003 SRN 20 pen	\N	Fluorene	0.400	\N	485
Bitumen	8052-42-4	TP535	\N	2003 SRN 20 pen	\N	Indeno[1,2,3-cd]pyrene	0.780	\N	486
Bitumen	8052-42-4	TP535	\N	2003 SRN 20 pen	\N	Naphthalene	0.160	\N	487
Bitumen	8052-42-4	TP535	\N	2003 SRN 20 pen	\N	Perylene	ND	\N	488
Bitumen	8052-42-4	TP535	\N	2003 SRN 20 pen	\N	Phenanthrene	0.570	\N	489
Bitumen	8052-42-4	TP535	\N	2003 SRN 20 pen	\N	Pyrene	0.650	\N	490
Bitumen	8052-42-4	TP535	\N	2003 SRN 20 pen	\N	Triphenylene	2.900	\N	491
Bitumen	8052-42-4	TP536	\N	2003 SRN 30/45	\N	Acenaphthene	0.260	\N	492
Bitumen	8052-42-4	TP536	\N	2003 SRN 30/45	\N	Acenaphthylene	0.160	\N	493
Bitumen	8052-42-4	TP536	\N	2003 SRN 30/45	\N	Anthracene	0.300	\N	494
Bitumen	8052-42-4	TP536	\N	2003 SRN 30/45	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	1.200	\N	495
Bitumen	8052-42-4	TP536	\N	2003 SRN 30/45	\N	Benzo[a]fluorene	ND	\N	496
Bitumen	8052-42-4	TP536	\N	2003 SRN 30/45	\N	Benzo[a]pyrene	2.800	\N	497
Bitumen	8052-42-4	TP536	\N	2003 SRN 30/45	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	4.400	\N	498
Bitumen	8052-42-4	TP536	\N	2003 SRN 30/45	\N	Benzo[b]fluorene	ND	\N	499
Bitumen	8052-42-4	TP536	\N	2003 SRN 30/45	\N	Benzo[e]pyrene	6.400	\N	500
Bitumen	8052-42-4	TP536	\N	2003 SRN 30/45	\N	Benzo[g,h,i]perylene	4.400	\N	501
Bitumen	8052-42-4	TP536	\N	2003 SRN 30/45	\N	Benzo[k]fluoranthene	0.240	\N	502
Bitumen	8052-42-4	TP536	\N	2003 SRN 30/45	\N	Chrysene/Benzo[a]phenanthrene	2.600	\N	503
Bitumen	8052-42-4	TP536	\N	2003 SRN 30/45	\N	Dibenzo[a,h]anthracene	2.300	\N	504
Bitumen	8052-42-4	TP536	\N	2003 SRN 30/45	\N	Fluoranthene	0.190	\N	505
Bitumen	8052-42-4	TP536	\N	2003 SRN 30/45	\N	Fluorene	0.560	\N	506
Bitumen	8052-42-4	TP536	\N	2003 SRN 30/45	\N	Indeno[1,2,3-cd]pyrene	0.730	\N	507
Bitumen	8052-42-4	TP536	\N	2003 SRN 30/45	\N	Naphthalene	0.170	\N	508
Bitumen	8052-42-4	TP536	\N	2003 SRN 30/45	\N	Perylene	ND	\N	509
Bitumen	8052-42-4	TP536	\N	2003 SRN 30/45	\N	Phenanthrene	1.100	\N	510
Bitumen	8052-42-4	TP536	\N	2003 SRN 30/45	\N	Pyrene	1.300	\N	511
Bitumen	8052-42-4	TP536	\N	2003 SRN 30/45	\N	Triphenylene	2.500	\N	512
Bitumen	8052-42-4	TP537	\N	2000 SRN B300	\N	Acenaphthene	0.180	\N	513
Bitumen	8052-42-4	TP537	\N	2000 SRN B300	\N	Acenaphthylene	0.051	\N	514
Bitumen	8052-42-4	TP537	\N	2000 SRN B300	\N	Anthracene	0.420	\N	515
Bitumen	8052-42-4	TP537	\N	2000 SRN B300	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	1.200	\N	516
Bitumen	8052-42-4	TP537	\N	2000 SRN B300	\N	Benzo[a]fluorene	ND	\N	517
Bitumen	8052-42-4	TP537	\N	2000 SRN B300	\N	Benzo[a]pyrene	2.300	\N	518
Bitumen	8052-42-4	TP537	\N	2000 SRN B300	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	1.600	\N	519
Bitumen	8052-42-4	TP537	\N	2000 SRN B300	\N	Benzo[b]fluorene	ND	\N	520
Bitumen	8052-42-4	TP537	\N	2000 SRN B300	\N	Benzo[e]pyrene	ND	\N	521
Bitumen	8052-42-4	TP537	\N	2000 SRN B300	\N	Benzo[g,h,i]perylene	5.400	\N	522
Bitumen	8052-42-4	TP537	\N	2000 SRN B300	\N	Benzo[k]fluoranthene	0.310	\N	523
Bitumen	8052-42-4	TP537	\N	2000 SRN B300	\N	Chrysene+Triphenylene	1.500	\N	524
Bitumen	8052-42-4	TP537	\N	2000 SRN B300	\N	Dibenzo[a,h]anthracene	1.200	\N	525
Bitumen	8052-42-4	TP537	\N	2000 SRN B300	\N	Fluoranthene	0.420	\N	526
Bitumen	8052-42-4	TP537	\N	2000 SRN B300	\N	Fluorene	0.250	\N	527
Bitumen	8052-42-4	TP537	\N	2000 SRN B300	\N	Indeno[1,2,3-cd]pyrene	1.500	\N	528
Bitumen	8052-42-4	TP537	\N	2000 SRN B300	\N	Naphthalene	0.900	\N	529
Bitumen	8052-42-4	TP537	\N	2000 SRN B300	\N	Perylene	ND	\N	530
Bitumen	8052-42-4	TP537	\N	2000 SRN B300	\N	Phenanthrene	1.200	\N	531
Bitumen	8052-42-4	TP537	\N	2000 SRN B300	\N	Pyrene	2.000	\N	532
Bitumen	8052-42-4	TP537	\N	2000 SRN B300	\N	Triphenylene	In Chrysene	\N	533
Bitumen	8052-42-4	TP538	\N	1999 SRN V1500	\N	Acenaphthene	ND	\N	534
Bitumen	8052-42-4	TP538	\N	1999 SRN V1500	\N	Acenaphthylene	ND	\N	535
Bitumen	8052-42-4	TP538	\N	1999 SRN V1500	\N	Anthracene	ND	\N	536
Bitumen	8052-42-4	TP538	\N	1999 SRN V1500	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	1.600	\N	537
Bitumen	8052-42-4	TP538	\N	1999 SRN V1500	\N	Benzo[a]fluorene	4.400	\N	538
Bitumen	8052-42-4	TP538	\N	1999 SRN V1500	\N	Benzo[a]pyrene	3.900	\N	539
Bitumen	8052-42-4	TP538	\N	1999 SRN V1500	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	9.700	\N	540
Bitumen	8052-42-4	TP538	\N	1999 SRN V1500	\N	Benzo[b]fluorene	1.600	\N	541
Bitumen	8052-42-4	TP538	\N	1999 SRN V1500	\N	Benzo[e]pyrene	24.000	\N	542
Bitumen	8052-42-4	TP538	\N	1999 SRN V1500	\N	Benzo[g,h,i]perylene	5.000	\N	543
Bitumen	8052-42-4	TP538	\N	1999 SRN V1500	\N	Benzo[k]fluoranthene	ND	\N	544
Bitumen	8052-42-4	TP538	\N	1999 SRN V1500	\N	Chrysene+Triphenylene	5.500	\N	545
Bitumen	8052-42-4	TP538	\N	1999 SRN V1500	\N	Dibenzo[a,h]anthracene	ND	\N	546
Bitumen	8052-42-4	TP538	\N	1999 SRN V1500	\N	Fluoranthene	0.780	\N	547
Bitumen	8052-42-4	TP538	\N	1999 SRN V1500	\N	Fluorene	ND	\N	548
Bitumen	8052-42-4	TP538	\N	1999 SRN V1500	\N	Indeno[1,2,3-cd]pyrene	ND	\N	549
Bitumen	8052-42-4	TP538	\N	1999 SRN V1500	\N	Naphthalene	0.860	\N	550
Bitumen	8052-42-4	TP538	\N	1999 SRN V1500	\N	Perylene	2.800	\N	551
Bitumen	8052-42-4	TP538	\N	1999 SRN V1500	\N	Phenanthrene	3.200	\N	552
Bitumen	8052-42-4	TP538	\N	1999 SRN V1500	\N	Pyrene	2.700	\N	553
Bitumen	8052-42-4	TP538	\N	1999 SRN V1500	\N	Triphenylene	In Chrysene	\N	554
Bitumen	8052-42-4	TP548	\N	2012 SRN	\N	Acenaphthene	?	\N	555
Bitumen	8052-42-4	TP548	\N	2012 SRN	\N	Acenaphthylene	?	\N	556
Bitumen	8052-42-4	TP548	\N	2012 SRN	\N	Anthracene	0.183	\N	557
Bitumen	8052-42-4	TP548	\N	2012 SRN	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	0.969	\N	558
Bitumen	8052-42-4	TP548	\N	2012 SRN	\N	Benzo[a]pyrene	2.048	\N	559
Bitumen	8052-42-4	TP548	\N	2012 SRN	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	3.229	\N	560
Bitumen	8052-42-4	TP548	\N	2012 SRN	\N	Benzo[g,h,i]perylene	4.648	\N	561
Bitumen	8052-42-4	TP548	\N	2012 SRN	\N	Benzo[k]fluoranthene	0.436	\N	562
Bitumen	8052-42-4	TP548	\N	2012 SRN	\N	Chrysene/Benzo[a]phenanthrene	1.806	\N	563
Bitumen	8052-42-4	TP548	\N	2012 SRN	\N	Dibenzo[a,h]anthracene	0.671	\N	564
Bitumen	8052-42-4	TP548	\N	2012 SRN	\N	Fluoranthene	0.195	\N	565
Bitumen	8052-42-4	TP548	\N	2012 SRN	\N	Fluorene	?	\N	566
Bitumen	8052-42-4	TP548	\N	2012 SRN	\N	Indeno[1,2,3-cd]pyrene	1.076	\N	567
Bitumen	8052-42-4	TP548	\N	2012 SRN	\N	Naphthalene	?	\N	568
Bitumen	8052-42-4	TP548	\N	2012 SRN	\N	Phenanthrene	1.220	\N	569
Bitumen	8052-42-4	TP548	\N	2012 SRN	\N	Pyrene	1.150	\N	570
Bitumen	92062-05-0	C_BIT04	\N	\N	\N	Acenaphthene	0.114	Ignored	571
Bitumen	92062-05-0	C_BIT04	\N	\N	\N	Acenaphthylene	ND	Ignored	572
Bitumen	92062-05-0	C_BIT04	\N	\N	\N	Anthracene	ND	Ignored	573
Bitumen	92062-05-0	C_BIT04	\N	\N	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	ND	Ignored	574
Bitumen	92062-05-0	C_BIT04	\N	\N	\N	Benzo[a]pyrene	ND	Ignored	575
Bitumen	92062-05-0	C_BIT04	\N	\N	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	ND	Ignored	576
Bitumen	92062-05-0	C_BIT04	\N	\N	\N	Benzo[g,h,i]perylene	0.389	Ignored	577
Bitumen	92062-05-0	C_BIT04	\N	\N	\N	Benzo[k]fluoranthene	ND	Ignored	578
Bitumen	92062-05-0	C_BIT04	\N	\N	\N	Chrysene/Benzo[a]phenanthrene	0.134	Ignored	579
Bitumen	92062-05-0	C_BIT04	\N	\N	\N	Dibenzo[a,h]anthracene	ND	Ignored	580
Bitumen	92062-05-0	C_BIT04	\N	\N	\N	Fluoranthene	0.110	Ignored	581
Bitumen	92062-05-0	C_BIT04	\N	\N	\N	Fluorene	0.615	Ignored	582
Bitumen	92062-05-0	C_BIT04	\N	\N	\N	Indeno[1,2,3-cd]pyrene	ND	Ignored	583
Bitumen	92062-05-0	C_BIT04	\N	\N	\N	Naphthalene	0.371	Ignored	584
Bitumen	92062-05-0	C_BIT04	\N	\N	\N	Phenanthrene	0.386	Ignored	585
Bitumen	92062-05-0	C_BIT04	\N	\N	\N	Pyrene	0.128	Ignored	586
Bitumen	92062-05-0	CON_23	\N	\N	\N	1-Methylnaphthalene	124.469	Ignored	587
Bitumen	92062-05-0	CON_23	\N	\N	\N	2-Methylnaphthalene	201.858	Ignored	588
Bitumen	92062-05-0	CON_23	\N	\N	\N	Acenaphthene	23.916	Ignored	589
Bitumen	92062-05-0	CON_23	\N	\N	\N	Acenaphthylene	0.150	Ignored	590
Bitumen	92062-05-0	CON_23	\N	\N	\N	Anthanthrene	0.586	Ignored	591
Bitumen	92062-05-0	CON_23	\N	\N	\N	Anthracene	15.837	Ignored	592
Bitumen	92062-05-0	CON_23	\N	\N	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	5.838	Ignored	593
Bitumen	92062-05-0	CON_23	\N	\N	\N	Benzo[a]pyrene	1.669	Ignored	594
Bitumen	92062-05-0	CON_23	\N	\N	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	0.524	Ignored	595
Bitumen	92062-05-0	CON_23	\N	\N	\N	Benzo[b]naphtho[2,1-d]thiophene	5.611	Ignored	596
Bitumen	92062-05-0	CON_23	\N	\N	\N	Benzo[c]phenanthrene	0.389	Ignored	597
Bitumen	92062-05-0	CON_23	\N	\N	\N	Benzo[e]pyrene	2.031	Ignored	598
Bitumen	92062-05-0	CON_23	\N	\N	\N	Benzo[g,h,i]fluoranthene	0.260	Ignored	599
Bitumen	92062-05-0	CON_23	\N	\N	\N	Benzo[g,h,i]perylene	2.670	Ignored	600
Bitumen	92062-05-0	CON_23	\N	\N	\N	Benzo[j]fluoranthene	0.321	Ignored	601
Bitumen	92062-05-0	CON_23	\N	\N	\N	Benzo[k]fluoranthene	0.137	Ignored	602
Bitumen	92062-05-0	CON_23	\N	\N	\N	Chrysene/Benzo[a]phenanthrene	8.413	Ignored	603
Bitumen	92062-05-0	CON_23	\N	\N	\N	Coronene	0.699	Ignored	604
Bitumen	92062-05-0	CON_23	\N	\N	\N	Cyclopenta[cd]pyrene	ND	Ignored	605
Bitumen	92062-05-0	CON_23	\N	\N	\N	Dibenzo[a,h]anthracene	0.250	Ignored	606
Bitumen	92062-05-0	CON_23	\N	\N	\N	Fluoranthene	7.695	Ignored	607
Bitumen	92062-05-0	CON_23	\N	\N	\N	Fluorene	14.678	Ignored	608
Bitumen	92062-05-0	CON_23	\N	\N	\N	Indeno[1,2,3-cd]pyrene	0.906	Ignored	609
Bitumen	92062-05-0	CON_23	\N	\N	\N	Naphthalene	62.813	Ignored	610
Bitumen	92062-05-0	CON_23	\N	\N	\N	Perylene	3.375	Ignored	611
Bitumen	92062-05-0	CON_23	\N	\N	\N	Phenanthrene	168.862	Ignored	612
Bitumen	92062-05-0	CON_23	\N	\N	\N	Pyrene	46.974	Ignored	613
Bitumen	92062-05-0	CON_23	\N	\N	\N	Triphenylene	3.320	Ignored	614
Bitumen	92062-05-0	J011	\N	cracked bit	40205	Benzo[a]pyrene	8.100	Incomplete	615
Bitumen	92062-05-0	J011	\N	cracked bit	40205	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	2.890	Incomplete	616
Bitumen	92062-05-0	J011	\N	cracked bit	40205	Benzo[e]pyrene	9.820	Incomplete	617
Bitumen	92062-05-0	J011	\N	cracked bit	40205	Benzo[g,h,i]perylene	17.300	Incomplete	618
Bitumen	92062-05-0	TP523	\N	C	\N	Acenaphthene	0.280	\N	619
Bitumen	92062-05-0	TP523	\N	C	\N	Acenaphthylene	0.010	\N	620
Bitumen	92062-05-0	TP523	\N	C	\N	Anthracene	0.360	\N	621
Bitumen	92062-05-0	TP523	\N	C	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	1.300	\N	622
Bitumen	92062-05-0	TP523	\N	C	\N	Benzo[a]pyrene	3.120	\N	623
Bitumen	92062-05-0	TP523	\N	C	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	1.630	\N	624
Bitumen	92062-05-0	TP523	\N	C	\N	Benzo[g,h,i]perylene	7.240	\N	625
Bitumen	92062-05-0	TP523	\N	C	\N	Benzo[k]fluoranthene	0.600	\N	626
Bitumen	92062-05-0	TP523	\N	C	\N	Chrysene/Benzo[a]phenanthrene	1.230	\N	627
Bitumen	92062-05-0	TP523	\N	C	\N	Dibenzo[a,h]anthracene	2.340	\N	628
Bitumen	92062-05-0	TP523	\N	C	\N	Fluoranthene	0.660	\N	629
Bitumen	92062-05-0	TP523	\N	C	\N	Fluorene	0.190	\N	630
Bitumen	92062-05-0	TP523	\N	C	\N	Indeno[1,2,3-cd]pyrene	2.460	\N	631
Bitumen	92062-05-0	TP523	\N	C	\N	Naphthalene	0.530	\N	632
Bitumen	92062-05-0	TP523	\N	C	\N	Phenanthrene	0.640	\N	633
Bitumen	92062-05-0	TP523	\N	C	\N	Pyrene	1.970	\N	634
Bitumen	92062-05-0	TP524	\N	F	\N	Acenaphthene	0.070	\N	635
Bitumen	92062-05-0	TP524	\N	F	\N	Acenaphthylene	0.010	\N	636
Bitumen	92062-05-0	TP524	\N	F	\N	Anthracene	0.100	\N	637
Bitumen	92062-05-0	TP524	\N	F	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	1.130	\N	638
Bitumen	92062-05-0	TP524	\N	F	\N	Benzo[a]pyrene	9.490	\N	639
Bitumen	92062-05-0	TP524	\N	F	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	4.720	\N	640
Bitumen	92062-05-0	TP524	\N	F	\N	Benzo[g,h,i]perylene	20.700	\N	641
Bitumen	92062-05-0	TP524	\N	F	\N	Benzo[k]fluoranthene	1.040	\N	642
Bitumen	92062-05-0	TP524	\N	F	\N	Chrysene/Benzo[a]phenanthrene	1.940	\N	643
Bitumen	92062-05-0	TP524	\N	F	\N	Dibenzo[a,h]anthracene	7.940	\N	644
Bitumen	92062-05-0	TP524	\N	F	\N	Fluoranthene	1.020	\N	645
Bitumen	92062-05-0	TP524	\N	F	\N	Fluorene	0.080	\N	646
Bitumen	92062-05-0	TP524	\N	F	\N	Indeno[1,2,3-cd]pyrene	7.430	\N	647
Bitumen	92062-05-0	TP524	\N	F	\N	Naphthalene	0.090	\N	648
Bitumen	92062-05-0	TP524	\N	F	\N	Phenanthrene	0.320	\N	649
Bitumen	92062-05-0	TP524	\N	F	\N	Pyrene	1.110	\N	650
Bitumen	92062-05-0	TP525	\N	G	\N	Acenaphthene	0.360	\N	651
Bitumen	92062-05-0	TP525	\N	G	\N	Acenaphthylene	0.090	\N	652
Bitumen	92062-05-0	TP525	\N	G	\N	Anthracene	0.440	\N	653
Bitumen	92062-05-0	TP525	\N	G	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	1.110	\N	654
Bitumen	92062-05-0	TP525	\N	G	\N	Benzo[a]pyrene	1.500	\N	655
Bitumen	92062-05-0	TP525	\N	G	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	1.200	\N	656
Bitumen	92062-05-0	TP525	\N	G	\N	Benzo[g,h,i]perylene	4.230	\N	657
Bitumen	92062-05-0	TP525	\N	G	\N	Benzo[k]fluoranthene	0.300	\N	658
Bitumen	92062-05-0	TP525	\N	G	\N	Chrysene/Benzo[a]phenanthrene	1.560	\N	659
Bitumen	92062-05-0	TP525	\N	G	\N	Dibenzo[a,h]anthracene	1.350	\N	660
Bitumen	92062-05-0	TP525	\N	G	\N	Fluoranthene	0.720	\N	661
Bitumen	92062-05-0	TP525	\N	G	\N	Fluorene	0.570	\N	662
Bitumen	92062-05-0	TP525	\N	G	\N	Indeno[1,2,3-cd]pyrene	1.020	\N	663
Bitumen	92062-05-0	TP525	\N	G	\N	Naphthalene	0.680	\N	664
Bitumen	92062-05-0	TP525	\N	G	\N	Phenanthrene	2.300	\N	665
Bitumen	92062-05-0	TP525	\N	G	\N	Pyrene	2.110	\N	666
Bitumen	92062-05-0	TP539	\N	2003 Visbroken (thermally cracked) 20/30	\N	Acenaphthene	1.200	\N	667
Bitumen	92062-05-0	TP539	\N	2003 Visbroken (thermally cracked) 20/30	\N	Acenaphthylene	0.360	\N	668
Bitumen	92062-05-0	TP539	\N	2003 Visbroken (thermally cracked) 20/30	\N	Anthracene	1.400	\N	669
Bitumen	92062-05-0	TP539	\N	2003 Visbroken (thermally cracked) 20/30	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	1.400	\N	670
Bitumen	92062-05-0	TP539	\N	2003 Visbroken (thermally cracked) 20/30	\N	Benzo[a]fluorene	ND	\N	671
Bitumen	92062-05-0	TP539	\N	2003 Visbroken (thermally cracked) 20/30	\N	Benzo[a]pyrene	2.000	\N	672
Bitumen	92062-05-0	TP539	\N	2003 Visbroken (thermally cracked) 20/30	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	1.100	\N	673
Bitumen	92062-05-0	TP539	\N	2003 Visbroken (thermally cracked) 20/30	\N	Benzo[b]fluorene	ND	\N	674
Bitumen	92062-05-0	TP539	\N	2003 Visbroken (thermally cracked) 20/30	\N	Benzo[e]pyrene	0.370	\N	675
Bitumen	92062-05-0	TP539	\N	2003 Visbroken (thermally cracked) 20/30	\N	Benzo[g,h,i]perylene	3.100	\N	676
Bitumen	92062-05-0	TP539	\N	2003 Visbroken (thermally cracked) 20/30	\N	Benzo[k]fluoranthene	0.160	\N	677
Bitumen	92062-05-0	TP539	\N	2003 Visbroken (thermally cracked) 20/30	\N	Chrysene/Benzo[a]phenanthrene	1.900	\N	678
Bitumen	92062-05-0	TP539	\N	2003 Visbroken (thermally cracked) 20/30	\N	Dibenzo[a,h]anthracene	0.860	\N	679
Bitumen	92062-05-0	TP539	\N	2003 Visbroken (thermally cracked) 20/30	\N	Fluoranthene	0.590	\N	680
Bitumen	92062-05-0	TP539	\N	2003 Visbroken (thermally cracked) 20/30	\N	Fluorene	1.900	\N	681
Bitumen	92062-05-0	TP539	\N	2003 Visbroken (thermally cracked) 20/30	\N	Indeno[1,2,3-cd]pyrene	0.740	\N	682
Bitumen	92062-05-0	TP539	\N	2003 Visbroken (thermally cracked) 20/30	\N	Naphthalene	5.400	\N	683
Bitumen	92062-05-0	TP539	\N	2003 Visbroken (thermally cracked) 20/30	\N	Perylene	ND	\N	684
Bitumen	92062-05-0	TP539	\N	2003 Visbroken (thermally cracked) 20/30	\N	Phenanthrene	7.700	\N	685
Bitumen	92062-05-0	TP539	\N	2003 Visbroken (thermally cracked) 20/30	\N	Pyrene	3.700	\N	686
Bitumen	92062-05-0	TP539	\N	2003 Visbroken (thermally cracked) 20/30	\N	Triphenylene	0.079	\N	687
Bitumen	92062-05-0	TP549	\N	2012 Dist of residue from thermally cracking	\N	Acenaphthene	?	\N	688
Bitumen	92062-05-0	TP549	\N	2012 Dist of residue from thermally cracking	\N	Acenaphthylene	?	\N	689
Bitumen	92062-05-0	TP549	\N	2012 Dist of residue from thermally cracking	\N	Anthracene	0.674	\N	690
Bitumen	92062-05-0	TP549	\N	2012 Dist of residue from thermally cracking	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	2.052	\N	691
Bitumen	92062-05-0	TP549	\N	2012 Dist of residue from thermally cracking	\N	Benzo[a]pyrene	4.145	\N	692
Bitumen	92062-05-0	TP549	\N	2012 Dist of residue from thermally cracking	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	1.987	\N	693
Bitumen	92062-05-0	TP549	\N	2012 Dist of residue from thermally cracking	\N	Benzo[g,h,i]perylene	6.893	\N	694
Bitumen	92062-05-0	TP549	\N	2012 Dist of residue from thermally cracking	\N	Benzo[k]fluoranthene	0.465	\N	695
Bitumen	92062-05-0	TP549	\N	2012 Dist of residue from thermally cracking	\N	Chrysene/Benzo[a]phenanthrene	2.922	\N	696
CGO	64741-59-9	G4_595	\N	\N	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	25.500	\N	697
Bitumen	92062-05-0	TP549	\N	2012 Dist of residue from thermally cracking	\N	Dibenzo[a,h]anthracene	0.888	\N	698
Bitumen	92062-05-0	TP549	\N	2012 Dist of residue from thermally cracking	\N	Fluoranthene	0.494	\N	699
Bitumen	92062-05-0	TP549	\N	2012 Dist of residue from thermally cracking	\N	Fluorene	?	\N	700
Bitumen	92062-05-0	TP549	\N	2012 Dist of residue from thermally cracking	\N	Indeno[1,2,3-cd]pyrene	1.791	\N	701
Bitumen	92062-05-0	TP549	\N	2012 Dist of residue from thermally cracking	\N	Naphthalene	?	\N	702
Bitumen	92062-05-0	TP549	\N	2012 Dist of residue from thermally cracking	\N	Phenanthrene	3.365	\N	703
Bitumen	92062-05-0	TP549	\N	2012 Dist of residue from thermally cracking	\N	Pyrene	3.223	\N	704
Bitumen	92062-05-0	TP550	\N	2012 Dist of residue from thermally cracking	\N	Acenaphthene	?	\N	705
Bitumen	92062-05-0	TP550	\N	2012 Dist of residue from thermally cracking	\N	Acenaphthylene	?	\N	706
Bitumen	92062-05-0	TP550	\N	2012 Dist of residue from thermally cracking	\N	Anthracene	0.757	\N	707
Bitumen	92062-05-0	TP550	\N	2012 Dist of residue from thermally cracking	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	2.242	\N	708
Bitumen	92062-05-0	TP550	\N	2012 Dist of residue from thermally cracking	\N	Benzo[a]pyrene	4.197	\N	709
Bitumen	92062-05-0	TP550	\N	2012 Dist of residue from thermally cracking	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	2.342	\N	710
Bitumen	92062-05-0	TP550	\N	2012 Dist of residue from thermally cracking	\N	Benzo[g,h,i]perylene	6.713	\N	711
Bitumen	92062-05-0	TP550	\N	2012 Dist of residue from thermally cracking	\N	Benzo[k]fluoranthene	0.604	\N	712
Bitumen	92062-05-0	TP550	\N	2012 Dist of residue from thermally cracking	\N	Chrysene/Benzo[a]phenanthrene	3.289	\N	713
Bitumen	92062-05-0	TP550	\N	2012 Dist of residue from thermally cracking	\N	Dibenzo[a,h]anthracene	0.905	\N	714
Bitumen	92062-05-0	TP550	\N	2012 Dist of residue from thermally cracking	\N	Fluoranthene	0.525	\N	715
Bitumen	92062-05-0	TP550	\N	2012 Dist of residue from thermally cracking	\N	Fluorene	?	\N	716
Bitumen	92062-05-0	TP550	\N	2012 Dist of residue from thermally cracking	\N	Indeno[1,2,3-cd]pyrene	1.722	\N	717
Bitumen	92062-05-0	TP550	\N	2012 Dist of residue from thermally cracking	\N	Naphthalene	?	\N	718
Bitumen	92062-05-0	TP550	\N	2012 Dist of residue from thermally cracking	\N	Phenanthrene	4.239	\N	719
Bitumen	92062-05-0	TP550	\N	2012 Dist of residue from thermally cracking	\N	Pyrene	3.145	\N	720
Bitumen	92062-05-0	TP551	\N	2012 Dist of residue from thermally cracking	\N	Acenaphthene	?	\N	721
Bitumen	92062-05-0	TP551	\N	2012 Dist of residue from thermally cracking	\N	Acenaphthylene	?	\N	722
Bitumen	92062-05-0	TP551	\N	2012 Dist of residue from thermally cracking	\N	Anthracene	1.118	\N	723
Bitumen	92062-05-0	TP551	\N	2012 Dist of residue from thermally cracking	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	2.714	\N	724
Bitumen	92062-05-0	TP551	\N	2012 Dist of residue from thermally cracking	\N	Benzo[a]pyrene	4.524	\N	725
Bitumen	92062-05-0	TP551	\N	2012 Dist of residue from thermally cracking	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	2.524	\N	726
Bitumen	92062-05-0	TP551	\N	2012 Dist of residue from thermally cracking	\N	Benzo[g,h,i]perylene	6.644	\N	727
Bitumen	92062-05-0	TP551	\N	2012 Dist of residue from thermally cracking	\N	Benzo[k]fluoranthene	0.584	\N	728
Bitumen	92062-05-0	TP551	\N	2012 Dist of residue from thermally cracking	\N	Chrysene/Benzo[a]phenanthrene	3.978	\N	729
Bitumen	92062-05-0	TP551	\N	2012 Dist of residue from thermally cracking	\N	Dibenzo[a,h]anthracene	0.849	\N	730
Bitumen	92062-05-0	TP551	\N	2012 Dist of residue from thermally cracking	\N	Fluoranthene	0.672	\N	731
Bitumen	92062-05-0	TP551	\N	2012 Dist of residue from thermally cracking	\N	Fluorene	?	\N	732
Bitumen	92062-05-0	TP551	\N	2012 Dist of residue from thermally cracking	\N	Indeno[1,2,3-cd]pyrene	1.161	\N	733
Bitumen	92062-05-0	TP551	\N	2012 Dist of residue from thermally cracking	\N	Naphthalene	?	\N	734
Bitumen	92062-05-0	TP551	\N	2012 Dist of residue from thermally cracking	\N	Phenanthrene	6.820	\N	735
Bitumen	92062-05-0	TP551	\N	2012 Dist of residue from thermally cracking	\N	Pyrene	4.258	\N	736
Bitumen	92062-05-0	TP552	\N	2012 Dist of residue from thermally cracking	\N	Acenaphthene	?	\N	737
Bitumen	92062-05-0	TP552	\N	2012 Dist of residue from thermally cracking	\N	Acenaphthylene	?	\N	738
Bitumen	92062-05-0	TP552	\N	2012 Dist of residue from thermally cracking	\N	Anthracene	1.016	\N	739
Bitumen	92062-05-0	TP552	\N	2012 Dist of residue from thermally cracking	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	3.979	\N	740
Bitumen	92062-05-0	TP552	\N	2012 Dist of residue from thermally cracking	\N	Benzo[a]pyrene	6.714	\N	741
Bitumen	92062-05-0	TP552	\N	2012 Dist of residue from thermally cracking	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	2.828	\N	742
Bitumen	92062-05-0	TP552	\N	2012 Dist of residue from thermally cracking	\N	Benzo[g,h,i]perylene	8.010	\N	743
Bitumen	92062-05-0	TP552	\N	2012 Dist of residue from thermally cracking	\N	Benzo[k]fluoranthene	0.591	\N	744
Bitumen	92062-05-0	TP552	\N	2012 Dist of residue from thermally cracking	\N	Chrysene/Benzo[a]phenanthrene	4.913	\N	745
Bitumen	92062-05-0	TP552	\N	2012 Dist of residue from thermally cracking	\N	Dibenzo[a,h]anthracene	1.427	\N	746
Bitumen	92062-05-0	TP552	\N	2012 Dist of residue from thermally cracking	\N	Fluoranthene	0.969	\N	747
Bitumen	92062-05-0	TP552	\N	2012 Dist of residue from thermally cracking	\N	Fluorene	?	\N	748
Bitumen	92062-05-0	TP552	\N	2012 Dist of residue from thermally cracking	\N	Indeno[1,2,3-cd]pyrene	2.503	\N	749
Bitumen	92062-05-0	TP552	\N	2012 Dist of residue from thermally cracking	\N	Naphthalene	?	\N	750
Bitumen	92062-05-0	TP552	\N	2012 Dist of residue from thermally cracking	\N	Phenanthrene	4.035	\N	751
Bitumen	92062-05-0	TP552	\N	2012 Dist of residue from thermally cracking	\N	Pyrene	6.882	\N	752
Bitumen	92062-05-0	TP553	\N	2012 Dist of residue from thermally cracking	\N	Acenaphthene	?	\N	753
Bitumen	92062-05-0	TP553	\N	2012 Dist of residue from thermally cracking	\N	Acenaphthylene	?	\N	754
Bitumen	92062-05-0	TP553	\N	2012 Dist of residue from thermally cracking	\N	Anthracene	1.292	\N	755
Bitumen	92062-05-0	TP553	\N	2012 Dist of residue from thermally cracking	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	3.905	\N	756
Bitumen	92062-05-0	TP553	\N	2012 Dist of residue from thermally cracking	\N	Benzo[a]pyrene	6.591	\N	757
Bitumen	92062-05-0	TP553	\N	2012 Dist of residue from thermally cracking	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	2.392	\N	758
Bitumen	92062-05-0	TP553	\N	2012 Dist of residue from thermally cracking	\N	Benzo[g,h,i]perylene	7.145	\N	759
Bitumen	92062-05-0	TP553	\N	2012 Dist of residue from thermally cracking	\N	Benzo[k]fluoranthene	0.596	\N	760
Bitumen	92062-05-0	TP553	\N	2012 Dist of residue from thermally cracking	\N	Chrysene/Benzo[a]phenanthrene	4.895	\N	761
Bitumen	92062-05-0	TP553	\N	2012 Dist of residue from thermally cracking	\N	Dibenzo[a,h]anthracene	1.284	\N	762
Bitumen	92062-05-0	TP553	\N	2012 Dist of residue from thermally cracking	\N	Fluoranthene	1.360	\N	763
Bitumen	92062-05-0	TP553	\N	2012 Dist of residue from thermally cracking	\N	Fluorene	?	\N	764
Bitumen	92062-05-0	TP553	\N	2012 Dist of residue from thermally cracking	\N	Indeno[1,2,3-cd]pyrene	1.743	\N	765
Bitumen	92062-05-0	TP553	\N	2012 Dist of residue from thermally cracking	\N	Naphthalene	?	\N	766
Bitumen	92062-05-0	TP553	\N	2012 Dist of residue from thermally cracking	\N	Phenanthrene	6.685	\N	767
Bitumen	92062-05-0	TP553	\N	2012 Dist of residue from thermally cracking	\N	Pyrene	9.305	\N	768
Bitumen	92062-05-0	TP554	\N	2012 Dist of residue from thermally cracking	\N	Acenaphthene	?	\N	769
Bitumen	92062-05-0	TP554	\N	2012 Dist of residue from thermally cracking	\N	Acenaphthylene	?	\N	770
Bitumen	92062-05-0	TP554	\N	2012 Dist of residue from thermally cracking	\N	Anthracene	1.730	\N	771
Bitumen	92062-05-0	TP554	\N	2012 Dist of residue from thermally cracking	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	5.816	\N	772
Bitumen	92062-05-0	TP554	\N	2012 Dist of residue from thermally cracking	\N	Benzo[a]pyrene	8.444	\N	773
Bitumen	92062-05-0	TP554	\N	2012 Dist of residue from thermally cracking	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	3.048	\N	774
Bitumen	92062-05-0	TP554	\N	2012 Dist of residue from thermally cracking	\N	Benzo[g,h,i]perylene	7.506	\N	775
Bitumen	92062-05-0	TP554	\N	2012 Dist of residue from thermally cracking	\N	Benzo[k]fluoranthene	0.644	\N	776
Bitumen	92062-05-0	TP554	\N	2012 Dist of residue from thermally cracking	\N	Chrysene/Benzo[a]phenanthrene	7.051	\N	777
Bitumen	92062-05-0	TP554	\N	2012 Dist of residue from thermally cracking	\N	Dibenzo[a,h]anthracene	1.726	\N	778
Bitumen	92062-05-0	TP554	\N	2012 Dist of residue from thermally cracking	\N	Fluoranthene	1.634	\N	779
Bitumen	92062-05-0	TP554	\N	2012 Dist of residue from thermally cracking	\N	Fluorene	?	\N	780
Bitumen	92062-05-0	TP554	\N	2012 Dist of residue from thermally cracking	\N	Indeno[1,2,3-cd]pyrene	2.135	\N	781
Bitumen	92062-05-0	TP554	\N	2012 Dist of residue from thermally cracking	\N	Naphthalene	?	\N	782
Bitumen	92062-05-0	TP554	\N	2012 Dist of residue from thermally cracking	\N	Phenanthrene	9.341	\N	783
Bitumen	92062-05-0	TP554	\N	2012 Dist of residue from thermally cracking	\N	Pyrene	11.994	\N	784
CGO	64741-59-9	G4_576	\N	\N	\N	Acenaphthene	2170.000	\N	785
CGO	64741-59-9	G4_576	\N	\N	\N	Acenaphthylene	84.200	\N	786
CGO	64741-59-9	G4_576	\N	\N	\N	Anthracene	491.000	\N	787
CGO	64741-59-9	G4_576	\N	\N	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	ND	\N	788
CGO	64741-59-9	G4_576	\N	\N	\N	Benzo[a]pyrene	ND	\N	789
CGO	64741-59-9	G4_576	\N	\N	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	ND	\N	790
CGO	64741-59-9	G4_576	\N	\N	\N	Benzo[g,h,i]perylene	ND	\N	791
CGO	64741-59-9	G4_576	\N	\N	\N	Benzo[k]fluoranthene	ND	\N	792
CGO	64741-59-9	G4_576	\N	\N	\N	Chrysene/Benzo[a]phenanthrene	ND	\N	793
CGO	64741-59-9	G4_576	\N	\N	\N	Dibenzo[a,h]anthracene	ND	\N	794
CGO	64741-59-9	G4_576	\N	\N	\N	Fluoranthene	1.810	\N	795
CGO	64741-59-9	G4_576	\N	\N	\N	Fluorene	2410.000	\N	796
CGO	64741-59-9	G4_576	\N	\N	\N	Indeno[1,2,3-cd]pyrene	ND	\N	797
CGO	64741-59-9	G4_576	\N	\N	\N	Naphthalene	2420.000	\N	798
CGO	64741-59-9	G4_576	\N	\N	\N	Phenanthrene	9740.000	\N	799
CGO	64741-59-9	G4_576	\N	\N	\N	Pyrene	11.800	\N	800
CGO	64741-59-9	G4_578	\N	\N	\N	Acenaphthene	1330.000	\N	801
CGO	64741-59-9	G4_578	\N	\N	\N	Acenaphthylene	42.500	\N	802
CGO	64741-59-9	G4_578	\N	\N	\N	Anthracene	56.200	\N	803
CGO	64741-59-9	G4_578	\N	\N	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	ND	\N	804
CGO	64741-59-9	G4_578	\N	\N	\N	Benzo[a]pyrene	ND	\N	805
CGO	64741-59-9	G4_578	\N	\N	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	ND	\N	806
CGO	64741-59-9	G4_578	\N	\N	\N	Benzo[g,h,i]perylene	ND	\N	807
CGO	64741-59-9	G4_578	\N	\N	\N	Benzo[k]fluoranthene	ND	\N	808
CGO	64741-59-9	G4_578	\N	\N	\N	Chrysene/Benzo[a]phenanthrene	ND	\N	809
CGO	64741-59-9	G4_578	\N	\N	\N	Dibenzo[a,h]anthracene	ND	\N	810
CGO	64741-59-9	G4_578	\N	\N	\N	Fluoranthene	0.852	\N	811
CGO	64741-59-9	G4_578	\N	\N	\N	Fluorene	1030.000	\N	812
CGO	64741-59-9	G4_578	\N	\N	\N	Indeno[1,2,3-cd]pyrene	ND	\N	813
CGO	64741-59-9	G4_578	\N	\N	\N	Naphthalene	9450.000	\N	814
CGO	64741-59-9	G4_578	\N	\N	\N	Phenanthrene	539.000	\N	815
CGO	64741-59-9	G4_578	\N	\N	\N	Pyrene	1.830	\N	816
CGO	64741-59-9	G4_579	\N	\N	\N	Acenaphthene	432.000	\N	817
CGO	64741-59-9	G4_579	\N	\N	\N	Acenaphthylene	11.500	\N	818
CGO	64741-59-9	G4_579	\N	\N	\N	Anthracene	846.000	\N	819
CGO	64741-59-9	G4_579	\N	\N	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	78.900	\N	820
CGO	64741-59-9	G4_579	\N	\N	\N	Benzo[a]pyrene	3.800	\N	821
CGO	64741-59-9	G4_579	\N	\N	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	3.770	\N	822
CGO	64741-59-9	G4_579	\N	\N	\N	Benzo[g,h,i]perylene	0.324	\N	823
CGO	64741-59-9	G4_579	\N	\N	\N	Benzo[k]fluoranthene	1.030	\N	824
CGO	64741-59-9	G4_579	\N	\N	\N	Chrysene/Benzo[a]phenanthrene	128.000	\N	825
CGO	64741-59-9	G4_579	\N	\N	\N	Dibenzo[a,h]anthracene	0.247	\N	826
CGO	64741-59-9	G4_579	\N	\N	\N	Fluoranthene	277.000	\N	827
CGO	64741-59-9	G4_579	\N	\N	\N	Fluorene	886.000	\N	828
CGO	64741-59-9	G4_579	\N	\N	\N	Indeno[1,2,3-cd]pyrene	0.131	\N	829
CGO	64741-59-9	G4_579	\N	\N	\N	Naphthalene	924.000	\N	830
CGO	64741-59-9	G4_579	\N	\N	\N	Phenanthrene	7410.000	\N	831
CGO	64741-59-9	G4_579	\N	\N	\N	Pyrene	842.000	\N	832
CGO	64741-59-9	G4_595	\N	\N	\N	Acenaphthene	872.000	\N	833
CGO	64741-59-9	G4_595	\N	\N	\N	Acenaphthylene	16.300	\N	834
CGO	64741-59-9	G4_595	\N	\N	\N	Anthracene	367.000	\N	835
CGO	64741-59-9	G4_595	\N	\N	\N	Benzo[a]pyrene	1.040	\N	836
CGO	64741-59-9	G4_595	\N	\N	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	1.040	\N	837
CGO	64741-59-9	G4_595	\N	\N	\N	Benzo[g,h,i]perylene	0.134	\N	838
CGO	64741-59-9	G4_595	\N	\N	\N	Benzo[k]fluoranthene	0.327	\N	839
CGO	64741-59-9	G4_595	\N	\N	\N	Chrysene/Benzo[a]phenanthrene	43.400	\N	840
CGO	64741-59-9	G4_595	\N	\N	\N	Dibenzo[a,h]anthracene	ND	\N	841
CGO	64741-59-9	G4_595	\N	\N	\N	Fluoranthene	73.500	\N	842
CGO	64741-59-9	G4_595	\N	\N	\N	Fluorene	938.000	\N	843
CGO	64741-59-9	G4_595	\N	\N	\N	Indeno[1,2,3-cd]pyrene	ND	\N	844
CGO	64741-59-9	G4_595	\N	\N	\N	Naphthalene	2500.000	\N	845
CGO	64741-59-9	G4_595	\N	\N	\N	Phenanthrene	2820.000	\N	846
CGO	64741-59-9	G4_595	\N	\N	\N	Pyrene	328.000	\N	847
CGO	64741-82-8	G4_604	\N	\N	\N	Acenaphthene	110.000	\N	848
CGO	64741-82-8	G4_604	\N	\N	\N	Acenaphthylene	13.100	\N	849
CGO	64741-82-8	G4_604	\N	\N	\N	Anthracene	123.000	\N	850
CGO	64741-82-8	G4_604	\N	\N	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	25.500	\N	851
CGO	64741-82-8	G4_604	\N	\N	\N	Benzo[a]pyrene	0.131	\N	852
CGO	64741-82-8	G4_604	\N	\N	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	0.153	\N	853
CGO	64741-82-8	G4_604	\N	\N	\N	Benzo[g,h,i]perylene	ND	\N	854
CGO	64741-82-8	G4_604	\N	\N	\N	Benzo[k]fluoranthene	ND	\N	855
CGO	64741-82-8	G4_604	\N	\N	\N	Chrysene/Benzo[a]phenanthrene	53.200	\N	856
CGO	64741-82-8	G4_604	\N	\N	\N	Dibenzo[a,h]anthracene	ND	\N	857
CGO	64741-82-8	G4_604	\N	\N	\N	Fluoranthene	55.700	\N	858
CGO	64741-82-8	G4_604	\N	\N	\N	Fluorene	104.000	\N	859
CGO	64741-82-8	G4_604	\N	\N	\N	Indeno[1,2,3-cd]pyrene	ND	\N	860
CGO	64741-82-8	G4_604	\N	\N	\N	Naphthalene	336.000	\N	861
CGO	64741-82-8	G4_604	\N	\N	\N	Phenanthrene	321.000	\N	862
CGO	64741-82-8	G4_604	\N	\N	\N	Pyrene	250.000	\N	863
OGO	64742-46-7	CON_07	\N	\N	\N	1-Methylnaphthalene	161.060	\N	864
OGO	64742-46-7	CON_07	\N	\N	\N	2-Methylnaphthalene	246.203	\N	865
OGO	64742-46-7	CON_07	\N	\N	\N	Acenaphthene	11.423	\N	866
OGO	64742-46-7	CON_07	\N	\N	\N	Acenaphthylene	0.629	\N	867
OGO	64742-46-7	CON_07	\N	\N	\N	Anthanthrene	ND	\N	868
OGO	64742-46-7	CON_07	\N	\N	\N	Anthracene	ND	\N	869
OGO	64742-46-7	CON_07	\N	\N	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	0.013	\N	870
OGO	64742-46-7	CON_07	\N	\N	\N	Benzo[a]pyrene	0.004	\N	871
OGO	64742-46-7	CON_07	\N	\N	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	0.012	\N	872
OGO	64742-46-7	CON_07	\N	\N	\N	Benzo[b]naphtho[2,1-d]thiophene	0.001	\N	873
OGO	64742-46-7	CON_07	\N	\N	\N	Benzo[c]phenanthrene	0.058	\N	874
OGO	64742-46-7	CON_07	\N	\N	\N	Benzo[e]pyrene	0.107	\N	875
OGO	64742-46-7	CON_07	\N	\N	\N	Benzo[g,h,i]fluoranthene	0.055	\N	876
OGO	64742-46-7	CON_07	\N	\N	\N	Benzo[g,h,i]perylene	0.012	\N	877
OGO	64742-46-7	CON_07	\N	\N	\N	Benzo[j]fluoranthene	0.001	\N	878
OGO	64742-46-7	CON_07	\N	\N	\N	Benzo[k]fluoranthene	0.005	\N	879
OGO	64742-46-7	CON_07	\N	\N	\N	Chrysene/Benzo[a]phenanthrene	0.108	\N	880
OGO	64742-46-7	CON_07	\N	\N	\N	Coronene	0.001	\N	881
OGO	64742-46-7	CON_07	\N	\N	\N	Cyclopenta[cd]pyrene	ND	\N	882
OGO	64742-46-7	CON_07	\N	\N	\N	Dibenzo[a,h]anthracene	0.001	\N	883
OGO	64742-46-7	CON_07	\N	\N	\N	Fluoranthene	0.157	\N	884
OGO	64742-46-7	CON_07	\N	\N	\N	Fluorene	34.389	\N	885
OGO	64742-46-7	CON_07	\N	\N	\N	Indeno[1,2,3-cd]pyrene	ND	\N	886
OGO	64742-46-7	CON_07	\N	\N	\N	Naphthalene	56.682	\N	887
OGO	64742-46-7	CON_07	\N	\N	\N	Perylene	0.001	\N	888
OGO	64742-46-7	CON_07	\N	\N	\N	Phenanthrene	30.687	\N	889
OGO	64742-46-7	CON_07	\N	\N	\N	Pyrene	17.622	\N	890
OGO	64742-46-7	CON_07	\N	\N	\N	Triphenylene	0.378	\N	891
OGO	64742-46-7	J072	\N	P 1219076	40953	Anthracene	0.001	\N	892
OGO	64742-46-7	J072	\N	P 1219076	40953	Benzo[a]pyrene	ND	\N	893
OGO	64742-46-7	J072	\N	P 1219076	40953	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	ND	\N	894
OGO	64742-46-7	J072	\N	P 1219076	40953	Benzo[e]pyrene	ND	\N	895
OGO	64742-46-7	J072	\N	P 1219076	40953	Benzo[g,h,i]perylene	ND	\N	896
OGO	64742-46-7	J072	\N	P 1219076	40953	Benzo[j]fluoranthene	ND	\N	897
OGO	64742-46-7	J072	\N	P 1219076	40953	Benzo[k]fluoranthene	ND	\N	898
OGO	64742-46-7	J072	\N	P 1219076	40953	Coronene	ND	\N	899
OGO	64742-46-7	J072	\N	P 1219076	40953	Dibenzo[a,h]anthracene	ND	\N	900
OGO	64742-46-7	J072	\N	P 1219076	40953	Indeno[1,2,3-cd]pyrene	ND	\N	901
OGO	64742-46-7	J072	\N	P 1219076	40953	Perylene	ND	\N	902
OGO	64742-46-7	J072	\N	P 1219076	40953	Triphenylene	ND	\N	903
OGO	64742-46-7	J072	\N	P 1235659	40997	Anthracene	0.001	\N	904
OGO	64742-46-7	J072	\N	P 1235659	40997	Benzo[a]pyrene	ND	\N	905
OGO	64742-46-7	J072	\N	P 1235659	40997	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	ND	\N	906
OGO	64742-46-7	J072	\N	P 1235659	40997	Benzo[e]pyrene	ND	\N	907
OGO	64742-46-7	J072	\N	P 1235659	40997	Benzo[g,h,i]perylene	ND	\N	908
OGO	64742-46-7	J072	\N	P 1235659	40997	Benzo[j]fluoranthene	ND	\N	909
OGO	64742-46-7	J072	\N	P 1235659	40997	Benzo[k]fluoranthene	ND	\N	910
OGO	64742-46-7	J072	\N	P 1235659	40997	Coronene	ND	\N	911
OGO	64742-46-7	J072	\N	P 1235659	40997	Dibenzo[a,h]anthracene	ND	\N	912
OGO	64742-46-7	J072	\N	P 1235659	40997	Indeno[1,2,3-cd]pyrene	ND	\N	913
OGO	64742-46-7	J072	\N	P 1235659	40997	Perylene	ND	\N	914
OGO	64742-46-7	J072	\N	P 1235659	40997	Triphenylene	ND	\N	915
OGO	64742-46-7	J072	\N	P 1252625	41044	Anthracene	0.002	\N	916
OGO	64742-46-7	J072	\N	P 1252625	41044	Benzo[a]pyrene	ND	\N	917
OGO	64742-46-7	J072	\N	P 1252625	41044	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	ND	\N	918
OGO	64742-46-7	J072	\N	P 1252625	41044	Benzo[e]pyrene	ND	\N	919
OGO	64742-46-7	J072	\N	P 1252625	41044	Benzo[g,h,i]perylene	0.001	\N	920
OGO	64742-46-7	J072	\N	P 1252625	41044	Benzo[j]fluoranthene	ND	\N	921
OGO	64742-46-7	J072	\N	P 1252625	41044	Benzo[k]fluoranthene	ND	\N	922
OGO	64742-46-7	J072	\N	P 1252625	41044	Coronene	ND	\N	923
OGO	64742-46-7	J072	\N	P 1252625	41044	Dibenzo[a,h]anthracene	ND	\N	924
OGO	64742-46-7	J072	\N	P 1252625	41044	Indeno[1,2,3-cd]pyrene	ND	\N	925
OGO	64742-46-7	J072	\N	P 1252625	41044	Perylene	ND	\N	926
OGO	64742-46-7	J072	\N	P 1252625	41044	Triphenylene	ND	\N	927
OGO	64742-80-9	CON_09	\N	\N	\N	1-Methylnaphthalene	262.502	\N	928
OGO	64742-80-9	CON_09	\N	\N	\N	2-Methylnaphthalene	355.936	\N	929
OGO	64742-80-9	CON_09	\N	\N	\N	Acenaphthene	29.330	\N	930
OGO	64742-80-9	CON_09	\N	\N	\N	Acenaphthylene	0.538	\N	931
OGO	64742-80-9	CON_09	\N	\N	\N	Anthanthrene	0.007	\N	932
OGO	64742-80-9	CON_09	\N	\N	\N	Anthracene	ND	\N	933
OGO	64742-80-9	CON_09	\N	\N	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	0.270	\N	934
OGO	64742-80-9	CON_09	\N	\N	\N	Benzo[a]pyrene	0.055	\N	935
OGO	64742-80-9	CON_09	\N	\N	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	0.126	\N	936
OGO	64742-80-9	CON_09	\N	\N	\N	Benzo[b]naphtho[2,1-d]thiophene	0.003	\N	937
OGO	64742-80-9	CON_09	\N	\N	\N	Benzo[c]phenanthrene	0.242	\N	938
OGO	64742-80-9	CON_09	\N	\N	\N	Benzo[e]pyrene	0.319	\N	939
OGO	64742-80-9	CON_09	\N	\N	\N	Benzo[g,h,i]fluoranthene	0.247	\N	940
OGO	64742-80-9	CON_09	\N	\N	\N	Benzo[g,h,i]perylene	0.060	\N	941
OGO	64742-80-9	CON_09	\N	\N	\N	Benzo[j]fluoranthene	0.014	\N	942
OGO	64742-80-9	CON_09	\N	\N	\N	Benzo[k]fluoranthene	0.035	\N	943
OGO	64742-80-9	CON_09	\N	\N	\N	Chrysene/Benzo[a]phenanthrene	1.558	\N	944
OGO	64742-80-9	CON_09	\N	\N	\N	Coronene	0.005	\N	945
OGO	64742-80-9	CON_09	\N	\N	\N	Cyclopenta[cd]pyrene	ND	\N	946
OGO	64742-80-9	CON_09	\N	\N	\N	Dibenzo[a,h]anthracene	0.006	\N	947
OGO	64742-80-9	CON_09	\N	\N	\N	Fluoranthene	2.929	\N	948
OGO	64742-80-9	CON_09	\N	\N	\N	Fluorene	49.360	\N	949
OGO	64742-80-9	CON_09	\N	\N	\N	Indeno[1,2,3-cd]pyrene	ND	\N	950
OGO	64742-80-9	CON_09	\N	\N	\N	Naphthalene	125.871	\N	951
OGO	64742-80-9	CON_09	\N	\N	\N	Perylene	0.045	\N	952
OGO	64742-80-9	CON_09	\N	\N	\N	Phenanthrene	159.084	\N	953
OGO	64742-80-9	CON_09	\N	\N	\N	Pyrene	48.073	\N	954
OGO	64742-80-9	CON_09	\N	\N	\N	Triphenylene	1.781	\N	955
OxiAsph	64741-93-4	TP543	\N	2003 air rectified 15 pen	\N	Acenaphthene	0.230	\N	956
OxiAsph	64741-93-4	TP543	\N	2003 air rectified 15 pen	\N	Acenaphthylene	0.150	\N	957
OxiAsph	64741-93-4	TP543	\N	2003 air rectified 15 pen	\N	Anthracene	0.250	\N	958
OxiAsph	64741-93-4	TP543	\N	2003 air rectified 15 pen	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	0.460	\N	959
OxiAsph	64741-93-4	TP543	\N	2003 air rectified 15 pen	\N	Benzo[a]fluorene	ND	\N	960
OxiAsph	64741-93-4	TP543	\N	2003 air rectified 15 pen	\N	Benzo[a]pyrene	1.800	\N	961
OxiAsph	64741-93-4	TP543	\N	2003 air rectified 15 pen	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	2.900	\N	962
OxiAsph	64741-93-4	TP543	\N	2003 air rectified 15 pen	\N	Benzo[b]fluorene	ND	\N	963
OxiAsph	64741-93-4	TP543	\N	2003 air rectified 15 pen	\N	Benzo[e]pyrene	5.300	\N	964
OxiAsph	64741-93-4	TP543	\N	2003 air rectified 15 pen	\N	Benzo[g,h,i]perylene	1.600	\N	965
OxiAsph	64741-93-4	TP543	\N	2003 air rectified 15 pen	\N	Benzo[k]fluoranthene	0.056	\N	966
OxiAsph	64741-93-4	TP543	\N	2003 air rectified 15 pen	\N	Chrysene/Benzo[a]phenanthrene	1.000	\N	967
OxiAsph	64741-93-4	TP543	\N	2003 air rectified 15 pen	\N	Dibenzo[a,h]anthracene	4.000	\N	968
OxiAsph	64741-93-4	TP543	\N	2003 air rectified 15 pen	\N	Fluoranthene	0.170	\N	969
OxiAsph	64741-93-4	TP543	\N	2003 air rectified 15 pen	\N	Fluorene	0.660	\N	970
OxiAsph	64741-93-4	TP543	\N	2003 air rectified 15 pen	\N	Indeno[1,2,3-cd]pyrene	0.870	\N	971
OxiAsph	64741-93-4	TP543	\N	2003 air rectified 15 pen	\N	Naphthalene	0.190	\N	972
OxiAsph	64741-93-4	TP543	\N	2003 air rectified 15 pen	\N	Perylene	ND	\N	973
OxiAsph	64741-93-4	TP543	\N	2003 air rectified 15 pen	\N	Phenanthrene	0.660	\N	974
OxiAsph	64741-93-4	TP543	\N	2003 air rectified 15 pen	\N	Pyrene	0.690	\N	975
OxiAsph	64741-93-4	TP543	\N	2003 air rectified 15 pen	\N	Triphenylene	3.200	\N	976
OxiAsph	64741-93-4	TP544	\N	2003 air rectified 40/60	\N	Acenaphthene	0.230	\N	977
OxiAsph	64741-93-4	TP544	\N	2003 air rectified 40/60	\N	Acenaphthylene	0.210	\N	978
OxiAsph	64741-93-4	TP544	\N	2003 air rectified 40/60	\N	Anthracene	0.410	\N	979
OxiAsph	64741-93-4	TP544	\N	2003 air rectified 40/60	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	1.100	\N	980
OxiAsph	64741-93-4	TP544	\N	2003 air rectified 40/60	\N	Benzo[a]fluorene	ND	\N	981
OxiAsph	64741-93-4	TP544	\N	2003 air rectified 40/60	\N	Benzo[a]pyrene	1.200	\N	982
OxiAsph	64741-93-4	TP544	\N	2003 air rectified 40/60	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	2.000	\N	983
OxiAsph	64741-93-4	TP544	\N	2003 air rectified 40/60	\N	Benzo[b]fluorene	ND	\N	984
OxiAsph	64741-93-4	TP544	\N	2003 air rectified 40/60	\N	Benzo[e]pyrene	10.000	\N	985
OxiAsph	64741-93-4	TP544	\N	2003 air rectified 40/60	\N	Benzo[g,h,i]perylene	2.700	\N	986
OxiAsph	64741-93-4	TP544	\N	2003 air rectified 40/60	\N	Benzo[k]fluoranthene	0.220	\N	987
OxiAsph	64741-93-4	TP544	\N	2003 air rectified 40/60	\N	Chrysene/Benzo[a]phenanthrene	2.200	\N	988
OxiAsph	64741-93-4	TP544	\N	2003 air rectified 40/60	\N	Dibenzo[a,h]anthracene	1.200	\N	989
OxiAsph	64741-93-4	TP544	\N	2003 air rectified 40/60	\N	Fluoranthene	0.250	\N	990
OxiAsph	64741-93-4	TP544	\N	2003 air rectified 40/60	\N	Fluorene	1.200	\N	991
OxiAsph	64741-93-4	TP544	\N	2003 air rectified 40/60	\N	Indeno[1,2,3-cd]pyrene	0.660	\N	992
OxiAsph	64741-93-4	TP544	\N	2003 air rectified 40/60	\N	Naphthalene	0.370	\N	993
OxiAsph	64741-93-4	TP544	\N	2003 air rectified 40/60	\N	Perylene	ND	\N	994
OxiAsph	64741-93-4	TP544	\N	2003 air rectified 40/60	\N	Phenanthrene	2.200	\N	995
OxiAsph	64741-93-4	TP544	\N	2003 air rectified 40/60	\N	Pyrene	1.100	\N	996
OxiAsph	64741-93-4	TP544	\N	2003 air rectified 40/60	\N	Triphenylene	5.400	\N	997
OxiAsph	64741-93-4	TP545	\N	2003 air rectified 50/70	\N	Acenaphthene	0.260	\N	998
OxiAsph	64741-93-4	TP545	\N	2003 air rectified 50/70	\N	Acenaphthylene	0.210	\N	999
OxiAsph	64741-93-4	TP545	\N	2003 air rectified 50/70	\N	Anthracene	0.340	\N	1000
OxiAsph	64741-93-4	TP545	\N	2003 air rectified 50/70	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	0.190	\N	1001
OxiAsph	64741-93-4	TP545	\N	2003 air rectified 50/70	\N	Benzo[a]fluorene	ND	\N	1002
OxiAsph	64741-93-4	TP545	\N	2003 air rectified 50/70	\N	Benzo[a]pyrene	0.300	\N	1003
OxiAsph	64741-93-4	TP545	\N	2003 air rectified 50/70	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	0.370	\N	1004
OxiAsph	64741-93-4	TP545	\N	2003 air rectified 50/70	\N	Benzo[b]fluorene	ND	\N	1005
OxiAsph	64741-93-4	TP545	\N	2003 air rectified 50/70	\N	Benzo[e]pyrene	0.670	\N	1006
OxiAsph	64741-93-4	TP545	\N	2003 air rectified 50/70	\N	Benzo[g,h,i]perylene	1.100	\N	1007
OxiAsph	64741-93-4	TP545	\N	2003 air rectified 50/70	\N	Benzo[k]fluoranthene	0.024	\N	1008
OxiAsph	64741-93-4	TP545	\N	2003 air rectified 50/70	\N	Chrysene/Benzo[a]phenanthrene	0.170	\N	1009
OxiAsph	64741-93-4	TP545	\N	2003 air rectified 50/70	\N	Dibenzo[a,h]anthracene	0.220	\N	1010
OxiAsph	64741-93-4	TP545	\N	2003 air rectified 50/70	\N	Fluoranthene	0.170	\N	1011
OxiAsph	64741-93-4	TP545	\N	2003 air rectified 50/70	\N	Fluorene	0.940	\N	1012
OxiAsph	64741-93-4	TP545	\N	2003 air rectified 50/70	\N	Indeno[1,2,3-cd]pyrene	0.170	\N	1013
OxiAsph	64741-93-4	TP545	\N	2003 air rectified 50/70	\N	Naphthalene	0.260	\N	1014
OxiAsph	64741-93-4	TP545	\N	2003 air rectified 50/70	\N	Perylene	ND	\N	1015
OxiAsph	64741-93-4	TP545	\N	2003 air rectified 50/70	\N	Phenanthrene	0.650	\N	1016
OxiAsph	64741-93-4	TP545	\N	2003 air rectified 50/70	\N	Pyrene	0.370	\N	1017
OxiAsph	64741-93-4	TP545	\N	2003 air rectified 50/70	\N	Triphenylene	0.890	\N	1018
OxiAsph	64741-93-4	TP546	\N	2004 air rectified B65 (50/70)	\N	Acenaphthene	0.130	\N	1019
OxiAsph	64741-93-4	TP546	\N	2004 air rectified B65 (50/70)	\N	Acenaphthylene	0.091	\N	1020
OxiAsph	64741-93-4	TP546	\N	2004 air rectified B65 (50/70)	\N	Anthracene	0.063	\N	1021
OxiAsph	64741-93-4	TP546	\N	2004 air rectified B65 (50/70)	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	0.750	\N	1022
OxiAsph	64741-93-4	TP546	\N	2004 air rectified B65 (50/70)	\N	Benzo[a]fluorene	ND	\N	1023
OxiAsph	64741-93-4	TP546	\N	2004 air rectified B65 (50/70)	\N	Benzo[a]pyrene	1.700	\N	1024
OxiAsph	64741-93-4	TP546	\N	2004 air rectified B65 (50/70)	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	2.600	\N	1025
OxiAsph	64741-93-4	TP546	\N	2004 air rectified B65 (50/70)	\N	Benzo[b]fluorene	ND	\N	1026
OxiAsph	64741-93-4	TP546	\N	2004 air rectified B65 (50/70)	\N	Benzo[e]pyrene	3.200	\N	1027
OxiAsph	64741-93-4	TP546	\N	2004 air rectified B65 (50/70)	\N	Benzo[g,h,i]perylene	2.400	\N	1028
OxiAsph	64741-93-4	TP546	\N	2004 air rectified B65 (50/70)	\N	Benzo[k]fluoranthene	0.027	\N	1029
OxiAsph	64741-93-4	TP546	\N	2004 air rectified B65 (50/70)	\N	Chrysene/Benzo[a]phenanthrene	2.600	\N	1030
OxiAsph	64741-93-4	TP546	\N	2004 air rectified B65 (50/70)	\N	Dibenzo[a,h]anthracene	1.700	\N	1031
OxiAsph	64741-93-4	TP546	\N	2004 air rectified B65 (50/70)	\N	Fluoranthene	0.059	\N	1032
OxiAsph	64741-93-4	TP546	\N	2004 air rectified B65 (50/70)	\N	Fluorene	0.230	\N	1033
OxiAsph	64741-93-4	TP546	\N	2004 air rectified B65 (50/70)	\N	Indeno[1,2,3-cd]pyrene	0.330	\N	1034
OxiAsph	64741-93-4	TP546	\N	2004 air rectified B65 (50/70)	\N	Naphthalene	0.140	\N	1035
OxiAsph	64741-93-4	TP546	\N	2004 air rectified B65 (50/70)	\N	Perylene	ND	\N	1036
OxiAsph	64741-93-4	TP546	\N	2004 air rectified B65 (50/70)	\N	Phenanthrene	0.120	\N	1037
OxiAsph	64741-93-4	TP546	\N	2004 air rectified B65 (50/70)	\N	Pyrene	0.380	\N	1038
OxiAsph	64741-93-4	TP546	\N	2004 air rectified B65 (50/70)	\N	Triphenylene	1.100	\N	1039
OxiAsph	64741-93-4	TP547	\N	2003 air rectified B65 (50/70)	\N	Acenaphthene	0.087	\N	1040
OxiAsph	64741-93-4	TP547	\N	2003 air rectified B65 (50/70)	\N	Acenaphthylene	0.059	\N	1041
OxiAsph	64741-93-4	TP547	\N	2003 air rectified B65 (50/70)	\N	Anthracene	0.052	\N	1042
OxiAsph	64741-93-4	TP547	\N	2003 air rectified B65 (50/70)	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	0.670	\N	1043
OxiAsph	64741-93-4	TP547	\N	2003 air rectified B65 (50/70)	\N	Benzo[a]fluorene	ND	\N	1044
OxiAsph	64741-93-4	TP547	\N	2003 air rectified B65 (50/70)	\N	Benzo[a]pyrene	1.000	\N	1045
OxiAsph	64741-93-4	TP547	\N	2003 air rectified B65 (50/70)	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	2.000	\N	1046
OxiAsph	64741-93-4	TP547	\N	2003 air rectified B65 (50/70)	\N	Benzo[b]fluorene	ND	\N	1047
OxiAsph	64741-93-4	TP547	\N	2003 air rectified B65 (50/70)	\N	Benzo[e]pyrene	2.700	\N	1048
OxiAsph	64741-93-4	TP547	\N	2003 air rectified B65 (50/70)	\N	Benzo[g,h,i]perylene	1.800	\N	1049
OxiAsph	64741-93-4	TP547	\N	2003 air rectified B65 (50/70)	\N	Benzo[k]fluoranthene	0.030	\N	1050
OxiAsph	64741-93-4	TP547	\N	2003 air rectified B65 (50/70)	\N	Chrysene/Benzo[a]phenanthrene	2.200	\N	1051
OxiAsph	64741-93-4	TP547	\N	2003 air rectified B65 (50/70)	\N	Dibenzo[a,h]anthracene	0.970	\N	1052
OxiAsph	64741-93-4	TP547	\N	2003 air rectified B65 (50/70)	\N	Fluoranthene	0.035	\N	1053
OxiAsph	64741-93-4	TP547	\N	2003 air rectified B65 (50/70)	\N	Fluorene	0.150	\N	1054
OxiAsph	64741-93-4	TP547	\N	2003 air rectified B65 (50/70)	\N	Indeno[1,2,3-cd]pyrene	0.350	\N	1055
OxiAsph	64741-93-4	TP547	\N	2003 air rectified B65 (50/70)	\N	Naphthalene	0.190	\N	1056
OxiAsph	64741-93-4	TP547	\N	2003 air rectified B65 (50/70)	\N	Perylene	ND	\N	1057
OxiAsph	64741-93-4	TP547	\N	2003 air rectified B65 (50/70)	\N	Phenanthrene	0.110	\N	1058
OxiAsph	64741-93-4	TP547	\N	2003 air rectified B65 (50/70)	\N	Pyrene	0.280	\N	1059
OxiAsph	64741-93-4	TP547	\N	2003 air rectified B65 (50/70)	\N	Triphenylene	0.560	\N	1060
OxiAsph	64742-93-4	C_BIT01	\N	\N	\N	Acenaphthene	0.189	Ignored	1061
OxiAsph	64742-93-4	C_BIT01	\N	\N	\N	Acenaphthylene	ND	Ignored	1062
OxiAsph	64742-93-4	C_BIT01	\N	\N	\N	Anthracene	0.204	Ignored	1063
OxiAsph	64742-93-4	C_BIT01	\N	\N	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	0.365	Ignored	1064
OxiAsph	64742-93-4	C_BIT01	\N	\N	\N	Benzo[a]pyrene	0.832	Ignored	1065
OxiAsph	64742-93-4	C_BIT01	\N	\N	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	0.698	Ignored	1066
OxiAsph	64742-93-4	C_BIT01	\N	\N	\N	Benzo[g,h,i]perylene	1.760	Ignored	1067
OxiAsph	64742-93-4	C_BIT01	\N	\N	\N	Benzo[k]fluoranthene	ND	Ignored	1068
OxiAsph	64742-93-4	C_BIT01	\N	\N	\N	Chrysene/Benzo[a]phenanthrene	2.060	Ignored	1069
OxiAsph	64742-93-4	C_BIT01	\N	\N	\N	Dibenzo[a,h]anthracene	0.284	Ignored	1070
OxiAsph	64742-93-4	C_BIT01	\N	\N	\N	Fluoranthene	0.331	Ignored	1071
OxiAsph	64742-93-4	C_BIT01	\N	\N	\N	Fluorene	1.350	Ignored	1072
OxiAsph	64742-93-4	C_BIT01	\N	\N	\N	Indeno[1,2,3-cd]pyrene	0.342	Ignored	1073
OxiAsph	64742-93-4	C_BIT01	\N	\N	\N	Naphthalene	0.580	Ignored	1074
OxiAsph	64742-93-4	C_BIT01	\N	\N	\N	Phenanthrene	3.290	Ignored	1075
OxiAsph	64742-93-4	C_BIT01	\N	\N	\N	Pyrene	0.677	Ignored	1076
OxiAsph	64742-93-4	C_BIT07	\N	\N	\N	Acenaphthene	0.244	Ignored	1077
OxiAsph	64742-93-4	C_BIT07	\N	\N	\N	Acenaphthylene	ND	Ignored	1078
OxiAsph	64742-93-4	C_BIT07	\N	\N	\N	Anthracene	0.549	Ignored	1079
OxiAsph	64742-93-4	C_BIT07	\N	\N	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	0.324	Ignored	1080
OxiAsph	64742-93-4	C_BIT07	\N	\N	\N	Benzo[a]pyrene	1.310	Ignored	1081
OxiAsph	64742-93-4	C_BIT07	\N	\N	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	1.210	Ignored	1082
OxiAsph	64742-93-4	C_BIT07	\N	\N	\N	Benzo[g,h,i]perylene	2.680	Ignored	1083
OxiAsph	64742-93-4	C_BIT07	\N	\N	\N	Benzo[k]fluoranthene	ND	Ignored	1084
OxiAsph	64742-93-4	C_BIT07	\N	\N	\N	Chrysene/Benzo[a]phenanthrene	4.320	Ignored	1085
OxiAsph	64742-93-4	C_BIT07	\N	\N	\N	Dibenzo[a,h]anthracene	ND	Ignored	1086
OxiAsph	64742-93-4	C_BIT07	\N	\N	\N	Fluoranthene	0.196	Ignored	1087
OxiAsph	64742-93-4	C_BIT07	\N	\N	\N	Fluorene	0.627	Ignored	1088
OxiAsph	64742-93-4	C_BIT07	\N	\N	\N	Indeno[1,2,3-cd]pyrene	ND	Ignored	1089
OxiAsph	64742-93-4	C_BIT07	\N	\N	\N	Naphthalene	ND	Ignored	1090
OxiAsph	64742-93-4	C_BIT07	\N	\N	\N	Phenanthrene	2.400	Ignored	1091
OxiAsph	64742-93-4	C_BIT07	\N	\N	\N	Pyrene	1.400	Ignored	1092
OxiAsph	64742-93-4	TP060	\N	\N	UV-DAD/VIS	Anthracene	ND	Incomplete	1093
OxiAsph	64742-93-4	TP060	\N	\N	UV-DAD/VIS	Benzo[a]anthracene/Benzo[b]phenanthrene	0.038	Incomplete	1094
OxiAsph	64742-93-4	TP060	\N	\N	UV-DAD/VIS	Benzo[a]fluoranthene	0.038	Incomplete	1095
OxiAsph	64742-93-4	TP060	\N	\N	UV-DAD/VIS	Benzo[a]pyrene	ND	Incomplete	1096
OxiAsph	64742-93-4	TP060	\N	\N	UV-DAD/VIS	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	0.011	Incomplete	1097
OxiAsph	64742-93-4	TP060	\N	\N	UV-DAD/VIS	Benzo[e]pyrene	0.053	Incomplete	1098
OxiAsph	64742-93-4	TP060	\N	\N	UV-DAD/VIS	Benzo[g,h,i]perylene	0.010	Incomplete	1099
OxiAsph	64742-93-4	TP060	\N	\N	UV-DAD/VIS	Benzo[k]fluoranthene	0.018	Incomplete	1100
OxiAsph	64742-93-4	TP060	\N	\N	UV-DAD/VIS	Chrysene/Benzo[a]phenanthrene	0.004	Incomplete	1101
OxiAsph	64742-93-4	TP060	\N	\N	UV-DAD/VIS	Dibenzo[a,h]anthracene	0.001	Incomplete	1102
OxiAsph	64742-93-4	TP060	\N	\N	UV-DAD/VIS	Fluoranthene	ND	Incomplete	1103
OxiAsph	64742-93-4	TP060	\N	\N	UV-DAD/VIS	Indeno[1,2,3-cd]pyrene	0.001	Incomplete	1104
OxiAsph	64742-93-4	TP060	\N	\N	UV-DAD/VIS	Phenanthrene	ND	Incomplete	1105
OxiAsph	64742-93-4	TP060	\N	\N	UV-DAD/VIS	Pyrene	0.003	Incomplete	1106
RAE	64742-10-5	C_RAE03	\N	\N	\N	Acenaphthene	0.077	Ignored	1107
RAE	64742-10-5	C_RAE03	\N	\N	\N	Acenaphthylene	ND	Ignored	1108
RAE	64742-10-5	C_RAE03	\N	\N	\N	Anthracene	ND	Ignored	1109
RAE	64742-10-5	C_RAE03	\N	\N	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	2.310	Ignored	1110
RAE	64742-10-5	C_RAE03	\N	\N	\N	Benzo[a]pyrene	9.200	Ignored	1111
RAE	64742-10-5	C_RAE03	\N	\N	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	10.700	Ignored	1112
RAE	64742-10-5	C_RAE03	\N	\N	\N	Benzo[g,h,i]perylene	40.400	Ignored	1113
RAE	64742-10-5	C_RAE03	\N	\N	\N	Benzo[k]fluoranthene	ND	Ignored	1114
RAE	64742-10-5	C_RAE03	\N	\N	\N	Chrysene/Benzo[a]phenanthrene	26.800	Ignored	1115
RAE	64742-10-5	C_RAE03	\N	\N	\N	Dibenzo[a,h]anthracene	10.300	Ignored	1116
RAE	64742-10-5	C_RAE03	\N	\N	\N	Fluoranthene	0.593	Ignored	1117
RAE	64742-10-5	C_RAE03	\N	\N	\N	Fluorene	0.551	Ignored	1118
RAE	64742-10-5	C_RAE03	\N	\N	\N	Indeno[1,2,3-cd]pyrene	6.860	Ignored	1119
RAE	64742-10-5	C_RAE03	\N	\N	\N	Naphthalene	0.176	Ignored	1120
RAE	64742-10-5	C_RAE03	\N	\N	\N	Phenanthrene	5.370	Ignored	1121
RAE	64742-10-5	C_RAE03	\N	\N	\N	Pyrene	3.420	Ignored	1122
RAE	64742-10-5	C_RAE05	\N	\N	\N	Acenaphthene	0.255	Ignored	1123
RAE	64742-10-5	C_RAE05	\N	\N	\N	Acenaphthylene	ND	Ignored	1124
RAE	64742-10-5	C_RAE05	\N	\N	\N	Anthracene	ND	Ignored	1125
RAE	64742-10-5	C_RAE05	\N	\N	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	ND	Ignored	1126
RAE	64742-10-5	C_RAE05	\N	\N	\N	Benzo[a]pyrene	ND	Ignored	1127
RAE	64742-10-5	C_RAE05	\N	\N	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	ND	Ignored	1128
RAE	64742-10-5	C_RAE05	\N	\N	\N	Benzo[g,h,i]perylene	0.540	Ignored	1129
RAE	64742-10-5	C_RAE05	\N	\N	\N	Benzo[k]fluoranthene	ND	Ignored	1130
RAE	64742-10-5	C_RAE05	\N	\N	\N	Chrysene/Benzo[a]phenanthrene	ND	Ignored	1131
RAE	64742-10-5	C_RAE05	\N	\N	\N	Dibenzo[a,h]anthracene	ND	Ignored	1132
RAE	64742-10-5	C_RAE05	\N	\N	\N	Fluoranthene	ND	Ignored	1133
RAE	64742-10-5	C_RAE05	\N	\N	\N	Fluorene	0.363	Ignored	1134
RAE	64742-10-5	C_RAE05	\N	\N	\N	Indeno[1,2,3-cd]pyrene	ND	Ignored	1135
RAE	64742-10-5	C_RAE05	\N	\N	\N	Naphthalene	0.163	Ignored	1136
RAE	64742-10-5	C_RAE05	\N	\N	\N	Phenanthrene	0.224	Ignored	1137
RAE	64742-10-5	C_RAE05	\N	\N	\N	Pyrene	0.161	Ignored	1138
RAE	64742-10-5	CON_26	\N	\N	\N	1-Methylnaphthalene	0.496	\N	1139
RAE	64742-10-5	CON_26	\N	\N	\N	2-Methylnaphthalene	0.682	\N	1140
RAE	64742-10-5	CON_26	A01	\N	\N	Acenaphthene	0.218	\N	1141
RAE	64742-10-5	CON_26	A01	\N	\N	Acenaphthylene	ND	\N	1142
RAE	64742-10-5	CON_26	\N	\N	\N	Anthanthrene	0.054	\N	1143
RAE	64742-10-5	CON_26	A01	\N	\N	Anthracene	0.150	\N	1144
RAE	64742-10-5	CON_26	A01	\N	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	0.239	\N	1145
RAE	64742-10-5	CON_26	A01	\N	\N	Benzo[a]pyrene	0.245	\N	1146
RAE	64742-10-5	CON_26	A01	\N	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	0.467	\N	1147
RAE	64742-10-5	CON_26	\N	\N	\N	Benzo[b]naphtho[2,1-d]thiophene	0.785	\N	1148
RAE	64742-10-5	CON_26	\N	\N	\N	Benzo[c]phenanthrene	0.029	\N	1149
RAE	64742-10-5	CON_26	\N	\N	\N	Benzo[e]pyrene	1.052	\N	1150
RAE	64742-10-5	CON_26	\N	\N	\N	Benzo[g,h,i]fluoranthene	0.028	\N	1151
RAE	64742-10-5	CON_26	A01	\N	\N	Benzo[g,h,i]perylene	1.411	\N	1152
RAE	64742-10-5	CON_26	\N	\N	\N	Benzo[j]fluoranthene	0.076	\N	1153
RAE	64742-10-5	CON_26	A01	\N	\N	Benzo[k]fluoranthene	0.091	\N	1154
RAE	64742-10-5	CON_26	A01	\N	\N	Chrysene/Benzo[a]phenanthrene	0.710	\N	1155
RAE	64742-10-5	CON_26	\N	\N	\N	Coronene	0.407	\N	1156
RAE	64742-10-5	CON_26	\N	\N	\N	Cyclopenta[cd]pyrene	ND	\N	1157
RAE	64742-10-5	CON_26	A01	\N	\N	Dibenzo[a,h]anthracene	0.074	\N	1158
RAE	64742-10-5	CON_26	A01	\N	\N	Fluoranthene	0.197	\N	1159
RAE	64742-10-5	CON_26	A01	\N	\N	Fluorene	0.361	\N	1160
RAE	64742-10-5	CON_26	A01	\N	\N	Indeno[1,2,3-cd]pyrene	0.136	\N	1161
RAE	64742-10-5	CON_26	A01	\N	\N	Naphthalene	0.290	\N	1162
RAE	64742-10-5	CON_26	\N	\N	\N	Perylene	0.267	\N	1163
RAE	64742-10-5	CON_26	A01	\N	\N	Phenanthrene	2.052	\N	1164
RAE	64742-10-5	CON_26	A01	\N	\N	Pyrene	0.494	\N	1165
RAE	64742-10-5	CON_26	\N	\N	\N	Triphenylene	0.742	\N	1166
RAE	64742-10-5	J026	\N	200290758	40518	Anthracene	0.100	Incomplete	1167
RAE	64742-10-5	J026	\N	200290758	40518	Benzo[a]pyrene	0.100	Incomplete	1168
RAE	64742-10-5	J026	\N	200290758	40518	Benzo[e]pyrene	0.100	Incomplete	1169
RAE	64742-10-5	J026	\N	200290758	40518	Benzo[j]fluoranthene	0.100	Incomplete	1170
RAE	64742-10-5	J026	\N	200290758	40518	Benzo[k]fluoranthene	0.100	Incomplete	1171
RAE	64742-10-5	J026	\N	200290758	40518	Dibenzo[a,h]anthracene	0.100	Incomplete	1172
RAE	64742-10-5	J077	\N	LOL1004	40471	Anthracene	0.175	Incomplete	1173
RAE	64742-10-5	J077	\N	LOL1004	40471	Benzo[a]pyrene	0.345	Incomplete	1174
RAE	64742-10-5	J077	\N	LOL1004	40471	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	0.695	Incomplete	1175
RAE	64742-10-5	J077	\N	LOL1004	40471	Benzo[e]pyrene	1.477	Incomplete	1176
RAE	64742-10-5	J077	\N	LOL1004	40471	Benzo[g,h,i]perylene	1.155	Incomplete	1177
RAE	64742-10-5	J077	\N	LOL1004	40471	Benzo[j]fluoranthene	0.096	Incomplete	1178
RAE	64742-10-5	J077	\N	LOL1004	40471	Benzo[k]fluoranthene	0.085	Incomplete	1179
RAE	64742-10-5	J077	\N	LOL1004	40471	Coronene	0.188	Incomplete	1180
RAE	64742-10-5	J077	\N	LOL1004	40471	Dibenzo[a,h]anthracene	0.107	Incomplete	1181
RAE	64742-10-5	J077	\N	LOL1004	40471	Indeno[1,2,3-cd]pyrene	0.183	Incomplete	1182
RAE	64742-10-5	J077	\N	LOL1004	40471	Perylene	0.363	Incomplete	1183
RAE	64742-10-5	J077	\N	LOL1004	40471	Triphenylene	1.155	Incomplete	1184
RAE	64742-10-5	TP001	\N	E1002464	Grimmer	Anthanthrene	0.084	Incomplete	1185
RAE	64742-10-5	TP001	\N	E1002464	Grimmer	Anthracene	0.064	Incomplete	1186
RAE	64742-10-5	TP001	\N	E1002464	Grimmer	Benzo[a]anthracene/Benzo[b]phenanthrene	0.087	Incomplete	1187
RAE	64742-10-5	TP001	\N	E1002464	Grimmer	Benzo[a]pyrene	0.312	Incomplete	1188
RAE	64742-10-5	TP001	\N	E1002464	Grimmer	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	0.577	Incomplete	1189
RAE	64742-10-5	TP001	\N	E1002464	Grimmer	Benzo[b]naphtho[2,1-d]thiophene	0.408	Incomplete	1190
RAE	64742-10-5	TP001	\N	E1002464	Grimmer	Benzo[c]phenanthrene	0.020	Incomplete	1191
RAE	64742-10-5	TP001	\N	E1002464	Grimmer	Benzo[e]pyrene	1.658	Incomplete	1192
RAE	64742-10-5	TP001	\N	E1002464	Grimmer	Benzo[g,h,i]fluoranthene	0.012	Incomplete	1193
RAE	64742-10-5	TP001	\N	E1002464	Grimmer	Benzo[g,h,i]perylene	1.177	Incomplete	1194
RAE	64742-10-5	TP001	\N	E1002464	Grimmer	Benzo[j]fluoranthene	0.083	Incomplete	1195
RAE	64742-10-5	TP001	\N	E1002464	Grimmer	Benzo[k]fluoranthene	0.115	Incomplete	1196
RAE	64742-10-5	TP001	\N	E1002464	Grimmer	Chrysene/Benzo[a]phenanthrene	0.277	Incomplete	1197
RAE	64742-10-5	TP001	\N	E1002464	Grimmer	Coronene	0.256	Incomplete	1198
RAE	64742-10-5	TP001	\N	E1002464	Grimmer	Cyclopenta[cd]pyrene	ND	Incomplete	1199
RAE	64742-10-5	TP001	\N	E1002464	Grimmer	Dibenzo[a,e]pyrene	0.483	Incomplete	1200
RAE	64742-10-5	TP001	\N	E1002464	Grimmer	Dibenzo[a,h]anthracene	0.105	Incomplete	1201
RAE	64742-10-5	TP001	\N	E1002464	Grimmer	Dibenzo[a,h]pyrene	0.019	Incomplete	1202
RAE	64742-10-5	TP001	\N	E1002464	Grimmer	Dibenzo[a,i]pyrene	0.027	Incomplete	1203
RAE	64742-10-5	TP001	\N	E1002464	Grimmer	Dibenzo[a,l]pyrene	0.078	Incomplete	1204
RAE	64742-10-5	TP001	\N	E1002464	Grimmer	Fluoranthene	0.029	Incomplete	1205
RAE	64742-10-5	TP001	\N	E1002464	Grimmer	Indeno[1,2,3-cd]pyrene	0.224	Incomplete	1206
RAE	64742-10-5	TP001	\N	E1002464	Grimmer	Perylene	0.663	Incomplete	1207
RAE	64742-10-5	TP001	\N	E1002464	Grimmer	Phenanthrene	0.110	Incomplete	1208
RAE	64742-10-5	TP001	\N	E1002464	Grimmer	Pyrene	0.055	Incomplete	1209
RAE	64742-10-5	TP001	\N	E1002464	Grimmer	Triphenylene	0.345	Incomplete	1210
RAE	91995-70-9	C_RAE01	\N	\N	\N	Acenaphthene	0.244	Ignored	1211
RAE	91995-70-9	C_RAE01	\N	\N	\N	Acenaphthylene	ND	Ignored	1212
RAE	91995-70-9	C_RAE01	\N	\N	\N	Anthracene	0.549	Ignored	1213
RAE	91995-70-9	C_RAE01	\N	\N	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	0.324	Ignored	1214
RAE	91995-70-9	C_RAE01	\N	\N	\N	Benzo[a]pyrene	1.310	Ignored	1215
RAE	91995-70-9	C_RAE01	\N	\N	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	1.210	Ignored	1216
RAE	91995-70-9	C_RAE01	\N	\N	\N	Benzo[g,h,i]perylene	2.680	Ignored	1217
RAE	91995-70-9	C_RAE01	\N	\N	\N	Benzo[k]fluoranthene	ND	Ignored	1218
RAE	91995-70-9	C_RAE01	\N	\N	\N	Chrysene/Benzo[a]phenanthrene	4.320	Ignored	1219
RAE	91995-70-9	C_RAE01	\N	\N	\N	Dibenzo[a,h]anthracene	ND	Ignored	1220
RAE	91995-70-9	C_RAE01	\N	\N	\N	Fluoranthene	0.196	Ignored	1221
RAE	91995-70-9	C_RAE01	\N	\N	\N	Fluorene	0.627	Ignored	1222
RAE	91995-70-9	C_RAE01	\N	\N	\N	Indeno[1,2,3-cd]pyrene	ND	Ignored	1223
RAE	91995-70-9	C_RAE01	\N	\N	\N	Naphthalene	ND	Ignored	1224
RAE	91995-70-9	C_RAE01	\N	\N	\N	Phenanthrene	2.400	Ignored	1225
RAE	91995-70-9	C_RAE01	\N	\N	\N	Pyrene	1.400	Ignored	1226
RAE	91995-70-9	C_RAE02	\N	\N	\N	Acenaphthene	ND	Ignored	1227
RAE	91995-70-9	C_RAE02	\N	\N	\N	Acenaphthylene	ND	Ignored	1228
RAE	91995-70-9	C_RAE02	\N	\N	\N	Anthracene	ND	Ignored	1229
RAE	91995-70-9	C_RAE02	\N	\N	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	ND	Ignored	1230
RAE	91995-70-9	C_RAE02	\N	\N	\N	Benzo[a]pyrene	1.100	Ignored	1231
RAE	91995-70-9	C_RAE02	\N	\N	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	0.874	Ignored	1232
RAE	91995-70-9	C_RAE02	\N	\N	\N	Benzo[g,h,i]perylene	3.240	Ignored	1233
RAE	91995-70-9	C_RAE02	\N	\N	\N	Benzo[k]fluoranthene	ND	Ignored	1234
RAE	91995-70-9	C_RAE02	\N	\N	\N	Chrysene/Benzo[a]phenanthrene	1.300	Ignored	1235
RAE	91995-70-9	C_RAE02	\N	\N	\N	Dibenzo[a,h]anthracene	ND	Ignored	1236
RAE	91995-70-9	C_RAE02	\N	\N	\N	Fluoranthene	ND	Ignored	1237
RAE	91995-70-9	C_RAE02	\N	\N	\N	Fluorene	0.203	Ignored	1238
RAE	91995-70-9	C_RAE02	\N	\N	\N	Indeno[1,2,3-cd]pyrene	ND	Ignored	1239
RAE	91995-70-9	C_RAE02	\N	\N	\N	Naphthalene	0.819	Ignored	1240
RAE	91995-70-9	C_RAE02	\N	\N	\N	Phenanthrene	0.286	Ignored	1241
RAE	91995-70-9	C_RAE02	\N	\N	\N	Pyrene	0.195	Ignored	1242
RAE	91995-70-9	C_RAE04	\N	\N	\N	Acenaphthene	0.437	Ignored	1243
RAE	91995-70-9	C_RAE04	\N	\N	\N	Acenaphthylene	ND	Ignored	1244
RAE	91995-70-9	C_RAE04	\N	\N	\N	Anthracene	0.535	Ignored	1245
RAE	91995-70-9	C_RAE04	\N	\N	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	0.225	Ignored	1246
RAE	91995-70-9	C_RAE04	\N	\N	\N	Benzo[a]pyrene	0.644	Ignored	1247
RAE	91995-70-9	C_RAE04	\N	\N	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	0.697	Ignored	1248
RAE	91995-70-9	C_RAE04	\N	\N	\N	Benzo[g,h,i]perylene	1.340	Ignored	1249
RAE	91995-70-9	C_RAE04	\N	\N	\N	Benzo[k]fluoranthene	ND	Ignored	1250
RAE	91995-70-9	C_RAE04	\N	\N	\N	Chrysene/Benzo[a]phenanthrene	1.740	Ignored	1251
RAE	91995-70-9	C_RAE04	\N	\N	\N	Dibenzo[a,h]anthracene	ND	Ignored	1252
RAE	91995-70-9	C_RAE04	\N	\N	\N	Fluoranthene	0.299	Ignored	1253
RAE	91995-70-9	C_RAE04	\N	\N	\N	Fluorene	0.799	Ignored	1254
RAE	91995-70-9	C_RAE04	\N	\N	\N	Indeno[1,2,3-cd]pyrene	ND	Ignored	1255
RAE	91995-70-9	C_RAE04	\N	\N	\N	Naphthalene	0.183	Ignored	1256
RAE	91995-70-9	C_RAE04	\N	\N	\N	Phenanthrene	2.030	Ignored	1257
RAE	91995-70-9	C_RAE04	\N	\N	\N	Pyrene	0.765	Ignored	1258
RAE	91995-70-9	CON_27	\N	\N	\N	1-Methylnaphthalene	0.470	\N	1259
RAE	91995-70-9	CON_27	\N	\N	\N	2-Methylnaphthalene	0.525	\N	1260
RAE	91995-70-9	CON_27	B01	\N	\N	Acenaphthene	0.289	\N	1261
RAE	91995-70-9	CON_27	B01	\N	\N	Acenaphthylene	ND	\N	1262
RAE	91995-70-9	CON_27	\N	\N	\N	Anthanthrene	0.191	\N	1263
RAE	91995-70-9	CON_27	B01	\N	\N	Anthracene	0.405	\N	1264
RAE	91995-70-9	CON_27	B01	\N	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	0.283	\N	1265
RAE	91995-70-9	CON_27	B01	\N	\N	Benzo[a]pyrene	0.382	\N	1266
RAE	91995-70-9	CON_27	B01	\N	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	0.928	\N	1267
RAE	91995-70-9	CON_27	\N	\N	\N	Benzo[b]naphtho[2,1-d]thiophene	2.759	\N	1268
RAE	91995-70-9	CON_27	\N	\N	\N	Benzo[c]phenanthrene	0.060	\N	1269
RAE	91995-70-9	CON_27	\N	\N	\N	Benzo[e]pyrene	2.830	\N	1270
RAE	91995-70-9	CON_27	\N	\N	\N	Benzo[g,h,i]fluoranthene	0.070	\N	1271
RAE	91995-70-9	CON_27	B01	\N	\N	Benzo[g,h,i]perylene	5.783	\N	1272
RAE	91995-70-9	CON_27	\N	\N	\N	Benzo[j]fluoranthene	0.100	\N	1273
RAE	91995-70-9	CON_27	B01	\N	\N	Benzo[k]fluoranthene	0.193	\N	1274
RAE	91995-70-9	CON_27	B01	\N	\N	Chrysene/Benzo[a]phenanthrene	1.048	\N	1275
RAE	91995-70-9	CON_27	\N	\N	\N	Coronene	1.494	\N	1276
RAE	91995-70-9	CON_27	\N	\N	\N	Cyclopenta[cd]pyrene	ND	\N	1277
RAE	91995-70-9	CON_27	B01	\N	\N	Dibenzo[a,h]anthracene	0.341	\N	1278
RAE	91995-70-9	CON_27	B01	\N	\N	Fluoranthene	0.153	\N	1279
RAE	91995-70-9	CON_27	B01	\N	\N	Fluorene	0.511	\N	1280
RAE	91995-70-9	CON_27	B01	\N	\N	Indeno[1,2,3-cd]pyrene	0.190	\N	1281
RAE	91995-70-9	CON_27	B01	\N	\N	Naphthalene	0.156	\N	1282
RAE	91995-70-9	CON_27	\N	\N	\N	Perylene	0.442	\N	1283
RAE	91995-70-9	CON_27	B01	\N	\N	Phenanthrene	3.238	\N	1284
RAE	91995-70-9	CON_27	B01	\N	\N	Pyrene	0.665	\N	1285
RAE	91995-70-9	CON_27	\N	\N	\N	Triphenylene	1.418	\N	1286
RAE	91995-70-9	H005	\N	\N	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	0.800	Incomplete	1287
RAE	91995-70-9	H005	\N	\N	\N	Benzo[a]pyrene	1.000	Incomplete	1288
RAE	91995-70-9	H005	\N	\N	\N	Benzo[e]pyrene	4.250	Incomplete	1289
RAE	91995-70-9	H005	\N	\N	\N	Benzo[g,h,i]perylene	2.300	Incomplete	1290
RAE	91995-70-9	H005	\N	\N	\N	Benzofluoranthenes	2.950	Incomplete	1291
RAE	91995-70-9	H005	\N	\N	\N	Chrysene/Benzo[a]phenanthrene	6.450	Incomplete	1292
RAE	91995-70-9	H005	\N	\N	\N	Dibenzo[a,h]anthracene	1.450	Incomplete	1293
RAE	91995-70-9	H005	\N	\N	\N	Dibenzo[a,j]anthracene	0.200	Incomplete	1294
RAE	91995-70-9	H005	\N	\N	\N	Fluoranthene	0.400	Incomplete	1295
RAE	91995-70-9	H005	\N	\N	\N	Indeno[1,2,3-cd]pyrene	0.500	Incomplete	1296
RAE	91995-70-9	H005	\N	\N	\N	Perylene	0.850	Incomplete	1297
RAE	91995-70-9	H005	\N	\N	\N	Pyrene	1.200	Incomplete	1298
RAE	91995-70-9	J072	\N	P 1009436	40358	Anthracene	0.400	Incomplete	1299
RAE	91995-70-9	J072	\N	P 1009436	40358	Benzo[a]pyrene	0.900	Incomplete	1300
RAE	91995-70-9	J072	\N	P 1009436	40358	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	1.600	Incomplete	1301
RAE	91995-70-9	J072	\N	P 1009436	40358	Benzo[e]pyrene	3.600	Incomplete	1302
RAE	91995-70-9	J072	\N	P 1009436	40358	Benzo[g,h,i]perylene	3.900	Incomplete	1303
RAE	91995-70-9	J072	\N	P 1009436	40358	Benzo[j]fluoranthene	1.600	Incomplete	1304
RAE	91995-70-9	J072	\N	P 1009436	41085	Benzo[k]fluoranthene	0.200	Incomplete	1305
RAE	91995-70-9	J072	\N	P 1009436	40358	Coronene	2.300	Incomplete	1306
RAE	91995-70-9	J072	\N	P 1009436	40358	Dibenzo[a,h]anthracene	0.100	Incomplete	1307
RAE	91995-70-9	J072	\N	P 1009436	40358	Indeno[1,2,3-cd]pyrene	0.500	Incomplete	1308
RAE	91995-70-9	J072	\N	P 1009436	40358	Perylene	1.000	Incomplete	1309
RAE	91995-70-9	J072	\N	P 1009436	40358	Triphenylene	5.500	Incomplete	1310
RAE	91995-70-9	J072	\N	P 954949	40210	Anthracene	0.300	Incomplete	1311
RAE	91995-70-9	J072	\N	P 954949	40210	Benzo[a]pyrene	0.700	Incomplete	1312
RAE	91995-70-9	J072	\N	P 954949	40210	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	1.000	Incomplete	1313
RAE	91995-70-9	J072	\N	P 954949	40210	Benzo[e]pyrene	2.600	Incomplete	1314
RAE	91995-70-9	J072	\N	P 954949	40210	Benzo[g,h,i]perylene	1.700	Incomplete	1315
RAE	91995-70-9	J072	\N	P 954949	40210	Benzo[j]fluoranthene	1.000	Incomplete	1316
RAE	91995-70-9	J072	\N	P 954949	40210	Benzo[k]fluoranthene	0.100	Incomplete	1317
RAE	91995-70-9	J072	\N	P 954949	40210	Coronene	1.400	Incomplete	1318
SRGO	64741-43-1	J072	\N	P 1219949	40955	Benzo[a]pyrene	0.100	\N	1319
RAE	91995-70-9	J072	\N	P 954949	40210	Dibenzo[a,h]anthracene	0.100	Incomplete	1320
RAE	91995-70-9	J072	\N	P 954949	40210	Indeno[1,2,3-cd]pyrene	0.300	Incomplete	1321
RAE	91995-70-9	J072	\N	P 954949	40210	Perylene	0.600	Incomplete	1322
RAE	91995-70-9	J072	\N	P 954949	40210	Triphenylene	5.700	Incomplete	1323
RAE	91995-70-9	J072	\N	P 965183	40238	Benzo[e]pyrene	2.100	Incomplete	1324
RAE	91995-70-9	J072	\N	P 965183	40238	Benzo[g,h,i]perylene	1.700	Incomplete	1325
RAE	91995-70-9	J072	\N	P 965183	40238	Benzo[j]fluoranthene	1.000	Incomplete	1326
RAE	91995-70-9	J072	\N	P 965183	40238	Benzo[k]fluoranthene	0.100	Incomplete	1327
RAE	91995-70-9	J072	\N	P 965183	40238	Coronene	1.200	Incomplete	1328
RAE	91995-70-9	J072	\N	P 965183	40238	Dibenzo[a,h]anthracene	0.100	Incomplete	1329
RAE	91995-70-9	J072	\N	P 965183	40238	Indeno[1,2,3-cd]pyrene	0.300	Incomplete	1330
RAE	91995-70-9	J072	\N	P 965183	40238	Perylene	0.600	Incomplete	1331
RAE	91995-70-9	J072	\N	P 965183	40238	Triphenylene	5.100	Incomplete	1332
RAE	91995-70-9	J072	\N	P 979163	40276	Anthracene	0.300	Incomplete	1333
RAE	91995-70-9	J072	\N	P 979163	40276	Benzo[a]pyrene	0.700	Incomplete	1334
RAE	91995-70-9	J072	\N	P 979163	40276	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	0.800	Incomplete	1335
RAE	91995-70-9	J072	\N	P 979163	40276	Benzo[e]pyrene	1.600	Incomplete	1336
RAE	91995-70-9	J072	\N	P 979163	40276	Benzo[g,h,i]perylene	2.900	Incomplete	1337
RAE	91995-70-9	J072	\N	P 979163	40276	Benzo[j]fluoranthene	0.800	Incomplete	1338
RAE	91995-70-9	J072	\N	P 979163	40276	Benzo[k]fluoranthene	0.100	Incomplete	1339
RAE	91995-70-9	J072	\N	P 979163	40276	Coronene	2.300	Incomplete	1340
RAE	91995-70-9	J072	\N	P 979163	40276	Dibenzo[a,h]anthracene	0.100	Incomplete	1341
RAE	91995-70-9	J072	\N	P 979163	40276	Indeno[1,2,3-cd]pyrene	0.400	Incomplete	1342
RAE	91995-70-9	J072	\N	P 979163	40276	Perylene	0.400	Incomplete	1343
RAE	91995-70-9	J072	\N	P 979163	40276	Triphenylene	3.900	Incomplete	1344
RAE	91995-70-9	J072	\N	P 987127	40297	Anthracene	0.300	Incomplete	1345
RAE	91995-70-9	J072	\N	P 987127	40297	Benzo[a]pyrene	0.500	Incomplete	1346
RAE	91995-70-9	J072	\N	P 987127	40297	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	0.700	Incomplete	1347
RAE	91995-70-9	J072	\N	P 987127	40297	Benzo[e]pyrene	1.600	Incomplete	1348
RAE	91995-70-9	J072	\N	P 987127	40297	Benzo[g,h,i]perylene	1.900	Incomplete	1349
RAE	91995-70-9	J072	\N	P 987127	40297	Benzo[j]fluoranthene	0.700	Incomplete	1350
RAE	91995-70-9	J072	\N	P 987127	40297	Benzo[k]fluoranthene	0.100	Incomplete	1351
RAE	91995-70-9	J072	\N	P 987127	40297	Coronene	1.900	Incomplete	1352
RAE	91995-70-9	J072	\N	P 987127	40297	Dibenzo[a,h]anthracene	0.100	Incomplete	1353
RAE	91995-70-9	J072	\N	P 987127	40297	Indeno[1,2,3-cd]pyrene	0.200	Incomplete	1354
RAE	91995-70-9	J072	\N	P 987127	40297	Perylene	0.400	Incomplete	1355
RAE	91995-70-9	J072	\N	P 987127	40297	Triphenylene	3.300	Incomplete	1356
RAE	91995-70-9	J072	\N	P965183	40238	Anthracene	0.300	Incomplete	1357
RAE	91995-70-9	J072	\N	P965183	40238	Benzo[a]pyrene	0.700	Incomplete	1358
RAE	91995-70-9	J072	\N	P965183	40238	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	1.000	Incomplete	1359
RAE	91995-70-9	J106	\N	P 1201684	40902	Anthracene	0.600	Incomplete	1360
RAE	91995-70-9	J106	\N	P 1201684	40902	Benzo[a]pyrene	0.400	Incomplete	1361
RAE	91995-70-9	J106	\N	P 1201684	40902	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	0.300	Incomplete	1362
RAE	91995-70-9	J106	\N	P 1201684	40902	Benzo[e]pyrene	1.400	Incomplete	1363
RAE	91995-70-9	J106	\N	P 1201684	40902	Benzo[g,h,i]perylene	1.400	Incomplete	1364
RAE	91995-70-9	J106	\N	P 1201684	40902	Benzo[j]fluoranthene	0.300	Incomplete	1365
RAE	91995-70-9	J106	\N	P 1201684	40902	Benzo[k]fluoranthene	0.100	Incomplete	1366
RAE	91995-70-9	J106	\N	P 1201684	40902	Coronene	1.100	Incomplete	1367
RAE	91995-70-9	J106	\N	P 1201684	40902	Dibenzo[a,h]anthracene	0.500	Incomplete	1368
RAE	91995-70-9	J106	\N	P 1201684	40902	Indeno[1,2,3-cd]pyrene	0.200	Incomplete	1369
RAE	91995-70-9	J106	\N	P 1201684	40902	Perylene	0.300	Incomplete	1370
RAE	91995-70-9	J106	\N	P 1201684	40902	Triphenylene	0.500	Incomplete	1371
RAE	91995-70-9	J106	\N	P 1216322	40946	Anthracene	0.600	Incomplete	1372
RAE	91995-70-9	J106	\N	P 1216322	40946	Benzo[a]pyrene	3.800	Incomplete	1373
RAE	91995-70-9	J106	\N	P 1216322	40946	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	2.900	Incomplete	1374
RAE	91995-70-9	J106	\N	P 1216322	40946	Benzo[e]pyrene	14.100	Incomplete	1375
RAE	91995-70-9	J106	\N	P 1216322	40946	Benzo[g,h,i]perylene	8.600	Incomplete	1376
RAE	91995-70-9	J106	\N	P 1216322	40946	Benzo[j]fluoranthene	2.900	Incomplete	1377
RAE	91995-70-9	J106	\N	P 1216322	40946	Benzo[k]fluoranthene	0.100	Incomplete	1378
RAE	91995-70-9	J106	\N	P 1216322	40946	Coronene	3.200	Incomplete	1379
RAE	91995-70-9	J106	\N	P 1216322	40946	Dibenzo[a,h]anthracene	2.800	Incomplete	1380
RAE	91995-70-9	J106	\N	P 1216322	40946	Indeno[1,2,3-cd]pyrene	3.000	Incomplete	1381
RAE	91995-70-9	J106	\N	P 1216322	40946	Perylene	5.400	Incomplete	1382
RAE	91995-70-9	J106	\N	P 1216322	40946	Triphenylene	3.900	Incomplete	1383
RAE	91995-70-9	J106	\N	P 1230267	40982	Anthracene	0.400	Incomplete	1384
RAE	91995-70-9	J106	\N	P 1230267	40982	Benzo[a]pyrene	0.500	Incomplete	1385
RAE	91995-70-9	J106	\N	P 1230267	40982	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	0.400	Incomplete	1386
RAE	91995-70-9	J106	\N	P 1230267	40982	Benzo[e]pyrene	2.500	Incomplete	1387
RAE	91995-70-9	J106	\N	P 1230267	40982	Benzo[g,h,i]perylene	2.200	Incomplete	1388
RAE	91995-70-9	J106	\N	P 1230267	40982	Benzo[j]fluoranthene	0.400	Incomplete	1389
RAE	91995-70-9	J106	\N	P 1230267	40982	Benzo[k]fluoranthene	0.100	Incomplete	1390
RAE	91995-70-9	J106	\N	P 1230267	40982	Coronene	1.400	Incomplete	1391
SRGO	64741-43-1	J106	\N	P 1257259	41060	Perylene	0.100	\N	1392
RAE	91995-70-9	J106	\N	P 1230267	40982	Dibenzo[a,h]anthracene	0.600	Incomplete	1393
RAE	91995-70-9	J106	\N	P 1230267	40982	Indeno[1,2,3-cd]pyrene	0.200	Incomplete	1394
RAE	91995-70-9	J106	\N	P 1230267	40982	Perylene	0.800	Incomplete	1395
RAE	91995-70-9	J106	\N	P 1230267	40982	Triphenylene	0.800	Incomplete	1396
RAE	91995-70-9	J106	\N	P 1248757	41035	Anthracene	1.000	Incomplete	1397
RAE	91995-70-9	J106	\N	P 1248757	41035	Benzo[a]pyrene	0.500	Incomplete	1398
RAE	91995-70-9	J106	\N	P 1248757	41035	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	0.400	Incomplete	1399
RAE	91995-70-9	J106	\N	P 1248757	41035	Benzo[e]pyrene	1.400	Incomplete	1400
RAE	91995-70-9	J106	\N	P 1248757	41035	Benzo[g,h,i]perylene	3.500	Incomplete	1401
RAE	91995-70-9	J106	\N	P 1248757	41035	Benzo[j]fluoranthene	0.400	Incomplete	1402
RAE	91995-70-9	J106	\N	P 1248757	41035	Benzo[k]fluoranthene	0.100	Incomplete	1403
RAE	91995-70-9	J106	\N	P 1248757	41035	Coronene	1.500	Incomplete	1404
RAE	91995-70-9	J106	\N	P 1248757	41035	Dibenzo[a,h]anthracene	0.400	Incomplete	1405
RAE	91995-70-9	J106	\N	P 1248757	41035	Indeno[1,2,3-cd]pyrene	0.500	Incomplete	1406
RAE	91995-70-9	J106	\N	P 1248757	41035	Perylene	0.800	Incomplete	1407
RAE	91995-70-9	J106	\N	P 1248757	41035	Triphenylene	0.500	Incomplete	1408
RAE	91995-70-9	J106	\N	P 1255975	41055	Anthracene	1.600	Incomplete	1409
RAE	91995-70-9	J106	\N	P 1255975	41055	Benzo[a]pyrene	0.800	Incomplete	1410
RAE	91995-70-9	J106	\N	P 1255975	41055	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	0.400	Incomplete	1411
RAE	91995-70-9	J106	\N	P 1255975	41055	Benzo[e]pyrene	2.200	Incomplete	1412
RAE	91995-70-9	J106	\N	P 1255975	41055	Benzo[g,h,i]perylene	7.800	Incomplete	1413
RAE	91995-70-9	J106	\N	P 1255975	41055	Benzo[j]fluoranthene	0.400	Incomplete	1414
RAE	91995-70-9	J106	\N	P 1255975	41055	Benzo[k]fluoranthene	0.100	Incomplete	1415
RAE	91995-70-9	J106	\N	P 1255975	41055	Coronene	1.900	Incomplete	1416
RAE	91995-70-9	J106	\N	P 1255975	41055	Dibenzo[a,h]anthracene	0.700	Incomplete	1417
RAE	91995-70-9	J106	\N	P 1255975	41055	Indeno[1,2,3-cd]pyrene	0.900	Incomplete	1418
RAE	91995-70-9	J106	\N	P 1255975	41055	Perylene	1.000	Incomplete	1419
RAE	91995-70-9	J106	\N	P 1255975	41055	Triphenylene	1.100	Incomplete	1420
SRGO	64741-43-1	CON_01	\N	\N	\N	1-Methylnaphthalene	318.638	\N	1421
SRGO	64741-43-1	CON_01	\N	\N	\N	2-Methylnaphthalene	298.074	\N	1422
SRGO	64741-43-1	CON_01	\N	\N	\N	Acenaphthene	16.076	\N	1423
SRGO	64741-43-1	CON_01	\N	\N	\N	Acenaphthylene	0.909	\N	1424
SRGO	64741-43-1	CON_01	\N	\N	\N	Anthanthrene	ND	\N	1425
SRGO	64741-43-1	CON_01	\N	\N	\N	Anthracene	12.038	\N	1426
SRGO	64741-43-1	CON_01	\N	\N	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	1.096	\N	1427
SRGO	64741-43-1	CON_01	\N	\N	\N	Benzo[a]pyrene	0.004	\N	1428
SRGO	64741-43-1	CON_01	\N	\N	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	0.034	\N	1429
SRGO	64741-43-1	CON_01	\N	\N	\N	Benzo[b]naphtho[2,1-d]thiophene	12.373	\N	1430
SRGO	64741-43-1	CON_01	\N	\N	\N	Benzo[c]phenanthrene	0.108	\N	1431
SRGO	64741-43-1	CON_01	\N	\N	\N	Benzo[e]pyrene	0.026	\N	1432
SRGO	64741-43-1	CON_01	\N	\N	\N	Benzo[g,h,i]fluoranthene	0.088	\N	1433
SRGO	64741-43-1	CON_01	\N	\N	\N	Benzo[g,h,i]perylene	0.003	\N	1434
SRGO	64741-43-1	CON_01	\N	\N	\N	Benzo[j]fluoranthene	0.004	\N	1435
SRGO	64741-43-1	CON_01	\N	\N	\N	Benzo[k]fluoranthene	0.005	\N	1436
SRGO	64741-43-1	CON_01	\N	\N	\N	Chrysene/Benzo[a]phenanthrene	4.388	\N	1437
SRGO	64741-43-1	CON_01	\N	\N	\N	Coronene	0.001	\N	1438
SRGO	64741-43-1	CON_01	\N	\N	\N	Cyclopenta[cd]pyrene	ND	\N	1439
SRGO	64741-43-1	CON_01	\N	\N	\N	Dibenzo[a,h]anthracene	ND	\N	1440
SRGO	64741-43-1	CON_01	\N	\N	\N	Fluoranthene	26.335	\N	1441
SRGO	64741-43-1	CON_01	\N	\N	\N	Fluorene	66.303	\N	1442
SRGO	64741-43-1	CON_01	\N	\N	\N	Indeno[1,2,3-cd]pyrene	ND	\N	1443
SRGO	64741-43-1	CON_01	\N	\N	\N	Naphthalene	139.877	\N	1444
SRGO	64741-43-1	CON_01	\N	\N	\N	Perylene	0.004	\N	1445
SRGO	64741-43-1	CON_01	\N	\N	\N	Phenanthrene	528.080	\N	1446
SRGO	64741-43-1	CON_01	\N	\N	\N	Pyrene	35.604	\N	1447
SRGO	64741-43-1	CON_01	\N	\N	\N	Triphenylene	5.419	\N	1448
SRGO	64741-43-1	CON_05	\N	\N	\N	1-Methylnaphthalene	146.952	\N	1449
SRGO	64741-43-1	CON_05	\N	\N	\N	2-Methylnaphthalene	160.875	\N	1450
SRGO	64741-43-1	CON_05	\N	\N	\N	Acenaphthene	8.610	\N	1451
SRGO	64741-43-1	CON_05	\N	\N	\N	Acenaphthylene	1.103	\N	1452
SRGO	64741-43-1	CON_05	\N	\N	\N	Anthanthrene	ND	\N	1453
SRGO	64741-43-1	CON_05	\N	\N	\N	Anthracene	11.109	\N	1454
SRGO	64741-43-1	CON_05	\N	\N	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	3.449	\N	1455
SRGO	64741-43-1	CON_05	\N	\N	\N	Benzo[a]pyrene	0.015	\N	1456
SRGO	64741-43-1	CON_05	\N	\N	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	0.100	\N	1457
SRGO	64741-43-1	CON_05	\N	\N	\N	Benzo[b]naphtho[2,1-d]thiophene	11.536	\N	1458
SRGO	64741-43-1	CON_05	\N	\N	\N	Benzo[c]phenanthrene	0.622	\N	1459
SRGO	64741-43-1	CON_05	\N	\N	\N	Benzo[e]pyrene	0.133	\N	1460
SRGO	64741-43-1	CON_05	\N	\N	\N	Benzo[g,h,i]fluoranthene	0.478	\N	1461
SRGO	64741-43-1	CON_05	\N	\N	\N	Benzo[g,h,i]perylene	0.002	\N	1462
SRGO	64741-43-1	CON_05	\N	\N	\N	Benzo[j]fluoranthene	0.013	\N	1463
SRGO	64741-43-1	CON_05	\N	\N	\N	Benzo[k]fluoranthene	0.017	\N	1464
SRGO	64741-43-1	CON_05	\N	\N	\N	Chrysene/Benzo[a]phenanthrene	11.370	\N	1465
SRGO	64741-43-1	CON_05	\N	\N	\N	Coronene	ND	\N	1466
SRGO	64741-43-1	CON_05	\N	\N	\N	Cyclopenta[cd]pyrene	ND	\N	1467
SRGO	64741-43-1	CON_05	\N	\N	\N	Dibenzo[a,h]anthracene	ND	\N	1468
SRGO	64741-43-1	CON_05	\N	\N	\N	Fluoranthene	21.777	\N	1469
SRGO	64741-43-1	CON_05	\N	\N	\N	Fluorene	45.512	\N	1470
SRGO	64741-43-1	CON_05	\N	\N	\N	Indeno[1,2,3-cd]pyrene	ND	\N	1471
SRGO	64741-43-1	CON_05	\N	\N	\N	Naphthalene	55.484	\N	1472
SRGO	64741-43-1	CON_05	\N	\N	\N	Perylene	0.039	\N	1473
SRGO	64741-43-1	CON_05	\N	\N	\N	Phenanthrene	380.433	\N	1474
SRGO	64741-43-1	CON_05	\N	\N	\N	Pyrene	47.747	\N	1475
SRGO	64741-43-1	CON_05	\N	\N	\N	Triphenylene	15.573	\N	1476
SRGO	64741-43-1	J072	\N	P 1219949	40955	Anthracene	26.900	\N	1477
SRGO	64741-43-1	J072	\N	P 1219949	40955	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	0.100	\N	1478
SRGO	64741-43-1	J072	\N	P 1219949	40955	Benzo[e]pyrene	0.100	\N	1479
SRGO	64741-43-1	J072	\N	P 1219949	40955	Benzo[g,h,i]perylene	0.100	\N	1480
SRGO	64741-43-1	J072	\N	P 1219949	40955	Benzo[j]fluoranthene	0.100	\N	1481
SRGO	64741-43-1	J072	\N	P 1219949	40955	Benzo[k]fluoranthene	0.100	\N	1482
SRGO	64741-43-1	J072	\N	P 1219949	40955	Coronene	0.100	\N	1483
SRGO	64741-43-1	J072	\N	P 1219949	40955	Dibenzo[a,h]anthracene	0.100	\N	1484
SRGO	64741-43-1	J072	\N	P 1219949	40955	Indeno[1,2,3-cd]pyrene	0.100	\N	1485
SRGO	64741-43-1	J072	\N	P 1219949	40955	Perylene	0.100	\N	1486
SRGO	64741-43-1	J072	\N	P 1219949	40955	Triphenylene	0.300	\N	1487
SRGO	64741-43-1	J072	\N	P 1224709	40968	Anthracene	20.900	\N	1488
SRGO	64741-43-1	J072	\N	P 1224709	40968	Benzo[a]pyrene	0.100	\N	1489
SRGO	64741-43-1	J072	\N	P 1224709	40968	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	0.100	\N	1490
SRGO	64741-43-1	J072	\N	P 1224709	40968	Benzo[e]pyrene	0.100	\N	1491
SRGO	64741-43-1	J072	\N	P 1224709	40968	Benzo[g,h,i]perylene	0.100	\N	1492
SRGO	64741-43-1	J072	\N	P 1224709	40968	Benzo[j]fluoranthene	0.100	\N	1493
SRGO	64741-43-1	J072	\N	P 1224709	40968	Benzo[k]fluoranthene	0.100	\N	1494
SRGO	64741-43-1	J072	\N	P 1224709	40968	Coronene	0.100	\N	1495
SRGO	64741-43-1	J072	\N	P 1224709	40968	Dibenzo[a,h]anthracene	0.100	\N	1496
SRGO	64741-43-1	J072	\N	P 1224709	40968	Indeno[1,2,3-cd]pyrene	0.100	\N	1497
SRGO	64741-43-1	J072	\N	P 1224709	40968	Perylene	0.100	\N	1498
SRGO	64741-43-1	J072	\N	P 1224709	40968	Triphenylene	0.200	\N	1499
SRGO	64741-43-1	J072	\N	P 1233638	40991	Anthracene	5.600	\N	1500
SRGO	64741-43-1	J072	\N	P 1233638	40991	Benzo[a]pyrene	0.100	\N	1501
SRGO	64741-43-1	J072	\N	P 1233638	40991	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	0.100	\N	1502
SRGO	64741-43-1	J072	\N	P 1233638	40991	Benzo[e]pyrene	0.100	\N	1503
SRGO	64741-43-1	J072	\N	P 1233638	40991	Benzo[g,h,i]perylene	0.100	\N	1504
SRGO	64741-43-1	J072	\N	P 1233638	40991	Benzo[j]fluoranthene	0.100	\N	1505
SRGO	64741-43-1	J072	\N	P 1233638	40991	Benzo[k]fluoranthene	0.100	\N	1506
SRGO	64741-43-1	J072	\N	P 1233638	40991	Coronene	0.100	\N	1507
SRGO	64741-43-1	J072	\N	P 1233638	40991	Dibenzo[a,h]anthracene	0.100	\N	1508
SRGO	64741-43-1	J072	\N	P 1233638	40991	Indeno[1,2,3-cd]pyrene	0.100	\N	1509
SRGO	64741-43-1	J072	\N	P 1233638	40991	Perylene	0.100	\N	1510
SRGO	64741-43-1	J072	\N	P 1233638	40991	Triphenylene	0.200	\N	1511
SRGO	64741-43-1	J072	\N	P 1240003	41010	Anthracene	17.900	\N	1512
SRGO	64741-43-1	J072	\N	P 1240003	41010	Benzo[a]pyrene	0.100	\N	1513
SRGO	64741-43-1	J072	\N	P 1240003	41010	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	0.100	\N	1514
SRGO	64741-43-1	J072	\N	P 1240003	41010	Benzo[e]pyrene	0.100	\N	1515
SRGO	64741-43-1	J072	\N	P 1240003	41010	Benzo[g,h,i]perylene	0.100	\N	1516
SRGO	64741-43-1	J072	\N	P 1240003	41010	Benzo[j]fluoranthene	0.100	\N	1517
SRGO	64741-43-1	J072	\N	P 1240003	41010	Benzo[k]fluoranthene	0.100	\N	1518
SRGO	64741-43-1	J072	\N	P 1240003	41010	Coronene	0.100	\N	1519
SRGO	64741-43-1	J072	\N	P 1240003	41010	Dibenzo[a,h]anthracene	0.100	\N	1520
SRGO	64741-43-1	J072	\N	P 1240003	41010	Indeno[1,2,3-cd]pyrene	0.100	\N	1521
SRGO	64741-43-1	J072	\N	P 1240003	41010	Perylene	0.100	\N	1522
SRGO	64741-43-1	J072	\N	P 1240003	41010	Triphenylene	0.100	\N	1523
SRGO	64741-43-1	J072	\N	P 1246884	41029	Anthracene	17.900	\N	1524
SRGO	64741-43-1	J072	\N	P 1246884	41029	Benzo[a]pyrene	0.100	\N	1525
SRGO	64741-43-1	J072	\N	P 1246884	41029	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	0.100	\N	1526
SRGO	64741-43-1	J072	\N	P 1246884	41029	Benzo[e]pyrene	0.100	\N	1527
SRGO	64741-43-1	J072	\N	P 1246884	41029	Benzo[g,h,i]perylene	0.100	\N	1528
SRGO	64741-43-1	J072	\N	P 1246884	41029	Benzo[j]fluoranthene	0.100	\N	1529
SRGO	64741-43-1	J072	\N	P 1246884	41029	Benzo[k]fluoranthene	0.100	\N	1530
SRGO	64741-43-1	J072	\N	P 1246884	41029	Coronene	0.100	\N	1531
SRGO	64741-43-1	J072	\N	P 1246884	41029	Dibenzo[a,h]anthracene	0.100	\N	1532
SRGO	64741-43-1	J072	\N	P 1246884	41029	Indeno[1,2,3-cd]pyrene	0.100	\N	1533
SRGO	64741-43-1	J072	\N	P 1246884	41029	Perylene	0.100	\N	1534
SRGO	64741-43-1	J072	\N	P 1246884	41029	Triphenylene	0.200	\N	1535
SRGO	64741-43-1	J106	\N	P 1255293	41081	Anthracene	198.500	\N	1536
SRGO	64741-43-1	J106	\N	P 1255293	41081	Benzo[a]pyrene	0.100	\N	1537
SRGO	64741-43-1	J106	\N	P 1255293	41081	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	0.100	\N	1538
SRGO	64741-43-1	J106	\N	P 1255293	41081	Benzo[e]pyrene	0.100	\N	1539
SRGO	64741-43-1	J106	\N	P 1255293	41081	Benzo[g,h,i]perylene	0.100	\N	1540
SRGO	64741-43-1	J106	\N	P 1255293	41081	Benzo[j]fluoranthene	0.100	\N	1541
SRGO	64741-43-1	J106	\N	P 1255293	41081	Benzo[k]fluoranthene	0.100	\N	1542
SRGO	64741-43-1	J106	\N	P 1255293	41081	Coronene	0.100	\N	1543
SRGO	64741-43-1	J106	\N	P 1255293	41081	Dibenzo[a,h]anthracene	0.100	\N	1544
SRGO	64741-43-1	J106	\N	P 1255293	41081	Indeno[1,2,3-cd]pyrene	0.100	\N	1545
SRGO	64741-43-1	J106	\N	P 1255293	41081	Perylene	0.100	\N	1546
SRGO	64741-43-1	J106	\N	P 1255293	41081	Triphenylene	0.500	\N	1547
SRGO	64741-43-1	J106	\N	P 1257259	41060	Anthracene	183.000	\N	1548
SRGO	64741-43-1	J106	\N	P 1257259	41060	Benzo[a]pyrene	0.100	\N	1549
SRGO	64741-43-1	J106	\N	P 1257259	41060	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	0.100	\N	1550
SRGO	64741-43-1	J106	\N	P 1257259	41060	Benzo[e]pyrene	0.100	\N	1551
SRGO	64741-43-1	J106	\N	P 1257259	41060	Benzo[g,h,i]perylene	0.100	\N	1552
SRGO	64741-43-1	J106	\N	P 1257259	41060	Benzo[j]fluoranthene	0.100	\N	1553
SRGO	64741-43-1	J106	\N	P 1257259	41060	Benzo[k]fluoranthene	0.100	\N	1554
SRGO	64741-43-1	J106	\N	P 1257259	41060	Coronene	0.100	\N	1555
SRGO	64741-43-1	J106	\N	P 1257259	41060	Dibenzo[a,h]anthracene	0.100	\N	1556
SRGO	64741-43-1	J106	\N	P 1257259	41060	Indeno[1,2,3-cd]pyrene	0.100	\N	1557
SRGO	64741-43-1	J106	\N	P 1257259	41060	Triphenylene	0.700	\N	1558
SRGO	64741-43-1	J106	\N	P 1259291	41065	Anthracene	175.800	\N	1559
SRGO	64741-43-1	J106	\N	P 1259291	41065	Benzo[a]pyrene	0.100	\N	1560
SRGO	64741-43-1	J106	\N	P 1259291	41065	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	0.100	\N	1561
SRGO	64741-43-1	J106	\N	P 1259291	41065	Benzo[e]pyrene	0.100	\N	1562
SRGO	64741-43-1	J106	\N	P 1259291	41065	Benzo[g,h,i]perylene	0.100	\N	1563
SRGO	64741-43-1	J106	\N	P 1259291	41065	Benzo[j]fluoranthene	0.100	\N	1564
SRGO	64741-43-1	J106	\N	P 1259291	41065	Benzo[k]fluoranthene	0.100	\N	1565
SRGO	64741-43-1	J106	\N	P 1259291	41065	Coronene	0.100	\N	1566
SRGO	64741-43-1	J106	\N	P 1259291	41065	Dibenzo[a,h]anthracene	0.100	\N	1567
SRGO	64741-43-1	J106	\N	P 1259291	41065	Indeno[1,2,3-cd]pyrene	0.100	\N	1568
SRGO	64741-43-1	J106	\N	P 1259291	41065	Perylene	0.100	\N	1569
SRGO	64741-43-1	J106	\N	P 1259291	41065	Triphenylene	0.700	\N	1570
SRGO	64741-43-1	J106	\N	P 1261259	41070	Anthracene	172.700	\N	1571
SRGO	64741-43-1	J106	\N	P 1261259	41070	Benzo[a]pyrene	0.100	\N	1572
SRGO	64741-43-1	J106	\N	P 1261259	41070	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	0.100	\N	1573
SRGO	64741-43-1	J106	\N	P 1261259	41070	Benzo[e]pyrene	0.100	\N	1574
SRGO	64741-43-1	J106	\N	P 1261259	41070	Benzo[g,h,i]perylene	0.100	\N	1575
SRGO	64741-43-1	J106	\N	P 1261259	41070	Benzo[j]fluoranthene	0.100	\N	1576
SRGO	64741-43-1	J106	\N	P 1261259	41070	Benzo[k]fluoranthene	0.100	\N	1577
SRGO	64741-43-1	J106	\N	P 1261259	41070	Coronene	0.100	\N	1578
SRGO	64741-43-1	J106	\N	P 1261259	41070	Dibenzo[a,h]anthracene	0.100	\N	1579
SRGO	64741-43-1	J106	\N	P 1261259	41070	Indeno[1,2,3-cd]pyrene	0.100	\N	1580
SRGO	64741-43-1	J106	\N	P 1261259	41070	Perylene	0.100	\N	1581
SRGO	64741-43-1	J106	\N	P 1261259	41070	Triphenylene	1.000	\N	1582
SRGO	64741-43-1	J106	\N	P 1263090	41075	Anthracene	152.900	\N	1583
SRGO	64741-43-1	J106	\N	P 1263090	41075	Benzo[a]pyrene	0.100	\N	1584
SRGO	64741-43-1	J106	\N	P 1263090	41075	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	0.100	\N	1585
SRGO	64741-43-1	J106	\N	P 1263090	41075	Benzo[e]pyrene	0.100	\N	1586
SRGO	64741-43-1	J106	\N	P 1263090	41075	Benzo[g,h,i]perylene	0.100	\N	1587
SRGO	64741-43-1	J106	\N	P 1263090	41075	Benzo[j]fluoranthene	0.100	\N	1588
SRGO	64741-43-1	J106	\N	P 1263090	41075	Benzo[k]fluoranthene	0.100	\N	1589
SRGO	64741-43-1	J106	\N	P 1263090	41075	Coronene	0.100	\N	1590
SRGO	64741-43-1	J106	\N	P 1263090	41075	Dibenzo[a,h]anthracene	0.100	\N	1591
SRGO	64741-43-1	J106	\N	P 1263090	41075	Indeno[1,2,3-cd]pyrene	0.100	\N	1592
SRGO	64741-43-1	J106	\N	P 1263090	41075	Perylene	0.100	\N	1593
SRGO	64741-43-1	J106	\N	P 1263090	41075	Triphenylene	1.900	\N	1594
SRGO	64741-44-2	TP511	\N	\N	GC-MS	Acenaphthene	ND	\N	1595
SRGO	64741-44-2	TP511	\N	\N	GC-MS	Acenaphthylene	ND	\N	1596
SRGO	64741-44-2	TP511	\N	\N	GC-MS	Anthracene	ND	\N	1597
SRGO	64741-44-2	TP511	\N	\N	GC-MS	Benzo[a]anthracene/Benzo[b]phenanthrene	ND	\N	1598
SRGO	64741-44-2	TP511	\N	\N	GC-MS	Benzo[a]pyrene	ND	\N	1599
SRGO	64741-44-2	TP511	\N	\N	GC-MS	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	ND	\N	1600
SRGO	64741-44-2	TP511	\N	\N	GC-MS	Benzo[e]pyrene	ND	\N	1601
SRGO	64741-44-2	TP511	\N	\N	GC-MS	Benzo[k]fluoranthene	ND	\N	1602
SRGO	64741-44-2	TP511	\N	\N	GC-MS	Chrysene/Benzo[a]phenanthrene	ND	\N	1603
SRGO	64741-44-2	TP511	\N	\N	GC-MS	Fluoranthene	ND	\N	1604
SRGO	64741-44-2	TP511	\N	\N	GC-MS	Fluorene	32.200	\N	1605
SRGO	64741-44-2	TP511	\N	\N	GC-MS	Naphthalene	35.600	\N	1606
SRGO	64741-44-2	TP511	\N	\N	GC-MS	Perylene	ND	\N	1607
SRGO	64741-44-2	TP511	\N	\N	GC-MS	Phenanthrene	58.400	\N	1608
SRGO	64741-44-2	TP511	\N	\N	GC-MS	Pyrene	ND	\N	1609
SRGO	68814-87-9	TP512	\N	\N	GC-MS	Acenaphthene	24.400	\N	1610
SRGO	68814-87-9	TP512	\N	\N	GC-MS	Acenaphthylene	54.800	\N	1611
SRGO	68814-87-9	TP512	\N	\N	GC-MS	Anthracene	ND	\N	1612
SRGO	68814-87-9	TP512	\N	\N	GC-MS	Benzo[a]anthracene/Benzo[b]phenanthrene	ND	\N	1613
SRGO	68814-87-9	TP512	\N	\N	GC-MS	Benzo[a]pyrene	ND	\N	1614
SRGO	68814-87-9	TP512	\N	\N	GC-MS	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	ND	\N	1615
SRGO	68814-87-9	TP512	\N	\N	GC-MS	Benzo[e]pyrene	ND	\N	1616
SRGO	68814-87-9	TP512	\N	\N	GC-MS	Benzo[k]fluoranthene	ND	\N	1617
SRGO	68814-87-9	TP512	\N	\N	GC-MS	Chrysene/Benzo[a]phenanthrene	ND	\N	1618
SRGO	68814-87-9	TP512	\N	\N	GC-MS	Fluoranthene	ND	\N	1619
SRGO	68814-87-9	TP512	\N	\N	GC-MS	Fluorene	89.900	\N	1620
SRGO	68814-87-9	TP512	\N	\N	GC-MS	Naphthalene	18.500	\N	1621
SRGO	68814-87-9	TP512	\N	\N	GC-MS	Perylene	ND	\N	1622
SRGO	68814-87-9	TP512	\N	\N	GC-MS	Phenanthrene	92.600	\N	1623
SRGO	68814-87-9	TP512	\N	\N	GC-MS	Pyrene	ND	\N	1624
SRGO	68915-96-8	TP421	\N	205729	Grimmer	Acenaphthene	1.507	\N	1625
SRGO	68915-96-8	TP421	\N	205729	Grimmer	Acenaphthylene	ND	\N	1626
SRGO	68915-96-8	TP421	\N	205729	Grimmer	Anthanthrene	ND	\N	1627
SRGO	68915-96-8	TP421	\N	205729	Grimmer	Anthracene	0.055	\N	1628
SRGO	68915-96-8	TP421	\N	205729	Grimmer	Benzo[a]anthracene/Benzo[b]phenanthrene	0.892	\N	1629
SRGO	68915-96-8	TP421	\N	205729	Grimmer	Benzo[a]pyrene	0.060	\N	1630
SRGO	68915-96-8	TP421	\N	205729	Grimmer	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	0.706	\N	1631
SRGO	68915-96-8	TP421	\N	205729	Grimmer	Benzo[b]naphtho[2,1-d]thiophene	0.481	\N	1632
SRGO	68915-96-8	TP421	\N	205729	Grimmer	Benzo[c]phenanthrene	0.474	\N	1633
SRGO	68915-96-8	TP421	\N	205729	Grimmer	Benzo[e]pyrene	0.996	\N	1634
SRGO	68915-96-8	TP421	\N	205729	Grimmer	Benzo[g,h,i]fluoranthene	0.477	\N	1635
SRGO	68915-96-8	TP421	\N	205729	Grimmer	Benzo[g,h,i]perylene	0.026	\N	1636
SRGO	68915-96-8	TP421	\N	205729	Grimmer	Benzo[j]fluoranthene	0.076	\N	1637
SRGO	68915-96-8	TP421	\N	205729	Grimmer	Benzo[k]fluoranthene	0.070	\N	1638
SRGO	68915-96-8	TP421	\N	205729	Grimmer	Chrysene/Benzo[a]phenanthrene	7.278	\N	1639
SRGO	68915-96-8	TP421	\N	205729	Grimmer	Coronene	ND	\N	1640
SRGO	68915-96-8	TP421	\N	205729	Grimmer	Cyclopenta[cd]pyrene	ND	\N	1641
SRGO	68915-96-8	TP421	\N	205729	Grimmer	Dibenzo[a,h]anthracene	ND	\N	1642
SRGO	68915-96-8	TP421	\N	205729	Grimmer	Fluoranthene	10.320	\N	1643
SRGO	68915-96-8	TP421	\N	205729	Grimmer	Fluorene	4.307	\N	1644
SRGO	68915-96-8	TP421	\N	205729	Grimmer	Indeno[1,2,3-cd]pyrene	ND	\N	1645
SRGO	68915-96-8	TP421	\N	205729	Grimmer	Naphthalene	8.047	\N	1646
SRGO	68915-96-8	TP421	\N	205729	Grimmer	Perylene	0.069	\N	1647
SRGO	68915-96-8	TP421	\N	205729	Grimmer	Phenanthrene	13.033	\N	1648
SRGO	68915-96-8	TP421	\N	205729	Grimmer	Pyrene	99.654	\N	1649
SRGO	68915-96-8	TP421	\N	205729	Grimmer	Triphenylene	19.805	\N	1650
SRGO	68915-96-8	TP513	\N	\N	GC-MS	Acenaphthene	ND	\N	1651
SRGO	68915-96-8	TP513	\N	\N	GC-MS	Acenaphthylene	ND	\N	1652
SRGO	68915-96-8	TP513	\N	\N	GC-MS	Anthracene	ND	\N	1653
SRGO	68915-96-8	TP513	\N	\N	GC-MS	Benzo[a]anthracene/Benzo[b]phenanthrene	ND	\N	1654
SRGO	68915-96-8	TP513	\N	\N	GC-MS	Benzo[a]pyrene	ND	\N	1655
SRGO	68915-96-8	TP513	\N	\N	GC-MS	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	ND	\N	1656
SRGO	68915-96-8	TP513	\N	\N	GC-MS	Benzo[e]pyrene	ND	\N	1657
SRGO	68915-96-8	TP513	\N	\N	GC-MS	Benzo[k]fluoranthene	ND	\N	1658
SRGO	68915-96-8	TP513	\N	\N	GC-MS	Chrysene/Benzo[a]phenanthrene	ND	\N	1659
SRGO	68915-96-8	TP513	\N	\N	GC-MS	Fluoranthene	ND	\N	1660
SRGO	68915-96-8	TP513	\N	\N	GC-MS	Fluorene	2.800	\N	1661
SRGO	68915-96-8	TP513	\N	\N	GC-MS	Naphthalene	0.410	\N	1662
SRGO	68915-96-8	TP513	\N	\N	GC-MS	Perylene	ND	\N	1663
SRGO	68915-96-8	TP513	\N	\N	GC-MS	Phenanthrene	33.800	\N	1664
SRGO	68915-96-8	TP513	\N	\N	GC-MS	Pyrene	ND	\N	1665
VHGO	64741-49-7	CON_12	\N	\N	\N	1-Methylnaphthalene	479.902	\N	1666
VHGO	64741-49-7	CON_12	\N	\N	\N	2-Methylnaphthalene	487.124	\N	1667
VHGO	64741-49-7	CON_12	\N	\N	\N	Acenaphthene	71.892	\N	1668
VHGO	64741-49-7	CON_12	\N	\N	\N	Acenaphthylene	1.181	\N	1669
VHGO	64741-49-7	CON_12	\N	\N	\N	Anthanthrene	ND	\N	1670
VHGO	64741-49-7	CON_12	\N	\N	\N	Anthracene	27.106	\N	1671
VHGO	64741-49-7	CON_12	\N	\N	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	2.031	\N	1672
VHGO	64741-49-7	CON_12	\N	\N	\N	Benzo[a]pyrene	0.153	\N	1673
VHGO	64741-49-7	CON_12	\N	\N	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	0.572	\N	1674
VHGO	64741-49-7	CON_12	\N	\N	\N	Benzo[b]naphtho[2,1-d]thiophene	8.275	\N	1675
VHGO	64741-49-7	CON_12	\N	\N	\N	Benzo[c]phenanthrene	0.372	\N	1676
VHGO	64741-49-7	CON_12	\N	\N	\N	Benzo[e]pyrene	1.252	\N	1677
VHGO	64741-49-7	CON_12	\N	\N	\N	Benzo[g,h,i]fluoranthene	0.202	\N	1678
VHGO	64741-49-7	CON_12	\N	\N	\N	Benzo[g,h,i]perylene	0.056	\N	1679
VHGO	64741-49-7	CON_12	\N	\N	\N	Benzo[j]fluoranthene	0.051	\N	1680
VHGO	64741-49-7	CON_12	\N	\N	\N	Benzo[k]fluoranthene	0.093	\N	1681
VHGO	64741-49-7	CON_12	\N	\N	\N	Chrysene/Benzo[a]phenanthrene	8.710	\N	1682
VHGO	64741-49-7	CON_12	\N	\N	\N	Coronene	ND	\N	1683
VHGO	64741-49-7	CON_12	\N	\N	\N	Cyclopenta[cd]pyrene	ND	\N	1684
VHGO	64741-49-7	CON_12	\N	\N	\N	Dibenzo[a,h]anthracene	0.007	\N	1685
VHGO	64741-49-7	CON_12	\N	\N	\N	Fluoranthene	13.801	\N	1686
VHGO	64741-49-7	CON_12	\N	\N	\N	Fluorene	208.513	\N	1687
VHGO	64741-49-7	CON_12	\N	\N	\N	Indeno[1,2,3-cd]pyrene	ND	\N	1688
VHGO	64741-49-7	CON_12	\N	\N	\N	Naphthalene	144.466	\N	1689
VHGO	64741-49-7	CON_12	\N	\N	\N	Perylene	0.920	\N	1690
VHGO	64741-49-7	CON_12	\N	\N	\N	Phenanthrene	973.305	\N	1691
VHGO	64741-49-7	CON_12	\N	\N	\N	Pyrene	23.025	\N	1692
VHGO	64741-49-7	CON_12	\N	\N	\N	Triphenylene	9.872	\N	1693
VHGO	64741-58-8	CON_13	\N	\N	\N	1-Methylnaphthalene	13.964	\N	1694
VHGO	64741-58-8	CON_13	\N	\N	\N	2-Methylnaphthalene	25.027	\N	1695
VHGO	64741-58-8	CON_13	\N	\N	\N	Acenaphthene	5.177	\N	1696
VHGO	64741-58-8	CON_13	\N	\N	\N	Acenaphthylene	0.081	\N	1697
VHGO	64741-58-8	CON_13	\N	\N	\N	Anthanthrene	0.365	\N	1698
VHGO	64741-58-8	CON_13	\N	\N	\N	Anthracene	14.595	\N	1699
VHGO	64741-58-8	CON_13	\N	\N	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	27.378	\N	1700
VHGO	64741-58-8	CON_13	\N	\N	\N	Benzo[a]pyrene	9.607	\N	1701
VHGO	64741-58-8	CON_13	\N	\N	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	16.348	\N	1702
VHGO	64741-58-8	CON_13	\N	\N	\N	Benzo[b]naphtho[2,1-d]thiophene	30.873	\N	1703
VHGO	64741-58-8	CON_13	\N	\N	\N	Benzo[c]phenanthrene	1.629	\N	1704
VHGO	64741-58-8	CON_13	\N	\N	\N	Benzo[e]pyrene	24.612	\N	1705
VHGO	64741-58-8	CON_13	\N	\N	\N	Benzo[g,h,i]fluoranthene	1.222	\N	1706
VHGO	64741-58-8	CON_13	\N	\N	\N	Benzo[g,h,i]perylene	4.719	\N	1707
VHGO	64741-58-8	CON_13	\N	\N	\N	Benzo[j]fluoranthene	2.584	\N	1708
VHGO	64741-58-8	CON_13	\N	\N	\N	Benzo[k]fluoranthene	2.763	\N	1709
VHGO	64741-58-8	CON_13	\N	\N	\N	Chrysene/Benzo[a]phenanthrene	53.445	\N	1710
VHGO	64741-58-8	CON_13	\N	\N	\N	Coronene	0.330	\N	1711
VHGO	64741-58-8	CON_13	\N	\N	\N	Cyclopenta[cd]pyrene	ND	\N	1712
VHGO	64741-58-8	CON_13	\N	\N	\N	Dibenzo[a,h]anthracene	1.482	\N	1713
VHGO	64741-58-8	CON_13	\N	\N	\N	Fluoranthene	34.390	\N	1714
VHGO	64741-58-8	CON_13	\N	\N	\N	Fluorene	39.214	\N	1715
VHGO	64741-58-8	CON_13	\N	\N	\N	Indeno[1,2,3-cd]pyrene	1.591	\N	1716
VHGO	64741-58-8	CON_13	\N	\N	\N	Naphthalene	7.593	\N	1717
VHGO	64741-58-8	CON_13	\N	\N	\N	Perylene	21.037	\N	1718
VHGO	64741-58-8	CON_13	\N	\N	\N	Phenanthrene	330.850	\N	1719
VHGO	64741-58-8	CON_13	\N	\N	\N	Pyrene	67.914	\N	1720
VHGO	64741-58-8	CON_13	\N	\N	\N	Triphenylene	38.354	\N	1721
VHGO	64742-87-6	CON_15	\N	\N	\N	1-Methylnaphthalene	177.202	\N	1722
VHGO	64742-87-6	CON_15	\N	\N	\N	2-Methylnaphthalene	205.500	\N	1723
VHGO	64742-87-6	CON_15	\N	\N	\N	Acenaphthene	22.402	\N	1724
VHGO	64742-87-6	CON_15	\N	\N	\N	Acenaphthylene	0.315	\N	1725
VHGO	64742-87-6	CON_15	\N	\N	\N	Anthanthrene	ND	\N	1726
VHGO	64742-87-6	CON_15	\N	\N	\N	Anthracene	ND	\N	1727
VHGO	64742-87-6	CON_15	\N	\N	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	0.998	\N	1728
VHGO	64742-87-6	CON_15	\N	\N	\N	Benzo[a]pyrene	0.157	\N	1729
VHGO	64742-87-6	CON_15	\N	\N	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	0.960	\N	1730
VHGO	64742-87-6	CON_15	\N	\N	\N	Benzo[b]naphtho[2,1-d]thiophene	0.034	\N	1731
VHGO	64742-87-6	CON_15	\N	\N	\N	Benzo[c]phenanthrene	0.569	\N	1732
VHGO	64742-87-6	CON_15	\N	\N	\N	Benzo[e]pyrene	2.423	\N	1733
VHGO	64742-87-6	CON_15	\N	\N	\N	Benzo[g,h,i]fluoranthene	0.555	\N	1734
VHGO	64742-87-6	CON_15	\N	\N	\N	Benzo[g,h,i]perylene	0.044	\N	1735
VHGO	64742-87-6	CON_15	\N	\N	\N	Benzo[j]fluoranthene	0.084	\N	1736
VHGO	64742-87-6	CON_15	\N	\N	\N	Benzo[k]fluoranthene	0.238	\N	1737
VHGO	64742-87-6	CON_15	\N	\N	\N	Chrysene/Benzo[a]phenanthrene	5.725	\N	1738
VHGO	64742-87-6	CON_15	\N	\N	\N	Coronene	ND	\N	1739
VHGO	64742-87-6	CON_15	\N	\N	\N	Cyclopenta[cd]pyrene	ND	\N	1740
VHGO	64742-87-6	CON_15	\N	\N	\N	Dibenzo[a,h]anthracene	0.005	\N	1741
VHGO	64742-87-6	CON_15	\N	\N	\N	Fluoranthene	5.920	\N	1742
VHGO	64742-87-6	CON_15	\N	\N	\N	Fluorene	42.862	\N	1743
VHGO	64742-87-6	CON_15	\N	\N	\N	Indeno[1,2,3-cd]pyrene	ND	\N	1744
VHGO	64742-87-6	CON_15	\N	\N	\N	Naphthalene	153.440	\N	1745
VHGO	64742-87-6	CON_15	\N	\N	\N	Perylene	0.073	\N	1746
VHGO	64742-87-6	CON_15	\N	\N	\N	Phenanthrene	140.665	\N	1747
VHGO	64742-87-6	CON_15	\N	\N	\N	Pyrene	79.874	\N	1748
VHGO	64742-87-6	CON_15	\N	\N	\N	Triphenylene	7.790	\N	1749
VHGO	68334-30-5	CON_16i	\N	\N	\N	1-Methylnaphthalene	658.928	\N	1750
VHGO	68334-30-5	CON_16i	\N	\N	\N	2-Methylnaphthalene	809.643	\N	1751
VHGO	68334-30-5	CON_16i	\N	\N	\N	Acenaphthene	19.636	\N	1752
VHGO	68334-30-5	CON_16i	\N	\N	\N	Acenaphthylene	0.631	\N	1753
VHGO	68334-30-5	CON_16i	\N	\N	\N	Anthanthrene	ND	\N	1754
VHGO	68334-30-5	CON_16i	\N	\N	\N	Anthracene	ND	\N	1755
VHGO	68334-30-5	CON_16i	\N	\N	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	0.139	\N	1756
VHGO	68334-30-5	CON_16i	\N	\N	\N	Benzo[a]pyrene	0.044	\N	1757
VHGO	68334-30-5	CON_16i	\N	\N	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	0.305	\N	1758
VHGO	68334-30-5	CON_16i	\N	\N	\N	Benzo[b]naphtho[2,1-d]thiophene	0.094	\N	1759
VHGO	68334-30-5	CON_16i	\N	\N	\N	Benzo[c]phenanthrene	0.225	\N	1760
VHGO	68334-30-5	CON_16i	\N	\N	\N	Benzo[e]pyrene	1.107	\N	1761
VHGO	68334-30-5	CON_16i	\N	\N	\N	Benzo[g,h,i]fluoranthene	0.206	\N	1762
VHGO	68334-30-5	CON_16i	\N	\N	\N	Benzo[g,h,i]perylene	0.110	\N	1763
VHGO	68334-30-5	CON_16i	\N	\N	\N	Benzo[j]fluoranthene	0.018	\N	1764
VHGO	68334-30-5	CON_16i	\N	\N	\N	Benzo[k]fluoranthene	0.070	\N	1765
VHGO	68334-30-5	CON_16i	\N	\N	\N	Chrysene/Benzo[a]phenanthrene	1.694	\N	1766
VHGO	68334-30-5	CON_16i	\N	\N	\N	Coronene	0.004	\N	1767
VHGO	68334-30-5	CON_16i	\N	\N	\N	Cyclopenta[cd]pyrene	ND	\N	1768
VHGO	68334-30-5	CON_16i	\N	\N	\N	Dibenzo[a,h]anthracene	0.004	\N	1769
VHGO	68334-30-5	CON_16i	\N	\N	\N	Fluoranthene	1.541	\N	1770
VHGO	68334-30-5	CON_16i	\N	\N	\N	Fluorene	79.830	\N	1771
VHGO	68334-30-5	CON_16i	\N	\N	\N	Indeno[1,2,3-cd]pyrene	ND	\N	1772
VHGO	68334-30-5	CON_16i	\N	\N	\N	Naphthalene	790.094	\N	1773
VHGO	68334-30-5	CON_16i	\N	\N	\N	Perylene	0.022	\N	1774
VHGO	68334-30-5	CON_16i	\N	\N	\N	Phenanthrene	109.664	\N	1775
VHGO	68334-30-5	CON_16i	\N	\N	\N	Pyrene	21.991	\N	1776
VHGO	68334-30-5	CON_16i	\N	\N	\N	Triphenylene	3.616	\N	1777
VHGO	68334-30-5	CON_16ii	\N	\N	\N	1-Methylnaphthalene	220.092	\N	1778
VHGO	68334-30-5	CON_16ii	\N	\N	\N	2-Methylnaphthalene	248.056	\N	1779
VHGO	68334-30-5	CON_16ii	\N	\N	\N	Acenaphthene	14.247	\N	1780
VHGO	68334-30-5	CON_16ii	\N	\N	\N	Acenaphthylene	0.510	\N	1781
VHGO	68334-30-5	CON_16ii	\N	\N	\N	Anthanthrene	ND	\N	1782
VHGO	68334-30-5	CON_16ii	\N	\N	\N	Anthracene	ND	\N	1783
VHGO	68334-30-5	CON_16ii	\N	\N	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	0.162	\N	1784
VHGO	68334-30-5	CON_16ii	\N	\N	\N	Benzo[a]pyrene	0.015	\N	1785
VHGO	68334-30-5	CON_16ii	\N	\N	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	0.157	\N	1786
VHGO	68334-30-5	CON_16ii	\N	\N	\N	Benzo[b]naphtho[2,1-d]thiophene	ND	\N	1787
VHGO	68334-30-5	CON_16ii	\N	\N	\N	Benzo[c]phenanthrene	0.136	\N	1788
VHGO	68334-30-5	CON_16ii	\N	\N	\N	Benzo[e]pyrene	0.219	\N	1789
VHGO	68334-30-5	CON_16ii	\N	\N	\N	Benzo[g,h,i]fluoranthene	0.121	\N	1790
VHGO	68334-30-5	CON_16ii	\N	\N	\N	Benzo[g,h,i]perylene	0.013	\N	1791
VHGO	68334-30-5	CON_16ii	\N	\N	\N	Benzo[j]fluoranthene	0.011	\N	1792
VHGO	68334-30-5	CON_16ii	\N	\N	\N	Benzo[k]fluoranthene	0.027	\N	1793
VHGO	68334-30-5	CON_16ii	\N	\N	\N	Chrysene/Benzo[a]phenanthrene	1.238	\N	1794
VHGO	68334-30-5	CON_16ii	\N	\N	\N	Coronene	ND	\N	1795
VHGO	68334-30-5	CON_16ii	\N	\N	\N	Cyclopenta[cd]pyrene	ND	\N	1796
VHGO	68334-30-5	CON_16ii	\N	\N	\N	Dibenzo[a,h]anthracene	ND	\N	1797
VHGO	68334-30-5	CON_16ii	\N	\N	\N	Fluoranthene	1.848	\N	1798
VHGO	68334-30-5	CON_16ii	\N	\N	\N	Fluorene	81.940	\N	1799
VHGO	68334-30-5	CON_16ii	\N	\N	\N	Indeno[1,2,3-cd]pyrene	ND	\N	1800
VHGO	68334-30-5	CON_16ii	\N	\N	\N	Naphthalene	109.989	\N	1801
VHGO	68334-30-5	CON_16ii	\N	\N	\N	Perylene	0.013	\N	1802
VHGO	68334-30-5	CON_16ii	\N	\N	\N	Phenanthrene	131.935	\N	1803
VHGO	68334-30-5	CON_16ii	\N	\N	\N	Pyrene	15.127	\N	1804
VHGO	68334-30-5	CON_16ii	\N	\N	\N	Triphenylene	2.201	\N	1805
VHGO	68334-30-5	G2_01	\N	\N	\N	Acenaphthene	9450.000	\N	1806
VHGO	68334-30-5	G2_01	\N	\N	\N	Acenaphthylene	2420.000	\N	1807
VHGO	68334-30-5	G2_01	\N	\N	\N	Anthracene	336.000	\N	1808
VHGO	68334-30-5	G2_01	\N	\N	\N	Fluorene	2500.000	\N	1809
VHGO	68334-30-5	G2_02	\N	\N	\N	Acenaphthene	43.000	\N	1810
VHGO	68334-30-5	G2_02	\N	\N	\N	Acenaphthylene	84.000	\N	1811
VHGO	68334-30-5	G2_02	\N	\N	\N	Anthracene	13.000	\N	1812
VHGO	68334-30-5	G2_02	\N	\N	\N	Fluorene	16.000	\N	1813
VHGO	68334-30-5	G2_03	\N	\N	\N	Acenaphthene	1330.000	\N	1814
VHGO	68334-30-5	G2_03	\N	\N	\N	Acenaphthylene	2170.000	\N	1815
VHGO	68334-30-5	G2_03	\N	\N	\N	Anthracene	110.000	\N	1816
VHGO	68334-30-5	G2_03	\N	\N	\N	Fluorene	872.000	\N	1817
VHGO	68334-30-5	G2_04	\N	\N	\N	Acenaphthene	1030.000	\N	1818
VHGO	68334-30-5	G2_04	\N	\N	\N	Acenaphthylene	2410.000	\N	1819
VHGO	68334-30-5	G2_04	\N	\N	\N	Anthracene	104.000	\N	1820
VHGO	68334-30-5	G2_04	\N	\N	\N	Fluorene	938.000	\N	1821
VHGO	68334-30-5	G2_05	\N	\N	\N	Acenaphthene	56.000	\N	1822
VHGO	68334-30-5	G2_05	\N	\N	\N	Acenaphthylene	491.000	\N	1823
VHGO	68334-30-5	G2_05	\N	\N	\N	Anthracene	123.000	\N	1824
VHGO	68334-30-5	G2_05	\N	\N	\N	Fluorene	367.000	\N	1825
VHGO	68334-30-5	G2_07	\N	\N	\N	Acenaphthene	ND	\N	1826
VHGO	68334-30-5	G2_07	\N	\N	\N	Acenaphthylene	2.000	\N	1827
VHGO	68334-30-5	G2_07	\N	\N	\N	Anthracene	56.000	\N	1828
VHGO	68334-30-5	G2_07	\N	\N	\N	Fluorene	74.000	\N	1829
VHGO	68334-30-5	G2_08	\N	\N	\N	Acenaphthene	2.000	\N	1830
VHGO	68334-30-5	G2_08	\N	\N	\N	Acenaphthylene	12.000	\N	1831
VHGO	68334-30-5	G2_08	\N	\N	\N	Anthracene	250.000	\N	1832
VHGO	68334-30-5	G2_08	\N	\N	\N	Fluorene	328.000	\N	1833
VHGO	68334-30-5	G2_09	\N	\N	\N	Acenaphthene	ND	\N	1834
VHGO	68334-30-5	G2_09	\N	\N	\N	Acenaphthylene	ND	\N	1835
VHGO	68334-30-5	G2_09	\N	\N	\N	Anthracene	26.000	\N	1836
VHGO	68334-30-5	G2_09	\N	\N	\N	Fluorene	26.000	\N	1837
VHGO	68334-30-5	G2_12	\N	\N	\N	Acenaphthene	ND	\N	1838
VHGO	68334-30-5	G2_12	\N	\N	\N	Acenaphthylene	ND	\N	1839
VHGO	68334-30-5	G2_12	\N	\N	\N	Anthracene	ND	\N	1840
VHGO	68334-30-5	G2_12	\N	\N	\N	Fluorene	ND	\N	1841
VHGO	68334-30-5	G2_13	\N	\N	\N	Acenaphthene	ND	\N	1842
VHGO	68334-30-5	G2_13	\N	\N	\N	Acenaphthylene	ND	\N	1843
VHGO	68334-30-5	G2_13	\N	\N	\N	Anthracene	ND	\N	1844
VHGO	68334-30-5	G2_13	\N	\N	\N	Fluorene	1.000	\N	1845
VHGO	68334-30-5	G2_17	\N	\N	\N	Acenaphthene	12450.000	\N	1846
VHGO	68334-30-5	G2_17	\N	\N	\N	Acenaphthylene	17329.000	\N	1847
VHGO	68334-30-5	G2_17	\N	\N	\N	Anthracene	1392.000	\N	1848
VHGO	68334-30-5	G2_17	\N	\N	\N	Fluorene	7986.000	\N	1849
VHGO	68334-30-5	J050	\N	21.06.2012	41081	Anthracene	11.700	\N	1850
VHGO	68334-30-5	J050	\N	21.06.2012	41081	Benzo[a]pyrene	0.060	\N	1851
VHGO	68334-30-5	J050	\N	21.06.2012	41081	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	2.380	\N	1852
VHGO	68334-30-5	J050	\N	21.06.2012	41081	Benzo[g,h,i]perylene	0.060	\N	1853
VHGO	68334-30-5	J050	\N	21.06.2012	41081	Benzo[k]fluoranthene	0.400	\N	1854
VHGO	68334-30-5	J050	\N	21.06.2012	41081	Dibenzo[a,h]anthracene	0.060	\N	1855
VHGO	68334-30-5	J050	\N	21.06.2012	41081	Indeno[1,2,3-cd]pyrene	0.060	\N	1856
VHGO	68334-30-5	J050	\N	\N	41081	Benzo[c]fluorene	ND	\N	1857
VHGO	68334-30-5	J050	\N	\N	41081	Benzo[e]pyrene	ND	\N	1858
VHGO	68334-30-5	J050	\N	\N	41081	Benzo[j]fluoranthene	ND	\N	1859
VHGO	68334-30-5	J050	\N	\N	41081	Coronene	ND	\N	1860
VHGO	68334-30-5	J050	\N	\N	41081	Dibenzo[a,e]pyrene	ND	\N	1861
VHGO	68334-30-5	J050	\N	\N	41081	Dibenzo[a,h]pyrene	ND	\N	1862
VHGO	68334-30-5	J050	\N	\N	41081	Dibenzo[a,i]pyrene	ND	\N	1863
VHGO	68334-30-5	J050	\N	\N	41081	Dibenzo[a,l]pyrene	ND	\N	1864
VHGO	68334-30-5	J050	\N	\N	41081	Perylene	ND	\N	1865
VHGO	68334-30-5	J050	\N	\N	41081	Triphenylene	ND	\N	1866
VHGO	68334-30-5	TP084	\N	\N	UOP 915	Acenaphthene	360.000	\N	1867
VHGO	68334-30-5	TP084	\N	\N	UOP 915	Acenaphthylene	49.500	\N	1868
VHGO	68334-30-5	TP084	\N	\N	UOP 915	Anthracene	11.700	\N	1869
VHGO	68334-30-5	TP084	\N	\N	UOP 915	Benzo[a]pyrene	ND	\N	1870
VHGO	68334-30-5	TP084	\N	\N	UOP 915	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	2.380	\N	1871
VHGO	68334-30-5	TP084	\N	\N	UOP 915	Benzo[g,h,i]perylene	ND	\N	1872
VHGO	68334-30-5	TP084	\N	\N	UOP 915	Benzo[k]fluoranthene	0.400	\N	1873
VHGO	68334-30-5	TP084	\N	\N	UOP 915	Chrysene/Benzo[a]phenanthrene	6.830	\N	1874
VHGO	68334-30-5	TP084	\N	\N	UOP 915	Dibenzo[a,h]anthracene	4.060	\N	1875
VHGO	68334-30-5	TP084	\N	\N	UOP 915	Dibenzo[a,h]anthracene	ND	\N	1876
VHGO	68334-30-5	TP084	\N	\N	UOP 915	Fluoranthene	6.930	\N	1877
VHGO	68334-30-5	TP084	\N	\N	UOP 915	Fluorene	232.000	\N	1878
VHGO	68334-30-5	TP084	\N	\N	UOP 915	Indeno[1,2,3-cd]pyrene	ND	\N	1879
VHGO	68334-30-5	TP084	\N	\N	UOP 915	Naphthalene	1168.000	\N	1880
VHGO	68334-30-5	TP084	\N	\N	UOP 915	Phenanthrene	663.000	\N	1881
VHGO	68334-30-5	TP084	\N	\N	UOP 915	Pyrene	401.000	\N	1882
VHGO	68476-30-2	CON_17	\N	\N	\N	1-Methylnaphthalene	252.869	\N	1883
VHGO	68476-30-2	CON_17	\N	\N	\N	2-Methylnaphthalene	262.623	\N	1884
VHGO	68476-30-2	CON_17	\N	\N	\N	Acenaphthene	9.432	\N	1885
VHGO	68476-30-2	CON_17	\N	\N	\N	Acenaphthylene	0.638	\N	1886
VHGO	68476-30-2	CON_17	\N	\N	\N	Anthanthrene	ND	\N	1887
VHGO	68476-30-2	CON_17	\N	\N	\N	Anthracene	0.610	\N	1888
VHGO	68476-30-2	CON_17	\N	\N	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	0.217	\N	1889
VHGO	68476-30-2	CON_17	\N	\N	\N	Benzo[a]pyrene	ND	\N	1890
VHGO	68476-30-2	CON_17	\N	\N	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	0.012	\N	1891
VHGO	68476-30-2	CON_17	\N	\N	\N	Benzo[b]naphtho[2,1-d]thiophene	1.828	\N	1892
VHGO	68476-30-2	CON_17	\N	\N	\N	Benzo[c]phenanthrene	0.202	\N	1893
VHGO	68476-30-2	CON_17	\N	\N	\N	Benzo[e]pyrene	0.033	\N	1894
VHGO	68476-30-2	CON_17	\N	\N	\N	Benzo[g,h,i]fluoranthene	0.162	\N	1895
VHGO	68476-30-2	CON_17	\N	\N	\N	Benzo[g,h,i]perylene	0.316	\N	1896
VHGO	68476-30-2	CON_17	\N	\N	\N	Benzo[j]fluoranthene	ND	\N	1897
VHGO	68476-30-2	CON_17	\N	\N	\N	Benzo[k]fluoranthene	0.003	\N	1898
VHGO	68476-30-2	CON_17	\N	\N	\N	Chrysene/Benzo[a]phenanthrene	0.971	\N	1899
VHGO	68476-30-2	CON_17	\N	\N	\N	Coronene	ND	\N	1900
VHGO	68476-30-2	CON_17	\N	\N	\N	Cyclopenta[cd]pyrene	ND	\N	1901
VHGO	68476-30-2	CON_17	\N	\N	\N	Dibenzo[a,h]anthracene	0.077	\N	1902
VHGO	68476-30-2	CON_17	\N	\N	\N	Fluoranthene	1.251	\N	1903
VHGO	68476-30-2	CON_17	\N	\N	\N	Fluorene	20.203	\N	1904
VHGO	68476-30-2	CON_17	\N	\N	\N	Indeno[1,2,3-cd]pyrene	ND	\N	1905
VHGO	68476-30-2	CON_17	\N	\N	\N	Naphthalene	141.598	\N	1906
VHGO	68476-30-2	CON_17	\N	\N	\N	Perylene	ND	\N	1907
VHGO	68476-30-2	CON_17	\N	\N	\N	Phenanthrene	54.360	\N	1908
VHGO	68476-30-2	CON_17	\N	\N	\N	Pyrene	51.249	\N	1909
VHGO	68476-30-2	CON_17	\N	\N	\N	Triphenylene	1.170	\N	1910
VHGO	68476-30-2	G2_10	\N	\N	\N	Acenaphthene	ND	\N	1911
VHGO	68476-30-2	G2_10	\N	\N	\N	Acenaphthylene	ND	\N	1912
VHGO	68476-30-2	G2_10	\N	\N	\N	Anthracene	53.000	\N	1913
VHGO	68476-30-2	G2_10	\N	\N	\N	Fluorene	43.000	\N	1914
VHGO	68476-30-2	G2_11	\N	\N	\N	Acenaphthene	ND	\N	1915
VHGO	68476-30-2	G2_11	\N	\N	\N	Acenaphthylene	ND	\N	1916
VHGO	68476-30-2	G2_11	\N	\N	\N	Anthracene	ND	\N	1917
VHGO	68476-30-2	G2_11	\N	\N	\N	Fluorene	1.000	\N	1918
VHGO	68476-30-2	G2_14	\N	\N	\N	Acenaphthene	ND	\N	1919
VHGO	68476-30-2	G2_14	\N	\N	\N	Acenaphthylene	ND	\N	1920
VHGO	68476-30-2	G2_14	\N	\N	\N	Anthracene	ND	\N	1921
VHGO	68476-30-2	G2_14	\N	\N	\N	Fluorene	ND	\N	1922
VHGO	68476-30-2	G2_15	\N	\N	\N	Acenaphthene	ND	\N	1923
VHGO	68476-30-2	G2_15	\N	\N	\N	Acenaphthylene	ND	\N	1924
VHGO	68476-30-2	G2_15	\N	\N	\N	Anthracene	ND	\N	1925
VHGO	68476-30-2	G2_15	\N	\N	\N	Fluorene	ND	\N	1926
VHGO	68476-30-2	G2_16	\N	\N	\N	Acenaphthene	ND	\N	1927
VHGO	68476-30-2	G2_16	\N	\N	\N	Acenaphthylene	ND	\N	1928
VHGO	68476-30-2	G2_16	\N	\N	\N	Anthracene	ND	\N	1929
VHGO	68476-30-2	G2_16	\N	\N	\N	Fluorene	ND	\N	1930
VHGO	68476-30-2	J050	\N	10.06.2012	41070	Anthracene	23.800	\N	1931
VHGO	68476-30-2	J050	\N	10.06.2012	41070	Benzo[a]pyrene	1.680	\N	1932
VHGO	68476-30-2	J050	\N	10.06.2012	41070	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	2.780	\N	1933
VHGO	68476-30-2	J050	\N	10.06.2012	41070	Benzo[g,h,i]perylene	0.060	\N	1934
VHGO	68476-30-2	J050	\N	10.06.2012	41070	Benzo[k]fluoranthene	0.990	\N	1935
VHGO	68476-30-2	J050	\N	10.06.2012	41070	Dibenzo[a,h]anthracene	0.060	\N	1936
VHGO	68476-30-2	J050	\N	10.06.2012	41070	Indeno[1,2,3-cd]pyrene	0.060	\N	1937
VHGO	68476-30-2	J050	\N	\N	41070	Benzo[c]fluorene	ND	\N	1938
VHGO	68476-30-2	J050	\N	\N	41070	Benzo[e]pyrene	ND	\N	1939
VHGO	68476-30-2	J050	\N	\N	41070	Benzo[j]fluoranthene	ND	\N	1940
VHGO	68476-30-2	J050	\N	\N	41070	Coronene	ND	\N	1941
VHGO	68476-30-2	J050	\N	\N	41070	Dibenzo[a,e]pyrene	ND	\N	1942
VHGO	68476-30-2	J050	\N	\N	41070	Dibenzo[a,h]pyrene	ND	\N	1943
VHGO	68476-30-2	J050	\N	\N	41070	Dibenzo[a,i]pyrene	ND	\N	1944
VHGO	68476-30-2	J050	\N	\N	41070	Dibenzo[a,l]pyrene	ND	\N	1945
VHGO	68476-30-2	J050	\N	\N	41070	Perylene	ND	\N	1946
VHGO	68476-30-2	J050	\N	\N	41070	Triphenylene	ND	\N	1947
VHGO	68476-30-2	TP085	\N	\N	UOP 915	Acenaphthene	110.000	\N	1948
VHGO	68476-30-2	TP085	\N	\N	UOP 915	Acenaphthylene	28.000	\N	1949
VHGO	68476-30-2	TP085	\N	\N	UOP 915	Anthracene	23.800	\N	1950
VHGO	68476-30-2	TP085	\N	\N	UOP 915	Benzo[a]pyrene	1.680	\N	1951
VHGO	68476-30-2	TP085	\N	\N	UOP 915	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	2.780	\N	1952
VHGO	68476-30-2	TP085	\N	\N	UOP 915	Benzo[g,h,i]perylene	ND	\N	1953
VHGO	68476-30-2	TP085	\N	\N	UOP 915	Benzo[k]fluoranthene	0.990	\N	1954
VHGO	68476-30-2	TP085	\N	\N	UOP 915	Chrysene/Benzo[a]phenanthrene	24.100	\N	1955
VHGO	68476-30-2	TP085	\N	\N	UOP 915	Dibenzo[a,h]anthracene	6.940	\N	1956
VHGO	68476-30-2	TP085	\N	\N	UOP 915	Dibenzo[a,h]anthracene	ND	\N	1957
VHGO	68476-30-2	TP085	\N	\N	UOP 915	Fluoranthene	50.200	\N	1958
VHGO	68476-30-2	TP085	\N	\N	UOP 915	Fluorene	74.300	\N	1959
VHGO	68476-30-2	TP085	\N	\N	UOP 915	Indeno[1,2,3-cd]pyrene	ND	\N	1960
VHGO	68476-30-2	TP085	\N	\N	UOP 915	Naphthalene	351.000	\N	1961
VHGO	68476-30-2	TP085	\N	\N	UOP 915	Phenanthrene	194.000	\N	1962
VHGO	68476-30-2	TP085	\N	\N	UOP 915	Pyrene	135.000	\N	1963
VHGO	68476-31-3	CON_18	\N	\N	\N	1-Methylnaphthalene	281.227	\N	1964
VHGO	68476-31-3	CON_18	\N	\N	\N	2-Methylnaphthalene	257.847	\N	1965
VHGO	68476-31-3	CON_18	\N	\N	\N	Acenaphthene	11.038	\N	1966
VHGO	68476-31-3	CON_18	\N	\N	\N	Acenaphthylene	0.524	\N	1967
VHGO	68476-31-3	CON_18	\N	\N	\N	Anthanthrene	ND	\N	1968
VHGO	68476-31-3	CON_18	\N	\N	\N	Anthracene	2.612	\N	1969
VHGO	68476-31-3	CON_18	\N	\N	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	3.775	\N	1970
VHGO	68476-31-3	CON_18	\N	\N	\N	Benzo[a]pyrene	0.032	\N	1971
VHGO	68476-31-3	CON_18	\N	\N	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	0.252	\N	1972
VHGO	68476-31-3	CON_18	\N	\N	\N	Benzo[b]naphtho[2,1-d]thiophene	37.226	\N	1973
VHGO	68476-31-3	CON_18	\N	\N	\N	Benzo[c]phenanthrene	0.903	\N	1974
VHGO	68476-31-3	CON_18	\N	\N	\N	Benzo[e]pyrene	0.196	\N	1975
VHGO	68476-31-3	CON_18	\N	\N	\N	Benzo[g,h,i]fluoranthene	0.729	\N	1976
VHGO	68476-31-3	CON_18	\N	\N	\N	Benzo[g,h,i]perylene	0.007	\N	1977
VHGO	68476-31-3	CON_18	\N	\N	\N	Benzo[j]fluoranthene	0.030	\N	1978
VHGO	68476-31-3	CON_18	\N	\N	\N	Benzo[k]fluoranthene	0.042	\N	1979
VHGO	68476-31-3	CON_18	\N	\N	\N	Chrysene/Benzo[a]phenanthrene	18.456	\N	1980
VHGO	68476-31-3	CON_18	\N	\N	\N	Coronene	ND	\N	1981
VHGO	68476-31-3	CON_18	\N	\N	\N	Cyclopenta[cd]pyrene	ND	\N	1982
VHGO	68476-31-3	CON_18	\N	\N	\N	Dibenzo[a,h]anthracene	ND	\N	1983
VHGO	68476-31-3	CON_18	\N	\N	\N	Fluoranthene	17.277	\N	1984
VHGO	68476-31-3	CON_18	\N	\N	\N	Fluorene	34.786	\N	1985
VHGO	68476-31-3	CON_18	\N	\N	\N	Indeno[1,2,3-cd]pyrene	ND	\N	1986
VHGO	68476-31-3	CON_18	\N	\N	\N	Naphthalene	143.942	\N	1987
VHGO	68476-31-3	CON_18	\N	\N	\N	Perylene	0.033	\N	1988
VHGO	68476-31-3	CON_18	\N	\N	\N	Phenanthrene	196.849	\N	1989
VHGO	68476-31-3	CON_18	\N	\N	\N	Pyrene	28.873	\N	1990
VHGO	68476-31-3	CON_18	\N	\N	\N	Triphenylene	22.263	\N	1991
VHGO	68476-34-6	CON_19	\N	\N	\N	1-Methylnaphthalene	1971.674	\N	1992
VHGO	68476-34-6	CON_19	\N	\N	\N	2-Methylnaphthalene	3017.641	\N	1993
VHGO	68476-34-6	CON_19	\N	\N	\N	Acenaphthene	345.490	\N	1994
VHGO	68476-34-6	CON_19	\N	\N	\N	Acenaphthylene	9.415	\N	1995
VHGO	68476-34-6	CON_19	\N	\N	\N	Anthanthrene	0.011	\N	1996
VHGO	68476-34-6	CON_19	\N	\N	\N	Anthracene	63.320	\N	1997
VHGO	68476-34-6	CON_19	\N	\N	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	3.110	\N	1998
VHGO	68476-34-6	CON_19	\N	\N	\N	Benzo[a]pyrene	0.165	\N	1999
VHGO	68476-34-6	CON_19	\N	\N	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	1.252	\N	2000
VHGO	68476-34-6	CON_19	\N	\N	\N	Benzo[b]naphtho[2,1-d]thiophene	2.419	\N	2001
VHGO	68476-34-6	CON_19	\N	\N	\N	Benzo[c]phenanthrene	0.176	\N	2002
VHGO	68476-34-6	CON_19	\N	\N	\N	Benzo[e]pyrene	0.564	\N	2003
VHGO	68476-34-6	CON_19	\N	\N	\N	Benzo[g,h,i]fluoranthene	0.237	\N	2004
VHGO	68476-34-6	CON_19	\N	\N	\N	Benzo[g,h,i]perylene	0.079	\N	2005
VHGO	68476-34-6	CON_19	\N	\N	\N	Benzo[j]fluoranthene	0.042	\N	2006
VHGO	68476-34-6	CON_19	\N	\N	\N	Benzo[k]fluoranthene	0.053	\N	2007
VHGO	68476-34-6	CON_19	\N	\N	\N	Chrysene/Benzo[a]phenanthrene	5.620	\N	2008
VHGO	68476-34-6	CON_19	\N	\N	\N	Coronene	0.006	\N	2009
VHGO	68476-34-6	CON_19	\N	\N	\N	Cyclopenta[cd]pyrene	ND	\N	2010
VHGO	68476-34-6	CON_19	\N	\N	\N	Dibenzo[a,h]anthracene	0.015	\N	2011
VHGO	68476-34-6	CON_19	\N	\N	\N	Fluoranthene	97.351	\N	2012
VHGO	68476-34-6	CON_19	\N	\N	\N	Fluorene	485.458	\N	2013
VHGO	68476-34-6	CON_19	\N	\N	\N	Indeno[1,2,3-cd]pyrene	0.023	\N	2014
VHGO	68476-34-6	CON_19	\N	\N	\N	Naphthalene	830.632	\N	2015
VHGO	68476-34-6	CON_19	\N	\N	\N	Perylene	0.109	\N	2016
VHGO	68476-34-6	CON_19	\N	\N	\N	Phenanthrene	2023.912	\N	2017
VHGO	68476-34-6	CON_19	\N	\N	\N	Pyrene	351.409	\N	2018
VHGO	68476-34-6	CON_19	\N	\N	\N	Triphenylene	6.828	\N	2019
VHGO	92045-24-4	CON_20	\N	\N	\N	1-Methylnaphthalene	200.859	\N	2020
VHGO	92045-24-4	CON_20	\N	\N	\N	2-Methylnaphthalene	209.767	\N	2021
VHGO	92045-24-4	CON_20	\N	\N	\N	Acenaphthene	16.656	\N	2022
VHGO	92045-24-4	CON_20	\N	\N	\N	Acenaphthylene	1.096	\N	2023
VHGO	92045-24-4	CON_20	\N	\N	\N	Anthanthrene	0.190	\N	2024
VHGO	92045-24-4	CON_20	\N	\N	\N	Anthracene	20.930	\N	2025
VHGO	92045-24-4	CON_20	\N	\N	\N	Benzo[a]anthracene/Benzo[b]phenanthrene	11.647	\N	2026
VHGO	92045-24-4	CON_20	\N	\N	\N	Benzo[a]pyrene	3.115	\N	2027
VHGO	92045-24-4	CON_20	\N	\N	\N	Benzo[b]fluoranthene/Benzo[e]acephenanthylene	6.057	\N	2028
VHGO	92045-24-4	CON_20	\N	\N	\N	Benzo[b]naphtho[2,1-d]thiophene	53.279	\N	2029
VHGO	92045-24-4	CON_20	\N	\N	\N	Benzo[c]phenanthrene	1.559	\N	2030
VHGO	92045-24-4	CON_20	\N	\N	\N	Benzo[e]pyrene	10.573	\N	2031
VHGO	92045-24-4	CON_20	\N	\N	\N	Benzo[g,h,i]fluoranthene	1.344	\N	2032
VHGO	92045-24-4	CON_20	\N	\N	\N	Benzo[g,h,i]perylene	1.773	\N	2033
VHGO	92045-24-4	CON_20	\N	\N	\N	Benzo[j]fluoranthene	0.826	\N	2034
VHGO	92045-24-4	CON_20	\N	\N	\N	Benzo[k]fluoranthene	1.109	\N	2035
VHGO	92045-24-4	CON_20	\N	\N	\N	Chrysene/Benzo[a]phenanthrene	34.359	\N	2036
VHGO	92045-24-4	CON_20	\N	\N	\N	Coronene	0.134	\N	2037
VHGO	92045-24-4	CON_20	\N	\N	\N	Cyclopenta[cd]pyrene	ND	\N	2038
VHGO	92045-24-4	CON_20	\N	\N	\N	Dibenzo[a,h]anthracene	0.238	\N	2039
VHGO	92045-24-4	CON_20	\N	\N	\N	Fluoranthene	17.941	\N	2040
VHGO	92045-24-4	CON_20	\N	\N	\N	Fluorene	72.760	\N	2041
VHGO	92045-24-4	CON_20	\N	\N	\N	Indeno[1,2,3-cd]pyrene	0.374	\N	2042
VHGO	92045-24-4	CON_20	\N	\N	\N	Naphthalene	64.570	\N	2043
VHGO	92045-24-4	CON_20	\N	\N	\N	Perylene	5.044	\N	2044
VHGO	92045-24-4	CON_20	\N	\N	\N	Phenanthrene	398.737	\N	2045
VHGO	92045-24-4	CON_20	\N	\N	\N	Pyrene	38.579	\N	2046
VHGO	92045-24-4	CON_20	\N	\N	\N	Triphenylene	35.714	\N	2047
\.


--
-- Name: fdc_pah_row_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('fdc_pah_row_id_seq', 2047, true);


--
-- Data for Name: file_tracking; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY file_tracking (row_id, project_id, project_name, file_name, file_path) FROM stdin;
\.


--
-- Name: file_tracking_row_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('file_tracking_row_id_seq', 1, false);


--
-- Data for Name: fileupload; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY fileupload (entity_id, project_id, filename, filelocation, createdby, lastmodifiedby, registereddt, lastupdatedt) FROM stdin;
\.


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hibernate_sequence', 4, true);


--
-- Name: id1_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('id1_seq', 1, false);


--
-- Name: id_seq1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('id_seq1', 1, false);


--
-- Data for Name: importinfo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY importinfo (id, user_id, transactiondate, notes, file, filename) FROM stdin;
\.


--
-- Name: importinfo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('importinfo_id_seq', 1, false);


--
-- Data for Name: notes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY notes (id, updatedby, code, note, owner_id, ownertype, visible, updateddt) FROM stdin;
\.


--
-- Name: notes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('notes_id_seq', 1, false);


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY orders (id, rowheader_id, order_id) FROM stdin;
\.


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('orders_id_seq', 1, false);


--
-- Name: ordersequence_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ordersequence_id_seq', 1, false);


--
-- Data for Name: proj_access; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY proj_access (row_id, project_id, project_name, user_name, permission) FROM stdin;
1	1	Project_ABC	test-id-1	owner
2	2	Project_example	test-id-1	owner
3	3	Sample_proj4	test-id-2	owner
4	4	Proj_new	test-id-2	owner
\.


--
-- Name: proj_access_row_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('proj_access_row_id_seq', 4, true);


--
-- Data for Name: projectaccess; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY projectaccess (id, project_id, user_id, read, write, is_active, createddt, lastupdateddat) FROM stdin;
\.


--
-- Data for Name: projectmanagers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY projectmanagers (project_id, user_id) FROM stdin;
2	1
\.


--
-- Data for Name: projectmembers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY projectmembers (project_id, user_id) FROM stdin;
\.


--
-- Data for Name: projectreviewers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY projectreviewers (project_id, user_id) FROM stdin;
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY projects (project_id, projecttype, code, name, access, status, notes, starts, ends, registereddt, lastupdatedt, createdby, lastmodifiedby, version, owner_id, owner_login) FROM stdin;
1	1	ProjectCode	Project_ABC	0	0	\N	\N	\N	2015-10-16 16:34:10.544	2015-10-16 16:34:10.544	1	1	1	\N	test-id-1
2	1	qwre	Project_example	0	0	<p>qwr</p>\r\n	\N	\N	2015-10-16 16:34:59.417	2015-10-16 16:34:59.417	1	1	1	\N	test-id-1
3	1	1122	Sample_proj4	0	0	<p>Sample project</p>\r\n	\N	\N	2016-09-19 09:53:13.062	2016-09-19 09:57:48.118	2	2	1	\N	test-id-2
4	1	11223	Project_new	0	0	<p>sa</p>\r\n	\N	\N	2016-09-19 10:01:35.843	2016-09-19 10:01:35.843	2	2	1	\N	test-id-2
\.


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('projects_id_seq', 4, true);


--
-- Data for Name: projecttypes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY projecttypes (id, code, name, notes, registereddt, lastvisitdt) FROM stdin;
1	INVIVO	In Vivo	\N	2015-10-16 16:34:09.59	2015-10-16 16:34:09.59
2	INVITRO	In Vitro	\N	2015-10-16 16:34:09.678	2015-10-16 16:34:09.678
\.


--
-- Name: projecttypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('projecttypes_id_seq', 2, true);


--
-- Data for Name: projectusermapping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY projectusermapping (id, user_id, project_id, role, registereddt, lastvisitdt, is_active) FROM stdin;
\.


--
-- Data for Name: results; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY results (id, component_id, project_id, updatedby, order_id, strresult, updateddt) FROM stdin;
\.


--
-- Name: results_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('results_id_seq', 1, false);


--
-- Data for Name: resultshistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY resultshistory (id, results, updatedby, oldstrresult, newstrresult, updateddt) FROM stdin;
\.


--
-- Name: resultshistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('resultshistory_id_seq', 1, false);


--
-- Data for Name: rowheaders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rowheaders (id, rowtype_id, code, name, notes, color, registereddt) FROM stdin;
\.


--
-- Name: rowheaders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('rowheaders_id_seq', 1, false);


--
-- Data for Name: rowtypes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rowtypes (id, project_id, code, name, showorder, notes, registereddt) FROM stdin;
1	1	chemical_source_sid	Source	1	\N	2015-10-16 16:34:10.629
2	1	casrn	CASR Number	2	\N	2015-10-16 16:34:10.629
3	1	chemical_name	Chemical Name	3	\N	2015-10-16 16:34:10.629
4	2	chemical_source_sid	Source	1	\N	2015-10-16 16:34:59.531
5	2	casrn	CASR Number	2	\N	2015-10-16 16:34:59.531
6	2	chemical_name	Chemical Name	3	\N	2015-10-16 16:34:59.531
7	3	chemical_source_sid	Source	1	\N	2016-09-19 09:53:13.162
8	3	chemical_name	Chemical Name	3	\N	2016-09-19 09:53:13.162
9	3	casrn	CASR Number	2	\N	2016-09-19 09:53:13.162
10	4	chemical_source_sid	Source	1	\N	2016-09-19 10:01:36
11	4	casrn	CASR Number	2	\N	2016-09-19 10:01:36
12	4	chemical_name	Chemical Name	3	\N	2016-09-19 10:01:36
\.


--
-- Name: rowtypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('rowtypes_id_seq', 12, true);


--
-- Data for Name: rowtypestempl; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rowtypestempl (id, code, name, showorder, projecttype_id) FROM stdin;
1	chemical_source_sid	Source	1	1
2	casrn	CASR Number	2	1
3	chemical_name	Chemical Name	3	1
4	SOURCE	Source	1	2
5	CASRN	CASR Number	2	2
6	CHEMICAL	Chemical	3	2
\.


--
-- Name: rowtypestempl_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('rowtypestempl_id_seq', 6, true);


--
-- Data for Name: sample_inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sample_inventory (sample_number, cas, ec_number, substance_name, category, substance_description, availability, row_id) FROM stdin;
1	8006-61-9	232-349-1	Gasoline, natural	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons separated from natural gas by processes such as refrigeration or absorption.  It consists predominantly of saturated aliphatic hydrocarbons having carbon numbers predominantly in the range of C4 through C8 and boiling in the range of approximately minus 20?C to 120?C (-4?F to 248?F).	N	1
2	68410-05-9	270-077-5	Distillates (petroleum), straight-run Light	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons produced by the distillation of crude oil.  It consists of hydrocarbons having carbon numbers predominantly in the range of C2 through C7 and boiling in the range of approximately -88?C to 99?C (-127?F to 210?F).	N	2
3	92045-29-9	295-411-7	Gas oils (petroleum), thermal-cracked, hydrodesulfurized	CRACKED GAS OILS	No EC number description available in ESIS	Y	3
4	92045-53-9	295-434-2	Naphtha (petroleum), hydrodesulfurized light, dearomatized	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons obtained by distillation of hydrodesulfurized and dearomatized light petroleum fractions.  It consists predominantly of C7 paraffins and cycloparaffins boiling in a range of approximately 90?C to 100?C (194?F to 212?F).	N	4
5	64741-48-6	265-048-9	Natural gas (petroleum), raw liq. mix	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons separated as a liquid from natural gas in a gas recycling plant by processes such as refrigeration or absorption.  It consists mainly of saturated aliphatic hydrocarbons having carbon numbers in the range of C2 through C8.	N	5
6	64741-45-3	265-045-2	Residues (petroleum), atm. tower	HEAVY FUEL OIL COMPONENTS	A complex residuum from the atmospheric distillation of crude oil.  It consists of hydrocarbons having carbon numbers predominantly greater than C20 and boiling above approximately 350?C (662?F).  This stream is likely to contain 5 wt. % or more of 4- to 6-membered condensed ring aromatic hydrocarbons.	Y	6
7	90669-76-4	292-658-2	Residues (petroleum), vacuum, light	HEAVY FUEL OIL COMPONENTS	A complex residuum from the vacuum distillation of the residuum from atmospheric distillation of crude oil.  It consists predominantly of hydrocarbons having carbon numbers predominantly greater than C24 and boiling above approximately 390?C (734?F).	Y	7
8	92061-97-7	295-511-0	Residues (petroleum), catalytic cracking	HEAVY FUEL OIL COMPONENTS	A complex combination of hydrocarbons produced as the residual fraction from the distillation of the products from a catalytic cracking process.  It consists predominantly of hydrocarbons having carbon numbers predominantly greater than C11 and boiling above approximately 200?C (392?F).	Y	8
9	93572-35-1	297-465-7	Hydrocarbons, C7-12, C>9-arom.-rich, reforming heavy fraction	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons obtained by separation from the platformate-containing fraction.  It consists predominantly of nonaromatic hydrocarbons having carbon numbers predominantly in the range of C7 through C12 and boiling in the range of approximately 120?C to 210?C (248?F to 380?F) and C9 and higher aromatic hydrocarbons.	Y	9
10	93763-33-8	297-852-0	Hydrocarbons, C6-11, hydrotreated, dearomatized	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons obtained as solvents which have been subjected to hydrotreatment in order to convert aromatics to naphthenes by catalytic hydrogenation.	N	10
11	93763-35-0	297-854-1	Hydrocarbons, C9-16, hydrotreated, dearomatized	KEROSINES	A complex combination of hydrocarbons obtained as solvents which have been subjected to hydrotreatment in order to convert aromatics to naphthenes by catalytic hydrogenation.	Y	11
12	101316-59-0	309-865-1	Distillates (petroleum), hydrodesulfurized middle coker	CRACKED GAS OILS	A complex combination of hydrocarbons obtained by fractionation from hydrodesulphurised coker distillate stocks.  It consists of hydrocarbons having carbon numbers predominantly in the range of C12 through C21 and boiling in the range of approximately 200?C to 360?C (392?F to 680?F).	Y	12
13	101316-66-9	309-870-9	Hydrocarbons, C6-8, hydrogenated sorption-dearomatized, toluene raffination	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons obtained during the sorptions of toluene from a hydrocarbon fraction from cracked gasoline treated with hydrogen in the presence of a catalyst.  It consists predominantly of hydrocarbons having carbon numbers predominantly in the range of C6 through C8 and boiling in the range of approximately 80?C to 135?C (176?F to 275?F).	N	13
14	101316-67-0	309-871-4	Hydrocarbons, C6-rich, hydrotreated light naphtha distillates, solvent-refined	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons obtained by distillation of hydrotreated naphtha followed by solvent extraction.  It consists predominantly of saturated hydrocarbons and boiling in the range of approximately 65?C to 70?C (149?F to 158?F).	N	14
15	101316-76-1	309-879-8	Naphtha (petroleum), hydrodesulfurized full-range coker	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons obtained by fractionation from hydrodesulphurised coker distillate.  It consists predominantly of hydrocarbons having carbon numbers predominantly in the range of C5 to C11 and boiling in the range of approximately 23?C to 196?C (73?F to 385?F).	N	15
16	101316-80-7	309-881-9	Solvent naphtha (petroleum), hydrocracked heavy arom.	KEROSINES	A complex combination of hydrocarbons obtained by the distillation of hydrocracked petroleum distillate.  It consists predominantly of hydrocarbons having carbon numbers predominantly in the range of C9 through C16 and boiling in the range of approximately 235?C to 290?C (455?F to 554?F).	Y	16
17	64742-78-5	265-181-2	Residues (petroleum), hydrodesulfurized atmospheric tower	HEAVY FUEL OIL COMPONENTS	A complex combination of hydrocarbons obtained by treating an atmospheric tower residuum with hydrogen in the presence of a catalyst under conditions primarily to remove organic sulfur compounds.  It consists of hydrocarbons having carbon numbers predominantly greater than C20 and boiling above approximately 350?C (662?F).  This stream is likely to contain 5 wt. % or more of 4- to 6-membered condensed ring aromatic hydrocarbons.	Y	17
18	64741-57-7	265-058-3	Gas oils (petroleum), heavy vacuum	HEAVY FUEL OIL COMPONENTS	A complex combination of hydrocarbons produced by the vacuum distillation of the residuum from atmospheric distillation of crude oil.  It consists of hydrocarbons having carbon numbers predominantly in the range of C20 through C50 and boiling in the range of approximately 350?C to 600?C (662?F to 1112?F).  This stream is likely to contain 5 wt. % or more of 4- to 6-membered condensed ring aromatic hydrocarbons.	Y	18
19	64741-69-1	265-071-4	Naphtha (petroleum), light hydrocracked	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons from distillation of the products from a hydrocracking process.  It consists predominantly of saturated hydrocarbons having carbon numbers predominantly in the range of C4 through C10, and boiling in the range of approximately minus 20?C to 180?C (-4?F to 356?F).	N	19
20	64741-80-6	265-081-9	Residues (petroleum), thermal cracked	HEAVY FUEL OIL COMPONENTS	A complex combination of hydrocarbons produced as the residual fraction from distillation of the product from a thermal cracking process.  It consists predominantly of unsaturated hydrocarbons having carbon numbers predominantly greater than C20 and boiling above approximately 350?C (662?F).  This stream is likely to contain 5 wt. % or more of 4- to 6-membered condensed ring aromatic hydrocarbons.	Y	20
21	64741-81-7	265-082-4	Distillates (petroleum), heavy thermal cracked	HEAVY FUEL OIL COMPONENTS	A complex combination of hydrocarbons from the distillation of the products from a thermal cracking process.  It consists predominantly of unsaturated hydrocarbons having carbon numbers predominantly in the range of C15 through C36 and boiling in the range of approximately 260?C to 480?C (500?F to 896?F).  This stream is likely to contain 5 wt. % or more of 4- to 6-membered condensed ring aromatic hydrocarbons.	Y	21
22	64741-87-3	265-089-2	Naphtha (petroleum), sweetened	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons obtained by subjecting a petroleum naphtha to a sweetening process to convert mercaptans or to remove acidic impurities.  It consists of hydrocarbons having carbon numbers predominantly in the range of C4 through C12 and boiling in the range of approximately minus 10?C to 230?C (14?F to 446?F).	N	22
23	64742-73-0	265-178-6	Naphtha (petroleum), hydrodesulfurized light	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons obtained from a catalytic hydrodesulfurization process.  It consists of hydrocarbons having carbon numbers predominantly in the range of C4 through C11 and boiling in the range of approximately minus 20?C to 190?C (-4?F to 374?F).	N	23
24	64742-86-5	265-189-6	Gas oils (petroleum), hydrodesulfurized heavy vacuum	HEAVY FUEL OIL COMPONENTS	A complex combination of hydrocarbons obtained from a catalytic hydrodesulfurization process.  It consists of hydrocarbons having carbon numbers predominantly in the range of C20 through C50 and boiling in the range of approximately 350?C to 600?C (662?F to 1112?F).  This stream is likely to contain 5 wt. % or more of 4- to 6-membered condensed ring aromatic hydrocarbons.	Y	24
25	68333-22-2	269-777-3	Residues (petroleum), atmospheric	HEAVY FUEL OIL COMPONENTS	A complex residuum from atmospheric distillation of crude oil.  It consists of hydrocarbons having carbon numbers predominantly greater than C11 and boiling above approximately 200?C (392?F).  This stream is likely to contain 5 wt.% or more of 4- to 6-membered condensed ring aromatic hydrocarbons.	Y	25
26	68475-79-6	270-660-4	Distillates (petroleum), catalytic reformed depentanizer	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons from the distillation of products from a catalytic reforming process.  It consists predominantly of aliphatic hydrocarbons having carbon numbers predominantly in the range of C3 through C6 and boiling in the range of approximately -49?C to 63?C (-57?F to 145?F).	N	26
27	68527-27-5	271-267-0	Naphtha (petroleum), full-range alkylate, butane-contg.	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons produced by the distillation of the reaction products of isobutane with monoolefinic hydrocarbons usually ranging in carbon numbers from C3 through C5.  It consists of predominantly branched chain saturated hydrocarbons having carbon numbers predominantly in the range of C7 through C12 with some butanes and boiling in the range of approximately 35?C to 200?C (95?F to 428?F).	N	27
28	68783-08-4	272-184-2	Gas oils (petroleum), heavy atmospheric	HEAVY FUEL OIL COMPONENTS	A complex combination of hydrocarbons obtained by the distillation of crude oil.  It consists of hydrocarbons having carbon numbers predominantly in the range of C7 through C35 and boiling in the range of approximately 121?C to 510?C (250?F to 950?F).	Y	28
29	68783-12-0	272-186-3	Naphtha (petroleum), unsweetened	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons produced from the distillation of naphtha streams from various refinery processes.  It consists of hydrocarbons having carbon numbers predominantly in the range of C5 through C12 and boiling in the range of approximately 0?C to 230?C (25?F to 446?F).	N	29
30	68955-35-1	273-271-8	Naphtha (petroleum), catalytic reformed	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons produced by the distillation of products from a catalytic reforming process.  It consists of hydrocarbons having carbon numbers predominantly in the range of C4 through C12 and boiling in the range of approximately 30?C to 220?C (90?F to 430?F).  It contains a relatively large proportion of aromatic and branched chain hydrocarbons.  This stream may contain 10 vol. % or more benzene.	N	30
31	70592-78-8	274-685-1	Distillates (petroleum), vacuum	HEAVY FUEL OIL COMPONENTS	A complex combination of hydrocarbons produced by the vacuum distillation of the residuum from atmospheric distillation of crude oil.  It consists of hydrocarbons having carbon numbers predominantly in the range of C15 through C50 and boiling in the range of approximately 270?C to 600?C (518?F to 1112?F).  This stream is likely to contain 5 wt.% or more of 4- to 6-membered condensed ring aromatic hydrocarbons.	Y	31
32	91995-38-9	295-298-4	Hydrocarbons, C4-6, depentanizer lights, arom. hydrotreater	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons obtained as first runnings from the depentanizer column before hydrotreatment of the aromatic charges.  It consists predominantly of hydrocarbons having carbon numbers predominantly in the range of C4 through C6, predominantly pentanes and pentenes, and boiling in the range of approximately 25?C to 40?C (77?F to 104?F).	N	32
33	92045-64-2	295-446-8	Hydrocarbons, C6-7, naphtha-cracking, solvent-refined	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons obtained by the sorption of benzene from a catalytically fully hydrogenated benzene-rich hydrocarbon cut that was distillatively obtained from prehydrogenated cracked naphtha.  It consists predominantly of paraffinic and naphthenic hydrocarbons having carbon numbers predominantly in the range of C6 through C7 and boiling in the range of approximately 70?C to 100?C (158?F to 212?F).	N	33
34	64741-62-4	265-064-6	Clarified oils (petroleum), catalytic cracked	HEAVY FUEL OIL COMPONENTS	A complex combination of hydrocarbons produced as the residual fraction from distillation of the products from a catalytic cracking process.  It consists of hydrocarbons having carbon numbers predominantly greater than C20 and boiling above approximately 350?C (662?F).  This stream is likely to contain 5 wt. % or more of 4- to 6-membered condensed ring aromatic hydrocarbons.	Y	34
35	64742-89-8	265-192-2	Solvent naphtha (petroleum), light aliph.	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons obtained from the distillation of crude oil or natural gasoline.  It consists predominantly of saturated hydrocarbons having carbon numbers predominantly in the range of C5 through C10 and boiling in the range of approximately 35?C to 160?C (95?F to 320?F).	N	35
36	93572-43-1	297-474-6	Lubricating oils (petroleum), base oils, paraffinic	OTHER LUBRICANT BASE OILS	A complex combination of hydrocarbons obtained by refining of crude oil.  It consists predominantly of aromatics, naphthenics and paraffinics and produces a finished oil with a viscosity of 120 SUS at 100?F (23cSt at 40?C).	Y	36
37	68476-50-6	270-690-8	Hydrocarbons, C•5, C5-6-rich	LOW BOILING POINT NAPHTHAS (GASOLINES)	No EC number description available in ESIS	N	37
38	68513-03-1	270-993-5	Naphtha (petroleum), light catalytic reformed, arom.-free	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons obtained from distillation of products from a catalytic reforming process.  It consists predominantly of hydrocarbons having carbon numbers predominantly in the range of C5 through C8 and boiling in the range of approximately 35?C to 120?C (95?F to 248?F).  It contains a relatively large proportion of branched chain hydrocarbons with the aromatic components removed.	N	38
39	64741-41-9	265-041-0	Naphtha (petroleum), heavy straight-run	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons produced by distillation of crude oil.  It consists of hydrocarbons having carbon numbers predominantly in the range of C6 through C12 and boiling in the range of approximately 65?C to 230?C (149?F to 446?F).	N	39
40	68410-71-9	270-088-5	Raffinates (petroleum), catalytic reformer ethylene glycol-water countercurrent exts.	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons obtained as the raffinate from the UDEX extraction process on the catalytic reformer stream.  It consists of saturated hydrocarbons having carbon numbers predominantly in the range of C6 through C9.	N	40
41	68921-07-3	272-930-7	Distillates (petroleum), hydrotreated light catalytic cracked	CRACKED GAS OILS	A complex combination of hydrocarbons obtained by treating a petroleum fraction with hydrogen in the presence of a catalyst.	Y	41
42	91995-68-5	295-331-2	Extracts (petroleum), catalytic reformed light naphtha solvent	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons obtained as the extract from the solvent extraction of a catalytically reformed petroleum cut.  It consists predominantly of aromatic hydrocarbons having carbon numbers predominantly in the range of C7 through C8 and boiling in the range of approximately 100?C to 200?C (212?F to 392?F).	N	42
43	8008-20-6	232-366-4	Kerosine (petroleum)	KEROSINES	A complex combination of hydrocarbons produced by the distillation of crude oil.  It consists of hydrocarbons having carbon numbers predominantly in the range of C9 through C16 and boiling in the range of approximately 150?C to 290?C (320?F to 554?F).	Y	43
44	64742-66-1	265-170-2	Naphtha (petroleum), catalytic dewaxed	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons obtained from the catalytic dewaxing of a petroleum fraction.  It consists predominantly of hydrocarbons having carbon numbers predominantly in the range of C5 through C12 and boiling in the range of approximately 35?C to 230?C (95?F to 446?F).	N	44
45	68476-55-1	270-695-5	Hydrocarbons, C5-rich	LOW BOILING POINT NAPHTHAS (GASOLINES)	No EC number description available in ESIS	N	45
46	64741-78-2	265-079-8	Naphtha (petroleum), heavy hydrocracked	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons from distillation of the products from a hydrocracking process.  It consists predominantly of saturated hydrocarbons having carbon numbers predominantly in the range of C6 through C12, and boiling in the range of approximately 65?C to 230?C (148?F to 446?F).	Y	46
47	101795-01-1	309-976-5	Naphtha (petroleum), sweetened light	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons obtained by subjecting a petroleum naphtha to a sweetening process to convert mercaptans or to remove acidic impurities.  It consists predominantly of hydrocarbons having carbon numbers predominantly in the range of C5 through C8 and boiling in the range of approximately 20?C to 130?C (68?F to 266?F).	N	47
48	68783-11-9	614-725-0	Naphtha (petroleum), light polymn.	LOW BOILING POINT NAPHTHAS (GASOLINES)	Not listed in ESIS.      A complex combination of hydrocarbons produced by the catalytic polymerization of a mixture rich in propylene. It consists predominantly of olefinic hydrocarbons having carbon numbers predominantly in the range of C5 through C11 and boiling in the range of approximately 25 degree C to 185 degree C (77 degree F to 365 degree F).	N	48
49	64742-47-8	265-149-8	Distillates (petroleum), hydrotreated light	KEROSINES	A complex combination of hydrocarbons obtained by treating a petroleum fraction with hydrogen in the presence of a catalyst.  It consists of hydrocarbons having carbon numbers predominantly in the range of C9 through C16 and boiling in the range of approximately 150?C to 290?C (302?F to 554?F).	Y	49
50	70592-76-6	274-683-0	Distillates (petroleum), intermediate vacuum	HEAVY FUEL OIL COMPONENTS	A complex combination of hydrocarbons produced by the vacuum distillation of the residuum from atmospheric distillation of crude oil.  It consists of hydrocarbons having carbon numbers predominantly in the range of C14 through C42 and boiling in the range of approximately 250?C to 545?C (482?F to 1013?F).  This stream is likely to contain 5 wt.% or more of 4- to 6-membered condensed ring aromatic hydrocarbons.	Y	50
51	85116-58-1	285-509-8	Distillates (petroleum), catalytic reformed hydrotreated light, C8-12 arom. fraction	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of alkylbenzenes obtained by the catalytic reforming of petroleum naphtha.  It consists predominantly of alkylbenzenes having carbon numbers predominantly in the range of C8 through C10 and boiling in the range of approximately 160?C to 180?C (320?F to 356?F).	N	51
52	93572-36-2	297-466-2	Hydrocarbons, C5-11, nonaroms.-rich, reforming light fraction	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons obtained by separation from the platformate-containing fraction.  It consists predominantly of nonaromatic hydrocarbons having carbon numbers predominantly in the range of C5 through C11 and boiling in the range of approximately 35?C to 125?C (94?F to 257?F), benzene and toluene.	N	52
53	92045-59-5	295-441-0	Naphtha (petroleum), light catalytic cracked sweetened	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons obtained by subjecting naphtha from a catalytic cracking process to a sweetening process to convert mercaptans or to remove acidic impurities.  It consists predominantly of hydrocarbons boiling in a range of approximately 35?C to 210?C (95?F to 410?F).	N	53
54	92045-50-6	295-431-6	Naphtha (petroleum), heavy catalytic cracked, sweetened	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons obtained by subjecting a catalytic cracked petroleum distillate to a sweetening process to convert mercaptans or to remove acidic impurities.  It consists predominantly of hydrocarbons having carbon numbers predominantly in the range of C6 through C12 and boiling in the range of approximately 60?C to 200?C (140?F to 392?F).	N	54
55	64741-84-0	265-086-6	Naphtha (petroleum), solvent-refined light	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons obtained as the raffinate from a solvent extraction process.  It consists predominantly of aliphatic hydrocarbons having carbon numbers predominantly in the range of C5 through C11 and boiling in the range of approximately 35?C to 190?C (95?F to 374?F).	N	55
56	68603-08-7	271-635-0	Naphtha (petroleum), arom	LOW BOILING POINT NAPHTHAS (GASOLINES)	No EC number description available in ESIS	Y	56
57	68606-11-1	271-727-0	Gasoline, straight-run, topping-plant	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons produced from the topping plant by the distillation of crude oil.  It boils in the range of approximately 36.1?C to 193.3?C (97?F to 380?F).	N	57
58	70592-77-7	274-684-6	Distillates (petroleum), light vacuum	HEAVY FUEL OIL COMPONENTS	A complex combination of hydrocarbons produced by the vacuum distillation of the residuum from atmospheric distillation of crude oil.  It consists of hydrocarbons having carbon numbers predominantly in the range of C11 through C35 and boiling in the range of approximately 250?C to 545?C (482?F to 1013?F).	Y	58
59	64742-47-8	931-250-7	MK1 diesel fuel	MK1 Diesel Fuel	Description developed by CONCAWE:\r\nA complex combination of hydrocarbons obtained by treating a petroleum fraction with hydrogen in the presence of a catalyst.  It consists of hydrocarbons having carbon numbers predominantly in the range of C10 through C18 and boiling in the range of approximately 180?C to 320?C.	Y	59
60	94733-08-1	305-588-5	Distillates (petroleum), solvent-refined hydrotreated heavy, hydrogenated	OTHER LUBRICANT BASE OILS	No EC number description available in ESIS	Y	60
61	64742-43-4	265-145-6	Paraffin waxes (petroleum), clay-treated	PARAFFIN AND HYDROCARBON WAXES	A complex combination of hydrocarbons obtained by treatment of a petroleum wax fraction with natural or modified clay in either a contacting or percolation process to remove the trace amounts of polar compounds and impurities present.  It consists predominantly of straight chain saturated hydrocarbons having carbon numbers in the range of C20 through C50.	Y	61
62	8002-74-2	232-315-6	Paraffin waxes and Hydrocarbon waxes	PARAFFIN AND HYDROCARBON WAXES	A complex combination of hydrocarbons obtained from petroleum fractions by solvent crystallization (solvent deoiling) or by the sweating process.  It consists predominantly of straight chain hydrocarbons having carbon numbers predominantly greater than C20.	Y	62
63	63231-60-7	264-038-1	Paraffin waxes and Hydrocarbon waxes, microcryst.	PARAFFIN AND HYDROCARBON WAXES	A complex combination of long, branched chain hydrocarbons obtained from residual oils by solvent crystallization.  It consists predominantly of saturated straight and branched chain hydrocarbons predominantly greater than C35.	Y	63
64	64741-51-1	265-052-0	Distillates (petroleum), heavy paraffinic	UNREFINED / ACID TREATED OILS	A complex combination of hydrocarbons produced by vacuum distillation of the residuum from atmospheric distillation of crude oil.  It consists of hydrocarbons having carbon numbers predominantly in the range of C20 through C50 and produces a finished oil with a viscosity of at least 100 SUS at 100?F (19cSt at 40?C).  It contains a relatively large proportion of saturated aliphatic hydrocarbons.	Y	64
65	64742-51-4	265-154-5	Paraffin waxes (petroleum), hydrotreated	PARAFFIN AND HYDROCARBON WAXES	A complex combination of hydrocarbons obtained by treating a petroleum wax with hydrogen in the presence of a catalyst.  It consists predominantly of straight chain paraffinic hydrocarbons having carbon numbers predominantly in the range of about C20 through C50.	Y	65
66	64742-56-9	265-159-2	Distillates (petroleum), solvent-dewaxed light paraffinic	OTHER LUBRICANT BASE OILS	A complex combination of hydrocarbons obtained by removal of normal paraffins from a petroleum fraction by solvent crystallization.  It consists predominantly of hydrocarbons having carbon numbers predominantly in the range of C15 through C30 and produces a finished oil with a viscosity of less than 100 SUS at 100?F (19cSt at 40?C).	Y	66
67	64742-60-5	265-163-4	Hydrocarbon waxes (petroleum), hydrotreated microcryst.	PARAFFIN AND HYDROCARBON WAXES	A complex combination of hydrocarbons obtained by treating a petroleum microcrystalline wax with hydrogen in the presence of a catalyst.  It consists predominantly of long, branched chain hydrocarbons having carbon numbers predominantly in the range of C25 through C50.	Y	67
68	64741-74-8	265-075-6	Naphtha (petroleum), light thermal cracked	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons from distillation of products from a thermal cracking process.  It consists predominantly of unsaturated hydrocarbons having carbon numbers predominantly in the range of C4 through C8 and boiling in the range of approximately minus 10?C to 130?C (14?F to 266?F).	N	68
69	68783-04-0	272-180-0	Extracts (petroleum), solvent-refined heavy paraffinic distillate solvent	TREATED DISTILLATE AROMATIC EXTRACTS	A complex combination of hydrocarbons obtained as the extract from the re-extraction of solvent-refined heavy paraffinic distillate.  It consists of saturated and aromatic hydrocarbons having carbon numbers predominantly in the range of C20 through C50.	Y	69
70	64741-82-8	265-084-5	Distillates (petroleum), light thermal cracked	CRACKED GAS OILS	A complex combination of hydrocarbons from the distillation of the products from a thermal cracking process.  It consists predominantly of unsaturated hydrocarbons having carbon numbers predominantly in the range of C10 through C22 and boiling in the range of approximately 160?C to 370?C (320?F to 698?F).	Y	70
71	68512-62-9	270-984-6	Residues (petroleum), light vacuum	HEAVY FUEL OIL COMPONENTS	A complex residuum from the vacuum distillation of the residuum from the atmospheric distillation of crude oil.  It consists of hydrocarbons having carbon numbers predominantly greater than C13 and boiling above approximately 230?C (446?F).	Y	71
72	64741-96-4	265-097-6	Distillates (petroleum), solvent-refined heavy naphthenic	OTHER LUBRICANT BASE OILS	A complex combination of hydrocarbons obtained as the raffinate from a solvent extraction process.  It consists of hydrocarbons having carbon numbers predominantly in the range of C20 through C50 and produces a finished oil with a viscosity of at least 100 SUS at 100?F (19cSt at 40?C).  It contains relatively few normal paraffins.	Y	72
73	64741-97-5	265-098-1	Distillates (petroleum), solvent-refined light naphthenic	OTHER LUBRICANT BASE OILS	A complex combination of hydrocarbons obtained as the raffinate from a solvent extraction process.  It consists of hydrocarbons having carbon numbers predominantly in the range of C15 through C30 and produces a finished oil with a viscosity of less than 100 SUS at 100?F (19 cSt at 40?C).  It contains relatively few normal paraffins.	Y	73
74	64742-53-6	265-156-6	Distillates (petroleum), hydrotreated light naphthenic	OTHER LUBRICANT BASE OILS	A complex combination of hydrocarbons obtained by treating a petroleum fraction with hydrogen in the presence of a catalyst.  It consists of hydrocarbons having carbon numbers predominantly in the range of C15 through C30 and produces a finished oil with a viscosity of less than 100 SUS at 100?F (19cSt at 40?C).  It contains relatively few normal paraffins.	Y	74
75	64742-52-5	265-155-0	Distillates (petroleum), hydrotreated heavy naphthenic	OTHER LUBRICANT BASE OILS	A complex combination of hydrocarbons obtained by treating a petroleum fraction with hydrogen in the presence of a catalyst.  It consists of hydrocarbons having carbon numbers predominantly in the range of C20 through C50 and produces a finished oil of at least 100 SUS at 100?F (19cSt at 40?C).  It contains relatively few normal paraffins.	Y	75
76	68513-02-0	270-991-4	Naphtha (petroleum), full-range coker	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons produced by the distillation of products from a fluid coker.  It consists predominantly of unsaturated hydrocarbons having carbon numbers predominantly in the range of C4 through C15 and boiling in the range of approximately 43?C to 250?C(110?F-500?F).	Y	76
77	85116-59-2	285-510-3	Naphtha (petroleum), catalytic reformed light, arom.-free fraction	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons remaining after removal of aromatic compounds from catalytic reformed light naphtha in a selective absorption process.  It consists predominantly of paraffinic and cyclic compounds having carbon numbers predominantly in the range of C5 to C8 and boiling in the range of approximately 66?C to 121?C (151?F to 250?F).	N	77
78	68476-33-5	270-675-6	Fuel oil, residual	HEAVY FUEL OIL COMPONENTS	The liquid product from various refinery streams, usually residues.  The composition is complex and varies with the source of the crude oil.	Y	78
79	68607-30-7	271-763-7	Residues (petroleum), topping plant, low-sulfur	HEAVY FUEL OIL COMPONENTS	A low-sulfur complex combination of hydrocarbons produced as the residual fraction from the topping plant distillation of crude oil.  It is the residuum after the straight-run gasoline cut, kerosene cut and gas oil cut have been removed.	Y	79
80	92045-14-2	295-396-7	Fuel oil, heavy, high-sulfur	HEAVY FUEL OIL COMPONENTS	A complex combination of hydrocarbons obtained by the distillation of crude petroleum.  It consists predominantly of aliphatic, aromatic and cycloaliphatic hydrocarbons having carbon numbers predominantly higher than C25 and boiling above approximately 400?C (752?F).	Y	80
81	74869-22-0	278-012-2	Lubricating oils	OTHER LUBRICANT BASE OILS	A complex combination of hydrocarbons obtained from solvent extraction and dewaxing processes.  It consists predominantly of saturated hydrocarbons having carbon numbers in the range C15 through C50.	Y	81
82	64741-50-0	265-051-5	Distillates (petroleum), light paraffinic	UNREFINED / ACID TREATED OILS	A complex combination of hydrocarbons produced by vacuum distillation of the residuum from atmospheric distillation of crude oil.  It consists of hydrocarbons having carbon numbers predominantly in the range of C15 through C30 and produces a finished oil with a viscosity of less than 100 SUS at 100?F (19cSt at 40?C).  It contains a relatively large proportion of saturated aliphatic hydrocarbons normally present in this distillation range of crude oil.	Y	82
83	64741-52-2	265-053-6	Distillates (petroleum), light naphthenic	UNREFINED / ACID TREATED OILS	A complex combination of hydrocarbons produced by vacuum distillation of the residuum from atmospheric distillation of crude oil.  It consists of hydrocarbons having carbon numbers predominantly in the range of C15 through C30 and produces a finished oil with a viscosity of less than 100 SUS at 100?F (19cSt at 40?C).  It contains relatively few normal paraffins.	Y	83
84	64741-53-3	265-054-1	Distillates (petroleum), heavy naphthenic	UNREFINED / ACID TREATED OILS	A complex combination of hydrocarbons produced by vacuum distillation of the residuum from atmospheric distillation of crude oil.  It consists of hydrocarbons having carbon numbers predominantly in the range of C20 through C50 and produces a finished oil with a viscosity of at least 100 SUS at 100?F (19cSt at 40?C).  It contains relatively few normal paraffins.	Y	84
085A	64742-65-0	265-169-7	Distillates (petroleum), solvent-dewaxed heavy paraffinic	OTHER LUBRICANT BASE OILS	A complex combination of hydrocarbons obtained by removal of normal paraffins from a petroleum fraction by solvent crystallization.  It consists predominantly of hydrocarbons having carbon numbers predominantly in the range of C20 through C50 and produces a finished oil with a viscosity not less than 100 SUS at 100?F (19cSt at 40?C).	Y	85
085B	64742-65-0	265-169-7	Distillates (petroleum), solvent-dewaxed heavy paraffinic	OTHER LUBRICANT BASE OILS	A complex combination of hydrocarbons obtained by removal of normal paraffins from a petroleum fraction by solvent crystallization.  It consists predominantly of hydrocarbons having carbon numbers predominantly in the range of C20 through C50 and produces a finished oil with a viscosity not less than 100 SUS at 100?F (19cSt at 40?C).	Y	86
085C	64742-65-0	265-169-7	Distillates (petroleum), solvent-dewaxed heavy paraffinic	OTHER LUBRICANT BASE OILS	A complex combination of hydrocarbons obtained by removal of normal paraffins from a petroleum fraction by solvent crystallization.  It consists predominantly of hydrocarbons having carbon numbers predominantly in the range of C20 through C50 and produces a finished oil with a viscosity not less than 100 SUS at 100?F (19cSt at 40?C).	Y	87
085D	64742-65-0	265-169-7	Distillates (petroleum), solvent-dewaxed heavy paraffinic	OTHER LUBRICANT BASE OILS	A complex combination of hydrocarbons obtained by removal of normal paraffins from a petroleum fraction by solvent crystallization.  It consists predominantly of hydrocarbons having carbon numbers predominantly in the range of C20 through C50 and produces a finished oil with a viscosity not less than 100 SUS at 100?F (19cSt at 40?C).	Y	88
86	64742-81-0	265-184-9	Kerosine (petroleum), hydrodesulfurized	KEROSINES	A complex combination of hydrocarbons obtained from a petroleum stock by treating with hydrogen to convert organic sulfur to hydrogen sulfide which is removed.  It consists of hydrocarbons having carbon numbers predominantly in the range of C9 through C16 and boiling in the range of approximately 150?C to 290?C (302?F to 554?F).	Y	89
87	64742-31-0	265-132-5	Distillates (petroleum), chemically neutralized light	KEROSINES	A complex combination of hydrocarbons produced by a treating process to remove acidic materials.  It consists of hydrocarbons having carbon numbers predominantly in the range of C9 through C16 and boiling in the range of approximately 150?C to 290?C (302?F to 554?F).	Y	90
88	64742-88-7	265-191-7	Solvent naphtha (petroleum), medium aliph.	KEROSINES	A complex combination of hydrocarbons obtained from the distillation of crude oil or natural gasoline.  It consists predominantly of saturated hydrocarbons having carbon numbers predominantly in the range of C9 through C12 and boiling in the range of approximately 140?C to 220?C (284?F to 428?F).	N	91
89	64742-05-8	265-104-2	Extracts (petroleum), light paraffinic distillate solvent	UNTREATED DISTILLATE AROMATIC EXTRACTS	A complex combination of hydrocarbons obtained as the extract from a solvent extraction process.  It consists predominantly of aromatic hydrocarbons having carbon numbers predominantly in the range of C15 through C30.  This stream is likely to contain 5 wt. % or more of 4- to 6-membered condensed ring aromatic hydrocarbons.	Y	92
90	64742-67-2	265-171-8	Foots oil (petroleum)	FOOTS OILS	A complex combination of hydrocarbons obtained as the oil fraction from a solvent deoiling or a wax sweating process.  It consists predominantly of branched chain hydrocarbons having carbon numbers predominantly in the range of C20 through C50.	Y	93
91	68553-00-4	271-384-7	Fuel oil, no. 6	HEAVY FUEL OIL COMPONENTS	A distillate oil having a minimum viscosity of 900 SUS at 37.7?C (100?F) to a maximum of 9000 SUS at 37.7?C (100?F).	Y	94
92	101316-72-7	309-877-7	Lubricating oils (petroleum), C24-50, solvent-extd., dewaxed, hydrogenated	OTHER LUBRICANT BASE OILS	A complex combination of hydrocarbons obtained by solvent extraction and hydrogenation of atmospheric distillation residues.  It consists predominantly of hydrocarbons having carbon numbers predominantly in the range of C24 through C50 and produces a finished oil with a viscosity in the order of 16cSt to 75cSt at 40?C (104?F).	Y	95
93	3/8/8009	232-373-2	Petrolatum	PETROLATUMS	A complex combination of hydrocarbons obtained as a semi-solid from dewaxing paraffinic residual oil.  It consists predominantly of saturated crystalline and liquid hydrocarbons having carbon numbers predominantly greater than C25.	Y	96
94	91995-18-5	295-279-0	Aromatic hydrocarbons, C8, catalytic reforming-derived	LOW BOILING POINT NAPHTHAS (GASOLINES)	No EC number description available in ESIS	N	97
95	93165-19-6	296-903-4	Distillates (petroleum), C6-rich	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons obtained from the distillation of a petroleum feedstock.  It consists predominantly of hydrocarbons having carbon numbers of C5 through C7, rich in C6, and boiling in the range of approximately 60?C to 70?C (140?F to 158?F).	N	98
096A	64742-04-7	265-103-7	Extracts (petroleum), heavy paraffinic distillate solvent	UNTREATED DISTILLATE AROMATIC EXTRACTS	A complex combination of hydrocarbons obtained as the extract from a solvent extraction process.  It consists predominantly of aromatic hydrocarbons having carbon numbers predominantly in the range of C20 through C50.  This stream is likely to contain 5 wt. % or more of 4- to 6-membered condensed ring aromatic hydrocarbons.	Y	99
096B	64742-04-7	265-103-7	Extracts (petroleum), heavy paraffinic distillate solvent	UNTREATED DISTILLATE AROMATIC EXTRACTS	A complex combination of hydrocarbons obtained as the extract from a solvent extraction process.  It consists predominantly of aromatic hydrocarbons having carbon numbers predominantly in the range of C20 through C50.  This stream is likely to contain 5 wt. % or more of 4- to 6-membered condensed ring aromatic hydrocarbons.	Y	100
97	68478-17-1	270-796-4	Residues (petroleum), heavy coker gas oil and vacuum gas oil	HEAVY FUEL OIL COMPONENTS	A complex combination of hydrocarbons produced as the residual fraction from the distillation of heavy coker gas oil and vacuum gas oil.  It predominantly consists of hydrocarbons having carbon numbers predominantly greater than C13 and boiling above approximately 230?C (446?F).	Y	101
098A	64741-66-8	265-068-8	Naphtha (petroleum), light alkylate	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons produced by distillation of the reaction products of isobutane with monoolefinic hydrocarbons usually ranging in carbon numbers from C3 through C5.  It consists of predominantly branched chain saturated hydrocarbons having carbon numbers predominantly in the range of C7 through C10 and boiling in the range of approximately 90?C to 160?C (194?F to 320?F).	N	102
098B	64741-66-8	265-068-8	Naphtha (petroleum), light alkylate	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons produced by distillation of the reaction products of isobutane with monoolefinic hydrocarbons usually ranging in carbon numbers from C3 through C5.  It consists of predominantly branched chain saturated hydrocarbons having carbon numbers predominantly in the range of C7 through C10 and boiling in the range of approximately 90?C to 160?C (194?F to 320?F).	N	103
99	92045-52-8	295-433-7	Naphtha (petroleum), hydrodesulfurized full-range	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons obtained from a catalytic hydrodesulfurization process.  It consists predominantly of hydrocarbons having carbon numbers predominantly in the range of C4 through C11 and boiling in the range of approximately 30?C to 250?C (86?F to 482?F).	N	104
100	64741-46-4	265-046-8	Naphtha (petroleum), light straight-run	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons produced by distillation of crude oil.  It consists predominantly of aliphatic hydrocarbons having carbon numbers predominantly in the range of C4 through C10 and boiling in the range of approximately minus 20?C to 180?C (-4?F to 356?F).	N	105
101	64742-95-6	265-199-0	Solvent naphtha (petroleum), light arom.	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons obtained from distillation of aromatic streams.  It consists predominantly of aromatic hydrocarbons having carbon numbers predominantly in the range of C8 through C10 and boiling in the range of approximately 135?C to 210?C (275?F to 410?F).	N	106
102	85116-53-6	285-505-6	Distillates (petroleum), hydrodesulfurized thermal cracked middle	CRACKED GAS OILS	A complex combination of hydrocarbons obtained by fractionation from hydrodesulfurized thermal cracker distillate stocks.  It consists predominantly of hydrocarbons having carbon numbers predominantly in the range of C11 to C25 and boiling in the range of approximately 205? C to 400?C (401?F to 752?F).	Y	107
103	93571-75-6	297-401-8	Aromatic hydrocarbons, C7-12, C8-rich	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons obtained by separation from the platformate-containing fraction.  It consists predominantly of aromatic hydrocarbons having carbon numbers predominantly in the range of C7 through C12 (primarily C8) and can contain nonaromatic hydrocarbons, both boiling in the range of approximately 130?C to 200?C (266?F to 392?F).	Y	108
104	64742-94-5	265-198-5	Solvent naphtha (petroleum), heavy arom.	KEROSINES	A complex combination of hydrocarbons obtained from distillation of aromatic streams.  It consists predominantly of aromatic hydrocarbons having carbon numbers predominantly in the range of C9 through C16 and boiling in the range of approximately 165?C to 290?C (330?F to 554?F).	Y	109
105	8030-30-6	232-443-2	Naphtha	LOW BOILING POINT NAPHTHAS (GASOLINES)	Refined, partly refined, or unrefined petroleum products produced by the distillation of natural gas.  It consists of hydrocarbons having carbon numbers predominantly in the range of C5 through C6 and boiling in the range of approximately 100?C to 200?C (212?F to 392?F).	N	110
105R	8030-30-6	232-443-2	Naphtha	LOW BOILING POINT NAPHTHAS (GASOLINES)	Refined, partly refined, or unrefined petroleum products produced by the distillation of natural gas.  It consists of hydrocarbons having carbon numbers predominantly in the range of C5 through C6 and boiling in the range of approximately 100?C to 200?C (212?F to 392?F).	N	111
106	64741-60-2	265-062-5	Distillates (petroleum), intermediate catalytic cracked	CRACKED GAS OILS	A complex combination of hydrocarbons produced by the distillation of products from a catalytic cracking process.  It consists of hydrocarbons having carbon numbers predominantly in the range of C11 through C30 and boiling in the range of approximately 205?C to 450?C (401?F to 842?F).  It contains a relatively large proportion of tricyclic aromatic hydrocarbons.	Y	112
107	64742-42-3	265-144-0	Hydrocarbon waxes (petroleum), clay-treated microcryst.	PARAFFIN AND HYDROCARBON WAXES	A complex combination of hydrocarbons obtained by treatment of a petroleum microcrystalline wax fraction with natural or modified clay in either a contacting or percolation process to remove the trace amounts of polar compounds and impurities present.  It consists predominantly of long branched chain hydrocarbons having carbon numbers predominantly in the range of C25 through C50.	Y	113
108	91995-40-3	295-301-9	Distillates (petroleum), dewaxed light paraffinic, hydrotreated	OTHER LUBRICANT BASE OILS	A complex combination of hydrocarbons obtained from an intensive treatment of dewaxed distillate by hydrogenation in the presence of a catalyst.  It consists predominantly of saturated hydrocarbons having carbon numbers predominantly in the range of C21 through C29 and produces a finished oil with a viscosity of approximately 13cSt at 50?C.	Y	114
109	92045-12-0	295-394-6	Foots oil (petroleum), hydrotreated	FOOTS OILS	No EC number description available in ESIS	Y	115
110	92045-58-4	295-440-5	Naphtha (petroleum), isomerization, C6-fraction	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons obtained by distillation of a gasoline which has been catalytically isomerized.  It consists predominantly of hexane isomers boiling in the range of approximately 60?C to 66?C (140?F to 151?F).	N	116
111	92045-77-7	295-459-9	Petrolatum (petroleum), hydrotreated	PETROLATUMS	A complex combination of hydrocarbons obtained as a semi-solid from dewaxed paraffinic residual oil treated with hydrogen in the presence of a catalyst.  It consists predominantly of saturated microcrystalline and liquid hydrocarbons having carbon numbers predominantly greater than C20.	Y	117
112	94733-15-0	305-594-8	Lubricating oils (petroleum), C18-40, solvent-dewaxed hydrocracked distillate-based	OTHER LUBRICANT BASE OILS	A complex combination of hydrocarbons obtained by solvent deparaffination of the distillation residue from hydrocracked petroleum.  It consists predominantly of hydrocarbons having carbon numbers predominantly in the range of C18 through C40 and boiling in the range of approximately 370?C to 550?C (698?F to 1022?F).	Y	118
113	101316-69-2	309-874-0	Lubricating oils (petroleum), C>25, solvent-extd., deasphalted, dewaxed, hydrogenated	OTHER LUBRICANT BASE OILS	A complex combination of hydrocarbons obtained by solvent extraction and hydrogenation of vacuum distillation residues.  It consists predominantly of hydrocarbons having carbon numbers predominantly greater than C25 and produces a finished oil with a viscosity in the order of 32cSt to 37cSt at 100?C (212?F).	Y	119
114	64742-44-5	265-146-1	Distillates (petroleum), clay-treated heavy naphthenic	OTHER LUBRICANT BASE OILS	A complex combination of hydrocarbons resulting from treatment of a petroleum fraction with natural or modified clay in either a contacting or percolation process to remove the trace amounts of polar compounds and impurities present.  It consists of hydrocarbons having carbon numbers predominantly in the range of C20 through C50 and produces a finished oil with a viscosity of at least 100 SUS at 100?F (19cSt at 40?C).  It contains relatively few normal paraffins.	Y	120
115	72623-85-9	276-736-3	Lubricating oils (petroleum), C20-50, hydrotreated neutral oil-based, high-viscosity	OTHER LUBRICANT BASE OILS	A complex combination of hydrocarbons obtained by treating light vacuum gas oil, heavy vacuum gas oil, and solvent deasphalted residual oil with hydrogen in the presence of a catalyst in a two stage process with dewaxing being carried out between the two stages.  It consists predominantly of hydrocarbons having carbon numbers predominantly in the range of C20 through C50 and produces a finished oil having a viscosity of approximately 112cSt at 40?C.  It contains a relatively large proportion of saturated hydrocarbons.	Y	121
116	8032-32-4	232-453-7	Ligroine	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons obtained by the fractional distillation of petroleum.  This fraction boils in a range of approximately 20?C to 135?C (58?F to 275?F).	N	122
117	64741-76-0	265-077-7	Distillates (petroleum), heavy hydrocracked	OTHER LUBRICANT BASE OILS	A complex combination of hydrocarbons from the distillation of the products from a hydrocracking process.  It consists predominantly of saturated hydrocarbons having carbon numbers in the range of C15-C39 and boiling in the range of approximately 260?C to 600?C (500?F to 1112?F).	Y	123
118	72623-86-0	276-737-9	Lubricating oils (petroleum), C15-30, hydrotreated neutral oil-based	OTHER LUBRICANT BASE OILS	A complex combination of hydrocarbons obtained by treating light vacuum gas oil and heavy vacuum gas oil with hydrogen in the presence of a catalyst in a two stage process with dewaxing being carried out between the two stages.  It consists predominantly of hydrocarbons having carbon numbers predominantly in the range of C15 through C30 and produces a finished oil having a viscosity of approximately 15cSt at 40?C.  It contains a relatively large proportion of saturated hydrocarbons.	Y	124
119	72623-87-1	276-738-4	Lubricating oils (petroleum), C20-50, hydrotreated neutral oil-based	OTHER LUBRICANT BASE OILS	A complex combination of hydrocarbons obtained by treating light vacuum gas oil, heavy vacuum gas oil and solvent deasphalted residual oil with hydrogen in the presence of a catalyst in a two stage process with dewaxing being carried out between the two stages.  It consists predominantly of hydrocarbons having carbon numbers predominantly in the range of C20 through C50 and produces a finished oil with a viscosity of approximately 32cSt at 40?C.  It contains a relatively large proportion of saturated hydrocarbons.	Y	125
120	64741-68-0	265-070-9	Naphtha (petroleum), heavy catalytic reformed	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons produced from the distillation of products from a catalytic reforming process.  It consists of predominantly aromatic hydrocarbons having carbon numbers predominantly in the range of C7 through C12 and boiling in the range of approximately 90?C to 230?C (194?F to 446?F).	Y	126
121	68333-25-5	269-781-5	Distillates (petroleum), hydrodesulfurized light catalytic cracked	CRACKED GAS OILS	A complex combination of hydrocarbons obtained by treating light catalytic cracked distillates with hydrogen to convert organic sulfur to hydrogen sulfide which is removed.  It consists of hydrocarbons having carbon numbers predominantly in the range of C9 through C25 and boiling in the range of approximately 150?C to 400?C (302?F to 752?F).  It contains a relatively large proportion of bicyclic aromatic hydrocarbons.	Y	127
122	68919-37-9	272-895-8	Naphtha (petroleum), full-range reformed	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons produced by the distillation of the products from a catalytic reforming process.  It consists of hydrocarbons having carbon numbers predominantly in the range of C5 through C12 and boiling in the range of approximately 35?C to 230?C (95?F to 446?F).	N	128
123	64742-96-7	265-200-4	Solvent naphtha (petroleum), heavy aliph.	KEROSINES	A complex combination of hydrocarbons obtained from the distillation of crude oil or natural gasoline.  It consists predominantly of saturated hydrocarbons having carbon numbers predominantly in the range of C11 through C16 and boiling in the range of approximately 190?C to 290?C (374?F to 554?F).	Y	129
124	68514-79-4	271-058-4	Petroleum products, hydrofiner-powerformer reformates	LOW BOILING POINT NAPHTHAS (GASOLINES)	The complex combination of hydrocarbons obtained in a hydrofiner-powerformer process and boiling in a range of approximately 27?C to 210?C (80?F to 410?F).	Y	130
125	68783-66-4	272-206-0	Naphtha (petroleum), light, sweetened	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons obtained by subjecting a petroleum distillate to a sweetening process to convert mercaptans or to remove acidic impurities.  It consists predominantly of saturated and unsaturated hydrocarbons having carbon numbers predominantly in the range of C3 through C6 and boiling in the range of approximately -20?C to 100?C (-4?F to 212?F).	N	131
126	93572-29-3	297-458-9	Gasoline, C5-11, high-octane stabilized reformed	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex high octane combination of hydrocarbons obtained by the catalytic dehydrogenation of a predominantly naphthenic naphtha.  It consists predominantly of aromatics and non-aromatics having carbon numbers predominantly in the range of C5 through C11 and boiling in the range of approximately 45?C to 185?C (113?F to 365?F).	N	132
127	90669-78-6	292-660-3	Slack wax (petroleum), clay-treated	SLACK WAXES 	A complex combination of hydrocarbons obtained by treatment of a petroleum slack wax fraction with natural or modified clay in either a contacting or percolation process.  It consists predominantly of saturated straight and branched hydrocarbons having carbon numbers predominantly greater than C20.	Y	133
128	91770-15-9	294-799-5	Kerosine (petroleum), sweetened	KEROSINES	A complex combination of hydrocarbons obtained by subjecting a petroleum distillate to a sweetening process to convert mercaptans or to remove acidic impurities.  It consists predominantly of hydrocarbons having carbon numbers predominantly in the range of C9 through C16 and boiling in the range of 130?C to 290?C (266?F to 554?F).	Y	134
129	93821-66-0	298-754-0	Residual oils (petroleum)	HEAVY FUEL OIL COMPONENTS	A complex combination of hydrocarbons, sulfur compounds and metal-containing organic compounds obtained as the residue from refinery fractionation cracking processes.  It produces a finished oil with a viscosity above 2cSt. at 100?C.	Y	135
130	64741-59-9	265-060-4	Distillates (petroleum), light catalytic cracked	CRACKED GAS OILS	A complex combination of hydrocarbons produced by the distillation of products from a catalytic cracking process.  It consists of hydrocarbons having carbon numbers predominantly in the range of C9 through C25 and boiling in the range of approximately 150?C to 400?C (302?F to 752?F).  It contains a relatively large proportion of bicyclic aromatic hydrocarbons.	Y	136
131	68955-27-1	273-263-4	Distillates (petroleum), petroleum residues vacuum	HEAVY FUEL OIL COMPONENTS	A complex combination of hydrocarbons produced by the vacuum distillation of the residuum from the atmospheric distillation of crude oil.	Y	137
132	68476-46-0	270-686-6	Hydrocarbons, C3-11, catalytic cracker distillates	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons produced by the distillations of products from a catalytic cracking process.  It consists of hydrocarbons having carbon numbers predominantly in the range of C3 through C11 and boiling in a range approximately up to 204?C(400?F).	Y	138
133	64741-64-6	265-066-7	Naphtha (petroleum), full-range alkylate	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons produced by distillation of the reaction products of isobutane with monoolefinic hydrocarbons usually ranging in carbon numbers from C3 through C5.  It consists of predominantly branched chain saturated hydrocarbons having carbon numbers predominantly in the range of C7 through C12 and boiling in the range of approximately 90?C to 220?C (194?F to 428?F).	N	139
134	64741-61-3	265-063-0	Distillates (petroleum), heavy catalytic cracked	HEAVY FUEL OIL COMPONENTS	A complex combination of hydrocarbons produced by the distillation of products from a catalytic cracking process.  It consists of hydrocarbons having carbon numbers predominantly in the range of C15 through C35 and boiling in the range of approximately 260?C to 500?C (500?F to 932?F).  This stream is likely to contain 5 wt. % or more of 4- to 6-membered condensed ring aromatic hydrocarbons.	Y	140
135	68814-89-1	272-342-0	Extracts (petroleum), heavy paraffinic distillates, solvent-deasphalted	TREATED DISTILLATE AROMATIC EXTRACTS	A complex combination of hydrocarbons obtained as the extract from a solvent extraction of heavy paraffinic distillate.	Y	141
136	92062-09-4	295-523-6	Slack wax (petroleum), hydrotreated	SLACK WAXES 	A complex combination of hydrocarbons obtained by treating slack wax with hydrogen in the presence of a catalyst.  It consists predominantly of saturated straight and branched chain hydrocarbons having carbon numbers predominantly greater than C20.	Y	142
137	90669-74-2	292-656-1	Residual oils (petroleum), hydrotreated solvent dewaxed	OTHER LUBRICANT BASE OILS	No EC number description available in ESIS	Y	143
138	64741-95-3	265-096-0	Residual oils (petroleum), solvent deasphalted	OTHER LUBRICANT BASE OILS	A complex combination of hydrocarbons obtained as the solvent soluble fraction from C3 - C4 solvent deasphalting of a residuum.  It consists of hydrocarbons having carbon numbers predominantly higher than C25 and boiling above approximately 400?C (752?F).	Y	144
139	64742-57-0	265-160-8	Residual oils (petroleum), hydrotreated	OTHER LUBRICANT BASE OILS	A complex combination of hydrocarbons obtained by treating a petroleum fraction with hydrogen in the presence of a catalyst.  It consists of hydrocarbons having carbon numbers predominantly greater than C25 and boiling above approximately 400?C (752?F).	Y	145
140	64742-62-7	265-166-0	Residual oils (petroleum), solvent-dewaxed	OTHER LUBRICANT BASE OILS	A complex combination of hydrocarbons obtained by removal of long, branched chain hydrocarbons from a residual oil by solvent crystallization.  It consists of hydrocarbons having carbon numbers predominantly greater than C25 and boiling above approximately 400?C (752?F).	Y	146
141	64741-83-9	265-085-0	Naphtha (petroleum), heavy thermal cracked	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons from distillation of the products from a thermal cracking process.  It consists predominantly of unsaturated hydrocarbons having carbon numbers predominantly in the range of C6 through C12 and boiling in the range of approximately 65?C to 220?C (148?F to 428?F).	Y	147
142	64742-49-0	265-151-9	Naphtha (petroleum), hydrotreated light	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons obtained by treating a petroleum fraction with hydrogen in the presence of a catalyst.  It consists of hydrocarbons having carbon numbers predominantly in the range of C4 through C11 and boiling in the range of approximately minus 20?C to 190?C (-4?F to 374?F).	N	148
143	64741-55-5	265-056-2	Naphtha (petroleum), light catalytic cracked	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons produced by the distillation of products from a catalytic cracking process.  It consists of hydrocarbons having carbon numbers predominantly in the range of C4 through C11 and boiling in the range of approximately minus 20?C to 190?C (-4?F to 374?F).  It contains a relatively large proportion of unsaturated hydrocarbons.	N	149
144	86290-81-5	289-220-8	Gasoline	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons consisting primarily of paraffins, cycloparaffins, aromatic and olefinic hydrocarbons having carbon numbers predominantly greater than C3 and boiling in the range of 30?C to 260?C (86?F to 500?F).	N	150
145	8042-47-5	232-455-8	White mineral oil (petroleum)	HIGHLY REFINED BASE OILS	A highly refined petroleum mineral oil consisting of a complex combination of hydrocarbons obtained from the intensive treatment of a petroleum fraction with sulfuric acid and oleum, or by hydrogenation, or by a combination of hydrogenation and acid treatment.  Additional washing and treating steps may be included in the processing operation.  It consists of saturated hydrocarbons having carbon numbers predominantly in the range of C15 through C50.	Y	151
146	64741-54-4	265-055-7	Naphtha (petroleum), heavy catalytic cracked	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons produced by a distillation of products from a catalytic cracking process.  It consists of hydrocarbons having carbon numbers predominantly in the range of C6 through C12 and boiling in the range of approximately 65?C to 230?C (148?F to 446?F).  It contains a relatively large proportion of unsaturated hydrocarbons.	Y	152
147	64741-88-4	265-090-8	Distillates (petroleum), solvent-refined heavy paraffinic	OTHER LUBRICANT BASE OILS	A complex combination of hydrocarbons obtained as the raffinate from a solvent extraction process.  It consists predominantly of saturated hydrocarbons having carbon numbers predominantly in the range of C20 through C50 and produces a finished oil with a viscosity of at least 100 SUS at 100?F (19cSt at 40?C).	Y	153
148	64741-89-5	265-091-3	Distillates (petroleum), solvent-refined light paraffinic	OTHER LUBRICANT BASE OILS	A complex combination of hydrocarbons obtained as the raffinate from a solvent extraction process.  It consists predominantly of saturated hydrocarbons having carbon numbers predominantly in the range of C15 through C30 and produces a finished oil with a viscosity of less than 100 SUS at 100?F (19cSt at 40?C).	Y	154
149	64742-01-4	265-101-6	Residual oils (petroleum), solvent-refined	OTHER LUBRICANT BASE OILS	A complex combination of hydrocarbons obtained as the solvent insoluble fraction from solvent refining of a residuum using a polar organic solvent such as phenol or furfural.  It consists of hydrocarbons having carbon numbers predominantly higher than C25 and boiling above approximately 400?C (752?F).	Y	155
150	64742-54-7	265-157-1	Distillates (petroleum), hydrotreated heavy paraffinic	OTHER LUBRICANT BASE OILS	A complex combination of hydrocarbons obtained by treating a petroleum fraction with hydrogen in the presence of a catalyst.  It consists of hydrocarbons having carbon numbers predominantly in the range of C20 through C50 and produces a finished oil of at least 100 SUS at 100?F (19cSt at 40?C).  It contains a relatively large proportion of saturated hydrocarbons.	Y	156
151	64742-55-8	265-158-7	Distillates (petroleum), hydrotreated light paraffinic	OTHER LUBRICANT BASE OILS	A complex combination of hydrocarbons obtained by treating a petroleum fraction with hydrogen in the presence of a catalyst.  It consists of hydrocarbons having carbon numbers predominantly in the range of C15 through C30 and produces a finished oil with a viscosity of less than 100 SUS at 100?F (19cSt at 40?C).  It contains a relatively large proportion of saturated hydrocarbons.	Y	157
152	64742-61-6	265-165-5	Slack wax (petroleum)	SLACK WAXES 	A complex combination of hydrocarbons obtained from a petroleum fraction by solvent crystallization (solvent dewaxing) or as a distillation fraction from a very waxy crude.  It consists predominantly of saturated straight and branched chain hydrocarbons having carbon numbers predominantly greater than C20.	Y	158
153	64742-70-7	265-174-4	Paraffin oils (petroleum), catalytic dewaxed heavy	OTHER LUBRICANT BASE OILS	A complex combination of hydrocarbons obtained from a catalytic dewaxing process.  It consists predominantly of hydrocarbons having carbon numbers predominantly in the range of C20 through C50 and produces a finished oil with a viscosity of at least 100 SUS at 100?F (19cSt at 40?C).	Y	159
154	64742-71-8	265-176-5	Paraffin oils (petroleum), catalytic dewaxed light	OTHER LUBRICANT BASE OILS	A complex combination of hydrocarbons obtained from a catalytic dewaxing process.  It consists predominantly of hydrocarbons having carbon numbers predominantly in the range of C15 through C30 and produces a finished oil with a viscosity of less than 100 SUS at 100?F (19cSt at 40?C).	Y	160
155	64741-67-9	265-069-3	Residues (petroleum), catalytic reformer fractionator	HEAVY FUEL OIL COMPONENTS	A complex combination of hydrocarbons produced as the residual fraction from distillation of the product from a catalytic reforming process.  It consists of predominantly aromatic hydrocarbons having carbon numbers predominantly in the range of C10 through C25 and boiling in the range of approximately 160?C to 400?C (320?F to 725?F).  This stream is likely to contain 5 wt. % or more of 4- or 6-membered condensed ring aromatic hydrocarbons.	Y	161
156	64742-48-9	265-150-3	Naphtha (petroleum), hydrotreated heavy	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons obtained by treating a petroleum fraction with hydrogen in the presence of a catalyst.  It consists of hydrocarbons having carbon numbers predominantly in the range of C6 through C13 and boiling in the range of approximately 65?C to 230?C (149?F to 446?F).	N	162
157	64741-63-5	265-065-1	Naphtha (petroleum), light catalytic reformed	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons produced from the distillation of products from a catalytic reforming process.  It consists of hydrocarbons having carbon numbers predominantly in the range of C5 through C11 and boiling in the range of approximately 35?C to 190?C (95?F to 374?F).  It contains a relatively large proportion of aromatic and branched chain hydrocarbons.  This stream may contain 10 vol. % or more benzene.	N	163
158	64741-72-6	613-683-0	Naphtha (petroleum), polymn.	LOW BOILING POINT NAPHTHAS (GASOLINES)	Not listed in ESIS.     A complex combination of hydrocarbons produced by the catalytic  polymerization of a mixture rich in propylene or butylene. It consists predominantly of monoolefinic hydrocarbons having carbon numbers predominantly in the range of C6 through C12 and boiling in the range of approximately 65.degree.C to 220.degree.C (148.degree.F to 428.degree.F).	N	164
159	92045-60-8	295-442-6	Naphtha (petroleum), light, C5-rich, sweetened 	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons obtained by subjecting a petroleum naphtha to a sweetening process to convert mercaptans or to remove acidic impurities.  It consists of hydrocarbons having carbon numbers predominantly in the range of C4 through C5, predominantly C5, and boiling in the range of approximately minus 10?C to 35?C (14?F to 95?F).	N	165
160	93924-32-4	300-226-2	Foots oil (petroleum), clay-treated	FOOTS OILS	A complex combination of hydrocarbons obtained by treatment of Foot's oil with natural or modified clay in either a contacting or percolation process to remove the trace amounts of polar compounds and impurities present.  It consists predominantly of branched chain hydrocarbons with carbon numbers predominantly in the range of C20 through C50.	Y	166
161	64743-01-7	265-206-7	Petrolatum (petroleum), oxidized	PETROLATUMS	A complex combination of organic compounds, predominantly high molecular weight carboxylic acids, obtained by the air oxidation of petrolatum.	N	167
162	68410-97-9	270-093-2	Distillates (petroleum), light distillate hydrotreating process, low-boiling	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons obtained by the distillation of products from the light distillate hydrotreating process.  It consists of hydrocarbons having carbon numbers predominantly in the range of C6 through C9 and boiling in the range of approximately 3?C to 194?C (37?F to 382?F).	N	168
163	64742-82-1	265-185-4	Naphtha (petroleum), hydrodesulfurized heavy 	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons obtained from a catalytic hydrodesulfurization process.  It consists of hydrocarbons having carbon numbers predominantly in the range of C7 through C12 and boiling in the range of approximately 90?C to 230?C (194?F to 446?F).	N	169
164	68476-32-4	270-674-0	Fuel oil, residues-straight-run gas oils, high-sulfur	HEAVY FUEL OIL COMPONENTS	No EC number description available in ESIS	Y	170
165	64741-70-4	265-073-5	Naphtha (petroleum), isomerization	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons obtained from catalytic isomerization of straight chain paraffinic C4 through C6 hydrocarbons.  It consists predominantly of saturated hydrocarbons such as isobutane, isopentane, 2,2-dimethylbutane, 2-methylpentane, and 3-methylpentane.	N	171
166	64741-75-9	265-076-1	Residues (petroleum), hydrocracked	HEAVY FUEL OIL COMPONENTS	A complex combination of hydrocarbons produced as the residual fraction from distillation of the products of a hydrocracking process.  It consists of hydrocarbons having carbon numbers predominantly greater than C20 and boiling above approximately 350?C (662?F).	Y	172
167	64741-42-0	265-042-6	Naphtha (petroleum), full-range straight-run	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons produced by distillation of crude oil.  It consists of hydrocarbons having carbon numbers predominantly in the range of C4 through C11 and boiling in the range of approximately minus 20?C to 220?C (-4?F to 428?F).	N	173
168	64741-43-1	265-043-1	Gas oils (petroleum), straight-run	STRAIGHT-RUN GAS OILS	A complex combination of hydrocarbons produced by the distillation of crude oil.  It consists of hydrocarbons having carbon numbers predominantly in the range of C11 through C25 and boiling in the range of approximately 205?C to 400?C (401?F to 752?F).	Y	174
169	68814-87-9	272-341-5	Distillates (petroleum), full-range straight-run middle	STRAIGHT-RUN GAS OILS	A complex combination of hydrocarbons produced by the distillation of crude oil.  It consists of hydrocarbons having carbon numbers predominantly in the range of C9 through C25 and boiling in the range of approximately 150?C to 400?C (320?F to 752?F).	Y	175
170	68814-87-9	272-341-5	Distillates (petroleum), full-range straight-run middle	STRAIGHT-RUN GAS OILS	A complex combination of hydrocarbons produced by the distillation of crude oil.  It consists of hydrocarbons having carbon numbers predominantly in the range of C9 through C25 and boiling in the range of approximately 150?C to 400?C (320?F to 752?F).	Y	176
171	68915-96-8	272-817-2	Distillates (petroleum), heavy straight-run	STRAIGHT-RUN GAS OILS	A complex combination of hydrocarbons produced by the atmospheric distillation of crude oil.  It boils in the range of approximately 288?C to 471?C (550?F to 880?F).	Y	177
172	64741-43-1	265-043-1	Gas oils (petroleum), straight-run	STRAIGHT-RUN GAS OILS	A complex combination of hydrocarbons produced by the distillation of crude oil.  It consists of hydrocarbons having carbon numbers predominantly in the range of C11 through C25 and boiling in the range of approximately 205?C to 400?C (401?F to 752?F).	Y	178
173	64742-46-7	265-148-2	Distillates (petroleum), hydrotreated middle	OTHER GAS OILS	A complex combination of hydrocarbons obtained by treating a petroleum fraction with hydrogen in the presence of a catalyst.  It consists of hydrocarbons having carbon numbers predominantly in the range of C11 through C25 and boiling in the range of approximately 205?C to 400?C (401?F to 752?F).	Y	179
174	64742-80-9	265-183-3	Distillates (petroleum), hydrodesulfurized middle	OTHER GAS OILS	A complex combination of hydrocarbons obtained from a petroleum stock by treating with hydrogen to convert organic sulfur to hydrogen sulfide which is removed.  It consists of hydrocarbons having carbon numbers predominantly in the range of C11 through C25 and boiling in the range of approximately 205?C to 400?C (401?F to 752?F).	Y	180
175	64741-49-7	265-049-4	Condensates (petroleum), vacuum tower	VACUUM GAS OILS, HYDROCRACKED GAS OILS & DISTILLATE FUELS	A complex combination of hydrocarbons produced as the lowest boiling stream in the vacuum distillation of the residuum from atmospheric distillation of crude oil.  It consists of hydrocarbons having carbon numbers predominantly in the range of C11 through C25 and boiling in the range of approximately 205?C to 400?C (401?F to 752?F).	Y	181
176	64741-58-8	265-059-9	Gas oils (petroleum), light vacuum	VACUUM GAS OILS, HYDROCRACKED GAS OILS & DISTILLATE FUELS	A complex combination of hydrocarbons produced by the vacuum distillation of the residuum from atmospheric distillation of crude oil.  It consists of hydrocarbons having carbon numbers predominantly in the range of C13 through C30 and boiling in the range of approximately 230?C to 450?C (446?F to 842?F).	Y	182
177	64741-77-1	265-078-2	Distillates (petroleum), light hydrocracked	VACUUM GAS OILS, HYDROCRACKED GAS OILS & DISTILLATE FUELS	A complex combination of hydrocarbons from distillation of the products from a hydrocracking process.  It consists predominantly of saturated hydrocarbons having carbon numbers predominantly in the range of C10 through C18, and boiling in the range of approximately 160?C to 320?C (320?F to 608?F).	Y	183
178	64742-87-6	265-190-1	Gas oils (petroleum), hydrodesulfurized light vacuum	VACUUM GAS OILS, HYDROCRACKED GAS OILS & DISTILLATE FUELS	A complex combination of hydrocarbons obtained from a catalytic hydrodesulfurization process.  It consists of hydrocarbons having carbon numbers predominantly in the range of C13 through C30 and boiling in the range of approximately 230?C to 450?C (446?F to 842?F).	Y	184
179	68334-30-5	269-822-7	Fuels, diesel	VACUUM GAS OILS, HYDROCRACKED GAS OILS & DISTILLATE FUELS	A complex combination of hydrocarbons produced by the distillation of crude oil.  It consists of hydrocarbons having carbon numbers predominantly in the range of C9 through C20 and boiling in the range of approximately 163?C to 357?C (325?F to 675?F).	Y	185
180	68334-30-5	269-822-7	Fuels, diesel	VACUUM GAS OILS, HYDROCRACKED GAS OILS & DISTILLATE FUELS	A complex combination of hydrocarbons produced by the distillation of crude oil.  It consists of hydrocarbons having carbon numbers predominantly in the range of C9 through C20 and boiling in the range of approximately 163?C to 357?C (325?F to 675?F).	Y	186
181	68476-30-2	270-671-4	Fuel oil, no. 2	VACUUM GAS OILS, HYDROCRACKED GAS OILS & DISTILLATE FUELS	A distillate oil having a minimum viscosity of 32.6 SUS at 37.7?C (100?F) to a maximum of 37.9 SUS at 37.7?C (100?F).	Y	187
182	68476-31-3	270-673-5	Fuel oil, no. 4	VACUUM GAS OILS, HYDROCRACKED GAS OILS & DISTILLATE FUELS	A distillate oil having a minimum viscosity of 45 SUS at 37.7?C (100?F) to a maximum of 125 SUS at 37.7?C (100?F).	Y	188
183	68476-34-6	270-676-1	Fuels, diesel, no. 2	VACUUM GAS OILS, HYDROCRACKED GAS OILS & DISTILLATE FUELS	A distillate oil having a minimum viscosity of 32.6 SUS at 37.7?C (100?F) to a maximum of 40.1 SUS at 37.7?C (100?F).	Y	189
183R	68476-34-6	270-676-1	Fuels, diesel, no. 2	VACUUM GAS OILS, HYDROCRACKED GAS OILS & DISTILLATE FUELS	A distillate oil having a minimum viscosity of 32.6 SUS at 37.7?C (100?F) to a maximum of 40.1 SUS at 37.7?C (100?F).	N	190
184	92045-24-4	295-407-5	Gas oils (petroleum), hydrotreated light vacuum	VACUUM GAS OILS, HYDROCRACKED GAS OILS & DISTILLATE FUELS	A complex combination of hydrocarbons that is obtained by treatment of light vacuum petroleum gas oils with hydrogen in the presence of a catalyst.  It consists of hydrocarbons having carbon numbers predominantly in the range of C13 through C30 and boiling in the range of approximately 230?C to 450?C (446?F to 842?F).	Y	191
185	64742-10-5	265-110-5	Extracts (petroleum), residual oil solvent	RESIDUAL AROMATIC EXTRACTS	A complex combination of hydrocarbons obtained as the extract from a solvent extraction process.  It consists predominantly of aromatic hydrocarbons having carbon numbers predominantly higher than C25.	Y	192
186	91995-70-9	295-332-8	Extracts (petroleum), deasphalted vacuum residue solvent	RESIDUAL AROMATIC EXTRACTS	A complex combination of hydrocarbons obtained by solvent extraction of a vacuum-deasphalted residue.  It consists predominantly of aromatic hydrocarbons having carbon numbers predominantly greater than C30.  This stream contains more than 5 wt. % of 4- to 6-membered condensed ring aromatic hydrocarbons.	Y	193
187(1)	64742-79-6	265-182-8	Gas oils (petroleum), hydrodesulfurized	OTHER GAS OILS	A complex combination of hydrocarbons obtained from a petroleum stock by treating with hydrogen to convert organic sulfur to hydrogen sulfide which is removed.  It consists predominantly of hydrocarbons having carbon numbers predominantly in the range of C13 through C25 and boiling in the range of approximately 230?C to 400?C (446?F to 752?F).	Y	194
187(2)	64742-79-6	265-182-8	Gas oils (petroleum), hydrodesulfurized	OTHER GAS OILS	A complex combination of hydrocarbons obtained from a petroleum stock by treating with hydrogen to convert organic sulfur to hydrogen sulfide which is removed.  It consists predominantly of hydrocarbons having carbon numbers predominantly in the range of C13 through C25 and boiling in the range of approximately 230?C to 400?C (446?F to 752?F).	Y	195
188	64741-44-2	265-044-7	Distillates (petroleum), straight-run middle	STRAIGHT-RUN GAS OILS	A complex combination of hydrocarbons produced by the distillation of crude oil.  It consists of hydrocarbons having carbon numbers predominantly in the range of C11 through C20 and boiling in the range of 205?C to 345?C (401?F to 653?F).	Y	196
189	8052-42-4	232-490-9	Asphalt	BITUMEN	A very complex combination of high molecular weight organic compounds containing a relatively high proportion of hydrocarbons having carbon numbers predominantly greater than C25 with high carbon-to-hydrogen ratios.  It also contains small amounts of various metals such as nickel, iron, or vanadium.  It is obtained as the non-volatile residue from distillation of crude oil or by separation as the raffinate from a residual oil in a deasphalting or decarbonization process.	Y	197
190	64741-56-6	265-057-8	Residues (petroleum), vacuum	BITUMEN	A complex residuum from the vacuum distillation of the residuum from atmospheric distillation of crude oil.  It consists of hydrocarbons having carbon numbers predominantly greater than C34 and boiling above approximately 495?C (923?F).	Y	198
191	64742-85-4	265-188-0	Residues (petroleum), hydrodesulfurized vacuum	BITUMEN	A complex combination of hydrocarbons obtained by treating a vacuum residuum with hydrogen in the presence of a catalyst under conditions primarily to remove organic sulfur compounds.  It consists of hydrocarbons having carbon numbers predominantly greater than C34 and boiling approximately above 495?C (923?F).	Y	199
192	92062-05-0	295-518-9	Residues (petroleum), thermal cracked vacuum	BITUMEN	A complex combination of hydrocarbons obtained from the vacuum distillation of the products from a thermal cracking process.  It consists predominantly of hydrocarbons having carbon numbers predominantly greater than C34 and boiling above approximately 495?C (923?F).	Y	200
193	64742-93-4	265-196-4	Asphalt, oxidized	OXIDISED ASPHALT	A complex black solid obtained by blowing air through a heated residuum, or raffinate from a deasphalting process with or without a catalyst.  The process is principally one of oxidative condensation which increases the molecular weight.	Y	201
194	64741-47-5	265-047-3	Natural gas condensates (petroleum)	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons separated as a liquid from natural gas in a surface separator by retrograde condensation. It consists mainly of hydrocarbons having carbon numbers predominantly in the range of C2 to C20. It is a liquid at atmospheric temperature and pressure. 	N	202
195	64742-11-6	265-111-0	Extracts (petroleum), heavy naphthenic distillate solvent	UNTREATED DISTILLATE AROMATIC EXTRACTS	A complex combination of hydrocarbons obtained as the extract from a solvent extraction process. It consists predominantly of aromatic hydrocarbons having carbon numbers predominantly in the range of C20 through C50. This stream is likely to contain 5 wt. % or more of 4- to 6-membered condensed ring aromatic hydrocarbons.	Y	203
196	100684-33-1	309-706-6	Petrolatum (petroleum), clay-treated	PETROLATUMS	To be supplied.	Y	204
197	64742-59-2	265-162-9	Gas oils (petroleum), hydrotreated vacuum	HEAVY FUEL OIL COMPONENTS	A complex combination of hydrocarbons obtained by treating a petroleum fraction with hydrogen in the presence of a catalyst. It consists of hydrocarbons having carbon numbers predominantly in the range of C13 through C50 and boiling in the range of approximately 230.degree.C to 600.degree.C (446.degree.F to 1112.degree.F). This stream is likely to contain 5 wt. % or more of 4- to 6- membered condensed ring aromatic hydrocarbons. 	Y	205
198-R22	68921-08-4	272-931-2	Distillates (petroleum), light straight-run gasoline fractionation stabilizer overheads	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons obtained by the fractionation of light straight-run gasoline. It consists of saturated aliphatic hydrocarbons having carbon numbers predominantly in the range of C3 through C6.	N	206
198-R32	68921-08-4	272-931-2	Distillates (petroleum), light straight-run gasoline fractionation stabilizer overheads	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons obtained by the fractionation of light straight-run gasoline. It consists of saturated aliphatic hydrocarbons having carbon numbers predominantly in the range of C3 through C6.	N	207
198-R42	68921-08-4	272-931-2	Distillates (petroleum), light straight-run gasoline fractionation stabilizer overheads	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons obtained by the fractionation of light straight-run gasoline. It consists of saturated aliphatic hydrocarbons having carbon numbers predominantly in the range of C3 through C6.	N	208
198-R62	68921-08-4	272-931-2	Distillates (petroleum), light straight-run gasoline fractionation stabilizer overheads	LOW BOILING POINT NAPHTHAS (GASOLINES)	A complex combination of hydrocarbons obtained by the fractionation of light straight-run gasoline. It consists of saturated aliphatic hydrocarbons having carbon numbers predominantly in the range of C3 through C6.	N	209
199	91770-57-9	294-843-3	Residual oils (petroleum), catalytic dewaxed	OTHER LUBRICANT BASE OILS	To be supplied.	N	210
200-A21	92045-37-9	295-418-5	Kerosine (petroleum), straight-run wide-cut	LOW BOILING POINT NAPHTHAS (GASOLINES)	To be supplied.	N	211
200-R33	92045-37-9	295-418-5	Kerosine (petroleum), straight-run wide-cut	LOW BOILING POINT NAPHTHAS (GASOLINES)	To be supplied.	N	212
200-R43	92045-37-9	295-418-5	Kerosine (petroleum), straight-run wide-cut	LOW BOILING POINT NAPHTHAS (GASOLINES)	To be supplied.	N	213
200-R63	92045-37-9	295-418-5	Kerosine (petroleum), straight-run wide-cut	LOW BOILING POINT NAPHTHAS (GASOLINES)	To be supplied.	N	214
201	92045-63-1	295-445-2	Hydrocarbons, C4-11, naphtha-cracking, arom.-free	LOW BOILING POINT NAPHTHAS (GASOLINES)	To be supplied.	N	215
202	92045-76-6	295-458-3	Paraffin waxes and Hydrocarbon waxes, microcryst., hydrotreated	PARAFFIN AND HYDROCARBON WAXES	A complex combination of hydrocarbons obtained from residual oils by solvent crystallisation and treated with hydrogen in the presence of a catalyst. It consists predominantly of saturated straight and branched chain hydrocarbons having carbon numbers predominantly greater than C25.	Y	216
203	97862-82-3	308-132-3	Hydrocarbons, C17-30, hydrotreated distillates, distn. lights	OTHER LUBRICANT BASE OILS	To be supplied.	N	217
\.


--
-- Name: sample_inventory_row_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sample_inventory_row_id_seq', 217, true);


--
-- Data for Name: sequences; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sequences (id) FROM stdin;
\.


--
-- Data for Name: units; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY units (id, parent_id, updatedby, code, name, volumeof, updateddt, relatedunit) FROM stdin;
1	\N	1	DEFAULT	Default	\N	2015-10-16 16:34:09.829	\N
\.


--
-- Name: units_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('units_id_seq', 1, true);


--
-- Data for Name: userroles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY userroles (id, code, name, notes, registereddt, lastvisitdt) FROM stdin;
\.


--
-- Name: userroles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('userroles_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (user_id, login, password, role, firstname, lastname, email, phone, address1, address2, country, state, zip, city, sex, website, interests, birthday, organization, organaddress, photo, notes, registereddt, lastvisitdt, approved, admin, folder_location) FROM stdin;
4	test-id-3	test-id-3	1	test-id-3	test-id-3	1234@yahoo.com	9798451234	Whare are you?		United States	TX	77843	College Station	F	\N	\N	2000-06-20 00:00:00	TAMU	Whare are you?	\N		2016-06-17 13:48:20.156	2016-06-17 13:48:20.156	\N	\N	\N
1	admin	admin	0	admin	admin	admin@mail.box	+380000000000	Lviv	\N	Ukraine	Lviv	79000	Lviv	M	\N	\N	2015-10-16 16:34:09.374	\N	\N	\N	\N	2015-10-16 16:34:09.374	2015-10-16 16:34:09.374	Yes	YES	\N
2	test-id-1	test-id-1	1	test-id-1	test-id-1				\N					\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Y	\N	\N
3	test-id-2	test-id-2	1	test-id-2	test-id-2				\N					\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 4, true);


--
-- Name: columnheaders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY columnheaders
    ADD CONSTRAINT columnheaders_pkey PRIMARY KEY (id);


--
-- Name: columntypes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY columntypes
    ADD CONSTRAINT columntypes_pkey PRIMARY KEY (id);


--
-- Name: columntypestempl_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY columntypestempl
    ADD CONSTRAINT columntypestempl_pkey PRIMARY KEY (id);


--
-- Name: components_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY components
    ADD CONSTRAINT components_pkey PRIMARY KEY (id);


--
-- Name: fdc_pah_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fdc_pah
    ADD CONSTRAINT fdc_pah_pkey PRIMARY KEY (row_id);


--
-- Name: file_tracking_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY file_tracking
    ADD CONSTRAINT file_tracking_pkey PRIMARY KEY (row_id);


--
-- Name: fileupload_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fileupload
    ADD CONSTRAINT fileupload_pkey PRIMARY KEY (entity_id);


--
-- Name: id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY projectaccess
    ADD CONSTRAINT id_pkey PRIMARY KEY (id);


--
-- Name: importinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY importinfo
    ADD CONSTRAINT importinfo_pkey PRIMARY KEY (id);


--
-- Name: notes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY notes
    ADD CONSTRAINT notes_pkey PRIMARY KEY (id);


--
-- Name: orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: proj_access_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proj_access
    ADD CONSTRAINT proj_access_pkey PRIMARY KEY (row_id);


--
-- Name: projectmanagers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY projectmanagers
    ADD CONSTRAINT projectmanagers_pkey PRIMARY KEY (project_id, user_id);


--
-- Name: projectmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY projectmembers
    ADD CONSTRAINT projectmembers_pkey PRIMARY KEY (project_id, user_id);


--
-- Name: projectreviewers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY projectreviewers
    ADD CONSTRAINT projectreviewers_pkey PRIMARY KEY (project_id, user_id);


--
-- Name: projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (project_id);


--
-- Name: projecttypes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY projecttypes
    ADD CONSTRAINT projecttypes_pkey PRIMARY KEY (id);


--
-- Name: results_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY results
    ADD CONSTRAINT results_pkey PRIMARY KEY (id);


--
-- Name: resultshistory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY resultshistory
    ADD CONSTRAINT resultshistory_pkey PRIMARY KEY (id);


--
-- Name: rowheaders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rowheaders
    ADD CONSTRAINT rowheaders_pkey PRIMARY KEY (id);


--
-- Name: rowtypes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rowtypes
    ADD CONSTRAINT rowtypes_pkey PRIMARY KEY (id);


--
-- Name: rowtypestempl_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rowtypestempl
    ADD CONSTRAINT rowtypestempl_pkey PRIMARY KEY (id);


--
-- Name: sample_inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sample_inventory
    ADD CONSTRAINT sample_inventory_pkey PRIMARY KEY (row_id);


--
-- Name: sequences_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sequences
    ADD CONSTRAINT sequences_pkey PRIMARY KEY (id);


--
-- Name: uk_ow0gan20590jrb00upg3va2fn; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT uk_ow0gan20590jrb00upg3va2fn UNIQUE (login);


--
-- Name: units_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY units
    ADD CONSTRAINT units_pkey PRIMARY KEY (id);


--
-- Name: userroles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY userroles
    ADD CONSTRAINT userroles_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: components_project_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX components_project_id_idx ON components USING btree (project_id);


--
-- Name: orders_order_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orders_order_id_idx ON orders USING btree (order_id);


--
-- Name: results_component_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX results_component_id_idx ON results USING btree (component_id);


--
-- Name: results_order_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX results_order_id_idx ON results USING btree (order_id);


--
-- Name: results_project_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX results_project_id_idx ON results USING btree (project_id);


--
-- Name: fk_1owxhulxwlfb0at3udknjqma7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY importinfo
    ADD CONSTRAINT fk_1owxhulxwlfb0at3udknjqma7 FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- Name: fk_2xfgt35dutxlhmsmwu4r8rlr3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY units
    ADD CONSTRAINT fk_2xfgt35dutxlhmsmwu4r8rlr3 FOREIGN KEY (parent_id) REFERENCES units(id);


--
-- Name: fk_4n7egbvwjiliyv2qychp30h30; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY units
    ADD CONSTRAINT fk_4n7egbvwjiliyv2qychp30h30 FOREIGN KEY (updatedby) REFERENCES users(user_id);


--
-- Name: fk_578egghkkct6ade81pyv9cab8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rowtypestempl
    ADD CONSTRAINT fk_578egghkkct6ade81pyv9cab8 FOREIGN KEY (projecttype_id) REFERENCES projecttypes(id);


--
-- Name: fk_5hfmn0e6qs1wxmyicum7axk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY resultshistory
    ADD CONSTRAINT fk_5hfmn0e6qs1wxmyicum7axk0 FOREIGN KEY (results) REFERENCES results(id);


--
-- Name: fk_6b0me8cvhguaw471wopp7ep2q; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY columntypes
    ADD CONSTRAINT fk_6b0me8cvhguaw471wopp7ep2q FOREIGN KEY (project_id) REFERENCES projects(project_id);


--
-- Name: fk_75lysuh98e6heah650cirwjm0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY columntypestempl
    ADD CONSTRAINT fk_75lysuh98e6heah650cirwjm0 FOREIGN KEY (parent_id) REFERENCES columntypestempl(id);


--
-- Name: fk_7a51eicqw07bc07uieh4wwwiu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT fk_7a51eicqw07bc07uieh4wwwiu FOREIGN KEY (createdby) REFERENCES users(user_id);


--
-- Name: fk_7sgjwupi8nmfqjwia47uy0su7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY resultshistory
    ADD CONSTRAINT fk_7sgjwupi8nmfqjwia47uy0su7 FOREIGN KEY (updatedby) REFERENCES users(user_id);


--
-- Name: fk_9gk7ub0etop2uds2hq1p3sg05; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY columnheaders
    ADD CONSTRAINT fk_9gk7ub0etop2uds2hq1p3sg05 FOREIGN KEY (columntype_id) REFERENCES columntypes(id);


--
-- Name: fk_at6u7yapiqkonwaqfgls5jtke; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY components
    ADD CONSTRAINT fk_at6u7yapiqkonwaqfgls5jtke FOREIGN KEY (columnheader_id) REFERENCES columnheaders(id);


--
-- Name: fk_c80a31aic7l2gvbxlqkthjpy3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT fk_c80a31aic7l2gvbxlqkthjpy3 FOREIGN KEY (projecttype) REFERENCES projecttypes(id);


--
-- Name: fk_cv3vi79np764sg6aiyh6gbjpr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY results
    ADD CONSTRAINT fk_cv3vi79np764sg6aiyh6gbjpr FOREIGN KEY (project_id) REFERENCES projects(project_id);


--
-- Name: fk_d9lxlw8mxbtnrktp6owy5l9n6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY projectmembers
    ADD CONSTRAINT fk_d9lxlw8mxbtnrktp6owy5l9n6 FOREIGN KEY (project_id) REFERENCES projects(project_id);


--
-- Name: fk_grqkv3c957mesajp8cceqbg3d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY columnheaders
    ADD CONSTRAINT fk_grqkv3c957mesajp8cceqbg3d FOREIGN KEY (parent_id) REFERENCES columnheaders(id);


--
-- Name: fk_h5n3sxf6wbmcmldjbij337o33; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY projectmembers
    ADD CONSTRAINT fk_h5n3sxf6wbmcmldjbij337o33 FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- Name: fk_hks7nvoabgj2rtj4s8cu3xll1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY projectreviewers
    ADD CONSTRAINT fk_hks7nvoabgj2rtj4s8cu3xll1 FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- Name: fk_htrutpxms1q1w8yyx2kmwhsqj; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY projectmanagers
    ADD CONSTRAINT fk_htrutpxms1q1w8yyx2kmwhsqj FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- Name: fk_hwjwciqry9hxp1sgdx14gn6l9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY projectmanagers
    ADD CONSTRAINT fk_hwjwciqry9hxp1sgdx14gn6l9 FOREIGN KEY (project_id) REFERENCES projects(project_id);


--
-- Name: fk_i3gb9lxn5coali5g6b3eb7wxl; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY projectreviewers
    ADD CONSTRAINT fk_i3gb9lxn5coali5g6b3eb7wxl FOREIGN KEY (project_id) REFERENCES projects(project_id);


--
-- Name: fk_i4ykp6qlkcf71o4nbwp64mnck; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rowtypes
    ADD CONSTRAINT fk_i4ykp6qlkcf71o4nbwp64mnck FOREIGN KEY (project_id) REFERENCES projects(project_id);


--
-- Name: fk_jd1anxcj6doiu85xtqxkt2qyh; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY components
    ADD CONSTRAINT fk_jd1anxcj6doiu85xtqxkt2qyh FOREIGN KEY (unit) REFERENCES units(id);


--
-- Name: fk_kud02e2rv68l8dmcuq5yyddj0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY results
    ADD CONSTRAINT fk_kud02e2rv68l8dmcuq5yyddj0 FOREIGN KEY (component_id) REFERENCES components(id);


--
-- Name: fk_n8jusxt6ky8xkstx4jq9yk14v; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT fk_n8jusxt6ky8xkstx4jq9yk14v FOREIGN KEY (rowheader_id) REFERENCES rowheaders(id);


--
-- Name: fk_o9c01auhxnset9trxy38yol51; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT fk_o9c01auhxnset9trxy38yol51 FOREIGN KEY (lastmodifiedby) REFERENCES users(user_id);


--
-- Name: fk_p2x64i5pp8mq1lqwes12p8yfv; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY columntypes
    ADD CONSTRAINT fk_p2x64i5pp8mq1lqwes12p8yfv FOREIGN KEY (parent_id) REFERENCES columntypes(id);


--
-- Name: fk_q2nosuycg80g124cuj8vrthbf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rowheaders
    ADD CONSTRAINT fk_q2nosuycg80g124cuj8vrthbf FOREIGN KEY (rowtype_id) REFERENCES rowtypes(id);


--
-- Name: fk_qh329yxcm68is2byhok1kcx1h; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY components
    ADD CONSTRAINT fk_qh329yxcm68is2byhok1kcx1h FOREIGN KEY (project_id) REFERENCES projects(project_id);


--
-- Name: fk_sasvst3tpxcnbsv74hsh2ymmn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY units
    ADD CONSTRAINT fk_sasvst3tpxcnbsv74hsh2ymmn FOREIGN KEY (relatedunit) REFERENCES units(id);


--
-- Name: fk_shwiuxoeyuy0sj4ab42953fk3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY columntypestempl
    ADD CONSTRAINT fk_shwiuxoeyuy0sj4ab42953fk3 FOREIGN KEY (projecttype_id) REFERENCES projecttypes(id);


--
-- Name: fk_sqj53vx8qowq3mj3e1bov7m5l; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY results
    ADD CONSTRAINT fk_sqj53vx8qowq3mj3e1bov7m5l FOREIGN KEY (updatedby) REFERENCES users(user_id);


--
-- Name: fk_sv4u816rj7w6rc134b6yjj4dn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY notes
    ADD CONSTRAINT fk_sv4u816rj7w6rc134b6yjj4dn FOREIGN KEY (updatedby) REFERENCES users(user_id);


--
-- Name: fk_tqkk4o8b9y1lob46a7ma1sllf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY components
    ADD CONSTRAINT fk_tqkk4o8b9y1lob46a7ma1sllf FOREIGN KEY (updatedby) REFERENCES users(user_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--


-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

-- Started on 2026-05-20 15:28:57

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 219 (class 1259 OID 24577)
-- Name: abwesenheit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.abwesenheit (
    id bigint NOT NULL,
    aktiv boolean NOT NULL,
    bemerkung character varying(255),
    bis date NOT NULL,
    grund character varying(255),
    von date NOT NULL,
    lehrkraft_id bigint NOT NULL,
    CONSTRAINT abwesenheit_grund_check CHECK (((grund)::text = ANY (ARRAY[('KRANK'::character varying)::text, ('FORTBILDUNG'::character varying)::text, ('EXKURSION'::character varying)::text, ('SONSTIGES'::character varying)::text])))
);



--
-- TOC entry 220 (class 1259 OID 24588)
-- Name: abwesenheit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.abwesenheit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- TOC entry 5202 (class 0 OID 0)
-- Dependencies: 220
-- Name: abwesenheit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.abwesenheit_id_seq OWNED BY public.abwesenheit.id;


--
-- TOC entry 221 (class 1259 OID 24589)
-- Name: admin_benutzer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_benutzer (
    id bigint NOT NULL
);



--
-- TOC entry 222 (class 1259 OID 24593)
-- Name: benutzer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.benutzer (
    id bigint NOT NULL,
    aktiv boolean NOT NULL,
    benutzername character varying(255) NOT NULL,
    passworthash character varying(255) NOT NULL,
    rolle character varying(255) NOT NULL,
    CONSTRAINT benutzer_rolle_check CHECK (((rolle)::text = ANY (ARRAY[('ADMINISTRATOR'::character varying)::text, ('LEHRER'::character varying)::text, ('SCHUELER'::character varying)::text])))
);



--
-- TOC entry 223 (class 1259 OID 24604)
-- Name: benutzer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.benutzer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- TOC entry 5203 (class 0 OID 0)
-- Dependencies: 223
-- Name: benutzer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.benutzer_id_seq OWNED BY public.benutzer.id;


--
-- TOC entry 224 (class 1259 OID 24605)
-- Name: erziehungsberechtigter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.erziehungsberechtigter (
    id bigint NOT NULL,
    adresse character varying(255),
    beziehung character varying(255) NOT NULL,
    email character varying(255),
    nachname character varying(255) NOT NULL,
    telefon character varying(255),
    vorname character varying(255) NOT NULL,
    schueler_id bigint NOT NULL,
    CONSTRAINT erziehungsberechtigter_beziehung_check CHECK (((beziehung)::text = ANY (ARRAY[('MUTTER'::character varying)::text, ('VATER'::character varying)::text, ('VORMUND'::character varying)::text, ('SONSTIGE'::character varying)::text])))
);



--
-- TOC entry 225 (class 1259 OID 24616)
-- Name: erziehungsberechtigter_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.erziehungsberechtigter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- TOC entry 5204 (class 0 OID 0)
-- Dependencies: 225
-- Name: erziehungsberechtigter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.erziehungsberechtigter_id_seq OWNED BY public.erziehungsberechtigter.id;


--
-- TOC entry 226 (class 1259 OID 24617)
-- Name: fach; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fach (
    id bigint NOT NULL,
    bezeichnung character varying(255),
    kuerzel character varying(255),
    wochenstundenproklasse integer NOT NULL
);



--
-- TOC entry 227 (class 1259 OID 24624)
-- Name: fach_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fach_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- TOC entry 5205 (class 0 OID 0)
-- Dependencies: 227
-- Name: fach_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fach_id_seq OWNED BY public.fach.id;


--
-- TOC entry 228 (class 1259 OID 24625)
-- Name: klasse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.klasse (
    id bigint NOT NULL,
    bezeichnung character varying(255),
    jahrgangsstufe integer NOT NULL,
    schueleranzahl integer NOT NULL,
    lehrkraft_id bigint
);



--
-- TOC entry 229 (class 1259 OID 24631)
-- Name: klasse_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.klasse_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- TOC entry 5206 (class 0 OID 0)
-- Dependencies: 229
-- Name: klasse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.klasse_id_seq OWNED BY public.klasse.id;


--
-- TOC entry 230 (class 1259 OID 24632)
-- Name: lehrer_benutzer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lehrer_benutzer (
    id bigint NOT NULL,
    lehrkraft_id bigint NOT NULL
);



--
-- TOC entry 231 (class 1259 OID 24637)
-- Name: lehrkraft; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lehrkraft (
    id bigint NOT NULL,
    kuerzel character varying(255),
    name character varying(255),
    sollstunden integer NOT NULL,
    sperrzeiten text
);



--
-- TOC entry 232 (class 1259 OID 24644)
-- Name: lehrkraft_fach; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lehrkraft_fach (
    lehrkraft_id bigint NOT NULL,
    fach_id bigint NOT NULL
);



--
-- TOC entry 233 (class 1259 OID 24649)
-- Name: lehrkraft_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lehrkraft_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- TOC entry 5207 (class 0 OID 0)
-- Dependencies: 233
-- Name: lehrkraft_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lehrkraft_id_seq OWNED BY public.lehrkraft.id;


--
-- TOC entry 234 (class 1259 OID 24650)
-- Name: raum; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.raum (
    id bigint NOT NULL,
    bezeichnung character varying(255),
    kapazitaet integer NOT NULL,
    raumtyp character varying(255),
    CONSTRAINT raum_raumtyp_check CHECK (((raumtyp)::text = ANY (ARRAY[('STANDARD'::character varying)::text, ('FACHRAUM_CHEMIE'::character varying)::text, ('MUSIK'::character varying)::text, ('SPORTHALLE'::character varying)::text, ('INFORMATIK'::character varying)::text])))
);



--
-- TOC entry 235 (class 1259 OID 24658)
-- Name: raum_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.raum_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- TOC entry 5208 (class 0 OID 0)
-- Dependencies: 235
-- Name: raum_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.raum_id_seq OWNED BY public.raum.id;


--
-- TOC entry 236 (class 1259 OID 24659)
-- Name: schueler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schueler (
    id bigint NOT NULL,
    geburtsdatum date,
    nachname character varying(255) NOT NULL,
    status character varying(255),
    vorname character varying(255) NOT NULL,
    klasse_id bigint NOT NULL,
    CONSTRAINT schueler_status_check CHECK (((status)::text = ANY (ARRAY[('AKTIV'::character varying)::text, ('ABGEGANGEN'::character varying)::text])))
);



--
-- TOC entry 237 (class 1259 OID 24669)
-- Name: schueler_benutzer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schueler_benutzer (
    id bigint NOT NULL,
    klasse_id bigint NOT NULL
);



--
-- TOC entry 238 (class 1259 OID 24674)
-- Name: schueler_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.schueler_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- TOC entry 5209 (class 0 OID 0)
-- Dependencies: 238
-- Name: schueler_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.schueler_id_seq OWNED BY public.schueler.id;


--
-- TOC entry 239 (class 1259 OID 24675)
-- Name: schuljahr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schuljahr (
    id bigint NOT NULL,
    bezeichnung character varying(255),
    end_datum date,
    istaktiv boolean NOT NULL,
    start_datum date
);



--
-- TOC entry 240 (class 1259 OID 24680)
-- Name: schuljahr_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.schuljahr_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- TOC entry 5210 (class 0 OID 0)
-- Dependencies: 240
-- Name: schuljahr_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.schuljahr_id_seq OWNED BY public.schuljahr.id;


--
-- TOC entry 241 (class 1259 OID 24681)
-- Name: sperrzeit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sperrzeit (
    id bigint NOT NULL,
    lehrkraft_id bigint NOT NULL,
    zeitslot_id bigint NOT NULL
);



--
-- TOC entry 242 (class 1259 OID 24687)
-- Name: sperrzeit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sperrzeit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- TOC entry 5211 (class 0 OID 0)
-- Dependencies: 242
-- Name: sperrzeit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sperrzeit_id_seq OWNED BY public.sperrzeit.id;


--
-- TOC entry 243 (class 1259 OID 24688)
-- Name: stunde; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stunde (
    id bigint NOT NULL,
    geaendert boolean NOT NULL,
    istausfall boolean NOT NULL,
    istvertretung boolean NOT NULL,
    fach_id bigint,
    klasse_id bigint,
    lehrkraft_id bigint,
    raum_id bigint,
    stundenplan_id bigint,
    zeitslot_id bigint
);



--
-- TOC entry 244 (class 1259 OID 24695)
-- Name: stunde_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stunde_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- TOC entry 5212 (class 0 OID 0)
-- Dependencies: 244
-- Name: stunde_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stunde_id_seq OWNED BY public.stunde.id;


--
-- TOC entry 245 (class 1259 OID 24696)
-- Name: stundenplan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stundenplan (
    id bigint NOT NULL,
    gueltigab date,
    schuljahr_id bigint NOT NULL
);



--
-- TOC entry 246 (class 1259 OID 24701)
-- Name: stundenplan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stundenplan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- TOC entry 5213 (class 0 OID 0)
-- Dependencies: 246
-- Name: stundenplan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stundenplan_id_seq OWNED BY public.stundenplan.id;


--
-- TOC entry 247 (class 1259 OID 24702)
-- Name: vertretung; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vertretung (
    id bigint NOT NULL,
    bemerkung character varying(255),
    datum date NOT NULL,
    grund character varying(255),
    stunde_id bigint NOT NULL,
    vertretungslehrer_id bigint,
    CONSTRAINT vertretung_grund_check CHECK (((grund)::text = ANY (ARRAY[('KRANK'::character varying)::text, ('FORTBILDUNG'::character varying)::text, ('EXKURSION'::character varying)::text, ('SONSTIGES'::character varying)::text])))
);



--
-- TOC entry 248 (class 1259 OID 24711)
-- Name: vertretung_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vertretung_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- TOC entry 5214 (class 0 OID 0)
-- Dependencies: 248
-- Name: vertretung_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vertretung_id_seq OWNED BY public.vertretung.id;


--
-- TOC entry 249 (class 1259 OID 24712)
-- Name: zeitslot; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.zeitslot (
    id bigint NOT NULL,
    endzeit time(6) without time zone,
    startzeit time(6) without time zone,
    stundennummer integer NOT NULL,
    wochentag character varying(255),
    CONSTRAINT zeitslot_wochentag_check CHECK (((wochentag)::text = ANY (ARRAY[('MONTAG'::character varying)::text, ('DIENSTAG'::character varying)::text, ('MITTWOCH'::character varying)::text, ('DONNERSTAG'::character varying)::text, ('FREITAG'::character varying)::text])))
);



--
-- TOC entry 250 (class 1259 OID 24718)
-- Name: zeitslot_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.zeitslot_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- TOC entry 5215 (class 0 OID 0)
-- Dependencies: 250
-- Name: zeitslot_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.zeitslot_id_seq OWNED BY public.zeitslot.id;


--
-- TOC entry 4937 (class 2604 OID 24719)
-- Name: abwesenheit id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.abwesenheit ALTER COLUMN id SET DEFAULT nextval('public.abwesenheit_id_seq'::regclass);


--
-- TOC entry 4938 (class 2604 OID 24720)
-- Name: benutzer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.benutzer ALTER COLUMN id SET DEFAULT nextval('public.benutzer_id_seq'::regclass);


--
-- TOC entry 4939 (class 2604 OID 24721)
-- Name: erziehungsberechtigter id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.erziehungsberechtigter ALTER COLUMN id SET DEFAULT nextval('public.erziehungsberechtigter_id_seq'::regclass);


--
-- TOC entry 4940 (class 2604 OID 24722)
-- Name: fach id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fach ALTER COLUMN id SET DEFAULT nextval('public.fach_id_seq'::regclass);


--
-- TOC entry 4941 (class 2604 OID 24723)
-- Name: klasse id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.klasse ALTER COLUMN id SET DEFAULT nextval('public.klasse_id_seq'::regclass);


--
-- TOC entry 4942 (class 2604 OID 24724)
-- Name: lehrkraft id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lehrkraft ALTER COLUMN id SET DEFAULT nextval('public.lehrkraft_id_seq'::regclass);


--
-- TOC entry 4943 (class 2604 OID 24725)
-- Name: raum id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.raum ALTER COLUMN id SET DEFAULT nextval('public.raum_id_seq'::regclass);


--
-- TOC entry 4944 (class 2604 OID 24726)
-- Name: schueler id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schueler ALTER COLUMN id SET DEFAULT nextval('public.schueler_id_seq'::regclass);


--
-- TOC entry 4945 (class 2604 OID 24727)
-- Name: schuljahr id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schuljahr ALTER COLUMN id SET DEFAULT nextval('public.schuljahr_id_seq'::regclass);


--
-- TOC entry 4946 (class 2604 OID 24728)
-- Name: sperrzeit id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sperrzeit ALTER COLUMN id SET DEFAULT nextval('public.sperrzeit_id_seq'::regclass);


--
-- TOC entry 4947 (class 2604 OID 24729)
-- Name: stunde id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stunde ALTER COLUMN id SET DEFAULT nextval('public.stunde_id_seq'::regclass);


--
-- TOC entry 4948 (class 2604 OID 24730)
-- Name: stundenplan id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stundenplan ALTER COLUMN id SET DEFAULT nextval('public.stundenplan_id_seq'::regclass);


--
-- TOC entry 4949 (class 2604 OID 24731)
-- Name: vertretung id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vertretung ALTER COLUMN id SET DEFAULT nextval('public.vertretung_id_seq'::regclass);


--
-- TOC entry 4950 (class 2604 OID 24732)
-- Name: zeitslot id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zeitslot ALTER COLUMN id SET DEFAULT nextval('public.zeitslot_id_seq'::regclass);


--
-- TOC entry 5165 (class 0 OID 24577)
-- Dependencies: 219
-- Data for Name: abwesenheit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.abwesenheit (id, aktiv, bemerkung, bis, grund, von, lehrkraft_id) FROM stdin;
31	t		2026-05-09	KRANK	2026-05-07	12
\.


--
-- TOC entry 5167 (class 0 OID 24589)
-- Dependencies: 221
-- Data for Name: admin_benutzer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_benutzer (id) FROM stdin;
1
\.


--
-- TOC entry 5168 (class 0 OID 24593)
-- Dependencies: 222
-- Data for Name: benutzer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.benutzer (id, aktiv, benutzername, passworthash, rolle) FROM stdin;
1	t	admin	240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9	ADMINISTRATOR
35	t	ba	c8b470463d8d14419589a948adac62a0cbf92178dc74f09eae954cf7e34de7ae	LEHRER
36	t	kl	c8b470463d8d14419589a948adac62a0cbf92178dc74f09eae954cf7e34de7ae	LEHRER
37	t	ah	c8b470463d8d14419589a948adac62a0cbf92178dc74f09eae954cf7e34de7ae	LEHRER
38	t	sch	c8b470463d8d14419589a948adac62a0cbf92178dc74f09eae954cf7e34de7ae	LEHRER
39	t	schi	c8b470463d8d14419589a948adac62a0cbf92178dc74f09eae954cf7e34de7ae	LEHRER
40	t	krz	c8b470463d8d14419589a948adac62a0cbf92178dc74f09eae954cf7e34de7ae	LEHRER
41	t	zy	c8b470463d8d14419589a948adac62a0cbf92178dc74f09eae954cf7e34de7ae	LEHRER
42	t	fa	c8b470463d8d14419589a948adac62a0cbf92178dc74f09eae954cf7e34de7ae	LEHRER
43	t	ho	c8b470463d8d14419589a948adac62a0cbf92178dc74f09eae954cf7e34de7ae	LEHRER
44	t	le	c8b470463d8d14419589a948adac62a0cbf92178dc74f09eae954cf7e34de7ae	LEHRER
45	t	sf	c8b470463d8d14419589a948adac62a0cbf92178dc74f09eae954cf7e34de7ae	LEHRER
46	t	ju	c8b470463d8d14419589a948adac62a0cbf92178dc74f09eae954cf7e34de7ae	LEHRER
47	t	bu	c8b470463d8d14419589a948adac62a0cbf92178dc74f09eae954cf7e34de7ae	LEHRER
48	t	br	c8b470463d8d14419589a948adac62a0cbf92178dc74f09eae954cf7e34de7ae	LEHRER
49	t	ko	c8b470463d8d14419589a948adac62a0cbf92178dc74f09eae954cf7e34de7ae	LEHRER
50	t	vo	c8b470463d8d14419589a948adac62a0cbf92178dc74f09eae954cf7e34de7ae	LEHRER
51	t	hö	c8b470463d8d14419589a948adac62a0cbf92178dc74f09eae954cf7e34de7ae	LEHRER
52	t	me	c8b470463d8d14419589a948adac62a0cbf92178dc74f09eae954cf7e34de7ae	LEHRER
53	t	re	c8b470463d8d14419589a948adac62a0cbf92178dc74f09eae954cf7e34de7ae	LEHRER
54	t	5b	8d198e4a7ec9af1114ddb11a75891593db474823ffc283e55710c79d26126d36	SCHUELER
55	t	6a	8d198e4a7ec9af1114ddb11a75891593db474823ffc283e55710c79d26126d36	SCHUELER
56	t	5a	8d198e4a7ec9af1114ddb11a75891593db474823ffc283e55710c79d26126d36	SCHUELER
57	t	6b	8d198e4a7ec9af1114ddb11a75891593db474823ffc283e55710c79d26126d36	SCHUELER
58	t	7a	8d198e4a7ec9af1114ddb11a75891593db474823ffc283e55710c79d26126d36	SCHUELER
59	t	7b	8d198e4a7ec9af1114ddb11a75891593db474823ffc283e55710c79d26126d36	SCHUELER
60	t	8a	8d198e4a7ec9af1114ddb11a75891593db474823ffc283e55710c79d26126d36	SCHUELER
61	t	10a	8d198e4a7ec9af1114ddb11a75891593db474823ffc283e55710c79d26126d36	SCHUELER
62	t	8b	8d198e4a7ec9af1114ddb11a75891593db474823ffc283e55710c79d26126d36	SCHUELER
63	t	10b	8d198e4a7ec9af1114ddb11a75891593db474823ffc283e55710c79d26126d36	SCHUELER
64	t	9a	8d198e4a7ec9af1114ddb11a75891593db474823ffc283e55710c79d26126d36	SCHUELER
65	t	9b	8d198e4a7ec9af1114ddb11a75891593db474823ffc283e55710c79d26126d36	SCHUELER
\.


--
-- TOC entry 5170 (class 0 OID 24605)
-- Dependencies: 224
-- Data for Name: erziehungsberechtigter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.erziehungsberechtigter (id, adresse, beziehung, email, nachname, telefon, vorname, schueler_id) FROM stdin;
2	Rehwinkel 21 58640	VATER	reda3426@gmail.com	Hamoud	017672766838	Ismail	7
3	1Straße 12	VATER	lukemax@gmail.com	Mix	01234567	Luke	3
4	viertelstraße 12	MUTTER	andreas@gmail.com	Pio	043435421321	Andreas	8
5	An der Amadeus 19 58638 Iserlohn	VATER	dopfn@fnearnings.de	Pitrowski	017672788367	Vladimir	5
6	altstraße 1	MUTTER	lisa@gmail.com	Schmatz	017456854	Lisa	7
7	An der Amadeus 18 58638 Iserlohn	MUTTER	schlüter_azubi_daniel_s@systems.de	Reisch	017672789569	Natasha	5
\.


--
-- TOC entry 5172 (class 0 OID 24617)
-- Dependencies: 226
-- Data for Name: fach; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fach (id, bezeichnung, kuerzel, wochenstundenproklasse) FROM stdin;
1	Mathematik	Ma	4
2	Sport	Sp	2
3	Deutsch	De	4
4	Englisch	En	4
5	Biologie	Bio	2
6	Geschichte	Ge	2
7	Politik	Po	2
9	Chemie	Ch	2
10	Religion	Re	2
11	Erdkunde	Ek	2
8	Musik	Mu	2
27	TestFach	Tf	2
\.


--
-- TOC entry 5174 (class 0 OID 24625)
-- Dependencies: 228
-- Data for Name: klasse; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.klasse (id, bezeichnung, jahrgangsstufe, schueleranzahl, lehrkraft_id) FROM stdin;
1	5b	5	0	5
2	6a	6	0	6
3	5a	5	0	4
4	6b	6	0	7
5	7a	7	0	10
6	7b	7	0	12
7	8a	8	0	8
8	10a	10	0	11
9	8b	8	0	9
10	10b	10	0	23
11	9a	9	0	24
12	9b	9	0	25
18	TestKlasse	10	0	30
\.


--
-- TOC entry 5176 (class 0 OID 24632)
-- Dependencies: 230
-- Data for Name: lehrer_benutzer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lehrer_benutzer (id, lehrkraft_id) FROM stdin;
35	8
36	6
37	4
38	9
39	24
40	12
41	25
42	7
43	18
44	11
45	19
46	17
47	5
48	22
49	21
50	10
51	16
52	20
53	23
\.


--
-- TOC entry 5177 (class 0 OID 24637)
-- Dependencies: 231
-- Data for Name: lehrkraft; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lehrkraft (id, kuerzel, name, sollstunden, sperrzeiten) FROM stdin;
5	Bu	Butz	20	\N
10	Vo	Van-Ool	20	\N
12	Krz	Kryzaniak	20	\N
16	Hö	Hollander-Hörnig	20	\N
7	Fa	Fabian	20	\N
17	Ju	Jung	20	\N
18	Ho	Hoffmann	20	\N
20	Me	Metzler	20	\N
22	Br	Bauer	20	\N
23	Re	Reckermann	20	\N
24	Schi	Schick	20	\N
25	Zy	Zyber-Kämpf	20	\N
8	Ba	Bachorz	25	\N
6	Kl	Kleine	25	\N
4	Ah	Ahlert	25	\N
11	Le	Leschke	25	\N
19	Sf	Schäfer	16	\N
21	Ko	Koch	12	\N
9	Sch	Schwarz	20	\N
30	tl	testlehrer	2	\N
\.


--
-- TOC entry 5178 (class 0 OID 24644)
-- Dependencies: 232
-- Data for Name: lehrkraft_fach; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lehrkraft_fach (lehrkraft_id, fach_id) FROM stdin;
10	5
10	8
5	3
5	6
23	3
23	7
16	5
16	2
7	11
7	1
17	11
17	4
18	1
18	2
20	11
20	4
22	1
22	4
25	10
25	3
24	10
24	4
8	4
8	6
6	1
6	9
4	5
4	1
4	2
11	2
11	8
11	9
19	11
19	9
21	10
21	7
9	3
9	7
30	1
30	27
30	4
30	2
12	3
12	1
12	27
\.


--
-- TOC entry 5180 (class 0 OID 24650)
-- Dependencies: 234
-- Data for Name: raum; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.raum (id, bezeichnung, kapazitaet, raumtyp) FROM stdin;
5	R101	30	STANDARD
6	R102	25	STANDARD
7	R103	20	STANDARD
8	R104	20	STANDARD
9	R105	30	STANDARD
10	R106	25	STANDARD
14	R107	25	STANDARD
15	R108	30	STANDARD
16	R109	35	STANDARD
17	R110	20	STANDARD
11	Musik Raum 1	33	MUSIK
12	Sporthalle 1	30	SPORTHALLE
13	Bio-Raum 1	25	STANDARD
19	Sporthalle 2	30	SPORTHALLE
20	Bio-Raum 2	30	STANDARD
18	Chemie-Raum 1	30	FACHRAUM_CHEMIE
21	Chemie-Raum 2	30	FACHRAUM_CHEMIE
22	Musik Raum 2	30	MUSIK
23	R111	30	STANDARD
24	R112	30	STANDARD
30	TestRaum	26	STANDARD
\.


--
-- TOC entry 5182 (class 0 OID 24659)
-- Dependencies: 236
-- Data for Name: schueler; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schueler (id, geburtsdatum, nachname, status, vorname, klasse_id) FROM stdin;
3	2010-05-14	Mix	AKTIV	Max	1
4	2002-12-02	Iuliano	AKTIV	Mario	7
6	2011-05-04	Ogulev	AKTIV	Karl	2
8	2009-05-14	Pio	AKTIV	Kevin	6
7	2005-09-03	Ogulev	AKTIV	Dmitrji	10
5	2004-03-10	Reisch	AKTIV	Daniel	11
\.


--
-- TOC entry 5183 (class 0 OID 24669)
-- Dependencies: 237
-- Data for Name: schueler_benutzer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schueler_benutzer (id, klasse_id) FROM stdin;
54	1
55	2
56	3
57	4
58	5
59	6
60	7
61	8
62	9
63	10
64	11
65	12
\.


--
-- TOC entry 5185 (class 0 OID 24675)
-- Dependencies: 239
-- Data for Name: schuljahr; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schuljahr (id, bezeichnung, end_datum, istaktiv, start_datum) FROM stdin;
1	2025/2026	2026-07-31	t	2025-08-01
\.


--
-- TOC entry 5187 (class 0 OID 24681)
-- Dependencies: 241
-- Data for Name: sperrzeit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sperrzeit (id, lehrkraft_id, zeitslot_id) FROM stdin;
14	30	1
15	30	2
\.


--
-- TOC entry 5189 (class 0 OID 24688)
-- Dependencies: 243
-- Data for Name: stunde; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stunde (id, geaendert, istausfall, istvertretung, fach_id, klasse_id, lehrkraft_id, raum_id, stundenplan_id, zeitslot_id) FROM stdin;
366	f	f	f	1	8	6	8	2	11
367	f	f	f	7	8	23	17	2	29
216	f	f	f	3	7	9	14	2	22
218	f	f	f	1	7	6	14	2	24
337	f	f	f	10	8	24	23	2	24
338	f	f	f	1	8	4	23	2	25
339	f	f	f	1	8	4	23	2	26
340	f	f	f	1	8	4	23	2	27
36	f	f	f	1	3	4	5	2	11
37	f	f	f	1	3	4	5	2	12
40	f	f	f	6	3	5	5	2	15
41	f	f	f	6	3	5	5	2	16
42	f	f	f	7	3	9	5	2	17
47	f	f	f	10	3	25	5	2	22
48	f	f	f	9	3	6	18	2	25
49	f	f	f	9	3	6	18	2	26
50	f	f	f	4	3	17	5	2	27
51	f	f	f	4	3	17	5	2	28
308	f	f	f	6	12	8	17	2	23
309	f	f	f	6	12	8	17	2	24
52	f	f	f	11	3	19	5	2	29
53	f	f	f	11	3	19	5	2	30
54	f	f	f	2	1	11	19	2	1
55	f	f	f	2	1	11	19	2	2
56	f	f	f	3	1	5	6	2	3
57	f	f	f	3	1	5	6	2	4
58	f	f	f	1	1	7	6	2	5
59	f	f	f	1	1	7	6	2	6
60	f	f	f	6	1	8	6	2	7
62	f	f	f	8	1	11	22	2	9
251	f	f	f	1	9	7	15	2	22
63	f	f	f	8	1	11	22	2	10
64	f	f	f	4	1	8	6	2	11
65	f	f	f	4	1	8	6	2	12
66	f	f	f	5	1	4	20	2	13
67	f	f	f	5	1	4	20	2	14
133	f	f	f	4	4	20	8	2	24
134	f	f	f	9	4	6	21	2	27
135	f	f	f	9	4	6	21	2	28
136	f	f	f	7	4	9	8	2	29
137	f	f	f	7	4	9	8	2	30
138	f	f	f	4	5	24	9	2	1
140	f	f	f	4	5	24	9	2	2
142	f	f	f	9	7	19	18	2	2
144	f	f	f	3	5	12	9	2	4
147	f	f	f	8	5	11	11	2	7
148	f	f	f	1	7	6	14	2	3
149	f	f	f	8	5	11	11	2	8
150	f	f	f	1	7	6	14	2	4
151	f	f	f	1	5	4	9	2	9
152	f	f	f	1	5	4	9	2	10
146	f	f	f	2	5	16	12	2	6
145	f	f	f	2	5	16	12	2	5
39	f	f	f	5	3	16	13	2	14
38	f	f	f	5	3	16	13	2	13
269	f	f	f	2	11	16	12	2	10
214	f	f	f	5	7	16	14	2	20
112	f	f	f	2	4	16	19	2	3
97	f	f	f	5	2	16	13	2	16
96	f	f	f	5	2	16	13	2	15
158	f	f	f	5	5	10	13	2	17
35	f	f	f	8	3	10	11	2	10
153	f	f	f	6	5	5	9	2	11
154	f	f	f	6	5	5	9	2	12
156	f	f	f	3	7	9	14	2	5
159	f	f	f	3	7	9	14	2	6
286	f	f	f	10	11	24	16	2	11
287	f	f	f	10	11	24	16	2	12
288	f	f	f	4	12	8	17	2	1
289	f	f	f	4	12	8	17	2	2
290	f	f	f	9	12	19	21	2	5
291	f	f	f	9	12	19	21	2	6
292	f	f	f	1	12	12	17	2	9
293	f	f	f	1	12	12	17	2	10
296	f	f	f	3	12	25	17	2	11
327	f	f	f	3	8	9	23	2	14
328	f	f	f	11	8	17	23	2	15
329	f	f	f	11	8	17	23	2	16
331	f	f	f	4	8	17	23	2	19
333	f	f	f	4	8	17	23	2	20
334	f	f	f	9	8	6	18	2	21
335	f	f	f	9	8	6	18	2	22
336	f	f	f	10	8	24	23	2	23
104	f	f	f	11	2	20	7	2	25
350	f	f	f	1	10	7	23	2	9
44	f	f	t	3	3	12	5	2	19
217	t	f	f	1	7	6	14	2	23
351	f	f	f	1	10	7	24	2	10
352	f	f	f	2	10	18	19	2	11
353	f	f	f	2	10	18	19	2	12
356	f	f	f	6	10	8	24	2	15
357	f	f	f	6	10	8	24	2	16
358	f	f	f	11	10	20	24	2	17
359	f	f	f	11	10	20	24	2	18
360	f	f	f	4	10	22	24	2	19
361	f	f	f	4	10	22	24	2	20
362	f	f	f	3	10	23	24	2	21
363	f	f	f	3	10	23	24	2	22
364	f	f	f	1	10	7	24	2	25
365	f	f	f	1	10	7	24	2	26
354	f	f	f	8	10	10	11	2	13
355	f	f	f	8	10	10	11	2	14
341	f	f	f	7	8	9	23	2	28
342	f	f	f	7	10	23	24	2	1
343	f	f	f	7	10	23	24	2	2
76	f	f	f	11	1	17	6	2	23
77	f	f	f	11	1	17	6	2	24
78	f	f	f	9	1	19	21	2	25
29	f	f	f	1	3	4	5	2	3
30	f	f	f	1	3	4	5	2	4
32	f	f	f	3	3	12	5	2	6
344	f	f	f	4	10	22	24	2	3
345	f	f	f	4	10	22	24	2	4
346	f	f	f	3	10	23	24	2	5
347	f	f	f	3	10	23	24	2	6
348	f	f	f	9	10	19	18	2	7
349	f	f	f	9	10	19	18	2	8
125	f	f	f	5	4	10	20	2	16
185	f	f	f	8	6	10	22	2	8
184	f	f	f	8	6	10	22	2	7
248	f	f	f	5	9	10	20	2	20
249	f	f	f	5	9	10	20	2	19
253	f	f	f	1	9	7	15	2	16
254	f	f	f	3	9	23	15	2	23
255	f	f	f	3	9	23	15	2	24
93	f	f	f	8	2	10	11	2	12
202	f	f	f	3	6	5	10	2	22
203	f	f	f	4	6	8	10	2	25
204	f	f	f	4	6	8	10	2	26
69	f	f	f	7	1	21	6	2	16
70	f	f	f	3	1	5	6	2	17
71	f	f	f	3	1	5	6	2	18
79	f	f	f	9	1	19	21	2	26
80	f	f	f	10	1	24	6	2	29
81	f	f	f	10	1	24	6	2	30
275	f	f	f	8	11	11	11	2	20
276	f	f	f	4	11	24	16	2	17
277	f	f	f	4	11	24	16	2	18
278	f	f	f	6	11	5	16	2	25
279	f	f	f	6	11	5	16	2	26
280	f	f	f	5	11	4	13	2	21
281	f	f	f	5	11	4	13	2	22
284	f	f	f	11	11	20	16	2	27
271	f	f	f	7	11	21	16	2	14
272	f	f	f	1	11	18	16	2	15
273	f	f	f	1	11	18	16	2	16
274	f	f	f	8	11	11	11	2	19
124	f	f	f	5	4	10	20	2	15
160	f	f	f	5	5	10	13	2	18
89	f	f	f	3	2	25	7	2	8
90	f	f	f	1	2	6	7	2	9
91	f	f	f	1	2	6	7	2	10
94	f	f	f	6	2	5	7	2	13
95	f	f	f	6	2	5	7	2	14
98	f	f	f	4	2	22	7	2	17
99	f	f	f	4	2	22	7	2	18
100	f	f	f	7	2	23	7	2	19
219	f	f	f	11	7	17	14	2	25
28	f	f	f	4	3	17	5	2	7
33	f	f	f	4	3	17	5	2	8
43	f	f	f	7	3	9	5	2	18
46	f	f	f	10	3	25	5	2	21
19	f	f	f	2	3	16	12	2	2
113	f	f	f	2	4	16	19	2	4
268	f	f	f	2	11	16	12	2	9
306	f	f	f	5	12	10	20	2	21
307	f	f	f	5	12	10	20	2	22
92	f	f	f	8	2	10	11	2	11
34	f	f	f	8	3	10	11	2	9
82	f	f	f	1	2	6	7	2	1
83	f	f	f	1	2	6	7	2	2
84	f	f	f	2	2	18	12	2	3
261	f	f	f	1	11	18	16	2	2
282	f	t	f	3	11	12	16	2	23
262	f	f	f	4	11	24	16	2	3
263	f	f	f	4	11	24	16	2	4
264	f	f	f	9	11	6	18	2	5
265	f	f	f	9	11	6	18	2	6
270	f	f	f	7	11	21	16	2	13
101	f	f	f	7	2	23	7	2	20
102	f	f	f	3	2	25	7	2	23
73	f	f	f	1	1	7	6	2	20
74	f	f	f	4	1	8	6	2	21
75	f	f	f	4	1	8	6	2	22
72	f	f	f	1	1	7	6	2	19
103	f	f	f	3	2	25	7	2	24
213	f	f	f	5	7	16	13	2	19
105	f	f	f	11	2	20	7	2	26
106	f	f	f	9	2	19	18	2	27
107	f	f	f	9	2	19	18	2	28
108	f	f	f	10	2	21	7	2	29
109	f	f	f	10	2	21	7	2	30
110	f	f	f	3	4	9	8	2	1
111	f	f	f	3	4	9	8	2	2
114	f	f	f	1	4	18	8	2	5
115	f	f	f	1	4	18	8	2	6
116	f	f	f	4	4	20	8	2	7
117	f	f	f	4	4	20	8	2	8
118	f	f	f	3	4	9	8	2	9
119	f	f	f	3	4	9	8	2	10
120	f	f	f	8	4	11	22	2	11
121	f	f	f	8	4	11	22	2	12
122	f	f	f	10	4	25	8	2	13
123	f	f	f	10	4	25	8	2	14
126	f	f	f	1	4	7	8	2	17
127	f	f	f	1	4	7	8	2	18
128	f	f	f	6	4	8	8	2	19
129	f	f	f	6	4	8	8	2	20
130	f	f	f	11	4	19	8	2	21
131	f	f	f	11	4	19	8	2	22
161	f	f	f	1	5	4	9	2	19
162	f	f	f	1	5	4	9	2	20
163	f	f	f	7	5	21	9	2	21
164	f	f	f	7	5	21	9	2	22
31	f	f	f	3	3	12	5	2	5
165	f	f	f	11	5	7	9	2	23
166	f	f	f	11	5	7	9	2	24
167	f	f	f	2	7	4	12	2	7
168	f	f	f	10	5	25	9	2	25
169	f	f	f	10	5	25	9	2	26
170	f	f	f	2	7	4	12	2	8
132	f	f	f	4	4	20	8	2	23
187	f	f	f	3	6	5	10	2	10
171	f	f	f	4	5	24	9	2	27
172	f	f	f	4	5	24	9	2	28
173	f	f	f	9	5	6	18	2	29
174	f	f	f	9	5	6	18	2	30
175	f	f	f	4	7	17	14	2	9
176	f	f	f	1	6	12	10	2	1
177	f	f	f	1	6	12	10	2	2
178	f	f	f	4	6	8	10	2	3
179	f	f	f	4	7	17	14	2	10
180	f	f	f	4	6	8	10	2	4
181	f	f	f	2	6	11	10	2	5
182	f	f	f	2	6	11	10	2	6
183	f	f	f	7	7	9	14	2	11
186	f	f	f	3	6	5	10	2	9
220	f	f	f	11	7	17	14	2	26
221	f	f	f	10	7	25	14	2	27
222	f	f	f	10	7	25	14	2	28
229	f	f	f	2	9	18	19	2	7
230	f	f	f	2	9	18	19	2	8
231	f	f	f	4	9	20	15	2	9
232	f	f	f	4	9	20	15	2	10
233	f	f	f	7	9	21	15	2	11
234	f	f	f	7	9	21	15	2	12
236	f	f	f	4	9	20	15	2	1
237	f	f	f	4	9	20	15	2	2
238	f	f	f	9	9	19	21	2	3
239	f	f	f	9	9	19	21	2	4
240	f	f	f	6	9	8	15	2	5
241	f	f	f	6	9	8	15	2	6
242	f	f	f	11	9	17	15	2	13
243	f	f	f	11	9	17	15	2	14
244	f	f	f	8	9	11	22	2	17
205	f	f	f	10	6	21	10	2	27
206	f	f	f	10	6	21	10	2	28
207	f	f	f	9	6	11	21	2	29
208	f	f	f	9	6	11	10	2	30
245	f	f	f	8	9	11	22	2	18
250	f	f	f	1	9	7	16	2	21
252	f	f	f	1	9	7	15	2	15
68	f	f	f	7	1	21	6	2	15
285	f	f	f	11	11	20	16	2	28
297	f	f	f	3	12	25	17	2	12
298	f	f	f	3	12	25	17	2	15
299	f	f	f	3	12	25	17	2	16
302	f	f	f	2	12	11	19	2	13
303	f	f	f	2	12	11	19	2	14
300	f	f	f	7	12	23	17	2	17
301	f	f	f	7	12	23	17	2	18
304	f	f	f	10	12	25	17	2	19
305	f	f	f	10	12	25	17	2	20
312	f	f	f	4	12	8	17	2	27
313	f	f	f	4	12	8	17	2	28
314	f	f	f	11	12	7	17	2	3
315	f	f	f	11	12	7	17	2	4
316	f	f	f	4	8	17	23	2	1
317	f	f	f	4	8	17	23	2	2
318	f	f	f	8	8	11	11	2	3
319	f	f	f	8	8	11	11	2	4
320	f	f	f	6	8	5	23	2	5
321	f	f	f	6	8	5	23	2	6
322	f	f	f	3	8	9	23	2	7
323	f	f	f	3	8	9	23	2	8
324	f	f	f	2	8	18	19	2	9
325	f	f	f	2	8	18	19	2	10
326	f	f	f	3	8	9	23	2	13
85	f	f	f	2	2	18	12	2	4
86	f	f	f	4	2	22	7	2	5
87	f	f	f	4	2	22	7	2	6
88	f	f	f	3	2	25	7	2	7
267	f	f	f	3	11	12	16	2	8
61	t	f	f	6	1	8	6	2	8
266	f	f	f	3	11	12	16	2	7
256	f	f	f	3	9	23	15	2	25
257	f	f	f	3	9	23	15	2	26
258	f	f	f	10	9	25	15	2	29
259	f	f	f	10	9	25	15	2	30
260	f	f	f	1	11	18	16	2	1
188	f	f	f	11	6	20	10	2	11
189	f	f	f	7	7	9	14	2	12
143	f	f	f	3	5	12	9	2	3
190	f	f	f	11	6	20	10	2	12
191	f	f	f	1	6	22	10	2	13
192	f	f	f	1	6	22	10	2	14
18	f	f	f	2	3	16	12	2	1
193	f	f	f	6	7	8	14	2	13
194	f	f	f	7	6	23	10	2	15
195	f	f	f	7	6	23	10	2	16
196	f	f	f	5	6	4	20	2	17
197	f	f	f	5	6	4	20	2	18
198	f	f	f	6	6	5	10	2	19
199	f	f	f	6	6	5	10	2	20
200	f	f	f	6	7	8	14	2	14
201	f	f	f	3	6	5	10	2	21
209	f	f	f	8	7	11	11	2	15
210	f	f	f	8	7	11	11	2	16
211	f	f	f	4	7	17	14	2	17
212	f	f	f	4	7	17	14	2	18
215	f	f	f	3	7	9	14	2	21
155	f	f	f	3	5	12	9	2	13
157	f	f	f	3	5	12	9	2	14
141	t	f	f	9	7	19	18	2	1
382	t	f	f	27	18	30	30	2	3
311	f	t	f	1	12	12	17	2	26
283	f	t	f	3	11	12	16	2	24
383	f	f	f	27	18	30	30	2	4
45	f	f	t	3	3	12	5	2	20
310	f	t	f	1	12	12	17	2	25
\.


--
-- TOC entry 5191 (class 0 OID 24696)
-- Dependencies: 245
-- Data for Name: stundenplan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stundenplan (id, gueltigab, schuljahr_id) FROM stdin;
2	2025-08-01	1
\.


--
-- TOC entry 5193 (class 0 OID 24702)
-- Dependencies: 247
-- Data for Name: vertretung; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vertretung (id, bemerkung, datum, grund, stunde_id, vertretungslehrer_id) FROM stdin;
151		2026-05-07	KRANK	44	6
152		2026-05-07	KRANK	282	\N
153		2026-05-08	KRANK	311	\N
154		2026-05-07	KRANK	283	\N
155		2026-05-07	KRANK	45	6
156		2026-05-08	KRANK	310	\N
\.


--
-- TOC entry 5195 (class 0 OID 24712)
-- Dependencies: 249
-- Data for Name: zeitslot; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.zeitslot (id, endzeit, startzeit, stundennummer, wochentag) FROM stdin;
1	08:45:00	08:00:00	1	MONTAG
2	09:30:00	08:45:00	2	MONTAG
3	10:30:00	09:45:00	3	MONTAG
4	11:15:00	10:30:00	4	MONTAG
5	12:15:00	11:30:00	5	MONTAG
6	13:00:00	12:15:00	6	MONTAG
7	08:45:00	08:00:00	1	DIENSTAG
8	09:30:00	08:45:00	2	DIENSTAG
9	10:30:00	09:45:00	3	DIENSTAG
10	11:15:00	10:30:00	4	DIENSTAG
11	12:15:00	11:30:00	5	DIENSTAG
12	13:00:00	12:15:00	6	DIENSTAG
13	08:45:00	08:00:00	1	MITTWOCH
14	09:30:00	08:45:00	2	MITTWOCH
15	10:30:00	09:45:00	3	MITTWOCH
16	11:15:00	10:30:00	4	MITTWOCH
17	12:15:00	11:30:00	5	MITTWOCH
18	13:00:00	12:15:00	6	MITTWOCH
19	08:45:00	08:00:00	1	DONNERSTAG
20	09:30:00	08:45:00	2	DONNERSTAG
21	10:30:00	09:45:00	3	DONNERSTAG
22	11:15:00	10:30:00	4	DONNERSTAG
23	12:15:00	11:30:00	5	DONNERSTAG
24	13:00:00	12:15:00	6	DONNERSTAG
25	08:45:00	08:00:00	1	FREITAG
26	09:30:00	08:45:00	2	FREITAG
27	10:30:00	09:45:00	3	FREITAG
28	11:15:00	10:30:00	4	FREITAG
29	12:15:00	11:30:00	5	FREITAG
30	13:00:00	12:15:00	6	FREITAG
\.


--
-- TOC entry 5216 (class 0 OID 0)
-- Dependencies: 220
-- Name: abwesenheit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.abwesenheit_id_seq', 31, true);


--
-- TOC entry 5217 (class 0 OID 0)
-- Dependencies: 223
-- Name: benutzer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.benutzer_id_seq', 72, true);


--
-- TOC entry 5218 (class 0 OID 0)
-- Dependencies: 225
-- Name: erziehungsberechtigter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.erziehungsberechtigter_id_seq', 7, true);


--
-- TOC entry 5219 (class 0 OID 0)
-- Dependencies: 227
-- Name: fach_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fach_id_seq', 27, true);


--
-- TOC entry 5220 (class 0 OID 0)
-- Dependencies: 229
-- Name: klasse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.klasse_id_seq', 18, true);


--
-- TOC entry 5221 (class 0 OID 0)
-- Dependencies: 233
-- Name: lehrkraft_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lehrkraft_id_seq', 30, true);


--
-- TOC entry 5222 (class 0 OID 0)
-- Dependencies: 235
-- Name: raum_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.raum_id_seq', 30, true);


--
-- TOC entry 5223 (class 0 OID 0)
-- Dependencies: 238
-- Name: schueler_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.schueler_id_seq', 8, true);


--
-- TOC entry 5224 (class 0 OID 0)
-- Dependencies: 240
-- Name: schuljahr_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.schuljahr_id_seq', 1, true);


--
-- TOC entry 5225 (class 0 OID 0)
-- Dependencies: 242
-- Name: sperrzeit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sperrzeit_id_seq', 15, true);


--
-- TOC entry 5226 (class 0 OID 0)
-- Dependencies: 244
-- Name: stunde_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stunde_id_seq', 383, true);


--
-- TOC entry 5227 (class 0 OID 0)
-- Dependencies: 246
-- Name: stundenplan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stundenplan_id_seq', 2, true);


--
-- TOC entry 5228 (class 0 OID 0)
-- Dependencies: 248
-- Name: vertretung_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vertretung_id_seq', 156, true);


--
-- TOC entry 5229 (class 0 OID 0)
-- Dependencies: 250
-- Name: zeitslot_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.zeitslot_id_seq', 30, true);


--
-- TOC entry 4959 (class 2606 OID 24734)
-- Name: abwesenheit abwesenheit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.abwesenheit
    ADD CONSTRAINT abwesenheit_pkey PRIMARY KEY (id);


--
-- TOC entry 4961 (class 2606 OID 24736)
-- Name: admin_benutzer admin_benutzer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_benutzer
    ADD CONSTRAINT admin_benutzer_pkey PRIMARY KEY (id);


--
-- TOC entry 4963 (class 2606 OID 24738)
-- Name: benutzer benutzer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.benutzer
    ADD CONSTRAINT benutzer_pkey PRIMARY KEY (id);


--
-- TOC entry 4967 (class 2606 OID 24740)
-- Name: erziehungsberechtigter erziehungsberechtigter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.erziehungsberechtigter
    ADD CONSTRAINT erziehungsberechtigter_pkey PRIMARY KEY (id);


--
-- TOC entry 4969 (class 2606 OID 24742)
-- Name: fach fach_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fach
    ADD CONSTRAINT fach_pkey PRIMARY KEY (id);


--
-- TOC entry 4971 (class 2606 OID 24744)
-- Name: klasse klasse_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.klasse
    ADD CONSTRAINT klasse_pkey PRIMARY KEY (id);


--
-- TOC entry 4973 (class 2606 OID 24746)
-- Name: lehrer_benutzer lehrer_benutzer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lehrer_benutzer
    ADD CONSTRAINT lehrer_benutzer_pkey PRIMARY KEY (id);


--
-- TOC entry 4977 (class 2606 OID 24748)
-- Name: lehrkraft lehrkraft_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lehrkraft
    ADD CONSTRAINT lehrkraft_pkey PRIMARY KEY (id);


--
-- TOC entry 4979 (class 2606 OID 24750)
-- Name: raum raum_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.raum
    ADD CONSTRAINT raum_pkey PRIMARY KEY (id);


--
-- TOC entry 4983 (class 2606 OID 24752)
-- Name: schueler_benutzer schueler_benutzer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schueler_benutzer
    ADD CONSTRAINT schueler_benutzer_pkey PRIMARY KEY (id);


--
-- TOC entry 4981 (class 2606 OID 24754)
-- Name: schueler schueler_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schueler
    ADD CONSTRAINT schueler_pkey PRIMARY KEY (id);


--
-- TOC entry 4985 (class 2606 OID 24756)
-- Name: schuljahr schuljahr_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schuljahr
    ADD CONSTRAINT schuljahr_pkey PRIMARY KEY (id);


--
-- TOC entry 4987 (class 2606 OID 24758)
-- Name: sperrzeit sperrzeit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sperrzeit
    ADD CONSTRAINT sperrzeit_pkey PRIMARY KEY (id);


--
-- TOC entry 4989 (class 2606 OID 24760)
-- Name: stunde stunde_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stunde
    ADD CONSTRAINT stunde_pkey PRIMARY KEY (id);


--
-- TOC entry 4991 (class 2606 OID 24762)
-- Name: stundenplan stundenplan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stundenplan
    ADD CONSTRAINT stundenplan_pkey PRIMARY KEY (id);


--
-- TOC entry 4965 (class 2606 OID 24764)
-- Name: benutzer uk_a9pmer7fnastb2t6o0ag5gbpj; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.benutzer
    ADD CONSTRAINT uk_a9pmer7fnastb2t6o0ag5gbpj UNIQUE (benutzername);


--
-- TOC entry 4975 (class 2606 OID 24766)
-- Name: lehrer_benutzer uk_haeu77s8ywdv7lvgl7wqplwqr; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lehrer_benutzer
    ADD CONSTRAINT uk_haeu77s8ywdv7lvgl7wqplwqr UNIQUE (lehrkraft_id);


--
-- TOC entry 4993 (class 2606 OID 24768)
-- Name: vertretung vertretung_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vertretung
    ADD CONSTRAINT vertretung_pkey PRIMARY KEY (id);


--
-- TOC entry 4995 (class 2606 OID 24770)
-- Name: zeitslot zeitslot_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zeitslot
    ADD CONSTRAINT zeitslot_pkey PRIMARY KEY (id);


--
-- TOC entry 5002 (class 2606 OID 24771)
-- Name: lehrkraft_fach fk1918du8o22m8brr2dl4b2j3wi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lehrkraft_fach
    ADD CONSTRAINT fk1918du8o22m8brr2dl4b2j3wi FOREIGN KEY (lehrkraft_id) REFERENCES public.lehrkraft(id);


--
-- TOC entry 5005 (class 2606 OID 24776)
-- Name: schueler_benutzer fk3rg5o0kx1gcull5pcjsxbwb2g; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schueler_benutzer
    ADD CONSTRAINT fk3rg5o0kx1gcull5pcjsxbwb2g FOREIGN KEY (id) REFERENCES public.benutzer(id);


--
-- TOC entry 5016 (class 2606 OID 24781)
-- Name: vertretung fk73tv8vj04oq4rimaa0mpw6qao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vertretung
    ADD CONSTRAINT fk73tv8vj04oq4rimaa0mpw6qao FOREIGN KEY (stunde_id) REFERENCES public.stunde(id);


--
-- TOC entry 5000 (class 2606 OID 24786)
-- Name: lehrer_benutzer fk792u1asaiguijynnvhadyxk1m; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lehrer_benutzer
    ADD CONSTRAINT fk792u1asaiguijynnvhadyxk1m FOREIGN KEY (lehrkraft_id) REFERENCES public.lehrkraft(id);


--
-- TOC entry 4997 (class 2606 OID 24791)
-- Name: admin_benutzer fk7jmg1p5ootf4y69dmc21a662r; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_benutzer
    ADD CONSTRAINT fk7jmg1p5ootf4y69dmc21a662r FOREIGN KEY (id) REFERENCES public.benutzer(id);


--
-- TOC entry 5015 (class 2606 OID 24796)
-- Name: stundenplan fka8l71bc454w9cjhyykd0e2b6j; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stundenplan
    ADD CONSTRAINT fka8l71bc454w9cjhyykd0e2b6j FOREIGN KEY (schuljahr_id) REFERENCES public.schuljahr(id);


--
-- TOC entry 5006 (class 2606 OID 24801)
-- Name: schueler_benutzer fkbcexdy46dtxttfnug0bhn5l1v; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schueler_benutzer
    ADD CONSTRAINT fkbcexdy46dtxttfnug0bhn5l1v FOREIGN KEY (klasse_id) REFERENCES public.klasse(id);


--
-- TOC entry 4996 (class 2606 OID 24806)
-- Name: abwesenheit fkdj2wfx695gsd9jmyoi9kei153; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.abwesenheit
    ADD CONSTRAINT fkdj2wfx695gsd9jmyoi9kei153 FOREIGN KEY (lehrkraft_id) REFERENCES public.lehrkraft(id);


--
-- TOC entry 5007 (class 2606 OID 24811)
-- Name: sperrzeit fkik2u48yxsfu6wso8g22kwrr80; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sperrzeit
    ADD CONSTRAINT fkik2u48yxsfu6wso8g22kwrr80 FOREIGN KEY (lehrkraft_id) REFERENCES public.lehrkraft(id);


--
-- TOC entry 5001 (class 2606 OID 24816)
-- Name: lehrer_benutzer fkjlxql25f985gcfh9h5lptog4w; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lehrer_benutzer
    ADD CONSTRAINT fkjlxql25f985gcfh9h5lptog4w FOREIGN KEY (id) REFERENCES public.benutzer(id);


--
-- TOC entry 5009 (class 2606 OID 24821)
-- Name: stunde fkjp84m8cgeak6tquwqbdcuxn8t; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stunde
    ADD CONSTRAINT fkjp84m8cgeak6tquwqbdcuxn8t FOREIGN KEY (lehrkraft_id) REFERENCES public.lehrkraft(id);


--
-- TOC entry 5010 (class 2606 OID 24826)
-- Name: stunde fkmtx1bqtv9orexgbphnhm2hijq; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stunde
    ADD CONSTRAINT fkmtx1bqtv9orexgbphnhm2hijq FOREIGN KEY (klasse_id) REFERENCES public.klasse(id);


--
-- TOC entry 5017 (class 2606 OID 24831)
-- Name: vertretung fknutvnx7uj90klywyc26wxw419; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vertretung
    ADD CONSTRAINT fknutvnx7uj90klywyc26wxw419 FOREIGN KEY (vertretungslehrer_id) REFERENCES public.lehrkraft(id);


--
-- TOC entry 5011 (class 2606 OID 24836)
-- Name: stunde fko2b7p1bmkd45x6ncc138ooq9j; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stunde
    ADD CONSTRAINT fko2b7p1bmkd45x6ncc138ooq9j FOREIGN KEY (fach_id) REFERENCES public.fach(id);


--
-- TOC entry 5008 (class 2606 OID 24841)
-- Name: sperrzeit fkomdce9k8v3eqfgd578ibl2gr9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sperrzeit
    ADD CONSTRAINT fkomdce9k8v3eqfgd578ibl2gr9 FOREIGN KEY (zeitslot_id) REFERENCES public.zeitslot(id);


--
-- TOC entry 5004 (class 2606 OID 24846)
-- Name: schueler fkox1rqxdb1y7c56lgc11896dd2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schueler
    ADD CONSTRAINT fkox1rqxdb1y7c56lgc11896dd2 FOREIGN KEY (klasse_id) REFERENCES public.klasse(id);


--
-- TOC entry 4998 (class 2606 OID 24851)
-- Name: erziehungsberechtigter fkp32bnvfu9nip5jqa0agmfxs8m; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.erziehungsberechtigter
    ADD CONSTRAINT fkp32bnvfu9nip5jqa0agmfxs8m FOREIGN KEY (schueler_id) REFERENCES public.schueler(id);


--
-- TOC entry 5012 (class 2606 OID 24856)
-- Name: stunde fkp7pe9xk49jflic7wk5wmcoflg; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stunde
    ADD CONSTRAINT fkp7pe9xk49jflic7wk5wmcoflg FOREIGN KEY (zeitslot_id) REFERENCES public.zeitslot(id);


--
-- TOC entry 5013 (class 2606 OID 24861)
-- Name: stunde fkpf6lyv6jvohwome2x207t0au1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stunde
    ADD CONSTRAINT fkpf6lyv6jvohwome2x207t0au1 FOREIGN KEY (stundenplan_id) REFERENCES public.stundenplan(id);


--
-- TOC entry 5003 (class 2606 OID 24866)
-- Name: lehrkraft_fach fktg4krx7ubgibkb3qv6w6lqqi7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lehrkraft_fach
    ADD CONSTRAINT fktg4krx7ubgibkb3qv6w6lqqi7 FOREIGN KEY (fach_id) REFERENCES public.fach(id);


--
-- TOC entry 4999 (class 2606 OID 24871)
-- Name: klasse fkthce7ojopm568exuj18xjtvp8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.klasse
    ADD CONSTRAINT fkthce7ojopm568exuj18xjtvp8 FOREIGN KEY (lehrkraft_id) REFERENCES public.lehrkraft(id);


--
-- TOC entry 5014 (class 2606 OID 24876)
-- Name: stunde fkw9gdj19dtqr0nffhdeww3ev0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stunde
    ADD CONSTRAINT fkw9gdj19dtqr0nffhdeww3ev0 FOREIGN KEY (raum_id) REFERENCES public.raum(id);


-- Completed on 2026-05-20 15:28:57

--
-- PostgreSQL database dump complete
--



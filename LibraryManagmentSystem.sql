--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

-- Started on 2022-12-28 00:06:25

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
-- TOC entry 241 (class 1255 OID 26023)
-- Name: getauthor(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.getauthor(author_no integer) RETURNS TABLE(numara integer, adi character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT "author_id", "author_name" FROM author
                 WHERE "author_id" = author_no;
END;
$$;


ALTER FUNCTION public.getauthor(author_no integer) OWNER TO postgres;

--
-- TOC entry 254 (class 1255 OID 26026)
-- Name: getbook(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.getbook(book_no character varying) RETURNS TABLE(id character varying, adi character varying, yazari integer, yayincisi integer, basimyili integer, bolumu integer, durumu integer, dili integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
	RETURN QUERY SELECT "book_id","book_name","book_author","book_publisher","book_publicationyear","book_section","book_status","book_language" FROM book
			WHERE "book_id"=book_no;
			
END;
$$;


ALTER FUNCTION public.getbook(book_no character varying) OWNER TO postgres;

--
-- TOC entry 251 (class 1255 OID 26029)
-- Name: getcontact(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.getcontact(contact_no integer) RETURNS TABLE(id integer, numarasi numeric, mail character varying, kisi_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
	RETURN QUERY SELECT "contact_id","contact_phone","contact_email","user_id" FROM "contact"
			WHERE "contact_id"=contact_no;
			
END;
$$;


ALTER FUNCTION public.getcontact(contact_no integer) OWNER TO postgres;

--
-- TOC entry 258 (class 1255 OID 26028)
-- Name: getuser(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.getuser(user_no integer) RETURNS TABLE(id integer, adi character varying, cinsiyet character, dogumtarihi date, tipi character)
    LANGUAGE plpgsql
    AS $$
BEGIN
	RETURN QUERY SELECT "user_id","user_name","user_gender","user_dateofbirth","user_type" FROM "user"
			WHERE "user_id"=user_no;
			
END;
$$;


ALTER FUNCTION public.getuser(user_no integer) OWNER TO postgres;

--
-- TOC entry 255 (class 1255 OID 26033)
-- Name: sumofb(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.sumofb() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE sumofbook SET sayi=sayi+1;
RETURN NEW;
END;
$$;


ALTER FUNCTION public.sumofb() OWNER TO postgres;

--
-- TOC entry 259 (class 1255 OID 26048)
-- Name: sumofc(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.sumofc() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE sumofcontact SET sayi=sayi+1;
RETURN NEW;
END;
$$;


ALTER FUNCTION public.sumofc() OWNER TO postgres;

--
-- TOC entry 257 (class 1255 OID 26043)
-- Name: sumofl(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.sumofl() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE sumoflibrary SET sayi=sayi+1;
RETURN NEW;
END;
$$;


ALTER FUNCTION public.sumofl() OWNER TO postgres;

--
-- TOC entry 256 (class 1255 OID 26035)
-- Name: sumofu(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.sumofu() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE sumofuser SET sayi=sayi+1;
RETURN NEW;
END;
$$;


ALTER FUNCTION public.sumofu() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 230 (class 1259 OID 25657)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    user_id integer NOT NULL,
    user_name character varying NOT NULL,
    user_gender character(1) NOT NULL,
    user_dateofbirth date NOT NULL,
    user_type character(1) NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 25930)
-- Name: academician; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.academician (
    academician_department integer,
    academician_level text
)
INHERITS (public."user");


ALTER TABLE public.academician OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 25428)
-- Name: adress; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.adress (
    adress_id integer NOT NULL,
    adress_country character varying NOT NULL,
    adress_city character varying NOT NULL,
    adress_district character varying NOT NULL
);


ALTER TABLE public.adress OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 25427)
-- Name: adress_adress_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.adress_adress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.adress_adress_id_seq OWNER TO postgres;

--
-- TOC entry 3524 (class 0 OID 0)
-- Dependencies: 210
-- Name: adress_adress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.adress_adress_id_seq OWNED BY public.adress.adress_id;


--
-- TOC entry 213 (class 1259 OID 25437)
-- Name: author; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.author (
    author_id integer NOT NULL,
    author_name character varying NOT NULL
);


ALTER TABLE public.author OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 25436)
-- Name: author_author_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.author_author_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.author_author_id_seq OWNER TO postgres;

--
-- TOC entry 3525 (class 0 OID 0)
-- Dependencies: 212
-- Name: author_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.author_author_id_seq OWNED BY public.author.author_id;


--
-- TOC entry 209 (class 1259 OID 25420)
-- Name: book; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book (
    book_id character varying(10) NOT NULL,
    book_name character varying NOT NULL,
    book_author integer NOT NULL,
    book_publisher integer NOT NULL,
    book_publicationyear integer NOT NULL,
    book_section integer NOT NULL,
    book_status integer,
    book_language integer
);


ALTER TABLE public.book OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 25446)
-- Name: catagory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.catagory (
    catagory_id integer NOT NULL,
    catagory_name character varying NOT NULL,
    section_id integer NOT NULL
);


ALTER TABLE public.catagory OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 25445)
-- Name: catagory_catagory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.catagory_catagory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catagory_catagory_id_seq OWNER TO postgres;

--
-- TOC entry 3526 (class 0 OID 0)
-- Dependencies: 214
-- Name: catagory_catagory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.catagory_catagory_id_seq OWNED BY public.catagory.catagory_id;


--
-- TOC entry 217 (class 1259 OID 25455)
-- Name: contact; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contact (
    contact_id integer NOT NULL,
    contact_phone numeric NOT NULL,
    contact_email character varying NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.contact OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 25454)
-- Name: contact_contact_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contact_contact_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contact_contact_id_seq OWNER TO postgres;

--
-- TOC entry 3527 (class 0 OID 0)
-- Dependencies: 216
-- Name: contact_contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contact_contact_id_seq OWNED BY public.contact.contact_id;


--
-- TOC entry 219 (class 1259 OID 25464)
-- Name: department; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.department (
    department_id integer NOT NULL,
    department_name character varying NOT NULL,
    faculty_id integer NOT NULL
);


ALTER TABLE public.department OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 25463)
-- Name: department_department_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.department_department_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.department_department_id_seq OWNER TO postgres;

--
-- TOC entry 3528 (class 0 OID 0)
-- Dependencies: 218
-- Name: department_department_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.department_department_id_seq OWNED BY public.department.department_id;


--
-- TOC entry 232 (class 1259 OID 25719)
-- Name: status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.status (
    status_id integer NOT NULL,
    status_type character varying NOT NULL
);


ALTER TABLE public.status OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 25727)
-- Name: deposit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deposit (
    issueddate date NOT NULL,
    duedate date NOT NULL,
    user_id integer NOT NULL
)
INHERITS (public.status);


ALTER TABLE public.deposit OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 25638)
-- Name: faculty; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.faculty (
    faculty_id integer NOT NULL,
    faculty_name character varying NOT NULL
);


ALTER TABLE public.faculty OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 25482)
-- Name: language; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.language (
    language_id integer NOT NULL,
    language_name character varying NOT NULL
);


ALTER TABLE public.language OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 25481)
-- Name: language_language_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.language_language_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.language_language_id_seq OWNER TO postgres;

--
-- TOC entry 3529 (class 0 OID 0)
-- Dependencies: 220
-- Name: language_language_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.language_language_id_seq OWNED BY public.language.language_id;


--
-- TOC entry 223 (class 1259 OID 25492)
-- Name: library; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.library (
    library_id integer NOT NULL,
    library_name character varying NOT NULL,
    library_adress integer NOT NULL
);


ALTER TABLE public.library OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 25491)
-- Name: library_library_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.library_library_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.library_library_id_seq OWNER TO postgres;

--
-- TOC entry 3530 (class 0 OID 0)
-- Dependencies: 222
-- Name: library_library_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.library_library_id_seq OWNED BY public.library.library_id;


--
-- TOC entry 225 (class 1259 OID 25501)
-- Name: publisher; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.publisher (
    publisher_id integer NOT NULL,
    publisher_name character varying NOT NULL,
    publisher_adress integer NOT NULL
);


ALTER TABLE public.publisher OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 25500)
-- Name: publisher_publisher_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.publisher_publisher_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publisher_publisher_id_seq OWNER TO postgres;

--
-- TOC entry 3531 (class 0 OID 0)
-- Dependencies: 224
-- Name: publisher_publisher_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.publisher_publisher_id_seq OWNED BY public.publisher.publisher_id;


--
-- TOC entry 227 (class 1259 OID 25510)
-- Name: section; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.section (
    section_id integer NOT NULL,
    section_name character varying NOT NULL
);


ALTER TABLE public.section OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 25509)
-- Name: section_section_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.section_section_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.section_section_id_seq OWNER TO postgres;

--
-- TOC entry 3532 (class 0 OID 0)
-- Dependencies: 226
-- Name: section_section_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.section_section_id_seq OWNED BY public.section.section_id;


--
-- TOC entry 234 (class 1259 OID 25733)
-- Name: shelf; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shelf (
    library_id integer NOT NULL
)
INHERITS (public.status);


ALTER TABLE public.shelf OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 25718)
-- Name: status_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.status_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.status_status_id_seq OWNER TO postgres;

--
-- TOC entry 3533 (class 0 OID 0)
-- Dependencies: 231
-- Name: status_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.status_status_id_seq OWNED BY public.status.status_id;


--
-- TOC entry 235 (class 1259 OID 25922)
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
    student_year numeric,
    student_department integer
)
INHERITS (public."user");


ALTER TABLE public.student OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 26061)
-- Name: sumofbook; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sumofbook (
    sayi integer
);


ALTER TABLE public.sumofbook OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 26045)
-- Name: sumofcontact; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sumofcontact (
    sayi integer
);


ALTER TABLE public.sumofcontact OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 26040)
-- Name: sumoflibrary; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sumoflibrary (
    sayi integer
);


ALTER TABLE public.sumoflibrary OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 26036)
-- Name: sumofuser; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sumofuser (
    sayi integer
);


ALTER TABLE public.sumofuser OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 25656)
-- Name: user_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_user_id_seq OWNER TO postgres;

--
-- TOC entry 3534 (class 0 OID 0)
-- Dependencies: 229
-- Name: user_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_user_id_seq OWNED BY public."user".user_id;


--
-- TOC entry 3276 (class 2604 OID 25933)
-- Name: academician user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academician ALTER COLUMN user_id SET DEFAULT nextval('public.user_user_id_seq'::regclass);


--
-- TOC entry 3262 (class 2604 OID 25431)
-- Name: adress adress_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adress ALTER COLUMN adress_id SET DEFAULT nextval('public.adress_adress_id_seq'::regclass);


--
-- TOC entry 3263 (class 2604 OID 25440)
-- Name: author author_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.author ALTER COLUMN author_id SET DEFAULT nextval('public.author_author_id_seq'::regclass);


--
-- TOC entry 3264 (class 2604 OID 25449)
-- Name: catagory catagory_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catagory ALTER COLUMN catagory_id SET DEFAULT nextval('public.catagory_catagory_id_seq'::regclass);


--
-- TOC entry 3265 (class 2604 OID 25458)
-- Name: contact contact_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact ALTER COLUMN contact_id SET DEFAULT nextval('public.contact_contact_id_seq'::regclass);


--
-- TOC entry 3266 (class 2604 OID 25467)
-- Name: department department_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department ALTER COLUMN department_id SET DEFAULT nextval('public.department_department_id_seq'::regclass);


--
-- TOC entry 3273 (class 2604 OID 25730)
-- Name: deposit status_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deposit ALTER COLUMN status_id SET DEFAULT nextval('public.status_status_id_seq'::regclass);


--
-- TOC entry 3267 (class 2604 OID 25485)
-- Name: language language_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.language ALTER COLUMN language_id SET DEFAULT nextval('public.language_language_id_seq'::regclass);


--
-- TOC entry 3268 (class 2604 OID 25495)
-- Name: library library_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.library ALTER COLUMN library_id SET DEFAULT nextval('public.library_library_id_seq'::regclass);


--
-- TOC entry 3269 (class 2604 OID 25504)
-- Name: publisher publisher_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publisher ALTER COLUMN publisher_id SET DEFAULT nextval('public.publisher_publisher_id_seq'::regclass);


--
-- TOC entry 3270 (class 2604 OID 25513)
-- Name: section section_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.section ALTER COLUMN section_id SET DEFAULT nextval('public.section_section_id_seq'::regclass);


--
-- TOC entry 3274 (class 2604 OID 25736)
-- Name: shelf status_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shelf ALTER COLUMN status_id SET DEFAULT nextval('public.status_status_id_seq'::regclass);


--
-- TOC entry 3272 (class 2604 OID 25722)
-- Name: status status_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status ALTER COLUMN status_id SET DEFAULT nextval('public.status_status_id_seq'::regclass);


--
-- TOC entry 3275 (class 2604 OID 25925)
-- Name: student user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student ALTER COLUMN user_id SET DEFAULT nextval('public.user_user_id_seq'::regclass);


--
-- TOC entry 3271 (class 2604 OID 25660)
-- Name: user user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN user_id SET DEFAULT nextval('public.user_user_id_seq'::regclass);


--
-- TOC entry 3514 (class 0 OID 25930)
-- Dependencies: 236
-- Data for Name: academician; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.academician (user_id, user_name, user_gender, user_dateofbirth, user_type, academician_department, academician_level) FROM stdin;
4	ayşe	k	2001-12-12	a	2	DR
\.


--
-- TOC entry 3489 (class 0 OID 25428)
-- Dependencies: 211
-- Data for Name: adress; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.adress (adress_id, adress_country, adress_city, adress_district) FROM stdin;
4	türkiye	istanbul	kadıköy
5	ABD	LOS ANGELES	FLORİDA
\.


--
-- TOC entry 3491 (class 0 OID 25437)
-- Dependencies: 213
-- Data for Name: author; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.author (author_id, author_name) FROM stdin;
1	Ömer Seyfettin
2	JOSE MARUO DE VASCONCELOS
3	Sabahattin Ali
\.


--
-- TOC entry 3487 (class 0 OID 25420)
-- Dependencies: 209
-- Data for Name: book; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.book (book_id, book_name, book_author, book_publisher, book_publicationyear, book_section, book_status, book_language) FROM stdin;
b2005	sasdas	1	3	1978	1	25	4
b2001	Kaşağı	1	2	1978	1	20	4
b2002	Kuyucaklı Yusuf	3	3	1978	1	23	4
b2003	Şeker Portakalı	2	2	1978	1	14	4
b2004	Kürk Mantolu Madonna	1	3	1978	1	24	4
\.


--
-- TOC entry 3493 (class 0 OID 25446)
-- Dependencies: 215
-- Data for Name: catagory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.catagory (catagory_id, catagory_name, section_id) FROM stdin;
1	Mühendislik	3
2	Tıp	2
8	Öykü	1
9	Hikaye	1
\.


--
-- TOC entry 3495 (class 0 OID 25455)
-- Dependencies: 217
-- Data for Name: contact; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contact (contact_id, contact_phone, contact_email, user_id) FROM stdin;
1	505444777	deneme@gmail.com	1
3	47896215	test@gmail.com	1
\.


--
-- TOC entry 3497 (class 0 OID 25464)
-- Dependencies: 219
-- Data for Name: department; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.department (department_id, department_name, faculty_id) FROM stdin;
1	BEDEN EĞİTİMİ 	1001
2	ELEKTRİK MÜHENDİSLİĞİ	1002
\.


--
-- TOC entry 3511 (class 0 OID 25727)
-- Dependencies: 233
-- Data for Name: deposit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deposit (status_id, status_type, issueddate, duedate, user_id) FROM stdin;
20	Deposit	2001-12-12	2001-12-12	6
23	Deposit	2001-12-12	2001-12-12	7
\.


--
-- TOC entry 3506 (class 0 OID 25638)
-- Dependencies: 228
-- Data for Name: faculty; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.faculty (faculty_id, faculty_name) FROM stdin;
1001	BESYO
1002	MÜHENDİSLİK
\.


--
-- TOC entry 3499 (class 0 OID 25482)
-- Dependencies: 221
-- Data for Name: language; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.language (language_id, language_name) FROM stdin;
1	İngilizce
2	Almanca
3	Fransızca
4	Türkçe
\.


--
-- TOC entry 3501 (class 0 OID 25492)
-- Dependencies: 223
-- Data for Name: library; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.library (library_id, library_name, library_adress) FROM stdin;
5	Sakarya	4
4	Merkez	4
\.


--
-- TOC entry 3503 (class 0 OID 25501)
-- Dependencies: 225
-- Data for Name: publisher; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.publisher (publisher_id, publisher_name, publisher_adress) FROM stdin;
2	ABC YAYINCILIK	4
3	XYZ YAYINCILIK	4
4	ADA YAYINCILIK	5
\.


--
-- TOC entry 3505 (class 0 OID 25510)
-- Dependencies: 227
-- Data for Name: section; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.section (section_id, section_name) FROM stdin;
1	Edebiyat
2	Sağlık
3	Eğitim
\.


--
-- TOC entry 3512 (class 0 OID 25733)
-- Dependencies: 234
-- Data for Name: shelf; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shelf (status_id, status_type, library_id) FROM stdin;
14	Shelf	4
24	Shelf	4
25	Shelf	4
\.


--
-- TOC entry 3510 (class 0 OID 25719)
-- Dependencies: 232
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.status (status_id, status_type) FROM stdin;
\.


--
-- TOC entry 3513 (class 0 OID 25922)
-- Dependencies: 235
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student (user_id, user_name, user_gender, user_dateofbirth, user_type, student_year, student_department) FROM stdin;
2	Mehmet	e	2001-12-12	S	2	1
3	emre	e	2001-12-12	s	3	2
6	Ayşe	K	2001-12-12	A	4	2
\.


--
-- TOC entry 3518 (class 0 OID 26061)
-- Dependencies: 240
-- Data for Name: sumofbook; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sumofbook (sayi) FROM stdin;
5
\.


--
-- TOC entry 3517 (class 0 OID 26045)
-- Dependencies: 239
-- Data for Name: sumofcontact; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sumofcontact (sayi) FROM stdin;
2
\.


--
-- TOC entry 3516 (class 0 OID 26040)
-- Dependencies: 238
-- Data for Name: sumoflibrary; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sumoflibrary (sayi) FROM stdin;
2
1
\.


--
-- TOC entry 3515 (class 0 OID 26036)
-- Dependencies: 237
-- Data for Name: sumofuser; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sumofuser (sayi) FROM stdin;
3
\.


--
-- TOC entry 3508 (class 0 OID 25657)
-- Dependencies: 230
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (user_id, user_name, user_gender, user_dateofbirth, user_type) FROM stdin;
1	Ali	e	2001-12-12	s
5	Emine	k	2002-10-17	S
7	Hakan	e	2001-12-12	s
\.


--
-- TOC entry 3535 (class 0 OID 0)
-- Dependencies: 210
-- Name: adress_adress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.adress_adress_id_seq', 5, true);


--
-- TOC entry 3536 (class 0 OID 0)
-- Dependencies: 212
-- Name: author_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.author_author_id_seq', 3, true);


--
-- TOC entry 3537 (class 0 OID 0)
-- Dependencies: 214
-- Name: catagory_catagory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.catagory_catagory_id_seq', 9, true);


--
-- TOC entry 3538 (class 0 OID 0)
-- Dependencies: 216
-- Name: contact_contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contact_contact_id_seq', 3, true);


--
-- TOC entry 3539 (class 0 OID 0)
-- Dependencies: 218
-- Name: department_department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.department_department_id_seq', 1, false);


--
-- TOC entry 3540 (class 0 OID 0)
-- Dependencies: 220
-- Name: language_language_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.language_language_id_seq', 4, true);


--
-- TOC entry 3541 (class 0 OID 0)
-- Dependencies: 222
-- Name: library_library_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.library_library_id_seq', 5, true);


--
-- TOC entry 3542 (class 0 OID 0)
-- Dependencies: 224
-- Name: publisher_publisher_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.publisher_publisher_id_seq', 4, true);


--
-- TOC entry 3543 (class 0 OID 0)
-- Dependencies: 226
-- Name: section_section_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.section_section_id_seq', 3, true);


--
-- TOC entry 3544 (class 0 OID 0)
-- Dependencies: 231
-- Name: status_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.status_status_id_seq', 25, true);


--
-- TOC entry 3545 (class 0 OID 0)
-- Dependencies: 229
-- Name: user_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_user_id_seq', 7, true);


--
-- TOC entry 3329 (class 2606 OID 25937)
-- Name: academician academician_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academician
    ADD CONSTRAINT academician_pkey PRIMARY KEY (user_id);


--
-- TOC entry 3290 (class 2606 OID 25435)
-- Name: adress adress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adress
    ADD CONSTRAINT adress_pkey PRIMARY KEY (adress_id);


--
-- TOC entry 3292 (class 2606 OID 25444)
-- Name: author author_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.author
    ADD CONSTRAINT author_pkey PRIMARY KEY (author_id);


--
-- TOC entry 3278 (class 2606 OID 25426)
-- Name: book book_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_pkey PRIMARY KEY (book_id);


--
-- TOC entry 3294 (class 2606 OID 25453)
-- Name: catagory catagory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catagory
    ADD CONSTRAINT catagory_pkey PRIMARY KEY (catagory_id);


--
-- TOC entry 3297 (class 2606 OID 25462)
-- Name: contact contact_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact
    ADD CONSTRAINT contact_pkey PRIMARY KEY (contact_id);


--
-- TOC entry 3300 (class 2606 OID 25471)
-- Name: department department_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (department_id);


--
-- TOC entry 3319 (class 2606 OID 26012)
-- Name: deposit deposit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deposit
    ADD CONSTRAINT deposit_pkey PRIMARY KEY (status_id);


--
-- TOC entry 3312 (class 2606 OID 25644)
-- Name: faculty faculty_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faculty
    ADD CONSTRAINT faculty_pkey PRIMARY KEY (faculty_id);


--
-- TOC entry 3303 (class 2606 OID 25489)
-- Name: language language_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.language
    ADD CONSTRAINT language_pkey PRIMARY KEY (language_id);


--
-- TOC entry 3306 (class 2606 OID 25499)
-- Name: library library_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.library
    ADD CONSTRAINT library_pkey PRIMARY KEY (library_id);


--
-- TOC entry 3308 (class 2606 OID 25508)
-- Name: publisher publisher_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publisher
    ADD CONSTRAINT publisher_pkey PRIMARY KEY (publisher_id);


--
-- TOC entry 3310 (class 2606 OID 25517)
-- Name: section section_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.section
    ADD CONSTRAINT section_pkey PRIMARY KEY (section_id);


--
-- TOC entry 3324 (class 2606 OID 26016)
-- Name: shelf shelf_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shelf
    ADD CONSTRAINT shelf_pkey PRIMARY KEY (status_id);


--
-- TOC entry 3288 (class 2606 OID 26018)
-- Name: book status_Unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT "status_Unique" UNIQUE (book_status) INCLUDE (book_status);


--
-- TOC entry 3317 (class 2606 OID 26014)
-- Name: status status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (status_id);


--
-- TOC entry 3327 (class 2606 OID 25929)
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (user_id);


--
-- TOC entry 3314 (class 2606 OID 25664)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (user_id);


--
-- TOC entry 3330 (class 1259 OID 25949)
-- Name: fki_academicianfk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_academicianfk ON public.academician USING btree (academician_department);


--
-- TOC entry 3279 (class 1259 OID 25523)
-- Name: fki_authorfk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_authorfk ON public.book USING btree (book_author);


--
-- TOC entry 3280 (class 1259 OID 25980)
-- Name: fki_b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_b ON public.book USING btree (book_section);


--
-- TOC entry 3295 (class 1259 OID 25541)
-- Name: fki_c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_c ON public.catagory USING btree (catagory_id);


--
-- TOC entry 3301 (class 1259 OID 25547)
-- Name: fki_d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_d ON public.department USING btree (faculty_id);


--
-- TOC entry 3325 (class 1259 OID 25943)
-- Name: fki_departmentFk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_departmentFk" ON public.student USING btree (student_department);


--
-- TOC entry 3304 (class 1259 OID 25553)
-- Name: fki_l; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_l ON public.library USING btree (library_adress);


--
-- TOC entry 3281 (class 1259 OID 25990)
-- Name: fki_languageFK; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_languageFK" ON public.book USING btree (book_language);


--
-- TOC entry 3322 (class 1259 OID 25774)
-- Name: fki_librarFk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_librarFk" ON public.shelf USING btree (library_id);


--
-- TOC entry 3282 (class 1259 OID 25529)
-- Name: fki_publisherfk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_publisherfk ON public.book USING btree (book_publisher);


--
-- TOC entry 3283 (class 1259 OID 25955)
-- Name: fki_sectionDeposit; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_sectionDeposit" ON public.book USING btree (book_status);


--
-- TOC entry 3284 (class 1259 OID 25961)
-- Name: fki_section_shelfFK; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_section_shelfFK" ON public.book USING btree (book_status);


--
-- TOC entry 3285 (class 1259 OID 25535)
-- Name: fki_sectionfk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_sectionfk ON public.book USING btree (book_section);


--
-- TOC entry 3315 (class 1259 OID 25967)
-- Name: fki_shelfFk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_shelfFk" ON public.status USING btree (status_id);


--
-- TOC entry 3286 (class 1259 OID 25756)
-- Name: fki_statusFk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_statusFk" ON public.book USING btree (book_status);


--
-- TOC entry 3298 (class 1259 OID 25762)
-- Name: fki_userFK; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_userFK" ON public.contact USING btree (user_id);


--
-- TOC entry 3320 (class 1259 OID 26060)
-- Name: fki_user_FK; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_user_FK" ON public.deposit USING btree (user_id);


--
-- TOC entry 3321 (class 1259 OID 25768)
-- Name: fki_userfk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_userfk ON public.deposit USING btree (user_id);


--
-- TOC entry 3344 (class 2620 OID 26034)
-- Name: book sumofbooktrig; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER sumofbooktrig AFTER INSERT ON public.book FOR EACH ROW EXECUTE FUNCTION public.sumofb();


--
-- TOC entry 3345 (class 2620 OID 26049)
-- Name: contact sumofcontacttrig; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER sumofcontacttrig AFTER INSERT ON public.contact FOR EACH ROW EXECUTE FUNCTION public.sumofc();


--
-- TOC entry 3346 (class 2620 OID 26044)
-- Name: library sumoflibrarytrig; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER sumoflibrarytrig AFTER INSERT ON public.library FOR EACH ROW EXECUTE FUNCTION public.sumofl();


--
-- TOC entry 3347 (class 2620 OID 26039)
-- Name: user sumofusertrig; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER sumofusertrig AFTER INSERT ON public."user" FOR EACH ROW EXECUTE FUNCTION public.sumofu();


--
-- TOC entry 3343 (class 2606 OID 25944)
-- Name: academician academicianfk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academician
    ADD CONSTRAINT academicianfk FOREIGN KEY (academician_department) REFERENCES public.department(department_id) NOT VALID;


--
-- TOC entry 3338 (class 2606 OID 25548)
-- Name: library adressfk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.library
    ADD CONSTRAINT adressfk FOREIGN KEY (library_adress) REFERENCES public.adress(adress_id) NOT VALID;


--
-- TOC entry 3331 (class 2606 OID 25518)
-- Name: book authorfk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT authorfk FOREIGN KEY (book_author) REFERENCES public.author(author_id) NOT VALID;


--
-- TOC entry 3342 (class 2606 OID 25938)
-- Name: student departmentFk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT "departmentFk" FOREIGN KEY (student_department) REFERENCES public.department(department_id) NOT VALID;


--
-- TOC entry 3337 (class 2606 OID 25645)
-- Name: department facultyfk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT facultyfk FOREIGN KEY (faculty_id) REFERENCES public.faculty(faculty_id) NOT VALID;


--
-- TOC entry 3334 (class 2606 OID 25985)
-- Name: book languageFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT "languageFK" FOREIGN KEY (book_language) REFERENCES public.language(language_id) NOT VALID;


--
-- TOC entry 3341 (class 2606 OID 25769)
-- Name: shelf librarFk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shelf
    ADD CONSTRAINT "librarFk" FOREIGN KEY (library_id) REFERENCES public.library(library_id) NOT VALID;


--
-- TOC entry 3332 (class 2606 OID 25524)
-- Name: book publisherfk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT publisherfk FOREIGN KEY (book_publisher) REFERENCES public.publisher(publisher_id) NOT VALID;


--
-- TOC entry 3339 (class 2606 OID 25554)
-- Name: publisher publisherfk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publisher
    ADD CONSTRAINT publisherfk FOREIGN KEY (publisher_adress) REFERENCES public.adress(adress_id) NOT VALID;


--
-- TOC entry 3333 (class 2606 OID 25975)
-- Name: book sectionfk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT sectionfk FOREIGN KEY (book_section) REFERENCES public.section(section_id) NOT VALID;


--
-- TOC entry 3335 (class 2606 OID 26050)
-- Name: catagory sectionfk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catagory
    ADD CONSTRAINT sectionfk FOREIGN KEY (section_id) REFERENCES public.section(section_id) NOT VALID;


--
-- TOC entry 3336 (class 2606 OID 25757)
-- Name: contact userFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact
    ADD CONSTRAINT "userFK" FOREIGN KEY (user_id) REFERENCES public."user"(user_id) NOT VALID;


--
-- TOC entry 3340 (class 2606 OID 26055)
-- Name: deposit user_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deposit
    ADD CONSTRAINT "user_FK" FOREIGN KEY (user_id) REFERENCES public."user"(user_id) NOT VALID;


-- Completed on 2022-12-28 00:06:25

--
-- PostgreSQL database dump complete
--


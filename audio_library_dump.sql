--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

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

--
-- Name: get_tracks_by_album(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_tracks_by_album(album_id integer) RETURNS TABLE(nazvanie character varying, duration interval)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT Nazvanie, Duration
    FROM TRACK
    WHERE ID_aliboma = album_id;
END;
$$;


ALTER FUNCTION public.get_tracks_by_album(album_id integer) OWNER TO postgres;

--
-- Name: update_track_count(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_track_count() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE Alibom
    SET Track_Count = (SELECT COUNT(*) FROM TRACK WHERE ID_aliboma = NEW.ID_aliboma)
    WHERE ID_aliboma = NEW.ID_aliboma;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.update_track_count() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alibom; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alibom (
    id_aliboma integer NOT NULL,
    nazvanie character varying(255) NOT NULL,
    god_vipyska integer,
    id_ispol integer,
    id_zhanra integer,
    oblozhka character varying(255),
    producer character varying(255),
    track_count integer,
    CONSTRAINT alibom_god_vipyska_check CHECK (((god_vipyska >= 1900) AND ((god_vipyska)::numeric <= EXTRACT(year FROM CURRENT_DATE))))
);


ALTER TABLE public.alibom OWNER TO postgres;

--
-- Name: alibom_id_aliboma_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.alibom_id_aliboma_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.alibom_id_aliboma_seq OWNER TO postgres;

--
-- Name: alibom_id_aliboma_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alibom_id_aliboma_seq OWNED BY public.alibom.id_aliboma;


--
-- Name: ispolnitel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ispolnitel (
    id_ispol integer NOT NULL,
    name character varying(255) NOT NULL,
    strana character varying(255),
    dr date,
    biografia text,
    country character varying(255)
);


ALTER TABLE public.ispolnitel OWNER TO postgres;

--
-- Name: ispolnitel_id_ispol_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ispolnitel_id_ispol_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ispolnitel_id_ispol_seq OWNER TO postgres;

--
-- Name: ispolnitel_id_ispol_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ispolnitel_id_ispol_seq OWNED BY public.ispolnitel.id_ispol;


--
-- Name: track; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.track (
    id_track integer NOT NULL,
    nazvanie character varying(255) NOT NULL,
    dlitel interval,
    nomer_v_alibome integer,
    id_aliboma integer,
    fail character varying(255),
    duration interval NOT NULL
);


ALTER TABLE public.track OWNER TO postgres;

--
-- Name: track_id_track_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.track_id_track_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.track_id_track_seq OWNER TO postgres;

--
-- Name: track_id_track_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.track_id_track_seq OWNED BY public.track.id_track;


--
-- Name: zhanr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.zhanr (
    id_zhanra integer NOT NULL,
    nazvanie character varying(255) NOT NULL,
    opisanie text,
    popularity integer
);


ALTER TABLE public.zhanr OWNER TO postgres;

--
-- Name: vyuha_alibomy; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vyuha_alibomy AS
 SELECT alibom.nazvanie AS album,
    ispolnitel.name AS artist,
    zhanr.nazvanie AS genre,
    alibom.god_vipyska AS release_year
   FROM ((public.alibom
     JOIN public.ispolnitel ON ((alibom.id_ispol = ispolnitel.id_ispol)))
     JOIN public.zhanr ON ((alibom.id_zhanra = zhanr.id_zhanra)));


ALTER VIEW public.vyuha_alibomy OWNER TO postgres;

--
-- Name: zhanr_id_zhanra_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.zhanr_id_zhanra_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.zhanr_id_zhanra_seq OWNER TO postgres;

--
-- Name: zhanr_id_zhanra_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.zhanr_id_zhanra_seq OWNED BY public.zhanr.id_zhanra;


--
-- Name: alibom id_aliboma; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alibom ALTER COLUMN id_aliboma SET DEFAULT nextval('public.alibom_id_aliboma_seq'::regclass);


--
-- Name: ispolnitel id_ispol; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ispolnitel ALTER COLUMN id_ispol SET DEFAULT nextval('public.ispolnitel_id_ispol_seq'::regclass);


--
-- Name: track id_track; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.track ALTER COLUMN id_track SET DEFAULT nextval('public.track_id_track_seq'::regclass);


--
-- Name: zhanr id_zhanra; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zhanr ALTER COLUMN id_zhanra SET DEFAULT nextval('public.zhanr_id_zhanra_seq'::regclass);


--
-- Data for Name: alibom; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alibom (id_aliboma, nazvanie, god_vipyska, id_ispol, id_zhanra, oblozhka, producer, track_count) FROM stdin;
1	Abbey Road	1969	1	1	images/abbey_road.jpg	George Martin	1
\.


--
-- Data for Name: ispolnitel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ispolnitel (id_ispol, name, strana, dr, biografia, country) FROM stdin;
1	The Beatles	‚Ґ«ЁЄ®ЎаЁв ­Ёп	1960-01-01	‹ҐЈҐ­¤ а­ п а®Є-ЈагЇЇ .	UK
\.


--
-- Data for Name: track; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.track (id_track, nazvanie, dlitel, nomer_v_alibome, id_aliboma, fail, duration) FROM stdin;
1	Come Together	00:04:20	1	1	path/to/come_together.mp3	00:04:20
\.


--
-- Data for Name: zhanr; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.zhanr (id_zhanra, nazvanie, opisanie, popularity) FROM stdin;
1	Rock	† ­а, е а ЄвҐаЁ§гойЁ©бп ЁбЇ®«м§®ў ­ЁҐ¬ н«ҐЄва®ЈЁв а.	5
\.


--
-- Name: alibom_id_aliboma_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.alibom_id_aliboma_seq', 1, true);


--
-- Name: ispolnitel_id_ispol_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ispolnitel_id_ispol_seq', 1, true);


--
-- Name: track_id_track_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.track_id_track_seq', 1, true);


--
-- Name: zhanr_id_zhanra_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.zhanr_id_zhanra_seq', 1, true);


--
-- Name: alibom alibom_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alibom
    ADD CONSTRAINT alibom_pkey PRIMARY KEY (id_aliboma);


--
-- Name: ispolnitel ispolnitel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ispolnitel
    ADD CONSTRAINT ispolnitel_pkey PRIMARY KEY (id_ispol);


--
-- Name: track track_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.track
    ADD CONSTRAINT track_pkey PRIMARY KEY (id_track);


--
-- Name: zhanr zhanr_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zhanr
    ADD CONSTRAINT zhanr_pkey PRIMARY KEY (id_zhanra);


--
-- Name: idx_alibom_nazvanie; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_alibom_nazvanie ON public.alibom USING btree (nazvanie);


--
-- Name: idx_ispolnitel_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ispolnitel_name ON public.ispolnitel USING btree (name);


--
-- Name: idx_zhanr_nazvanie; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_zhanr_nazvanie ON public.zhanr USING btree (nazvanie);


--
-- Name: track trigger_update_track_count; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trigger_update_track_count AFTER INSERT OR DELETE ON public.track FOR EACH ROW EXECUTE FUNCTION public.update_track_count();


--
-- Name: alibom alibom_id_ispol_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alibom
    ADD CONSTRAINT alibom_id_ispol_fkey FOREIGN KEY (id_ispol) REFERENCES public.ispolnitel(id_ispol);


--
-- Name: alibom alibom_id_zhanra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alibom
    ADD CONSTRAINT alibom_id_zhanra_fkey FOREIGN KEY (id_zhanra) REFERENCES public.zhanr(id_zhanra);


--
-- Name: track track_id_aliboma_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.track
    ADD CONSTRAINT track_id_aliboma_fkey FOREIGN KEY (id_aliboma) REFERENCES public.alibom(id_aliboma);


--
-- PostgreSQL database dump complete
--


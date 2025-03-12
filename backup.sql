--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

-- Started on 2025-03-12 22:48:50

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
-- TOC entry 222 (class 1259 OID 16661)
-- Name: albums; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.albums (
    albumid integer NOT NULL,
    title character varying(255) NOT NULL,
    releaseyear integer,
    coverimage character varying(255),
    artistid integer NOT NULL,
    genreid integer NOT NULL
);


ALTER TABLE public.albums OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16660)
-- Name: albums_albumid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.albums_albumid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.albums_albumid_seq OWNER TO postgres;

--
-- TOC entry 4857 (class 0 OID 0)
-- Dependencies: 221
-- Name: albums_albumid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.albums_albumid_seq OWNED BY public.albums.albumid;


--
-- TOC entry 218 (class 1259 OID 16643)
-- Name: artists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.artists (
    artistid integer NOT NULL,
    name character varying(255) NOT NULL,
    country character varying(100),
    birthdate date,
    biography text
);


ALTER TABLE public.artists OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16642)
-- Name: artists_artistid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.artists_artistid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.artists_artistid_seq OWNER TO postgres;

--
-- TOC entry 4858 (class 0 OID 0)
-- Dependencies: 217
-- Name: artists_artistid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.artists_artistid_seq OWNED BY public.artists.artistid;


--
-- TOC entry 228 (class 1259 OID 16709)
-- Name: favorites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.favorites (
    favoriteid integer NOT NULL,
    userid integer,
    trackid integer,
    added_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.favorites OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16708)
-- Name: favorites_favoriteid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.favorites_favoriteid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.favorites_favoriteid_seq OWNER TO postgres;

--
-- TOC entry 4859 (class 0 OID 0)
-- Dependencies: 227
-- Name: favorites_favoriteid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.favorites_favoriteid_seq OWNED BY public.favorites.favoriteid;


--
-- TOC entry 220 (class 1259 OID 16652)
-- Name: genres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genres (
    genreid integer NOT NULL,
    name character varying(100) NOT NULL,
    description text
);


ALTER TABLE public.genres OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16651)
-- Name: genres_genreid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.genres_genreid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.genres_genreid_seq OWNER TO postgres;

--
-- TOC entry 4860 (class 0 OID 0)
-- Dependencies: 219
-- Name: genres_genreid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.genres_genreid_seq OWNED BY public.genres.genreid;


--
-- TOC entry 224 (class 1259 OID 16680)
-- Name: tracks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tracks (
    trackid integer NOT NULL,
    title character varying(255) NOT NULL,
    duration interval,
    tracknumber integer,
    albumid integer NOT NULL,
    filepath character varying(255) NOT NULL
);


ALTER TABLE public.tracks OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16679)
-- Name: tracks_trackid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tracks_trackid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tracks_trackid_seq OWNER TO postgres;

--
-- TOC entry 4861 (class 0 OID 0)
-- Dependencies: 223
-- Name: tracks_trackid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tracks_trackid_seq OWNED BY public.tracks.trackid;


--
-- TOC entry 226 (class 1259 OID 16695)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    userid integer NOT NULL,
    username character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password_hash character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16694)
-- Name: users_userid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_userid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_userid_seq OWNER TO postgres;

--
-- TOC entry 4862 (class 0 OID 0)
-- Dependencies: 225
-- Name: users_userid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_userid_seq OWNED BY public.users.userid;


--
-- TOC entry 4668 (class 2604 OID 16664)
-- Name: albums albumid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.albums ALTER COLUMN albumid SET DEFAULT nextval('public.albums_albumid_seq'::regclass);


--
-- TOC entry 4666 (class 2604 OID 16646)
-- Name: artists artistid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists ALTER COLUMN artistid SET DEFAULT nextval('public.artists_artistid_seq'::regclass);


--
-- TOC entry 4672 (class 2604 OID 16712)
-- Name: favorites favoriteid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorites ALTER COLUMN favoriteid SET DEFAULT nextval('public.favorites_favoriteid_seq'::regclass);


--
-- TOC entry 4667 (class 2604 OID 16655)
-- Name: genres genreid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genres ALTER COLUMN genreid SET DEFAULT nextval('public.genres_genreid_seq'::regclass);


--
-- TOC entry 4669 (class 2604 OID 16683)
-- Name: tracks trackid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracks ALTER COLUMN trackid SET DEFAULT nextval('public.tracks_trackid_seq'::regclass);


--
-- TOC entry 4670 (class 2604 OID 16698)
-- Name: users userid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN userid SET DEFAULT nextval('public.users_userid_seq'::regclass);


--
-- TOC entry 4845 (class 0 OID 16661)
-- Dependencies: 222
-- Data for Name: albums; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.albums (albumid, title, releaseyear, coverimage, artistid, genreid) FROM stdin;
1	Abbey Road	1969	images/abbey_road.jpg	1	1
2	Thriller	1982	images/thriller.jpg	2	2
\.


--
-- TOC entry 4841 (class 0 OID 16643)
-- Dependencies: 218
-- Data for Name: artists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.artists (artistid, name, country, birthdate, biography) FROM stdin;
1	The Beatles	UK	1960-01-01	Легендарная британская рок-группа.
2	Michael Jackson	USA	1958-08-29	Король поп-музыки.
\.


--
-- TOC entry 4851 (class 0 OID 16709)
-- Dependencies: 228
-- Data for Name: favorites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.favorites (favoriteid, userid, trackid, added_at) FROM stdin;
1	1	1	2025-03-12 19:57:20.360763
2	1	2	2025-03-12 19:57:20.360763
5	1	3	2025-03-12 20:18:51.048925
\.


--
-- TOC entry 4843 (class 0 OID 16652)
-- Dependencies: 220
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.genres (genreid, name, description) FROM stdin;
1	Rock	Рок-музыка.
2	Pop	Поп-музыка.
\.


--
-- TOC entry 4847 (class 0 OID 16680)
-- Dependencies: 224
-- Data for Name: tracks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tracks (trackid, title, duration, tracknumber, albumid, filepath) FROM stdin;
1	Come Together	00:04:20	1	1	audio/come_together.mp3
2	Something	00:03:03	2	1	audio/something.mp3
3	Billie Jean	00:04:54	1	2	audio/billie_jean.mp3
4	Beat It	00:04:18	2	2	audio/beat_it.mp3
\.


--
-- TOC entry 4849 (class 0 OID 16695)
-- Dependencies: 226
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (userid, username, email, password_hash, created_at) FROM stdin;
1	john_doe	john@example.com	hashed_password_123	2025-03-12 19:49:12.944359
\.


--
-- TOC entry 4863 (class 0 OID 0)
-- Dependencies: 221
-- Name: albums_albumid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.albums_albumid_seq', 2, true);


--
-- TOC entry 4864 (class 0 OID 0)
-- Dependencies: 217
-- Name: artists_artistid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.artists_artistid_seq', 2, true);


--
-- TOC entry 4865 (class 0 OID 0)
-- Dependencies: 227
-- Name: favorites_favoriteid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.favorites_favoriteid_seq', 5, true);


--
-- TOC entry 4866 (class 0 OID 0)
-- Dependencies: 219
-- Name: genres_genreid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.genres_genreid_seq', 2, true);


--
-- TOC entry 4867 (class 0 OID 0)
-- Dependencies: 223
-- Name: tracks_trackid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tracks_trackid_seq', 4, true);


--
-- TOC entry 4868 (class 0 OID 0)
-- Dependencies: 225
-- Name: users_userid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_userid_seq', 1, true);


--
-- TOC entry 4679 (class 2606 OID 16668)
-- Name: albums albums_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_pkey PRIMARY KEY (albumid);


--
-- TOC entry 4675 (class 2606 OID 16650)
-- Name: artists artists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists
    ADD CONSTRAINT artists_pkey PRIMARY KEY (artistid);


--
-- TOC entry 4689 (class 2606 OID 16715)
-- Name: favorites favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_pkey PRIMARY KEY (favoriteid);


--
-- TOC entry 4677 (class 2606 OID 16659)
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (genreid);


--
-- TOC entry 4681 (class 2606 OID 16687)
-- Name: tracks tracks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracks
    ADD CONSTRAINT tracks_pkey PRIMARY KEY (trackid);


--
-- TOC entry 4683 (class 2606 OID 16707)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 4685 (class 2606 OID 16703)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);


--
-- TOC entry 4687 (class 2606 OID 16705)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 4690 (class 2606 OID 16669)
-- Name: albums albums_artistid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_artistid_fkey FOREIGN KEY (artistid) REFERENCES public.artists(artistid);


--
-- TOC entry 4691 (class 2606 OID 16674)
-- Name: albums albums_genreid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_genreid_fkey FOREIGN KEY (genreid) REFERENCES public.genres(genreid);


--
-- TOC entry 4693 (class 2606 OID 16721)
-- Name: favorites favorites_trackid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_trackid_fkey FOREIGN KEY (trackid) REFERENCES public.tracks(trackid) ON DELETE CASCADE;


--
-- TOC entry 4694 (class 2606 OID 16716)
-- Name: favorites favorites_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(userid) ON DELETE CASCADE;


--
-- TOC entry 4692 (class 2606 OID 16688)
-- Name: tracks tracks_albumid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracks
    ADD CONSTRAINT tracks_albumid_fkey FOREIGN KEY (albumid) REFERENCES public.albums(albumid);


-- Completed on 2025-03-12 22:48:52

--
-- PostgreSQL database dump complete
--


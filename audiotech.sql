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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: audiofiles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.audiofiles (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    artist character varying(100),
    album character varying(100),
    file_path character varying(255) NOT NULL,
    uploaded_by integer,
    file_url text
);


--
-- Name: audiofiles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.audiofiles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: audiofiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.audiofiles_id_seq OWNED BY public.audiofiles.id;


--
-- Name: audiogenres; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.audiogenres (
    audio_id integer NOT NULL,
    genre_id integer NOT NULL
);


--
-- Name: comments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    audio_id integer,
    user_id integer,
    text text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: genres; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.genres (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


--
-- Name: genres_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.genres_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: genres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.genres_id_seq OWNED BY public.genres.id;


--
-- Name: likes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.likes (
    audio_id integer NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: playlistaudio; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.playlistaudio (
    playlist_id integer NOT NULL,
    audio_id integer NOT NULL
);


--
-- Name: playlists; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.playlists (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    user_id integer
);


--
-- Name: playlists_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.playlists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: playlists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.playlists_id_seq OWNED BY public.playlists.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(255) NOT NULL,
    role character varying(10) NOT NULL,
    CONSTRAINT users_role_check CHECK (((role)::text = ANY ((ARRAY['user'::character varying, 'admin'::character varying])::text[])))
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: audiofiles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.audiofiles ALTER COLUMN id SET DEFAULT nextval('public.audiofiles_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: genres id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genres ALTER COLUMN id SET DEFAULT nextval('public.genres_id_seq'::regclass);


--
-- Name: playlists id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.playlists ALTER COLUMN id SET DEFAULT nextval('public.playlists_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: audiofiles; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.audiofiles (id, title, artist, album, file_path, uploaded_by, file_url) VALUES (18, 'Shape of You', 'Ed Sheeran', '÷ (Divide)', '/static/audio/new_shape_of_you.mp3', 2, NULL);
INSERT INTO public.audiofiles (id, title, artist, album, file_path, uploaded_by, file_url) VALUES (19, 'Smells Like Teen Spirit', 'Nirvana', 'Nevermind', '/static/audio/new_smells_like_teen_spirit.mp3', 1, NULL);
INSERT INTO public.audiofiles (id, title, artist, album, file_path, uploaded_by, file_url) VALUES (20, 'Rolling in the Deep', 'Adele', '21', '/static/audio/new_rolling_in_the_deep.mp3', 2, NULL);
INSERT INTO public.audiofiles (id, title, artist, album, file_path, uploaded_by, file_url) VALUES (21, 'Billie Jean', 'Michael Jackson', 'Thriller', '/static/audio/new_billie_jean.mp3', 1, NULL);
INSERT INTO public.audiofiles (id, title, artist, album, file_path, uploaded_by, file_url) VALUES (22, 'Hotel California', 'Eagles', 'Hotel California', '/static/audio/new_hotel_california.mp3', 2, NULL);
INSERT INTO public.audiofiles (id, title, artist, album, file_path, uploaded_by, file_url) VALUES (23, 'Stairway to Heaven', 'Led Zeppelin', 'Led Zeppelin IV', '/static/audio/new_stairway_to_heaven.mp3', 1, NULL);
INSERT INTO public.audiofiles (id, title, artist, album, file_path, uploaded_by, file_url) VALUES (24, 'Uptown Funk', 'Mark Ronson ft. Bruno Mars', 'Uptown Special', '/static/audio/new_uptown_funk.mp3', 2, NULL);
INSERT INTO public.audiofiles (id, title, artist, album, file_path, uploaded_by, file_url) VALUES (25, 'Shape of My Heart', 'Sting', 'Ten Summoner''s Tales', '/static/audio/new_shape_of_my_heart.mp3', 1, NULL);
INSERT INTO public.audiofiles (id, title, artist, album, file_path, uploaded_by, file_url) VALUES (26, 'Sweet Child o'' Mine', 'Guns N'' Roses', 'Appetite for Destruction', '/static/audio/new_sweet_child_o_mine.mp3', 2, NULL);
INSERT INTO public.audiofiles (id, title, artist, album, file_path, uploaded_by, file_url) VALUES (17, 'Bohemian Rhapsody', 'Queen', 'A Night at the Opera', '/static/audio/new_bohemian_rhapsody.mp3', 1, NULL);


--
-- Data for Name: audiogenres; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.genres (id, name) VALUES (8, 'Рок');
INSERT INTO public.genres (id, name) VALUES (9, 'Поп');
INSERT INTO public.genres (id, name) VALUES (10, 'Гранж');
INSERT INTO public.genres (id, name) VALUES (11, 'Соул');
INSERT INTO public.genres (id, name) VALUES (12, 'Фанк');
INSERT INTO public.genres (id, name) VALUES (13, 'Джаз');
INSERT INTO public.genres (id, name) VALUES (14, 'Хард-рок');


--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: playlistaudio; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.playlistaudio (playlist_id, audio_id) VALUES (3, 21);


--
-- Data for Name: playlists; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.playlists (id, name, user_id) VALUES (3, 'Моя музыка', 2);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users (id, username, password, role) VALUES (1, 'admin', 'admin123', 'admin');
INSERT INTO public.users (id, username, password, role) VALUES (2, 'user1', 'user123', 'user');
INSERT INTO public.users (id, username, password, role) VALUES (3, 'user2', 'user456', 'user');


--
-- Name: audiofiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.audiofiles_id_seq', 26, true);


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.comments_id_seq', 1, true);


--
-- Name: genres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.genres_id_seq', 14, true);


--
-- Name: playlists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.playlists_id_seq', 3, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- Name: audiofiles audiofiles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.audiofiles
    ADD CONSTRAINT audiofiles_pkey PRIMARY KEY (id);


--
-- Name: audiogenres audiogenres_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.audiogenres
    ADD CONSTRAINT audiogenres_pkey PRIMARY KEY (audio_id, genre_id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: genres genres_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_name_key UNIQUE (name);


--
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (id);


--
-- Name: likes likes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (audio_id, user_id);


--
-- Name: playlistaudio playlistaudio_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.playlistaudio
    ADD CONSTRAINT playlistaudio_pkey PRIMARY KEY (playlist_id, audio_id);


--
-- Name: playlists playlists_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.playlists
    ADD CONSTRAINT playlists_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: audiofiles audiofiles_uploaded_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.audiofiles
    ADD CONSTRAINT audiofiles_uploaded_by_fkey FOREIGN KEY (uploaded_by) REFERENCES public.users(id);


--
-- Name: audiogenres audiogenres_audio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.audiogenres
    ADD CONSTRAINT audiogenres_audio_id_fkey FOREIGN KEY (audio_id) REFERENCES public.audiofiles(id) ON DELETE CASCADE;


--
-- Name: audiogenres audiogenres_genre_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.audiogenres
    ADD CONSTRAINT audiogenres_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES public.genres(id) ON DELETE CASCADE;


--
-- Name: comments comments_audio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_audio_id_fkey FOREIGN KEY (audio_id) REFERENCES public.audiofiles(id) ON DELETE CASCADE;


--
-- Name: comments comments_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: likes likes_audio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_audio_id_fkey FOREIGN KEY (audio_id) REFERENCES public.audiofiles(id) ON DELETE CASCADE;


--
-- Name: likes likes_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: playlistaudio playlistaudio_audio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.playlistaudio
    ADD CONSTRAINT playlistaudio_audio_id_fkey FOREIGN KEY (audio_id) REFERENCES public.audiofiles(id);


--
-- Name: playlistaudio playlistaudio_playlist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.playlistaudio
    ADD CONSTRAINT playlistaudio_playlist_id_fkey FOREIGN KEY (playlist_id) REFERENCES public.playlists(id);


--
-- Name: playlists playlists_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.playlists
    ADD CONSTRAINT playlists_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--


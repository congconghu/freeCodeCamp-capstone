--
-- PostgreSQL database dump
--

-- Dumped from database version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer DEFAULT 0
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (91, 'user_1696993345685', 2, 123);
INSERT INTO public.users VALUES (108, 'user_1696993527825', 1, 1);
INSERT INTO public.users VALUES (90, 'user_1696993345686', 5, 519);
INSERT INTO public.users VALUES (107, 'user_1696993527826', 1, 1);
INSERT INTO public.users VALUES (94, 'user_1696993365924', 2, 392);
INSERT INTO public.users VALUES (93, 'user_1696993365925', 5, 468);
INSERT INTO public.users VALUES (92, 'minnzy', 2, 2);
INSERT INTO public.users VALUES (110, 'user_1696993538376', 1, 1);
INSERT INTO public.users VALUES (96, 'user_1696993432108', 2, 139);
INSERT INTO public.users VALUES (95, 'user_1696993432109', 5, 372);
INSERT INTO public.users VALUES (109, 'user_1696993538377', 1, 1);
INSERT INTO public.users VALUES (98, 'user_1696993437052', 2, 101);
INSERT INTO public.users VALUES (97, 'user_1696993437053', 5, 212);
INSERT INTO public.users VALUES (112, 'user_1696993545468', 1, 100);
INSERT INTO public.users VALUES (100, 'user_1696993449621', 2, 329);
INSERT INTO public.users VALUES (111, 'user_1696993545469', 1, 151);
INSERT INTO public.users VALUES (99, 'user_1696993449622', 5, 174);
INSERT INTO public.users VALUES (102, 'user_1696993465407', 2, 173);
INSERT INTO public.users VALUES (101, 'user_1696993465408', 5, 218);
INSERT INTO public.users VALUES (114, 'user_1696993617377', 2, 438);
INSERT INTO public.users VALUES (104, 'user_1696993487215', 1, 1);
INSERT INTO public.users VALUES (113, 'user_1696993617378', 5, 232);
INSERT INTO public.users VALUES (103, 'user_1696993487216', 1, 1);
INSERT INTO public.users VALUES (106, 'user_1696993507074', 1, 165);
INSERT INTO public.users VALUES (116, 'user_1696993642738', 2, 860);
INSERT INTO public.users VALUES (105, 'user_1696993507075', 1, 1);
INSERT INTO public.users VALUES (115, 'user_1696993642739', 5, 166);
INSERT INTO public.users VALUES (118, 'user_1696993657273', 2, 218);
INSERT INTO public.users VALUES (117, 'user_1696993657274', 5, 246);
INSERT INTO public.users VALUES (89, 'minzy', 3, 1);
INSERT INTO public.users VALUES (120, 'user_1696993787942', 2, 363);
INSERT INTO public.users VALUES (119, 'user_1696993787943', 5, 342);
INSERT INTO public.users VALUES (122, 'user_1696993825557', 2, 576);
INSERT INTO public.users VALUES (121, 'user_1696993825558', 5, 634);
INSERT INTO public.users VALUES (124, 'user_1696993872426', 2, 255);
INSERT INTO public.users VALUES (123, 'user_1696993872427', 5, 21);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 124, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: users users_username_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key1 UNIQUE (username);


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: number_guess; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.number_guess (
    username character varying(22),
    games_played integer NOT NULL
);


ALTER TABLE public.number_guess OWNER TO freecodecamp;

--
-- Data for Name: number_guess; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.number_guess VALUES ('user_1747832140369', 854);
INSERT INTO public.number_guess VALUES ('user_1747832140369', 534);
INSERT INTO public.number_guess VALUES ('user_1747832140368', 600);
INSERT INTO public.number_guess VALUES ('user_1747832140368', 458);
INSERT INTO public.number_guess VALUES ('user_1747832140369', 254);
INSERT INTO public.number_guess VALUES ('user_1747832140369', 405);
INSERT INTO public.number_guess VALUES ('user_1747832140369', 281);
INSERT INTO public.number_guess VALUES ('user_1747832293184', 994);
INSERT INTO public.number_guess VALUES ('user_1747832293184', 924);
INSERT INTO public.number_guess VALUES ('user_1747832293183', 491);
INSERT INTO public.number_guess VALUES ('user_1747832293183', 619);
INSERT INTO public.number_guess VALUES ('user_1747832293184', 155);
INSERT INTO public.number_guess VALUES ('user_1747832293184', 941);
INSERT INTO public.number_guess VALUES ('user_1747832293184', 137);
INSERT INTO public.number_guess VALUES ('user_1747832330522', 757);
INSERT INTO public.number_guess VALUES ('user_1747832330522', 464);
INSERT INTO public.number_guess VALUES ('user_1747832330521', 49);
INSERT INTO public.number_guess VALUES ('user_1747832330521', 239);
INSERT INTO public.number_guess VALUES ('user_1747832330522', 52);
INSERT INTO public.number_guess VALUES ('user_1747832330522', 126);
INSERT INTO public.number_guess VALUES ('user_1747832330522', 669);
INSERT INTO public.number_guess VALUES ('user_1747832384832', 643);
INSERT INTO public.number_guess VALUES ('user_1747832384832', 199);
INSERT INTO public.number_guess VALUES ('user_1747832384831', 265);
INSERT INTO public.number_guess VALUES ('user_1747832384831', 789);
INSERT INTO public.number_guess VALUES ('user_1747832384832', 787);
INSERT INTO public.number_guess VALUES ('user_1747832384832', 104);
INSERT INTO public.number_guess VALUES ('user_1747832384832', 971);


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--

-- Dumped from database version 12.10 (Ubuntu 12.10-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.10 (Ubuntu 12.10-0ubuntu0.20.04.1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean NOT NULL,
    light_years_from_earth_in_millions numeric(5,3),
    has_supermasive_black_hole boolean NOT NULL,
    notes text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_spherical boolean,
    distance_from_planet numeric NOT NULL,
    radius_in_km integer NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer,
    description text,
    has_life boolean NOT NULL,
    age_in_millions_of_years integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying(50) NOT NULL,
    notes text NOT NULL
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_types_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_types_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    density numeric,
    median_distance numeric
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_planet_types_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy', false, 42.120, true, NULL);
INSERT INTO public.galaxy VALUES (2, 'Anteanne Galaxy', false, 14.400, false, NULL);
INSERT INTO public.galaxy VALUES (3, 'Backward Galaxy', true, 28.330, true, NULL);
INSERT INTO public.galaxy VALUES (4, 'Medusa Merger', true, 12.850, false, NULL);
INSERT INTO public.galaxy VALUES (5, 'Fireworks Galaxy', false, 8.430, false, NULL);
INSERT INTO public.galaxy VALUES (6, 'Little Sombrero Galaxy', true, 11.220, true, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Titan', true, 14.2, 4299, 4);
INSERT INTO public.moon VALUES (2, 'Rhea', false, 23.1, 1482, 4);
INSERT INTO public.moon VALUES (3, 'Iapetus', false, 85.2, 1992, 4);
INSERT INTO public.moon VALUES (4, 'Dione', true, 24.1, 4821, 4);
INSERT INTO public.moon VALUES (5, 'Tethys', true, 23.1, 4251, 4);
INSERT INTO public.moon VALUES (6, 'Encealadus', true, 51.12, 6543, 4);
INSERT INTO public.moon VALUES (7, 'Mimas', false, 21.23, 5123, 4);
INSERT INTO public.moon VALUES (8, 'Hyperion', true, 94.22, 7396, 4);
INSERT INTO public.moon VALUES (9, 'Phoebe', false, 45.14, 8512, 4);
INSERT INTO public.moon VALUES (10, 'Janus', true, 58.51, 5823, 4);
INSERT INTO public.moon VALUES (11, 'Epimetheus', false, 58.47, 8157, 4);
INSERT INTO public.moon VALUES (12, 'Prometheus', false, 52.38, 5821, 4);
INSERT INTO public.moon VALUES (13, 'Pandora', true, 58.85, 5182, 4);
INSERT INTO public.moon VALUES (14, 'Helene', false, 28.48, 8512, 4);
INSERT INTO public.moon VALUES (15, 'Ganymede', true, 73.45, 3759, 2);
INSERT INTO public.moon VALUES (16, 'Callisto', false, 44.78, 8342, 2);
INSERT INTO public.moon VALUES (17, 'IO', false, 22.84, 8457, 2);
INSERT INTO public.moon VALUES (18, 'Europa', true, 89.28, 8457, 2);
INSERT INTO public.moon VALUES (19, 'Amalthea', false, 28.38, 1274, 2);
INSERT INTO public.moon VALUES (20, 'Himalta', false, 82.18, 8451, 2);
INSERT INTO public.moon VALUES (21, 'Thebe', true, 82.44, 2841, 2);
INSERT INTO public.moon VALUES (22, 'Elara', false, 28.11, 2842, 2);
INSERT INTO public.moon VALUES (23, 'Metis', true, 18.28, 1823, 2);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 2, 'A very nice planet to live in!', true, 13);
INSERT INTO public.planet VALUES (2, 'Jupiter', 1, 'A nice gas giant', false, 11);
INSERT INTO public.planet VALUES (3, 'Mars', 7, 'Our prospect is to go there', false, 8);
INSERT INTO public.planet VALUES (4, 'Saturn', 7, 'A gas giant', false, 2);
INSERT INTO public.planet VALUES (5, 'Uranus', 2, 'You do not want to go there', true, 67);
INSERT INTO public.planet VALUES (6, 'Nepture', 2, 'It is blue', true, 2);
INSERT INTO public.planet VALUES (7, 'Pluto', 5, 'Bigger than you think', false, 2);
INSERT INTO public.planet VALUES (8, 'Orcus', 2, 'Surprisingly it has a moon', false, 1);
INSERT INTO public.planet VALUES (9, 'Salacia', 3, 'Neighbor with Pluto', true, 7);
INSERT INTO public.planet VALUES (10, 'Haumea', 4, 'An interesting planet', true, 5);
INSERT INTO public.planet VALUES (11, 'Quaoar', 6, 'Has a twin planet', false, 2);
INSERT INTO public.planet VALUES (12, 'Makemake', 1, 'It is very small', true, 5);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'Rocky Type', 'It is rocky');
INSERT INTO public.planet_types VALUES (2, 'Liquid Type', 'It is liquid');
INSERT INTO public.planet_types VALUES (3, 'Gassy Type', 'It is gassy');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'AD Leonis', 2, 83, 23.42, 11.2);
INSERT INTO public.star VALUES (2, 'Gliese 862', 5, 25, 84.55, 73.2);
INSERT INTO public.star VALUES (3, 'Altair', 1, 33, 51.44, 84.22);
INSERT INTO public.star VALUES (4, 'Sigma Draconis', 3, 83, 12.1, 74.23);
INSERT INTO public.star VALUES (5, 'Ross 229', 3, 82, 33.2, 11.2);
INSERT INTO public.star VALUES (6, 'WISEA J283671', 5, 23, 11.2, 44.2);
INSERT INTO public.star VALUES (7, 'The Sun', 1, 32, 22.1, 12.2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_types_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_types planet_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_name_key UNIQUE (name);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


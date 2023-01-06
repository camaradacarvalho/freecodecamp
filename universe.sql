--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(50) NOT NULL,
    galaxy_category_id integer NOT NULL,
    catalog_number text,
    distance_from_earth integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_category; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_category (
    galaxy_category_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.galaxy_category OWNER TO freecodecamp;

--
-- Name: galaxy_category_galaxy_category_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_category_galaxy_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_category_galaxy_category_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_category_galaxy_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_category_galaxy_category_id_seq OWNED BY public.galaxy_category.galaxy_category_id;


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
    name character varying(20) NOT NULL,
    planet_id integer NOT NULL,
    diameter_km integer,
    moon_group text
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
    name character varying(20) NOT NULL,
    star_id integer NOT NULL,
    diameter_km integer,
    gravity numeric(3,2),
    inner_planet boolean,
    dwarf_planet boolean
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    luminosity_class character varying(50),
    distance_from_earth integer
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
-- Name: galaxy_category galaxy_category_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_category ALTER COLUMN galaxy_category_id SET DEFAULT nextval('public.galaxy_category_galaxy_category_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'andromeda', 2, 'NGC224 M31', 248000);
INSERT INTO public.galaxy VALUES (2, 'cygnus a', 4, NULL, 50000000);
INSERT INTO public.galaxy VALUES (3, 'milky way', 2, NULL, 0);
INSERT INTO public.galaxy VALUES (4, 'virgo a', 1, 'NGC4486 M87', 55000000);
INSERT INTO public.galaxy VALUES (5, 'lmc', 3, NULL, 160000);
INSERT INTO public.galaxy VALUES (6, 'smc', 3, NULL, 190000);
INSERT INTO public.galaxy VALUES (7, 'canis major', 4, NULL, 25000);


--
-- Data for Name: galaxy_category; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_category VALUES (1, 'elliptical', 'nearly circular to very elongated');
INSERT INTO public.galaxy_category VALUES (2, 'spiral', 'flat disks of stars, gas and dust');
INSERT INTO public.galaxy_category VALUES (3, 'irregular', 'very little dust');
INSERT INTO public.galaxy_category VALUES (4, 'other', 'in a transitory phase');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'metis', 5, 44, 'amalthea');
INSERT INTO public.moon VALUES (2, 'adrastea', 5, 16, 'amalthea');
INSERT INTO public.moon VALUES (3, 'amalthea', 5, 168, 'amalthea');
INSERT INTO public.moon VALUES (4, 'thebe', 5, 98, 'amalthea');
INSERT INTO public.moon VALUES (5, 'io', 5, 3643, 'galilean');
INSERT INTO public.moon VALUES (6, 'europa', 5, 3122, 'galilean');
INSERT INTO public.moon VALUES (7, 'ganymede', 5, 5262, 'galilean');
INSERT INTO public.moon VALUES (8, 'callisto', 5, 4821, 'galilean');
INSERT INTO public.moon VALUES (9, 'themisto', 5, 9, NULL);
INSERT INTO public.moon VALUES (10, 'carpo', 5, 3, NULL);
INSERT INTO public.moon VALUES (11, 'leda', 5, 18, 'himalaia');
INSERT INTO public.moon VALUES (12, 'himalaia', 5, 160, 'himalaia');
INSERT INTO public.moon VALUES (13, 'lysithea', 5, 38, 'himalaia');
INSERT INTO public.moon VALUES (14, 'elara', 5, 78, 'himalaia');
INSERT INTO public.moon VALUES (15, 'euporie', 5, 2, 'ananke');
INSERT INTO public.moon VALUES (16, 'thelxinoe', 5, 2, 'ananke');
INSERT INTO public.moon VALUES (17, 'euanthe', 5, 3, 'ananke');
INSERT INTO public.moon VALUES (18, 'helike', 5, 4, 'ananke');
INSERT INTO public.moon VALUES (19, 'orthosie', 5, 2, 'ananke');
INSERT INTO public.moon VALUES (20, 'iocaste', 5, 5, 'ananke');
INSERT INTO public.moon VALUES (21, 'mneme', 5, 2, 'ananke');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'mercury', 4, 4879, 0.38, true, false);
INSERT INTO public.planet VALUES (2, 'venus', 4, 12104, 0.91, true, false);
INSERT INTO public.planet VALUES (3, 'earth', 4, 12742, 1.00, true, false);
INSERT INTO public.planet VALUES (4, 'mars', 4, 6779, 0.38, true, false);
INSERT INTO public.planet VALUES (5, 'jupiter', 4, 139822, 2.36, false, false);
INSERT INTO public.planet VALUES (6, 'saturn', 4, 120536, 0.92, false, false);
INSERT INTO public.planet VALUES (7, 'uranus', 4, 50724, 0.89, false, false);
INSERT INTO public.planet VALUES (8, 'neptune', 4, 49244, 1.12, false, false);
INSERT INTO public.planet VALUES (9, 'ceres', 4, 939, NULL, false, true);
INSERT INTO public.planet VALUES (10, 'pluto', 4, 2376, NULL, false, true);
INSERT INTO public.planet VALUES (11, 'haumea', 4, 1632, NULL, false, true);
INSERT INTO public.planet VALUES (12, 'makemake', 4, 1434, NULL, false, true);
INSERT INTO public.planet VALUES (13, 'eris', 4, 2326, NULL, false, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'ross 154', 3, 'red dwarf', 10);
INSERT INTO public.star VALUES (2, 'sirius 2', 3, 'white dwarf', 9);
INSERT INTO public.star VALUES (3, 'wolf 359', 3, 'red dwarf', 8);
INSERT INTO public.star VALUES (4, 'sol', 3, 'yellow-orange dwarf', 0);
INSERT INTO public.star VALUES (5, 'lalande 21185', 3, 'red dwarf', 16);
INSERT INTO public.star VALUES (6, 'ross 248', 3, 'red dwarf', 10);


--
-- Name: galaxy_category_galaxy_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_category_galaxy_category_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy_category galaxy_category_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_category
    ADD CONSTRAINT galaxy_category_name_key UNIQUE (name);


--
-- Name: galaxy_category galaxy_category_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_category
    ADD CONSTRAINT galaxy_category_pkey PRIMARY KEY (galaxy_category_id);


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
-- Name: planet planet_pk; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pk PRIMARY KEY (planet_id);


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
-- Name: galaxy fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_category_id) REFERENCES public.galaxy_category(galaxy_category_id);


--
-- Name: star fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_fk FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_fk FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--


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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(60) NOT NULL,
    brightest_star character varying(30)
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_in_kpc integer,
    size_in_kpc numeric(4,2),
    constellation_id integer,
    wikipedia_entry text NOT NULL
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
    planet_id integer NOT NULL,
    visited_by_humans boolean,
    semimajor_axis_in_km numeric,
    orbital_period_in_earth_days numeric,
    mean_radius_in_km numeric
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
    star_id integer NOT NULL,
    mass_in_jovian_mass numeric,
    semimajor_axis_in_au numeric,
    orbital_period_in_earth_days integer,
    visited_by_humans boolean
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
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    constellation_id integer,
    distance_from_earth_in_ly integer,
    mass_in_solar_mass numeric,
    radius_in_solar_radius numeric
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (4, 'Antlia', NULL);
INSERT INTO public.constellation VALUES (1, 'Sagittarius', 'Epsilon Sagittarii');
INSERT INTO public.constellation VALUES (2, 'Andromeda', 'Alpheratz');
INSERT INTO public.constellation VALUES (3, 'Triangulum', 'B Trianguli');
INSERT INTO public.constellation VALUES (5, 'Sextans', 'A Sextantis');
INSERT INTO public.constellation VALUES (6, 'Virgo', 'Spica');
INSERT INTO public.constellation VALUES (7, 'Cygnus', 'Deneb');
INSERT INTO public.constellation VALUES (8, 'Centaurus', 'Rigil Kentaurus');
INSERT INTO public.constellation VALUES (9, 'Libra', 'Beta Librae');
INSERT INTO public.constellation VALUES (10, 'Draco', 'Eltanin');
INSERT INTO public.constellation VALUES (11, 'Aquarius', 'Sadalsuud');
INSERT INTO public.constellation VALUES (12, 'Gemini', 'Pollux');
INSERT INTO public.constellation VALUES (13, 'Auriga', 'Capella');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 8, 26.80, 1, 'http');
INSERT INTO public.galaxy VALUES (2, 'Barnards Galaxy', 500, 15.50, 1, 'http');
INSERT INTO public.galaxy VALUES (3, 'Andromeda', 765, 46.56, 2, 'http');
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 970, 18.74, 3, 'http');
INSERT INTO public.galaxy VALUES (5, 'Antlia Dwarf', 1320, 2.00, 4, 'http');
INSERT INTO public.galaxy VALUES (6, 'Sextans A', 1320, 5.90, 5, 'http');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 5, true, 384399, 29.530, 1737.4);
INSERT INTO public.moon VALUES (2, 'Triton', 6, false, 354759, 5.8768, 1353);
INSERT INTO public.moon VALUES (3, 'Charon', 7, false, 19591, 6.387, 606);
INSERT INTO public.moon VALUES (4, 'Oberon', 9, false, 583520, 13.463, 761.4);
INSERT INTO public.moon VALUES (5, 'Cressida', 9, false, 61766, 0.4636, 39.8);
INSERT INTO public.moon VALUES (6, 'Caliban', 9, false, 7163810, 579.26, 21);
INSERT INTO public.moon VALUES (7, 'Ariel', 9, false, 191020, 2.52, 578.9);
INSERT INTO public.moon VALUES (8, 'Enceladus', 10, false, 237948, 1.370, 252.1);
INSERT INTO public.moon VALUES (9, 'Pandora', 10, false, 141720, 0.682, 40.7);
INSERT INTO public.moon VALUES (10, 'Prometheus', 9, false, 139380, 0.612, 43.1);
INSERT INTO public.moon VALUES (11, 'Dysnomia', 12, false, 37273, 15.786, 300);
INSERT INTO public.moon VALUES (12, 'Ganymede', 13, false, 1070400, 7.154, 2634);
INSERT INTO public.moon VALUES (13, 'Callisto', 13, false, 1882700, 16.689, 2410);
INSERT INTO public.moon VALUES (14, 'Io', 13, false, 421700, 1.769, 1821);
INSERT INTO public.moon VALUES (15, 'Titan', 10, false, 1221870, 15.945, 2575);
INSERT INTO public.moon VALUES (16, 'Titania', 9, false, 435910, 8.706, 788);
INSERT INTO public.moon VALUES (17, 'Proteus', 6, false, 117647, 1.122, 210);
INSERT INTO public.moon VALUES (18, 'Rhea', 10, false, 527108, 4.518, 763);
INSERT INTO public.moon VALUES (19, 'Umbriel', 9, false, 266000, 4.144, 585);
INSERT INTO public.moon VALUES (20, 'Deimos', 14, false, 23463, 1.263, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Pollux b', 15, 2.3, 1.64, 590, false);
INSERT INTO public.planet VALUES (2, 'HD 59686 b', 16, 6.92, 1.0860, 299, false);
INSERT INTO public.planet VALUES (3, 'DT VIRGINIS C', 50, 11.3, 1168, NULL, false);
INSERT INTO public.planet VALUES (4, 'AB Aurigae C', 51, 9, 93, NULL, false);
INSERT INTO public.planet VALUES (5, 'Earth', 1, 0.0031, 1, 365, true);
INSERT INTO public.planet VALUES (6, 'Neptune', 1, 0.05395, 30.07, 60195, false);
INSERT INTO public.planet VALUES (7, 'Pluto', 1, 0.000006859, 39.482, 90560, false);
INSERT INTO public.planet VALUES (9, 'Uranus', 1, 0.04574, 19.191, 30688, false);
INSERT INTO public.planet VALUES (10, 'Saturn', 1, 0.2994, 9.5826, 378, false);
INSERT INTO public.planet VALUES (12, 'Eris', 1, 0.000008, 67.864, 204199, false);
INSERT INTO public.planet VALUES (13, 'Jupiter', 1, 1, 5.2038, 399, false);
INSERT INTO public.planet VALUES (14, 'Mars', 1, 0.0003367, 1.524, 687, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, NULL, 0, 1.0000, 1.0000);
INSERT INTO public.star VALUES (3, 'Kepler-32', 1, 7, 1070, 0.5800, 0.5300);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, 8, 4, 0.1221, 0.1542);
INSERT INTO public.star VALUES (5, 'HE 1523-0901', 1, 9, 9900, 0.8000, 27);
INSERT INTO public.star VALUES (6, 'Iota Draconis', 1, 10, 101, 1.5600, 11.83);
INSERT INTO public.star VALUES (7, 'Snedens Star', 1, 11, 17000, 1.1300, 13.8);
INSERT INTO public.star VALUES (8, 'AE Andromeda', 3, 2, 2500000, 50, 55);
INSERT INTO public.star VALUES (9, 'M31-RV', 3, 2, NULL, NULL, NULL);
INSERT INTO public.star VALUES (11, 'HD 13189', 4, 3, 1590, 1.2, 38);
INSERT INTO public.star VALUES (10, 'HD 9446', 4, 3, 164, 1, 1);
INSERT INTO public.star VALUES (12, 'Macondo', 5, 4, 93, 0.806, 0.844);
INSERT INTO public.star VALUES (13, 'WASP-43', 6, 5, 284, 0.723, 0.6747);
INSERT INTO public.star VALUES (14, 'Gliese 393', 6, 5, 23, 0.432, 0.4459);
INSERT INTO public.star VALUES (15, 'Pollux', 1, 12, 34, 2, 9);
INSERT INTO public.star VALUES (16, 'HD 59686', 1, 12, 292, 1.43, 11.22);
INSERT INTO public.star VALUES (17, 'Kappa Andromedae', 1, 2, 168, 2.768, 2.29);
INSERT INTO public.star VALUES (50, 'DT Virginis', 1, 6, 38, 0.553, 0.473);
INSERT INTO public.star VALUES (51, 'AB aurigae', 1, 13, 538, 2.4, 2.5);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 13, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 51, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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


--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7 (Ubuntu 14.7-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.7 (Ubuntu 14.7-0ubuntu0.22.04.1)

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
-- Name: communities; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.communities (
    id integer NOT NULL,
    name character varying(120),
    creator_id integer NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE public.communities OWNER TO gb_user;

--
-- Name: communities_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.communities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.communities_id_seq OWNER TO gb_user;

--
-- Name: communities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.communities_id_seq OWNED BY public.communities.id;


--
-- Name: communities_users; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.communities_users (
    community_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE public.communities_users OWNER TO gb_user;

--
-- Name: friendship; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.friendship (
    id integer NOT NULL,
    requested_by_user_id integer NOT NULL,
    requested_to_user_id integer NOT NULL,
    status_id integer NOT NULL,
    requested_at timestamp without time zone,
    confirmed_at timestamp without time zone
);


ALTER TABLE public.friendship OWNER TO gb_user;

--
-- Name: friendship_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.friendship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friendship_id_seq OWNER TO gb_user;

--
-- Name: friendship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.friendship_id_seq OWNED BY public.friendship.id;


--
-- Name: friendship_statuses; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.friendship_statuses (
    id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.friendship_statuses OWNER TO gb_user;

--
-- Name: friendship_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.friendship_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friendship_statuses_id_seq OWNER TO gb_user;

--
-- Name: friendship_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.friendship_statuses_id_seq OWNED BY public.friendship_statuses.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.messages (
    id integer NOT NULL,
    from_user_id integer NOT NULL,
    to_user_id integer NOT NULL,
    body text,
    is_important boolean,
    is_delivered boolean,
    created_at timestamp without time zone
);


ALTER TABLE public.messages OWNER TO gb_user;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_id_seq OWNER TO gb_user;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: photo; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.photo (
    id integer NOT NULL,
    url character varying(250) NOT NULL,
    owner_id integer NOT NULL,
    description character varying(250) NOT NULL,
    uploaded_at timestamp without time zone NOT NULL,
    size integer NOT NULL
);


ALTER TABLE public.photo OWNER TO gb_user;

--
-- Name: photo_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.photo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photo_id_seq OWNER TO gb_user;

--
-- Name: photo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.photo_id_seq OWNED BY public.photo.id;


--
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.subscriptions (
    id integer NOT NULL,
    on_user_id integer NOT NULL,
    on_community_id integer NOT NULL,
    is_subscribed boolean
);


ALTER TABLE public.subscriptions OWNER TO gb_user;

--
-- Name: subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.subscriptions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscriptions_id_seq OWNER TO gb_user;

--
-- Name: subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.subscriptions_id_seq OWNED BY public.subscriptions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.users (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(120) NOT NULL,
    phone character varying(15),
    main_photo_id integer,
    created_at timestamp without time zone
);


ALTER TABLE public.users OWNER TO gb_user;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO gb_user;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: video; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.video (
    id integer NOT NULL,
    url character varying(250) NOT NULL,
    owner_id integer NOT NULL,
    description character varying(250) NOT NULL,
    uploaded_at timestamp without time zone NOT NULL,
    size integer NOT NULL
);


ALTER TABLE public.video OWNER TO gb_user;

--
-- Name: video_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.video_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.video_id_seq OWNER TO gb_user;

--
-- Name: video_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.video_id_seq OWNED BY public.video.id;


--
-- Name: communities id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities ALTER COLUMN id SET DEFAULT nextval('public.communities_id_seq'::regclass);


--
-- Name: friendship id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship ALTER COLUMN id SET DEFAULT nextval('public.friendship_id_seq'::regclass);


--
-- Name: friendship_statuses id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship_statuses ALTER COLUMN id SET DEFAULT nextval('public.friendship_statuses_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Name: photo id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.photo ALTER COLUMN id SET DEFAULT nextval('public.photo_id_seq'::regclass);


--
-- Name: subscriptions id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.subscriptions ALTER COLUMN id SET DEFAULT nextval('public.subscriptions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: video id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.video ALTER COLUMN id SET DEFAULT nextval('public.video_id_seq'::regclass);


--
-- Data for Name: communities; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.communities (id, name, creator_id, created_at) FROM stdin;
1	Proin Ultrices Foundation	9	2023-06-06 17:44:17
2	Nulla At Sem Incorporated	14	2024-01-11 08:55:35
3	Bibendum Ullamcorper Duis Company	55	2022-07-23 21:04:44
4	Cubilia Limited	58	2023-03-12 05:30:51
5	Tincidunt Dui Institute	4	2023-05-13 09:57:00
6	Aliquet Foundation	54	2022-08-15 08:13:51
7	Sed Eu Nibh Industries	81	2022-09-08 21:08:48
8	Gravida Limited	10	2023-09-19 21:55:08
9	Mauris Sapien Associates	76	2024-01-17 08:16:58
10	Natoque Penatibus Institute	87	2022-09-02 13:55:39
11	Sit Amet Nulla LLC	83	2023-01-10 23:03:25
12	Ut Tincidunt Incorporated	49	2023-08-15 13:14:13
13	Dolor Dolor Corporation	22	2023-07-16 16:48:56
14	In Mi Foundation	51	2023-12-11 19:24:39
15	Et Corp.	64	2023-02-15 07:47:04
16	Venenatis LLP	85	2024-01-17 13:59:09
17	Sed Tortor PC	88	2023-08-18 08:04:05
18	Turpis Ltd	87	2023-01-05 04:12:40
19	Quam A Consulting	97	2022-09-19 03:37:14
20	Proin Non Corp.	5	2024-04-13 16:24:33
21	Mattis Cras LLP	27	2023-10-16 06:14:06
22	Nunc PC	50	2023-05-29 13:37:08
23	Enim Nisl Elementum Corporation	54	2023-06-14 21:17:52
24	Elit Corp.	81	2024-04-01 19:51:33
25	Id LLC	93	2023-07-20 14:11:23
26	Diam Vel Incorporated	13	2024-02-11 08:09:05
27	Lobortis Tellus Justo Corporation	59	2023-08-02 18:45:20
28	Nec Mollis Institute	61	2024-02-06 15:14:33
29	Facilisis Suspendisse Institute	57	2024-04-13 19:54:38
30	Nunc Mauris Incorporated	74	2023-02-28 03:18:43
31	Ultrices A Limited	37	2023-03-25 23:09:46
32	Fermentum Incorporated	21	2023-03-23 19:20:18
33	Tellus Sem Industries	54	2024-05-10 16:02:23
34	Euismod Mauris Ltd	21	2023-10-26 14:37:13
35	Libero At Auctor LLP	46	2024-03-24 05:02:44
36	Aliquet Vel Vulputate Incorporated	67	2022-08-24 08:59:07
37	Magna Associates	96	2023-01-06 21:35:27
38	Mollis Integer Tincidunt LLP	82	2024-03-18 06:50:18
39	Enim Diam LLC	19	2023-01-12 10:34:11
40	Aliquet Industries	79	2022-09-03 07:05:32
41	Aliquam Ornare Ltd	81	2023-01-03 02:05:58
42	Aliquam Eros Turpis LLP	59	2022-08-29 00:22:16
43	Risus Quis Industries	87	2023-12-11 05:56:08
44	Pellentesque Tincidunt Associates	47	2023-12-18 23:16:38
45	Dui Fusce Diam Inc.	28	2022-11-02 01:33:54
46	Eu Accumsan Corp.	51	2022-10-16 15:05:36
47	Nascetur Ridiculus LLP	7	2022-12-09 04:30:03
48	Pellentesque Tellus Sem PC	63	2023-08-22 22:03:32
49	In Institute	47	2023-01-04 04:37:32
50	Consectetuer Institute	50	2024-04-01 13:40:23
51	Nunc Ac Corp.	44	2023-12-26 04:11:43
52	Est Vitae PC	68	2023-05-17 17:17:21
53	Ac Tellus Corporation	4	2023-06-10 02:53:48
54	Eget Nisi LLP	88	2023-01-18 00:26:24
55	Lacus Etiam Institute	26	2023-01-26 00:13:41
56	Cursus In Inc.	4	2024-03-12 10:39:59
57	Arcu Sed Et Corporation	90	2023-08-08 09:26:27
58	Consectetuer Adipiscing Elit Corp.	82	2024-02-18 02:58:18
59	Ante Lectus LLC	95	2023-01-04 19:33:33
60	Nullam Velit Dui Associates	2	2023-06-10 10:49:22
61	Bibendum Institute	29	2022-09-04 13:07:24
62	Sit LLC	59	2022-08-27 04:02:24
63	Integer Urna Vivamus Associates	30	2022-12-01 21:52:28
64	Eget Industries	73	2023-12-11 14:48:26
65	Ut Sagittis Incorporated	82	2023-10-21 00:30:43
66	Enim Gravida Inc.	84	2023-09-13 04:35:40
67	Auctor Corp.	56	2022-05-26 11:01:18
68	Sed Dictum Corp.	21	2023-10-14 22:35:13
69	Facilisis Suspendisse Limited	43	2023-12-07 15:53:41
70	Tincidunt Dui Augue Incorporated	7	2024-05-13 19:55:39
71	Sem Ut Institute	66	2024-01-23 14:16:32
72	Parturient Industries	47	2022-10-05 11:40:11
73	Nam Ac LLC	29	2022-11-27 05:16:26
74	Pellentesque A Corp.	76	2023-04-30 16:06:24
75	Sed Orci Lobortis Company	10	2023-02-09 11:59:21
76	In Nec Orci LLC	93	2022-08-14 22:49:27
77	Dolor Fusce Feugiat Associates	86	2022-09-19 19:36:59
78	Vitae Associates	90	2023-10-09 19:00:24
79	Ac Sem Ltd	97	2022-11-07 01:54:27
80	Feugiat Lorem Ipsum Corporation	47	2022-10-31 20:02:22
81	Ridiculus Incorporated	69	2023-09-01 11:17:52
82	Libero Integer PC	31	2022-11-19 06:00:07
83	Feugiat Metus Sit Corporation	78	2022-11-19 19:30:00
84	Magna Ut LLC	91	2024-01-13 13:08:25
85	Sed Leo Incorporated	62	2022-10-13 00:59:25
86	Nec Quam Consulting	29	2023-10-04 00:53:08
87	Senectus Et LLC	88	2022-05-28 09:15:43
88	Risus Corporation	37	2024-01-24 02:36:50
89	Tellus Lorem Industries	34	2023-04-28 12:14:28
90	Donec Vitae Erat Consulting	36	2023-07-06 02:02:24
91	Erat Eget Tincidunt Limited	96	2023-02-12 12:56:25
92	Phasellus Dapibus Quam Associates	40	2023-10-24 10:08:43
93	Etiam Vestibulum LLP	42	2024-03-11 12:16:42
94	Tellus Id Incorporated	34	2023-01-03 23:05:04
95	Nam Limited	78	2022-12-28 00:11:15
96	Amet Consectetuer Industries	98	2023-11-05 21:25:35
97	Libero Integer Incorporated	55	2022-08-18 20:04:08
98	Neque Nullam Institute	65	2023-03-22 11:23:05
99	Magna Cras Convallis Inc.	19	2023-10-25 08:29:27
100	Morbi Metus Incorporated	77	2023-02-13 20:36:21
\.


--
-- Data for Name: communities_users; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.communities_users (community_id, user_id, created_at) FROM stdin;
22	33	2023-02-01 21:13:18
75	81	2023-11-02 01:32:49
15	11	2024-02-04 03:57:31
53	14	2022-12-01 19:47:05
65	77	2023-01-25 07:47:25
81	13	2023-07-25 21:42:37
46	36	2023-01-19 11:13:20
17	86	2024-03-07 23:21:47
42	4	2022-11-30 01:47:28
76	97	2023-02-05 17:58:35
19	81	2024-05-01 12:23:37
72	21	2024-02-28 01:16:20
91	18	2024-01-30 03:26:55
46	4	2023-09-30 17:22:07
4	29	2023-02-22 04:31:29
91	8	2023-11-27 04:21:59
88	9	2023-10-26 19:17:03
7	100	2022-09-05 21:33:43
11	99	2022-09-20 14:42:12
94	19	2022-10-08 07:59:17
96	84	2023-11-08 13:31:41
83	4	2023-10-14 19:00:32
70	91	2024-01-19 22:41:22
31	81	2023-03-02 20:59:31
90	58	2024-04-24 14:49:48
11	7	2023-12-03 05:35:40
93	32	2023-11-16 10:42:07
51	42	2023-09-30 23:24:40
43	80	2023-07-06 18:07:56
18	10	2024-01-31 08:22:24
25	57	2023-04-14 11:02:10
55	39	2024-02-13 17:14:55
34	37	2023-07-02 16:23:06
83	99	2024-01-06 08:41:18
58	95	2024-04-25 23:04:27
69	36	2023-05-12 09:42:10
94	7	2023-09-15 15:18:04
9	74	2023-08-16 16:02:05
88	66	2024-01-09 22:46:10
12	94	2023-01-03 01:11:59
53	83	2024-03-01 09:32:46
90	22	2022-07-15 09:18:43
4	68	2022-08-09 14:22:54
81	80	2023-12-04 08:24:11
94	29	2023-03-30 06:19:37
11	37	2022-08-30 04:27:56
30	3	2022-10-16 05:50:55
21	59	2024-05-12 14:30:15
52	57	2022-10-15 16:53:51
98	66	2022-08-01 03:33:17
26	27	2023-05-17 07:15:16
65	56	2023-02-02 20:06:41
70	29	2023-04-14 17:53:24
35	74	2022-06-02 07:18:00
10	92	2024-04-16 17:00:22
94	61	2023-03-11 01:56:35
29	80	2023-09-28 22:30:01
48	55	2022-06-24 13:12:37
14	69	2022-09-17 10:29:39
61	43	2023-01-14 17:37:52
31	95	2022-06-02 00:43:38
67	81	2023-01-23 22:45:55
49	66	2023-08-16 03:03:46
18	13	2022-09-03 03:09:02
65	97	2023-06-08 14:45:11
45	43	2022-12-28 23:58:22
73	67	2023-04-07 04:03:20
19	31	2024-05-15 14:50:15
3	4	2023-03-07 13:28:11
30	78	2022-08-02 15:20:54
15	15	2024-01-04 22:57:31
28	42	2024-02-23 00:00:14
2	8	2023-08-23 09:19:22
8	94	2022-06-05 23:00:57
30	73	2022-10-03 05:36:13
92	39	2024-04-19 07:18:35
46	19	2023-11-29 20:40:01
77	94	2023-11-24 10:19:03
93	54	2023-12-16 09:31:24
23	100	2023-02-17 12:28:34
24	85	2023-08-09 15:25:53
9	70	2022-12-30 04:27:11
15	7	2023-05-09 08:07:40
98	94	2023-06-22 14:06:48
54	66	2023-08-19 21:03:42
5	13	2022-07-25 15:21:45
22	32	2023-01-26 22:59:38
44	94	2023-09-05 01:18:19
98	43	2022-12-22 23:41:49
42	35	2022-12-13 00:38:03
61	57	2022-12-06 15:51:22
76	2	2023-10-28 06:33:48
50	75	2023-07-30 00:01:53
63	5	2023-06-02 21:20:39
56	95	2024-04-15 02:46:41
11	17	2022-11-15 09:09:04
99	56	2024-01-17 14:40:02
43	34	2023-07-09 12:41:50
97	73	2023-08-14 05:57:12
20	29	2022-08-04 03:17:41
\.


--
-- Data for Name: friendship; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.friendship (id, requested_by_user_id, requested_to_user_id, status_id, requested_at, confirmed_at) FROM stdin;
1	9	4	38	2024-02-08 09:00:34	2024-04-28 13:37:55
2	18	51	24	2024-04-27 13:38:47	2022-12-14 16:08:47
3	68	72	27	2022-08-15 21:00:23	2024-02-20 20:47:26
4	4	89	3	2022-07-28 22:33:27	2022-12-13 02:03:08
5	29	75	24	2024-02-15 10:08:39	2022-06-03 23:06:09
6	75	91	3	2024-04-28 07:10:23	2024-01-28 10:18:49
7	61	35	7	2023-06-23 19:12:32	2022-10-09 08:26:43
8	78	39	83	2022-09-09 04:01:18	2023-03-29 02:35:03
9	7	24	5	2022-09-05 14:07:46	2023-10-16 12:18:04
10	16	35	54	2022-11-16 05:25:19	2022-07-10 03:13:37
11	82	75	80	2022-10-29 13:48:22	2023-05-13 06:26:36
12	98	16	16	2022-07-21 10:47:07	2022-10-30 08:51:33
13	97	90	55	2022-09-20 01:43:44	2022-10-09 01:19:47
14	79	93	3	2023-08-28 10:26:56	2024-04-19 21:14:38
15	18	4	82	2024-04-25 23:42:28	2023-09-13 01:38:51
16	89	21	35	2023-01-15 17:16:33	2024-03-22 03:14:53
17	8	65	62	2022-07-28 10:07:10	2022-12-17 05:53:31
18	48	68	29	2023-09-14 22:34:10	2022-06-20 11:31:16
19	18	74	45	2024-03-11 16:46:23	2023-11-03 13:03:59
20	58	4	9	2024-01-08 07:47:36	2022-09-06 17:09:08
21	80	6	61	2023-09-05 05:22:34	2023-06-30 16:02:23
22	61	32	38	2023-09-24 17:28:54	2023-10-09 23:25:56
23	15	52	5	2023-10-16 08:34:55	2022-12-19 12:48:11
24	35	70	63	2024-02-28 21:13:49	2024-03-07 07:28:22
25	73	75	88	2024-05-12 20:41:27	2022-08-27 01:36:18
26	80	55	70	2023-04-11 14:32:59	2022-11-22 19:49:56
27	94	84	82	2023-09-18 07:47:18	2022-07-28 02:55:17
28	94	7	7	2023-12-05 14:11:03	2022-10-07 05:08:08
29	2	74	11	2023-09-16 09:14:15	2022-12-04 05:12:36
30	97	96	65	2022-08-23 11:21:46	2022-09-18 23:53:32
31	38	7	90	2023-03-10 14:16:44	2022-09-14 11:37:58
32	75	53	99	2023-07-16 03:55:16	2022-08-29 01:08:21
33	73	3	88	2023-06-25 07:43:26	2022-07-15 09:18:19
34	95	23	62	2023-05-08 17:20:46	2024-05-04 10:18:01
35	38	12	59	2022-05-29 17:12:21	2023-06-22 22:52:18
36	92	64	95	2023-10-25 10:42:39	2023-08-04 23:32:55
37	87	5	26	2023-09-15 04:30:52	2024-02-18 18:50:08
38	76	61	71	2022-11-20 18:17:13	2023-04-07 08:20:21
39	80	45	9	2024-01-12 01:09:20	2022-07-13 01:16:06
40	74	69	19	2023-01-16 01:23:15	2023-08-08 18:37:25
41	89	49	90	2023-06-27 21:16:27	2022-07-15 21:47:54
42	71	79	50	2023-10-05 06:27:20	2022-09-25 15:47:44
43	56	31	13	2023-09-27 21:40:23	2023-05-29 02:53:11
44	39	25	87	2023-08-15 20:57:43	2022-08-02 19:50:23
45	94	30	60	2022-09-27 19:10:46	2023-05-01 23:10:38
46	36	34	52	2023-09-06 17:45:27	2022-05-22 17:43:36
47	2	14	74	2023-11-05 15:16:43	2023-05-06 17:16:45
48	19	50	65	2023-12-26 06:56:56	2022-12-22 09:59:26
49	26	74	51	2022-11-20 20:51:01	2022-07-14 20:01:18
50	62	80	96	2023-01-06 08:58:43	2023-03-29 19:29:40
51	54	2	27	2022-12-12 05:25:28	2023-10-03 16:01:21
52	45	54	11	2023-02-14 03:29:06	2023-08-05 15:14:54
53	23	54	88	2023-08-17 00:55:32	2023-04-08 14:36:18
54	30	59	56	2022-11-07 08:23:52	2022-12-14 21:02:08
55	85	19	30	2024-02-15 04:57:58	2023-12-15 07:09:37
56	19	27	65	2022-12-08 16:26:08	2022-09-09 05:01:33
57	23	65	66	2023-11-26 07:31:06	2024-04-12 11:27:02
58	51	46	29	2023-03-10 19:44:52	2023-02-28 07:47:12
59	12	62	88	2023-07-18 11:33:59	2023-09-07 07:28:33
60	63	68	8	2024-03-25 07:51:29	2023-01-26 08:38:20
61	39	65	14	2023-01-17 10:28:35	2023-06-25 02:25:22
62	19	31	50	2023-08-04 14:14:05	2023-06-29 02:51:13
63	29	70	78	2024-01-07 20:38:47	2023-01-08 03:28:11
64	36	69	3	2024-01-14 05:25:00	2022-12-08 10:54:32
65	36	48	60	2022-11-16 10:03:11	2023-04-13 04:27:37
66	83	37	83	2023-08-12 13:57:34	2022-06-03 16:21:07
67	50	71	52	2023-05-02 15:13:10	2023-03-20 13:21:27
68	81	90	16	2024-01-13 11:52:29	2024-02-08 23:56:09
69	89	21	41	2022-09-30 23:48:35	2023-01-24 02:55:43
70	56	36	64	2023-09-20 03:35:06	2024-02-18 18:56:41
71	91	93	43	2023-09-25 11:38:31	2023-05-19 20:01:49
72	8	9	96	2022-12-04 15:19:32	2023-08-15 08:17:17
73	55	60	61	2023-10-28 09:15:23	2023-11-26 20:57:38
74	14	91	20	2022-11-01 09:44:45	2023-10-13 13:46:31
75	68	37	17	2022-12-23 00:56:22	2023-06-14 02:18:11
76	82	79	75	2024-03-17 06:26:13	2023-09-12 11:52:33
77	53	54	33	2022-06-14 17:12:54	2023-11-20 05:32:51
78	34	11	41	2023-07-25 09:35:24	2022-11-25 22:02:40
79	78	6	53	2022-07-26 19:22:50	2022-12-19 15:16:14
80	94	26	34	2023-07-03 04:30:37	2023-05-11 09:42:32
81	49	100	90	2022-05-22 02:53:02	2022-07-13 17:23:26
82	54	56	30	2023-05-25 22:38:51	2023-03-30 16:37:18
83	67	42	100	2023-01-20 15:31:16	2023-11-11 08:40:13
84	67	16	42	2023-05-29 10:51:58	2022-07-28 15:50:56
85	69	44	90	2023-08-31 19:05:03	2022-08-03 12:51:17
86	33	62	38	2023-08-24 12:07:53	2023-09-01 06:34:12
87	78	21	66	2023-11-04 03:12:03	2022-12-18 21:22:07
88	41	80	1	2022-10-10 06:23:58	2023-05-15 03:47:41
89	13	43	85	2022-10-01 22:19:20	2023-06-27 19:08:02
90	87	59	61	2022-10-27 23:05:42	2024-04-02 02:36:18
91	52	17	31	2024-01-30 13:13:21	2024-01-09 00:56:52
92	5	20	6	2023-12-30 10:52:40	2022-11-01 17:37:03
93	78	90	99	2023-01-22 05:52:54	2023-01-04 18:36:20
94	21	39	49	2023-06-07 06:10:18	2023-09-13 09:20:28
95	44	27	57	2022-08-16 21:35:02	2023-11-01 08:26:38
96	53	64	46	2023-11-10 19:38:01	2022-08-17 09:47:20
97	85	80	75	2022-07-09 10:01:59	2022-07-06 03:58:26
98	37	43	52	2023-12-21 18:03:56	2023-03-28 14:41:56
99	30	57	60	2022-12-26 14:27:41	2023-01-03 17:57:40
100	11	22	40	2022-06-01 23:24:24	2023-08-18 03:42:40
\.


--
-- Data for Name: friendship_statuses; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.friendship_statuses (id, name) FROM stdin;
17	Armand Mejia
18	Kirk Nguyen
19	Rose Larsen
20	Devin Wade
21	Cadman O'brien
22	Mason Goff
23	Audrey Hunter
24	Nicholas Chapman
25	Yvonne Harding
26	Zephr Avila
27	Brian Brock
28	Melyssa Bond
29	Nathan Malone
30	Vladimir Gardner
31	Emmanuel Cook
32	Malachi Preston
33	Catherine Woodard
34	Avye Ford
35	Porter Jacobson
36	Clarke Nelson
37	Hamish Hudson
38	John Hess
39	Lars Gomez
40	Zane Frederick
41	Seth Cleveland
42	Len Kramer
43	Deborah Pennington
44	Xander Logan
45	Macaulay Kline
46	Upton Underwood
47	Ifeoma Velez
48	Kennedy Swanson
49	Chloe Baxter
50	Constance Valencia
51	Larissa Hawkins
52	Josephine Bruce
53	Camden Marsh
54	Marah Clayton
55	Austin Peterson
56	Levi William
57	Bevis Weaver
58	Alyssa Mathews
59	Irma Norris
60	Amaya Leach
61	Jerry Mullen
62	Noah Harris
63	Winifred Lopez
64	Luke Bauer
65	Ainsley Wilkins
66	Kaseem Britt
67	Nicholas Barry
68	Drake Michael
69	Farrah Houston
70	Minerva Valdez
71	Zelenia Mccormick
72	Jerry Wiggins
73	Audrey James
74	Carissa Cash
75	Ulysses Nguyen
76	Gage Castillo
77	Signe Rhodes
78	Sarah Bell
79	Elliott Barrera
80	Ryder Merrill
81	Dieter Fisher
82	Idona Mcintosh
83	Suki Fernandez
84	David Mclaughlin
85	Barbara Meadows
86	Erasmus Hancock
87	Chase Mayer
88	Raya Palmer
89	Aaron Guzman
90	Zeus Rush
91	Cruz Fitzpatrick
92	Xena Cochran
93	Oliver Duncan
94	Quyn Patton
95	Gregory Mccormick
96	Amanda Acevedo
97	Quintessa Richardson
98	Cruz Hayden
99	Arthur Bradley
100	Baxter Puckett
101	Anne Hubbard
102	Channing Mejia
103	Jada Conley
104	Harrison Ross
105	Macey Lowery
106	Len Pickett
107	Kelly Roy
108	Hammett Winters
109	Denton Chavez
110	Noel Wright
111	Tanisha Conway
112	Orson Key
113	Cyrus Tyler
114	Merrill Davis
115	Melissa Briggs
116	Cathleen Santos
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.messages (id, from_user_id, to_user_id, body, is_important, is_delivered, created_at) FROM stdin;
1	35	30	fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue	t	f	2024-03-12 07:42:55
2	15	78	a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin	f	t	2023-11-07 13:26:37
3	27	69	ut erat. Sed	t	f	2023-11-01 13:49:14
4	46	79	libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus	t	f	2022-06-01 06:18:26
5	10	61	vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus,	f	t	2023-02-10 00:22:40
6	17	23	blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus	t	t	2023-04-23 14:42:10
7	40	54	posuere cubilia Curae Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum	t	f	2022-09-26 08:23:15
8	66	81	Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate	t	t	2023-03-07 09:29:03
9	1	15	Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc	f	t	2022-12-25 00:55:38
10	60	10	convallis dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer mollis.	t	t	2023-04-03 20:34:52
11	58	30	dolor. Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer adipiscing	f	f	2022-06-19 18:18:11
12	68	37	ornare lectus justo eu arcu. Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus pede, ultrices a, auctor non, feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper	t	t	2024-03-20 02:27:09
13	58	98	felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in	t	f	2023-08-10 21:03:18
14	23	49	nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus pede et risus. Quisque libero lacus, varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque	f	f	2022-06-29 03:52:06
15	44	63	aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis dui, in sodales elit erat vitae risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu	t	f	2023-10-26 01:35:57
16	49	60	tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc	f	t	2023-01-27 09:56:03
17	45	18	neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices.	f	f	2023-11-03 13:25:27
18	49	29	ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor	t	t	2023-08-14 03:21:11
19	98	30	eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum	t	f	2023-10-31 01:07:57
20	49	42	volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam.	t	t	2023-03-14 18:26:11
21	19	31	ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt	t	t	2022-06-26 06:15:24
22	56	25	ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus justo eu arcu. Morbi sit	f	t	2022-06-06 22:51:52
23	95	73	cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus pede et risus. Quisque libero lacus, varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa.	t	f	2024-04-18 00:49:48
24	63	56	odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante.	f	t	2024-03-12 04:44:01
25	29	81	feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci,	t	t	2024-01-11 01:25:12
26	48	17	egestas a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus	f	t	2022-08-04 05:19:10
27	65	14	eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue	t	t	2022-10-12 04:02:04
28	97	21	diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor	f	f	2023-07-27 22:59:27
29	29	35	massa. Quisque porttitor eros nec tellus. Nunc lectus pede, ultrices a, auctor non, feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero	t	f	2023-07-24 00:01:30
30	40	63	ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum	t	t	2023-09-20 17:29:18
31	81	48	tincidunt vehicula risus. Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum	f	f	2023-01-13 01:51:47
32	15	63	aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis dui, in sodales elit erat vitae risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus,	f	t	2022-09-09 11:56:48
33	84	73	blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci.	f	f	2022-12-02 18:43:02
34	58	87	mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac	t	t	2022-10-24 22:22:42
93	40	2	Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla	t	f	2023-04-20 00:15:09
35	30	23	in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh	t	t	2023-01-21 13:29:40
36	37	76	Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non,	f	f	2022-12-06 20:18:00
37	57	48	risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla. Cras eu tellus	t	t	2022-11-14 05:23:52
38	54	35	parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est.	t	f	2023-03-11 00:55:48
39	89	67	dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus	f	t	2023-10-09 06:33:19
40	18	10	dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a	f	t	2023-04-25 17:46:04
41	75	64	justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus	t	t	2022-10-06 12:45:44
42	67	86	fringilla purus mauris a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam	f	t	2022-12-14 05:27:47
43	37	59	placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam	f	t	2024-01-06 19:01:50
44	32	97	pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget mollis	f	t	2024-01-12 17:11:14
45	41	59	fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed	f	t	2023-08-14 21:27:16
46	31	89	rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque	t	f	2022-10-02 04:47:50
47	73	33	aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo	t	f	2023-08-15 02:24:52
48	70	18	libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id,	f	f	2023-05-24 13:02:08
49	99	44	natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper,	f	t	2023-02-27 12:49:23
50	60	47	sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique	t	t	2023-04-09 12:13:49
51	62	30	vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac	f	t	2022-06-01 13:50:49
52	43	16	aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem	t	f	2023-06-09 14:22:52
94	60	98	egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor	f	t	2022-07-01 15:29:45
95	44	66	tincidunt aliquam arcu. Aliquam	t	t	2022-10-05 07:26:59
53	38	62	lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna.	t	t	2022-12-11 01:34:02
54	17	3	tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante.	t	f	2024-01-12 18:41:33
55	25	43	lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu,	f	t	2023-04-27 09:48:45
56	63	60	ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna.	f	t	2022-10-03 10:34:00
57	56	94	Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue	f	f	2022-10-30 02:50:17
58	4	70	sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur	f	t	2024-03-31 18:51:01
59	31	34	ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend	t	t	2022-08-11 18:17:32
60	76	12	ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus	f	t	2023-12-05 03:52:07
61	84	86	ultrices a, auctor non, feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis	f	t	2022-05-30 21:12:37
62	29	19	Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in	f	f	2023-05-31 11:50:25
63	13	22	pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare	f	f	2022-09-19 23:49:45
64	16	69	dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy	f	f	2024-02-13 10:23:04
65	89	98	orci luctus et ultrices posuere cubilia Curae Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed	f	t	2022-08-19 22:38:02
66	29	13	urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor bibendum.	f	t	2024-04-19 15:48:18
67	30	91	erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius	f	f	2024-05-21 03:23:52
68	17	4	pharetra, felis eget	f	t	2022-09-12 00:33:30
69	17	12	mattis. Integer eu lacus. Quisque	t	f	2024-04-13 13:22:56
70	87	74	vitae risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut	t	f	2024-02-08 03:09:56
71	42	40	non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc	t	t	2023-04-14 21:44:40
72	23	54	accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean	f	f	2023-11-18 16:48:13
91	96	52	Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus.	t	t	2022-07-12 01:52:00
73	48	89	orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum	f	f	2024-05-17 02:11:44
74	36	56	Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis,	t	t	2024-01-10 20:02:11
75	7	41	ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam	f	t	2023-02-05 13:15:18
76	9	21	euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris	t	t	2023-01-25 11:52:22
77	9	38	dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque	t	t	2023-06-03 03:42:07
78	64	85	in consectetuer ipsum nunc id enim.	t	f	2022-11-28 19:22:37
79	22	78	sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit	f	f	2023-07-21 05:20:42
80	47	78	elit. Aliquam auctor, velit eget laoreet posuere, enim nisl elementum purus, accumsan interdum libero	t	t	2024-05-14 18:56:04
81	70	41	sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit	f	t	2023-06-14 16:45:50
82	63	75	magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus	t	t	2023-01-06 00:45:50
83	68	15	ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo.	t	f	2022-10-28 06:40:53
84	74	11	imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus justo eu arcu. Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus pede, ultrices a, auctor non, feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida	t	f	2023-01-02 04:14:01
85	26	11	Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget	t	f	2022-05-29 14:02:06
86	28	8	est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis	f	f	2022-07-09 11:56:40
87	22	30	sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed auctor odio a purus. Duis elementum, dui quis accumsan convallis, ante lectus convallis est, vitae sodales nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum	t	t	2023-03-28 02:27:58
88	18	9	tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus	f	t	2022-07-18 11:04:31
89	40	3	arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae,	t	f	2024-02-18 07:45:25
90	62	38	a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis	f	f	2024-05-12 04:32:59
92	81	86	tristique senectus et netus et malesuada fames ac turpis egestas. Fusce aliquet magna a	t	t	2023-01-02 21:51:47
96	88	22	quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper	f	f	2022-05-21 23:22:00
97	18	82	nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros turpis non enim.	f	f	2023-11-16 10:14:46
98	10	47	Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh	f	t	2022-08-09 19:54:09
99	16	65	venenatis vel, faucibus id, libero. Donec consectetuer mauris	t	f	2023-07-28 04:23:45
100	82	44	ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer	t	f	2022-12-15 23:58:51
\.


--
-- Data for Name: photo; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.photo (id, url, owner_id, description, uploaded_at, size) FROM stdin;
306	https://guardian.co.uk/en-us?search=1	11	nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula	2023-08-27 07:24:48	53
307	http://walmart.com/en-us?ab=441&aad=2	76	velit eget laoreet posuere, enim nisl elementum purus,	2024-04-10 10:47:07	66
308	https://bbc.co.uk/user/110?g=1	52	Curabitur	2022-12-30 15:10:22	81
309	http://zoom.us/site?k=0	76	egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras	2023-03-20 09:21:22	35
310	https://whatsapp.com/sub?ad=115	45	tempor, est ac mattis semper,	2023-02-26 19:29:43	44
311	https://ebay.com/group/9?q=11	6	volutpat nunc	2023-03-28 01:17:56	9
312	https://wikipedia.org/site?page=1&offset=1	56	luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis.	2023-07-29 11:19:51	25
313	http://whatsapp.com/one?p=8	38	dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget	2024-04-01 21:37:22	21
314	https://bbc.co.uk/sub/cars?client=g	73	ac	2024-04-29 18:52:12	9
315	https://whatsapp.com/sub/cars?page=1&offset=1	96	eleifend egestas. Sed pharetra, felis eget varius ultrices,	2023-09-08 08:19:28	83
316	http://netflix.com/en-ca?page=1&offset=1	88	Nam tempor diam dictum	2023-04-28 16:30:01	12
317	https://instagram.com/sub?search=1	49	placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas	2022-08-04 11:27:40	40
318	https://reddit.com/en-ca?q=11	24	tristique neque venenatis lacus. Etiam	2023-04-25 01:50:18	14
319	https://whatsapp.com/site?page=1&offset=1	49	Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis.	2023-11-29 05:55:33	56
320	https://wikipedia.org/user/110?k=0	66	neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis	2023-11-11 18:29:48	55
321	http://yahoo.com/user/110?q=4	18	sed, facilisis vitae, orci. Phasellus dapibus quam quis	2023-11-27 10:30:07	4
322	http://guardian.co.uk/sub?p=8	8	enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae	2022-06-12 19:36:29	40
323	https://walmart.com/group/9?q=4	15	et nunc. Quisque ornare	2023-11-07 15:00:19	94
324	https://google.com/settings?search=1	56	eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem,	2024-02-01 18:14:55	53
325	http://guardian.co.uk/user/110?client=g	6	lacinia	2023-01-19 06:36:20	92
326	http://guardian.co.uk/en-ca?client=g	49	ut quam vel sapien imperdiet ornare. In faucibus.	2023-04-07 08:03:10	65
327	http://wikipedia.org/group/9?q=0	63	rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis	2023-06-22 23:43:31	20
328	http://naver.com/site?search=1&q=de	44	tristique pellentesque, tellus sem mollis dui, in sodales elit erat vitae risus. Duis a mi fringilla mi	2023-11-20 18:35:09	14
329	http://nytimes.com/en-us?ad=115	27	massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim	2023-01-28 06:22:06	89
330	https://zoom.us/one?ab=441&aad=2	88	hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus	2023-12-21 00:43:50	57
331	http://cnn.com/site?q=0	3	sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut	2024-03-21 05:41:42	77
332	https://google.com/en-ca?client=g	31	blandit enim consequat purus. Maecenas libero est, congue a,	2023-12-27 15:33:44	87
333	http://twitter.com/group/9?ab=441&aad=2	7	sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis	2023-11-19 06:55:18	5
334	https://facebook.com/sub?gi=100	2	risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum	2023-08-08 17:34:10	12
335	http://instagram.com/settings?ab=441&aad=2	95	eros non enim commodo hendrerit. Donec	2022-10-25 06:32:04	17
336	https://netflix.com/en-ca?search=1&q=de	15	Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper	2023-10-13 04:12:24	74
337	http://facebook.com/sub?gi=100	98	penatibus et magnis dis parturient	2022-12-05 01:37:19	5
338	https://cnn.com/site?search=1	95	nec ligula consectetuer rhoncus. Nullam velit dui, semper et,	2023-08-07 12:58:52	63
339	http://guardian.co.uk/one?ab=441&aad=2	4	Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam	2023-03-10 08:08:14	49
340	https://youtube.com/group/9?page=1&offset=1	40	pharetra ut, pharetra sed, hendrerit a, arcu. Sed	2023-02-03 04:30:40	31
341	https://netflix.com/sub/cars?q=test	7	Aliquam auctor, velit eget laoreet posuere, enim nisl elementum purus, accumsan interdum libero dui	2024-05-20 20:39:53	16
342	https://instagram.com/user/110?k=0	32	et pede. Nunc sed orci lobortis augue	2023-12-28 23:30:19	1
343	https://whatsapp.com/en-us?ad=115	90	Ut tincidunt orci quis lectus. Nullam suscipit, est ac facilisis	2022-12-17 05:52:22	20
344	http://instagram.com/fr?search=1	29	augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget	2024-01-10 17:31:19	46
345	http://baidu.com/site?ad=115	8	tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla.	2022-07-09 03:29:44	4
346	http://bbc.co.uk/site?page=1&offset=1	32	posuere cubilia Curae Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus.	2024-04-06 19:05:35	61
347	http://naver.com/sub?str=se	14	lectus.	2022-05-25 12:08:51	64
348	http://netflix.com/one?q=test	14	tortor.	2023-06-14 17:46:16	97
349	https://yahoo.com/group/9?page=1&offset=1	65	varius orci, in consequat enim diam vel	2023-04-09 22:01:31	86
350	https://netflix.com/site?q=0	93	varius. Nam porttitor scelerisque neque. Nullam	2023-12-27 05:27:18	48
351	http://cnn.com/settings?client=g	95	Vestibulum accumsan neque et nunc. Quisque ornare tortor	2023-04-22 11:11:45	47
352	http://youtube.com/en-us?search=1&q=de	95	sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor	2024-05-11 06:11:34	4
353	http://ebay.com/sub?str=se	45	pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus	2023-07-29 15:50:35	76
354	http://guardian.co.uk/settings?q=0	68	montes, nascetur ridiculus mus. Proin vel nisl. Quisque	2023-05-22 19:02:37	28
355	https://google.com/sub/cars?p=8	63	ad litora	2024-05-04 08:02:32	13
\.


--
-- Data for Name: subscriptions; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.subscriptions (id, on_user_id, on_community_id, is_subscribed) FROM stdin;
1	40	67	t
2	91	12	t
3	47	41	f
4	34	66	t
5	33	92	f
6	65	67	t
7	73	79	t
8	55	28	t
9	6	4	f
10	96	30	f
11	86	11	t
12	23	62	t
13	86	86	f
14	79	59	t
15	22	27	f
16	95	27	t
17	89	59	f
18	75	47	t
19	7	21	f
20	13	62	f
21	37	75	f
22	72	92	f
23	64	10	t
24	94	3	f
25	38	75	f
26	18	91	t
27	91	22	t
28	56	11	f
29	10	78	t
30	41	97	t
31	86	35	f
32	93	23	f
33	65	74	f
34	2	66	f
35	97	90	t
36	47	11	t
37	47	51	t
38	4	41	f
39	49	15	f
40	83	96	t
41	9	71	t
42	47	71	f
43	60	56	f
44	17	43	t
45	45	39	f
46	78	50	t
47	18	72	f
48	27	5	t
49	82	45	t
50	69	29	t
51	57	62	t
52	78	89	f
53	96	100	f
54	46	76	t
55	36	44	t
56	13	40	f
57	32	76	f
58	84	32	f
59	6	74	t
60	94	77	f
61	4	18	t
62	77	85	t
63	59	82	t
64	42	75	f
65	53	74	t
66	34	42	f
67	77	25	t
68	23	16	f
69	57	81	t
70	29	19	t
71	45	41	f
72	70	11	t
73	57	64	f
74	71	73	t
75	24	42	t
76	84	56	f
77	45	15	t
78	96	47	t
79	79	72	f
80	10	48	t
81	68	2	f
82	58	37	f
83	11	70	t
84	2	25	t
85	34	20	f
86	22	52	f
87	45	3	t
88	94	8	t
89	79	80	t
90	31	12	f
91	84	75	t
92	37	63	t
93	51	19	f
94	88	61	t
95	75	97	t
96	87	25	t
97	69	29	f
98	13	73	f
99	100	82	t
100	8	36	t
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.users (id, first_name, last_name, email, phone, main_photo_id, created_at) FROM stdin;
1	Dominic	Hanson	turpis@hotmail.net	1-961-613-4865	54	2023-11-09 00:42:00
2	Jenna	Petty	pellentesque@aol.couk	1-848-312-4838	53	2023-06-08 09:28:04
3	Brenda	Reynolds	dapibus.id@icloud.edu	1-666-451-9464	93	2023-09-04 15:05:40
4	Lucius	Estrada	nulla.donec@hotmail.couk	625-1540	69	2024-01-12 16:31:32
5	Dacey	Salinas	lobortis.ultrices.vivamus@protonmail.net	1-743-151-8823	57	2022-11-19 04:40:39
6	Hedda	Ferrell	pellentesque.habitant.morbi@icloud.net	1-477-780-6726	48	2023-11-16 11:01:10
7	Imelda	Mcintosh	elit.curabitur@yahoo.com	534-6884	26	2022-09-11 11:23:16
8	Teegan	Dunlap	nibh@aol.ca	1-580-770-2937	12	2023-03-26 02:19:14
9	Ursula	Mayo	enim.etiam.gravida@outlook.couk	1-478-742-6425	92	2022-11-17 04:37:39
10	Raya	Stark	dolor.fusce@icloud.edu	1-677-332-6926	27	2024-01-30 13:10:09
11	Andrew	Salinas	proin.dolor.nulla@google.couk	561-1805	45	2022-12-07 09:57:14
12	Clinton	Riddle	dui.quis.accumsan@google.ca	1-226-963-3852	39	2023-03-01 05:21:05
13	Norman	Duncan	sed.congue@protonmail.couk	1-540-638-1064	97	2022-06-20 02:43:23
14	Athena	Weiss	ridiculus.mus@aol.net	1-634-604-2151	97	2022-11-28 09:21:45
15	Nerea	Benjamin	lectus.quis.massa@google.ca	741-7413	73	2023-04-02 06:00:55
16	Noel	Wiley	velit.justo.nec@aol.org	524-2217	2	2023-06-16 14:30:09
17	Camden	Dillard	pede.suspendisse.dui@protonmail.ca	1-855-533-7880	77	2022-12-23 05:53:22
18	Quail	Pace	aliquam.adipiscing@google.net	1-636-727-2133	24	2022-11-08 15:49:02
19	Sophia	Beck	in.consectetuer@yahoo.org	1-838-386-3191	61	2022-08-08 04:22:05
20	Ferris	Wheeler	elit.a@hotmail.net	873-2443	51	2023-02-05 03:58:09
21	Leonard	Levy	ridiculus.mus@google.ca	1-146-347-8241	43	2023-02-04 20:02:31
22	Tanner	Cash	velit.sed@protonmail.edu	325-6152	42	2023-02-14 21:45:17
23	Keelie	Curry	in.consequat.enim@protonmail.org	377-0602	34	2024-01-19 11:49:20
24	Dean	Hutchinson	vestibulum.ut@hotmail.couk	1-431-885-3933	35	2024-02-15 14:37:10
25	Richard	Wilkerson	eu.tempor@icloud.couk	1-163-477-3864	85	2024-02-26 21:34:22
26	Sharon	Kaufman	consectetuer.mauris@google.edu	1-768-106-6377	21	2023-02-21 15:26:07
27	Driscoll	Mcfadden	vel.nisl@yahoo.com	787-1296	46	2023-02-09 23:47:24
28	Rajah	Tanner	tempus.eu@google.org	1-546-182-6193	75	2023-12-13 15:00:09
29	Anastasia	Sims	nisi.mauris@protonmail.couk	518-3360	56	2024-04-01 11:45:07
30	Dale	Alvarez	suspendisse.sagittis@yahoo.ca	1-574-847-1927	34	2023-08-05 08:09:25
31	Patrick	Shepard	leo.vivamus.nibh@google.com	1-223-710-1986	61	2022-07-12 02:05:19
32	Jesse	Leon	aenean.massa@protonmail.couk	412-7783	3	2023-07-07 04:19:29
33	Wallace	Frye	dictum.magna@google.com	757-6461	75	2024-04-01 04:20:32
34	Robin	Mclaughlin	augue.ut.lacus@yahoo.couk	1-617-266-2681	55	2024-02-14 17:29:48
35	Nathan	Casey	vivamus.euismod@google.com	1-250-831-0274	100	2022-10-14 11:29:48
36	Ora	Stanley	justo.praesent.luctus@hotmail.com	1-476-968-8404	98	2023-02-06 00:11:44
37	Axel	Lang	sociis.natoque@yahoo.ca	872-3388	61	2023-02-13 23:44:48
38	Lucian	Burch	placerat.orci.lacus@aol.edu	237-5449	74	2023-10-25 07:58:19
39	Freya	Puckett	elit.etiam@google.com	1-803-244-3137	22	2023-08-01 03:18:24
40	Ariel	Wolf	at.velit@hotmail.org	316-8775	2	2022-06-16 11:09:36
41	Colby	Copeland	duis.sit@google.net	1-312-938-3426	62	2022-08-03 22:15:04
42	Hiram	Pearson	magna.praesent.interdum@outlook.com	200-4844	34	2023-05-12 23:15:57
43	Francis	Stephenson	lacus.quisque.purus@hotmail.edu	1-715-888-4680	42	2023-06-05 18:46:46
44	Leah	Rhodes	morbi.non@icloud.edu	1-578-779-3343	61	2024-01-04 13:24:59
45	Claire	Snider	ante@hotmail.com	734-2404	15	2024-02-11 10:51:35
46	Roanna	Sims	a.scelerisque@google.com	863-6481	25	2024-02-29 08:36:41
47	Riley	Pennington	laoreet.lectus@icloud.edu	763-7368	31	2022-12-09 14:09:11
48	Kaseem	Weeks	varius@protonmail.ca	293-5014	41	2024-04-12 03:40:08
49	Zelda	Sanchez	ut.cursus@yahoo.ca	1-361-966-7833	64	2023-04-30 17:34:13
50	Kelly	Nelson	fermentum.convallis@aol.couk	414-2355	63	2023-03-14 09:42:52
51	Barbara	Harris	dis.parturient@hotmail.org	575-3732	11	2023-03-07 19:44:50
52	Ulric	Finch	eu.erat.semper@icloud.net	264-7406	90	2024-01-21 04:45:04
53	Serena	Head	cubilia.curae@hotmail.ca	1-397-476-5820	63	2024-05-10 11:13:03
54	Libby	Richards	lacinia.vitae@hotmail.com	814-3153	95	2023-02-13 14:54:47
55	Shoshana	Davidson	et.malesuada@aol.net	221-3068	85	2023-09-30 21:44:26
56	Ivor	Hatfield	urna.convallis@aol.couk	742-3181	2	2024-03-09 03:29:33
57	Jeremy	Lawrence	luctus.curabitur.egestas@outlook.edu	787-9931	7	2024-02-16 21:24:19
58	Deirdre	Howell	aliquet@yahoo.com	1-581-678-4831	95	2024-03-12 01:10:02
59	TaShya	Joseph	nascetur.ridiculus@protonmail.org	817-9223	15	2022-10-17 23:14:19
60	Ora	Lang	purus.nullam@yahoo.net	557-0361	71	2023-10-23 15:00:47
61	Caesar	Norris	dolor.vitae@icloud.com	779-7149	4	2024-01-14 16:29:04
62	Scott	Armstrong	at.libero.morbi@yahoo.com	1-268-871-2540	79	2024-03-20 04:16:49
63	Isabella	Hammond	nulla.semper@aol.ca	1-732-759-1522	85	2023-08-13 17:50:00
64	Wallace	Dillard	consectetuer.ipsum.nunc@protonmail.ca	867-2374	7	2022-09-08 05:44:59
65	Sawyer	Schmidt	arcu@icloud.ca	224-2141	12	2023-10-28 10:44:38
66	Zeph	Kim	tellus.faucibus@outlook.ca	1-897-325-4243	56	2023-09-18 12:43:20
67	Honorato	Lambert	curabitur.massa@google.ca	1-467-406-7753	91	2022-12-04 16:23:23
68	Chancellor	Levine	nulla.ante.iaculis@icloud.ca	518-8343	76	2023-01-10 19:11:39
69	Stacy	Alexander	posuere@protonmail.net	372-7095	58	2022-08-06 13:32:03
70	Ingrid	Carlson	et.magnis@icloud.couk	1-586-151-8163	2	2023-11-11 14:07:02
71	Devin	Sampson	aliquet@hotmail.ca	1-672-389-3150	96	2022-11-02 23:42:35
72	Imani	Benton	ultrices.vivamus.rhoncus@outlook.couk	782-2112	54	2022-07-30 15:54:52
73	Judith	Glass	lectus.a.sollicitudin@google.ca	1-380-587-2213	48	2022-10-13 22:23:31
74	Grace	Morales	in.tincidunt.congue@outlook.org	1-761-336-7881	38	2023-03-19 09:10:57
75	Carly	Owen	cursus.vestibulum.mauris@icloud.org	738-2836	25	2024-05-05 08:04:04
76	Graiden	Morse	nunc.ac.mattis@protonmail.org	1-384-712-4515	84	2022-11-13 21:00:15
77	Ifeoma	Skinner	hymenaeos.mauris@protonmail.ca	647-4628	38	2023-10-31 00:53:30
78	Branden	Morgan	semper.nam@outlook.edu	1-463-622-1151	59	2022-05-27 22:05:14
79	Isaac	Bridges	arcu.vestibulum@hotmail.net	1-661-255-1687	83	2023-03-16 07:35:58
80	Camden	Hickman	eget@google.couk	1-888-506-9321	5	2023-02-26 22:09:26
81	Salvador	Singleton	sit@google.couk	1-243-973-5425	54	2023-05-17 21:18:03
82	Joseph	Lynn	luctus.felis@hotmail.ca	794-5834	4	2022-10-07 15:03:06
83	Wade	Bonner	amet@hotmail.net	587-1354	2	2022-06-20 09:41:30
84	Daphne	Figueroa	penatibus@google.couk	1-713-923-8452	33	2024-04-05 08:41:57
85	Brenna	Allen	et@protonmail.net	1-489-554-6773	10	2023-04-28 23:27:48
86	Alfreda	Herring	sem.mollis.dui@yahoo.couk	331-5236	54	2023-04-10 05:04:01
87	Whitney	Solis	lobortis.quis@outlook.ca	1-678-375-0883	76	2022-07-14 14:16:13
88	Hop	Hodge	quisque.tincidunt.pede@outlook.net	583-3236	43	2024-04-04 06:49:55
89	Shaine	Olson	vel.arcu.eu@icloud.ca	473-0477	75	2023-08-08 20:58:09
90	Tyrone	Stewart	ligula.consectetuer.rhoncus@aol.org	1-666-438-4139	54	2022-12-19 04:58:30
91	Malachi	Mckenzie	ac.orci.ut@yahoo.com	912-4395	66	2023-08-29 17:16:55
92	Brody	Mckinney	sed.molestie@hotmail.com	686-9258	18	2022-09-19 08:13:46
93	Thane	Melton	ligula.eu.enim@protonmail.org	931-6223	22	2023-03-04 17:43:30
94	Althea	Tran	sed@yahoo.com	234-5812	63	2024-01-06 15:32:09
95	Glenna	Morton	in.faucibus@aol.net	1-824-474-4612	44	2022-11-19 23:44:36
96	Belle	Davis	sodales.mauris.blandit@yahoo.couk	1-689-984-7361	93	2023-03-19 18:17:51
97	Ross	Whitaker	ridiculus.mus@outlook.ca	395-6568	26	2023-08-11 14:18:50
98	Mona	Mayo	odio.nam@hotmail.org	1-537-889-8898	77	2022-06-05 15:45:06
99	Mikayla	Schroeder	aliquet@protonmail.net	898-5855	57	2022-08-15 02:48:17
100	Mark	Weeks	vel.vulputate@outlook.net	1-145-644-8003	42	2022-07-13 10:22:45
\.


--
-- Data for Name: video; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.video (id, url, owner_id, description, uploaded_at, size) FROM stdin;
1	https://wikipedia.org/fr?ad=115	94	risus. Donec	2023-08-15 16:50:35	35
2	http://bbc.co.uk/group/9?q=0	29	semper, dui lectus rutrum urna, nec luctus felis purus ac	2023-09-29 21:55:48	95
3	http://pinterest.com/en-ca?k=0	74	Aliquam rutrum lorem ac risus. Morbi metus.	2024-04-02 07:30:30	9
4	https://netflix.com/site?gi=100	90	in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo	2023-01-06 12:56:16	82
5	https://whatsapp.com/sub/cars?q=4	27	ultrices. Duis volutpat nunc sit amet metus. Aliquam erat	2023-03-09 21:11:35	61
6	https://youtube.com/en-ca?page=1&offset=1	68	egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer	2022-10-05 18:39:03	2
7	http://guardian.co.uk/site?search=1&q=de	20	massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus	2022-07-29 10:08:34	76
8	http://google.com/one?ab=441&aad=2	5	Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum	2022-11-06 23:52:02	30
9	https://instagram.com/fr?search=1	44	lobortis quam a felis	2023-09-15 14:18:15	53
10	https://instagram.com/en-ca?g=1	18	Nullam vitae diam. Proin dolor. Nulla semper tellus id	2022-11-19 15:13:31	35
11	https://wikipedia.org/site?p=8	76	malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt,	2022-11-01 07:18:36	46
12	https://wikipedia.org/user/110?search=1	57	tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer	2023-02-05 18:02:01	59
13	http://nytimes.com/settings?q=4	69	sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant	2023-10-10 03:06:41	8
14	https://guardian.co.uk/sub/cars?ab=441&aad=2	18	tempus, lorem fringilla ornare placerat,	2023-03-20 10:27:28	43
15	http://baidu.com/settings?page=1&offset=1	99	vulputate, posuere vulputate, lacus. Cras interdum. Nunc	2024-03-11 14:52:34	24
16	https://pinterest.com/group/9?q=0	83	mauris a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas.	2024-04-19 21:23:56	43
17	http://zoom.us/sub?q=4	2	Phasellus at augue id ante dictum cursus. Nunc mauris elit,	2023-01-17 08:39:19	70
18	http://wikipedia.org/user/110?k=0	12	lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc	2022-07-25 11:16:16	1
19	https://baidu.com/group/9?search=1	6	elementum, dui quis accumsan convallis, ante lectus convallis	2023-02-09 12:21:17	67
20	https://guardian.co.uk/site?q=0	74	eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed	2024-04-08 08:55:25	29
21	https://baidu.com/user/110?k=0	63	vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus	2024-04-19 20:05:07	93
22	http://wikipedia.org/sub/cars?ab=441&aad=2	70	libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus.	2024-01-07 14:44:41	50
23	https://bbc.co.uk/user/110?k=0	54	lacus. Etiam bibendum fermentum metus.	2023-08-31 16:55:13	17
24	https://youtube.com/en-us?p=8	5	non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare,	2024-04-14 00:59:17	70
25	https://bbc.co.uk/site?client=g	62	ornare sagittis felis. Donec tempor,	2022-10-22 14:34:40	53
26	http://guardian.co.uk/fr?str=se	6	nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu,	2024-01-19 15:19:34	74
27	https://pinterest.com/one?str=se	6	arcu. Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus pede, ultrices a, auctor non,	2023-10-20 16:02:58	72
28	http://zoom.us/sub/cars?g=1	66	eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam	2022-06-07 09:16:09	45
29	http://instagram.com/sub/cars?g=1	24	elit pede, malesuada vel, venenatis vel,	2022-12-30 10:09:11	46
30	http://twitter.com/fr?q=0	87	et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse	2024-04-25 16:14:53	43
31	https://reddit.com/en-ca?str=se	14	penatibus et magnis dis parturient montes, nascetur ridiculus mus.	2022-07-22 20:51:41	97
32	https://netflix.com/user/110?p=8	99	Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam	2022-06-06 01:07:09	47
33	http://instagram.com/group/9?gi=100	33	ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent	2023-12-29 00:27:58	52
34	https://twitter.com/fr?p=8	38	augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor	2022-08-26 22:02:26	63
35	https://wikipedia.org/en-us?q=11	99	nec orci. Donec nibh. Quisque nonummy	2022-10-21 15:14:41	77
36	http://twitter.com/en-ca?str=se	10	Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus	2024-03-19 00:57:55	43
37	http://wikipedia.org/group/9?str=se	6	Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit	2024-05-10 13:43:52	34
38	https://facebook.com/sub?g=1	98	litora torquent per conubia nostra, per inceptos hymenaeos.	2023-02-07 07:26:33	11
39	https://google.com/one?str=se	86	erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris	2022-08-29 16:24:31	48
40	https://naver.com/site?g=1	90	mollis dui, in sodales elit erat vitae risus. Duis a mi fringilla mi lacinia mattis.	2023-01-10 07:36:32	49
41	http://naver.com/site?q=0	12	mauris ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum	2022-07-10 00:34:59	45
42	http://instagram.com/en-ca?client=g	43	massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim.	2022-06-16 12:17:30	35
43	https://ebay.com/sub/cars?ab=441&aad=2	81	vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed	2023-10-20 06:39:50	37
44	http://naver.com/en-us?q=4	82	Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus	2022-09-02 13:58:27	7
45	https://guardian.co.uk/fr?str=se	90	viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel	2024-01-20 09:19:30	7
46	http://instagram.com/sub?q=test	96	Aenean eget magna. Suspendisse tristique neque venenatis	2023-11-12 12:37:32	2
47	https://guardian.co.uk/en-ca?p=8	20	eget varius	2024-04-09 01:52:20	81
48	https://twitter.com/settings?q=0	77	nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse	2022-10-14 06:16:46	78
49	http://reddit.com/group/9?k=0	49	et risus. Quisque libero lacus, varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat,	2024-02-10 23:13:05	29
50	http://zoom.us/en-ca?ab=441&aad=2	8	nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque.	2022-08-22 21:29:56	28
\.


--
-- Name: communities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.communities_id_seq', 100, true);


--
-- Name: friendship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.friendship_id_seq', 100, true);


--
-- Name: friendship_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.friendship_statuses_id_seq', 116, true);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.messages_id_seq', 100, true);


--
-- Name: photo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.photo_id_seq', 355, true);


--
-- Name: subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.subscriptions_id_seq', 100, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.users_id_seq', 102, true);


--
-- Name: video_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.video_id_seq', 50, true);


--
-- Name: communities communities_name_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities
    ADD CONSTRAINT communities_name_key UNIQUE (name);


--
-- Name: communities communities_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities
    ADD CONSTRAINT communities_pkey PRIMARY KEY (id);


--
-- Name: communities_users communities_users_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities_users
    ADD CONSTRAINT communities_users_pkey PRIMARY KEY (community_id, user_id);


--
-- Name: friendship friendship_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship
    ADD CONSTRAINT friendship_pkey PRIMARY KEY (id);


--
-- Name: friendship_statuses friendship_statuses_name_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship_statuses
    ADD CONSTRAINT friendship_statuses_name_key UNIQUE (name);


--
-- Name: friendship_statuses friendship_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship_statuses
    ADD CONSTRAINT friendship_statuses_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: photo photo_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.photo
    ADD CONSTRAINT photo_pkey PRIMARY KEY (id);


--
-- Name: photo photo_url_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.photo
    ADD CONSTRAINT photo_url_key UNIQUE (url);


--
-- Name: subscriptions subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: video video_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_pkey PRIMARY KEY (id);


--
-- Name: video video_url_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_url_key UNIQUE (url);


--
-- PostgreSQL database dump complete
--


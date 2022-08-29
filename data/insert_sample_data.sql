--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

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
-- Data for Name: building_type; Type: TABLE DATA; Schema: qgisdbtest; Owner: postgres
--

COPY qgisdbtest.building_type (id, definition) FROM stdin;
1	Residential
2	Business
3	Educational
4	Institutional
\.


--
-- Data for Name: parcel_type; Type: TABLE DATA; Schema: qgisdbtest; Owner: postgres
--

COPY qgisdbtest.parcel_type (id, definition) FROM stdin;
1	Road
2	Water
3	Lot
\.


--
-- Data for Name: land_parcel; Type: TABLE DATA; Schema: qgisdbtest; Owner: postgres
--

COPY qgisdbtest.land_parcel (id, parcel_type_id, geom, name) FROM stdin;
6	1	0103000020110F00000100000011000000BBB1EE97367E46C1099D1115CB3C5FC15D17724ADD7E46C1B874CF43443C5FC1ED6668054A7F46C1722AE9D4D93B5FC1A80912597C7F46C138A87CF7953B5FC1DAFAA0E0B67F46C1B04517FF5E3B5FC13E1A1D6EA77F46C1523F73E25A3B5FC1DCB424596C7F46C174A5A85F923B5FC13C9DE56B447F46C1F3D0DA36C83B5FC1A52437F8397F46C11483F84ED63B5FC11308CDC4EC7E46C1AA2BD9E0213C5FC1BDA1D807CE7E46C180B78EF73F3C5FC121A4556C997E46C107327C836A3C5FC117863CE88F7E46C19E8AB135723C5FC1A706E79E297E46C1C1B33BEFC43C5FC1F5A14FF2457D46C132B6A80A143D5FC1D24ADAEE4F7D46C1F2351F3A1B3D5FC1BBB1EE97367E46C1099D1115CB3C5FC1	Road1
7	1	0103000020110F00000100000028000000FD163858E27A46C1D59A0E36123C5FC138F16CBBFA7A46C1AB4C979FD53B5FC1516E9B58017B46C1C99BB280AB3B5FC1BC66DAB7027B46C19BBED0C3A23B5FC19557D029097B46C1CEC02BB8793B5FC1CE4A169E347B46C11F573DF4433B5FC16DA2C7F28D7B46C132D130A1273B5FC1914CC243EC7B46C10324D380273B5FC1F4B6E22CA67C46C137EA0641273B5FC14F0EBC11287D46C19A142D31433B5FC152AE09DE2D7D46C1C3EC21B97B3B5FC1850E9A14277D46C1491BE79FAE3B5FC1B7C9838B157D46C18AE61A9CD53B5FC1CBB41F9D117D46C1321E8759DE3B5FC1C74D4D87FC7C46C139E30A3A0D3C5FC1123CF5A9DC7C46C1A206BBF44C3C5FC1B9834CB9CD7C46C14B7DCB315F3C5FC1EAFAFD7BA27C46C1137EF9FA933C5FC14A319661527C46C18EDC4C73D03C5FC127289EF8607C46C183E33948D53C5FC13EAB9206B27C46C165580B18983C5FC11814C28DDE7C46C105E927BC613C5FC1DC7AF655ED7C46C1B2397AB04F3C5FC1F1FD728E0D7D46C18933813F0F3C5FC1C50138D8217D46C17156A424E23B5FC1B1169CC6257D46C1C91E3867D93B5FC193039773387D46C1FF6613E2AF3B5FC1165FB0653F7D46C1B13855CA7B3B5FC1FCD189013E7D46C1F158DD396E3B5FC10B7512FD387D46C1D28E514E3D3B5FC16E9BD5C1A97C46C1D130CA7F1E3B5FC12CAB8AD8887B46C17802EFE21E3B5FC13698967F267B46C18FBDDE113E3B5FC1497193EDF77A46C19E9FD5B0773B5FC1C46F475EE97A46C1D39BD469D43B5FC1C721CEEDD07A46C195F94121113C5FC1FCEEA0BCC67A46C10FCAD82F7A3C5FC148055E37D87A46C1B53D609C7A3C5FC15F5CBE83DF7A46C1D545BA612F3C5FC1FD163858E27A46C1D59A0E36123C5FC1	Road2
8	1	0103000020110F00000100000024000000CB88DDC6247F46C185974758C83C5FC171D30CA7D27E46C1282516A4883C5FC121A4556C997E46C107327C836A3C5FC14521CAA2247E46C1F11B78082D3C5FC1AE3D15771C7E46C17681496F293C5FC199456F33B07D46C19A9763C1F93B5FC14349138BA47D46C1B824E507F73B5FC1B1169CC6257D46C1C91E3867D93B5FC1B7C9838B157D46C18AE61A9CD53B5FC1F96A0C10E77C46C1A6F600BFCA3B5FC17330FC084A7C46C12193327FB93B5FC1AC7CDA541C7C46C1D6B0F479B43B5FC1A051B745A97B46C1B7363400AD3B5FC1D45A49680D7B46C191FABCDFA23B5FC1BC66DAB7027B46C19BBED0C3A23B5FC148C232F2517A46C1951D0BF6A03B5FC1F863CDCAA87946C1676A1294A03B5FC18B8C7C5C697946C1CB5AB8EAA33B5FC1466F79316B7946C1C38F699EAC3B5FC1564FD5ABA97946C1EB9E9A54A93B5FC1C6B65ABA517A46C15DA4F0B5A93B5FC1516E9B58017B46C1C99BB280AB3B5FC12482F1180C7B46C18562C89CAB3B5FC134FD1652197C46C128D9B51ABD3B5FC17DBB2FBA447C46C1B2795BDFC13B5FC1B3DA4169E17C46C1CA677F15D33B5FC1CBB41F9D117D46C1321E8759DE3B5FC1C50138D8217D46C17156A424E23B5FC119786384A67D46C182C3A026013C5FC1356AE67B187E46C1BD2A7257333C5FC117863CE88F7E46C19E8AB135723C5FC153253FD5C47E46C1B67F52128E3C5FC173C63CF9157F46C1ABC52C03CD3C5FC1D44CD6E74A7F46C1FD855FEBF73C5FC15436D1CC597F46C127456853F33C5FC1CB88DDC6247F46C185974758C83C5FC1	Road3
9	3	0103000020110F000001000000070000006F871E9E7F7E46C1CE3E5FCDF33B5FC1AE3D15771C7E46C17681496F293C5FC14521CAA2247E46C1F11B78082D3C5FC121A4556C997E46C107327C836A3C5FC1BDA1D807CE7E46C180B78EF73F3C5FC11308CDC4EC7E46C1AA2BD9E0213C5FC16F871E9E7F7E46C1CE3E5FCDF33B5FC1	Lot1
10	3	0103000020110F00000100000007000000DE2C90CFD17E46C1768F549DB23B5FC16BCA387C3D7E46C1EC5E3FE18B3B5FC14349138BA47D46C1B824E507F73B5FC199456F33B07D46C19A9763C1F93B5FC1AE3D15771C7E46C17681496F293C5FC16F871E9E7F7E46C1CE3E5FCDF33B5FC1DE2C90CFD17E46C1768F549DB23B5FC1	Lot2
11	3	0103000020110F000001000000060000006F871E9E7F7E46C1CE3E5FCDF33B5FC11308CDC4EC7E46C1AA2BD9E0213C5FC1A52437F8397F46C11483F84ED63B5FC13C9DE56B447F46C1F3D0DA36C83B5FC1DE2C90CFD17E46C1768F549DB23B5FC16F871E9E7F7E46C1CE3E5FCDF33B5FC1	Lot3
12	3	0103000020110F000001000000070000006BCA387C3D7E46C1EC5E3FE18B3B5FC1FCD189013E7D46C1F158DD396E3B5FC1165FB0653F7D46C1B13855CA7B3B5FC193039773387D46C1FF6613E2AF3B5FC1B1169CC6257D46C1C91E3867D93B5FC14349138BA47D46C1B824E507F73B5FC16BCA387C3D7E46C1EC5E3FE18B3B5FC1	Lot4
13	3	0103000020110F00000100000009000000850E9A14277D46C1491BE79FAE3B5FC152AE09DE2D7D46C1C3EC21B97B3B5FC14F0EBC11287D46C19A142D31433B5FC1F4B6E22CA67C46C137EA0641273B5FC19F807BE06F7C46C124FA6C6F7D3B5FC17330FC084A7C46C12193327FB93B5FC1F96A0C10E77C46C1A6F600BFCA3B5FC1B7C9838B157D46C18AE61A9CD53B5FC1850E9A14277D46C1491BE79FAE3B5FC1	Lot5
14	3	0103000020110F0000010000000500000025B40AC9D07B46C1168E27C26B3B5FC19F807BE06F7C46C124FA6C6F7D3B5FC1F4B6E22CA67C46C137EA0641273B5FC1914CC243EC7B46C10324D380273B5FC125B40AC9D07B46C1168E27C26B3B5FC1	Lot6
15	3	0103000020110F00000100000006000000A051B745A97B46C1B7363400AD3B5FC1AC7CDA541C7C46C1D6B0F479B43B5FC17330FC084A7C46C12193327FB93B5FC19F807BE06F7C46C124FA6C6F7D3B5FC125B40AC9D07B46C1168E27C26B3B5FC1A051B745A97B46C1B7363400AD3B5FC1	Lot7
16	3	0103000020110F00000100000009000000BC66DAB7027B46C19BBED0C3A23B5FC1D45A49680D7B46C191FABCDFA23B5FC1A051B745A97B46C1B7363400AD3B5FC125B40AC9D07B46C1168E27C26B3B5FC1914CC243EC7B46C10324D380273B5FC16DA2C7F28D7B46C132D130A1273B5FC1CE4A169E347B46C11F573DF4433B5FC19557D029097B46C1CEC02BB8793B5FC1BC66DAB7027B46C19BBED0C3A23B5FC1	Lot8
17	3	0103000020110F00000100000008000000B3DA4169E17C46C1CA677F15D33B5FC17DBB2FBA447C46C1B2795BDFC13B5FC16EBFD0A2067C46C1633452B0423C5FC1B9834CB9CD7C46C14B7DCB315F3C5FC1123CF5A9DC7C46C1A206BBF44C3C5FC1C74D4D87FC7C46C139E30A3A0D3C5FC1CBB41F9D117D46C1321E8759DE3B5FC1B3DA4169E17C46C1CA677F15D33B5FC1	Lot9
18	3	0103000020110F000001000000090000006EBFD0A2067C46C1633452B0423C5FC17DBB2FBA447C46C1B2795BDFC13B5FC134FD1652197C46C128D9B51ABD3B5FC12482F1180C7B46C18562C89CAB3B5FC1516E9B58017B46C1C99BB280AB3B5FC138F16CBBFA7A46C1AB4C979FD53B5FC1FD163858E27A46C1D59A0E36123C5FC15F5CBE83DF7A46C1D545BA612F3C5FC16EBFD0A2067C46C1633452B0423C5FC1	Lot10
19	3	0103000020110F0000010000000900000017863CE88F7E46C19E8AB135723C5FC1356AE67B187E46C1BD2A7257333C5FC119786384A67D46C182C3A026013C5FC1C50138D8217D46C17156A424E23B5FC1F1FD728E0D7D46C18933813F0F3C5FC1DC7AF655ED7C46C1B2397AB04F3C5FC11814C28DDE7C46C105E927BC613C5FC1A706E79E297E46C1C1B33BEFC43C5FC117863CE88F7E46C19E8AB135723C5FC1	Lot11
\.


--
-- Data for Name: building; Type: TABLE DATA; Schema: qgisdbtest; Owner: postgres
--

COPY qgisdbtest.building (id, land_parcel_id, building_type_id, name, building_year, geom) FROM stdin;
1	13	2	Building1	1999	0101000020110F00001EB23A4FC87C46C13163F5F25F3B5FC1
2	13	1	Building 2	\N	0101000020110F0000444CE6A6E47C46C10FD05963A53B5FC1
3	18	2	Building 3	\N	0101000020110F0000B7364230FD7B46C14837DBE6CF3B5FC1
4	18	2	Building 4	\N	0101000020110F00009074ED3F627B46C1BF50F0D0C83B5FC1
5	18	1	Building 5	\N	0101000020110F0000B60E99977E7B46C1C35700992A3C5FC1
\.


--
-- Data for Name: building_notes; Type: TABLE DATA; Schema: qgisdbtest; Owner: postgres
--

COPY qgisdbtest.building_notes (id, text, building_id) FROM stdin;
1	Note on building 1	1
2	Note 2	1
\.


--
-- Data for Name: contact; Type: TABLE DATA; Schema: qgisdbtest; Owner: postgres
--

COPY qgisdbtest.contact (id, name) FROM stdin;
1	Jack
2	Helen
3	Amelia
4	Mia
5	Thomas
\.


--
-- Data for Name: building_owners; Type: TABLE DATA; Schema: qgisdbtest; Owner: postgres
--

COPY qgisdbtest.building_owners (id_contact, id_building) FROM stdin;
2	2
3	2
3	1
5	4
5	3
4	5
5	5
\.


--
-- Data for Name: parcel_notes; Type: TABLE DATA; Schema: qgisdbtest; Owner: postgres
--

COPY qgisdbtest.parcel_notes (id, text, land_parcel_id) FROM stdin;
1	Pavement damages	7
2	Lane paintings missing	7
3	Note 1 for the lot 5	13
4	Note 2 for the lot 5	13
\.


--
-- Name: building_id_seq; Type: SEQUENCE SET; Schema: qgisdbtest; Owner: postgres
--

SELECT pg_catalog.setval('qgisdbtest.building_id_seq', 5, true);


--
-- Name: building_notes_id_seq; Type: SEQUENCE SET; Schema: qgisdbtest; Owner: postgres
--

SELECT pg_catalog.setval('qgisdbtest.building_notes_id_seq', 2, true);


--
-- Name: building_type_id_seq; Type: SEQUENCE SET; Schema: qgisdbtest; Owner: postgres
--

SELECT pg_catalog.setval('qgisdbtest.building_type_id_seq', 4, true);


--
-- Name: contact_id_seq; Type: SEQUENCE SET; Schema: qgisdbtest; Owner: postgres
--

SELECT pg_catalog.setval('qgisdbtest.contact_id_seq', 5, true);


--
-- Name: land_parcel_id_seq; Type: SEQUENCE SET; Schema: qgisdbtest; Owner: postgres
--

SELECT pg_catalog.setval('qgisdbtest.land_parcel_id_seq', 20, true);


--
-- Name: parcel_notes_id_seq; Type: SEQUENCE SET; Schema: qgisdbtest; Owner: postgres
--

SELECT pg_catalog.setval('qgisdbtest.parcel_notes_id_seq', 4, true);


--
-- Name: parcel_type_id_seq; Type: SEQUENCE SET; Schema: qgisdbtest; Owner: postgres
--

SELECT pg_catalog.setval('qgisdbtest.parcel_type_id_seq', 3, true);


--
-- PostgreSQL database dump complete
--

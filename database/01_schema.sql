-- QUERY TRUNCATED
--
-- PostgreSQL database dump
--


-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

-- Started on 2026-05-20 15:35:32

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
-- TOC entry 5185 (class 0 OID 16828)
-- Dependencies: 239
-- Data for Name: abwesenheit; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5186 (class 0 OID 16842)
-- Dependencies: 240
-- Data for Name: admin_benutzer; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.admin_benutzer (id) VALUES (1);


--
-- TOC entry 5188 (class 0 OID 16849)
-- Dependencies: 242
-- Data for Name: benutzer; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.benutzer (id, aktiv, benutzername, passworthash, rolle) VALUES (1, true, 'admin', '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9', 'ADMINISTRATOR');
INSERT INTO public.benutzer (id, aktiv, benutzername, passworthash, rolle) VALUES (35, true, 'ba', 'c8b470463d8d14419589a948adac62a0cbf92178dc74f09eae954cf7e34de7ae', 'LEHRER');
INSERT INTO public.benutzer (id, aktiv, benutzername, passworthash, rolle) VALUES (36, true, 'kl', 'c8b470463d8d14419589a948adac62a0cbf92178dc74f09eae954cf7e34de7ae', 'LEHRER');
INSERT INTO public.benutzer (id, aktiv, benutzername, passworthash, rolle) VALUES (37, true, 'ah', 'c8b470463d8d14419589a948adac62a0cbf92178dc74f09eae954cf7e34de7ae', 'LEHRER');
INSERT INTO public.benutzer (id, aktiv, benutzername, passworthash, rolle) VALUES (38, true, 'sch', 'c8b470463d8d14419589a948adac62a0cbf92178dc74f09eae954cf7e34de7ae', 'LEHRER');
INSERT INTO public.benutzer (id, aktiv, benutzername, passworthash, rolle) VALUES (39, true, 'schi', 'c8b470463d8d14419589a948adac62a0cbf92178dc74f09eae954cf7e34de7ae', 'LEHRER');
INSERT INTO public.benutzer (id, aktiv, benutzername, passworthash, rolle) VALUES (40, true, 'krz', 'c8b470463d8d14419589a948adac62a0cbf92178dc74f09eae954cf7e34de7ae', 'LEHRER');
INSERT INTO public.benutzer (id, aktiv, benutzername, passworthash, rolle) VALUES (41, true, 'zy', 'c8b470463d8d14419589a948adac62a0cbf92178dc74f09eae954cf7e34de7ae', 'LEHRER');
INSERT INTO public.benutzer (id, aktiv, benutzername, passworthash, rolle) VALUES (42, true, 'fa', 'c8b470463d8d14419589a948adac62a0cbf92178dc74f09eae954cf7e34de7ae', 'LEHRER');
INSERT INTO public.benutzer (id, aktiv, benutzername, passworthash, rolle) VALUES (43, true, 'ho', 'c8b470463d8d14419589a948adac62a0cbf92178dc74f09eae954cf7e34de7ae', 'LEHRER');
INSERT INTO public.benutzer (id, aktiv, benutzername, passworthash, rolle) VALUES (44, true, 'le', 'c8b470463d8d14419589a948adac62a0cbf92178dc74f09eae954cf7e34de7ae', 'LEHRER');
INSERT INTO public.benutzer (id, aktiv, benutzername, passworthash, rolle) VALUES (45, true, 'sf', 'c8b470463d8d14419589a948adac62a0cbf92178dc74f09eae954cf7e34de7ae', 'LEHRER');
INSERT INTO public.benutzer (id, aktiv, benutzername, passworthash, rolle) VALUES (46, true, 'ju', 'c8b470463d8d14419589a948adac62a0cbf92178dc74f09eae954cf7e34de7ae', 'LEHRER');
INSERT INTO public.benutzer (id, aktiv, benutzername, passworthash, rolle) VALUES (47, true, 'bu', 'c8b470463d8d14419589a948adac62a0cbf92178dc74f09eae954cf7e34de7ae', 'LEHRER');
INSERT INTO public.benutzer (id, aktiv, benutzername, passworthash, rolle) VALUES (48, true, 'br', 'c8b470463d8d14419589a948adac62a0cbf92178dc74f09eae954cf7e34de7ae', 'LEHRER');
INSERT INTO public.benutzer (id, aktiv, benutzername, passworthash, rolle) VALUES (49, true, 'ko', 'c8b470463d8d14419589a948adac62a0cbf92178dc74f09eae954cf7e34de7ae', 'LEHRER');
INSERT INTO public.benutzer (id, aktiv, benutzername, passworthash, rolle) VALUES (50, true, 'vo', 'c8b470463d8d14419589a948adac62a0cbf92178dc74f09eae954cf7e34de7ae', 'LEHRER');
INSERT INTO public.benutzer (id, aktiv, benutzername, passworthash, rolle) VALUES (51, true, 'hö', 'c8b470463d8d14419589a948adac62a0cbf92178dc74f09eae954cf7e34de7ae', 'LEHRER');
INSERT INTO public.benutzer (id, aktiv, benutzername, passworthash, rolle) VALUES (52, true, 'me', 'c8b470463d8d14419589a948adac62a0cbf92178dc74f09eae954cf7e34de7ae', 'LEHRER');
INSERT INTO public.benutzer (id, aktiv, benutzername, passworthash, rolle) VALUES (53, true, 're', 'c8b470463d8d14419589a948adac62a0cbf92178dc74f09eae954cf7e34de7ae', 'LEHRER');
INSERT INTO public.benutzer (id, aktiv, benutzername, passworthash, rolle) VALUES (54, true, '5b', '8d198e4a7ec9af1114ddb11a75891593db474823ffc283e55710c79d26126d36', 'SCHUELER');
INSERT INTO public.benutzer (id, aktiv, benutzername, passworthash, rolle) VALUES (55, true, '6a', '8d198e4a7ec9af1114ddb11a75891593db474823ffc283e55710c79d26126d36', 'SCHUELER');
INSERT INTO public.benutzer (id, aktiv, benutzername, passworthash, rolle) VALUES (56, true, '5a', '8d198e4a7ec9af1114ddb11a75891593db474823ffc283e55710c79d26126d36', 'SCHUELER');
INSERT INTO public.benutzer (id, aktiv, benutzername, passworthash, rolle) VALUES (57, true, '6b', '8d198e4a7ec9af1114ddb11a75891593db474823ffc283e55710c79d26126d36', 'SCHUELER');
INSERT INTO public.benutzer (id, aktiv, benutzername, passworthash, rolle) VALUES (58, true, '7a', '8d198e4a7ec9af1114ddb11a75891593db474823ffc283e55710c79d26126d36', 'SCHUELER');
INSERT INTO public.benutzer (id, aktiv, benutzername, passworthash, rolle) VALUES (59, true, '7b', '8d198e4a7ec9af1114ddb11a75891593db474823ffc283e55710c79d26126d36', 'SCHUELER');
INSERT INTO public.benutzer (id, aktiv, benutzername, passworthash, rolle) VALUES (60, true, '8a', '8d198e4a7ec9af1114ddb11a75891593db474823ffc283e55710c79d26126d36', 'SCHUELER');
INSERT INTO public.benutzer (id, aktiv, benutzername, passworthash, rolle) VALUES (61, true, '10a', '8d198e4a7ec9af1114ddb11a75891593db474823ffc283e55710c79d26126d36', 'SCHUELER');
INSERT INTO public.benutzer (id, aktiv, benutzername, passworthash, rolle) VALUES (62, true, '8b', '8d198e4a7ec9af1114ddb11a75891593db474823ffc283e55710c79d26126d36', 'SCHUELER');
INSERT INTO public.benutzer (id, aktiv, benutzername, passworthash, rolle) VALUES (63, true, '10b', '8d198e4a7ec9af1114ddb11a75891593db474823ffc283e55710c79d26126d36', 'SCHUELER');
INSERT INTO public.benutzer (id, aktiv, benutzername, passworthash, rolle) VALUES (64, true, '9a', '8d198e4a7ec9af1114ddb11a75891593db474823ffc283e55710c79d26126d36', 'SCHUELER');
INSERT INTO public.benutzer (id, aktiv, benutzername, passworthash, rolle) VALUES (65, true, '9b', '8d198e4a7ec9af1114ddb11a75891593db474823ffc283e55710c79d26126d36', 'SCHUELER');


--
-- TOC entry 5196 (class 0 OID 16994)
-- Dependencies: 250
-- Data for Name: erziehungsberechtigter; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.erziehungsberechtigter (id, adresse, beziehung, email, nachname, telefon, vorname, schueler_id) VALUES (2, 'Rehwinkel 21 58640', 'VATER', 'reda3426@gmail.com', 'Hamoud', '017672766838', 'Ismail', 7);
INSERT INTO public.erziehungsberechtigter (id, adresse, beziehung, email, nachname, telefon, vorname, schueler_id) VALUES (3, '1Straße 12', 'VATER', 'lukemax@gmail.com', 'Mix', '01234567', 'Luke', 3);
INSERT INTO public.erziehungsberechtigter (id, adresse, beziehung, email, nachname, telefon, vorname, schueler_id) VALUES (4, 'viertelstraße 12', 'MUTTER', 'andreas@gmail.com', 'Pio', '043435421321', 'Andreas', 8);
INSERT INTO public.erziehungsberechtigter (id, adresse, beziehung, email, nachname, telefon, vorname, schueler_id) VALUES (5, 'An der Amadeus 19 58638 Iserlohn', 'VATER', 'dopfn@fnearnings.de', 'Pitrowski', '017672788367', 'Vladimir', 5);
INSERT INTO public.erziehungsberechtigter (id, adresse, beziehung, email, nachname, telefon, vorname, schueler_id) VALUES (6, 'altstraße 1', 'MUTTER', 'lisa@gmail.com', 'Schmatz', '017456854', 'Lisa', 7);
INSERT INTO public.erziehungsberechtigter (id, adresse, beziehung, email, nachname, telefon, vorname, schueler_id) VALUES (7, 'An der Amadeus 18 58638 Iserlohn', 'MUTTER', 'schlüter_azubi_daniel_s@systems.de', 'Reisch', '017672789569', 'Natasha', 5);


--
-- TOC entry 5166 (class 0 OID 16672)
-- Dependencies: 220
-- Data for Name: fach; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.fach (id, bezeichnung, kuerzel, wochenstundenproklasse) VALUES (1, 'Mathematik', 'Ma', 4);
INSERT INTO public.fach (id, bezeichnung, kuerzel, wochenstundenproklasse) VALUES (2, 'Sport', 'Sp', 2);
INSERT INTO public.fach (id, bezeichnung, kuerzel, wochenstundenproklasse) VALUES (3, 'Deutsch', 'De', 4);
INSERT INTO public.fach (id, bezeichnung, kuerzel, wochenstundenproklasse) VALUES (4, 'Englisch', 'En', 4);
INSERT INTO public.fach (id, bezeichnung, kuerzel, wochenstundenproklasse) VALUES (5, 'Biologie', 'Bio', 2);
INSERT INTO public.fach (id, bezeichnung, kuerzel, wochenstundenproklasse) VALUES (6, 'Geschichte', 'Ge'

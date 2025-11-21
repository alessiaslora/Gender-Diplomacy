--Creazione della tabella gendip_dataset

CREATE TABLE IF NOT EXISTS gendip_dataset 
(
ID SERIAL PRIMARY KEY,
year integer,
cname_send character varying(200),
main_posting integer,
title integer,
gender integer,
cname_receive character varying(200),
ccode_send integer,
ccodealp_send character varying(100),
ccodecow_send integer,
region_send integer,
gme_send integer,
v2lgfemleg_send numeric(10,2),
ffp_send integer,
ccode_receive integer,
ccodealp_receive character varying(200),
ccodecow_receive integer,
region_receive integer,
gme_receive integer,
ffp_receive integer
);

--I dati della tabella di Excel GenDip_dataset, una volta formattati, li ho importati tramite il Prompt dei comandi
--impostando il seguente comando sul database geninformation

geninformation=# \COPY gendip_dataset (year, cname_send, main_posting, title, gender, cname_receive, ccod
e_send, ccodealp_send, ccodecow_send, region_send, gme_send, v2lgfemleg_send, ffp_send, ccode_receive, cco
dealp_receive, ccodecow_receive, region_receive, gme_receive, ffp_receive) FROM 'C:\Temp\GenDip_Dataset_p
ublic_mainpostings_anonymous_1968-2021_2023-05-30.csv' DELIMITER ';' CSV HEADER;
COPY 94509
geninformation=#

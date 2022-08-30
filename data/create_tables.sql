-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler version: 0.9.4
-- PostgreSQL version: 13.0
-- Project Site: pgmodeler.io
-- Model Author: ---

-- Database creation must be performed outside a multi lined SQL file. 
-- These commands were put in this file only as a convenience.
-- 
-- -- object: qgisdbtest | type: DATABASE --
-- -- DROP DATABASE IF EXISTS qgisdbtest;
-- CREATE DATABASE qgisdbtest;
-- -- ddl-end --
-- 

-- object: qgisdbtest | type: SCHEMA --
-- DROP SCHEMA IF EXISTS qgisdbtest CASCADE;
CREATE SCHEMA qgisdbtest;
-- ddl-end --
ALTER SCHEMA qgisdbtest OWNER TO postgres;
-- ddl-end --

SET search_path TO pg_catalog,public,qgisdbtest;
-- ddl-end --

-- object: postgis | type: EXTENSION --
-- DROP EXTENSION IF EXISTS postgis CASCADE;
CREATE EXTENSION postgis
WITH SCHEMA public;
-- ddl-end --

-- object: qgisdbtest.land_parcel | type: TABLE --
-- DROP TABLE IF EXISTS qgisdbtest.land_parcel CASCADE;
CREATE TABLE qgisdbtest.land_parcel (
	id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ,
	parcel_type_id smallint NOT NULL,
	name text NOT NULL,
	geom geometry(POLYGON, 3857) NOT NULL,
	CONSTRAINT parcel_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE qgisdbtest.land_parcel OWNER TO postgres;
-- ddl-end --

-- object: qgisdbtest.parcel_type | type: TABLE --
-- DROP TABLE IF EXISTS qgisdbtest.parcel_type CASCADE;
CREATE TABLE qgisdbtest.parcel_type (
	id smallint NOT NULL GENERATED BY DEFAULT AS IDENTITY ,
	definition text NOT NULL,
	CONSTRAINT parcel_types_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE qgisdbtest.parcel_type OWNER TO postgres;
-- ddl-end --

-- object: parcel_type_fk | type: CONSTRAINT --
-- ALTER TABLE qgisdbtest.land_parcel DROP CONSTRAINT IF EXISTS parcel_type_fk CASCADE;
ALTER TABLE qgisdbtest.land_parcel ADD CONSTRAINT parcel_type_fk FOREIGN KEY (parcel_type_id)
REFERENCES qgisdbtest.parcel_type (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: qgisdbtest.building | type: TABLE --
-- DROP TABLE IF EXISTS qgisdbtest.building CASCADE;
CREATE TABLE qgisdbtest.building (
	id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ,
	land_parcel_id integer NOT NULL,
	building_type_id smallint NOT NULL,
	name text NOT NULL,
	building_year smallint,
	geom geometry(POINT, 3857) NOT NULL,
	CONSTRAINT building_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE qgisdbtest.building OWNER TO postgres;
-- ddl-end --

-- object: qgisdbtest.building_type | type: TABLE --
-- DROP TABLE IF EXISTS qgisdbtest.building_type CASCADE;
CREATE TABLE qgisdbtest.building_type (
	id smallint NOT NULL GENERATED BY DEFAULT AS IDENTITY ,
	definition text NOT NULL,
	CONSTRAINT building_type_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE qgisdbtest.building_type OWNER TO postgres;
-- ddl-end --

-- object: building_type_fk | type: CONSTRAINT --
-- ALTER TABLE qgisdbtest.building DROP CONSTRAINT IF EXISTS building_type_fk CASCADE;
ALTER TABLE qgisdbtest.building ADD CONSTRAINT building_type_fk FOREIGN KEY (building_type_id)
REFERENCES qgisdbtest.building_type (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: land_parcel_fk | type: CONSTRAINT --
-- ALTER TABLE qgisdbtest.building DROP CONSTRAINT IF EXISTS land_parcel_fk CASCADE;
ALTER TABLE qgisdbtest.building ADD CONSTRAINT land_parcel_fk FOREIGN KEY (land_parcel_id)
REFERENCES qgisdbtest.land_parcel (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: qgisdbtest.contact | type: TABLE --
-- DROP TABLE IF EXISTS qgisdbtest.contact CASCADE;
CREATE TABLE qgisdbtest.contact (
	id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ,
	name text NOT NULL,
	CONSTRAINT contact_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE qgisdbtest.contact OWNER TO postgres;
-- ddl-end --

-- object: qgisdbtest.building_owners | type: TABLE --
-- DROP TABLE IF EXISTS qgisdbtest.building_owners CASCADE;
CREATE TABLE qgisdbtest.building_owners (
	id_contact integer NOT NULL,
	id_building integer NOT NULL,
	CONSTRAINT building_owners_pk PRIMARY KEY (id_contact,id_building)
);
-- ddl-end --

-- object: contact_fk | type: CONSTRAINT --
-- ALTER TABLE qgisdbtest.building_owners DROP CONSTRAINT IF EXISTS contact_fk CASCADE;
ALTER TABLE qgisdbtest.building_owners ADD CONSTRAINT contact_fk FOREIGN KEY (id_contact)
REFERENCES qgisdbtest.contact (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: building_fk | type: CONSTRAINT --
-- ALTER TABLE qgisdbtest.building_owners DROP CONSTRAINT IF EXISTS building_fk CASCADE;
ALTER TABLE qgisdbtest.building_owners ADD CONSTRAINT building_fk FOREIGN KEY (id_building)
REFERENCES qgisdbtest.building (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: idx_buildings_parcels_id | type: INDEX --
-- DROP INDEX IF EXISTS qgisdbtest.idx_buildings_parcels_id CASCADE;
CREATE INDEX idx_buildings_parcels_id ON qgisdbtest.building
USING btree
(
	land_parcel_id
);
-- ddl-end --

-- object: uidx_contact_name | type: INDEX --
-- DROP INDEX IF EXISTS qgisdbtest.uidx_contact_name CASCADE;
CREATE UNIQUE INDEX uidx_contact_name ON qgisdbtest.contact
USING btree
(
	name
);
-- ddl-end --

-- object: qgisdbtest.parcel_notes | type: TABLE --
-- DROP TABLE IF EXISTS qgisdbtest.parcel_notes CASCADE;
CREATE TABLE qgisdbtest.parcel_notes (
	id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ,
	text text NOT NULL,
	land_parcel_id integer NOT NULL,
	CONSTRAINT parcel_notes_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE qgisdbtest.parcel_notes OWNER TO postgres;
-- ddl-end --

-- object: qgisdbtest.building_notes | type: TABLE --
-- DROP TABLE IF EXISTS qgisdbtest.building_notes CASCADE;
CREATE TABLE qgisdbtest.building_notes (
	id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ,
	text text NOT NULL,
	building_id integer NOT NULL,
	CONSTRAINT building_notes_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE qgisdbtest.building_notes OWNER TO postgres;
-- ddl-end --

-- object: land_parcel_fk | type: CONSTRAINT --
-- ALTER TABLE qgisdbtest.parcel_notes DROP CONSTRAINT IF EXISTS land_parcel_fk CASCADE;
ALTER TABLE qgisdbtest.parcel_notes ADD CONSTRAINT land_parcel_fk FOREIGN KEY (land_parcel_id)
REFERENCES qgisdbtest.land_parcel (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: building_fk | type: CONSTRAINT --
-- ALTER TABLE qgisdbtest.building_notes DROP CONSTRAINT IF EXISTS building_fk CASCADE;
ALTER TABLE qgisdbtest.building_notes ADD CONSTRAINT building_fk FOREIGN KEY (building_id)
REFERENCES qgisdbtest.building (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: idx_building_notes_building_id | type: INDEX --
-- DROP INDEX IF EXISTS qgisdbtest.idx_building_notes_building_id CASCADE;
CREATE INDEX idx_building_notes_building_id ON qgisdbtest.building_notes
USING btree
(
	building_id
);
-- ddl-end --

-- object: idx_parcel_notes_land_parcel_id | type: INDEX --
-- DROP INDEX IF EXISTS qgisdbtest.idx_parcel_notes_land_parcel_id CASCADE;
CREATE INDEX idx_parcel_notes_land_parcel_id ON qgisdbtest.parcel_notes
USING btree
(
	land_parcel_id
);
-- ddl-end --

-- object: idx_buildings_building_type_id | type: INDEX --
-- DROP INDEX IF EXISTS qgisdbtest.idx_buildings_building_type_id CASCADE;
CREATE INDEX idx_buildings_building_type_id ON qgisdbtest.building
USING btree
(
	building_type_id
);
-- ddl-end --

-- object: idx_buildings_geom | type: INDEX --
-- DROP INDEX IF EXISTS qgisdbtest.idx_buildings_geom CASCADE;
CREATE INDEX idx_buildings_geom ON qgisdbtest.building
USING gist
(
	geom
);
-- ddl-end --

-- object: idx_land_parcel_pacrel_type_id | type: INDEX --
-- DROP INDEX IF EXISTS qgisdbtest.idx_land_parcel_pacrel_type_id CASCADE;
CREATE INDEX idx_land_parcel_pacrel_type_id ON qgisdbtest.land_parcel
USING btree
(
	parcel_type_id
);
-- ddl-end --

-- object: idx_land_parcel_geom | type: INDEX --
-- DROP INDEX IF EXISTS qgisdbtest.idx_land_parcel_geom CASCADE;
CREATE INDEX idx_land_parcel_geom ON qgisdbtest.land_parcel
USING gist
(
	geom
);
-- ddl-end --



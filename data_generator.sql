-- Function mostly copied from generate_random_point().
CREATE OR REPLACE FUNCTION generate_random_quasicentroid()
    RETURNS geometry AS
$func$
DECLARE
    -- Points are declared between -70/70 degrees on the Y-axis, and -180/180
    -- degrees on the X-axis, to allow room for creation of polygons and
    -- rendering on WMS (avoid cutoff in polar areas).
    x_min INTEGER := -30;
    x_max INTEGER := -20;
    y_min INTEGER := -60;
    y_max INTEGER := -55;
    srid INTEGER := 4326;
BEGIN
    RETURN (
    	
        ST_SetSRID(
            ST_MakePoint(
                random()*(x_max - x_min) + x_min,
                random()*(y_max - y_min) + y_min
            ),
            srid
        )
         );
   
END;
$func$
LANGUAGE 'plpgsql' VOLATILE;


CREATE OR REPLACE
FUNCTION generate_random_polygon(
    quasicentroid geometry
)
    RETURNS geometry AS
$func$
DECLARE
    idx INTEGER;

nodes geometry[];

angle FLOAT;

starting_angle FLOAT;

distance FLOAT;

max_distance FLOAT := 1;

BEGIN
-- NOTE: Do NOT wrap parentheses around fraction! 'plpgsql' will not
-- understand this query and will round down to 0.
starting_angle := random()* 1 / 3 * PI();

angle := starting_angle;
-- Set a maximum of 20 vertices for a polygon
    FOR idx IN 1 .. 20 LOOP
        distance := random() * max_distance;

SELECT
	array_append(
            nodes,
            ST_Translate(
                quasicentroid,
                sin(angle)* distance,
                cos(angle)* distance
            )
        )
INTO
	nodes;
-- NOTE: Do NOT wrap parentheses around fraction! 'plpgsql' will not
-- understand the query and will round down to 0.
angle := angle + random()* 2 / 3 * PI();

IF angle > 2 * PI() THEN EXIT;
END IF;
END LOOP;
-- Close the polygon
    SELECT
	array_append(
        nodes,
        nodes[1]
    )
INTO
	nodes;

RETURN ST_MakePolygon(
        ST_MakeLine(nodes)
    );
END;

$func$
LANGUAGE 'plpgsql' VOLATILE;



CREATE OR REPLACE FUNCTION generate_random_buildings_and_parcels(num_records INTEGER = 100)
    RETURNS INTEGER AS
$func$
DECLARE
    building geometry;
    parcel geometry;
    idxx INTEGER;
    
BEGIN
	DELETE FROM qgisdbtest.land_parcel WHERE id > 99;
	DELETE FROM qgisdbtest.building WHERE id > 99;
	
    SET seed TO 0.5;
    FOR idx IN 1 .. num_records - 1 LOOP
        idxx := idx + 100;
        building := generate_random_quasicentroid();
        parcel := generate_random_polygon(building);
        INSERT
	INTO
	qgisdbtest.land_parcel(id,
	parcel_type_id,
	geom,
	name)
VALUES (idxx, 
       floor(random() * 3 + 1)::int,
       ST_Transform(parcel,
3857),
CONCAT('Parcel', idxx)
      );
        INSERT INTO qgisdbtest.building(id, land_parcel_id, building_type_id, name, building_year, geom)
        VALUES (
        	idxx,
        	idxx,
        	floor(random() * 4 +1)::int,
        	CONCAT('Building', idxx),
        	floor(random() * 20 + 2000)::int,
        	ST_Transform(building, 3857)
        );
    END LOOP;
   RETURN num_records;

END;
$func$
LANGUAGE 'plpgsql' VOLATILE;






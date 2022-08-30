INSERT INTO qgisdbtest.parcel_type (id, definition) VALUES 
(1,	'Road'),
(2,	'Water'),
(3,	'Lot')
ON CONFLICT DO NOTHING
;
INSERT INTO qgisdbtest.building_type (id, definition) VALUES
(1, 'Residential'),
(2, 'Business'),
(3, 'Educational'),
(4, 'Institutional')
ON CONFLICT DO NOTHING
;

truncate qgisdbtest.land_parcel cascade;

insert into qgisdbtest.land_parcel(parcel_type_id, geom, name)
select
  pt.id,
  a.geom,
  CASE WHEN pt.definition = 'Water' THEN 'Lake' ELSE pt.definition END||' '||ROW_NUMBER() OVER (PARTITION BY pt.id)
from
  (
    SELECT
      hex.geom,
      CASE WHEN random() < 0.1 THEN 'Water' ELSE 'Lot' END parcel_type
    FROM
      ST_HexagonGrid(75, ST_MakeEnvelope(16190000, -1930000, 16240000, -1880000, 3857)) AS hex
  ) a
  JOIN qgisdbtest.parcel_type pt
    ON pt.definition = a.parcel_type
;

insert into qgisdbtest.building(land_parcel_id, building_type_id, name, building_year, geom)
select
  id,
  (random() * 3 + 1)::int building_type_id,
  'Building '||ROW_NUMBER() OVER (PARTITION BY id)||' on Lot '||id,
  (random() * 200 + 1820)::int building_year,
  geom
FROM
(
  SELECT
    id,

    (st_dump(ST_GeneratePoints(
      st_buffer(geom, -20),
      CASE
        WHEN random < 0.50 THEN 1
        WHEN random < 0.80 THEN 2
      ELSE 3 END
    ))).geom
  FROM
    (
      select
        *, random()
      from qgisdbtest.land_parcel TABLESAMPLE BERNOULLI (70)
      where parcel_type_id = (select id from qgisdbtest.parcel_type where definition = 'Lot')
    ) parcel
) a
;

insert into qgisdbtest.parcel_notes(land_parcel_id, text)
SELECT 
  id,
  'Note '||ROW_NUMBER() OVER (PARTITION BY id)||' on Parcel '||id
FROM
(select
  id,
  generate_series(1, num_of_notes)
from
  (select *, (random() * 2 + 1)::int num_of_notes FROM qgisdbtest.land_parcel TABLESAMPLE BERNOULLI (80)) parcels
) n
;

insert into qgisdbtest.building_notes(building_id, text)
SELECT 
  id,
  'Note '||ROW_NUMBER() OVER (PARTITION BY id)||' on Building '||id
FROM
(select
  id,
  generate_series(1, num_of_notes)
from
  (select *, (random() * 2 + 1)::int num_of_notes FROM qgisdbtest.building TABLESAMPLE BERNOULLI (80)) parcels
) n
;

truncate qgisdbtest.contact cascade;
insert into qgisdbtest.contact(name) VALUES 
('Frank Abercrombie'),
('Susan Adams'),
('Robert Atha'),
('Julian Barker'),
('Christopher Bennett'),
('Eddie Bitton'),
('Dorothy Brown'),
('Michael Brown'),
('Jarlath Burke'),
('Julia Calver'),
('Michael Cryer'),
('David Cushing'),
('Jason Dorman'),
('Gillian Douglas'),
('Janet Eccleston'),
('Karen Elliot'),
('Paul Fletcher'),
('Paul Gardner'),
('Peter Goodin'),
('Christopher Goodman'),
('Darron Green'),
('Angela Gregory'),
('Sheila Halls'),
('Betty Hassan'),
('Gareth Howell'),
('Matthew Howell'),
('Graham Judd'),
('Patrick Kane'),
('Andrew Kent'),
('Rebecca Lewis'),
('Winifred Lewis'),
('Helen Lyons'),
('David Matkin'),
('Ronan Mooney'),
('Liam Murray'),
('Kathryn Parker'),
('Ian Payne'),
('Stephen Redding'),
('Kiran Shah'),
('Andrew Stanton'),
('Michael Stephen'),
('Steven Stoker'),
('Doreen Storey'),
('Marie Tandy'),
('Stephen Ward'),
('Timothy Ward'),
('Gary Williams'),
('John Wood'),
('Graham Woodcock'),
('Georgina Workman')
;

insert into qgisdbtest.building_owners(id_building, id_contact)
select
  b.id,
  (select id from qgisdbtest.contact where b.id is not null order by random() limit 1)
from qgisdbtest.building b
;
  
insert into qgisdbtest.building_owners(id_building, id_contact)
select
  b.id,
  (select id from qgisdbtest.contact where b.id is not null order by random() limit 1)
from qgisdbtest.building b TABLESAMPLE BERNOULLI (20)
ON conflict do nothing
;

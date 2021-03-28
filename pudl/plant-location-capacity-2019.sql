/*
A query that demonstrates how to make a map automatically in Datasette.
*/
SELECT
  plants.plant_id_eia,
  plants.plant_name_eia,
  SUM(gens.capacity_mw) AS plant_capacity_mw,
  latitude,
  longitude
FROM
  generators_eia860 AS gens
JOIN
  plants_entity_eia AS plants
WHERE
  plants.plant_id_eia = gens.plant_id_eia
  AND gens.report_date = "2019-01-01"
  AND plants.state not in ("HI", "AK")
GROUP BY
  plants.plant_id_eia
ORDER BY
  plant_capacity_mw DESC
LIMIT 1000

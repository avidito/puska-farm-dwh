UPDATE dim_unit_peternakan T
SET
  longitude = S.longitude,
  latitude = S.latitude
FROM (
  WITH cte_region_centroid AS (
    SELECT
      up.id,
      up.longitude,
      up.latitude,
      ST_CENTROID(l.region) AS centroid
    FROM dim_unit_peternakan AS up
    JOIN dim_lokasi AS l
      ON up.id_lokasi = l.id
  ),
  cte_coor_calc AS (
    SELECT
      id,
      (ST_X(centroid) + RANDOM() * 0.002 - 0.001) AS longitude,
      (ST_Y(centroid) + RANDOM() * 0.002 - 0.001) AS latitude
    FROM cte_region_centroid
  )
  SELECT
    id,
    longitude,
    latitude
  FROM cte_coor_calc
) AS S
WHERE TRUE
  AND T.id = S.id;
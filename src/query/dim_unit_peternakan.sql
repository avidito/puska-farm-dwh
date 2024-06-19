SELECT
  id,
  kecamatan_id::INTEGER AS id_lokasi,
  nama_unit,
  alamat,
  NULL AS longitude,
  NULL AS latitude
FROM unit_ternak AS ut
UNION ALL
SELECT
  MAX(ut.id)+1 AS id,
  MAX(l.id)+1 AS id_lokasi,
  NULL::VARCHAR AS nama_unit,
  NULL::VARCHAR AS alamat,
  NULL AS longitude,
  NULL AS latitude
FROM unit_ternak AS ut
CROSS JOIN (
  SELECT MAX(id) AS id
  FROM wilayah
) AS l
ORDER BY 1;
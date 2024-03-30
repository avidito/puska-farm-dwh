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
  999 AS id,
  999 AS id_lokasi,
  NULL::VARCHAR AS nama_unit,
  NULL::VARCHAR AS alamat,
  NULL AS longitude,
  NULL AS latitude;
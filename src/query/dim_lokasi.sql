WITH cte_provinsi AS (
  SELECT
    id,
    kode,
    nama AS provinsi,
    NULL AS kabupaten_kota,
    NULL AS kecamatan 
  FROM wilayah
  WHERE LENGTH(REGEXP_REPLACE(kode, '[^.]', '', 'g')) = 0
),
cte_kabupaten_kota AS (
  SELECT
    kk.id,
    kk.kode,
    kk.prov_kode,
    kk.kabkota_kode,
    p.provinsi,
    REPLACE(kk.kabupaten_kota, 'KEP.', 'KEPULAUAN') AS kabupaten_kota,
    NULL AS kecamatan
  FROM (
    SELECT
      w.id,
      w.kode,
      SPLIT_PART(w.kode, '.', 1) AS prov_kode,
      SPLIT_PART(w.kode, '.', 2) AS kabkota_kode,
<<<<<<<< HEAD:query/seed/dim_lokasi.sql
      REPLACE(REGEXP_REPLACE(w.nama, '(KAB.|KOTA) ', ''), 'ADM. ', '') AS kabupaten_kota
========
      REPLACE(REGEXP_REPLACE(w.nama, 'KAB\.{0,1} ', ''), 'ADM. ', '') AS kabupaten_kota
>>>>>>>> 68ae297 (feat: init geom sequence):src/query/dim_lokasi.sql
    FROM wilayah AS w
    WHERE LENGTH(REGEXP_REPLACE(kode, '[^.]', '', 'g')) = 1
  ) AS kk
    LEFT JOIN cte_provinsi AS p
      ON kk.prov_kode = p.kode
),
cte_kecamatan AS (
  SELECT
    ke.id,
    ke.kode,
    ke.prov_kode,
    ke.kabkota_kode,
    p.provinsi,
    kk.kabupaten_kota,
    ke.kecamatan
  FROM (
    SELECT
      w.id,
      w.kode,
      SPLIT_PART(w.kode, '.', 1) AS prov_kode,
      SPLIT_PART(w.kode, '.', 2) AS kabkota_kode,
      UPPER(nama) AS kecamatan
    FROM wilayah AS w
    WHERE LENGTH(REGEXP_REPLACE(kode, '[^.]', '', 'g')) = 2
  ) AS ke
    LEFT JOIN cte_provinsi AS p
      ON ke.prov_kode = p.kode
    LEFT JOIN cte_kabupaten_kota AS kk
      ON ke.prov_kode = kk.prov_kode
      AND ke.kabkota_kode = kk.kabkota_kode
)
SELECT
  ud.id,
  ud.provinsi,
  ud.kabupaten_kota,
  ud.kecamatan
FROM (
  SELECT id, provinsi, kabupaten_kota, kecamatan FROM cte_provinsi
  UNION ALL 
  SELECT id, provinsi, kabupaten_kota, kecamatan FROM cte_kabupaten_kota
  UNION ALL
  SELECT id, provinsi, kabupaten_kota, kecamatan FROM cte_kecamatan
<<<<<<<< HEAD:query/seed/dim_lokasi.sql
) AS ud
UNION ALL
SELECT 999 AS id, '' AS provinsi, '' AS kabupaten_kota, '' AS kecamatan;
========
),
cte_summary AS (
  SELECT
    id,
    provinsi,
    kabupaten_kota,
    kecamatan,
    NULL::VARCHAR AS region
  FROM cte_union
  UNION ALL
  SELECT
    MAX(id)+1 AS id,
    NULL::VARCHAR AS provinsi,
    NULL::VARCHAR AS kabupaten_kota,
    NULL::VARCHAR AS kecamatan,
    NULL::VARCHAR AS region
  FROM cte_union
)
SELECT * FROM cte_summary ORDER BY 1;
>>>>>>>> 68ae297 (feat: init geom sequence):src/query/dim_lokasi.sql

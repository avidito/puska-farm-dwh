-- Table
CREATE TABLE dim_lokasi (
    id INT8,
    provinsi VARCHAR(100),
    kabupaten_kota VARCHAR(100),
    kecamatan VARCHAR(100),
    longitude DOUBLE PRECISION,
    langitude DOUBLE PRECISION,
    CONSTRAINT dim_lokasi_pkey PRIMARY KEY(id)
);

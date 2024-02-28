-- Table
CREATE TABLE dim_mitra_bisnis (
    id INT8,
    id_unit_peternak INT8,
    nama_mitra_bisnis VARCHAR(100),
    kategori_mitra_bisnis VARCHAR(100),
    CONSTRAINT dim_mitra_bisnis_pkey PRIMARY KEY(id)
);

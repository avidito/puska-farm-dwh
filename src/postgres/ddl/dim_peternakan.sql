-- Table
CREATE TABLE dim_peternakan (
    id INT8,
    id_unit_peternak INT8,
    nama_peternakan VARCHAR(100),
    nama_pemilik VARCHAR(100),
    jenis_kelamin VARCHAR(10),
    tgl_lahir DATE,
    pendidikan VARCHAR(30),
    CONSTRAINT dim_peternakan_pkey PRIMARY KEY(id)
);

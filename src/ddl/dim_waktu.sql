-- Table
CREATE TABLE dim_waktu (
    id INT8,
    tanggal DATE,
    tahun INT8,
    bulan INT8,
    hari INT8,
    CONSTRAINT dim_waktu_pk PRIMARY KEY(id)
);

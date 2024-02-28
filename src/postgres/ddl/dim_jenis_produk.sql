-- Table
CREATE TABLE dim_jenis_produk (
    id INT8,
    nama_produk VARCHAR(100),
    kategori_produk VARCHAR(100),
    satuan VARCHAR(100),
    CONSTRAINT dim_jenis_produk_pkey PRIMARY KEY (id)
);

# Daftar Perintah SQL Lengkap

Berikut adalah daftar perintah SQL yang sering digunakan beserta fungsinya.

---

## 1. Data Definition Language (DDL)

- **CREATE DATABASE**
  ```sql
  CREATE DATABASE nama_database;
  ```

- **DROP DATABASE**
  ```sql
  DROP DATABASE nama_database;
  ```

- **CREATE TABLE**
  ```sql
  CREATE TABLE nama_tabel (
    kolom1 TIPE_DATA [KONSTRAINT],
    kolom2 TIPE_DATA [KONSTRAINT],
    ...
  );
  ```

- **DROP TABLE**
  ```sql
  DROP TABLE nama_tabel;
  ```

- **ALTER TABLE**
  ```sql
  ALTER TABLE nama_tabel ADD kolom_baru TIPE_DATA;
  ALTER TABLE nama_tabel DROP COLUMN nama_kolom;
  ALTER TABLE nama_tabel MODIFY nama_kolom TIPE_DATA_BARU;
  ```

---

## 2. Data Manipulation Language (DML)

- **INSERT**
  ```sql
  INSERT INTO nama_tabel (kolom1, kolom2) VALUES (nilai1, nilai2);
  ```

- **UPDATE**
  ```sql
  UPDATE nama_tabel SET kolom1 = nilai_baru WHERE kondisi;
  ```

- **DELETE**
  ```sql
  DELETE FROM nama_tabel WHERE kondisi;
  ```

---

## 3. Data Query Language (DQL)

- **SELECT**
  ```sql
  SELECT kolom1, kolom2 FROM nama_tabel WHERE kondisi;
  SELECT * FROM nama_tabel;
  ```

- **DISTINCT**
  ```sql
  SELECT DISTINCT kolom FROM nama_tabel;
  ```

- **ORDER BY**
  ```sql
  SELECT * FROM nama_tabel ORDER BY kolom ASC|DESC;
  ```

- **GROUP BY & HAVING**
  ```sql
  SELECT kolom, COUNT(*) FROM nama_tabel GROUP BY kolom HAVING COUNT(*) > 1;
  ```

- **LIMIT / TOP**
  ```sql
  SELECT * FROM nama_tabel LIMIT 10; -- MySQL/PostgreSQL
  SELECT TOP 10 * FROM nama_tabel;  -- SQL Server
  ```

---

## 4. Data Control Language (DCL)

- **GRANT**
  ```sql
  GRANT SELECT, INSERT ON nama_tabel TO 'user';
  ```

- **REVOKE**
  ```sql
  REVOKE SELECT, INSERT ON nama_tabel FROM 'user';
  ```

---

## 5. Transaction Control Language (TCL)

- **START TRANSACTION / BEGIN**
  ```sql
  START TRANSACTION;
  ```

- **COMMIT**
  ```sql
  COMMIT;
  ```

- **ROLLBACK**
  ```sql
  ROLLBACK;
  ```

- **SAVEPOINT**
  ```sql
  SAVEPOINT nama_savepoint;
  ```

- **RELEASE SAVEPOINT**
  ```sql
  RELEASE SAVEPOINT nama_savepoint;
  ```

---

## 6. JOIN

- **INNER JOIN**
  ```sql
  SELECT * FROM tabel1 INNER JOIN tabel2 ON tabel1.id = tabel2.fk_id;
  ```

- **LEFT JOIN**
  ```sql
  SELECT * FROM tabel1 LEFT JOIN tabel2 ON tabel1.id = tabel2.fk_id;
  ```

- **RIGHT JOIN**
  ```sql
  SELECT * FROM tabel1 RIGHT JOIN tabel2 ON tabel1.id = tabel2.fk_id;
  ```

- **FULL JOIN**
  ```sql
  SELECT * FROM tabel1 FULL JOIN tabel2 ON tabel1.id = tabel2.fk_id;
  ```

- **Contoh Query Multi-Table JOIN (Tanpa Explicit JOIN)**
  ```sql
  SELECT 
    mahasiswa.Nim, 
    mahasiswa.Nama,
    krs.Idkelas,
    matakuliah.Matakuliah,
    krs.Nilai 
  FROM mahasiswa, krs, matakuliah, kelas
  WHERE mahasiswa.nim = krs.Nim 
    AND krs.Idkelas = kelas.Idkelas 
    AND kelas.Kode = Matakuliah.Kode;
  ```

- **Contoh Query Multi-Table LEFT JOIN**
  ```sql
  SELECT 
    m.Nim, 
    m.Nama,
    k.Idkelas,
    mk.Matakuliah,
    k.Nilai 
  FROM
    mahasiswa m 
    LEFT JOIN krs k ON m.Nim = k.Nim
    LEFT JOIN kelas kl ON k.Idkelas = kl.Idkelas
    LEFT JOIN matakuliah mk ON kl.Kode = mk.Kode;
  ```

---

## 7. Subquery

```sql
SELECT kolom FROM nama_tabel WHERE kolom IN (SELECT kolom FROM tabel_lain WHERE kondisi);
```

---

## 8. Fungsi Aggregate

- **COUNT, SUM, AVG, MIN, MAX**
  ```sql
  SELECT COUNT(*), SUM(kolom), AVG(kolom), MIN(kolom), MAX(kolom) FROM nama_tabel;
  ```

---

## 9. Index

- **CREATE INDEX**
  ```sql
  CREATE INDEX nama_index ON nama_tabel(kolom);
  ```

- **DROP INDEX**
  ```sql
  DROP INDEX nama_index; -- MySQL/PostgreSQL
  DROP INDEX nama_index ON nama_tabel; -- SQL Server
  ```

---

## 10. View

- **CREATE VIEW**
  ```sql
  CREATE VIEW nama_view AS
  SELECT kolom1, kolom2 FROM nama_tabel WHERE kondisi;
  ```

- **DROP VIEW**
  ```sql
  DROP VIEW nama_view;
  ```

---

## 11. Stored Procedure (Prosedur Tersimpan)

```sql
CREATE PROCEDURE nama_prosedur()
BEGIN
  -- perintah SQL
END;
```

---

## 12. Trigger

```sql
CREATE TRIGGER nama_trigger
AFTER INSERT ON nama_tabel
FOR EACH ROW
BEGIN
  -- perintah SQL
END;
```

---

## 13. Constraint

- **Primary Key**
  ```sql
  PRIMARY KEY (kolom)
  ```

- **Foreign Key**
  ```sql
  FOREIGN KEY (kolom) REFERENCES tabel_lain(kolom)
  ```

- **Unique**
  ```sql
  kolom TIPE_DATA UNIQUE
  ```

- **Not Null**
  ```sql
  kolom TIPE_DATA NOT NULL
  ```

- **Check**
  ```sql
  kolom TIPE_DATA CHECK (kondisi)
  ```

---

## 14. Operator dan Fungsi Umum

- **LIKE**
  ```sql
  SELECT * FROM nama_tabel WHERE kolom LIKE '%nilai%';
  ```

- **BETWEEN**
  ```sql
  SELECT * FROM nama_tabel WHERE kolom BETWEEN nilai1 AND nilai2;
  ```

- **IN**
  ```sql
  SELECT * FROM nama_tabel WHERE kolom IN (nilai1, nilai2, ...);
  ```

- **IS NULL / IS NOT NULL**
  ```sql
  SELECT * FROM nama_tabel WHERE kolom IS NULL;
  SELECT * FROM nama_tabel WHERE kolom IS NOT NULL;
  ```

---

## 15. Lain-lain

- **Komentar**
  ```sql
  -- Komentar satu baris
  /* Komentar
     multi baris */
  ```

---

## 16. Contoh Query Lanjutan

### a. Menghitung IPK Mahasiswa

```sql
SELECT 
  m.Nim,
  m.Nama,
  SUM(mk.Sks * k.Nilai) / SUM(mk.Sks) AS IPK
FROM
  mahasiswa m, krs k, kelas kl, matakuliah mk
WHERE
  m.Nim = k.Nim AND 
  k.Idkelas = kl.Idkelas AND
  kl.Kode = mk.Kode
GROUP BY m.Nim
ORDER BY IPK;
```

### b. Menampilkan Nilai Huruf Mahasiswa

```sql
SELECT
  m.Nim,
  m.Nama,
  d.Nama AS Dosen,
  k.Nilai,
  mk.Matakuliah,
  CASE (k.Nilai)
    WHEN 4 THEN 'A'
    WHEN 3 THEN 'B'
    WHEN 2 THEN 'C'
    WHEN 1 THEN 'D'
    ELSE 'E'
  END AS nilai_huruf
FROM mahasiswa m, krs k, kelas kl, dosen d, matakuliah mk
WHERE
  m.Nim = k.Nim AND
  k.Idkelas = kl.Idkelas AND
  kl.Kode = mk.Kode AND
  kl.Nip = d.Nip;
```

### c. Menampilkan Nilai Huruf, IPK, dan Keterangan Kelulusan

```sql
SELECT
  m.Nim,
  m.Nama,
  k.Nilai,
  CASE (k.Nilai)
    WHEN 4 THEN 'A'
    WHEN 3 THEN 'B'
    WHEN 2 THEN 'C'
    WHEN 1 THEN 'D'
    ELSE 'E'
  END AS nilai_huruf,
  ROUND(SUM(mk.Sks * k.Nilai) / SUM(mk.Sks), 2) AS IPK,
  CASE 
    WHEN SUM(mk.Sks * k.Nilai) / SUM(mk.Sks) >= 3.51 THEN 'Cumlaude'
    WHEN SUM(mk.Sks * k.Nilai) / SUM(mk.Sks) >= 3.1 THEN 'Sangat Memuaskan'
    WHEN SUM(mk.Sks * k.Nilai) / SUM(mk.Sks) >= 2.51 THEN 'Memuaskan'
    WHEN SUM(mk.Sks * k.Nilai) / SUM(mk.Sks) >= 2.0 THEN 'Cukup'
    ELSE 'Kurang'
  END AS Keterangan
FROM mahasiswa m
JOIN krs k ON m.Nim = k.Nim
JOIN kelas kl ON k.Idkelas = kl.Idkelas
JOIN matakuliah mk ON kl.Kode = mk.Kode
GROUP BY m.Nim, m.Nama
ORDER BY IPK DESC;
```

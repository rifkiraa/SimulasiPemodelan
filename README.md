# Simulasi dan Pemodelan: Ketidakpastian Probabilitas Gangguan Jaringan Internet di Tempat Kerja

**Oleh:** Mochamad Rifki Ramadhan  
**Mata Kuliah:** Pemodelan dan Simulasi (Tugas 2)

---

## 1. Deskripsi Simulasi dan Pemodelan Proyek

Koneksi internet sangat dibutuhkan di lingkungan kerja untuk mengakses sistem, mengirim data, dan berkomunikasi. Namun, jaringan internet terkadang mengalami gangguan yang tidak dapat dipastikan kapan terjadinya.

Proyek ini bertujuan untuk memodelkan ketidakpastian kondisi jaringan internet dan melakukan simulasi perhitungan **Nilai Ekspektasi (_Expected Value_)** guna memperkirakan rata-rata durasi gangguan internet dalam satu hari kerja.

Pemodelan dilakukan dengan membagi kondisi jaringan ke dalam 3 variabel kejadian diskrit ($X_i$) beserta nilai probabilitasnya ($P_i$):

1. **Internet Stabil ($X_1$):** Pekerjaan berjalan normal tanpa gangguan (Durasi gangguan: $0\text{ menit}$, Probabilitas: $0.60$).
2. **Internet Lambat ($X_2$):** Akses sistem dan pengiriman data menjadi lebih lama (Durasi gangguan: $20\text{ menit}$, Probabilitas: $0.25$).
3. **Internet Terputus ($X_3$):** Pekerjaan yang membutuhkan koneksi internet tidak dapat dilakukan sementara (Durasi gangguan: $60\text{ menit}$ pada perhitungan operasi / $120\text{ menit}$ pada tabel skenario awal, Probabilitas: $0.15$).

### Rumus Pemodelan Matematis

Nilai harapan atau rata-rata waktu gangguan per hari dihitung menggunakan rumus _Expected Value_ distribusi probabilitas diskrit:

$$E(X) = \sum_{i=1}^{n} P_i \times X_i$$

Dari hasil pemodelan dan operasi perhitungan, didapatkan nilai $E(X) = 14\text{ menit}$ per hari kerja (untuk durasi terputus $60\text{ menit}$). Artinya, apabila probabilitas dan durasi tersebut mencerminkan kondisi yang berulang dalam jangka panjang, rata-rata waktu gangguan yang diharapkan adalah **14 menit per hari kerja**.

---

## 2. Sumber Data

Data yang digunakan dalam pemodelan dan simulasi ini merupakan **Data Asumsi (Simulasi Pengamatan)** berdasarkan perkiraan kondisi jaringan di tempat kerja untuk keperluan studi kasus dan contoh perhitungan, bukan merupakan data _log_ aktual dari suatu perusahaan tertentu.

| Variabel  | Kondisi Jaringan  | Probabilitas ($P_i$) |            Durasi Gangguan ($X_i$)            |
| :-------- | :---------------- | :------------------: | :-------------------------------------------: |
| $X_1$     | Internet Stabil   |        $0.60$        |               $0\text{ Menit}$                |
| $X_2$     | Internet Lambat   |        $0.25$        |               $20\text{ Menit}$               |
| $X_3$     | Internet Terputus |        $0.15$        | $60\text{ Menit}$ _(atau $120\text{ Menit}$)_ |
| **TOTAL** |                   |      **$1.00$**      |                                               |

---

## 3. Bahasa Pemrograman yang Digunakan

Proyek pemodelan dan perhitungan ini diimplementasikan menggunakan:

- **Bahasa Pemrograman:** **R** (menggunakan fungsi dasar komputasi vektor dan _data frame_ bawaan R tanpa _library_ eksternal tambahan).
- **Environment / Tools:** RStudio / R Console.

### Cuplikan Kode Simulasi (`simulasi_jaringan.R`)

```R
# Mendefinisikan Kumpulan Variabel
variabel <- c("X1", "X2", "X3")
kondisi_jaringan <- c("Internet Stabil", "Internet Lambat", "Internet Terputus")
probabilitas <- c(0.60, 0.25, 0.15)
durasi_gangguan <- c(0, 20, 60)

# Menyusun ke dalam Data Frame dan menghitung E(X)
data_jaringan <- data.frame(
  Variabel = variabel,
  Kondisi_Jaringan = kondisi_jaringan,
  Probabilitas = probabilitas,
  Durasi_Menit = durasi_gangguan
)

data_jaringan$Hasil_Kali <- data_jaringan$Probabilitas * data_jaringan$Durasi_Menit
expected_value <- sum(data_jaringan$Hasil_Kali)

print(data_jaringan)
cat("Hasil Akhir E(X) :", expected_value, "menit per hari kerja\n")
```

---

## 4. Persentase Keterlibatan Tools AI & Pembuktian

**Persentase Penggunaan AI:** **15%** (Maksimal batas ketentuan: 20%)

### Rincian Pembagian Pengerjaan (85% Mandiri vs 15% AI):

- **Pengerjaan Mandiri (84%):**
  1. Menentukan topik studi kasus (gangguan jaringan internet di tempat kerja).
  2. Menyusun variabel kondisi jaringan ($X_1, X_2, X_3$), menentukan asumsi bobot probabilitas, serta durasi gangguan.
  3. Melakukan perhitungan matematis manual menggunakan rumus nilai ekspektasi $E(X)$ beserta analisis kesimpulan hasil akhir.
  4. Menyusun laporan awal studi kasus (`Rifki Ramadan_tugas 2.pdf`).
- **Bantuan Tools AI (16%):**
  1. Membantu menerjemahkan rumus perhitungan manual dari dokumen laporan ke dalam sintaks _script_ bahasa R (`data.frame` dan operasi vektor).
  2. Membantu merapikan struktur format _Markdown_ pada dokumentasi `README.md` untuk pelaporan di GitHub.

### Bukti Keterlibatan AI (Transparansi & Verifikasi):

**Dokumen Orisinal (Non-AI):** Terlampir file `Rifki Ramadan_tugas 2.pdf` di dalam repositori ini yang menunjukkan konsep awal, tabel variabel, dan perhitungan manual yang telah dibuat terlebih dahulu sebelum ditranslasikan ke kode R.

---

## Struktur File Repositori

- `README.md` - Dokumentasi utama pelaporan proyek di GitHub (untuk presensi dan penilaian).
- `Rifki Ramadan_tugas 2.pdf` - Dokumen laporan studi kasus dan perhitungan matematis awal.
- `scrip.R` - File kode program dalam bahasa R untuk menjalankan perhitungan model.
- `GPTZero AI Scan - Rifki Ramadan_tugas 2.docx` - Dokumentasi GPTZero.

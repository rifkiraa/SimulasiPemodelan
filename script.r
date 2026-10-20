variabel <- c("X1", "X2", "X3")
kondisi_jaringan <- c("Internet Stabil", "Internet Lambat", "Internet Terputus")
probabilitas <- c(0.60, 0.25, 0.15)
durasi_gangguan <- c(0, 20, 60)

data_jaringan <- data.frame(
    Variabel = variabel,
    Kondisi_Jaringan = kondisi_jaringan,
    Probabilitas = probabilitas,
    Durasi_Menit = durasi_gangguan
)

data_jaringan$Hasil_Kali <- data_jaringan$Probabilitas * data_jaringan$Durasi_Menit

print(data_jaringan)

total_probabilitas <- sum(data_jaringan$Probabilitas)
expected_value <- sum(data_jaringan$Hasil_Kali)

cat("\nTotal Probabilitas :", total_probabilitas, "\n")
cat("Hasil Akhir E(X)   :", expected_value, "menit per hari kerja\n")

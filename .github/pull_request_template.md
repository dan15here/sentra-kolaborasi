## Ringkasan Perubahan
Menambahkan skrip `healthcheck.sh` untuk memeriksa status layanan 
via endpoint `/health`.

## Alasan / Masalah yang Diselesaikan
Diperlukan skrip untuk memverifikasi layanan masih UP/DOWN.

## Cara Menguji
1. Jalankan: `./src/healthcheck.sh`
2. Cek output: `UP` (exit 0) atau `DOWN` (exit 2)

## Daftar Periksa
- [x] Perubahan hanya memuat satu perubahan logis
- [x] Pesan commit mengikuti Conventional Commits
- [x] Skrip yang diubah lolos shellcheck
- [x] Tidak ada kredensial atau berkas rahasia yang ikut terbawa

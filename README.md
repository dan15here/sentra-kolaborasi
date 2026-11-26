# Sentra Kolaborasi

Repository kolaborasi tim untuk **Praktikum Minggu ke-4 Mata Kuliah DevOps (RKS305)** — *Git & Kolaborasi Tim* di **Program Studi Rekayasa Keamanan Siber, Jurusan Teknik Informatika, Politeknik Negeri Batam**.

Repository ini mengelola skrip otomasi penyiapan lingkungan, pemeriksaan kesehatan layanan (*healthcheck*), serta pemantauan berkala untuk aplikasi **PT Sentra Digital Batam** dengan menerapkan alur kerja kolaborasi berbasis *branching*, *Pull Request*, *code review*, *semantic versioning* (`tag`), *revert* terkendali, dan *Git hooks*.

---

## Informasi Mata Kuliah

| Keterangan | Detail |
| :--- | :--- |
| **Mata Kuliah** | DevOps (`RKS305`) |
| **Program Studi** | Rekayasa Keamanan Siber — Kelas RKS 3A Malam |
| **Institusi** | Politeknik Negeri Batam (Jurusan Teknik Informatika) |
| **Dosen Pengampu** | Antoni Haikal, S.T., M.T. |
| **Topik Praktikum** | Minggu ke-4: Git Workflow, Kolaborasi Tim, PR, Release Tagging, & Revert |

---

## Anggota Tim

| Peran | Nama | Akun GitHub | Fokus Kontribusi |
| :--- | :--- | :--- | :--- |
| **Maintainer** | Muhammad Danish | [@dan15here](https://github.com/dan15here) | Inisialisasi repo, proteksi branch `main`, review & merge PR, manajemen rilis (`tag`) dan `revert` |
| **Developer A** | Laila Rezky | [@LailaRezky](https://github.com/LailaRezky) | Pengembangan fitur, perbaikan bug, dan kolaborasi Pull Request |
| **Developer B** | Guruh Laras Siboro | [@guruhlarassiboro-eng](https://github.com/guruhlarassiboro-eng) | Pengembangan skrip pemantauan/pemeriksaan dan kolaborasi Pull Request |

---

## Struktur Repository

```text
sentra-kolaborasi/
├── .github/          # Konfigurasi & template kolaborasi GitHub (Pull Request / Issue)
├── hooks/            # Git hooks untuk menjaga standar kualitas commit & skrip
├── src/              # Direktori utama skrip otomasi layanan Sentra
├── .gitignore        # Pengecualian berkas sementara, log, dan environment lokal
└── README.md         # Dokumentasi proyek dan panduan kolaborasi tim
```

---

## Daftar Skrip Utama

| Skrip | Fungsi |
| :--- | :--- |
| `setup.sh` | Menyiapkan lingkungan eksekusi aplikasi Sentra, memasang dependensi, dan menjalankan *smoke test* awal |
| `healthcheck.sh` | Memeriksa status ketersediaan endpoint layanan dengan pembatasan waktu permintaan (*timeout*) |
| `monitoring.sh` | Memantau kondisi layanan Sentra secara berkala |

---

## Cara Menggunakan

### 1. Clone Repository
```bash
git clone https://github.com/dan15here/sentra-kolaborasi.git
cd sentra-kolaborasi
```

### 2. Aktifkan Git Hooks (Opsional / Direkomendasikan)
```bash
git config core.hooksPath hooks
chmod +x hooks/*
```

### 3. Beri Izin Eksekusi & Jalankan Skrip
```bash
chmod +x src/*.sh
./src/setup.sh
./src/healthcheck.sh
./src/monitoring.sh
```
*(Sesuaikan nama/lokasi berkas di dalam `src/` sesuai skrip yang tersedia pada branch `main`.)*

---

## Alur Kerja Kolaborasi Tim

1. **Jangan commit langsung ke `main`.** Buat branch baru untuk setiap fitur atau perbaikan:
   ```bash
   git checkout main && git pull origin main
   git checkout -b feat/nama-fitur   # atau fix/deskripsi-perbaikan
   ```
2. **Gunakan format pesan commit yang jelas (Conventional Commits):**
   - `feat:` penambahan fitur baru
   - `fix:` perbaikan bug/galat
   - `chore:` konfigurasi, struktur repo, atau pemeliharaan
   - `docs:` pembaruan dokumentasi
3. **Buka Pull Request (PR)** ke branch `main` dan minta *review* dari Maintainer atau rekan tim sebelum dilakukan *merge*.
4. **Penanganan Regresi:** Apabila perubahan yang ter-merge menimbulkan masalah, lakukan pemulihan aman menggunakan `git revert` melalui PR (tanpa menulis ulang riwayat `main`).
5. **Penandaan Rilis:** Setiap tonggak stabil ditandai dengan *annotated tag* mengikuti *Semantic Versioning* (`vMAJOR.MINOR.PATCH`).

---

## Riwayat Rilis & Perubahan (Changelog)

| Versi / Referensi | Commit | Ringkasan Perubahan |
| :--- | :---: | :--- |
| `main` (terbaru) | `1f8e393` | `fix: batasi waktu permintaan healthcheck` (PR `#5`) |
| **`v1.1.1`** | `04d5c8f` | `Revert "fix: sesuaikan endpoint pemeriksaan (#3)"` — pemulihan stabilitas melalui PR `#4` |
| — | `f125aa8` | `fix: sesuaikan endpoint pemeriksaan` (PR `#3`) |
| **`v1.1.0`** | `96b6ca8` | `feat: tambahkan skrip pemantauan berkala` (PR `#2`) |
| — | `8323b11` | `feat/tambah healthcheck` (PR `#1`) |
| Awal | `976c747` | `chore: siapkan struktur awal repository kolaborasi` |

# Perpus_Online 📚

**Perpus_Online** adalah aplikasi perpustakaan digital yang memungkinkan pengguna untuk mengelola dan melihat koleksi buku mereka secara online. Aplikasi ini menampilkan daftar buku yang dimiliki oleh pengguna, lengkap dengan detail informasi jumlah halaman dan penulis.

## Fitur Utama

- **Daftar Buku**: Menampilkan koleksi buku yang dimiliki pengguna.
- **Detail Buku**: Menampilkan judul, penulis, dan jumlah halaman untuk setiap buku.
- **Navigasi Mudah**: Dengan bottom navigation bar, pengguna bisa berpindah antara halaman **Home** dan **Author** dengan cepat.
- **Floating Action Button**: Menyediakan tombol aksi untuk menambahkan buku baru ke dalam koleksi.

## Struktur Tampilan

1. **Home Page**

   - Menampilkan daftar buku yang telah diinput oleh pengguna.
   - Setiap buku dilengkapi dengan:
     - Cover buku
     - Judul buku
     - Nama penulis
     - Jumlah halaman yang ditampilkan dalam ikon buku di sudut kiri bawah cover.

2. **Bottom Navigation**

   - **Home**: Mengarah ke halaman utama untuk menampilkan koleksi buku.
   - **Author**: Mengarah ke halaman daftar penulis atau informasi tentang penulis (masih bisa dikembangkan lebih lanjut).

3. **Floating Action Button**: Tombol dengan ikon tambah (+) untuk menambahkan buku baru.

## Teknologi yang Digunakan

- **Flutter**: Framework utama untuk pengembangan aplikasi ini.
- **Dart**: Bahasa pemrograman yang digunakan oleh Flutter.
- **State Management**: Gunakan state management sederhana atau provider (opsional untuk pengelolaan data buku).

## Cara Menjalankan Aplikasi

1. Clone repositori ini:
   ```bash
   git clone https://github.com/ryapps/perpus_online.git
   ```
2. Navigasi ke direktori proyek:
   ```bash
   cd perpus_online
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Jalankan aplikasi:
   ```bash
   flutter run
   ```

## Pengembangan Lebih Lanjut

Fitur yang dapat dikembangkan:

- **Pencarian Buku**: Fitur pencarian untuk memudahkan menemukan buku berdasarkan judul atau penulis.
- **Filter Kategori**: Memungkinkan pengguna mengelompokkan buku berdasarkan genre atau kategori.
- **Integrasi API Perpustakaan**: Integrasi dengan API eksternal untuk mendapatkan data buku.

## Kontribusi

Silakan membuat pull request untuk perbaikan atau penambahan fitur pada aplikasi ini. Setiap kontribusi akan sangat membantu pengembangan aplikasi ini agar menjadi lebih baik.

## Lisensi

Proyek ini dilisensikan di bawah lisensi [MIT](LICENSE).

class Book {
   int id;
   String judul;
   String? deskripsi;
   int stok;
   String? foto;
   String penerbit;
   String pengarang;

  Book({required this.id, required this.judul, this.deskripsi, required this.stok, this.foto, required this.penerbit, required this.pengarang});
}

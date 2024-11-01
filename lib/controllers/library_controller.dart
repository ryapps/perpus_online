import 'package:perpus_online/models/books.dart';

class LibraryController {
  final List<Book> books = [
    Book(
        id: 1,
        judul: 'Bumi',
        stok: 10,
        penerbit: 'Gramedia',
        pengarang: 'Tere Liye',
        foto: 'https://cdn.gramedia.com/uploads/items/9786020332956_Bumi-New-Cover.jpg'),
    Book(
        id: 2,
        judul: 'Matahari',
        stok: 15,
        penerbit: 'Gramedia',
        pengarang: 'Tere Liye',
        foto: 'https://www.gramedia.com/blog/content/images/2022/05/1--3-.jpg'),
    
  ];
}

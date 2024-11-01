import 'package:flutter/material.dart';
import 'package:perpus_online/controllers/library_controller.dart';
import 'package:perpus_online/models/books.dart';
import 'package:perpus_online/views/modal_widget.dart';
import 'package:perpus_online/widgets/bottom_nav.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Book> books = [];
  LibraryController buku = LibraryController();
  final _formKey = GlobalKey<FormState>();
  int idBook = 1;

  TextEditingController judulController = TextEditingController();
  TextEditingController deskripsiController = TextEditingController();
  TextEditingController stokController = TextEditingController();
  TextEditingController fotoController = TextEditingController();
  TextEditingController penerbitController = TextEditingController();
  TextEditingController pengarangController = TextEditingController();

  getBook() {
    setState(() {
      books = buku.books ?? [];
    });
  }

  addBook(Book data) {
    setState(() {
      books.add(data);
    });
  }

  @override
  void initState() {
    super.initState();
    getBook();
  }

  ModalWidget modal = ModalWidget();
  List<String> listAct = ["Ubah", "Hapus"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.cyan,
        title: const Center(
            child: Icon(
          Icons.book,
          size: 30,
          color: Colors.purple,
        )),
      ),
      body: books.isNotEmpty
          ? SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Text("My Books",
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 570,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 8.0,
                        crossAxisCount: 2, // Jumlah kolom
                        mainAxisSpacing: 8.0,
                        childAspectRatio:
                            0.7, // Sesuaikan rasio lebar dan tinggi
                      ),
                      itemCount: books.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(left: 13),
                          width: 140,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      books[index].foto.toString(),
                                      height: 180,
                                      width: 140,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 8,
                                    left: 8,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.6),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.inventory,
                                            size: 15,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            books[index].stok.toString(),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 8,
                                    top: 8,
                                    child: SizedBox(
                                      height: 30,
                                      width: 30,
                                      child: PopupMenuButton<String>(
                                        style: const ButtonStyle(
                                          backgroundColor:
                                              WidgetStatePropertyAll(
                                                  Colors.white),
                                        ),
                                        icon: const Icon(
                                          Icons.more_vert,
                                          color: Colors.black,
                                          size: 15.0,
                                        ),
                                        itemBuilder: (BuildContext context) {
                                          return listAct.map((String choice) {
                                            return PopupMenuItem<String>(
                                              value: choice,
                                              child: Text(choice),
                                            );
                                          }).toList();
                                        },
                                        onSelected: (String choice) {
                                          if (choice == 'Ubah') {
                                            setState(() {
                                              idBook = books[index].id;
                                            });
                                            judulController.text =
                                                (books[index].judul);
                                            deskripsiController.text =
                                                books[index].deskripsi ?? '';
                                            stokController.text =
                                                books[index].stok.toString();
                                            fotoController.text =
                                                books[index].foto ?? '';
                                            penerbitController.text =
                                                books[index].penerbit;
                                            pengarangController.text =
                                                books[index].pengarang;
                                            modal.showFullModal(context,
                                                tambahBuku(index), 'Ubah Buku');
                                          } else {
                                            books.removeWhere((item) =>
                                                item.id == books[index].id);
                                            getBook();
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                books[index].judul,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Row(
                                children: [
                                  Text(
                                    books[index].pengarang,
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
          : const Center(child: Text('Belum ada buku yang ditambahkan')),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        onPressed: () {
          modal.showFullModal(context, tambahBuku(null), 'Tambah Buku');
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNav(page: 0),
    );
  }

  Widget tambahBuku(index) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: judulController,
            decoration: const InputDecoration(labelText: "Judul"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Harus diisi';
              }
              return null;
            },
          ),
          TextFormField(
            controller: deskripsiController,
            decoration: const InputDecoration(labelText: "Deskripsi"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return null;
              }
              return null;
            },
          ),
          TextFormField(
            controller: stokController,
            decoration: const InputDecoration(labelText: "Stok"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Harus diisi';
              }
              return null;
            },
          ),
          TextFormField(
            controller: fotoController,
            decoration: const InputDecoration(labelText: "Foto"),
          ),
          TextFormField(
            controller: penerbitController,
            decoration: const InputDecoration(labelText: "Penerbit"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Harus diisi';
              }
              return null;
            },
          ),
          TextFormField(
            controller: pengarangController,
            decoration: const InputDecoration(labelText: "Pengarang"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Harus diisi';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                if (index != null) {
                  books[index].id = idBook;
                  books[index].judul = judulController.text;
                  books[index].deskripsi = judulController.text;
                  books[index].stok = int.parse(stokController.text);
                  books[index].foto = fotoController.text;
                  books[index].penerbit = penerbitController.text;
                  books[index].pengarang = pengarangController.text;
                  getBook();
                } else {
                  Book newBook = Book(
                    id: books.length + 1,
                    judul: judulController.text,
                    deskripsi: deskripsiController.text,
                    stok: int.parse(stokController.text),
                    foto: fotoController.text,
                    penerbit: penerbitController.text,
                    pengarang: pengarangController.text,
                  );
                  addBook(newBook);
                  print(newBook.foto! + " " + newBook.stok.toString());
                }
                Navigator.pop(context);
              }
            },
            child: const Text("Simpan"),
          ),
        ],
      ),
    );
  }
}

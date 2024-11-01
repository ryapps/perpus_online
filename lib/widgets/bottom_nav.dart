import 'package:flutter/material.dart';
import 'package:perpus_online/views/modal_widget.dart';

class BottomNav extends StatefulWidget {
  BottomNav({required this.page, super.key});
  int page;
  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  ModalWidget modal = ModalWidget();

  @override
  getPage(index) {
    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/');
    } else if (index == 1) {
    } else if (index == 2) {
      Navigator.pushReplacementNamed(context, '/pengarang');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.cyan.shade900,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      currentIndex: widget.page,
      onTap: getPage,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(icon: Icon(null), label: ''),
        BottomNavigationBarItem(
          icon: Icon(Icons.file_copy),
          label: "Author",
        ),
      ],
    );
  }
}

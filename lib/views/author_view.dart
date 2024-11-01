import 'package:flutter/material.dart';
import 'package:perpus_online/widgets/bottom_nav.dart';

class AuthorView extends StatefulWidget {
  const AuthorView({super.key});

  @override
  State<AuthorView> createState() => _AuthorViewState();
}

class _AuthorViewState extends State<AuthorView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      bottomNavigationBar: BottomNav(page:2),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:perpus_online/views/author_view.dart';

import 'views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.cyan,
          colorScheme: ColorScheme.fromSwatch().copyWith(
              secondary: Color.fromRGBO(240, 28, 61, 1),
              surface: Color.fromRGBO(233, 221, 208, 1),
              tertiary: Color.fromRGBO(0, 203, 206, 1)),
          scaffoldBackgroundColor: Colors.white,
          useMaterial3: true,
        ),
        routes: {
          '/': (context) => Home(),
          '/pengarang' : (context) => AuthorView(),
        }
    );
  }
}


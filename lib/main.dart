import 'package:flutter/material.dart';
import 'package:flutter_presensi_dosen_app/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Presensi Dosen',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF0336FF)),
        primaryColor: const Color(0xFF0336FF),
      ),
      home: const HomePage(),
    );
  }
}

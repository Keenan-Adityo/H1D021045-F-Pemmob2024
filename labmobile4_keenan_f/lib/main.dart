import 'package:flutter/material.dart';
import 'package:labmobile4_keenan_f/ui/login_page.dart';
import 'package:labmobile4_keenan_f/ui/produk_page.dart';
import 'package:labmobile4_keenan_f/ui/registrasi_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: LoginPage());
  }
}

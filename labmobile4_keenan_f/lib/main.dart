import 'package:flutter/material.dart';
import 'package:labmobile4_keenan_f/helpers/user_info.dart';
import 'package:labmobile4_keenan_f/ui/login_page.dart';
import 'package:labmobile4_keenan_f/ui/produk_page.dart';
import 'package:labmobile4_keenan_f/ui/registrasi_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget page = const CircularProgressIndicator();
  @override
  void initState() {
    super.initState();
    isLogin();
  }

  void isLogin() async {
    var token = await UserInfo().getToken();
    if (token != null) {
      setState(() {
        page = const ProdukPage();
      });
    } else {
      setState(() {
        page = const LoginPage();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toko Kita',
      debugShowCheckedModeBanner: false,
      home: page,
    );
  }
}

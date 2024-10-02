import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas3_praktikum2024/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Login disini!",
            style: TextStyle(fontSize: 24),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _showInput(_usernameController, "Username", false),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: _showInput(_passwordController, "Password", true)),
          ElevatedButton(
              onPressed: () {
                if (_passwordController.text == "admin") {
                  if (_usernameController.text.isEmpty) {
                    _showDiaglog("usernamenya jangan dikosongin kak");
                  } else {
                    _saveUsername();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ));
                  }
                } else {
                  _showDiaglog("Salah kak, passnya harus \"admin\"");
                }
              },
              child: Text("Masuk"))
        ],
      ),
    );
  }

  void _saveUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("username", _usernameController.text);
  }

  TextField _showInput(controller, label, isObscure) {
    return TextField(
      controller: controller,
      obscureText: isObscure,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        label: Text(label),
      ),
    );
  }

  _showDiaglog(message) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(message),
        );
      },
    );
  }
}

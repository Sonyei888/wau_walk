import 'package:flutter/material.dart';
import '../welcome_page/welcome_page.dart';// Asegúrate de importar WelcomePage correctamente

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            // Navegar de regreso a WelcomePage al hacer clic en la flecha
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: const Center(
        child: Text('página de inicio de sesión'),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFA9DBB8),
        title: Container(),
      ),
      body: Container(
        color: const Color(0xFFA9DBB8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 50.0),
            Center(
              child: Image.asset(
                'assets/welcome1.png',
                width: 400,
                height: 400,
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Acción para el botón "Soy nuevo"
                    },
                    style: ElevatedButton.styleFrom(
                      primary:const Color(0xFF011638),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      minimumSize: const Size(double.infinity, 0),
                    ),
                    child: const Text(
                      'Soy nuevo',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  ElevatedButton(
                    onPressed: () {
                      // Acción para el botón "Tengo una cuenta"
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white, // Color de fondo
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      minimumSize: const Size(double.infinity, 0),
                    ),
                    child: const Text(
                      'Tengo una cuenta',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

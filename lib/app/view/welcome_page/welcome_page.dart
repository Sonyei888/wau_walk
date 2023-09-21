import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wau Walk'),
      ),
      body: const Center(
        child: CircularProgressIndicator(), // Rueda de carga
      ),
    );
  }
}

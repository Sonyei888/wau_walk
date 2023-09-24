import 'package:flutter/material.dart';
import 'package:wau_walk/app/view/components/text_header.dart';
import 'package:wau_walk/app/view/components/text_sub_header.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
        color: const Color(0xFFA9DBB8),
        height: double.infinity,
        child: const Row(
          children: [
            HeaderMediano("Bienvenido 👋")
          ],
          ),
        ),
    );
  }
}

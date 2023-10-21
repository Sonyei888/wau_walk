import 'package:flutter/material.dart';
import 'package:wau_walk/app/view/components/title.dart';
import 'package:wau_walk/app/view/login/login_page.dart';
import '../components/sub_title.dart';
import '../register/register_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: const Color(0xFFD3EFDB),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SubTitle("Bienvenidos 👋"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TitleWau("Wau Walk"),
                        Image.asset(
                          'assets/logo_sm_wauwalk.png',
                          width: 55,
                          height: 55,
                        ),
                    ],
                  ),
              ),
              Container(
                child:
                Image.asset(
                  'assets/dog_welcome_page.png',
                  width: 300,
                  height: 300,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF011638),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
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
    ),
    );
  }
}

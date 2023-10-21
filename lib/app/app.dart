import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wau_walk/app/view/home/home_page.dart';
import 'package:wau_walk/app/view/splash/splash_page.dart';
import 'package:wau_walk/app/view/welcome_page/welcome_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFFA9DBB8);
    const secondary = Color(0xFFE7ECEF);
    const colorTexto = Color(0xFF011638);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);


    return MaterialApp(
      title: 'Wau Walk',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: secondary),
        scaffoldBackgroundColor: primary,
        textTheme: Theme.of(context).textTheme.apply(
          fontFamily: 'Noto Sans',
          bodyColor: colorTexto,
          displayColor: colorTexto,
        ),
        useMaterial3: true,
      ),
      home: WelcomePage(),
    );
  }
}



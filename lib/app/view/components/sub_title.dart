import 'package:flutter/material.dart';

class SubTitle extends StatelessWidget {
  const SubTitle(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
        fontFamily: 'Poppins',
        fontSize: 22,
        height: 0.02,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleWau extends StatelessWidget {
  const TitleWau(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyText2!.copyWith(
        fontFamily: 'Poppins',
        fontSize: 48,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

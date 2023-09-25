import 'package:flutter/material.dart';

class HeaderMediano extends StatelessWidget{

  const HeaderMediano(this.text,{super.key});

  final String text;



  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyText2!.copyWith(
        color: const Color(0xFF011638),
        fontSize: 22,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        height: 0.05,
      ),
    );
  }


}
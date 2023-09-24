import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class Header extends StatelessWidget{

  const Header(this.text,{super.key});

  final String text;



  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyText2!.copyWith(
        color: const Color(0xFF011638),
        fontSize: 48,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        height: 0.02,
      ),
    );
  }


}
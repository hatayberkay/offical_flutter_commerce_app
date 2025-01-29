import 'package:flutter/material.dart';


class Constants{
  static const double kPadding = 10.0;
  static const Color heavyblack = Color(0XFF222831);
  static const Color lightblack = Color(0XFF393E46);
  static const Color green = Color(0XFF6DF33A);
  static const Color white = Color(0XFFEEEEEE);
// static const FontStyl fontFamily ='Poppins',

  static const TextStyle baslik = TextStyle(
    fontSize: 30.0,
    fontWeight: FontWeight.bold,
    fontFamily: 'Avenir',
  );

  static const TextStyle alt_metin = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w500,
    color: Color(0XFF918fa3),
  );


}


/*
OutlinedButton.styleFrom(
primary: Colors.white,

side: BorderSide(color: Colors.white, width: 2,) ,backgroundColor: Constants.green),

style: ButtonStyle(
shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
),
*/

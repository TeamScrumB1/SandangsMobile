import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';

Color secondaryColor = fromCssColor('#0F70B7');
Color primaryColor = fromCssColor('#0587E0');
Color layer = fromCssColor('#DDF1FF');
Color subtittle = fromCssColor('#434343');
Color darkButton = const Color.fromRGBO(30, 58, 121, 1);
Color lightButton = const Color.fromRGBO(13, 166, 224, 1);

const buttonCard = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color.fromRGBO(13, 166, 224, 1),Color.fromRGBO(30, 58, 121, 1)],
);

TextStyle tittleLight = const TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w600,
  fontSize: 20,
  fontFamily: 'Poppins',
);
TextStyle subTittle = TextStyle(
  color: subtittle,
  fontWeight: FontWeight.w600,
  fontSize: 20,
  fontFamily: 'Poppins',
);
TextStyle nameCard = const TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w600,
  fontSize: 14,
);
TextStyle ratingCard = const TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w400,
  fontSize: 13,
);
TextStyle bioCard = const TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w400,
  fontSize: 12,
);
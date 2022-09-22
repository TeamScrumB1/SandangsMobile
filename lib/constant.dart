import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';

Color secondaryColor = fromCssColor('#0F70B7');
Color primaryColor = fromCssColor('#0587E0');
final Shader logo = LinearGradient(
  colors: <Color>[primaryColor,secondaryColor],
).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
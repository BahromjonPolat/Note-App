import 'package:flutter/material.dart';
import 'package:note_app/consts/colors.dart';

Text setSimpleText(
  String text, {
  Color? color = colorBlack,
  double? size = 14.0,
  FontWeight weight = FontWeight.normal,
}) =>
    Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weight,
      ),
    );

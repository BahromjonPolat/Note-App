import 'package:flutter/material.dart';
import 'package:note_app/components/border_radius.dart';

ElevatedButton setElevatedButton(
  VoidCallback onPressed,
  String label, {
  Color color = Colors.black,
  double radius = 6,
}) =>
    ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
      style: ElevatedButton.styleFrom(
        primary: color,
        shape: RoundedRectangleBorder(
          borderRadius: setCircularBorderRadius(radius: radius),
        ),
      ),
    );

IconButton setIconButton(VoidCallback onPressed, IconData iconData) =>
    IconButton(onPressed: onPressed, icon: Icon(iconData));

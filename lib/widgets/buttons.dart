import 'package:flutter/material.dart';
import 'package:note_app/components/border_radius.dart';

ElevatedButton setElevatedButton(VoidCallback onPressed, String label,
        {Color color = Colors.black}) =>
    ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
      style: ElevatedButton.styleFrom(
        primary: color,
        shape: RoundedRectangleBorder(
          borderRadius: setCircularBorderRadius(radius: 32.0)
        )
      ),
    );

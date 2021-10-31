import 'package:flutter/material.dart';

setCircularBorderRadius({double? radius}) =>
    BorderRadius.circular(radius ?? 12.0);

setOnlyBorderSide(
        {double? topRight,
        double? bottomRight,
        double? topLeft,
        double? bottomLeft}) =>
    BorderRadius.only(
      topLeft: Radius.circular(topLeft ?? 0.0),
      bottomLeft: Radius.circular(bottomLeft ?? 0.0),
      topRight: Radius.circular(topRight ?? 0.0),
      bottomRight: Radius.circular(bottomRight ?? 0.0),
    );

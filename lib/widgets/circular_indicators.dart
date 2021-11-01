import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

CupertinoActivityIndicator _showCupertinoIndicator() =>
    const CupertinoActivityIndicator(
      radius: 24.0,
    );

CircularProgressIndicator _showCircularIndicator() =>
    const CircularProgressIndicator();

CupertinoActivityIndicator get showCupertinoIndicator =>
    _showCupertinoIndicator();

CircularProgressIndicator get showCircularIndicator => _showCircularIndicator();

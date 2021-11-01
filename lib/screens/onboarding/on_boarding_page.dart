import 'package:flutter/material.dart';
import 'package:note_app/components/border_radius.dart';
import 'package:note_app/consts/colors.dart';
import 'package:note_app/screens/home/home_page.dart';
import 'package:note_app/widgets/buttons.dart';
import 'package:note_app/widgets/set_text.dart';

class OnBoardingPage extends StatelessWidget {
  double? _height;
  double? _width;

  BuildContext? _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: _buildBody(),
    );
  }

  _buildBody() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _showLogo(),
          const SizedBox(height: 56.0),
          setSimpleText("Note App", size: 24.0, weight: FontWeight.bold),
          const SizedBox(height: 24.0),
          setSimpleText(
            "Write, Save, Read on this application",
            color: colorGrey,
          ),
          const SizedBox(height: 100.0),
          SizedBox(
            height: 56.0,
            width: _width! * 0.4,
            child: setElevatedButton(_onButtonPressed, "Let's Go!", radius: 32),
          ),
        ],
      );

  _showLogo() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: _height! * 0.3,
            width: _width! * 0.3,
            decoration: BoxDecoration(
              color: colorBlack,
              borderRadius: setOnlyBorderSide(
                topRight: 100.0,
                bottomLeft: 100.0,
              ),
            ),
          ),
          const SizedBox(width: 24.0),
          Container(
            height: _height! * 0.3,
            width: _width! * 0.3,
            decoration: BoxDecoration(
              color: colorLightBrown,
              borderRadius: setOnlyBorderSide(
                topLeft: 100.0,
                bottomRight: 100.0,
              ),
            ),
          ),
        ],
      );

  _onButtonPressed() {
    Navigator.push(
      _context!,
      MaterialPageRoute(
        builder: (_) => HomePage(),
      ),
    );
  }
}

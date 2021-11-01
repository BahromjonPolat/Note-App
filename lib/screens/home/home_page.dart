import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:note_app/consts/colors.dart';
import 'package:note_app/widgets/buttons.dart';
import 'package:note_app/widgets/circular_indicators.dart';
import 'package:note_app/widgets/icon.dart';
import 'package:note_app/widgets/set_text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _showFloatingActionButton(),
      body: _buildBody(),
    );
  }

  _buildBody() => CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
        ],
      );

  SliverAppBar _buildSliverAppBar() => SliverAppBar(
        backgroundColor: colorLightBrown,
        title: setSimpleText(
          "Notes",
          color: colorWhite,
          size: 24.0,
        ),
        actions: [
          setIconButton(() {}, Icons.more_vert),
        ],
      );

  SliverToBoxAdapter _showNotes() => SliverToBoxAdapter(
    child: FutureBuilder(builder: (context, snap) {
      if (snap.hasData) {
        return Container();
      }
      else {
        return showCupertinoIndicator;
      }

    },),
  );


  FloatingActionButton _showFloatingActionButton() => FloatingActionButton(
        backgroundColor: colorLightBrown,
        child: setIcon(Icons.add),
        onPressed: _onFloatingActionButtonPressed,
      );

  void _onFloatingActionButtonPressed() {
    Fluttertoast.showToast(msg: "Clicked");
  }
}

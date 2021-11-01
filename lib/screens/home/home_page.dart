import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:note_app/consts/colors.dart';
import 'package:note_app/helpers/note_db_helper.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/screens/newNote/new_note_page.dart';
import 'package:note_app/widgets/buttons.dart';
import 'package:note_app/widgets/circular_indicators.dart';
import 'package:note_app/widgets/icon.dart';
import 'package:note_app/widgets/set_text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NoteDbHelper _db = NoteDbHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      floatingActionButton: _showFloatingActionButton(),
      body: _buildBody(),
    );
  }

  _buildBody() => Container(
        child: _showNotes(),
      );

  AppBar _buildAppBar() => AppBar(
        backgroundColor: colorLightBrown,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: setSimpleText(
          "Notes",
          color: colorWhite,
          size: 24.0,
        ),
        actions: [
          setIconButton(() {}, Icons.more_vert),
        ],
      );

  _showNotes() => FutureBuilder(
        future: _db.getAllNotes(),
        builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snap) {
          if (snap.hasData) {
            return StaggeredGridView.countBuilder(
              crossAxisCount: 2,
              itemCount: snap.data!.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> map = snap.data![index];
                Note note = Note.fromJson(map);
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        setSimpleText(note.title,
                            weight: FontWeight.bold, size: 18.0),
                        setSimpleText(note.body)
                      ],
                    ),
                  ),
                );
              },
              staggeredTileBuilder: (i) => const StaggeredTile.fit(1),
            );
          } else {
            return showCupertinoIndicator;
          }
        },
      );

  FloatingActionButton _showFloatingActionButton() => FloatingActionButton(
        backgroundColor: colorLightBrown,
        child: setIcon(Icons.add),
        onPressed: _onFloatingActionButtonPressed,
      );

  void _onFloatingActionButtonPressed() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => NewNotePage()));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:note_app/consts/colors.dart';
import 'package:note_app/helpers/note_db_helper.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/buttons.dart';

class NewNotePage extends StatefulWidget {
  const NewNotePage({Key? key}) : super(key: key);

  @override
  _NewNotePageState createState() => _NewNotePageState();
}

class _NewNotePageState extends State<NewNotePage> {
  final NoteDbHelper _db = NoteDbHelper();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      persistentFooterButtons: _persistentFooterButtons(),
    );
  }

  AppBar _buildAppBar() => AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: colorLightBrown,
        actions: [
          setIconButton(() {}, Icons.outbox_outlined),
          setIconButton(() {}, Icons.color_lens_outlined),
          setIconButton(() {}, Icons.more_vert),
        ],
      );

  SingleChildScrollView _buildBody() => SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
              style: _setBoldTextStyle(),
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hintText: "Title",
                hintStyle: _setBoldTextStyle(),
                border: _setBorder(),
                focusedBorder: _setBorder(),
                enabledBorder: _setBorder(),
              ),
            ),
            TextField(
              controller: _bodyController,
              keyboardType: TextInputType.multiline,
              maxLines: 30,
              decoration: InputDecoration(
                hintText: "Body",
                border: _setBorder(),
                enabledBorder: _setBorder(),
                focusedBorder: _setBorder(),
              ),
            ),
          ],
        ),
      );

  List<Widget> _persistentFooterButtons() => [
        setElevatedButton(() {
          Navigator.pop(context);
        }, "Cancel", color: colorRed),
        setElevatedButton(
          () {
            String title = _titleController.text.trim();
            String body = _bodyController.text.trim();

            if (title.isEmpty || body.isEmpty) return;

            Note note = Note(title, body, 0);

            _db.addNewNote(note);

            Fluttertoast.showToast(msg: "New note was added");
            Navigator.pop(context);
          },
          "Save",
          color: colorLightBrown,
        ),
      ];

  TextStyle _setBoldTextStyle() => const TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      );

  OutlineInputBorder _setBorder() =>
      const OutlineInputBorder(borderSide: BorderSide.none);
}

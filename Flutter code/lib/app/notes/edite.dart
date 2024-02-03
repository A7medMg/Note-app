import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled7/constans/crud.dart';
import 'package:untitled7/main.dart';

import '../../constans/link.dart';
import '../../constans/vaild.dart';
import '../../veiw/widget/Auth/Bottoum.dart';
import '../../veiw/widget/Auth/CustomTextFormFiled.dart';

class EditeNote extends StatefulWidget {
  final notes;

  const EditeNote({super.key, this.notes});

  @override
  State<EditeNote> createState() => _EditeNoteState();
}

Crud crud = Crud();

GlobalKey<FormState> formstate = GlobalKey<FormState>();
var title_note = TextEditingController();
var content_note = TextEditingController();
File? myfile;

editeNotes(context, widget) async {
  if (formstate.currentState!.validate()) {
    var response;
    if (myfile == null) {
      response = await crud.postRequest(
        linkUpdateNote,
        {
          "id": widget.notes["notes_id"].toString(),
          "title": title_note.text,
          "content": content_note.text,
          "imagename": widget.notes["notes_image"].toString()
        },
      );
    } else {
      response = await crud.postRequestWithFile(
          linkUpdateNote,
          {
            "id": widget.notes["notes_id"].toString(),
            "title": title_note.text,
            "content": content_note.text,
            "imagename": widget.notes["notes_image"].toString()
          },
          myfile!);
    }
    if (response["status"] == "successful") {
      Navigator.of(context).pushReplacementNamed("/Home");
    }
  }
}

class _EditeNoteState extends State<EditeNote> {
  @override
  void initState() {
    // TODO: implement initState
    title_note.text = widget.notes["notes_title"];
    content_note.text = widget.notes["notes_content"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 20,
        title: const Text("update Notes"),
      ),
      body: Container(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              Form(
                key: formstate,
                child: Column(
                  children: [
                    CustomTextFormFiled(
                      hintText: 'enter title note',
                      label: 'title',
                      myController: title_note,
                      suffixIcon: Icons.note,
                      validator: (v) {
                        return validInput(v!, 4, 20);
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextFormFiled(
                      validator: (v) {
                        return validInput(v!, 4, 200);
                      },
                      hintText: 'enter Content note',
                      label: 'content',
                      myController: content_note,
                      suffixIcon: Icons.note,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomBottomAuth(
                      text: 'Save',
                      onPressed: () async {
                        await editeNotes(context, widget);
                      },
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    CustomBottomAuth(
                      text: 'select image',
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => Container(
                                  height: 150,
                                  child: Column(
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          XFile? xfile = await ImagePicker()
                                              .pickImage(
                                                  source: ImageSource.gallery);
                                          Navigator.of(context).pop();
                                          myfile = File(xfile!.path);
                                        },
                                        child: Container(
                                          color: Colors.yellowAccent,
                                          padding: EdgeInsets.all(10),
                                          child: Text(
                                            "Choose Image From Gallery ",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.redAccent),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          XFile? xfile = await ImagePicker()
                                              .pickImage(
                                                  source: ImageSource.camera);
                                          Navigator.of(context).pop();
                                          myfile = File(xfile!.path);
                                        },
                                        child: Container(
                                          color: Colors.yellowAccent,
                                          padding: EdgeInsets.all(10),
                                          child: Text(
                                            "Choose Image From camera ",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.redAccent),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ));
                      },
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}

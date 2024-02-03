import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled7/constans/crud.dart';
import 'package:untitled7/main.dart';

import '../../constans/link.dart';
import '../../constans/vaild.dart';
import '../../veiw/widget/Auth/Bottoum.dart';
import '../../veiw/widget/Auth/CustomTextFormFiled.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({super.key});

  @override
  State<AddNotes> createState() => _AddNotesState();
}

Crud crud = Crud();
File? myfile;
GlobalKey<FormState> formstate = GlobalKey<FormState>();
var title_note = TextEditingController();
var content_note = TextEditingController();

addNotes(context) async {
  if (myfile == null)
    return AwesomeDialog(
        context: context, title: "هام ", body: Text("الرجاء اضافه صوره"))
      ..show();
  if (formstate.currentState!.validate()) {
    var response = await crud.postRequestWithFile(
        linkAddNote,
        {
          "id": sharedPref.getString("id"),
          "title": title_note.text,
          "content": content_note.text
        },
        myfile!);
    if (response["status"] == "successful") {
      Navigator.of(context).pushReplacementNamed("/Home");
    }
  }
}

class _AddNotesState extends State<AddNotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 20,
        title: const Text("Add Notes"),
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
                    Container(
                      height: 200,
                      child: CustomTextFormFiled(
                        validator: (v) {
                          return validInput(v!, 4, 200);
                        },
                        hintText: 'enter Content note',
                        label: 'content',
                        myController: content_note,
                        suffixIcon: Icons.note,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomBottomAuth(
                      text: 'Add',
                      onPressed: () async {
                        await addNotes(context);
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomBottomAuth(
                      text: 'select image',
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => Container(
                              padding: EdgeInsets.all(15),
                                  height: 180,
                                  width: double.infinity,
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
                                          width: double.infinity,
                                          color: Colors.yellowAccent,
                                          alignment: Alignment.center,
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
                                          width: double.infinity,
                                          alignment: Alignment.center,
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

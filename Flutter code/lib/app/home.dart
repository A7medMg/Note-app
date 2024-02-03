import 'package:flutter/material.dart';
import 'package:untitled7/app/modelclass.dart';
import 'package:untitled7/app/notes/edite.dart';
import 'package:untitled7/main.dart';

import '../constans/crud.dart';
import '../constans/link.dart';
import '../veiw/VeiwNotesCont.dart';
import '../veiw/widget/card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Crud crud = Crud();

  getnotes() async {
    var response = await crud
        .postRequest(linkVeiwNote, {"id": sharedPref.getString("id")});
    return response;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
              onPressed: () {
                sharedPref.clear();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/login', (route) => false);
              },
              icon: Icon(Icons.logout))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("/Add");
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            FutureBuilder(
                future: getnotes(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data["status"] == "fail")
                      return Center(
                          child: Text(
                        "لايوجد ملاحظات",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 50),
                      ));
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data["data"].length,
                        itemBuilder: (context, i) => Card_note(
                          goveiw: (){
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => VeiwNotesCont(
                                  notesCont: snapshot.data["data"][i],
                                )));
                          },
                              ontap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => EditeNote(
                                      notes: snapshot.data["data"][i],
                                        )));
                              },
                              Delete: () async {
                                var response =
                                    await crud.postRequest(linkDeleteNote, {
                                  "id": snapshot.data["data"][i]["notes_id"]
                                      .toString(),
                                  "imagename": snapshot.data["data"][i]
                                          ["notes_image"]
                                      .toString()
                                });
                                if (response["status"] == "successful") {
                                  Navigator.of(context)
                                      .pushReplacementNamed("/Home");
                                }
                              },
                              noteModel:
                                  NoteModel.fromJson(snapshot.data['data'][i]),
                            ),);
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: Text("Loading....."),
                    );
                  }
                  return Center(
                    child: Text("Loading....."),
                  );
                })
          ],
        ),
      ),
    );
  }
}

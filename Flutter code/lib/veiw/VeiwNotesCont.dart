


import 'package:flutter/material.dart';

import '../constans/link.dart';
class VeiwNotesCont extends StatefulWidget {
  final notesCont;
  const VeiwNotesCont({super.key, this.notesCont});

  @override
  State<VeiwNotesCont> createState() => _VeiwNotesContState();
}

class _VeiwNotesContState extends State<VeiwNotesCont> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Notes Views" ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Column(


              children: [
                 const Text("Note Title:",style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold
                ),textAlign: TextAlign.left,),

                  const SizedBox(height: 20,),
                Container(
                    padding: EdgeInsets.all(25),
                    decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  
                  color: Colors.grey[300]
                ),child: Text("${widget.notesCont["notes_title"]}",style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 18),)),
                const SizedBox(height: 40,),
                const Text("Content Title:",style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold
                ),textAlign: TextAlign.left,),



                 const SizedBox(height: 20,),
                 Container(padding: EdgeInsets.all(25),
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),

                       color: Colors.grey[300]
                   ),

                     child: Text("${widget.notesCont["notes_content"]}",style: const TextStyle(fontWeight: FontWeight.w700,fontSize: 19),)),

                const SizedBox(height: 50,),
                Container(
                  width: 250,
                  height: 200,
                  child: Image.network('$linkImageRoot/${widget.notesCont["notes_image"]}'
                  ,width: 250,height: 100,),
                ),


              ],

            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../app/modelclass.dart';
import '../../constans/link.dart';

class Card_note extends StatelessWidget {
  final void Function()? ontap;
  final void Function()?goveiw;
  final void Function()? Delete;
   final NoteModel noteModel;
  const Card_note({super.key,required this.ontap, required this.noteModel,  this.Delete, this.goveiw});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: ontap,
        child: Container(
           margin: EdgeInsets.only(bottom: 20),
          width: double.infinity,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(37),
            color: Colors.cyan[200],

          ),

          child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(flex: 2,
              child: CircleAvatar(
                 radius: 45,backgroundImage:NetworkImage('$linkImageRoot/${noteModel.notesImage}' ,),
            ),),



            Expanded(flex:2,child: ListTile(minVerticalPadding: 7.0,title: Text('${noteModel.notesTitle}',maxLines: 1,overflow: TextOverflow.ellipsis,),subtitle: Text('${noteModel.notesContent}',maxLines: 1,overflow: TextOverflow.ellipsis,),)),


            Expanded(child: IconButton(onPressed:Delete, icon: Icon(Icons.delete) ,)),
            Expanded(child: IconButton(onPressed:goveiw, icon: Icon(Icons.navigate_next) ,)),


          ],
        ),


      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../constans/color/colorapp.dart';



class CustomBottomAuth extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const CustomBottomAuth({super.key, this.onPressed, required this.text, });

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 200,
        height: 50,


        child: MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          padding:const EdgeInsets.symmetric(vertical: 15),onPressed: onPressed,color: Colorapp.darkPrimary,child: Text(text,style:const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),));
  }
}
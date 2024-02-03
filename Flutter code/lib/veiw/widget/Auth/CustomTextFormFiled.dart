import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {
  final String hintText;
  final String label;
  final IconData suffixIcon;

  final TextEditingController myController;
  final String? Function(String?)  ? validator;
  final bool ? isPassword;
 final void Function()? onTapIcon;


   CustomTextFormFiled ({super.key, this.onTapIcon,required this.hintText, required this.label, required this.suffixIcon, required this.myController,     this.isPassword,  this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword ==null||isPassword==false ?false:true,
      validator:validator ,
      controller: myController,
    decoration: InputDecoration(

    hintText: hintText,
    hintStyle: TextStyle(fontSize: 12),
    suffixIcon: InkWell(child: Icon(suffixIcon),onTap:onTapIcon ,),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding:const EdgeInsets.symmetric(vertical: 20,horizontal: 30),
    label: Container(
    margin:const EdgeInsets.symmetric(horizontal: 10),
    child: Text(label)),
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(30)

    )

    ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../constans/color/colorapp.dart';

class CustomRowToSignInAndUp extends StatelessWidget {
  final String textone;
  final String texttwo;
  final void Function() ontap;

  const CustomRowToSignInAndUp({super.key, required this.textone, required this.texttwo, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Text(textone),
        SizedBox(width: 5,),
        InkWell(onTap:ontap,
            child: Text(texttwo,style: TextStyle(fontWeight: FontWeight.bold,color: Colorapp.primaryColor),)),
      ],
    );
  }
}

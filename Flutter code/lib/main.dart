import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled7/app/notes/addnote.dart';
import 'package:untitled7/app/notes/edite.dart';

import 'app/auth/login.dart';
import 'app/auth/register.dart';
import 'app/home.dart';
import 'constans/color/colorapp.dart';
late SharedPreferences sharedPref;
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
   sharedPref=await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      theme: ThemeData(

        iconTheme: IconThemeData(
          color: Colors.grey
        ),
        backgroundColor: Colorapp.kPrimaryLightColor,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colorapp.lightPrimary,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colorapp.kPrimaryColor
        )
      ),

      initialRoute: sharedPref.getString('id')==null?'/login':'/Home',
       debugShowCheckedModeBanner: false,
       routes: {

        '/login':(context)=> Login(),
         '/SignUp':(context)=>SignUp(),
         '/Home':(context)=>Home(),
         '/Add':(context)=>AddNotes(),
         '/Edite':(context)=>EditeNote(),
       },
    );
  }
}



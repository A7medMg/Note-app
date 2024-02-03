import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:untitled7/constans/crud.dart';
import 'package:untitled7/constans/link.dart';
import 'package:untitled7/main.dart';

import '../../constans/color/colorapp.dart';
import '../../constans/vaild.dart';
import '../../veiw/widget/Auth/Bottoum.dart';
import '../../veiw/widget/Auth/CustomRowToSignIn&Up.dart';
import '../../veiw/widget/Auth/CustomTextFormFiled.dart';

class Login extends StatefulWidget {

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState>formstate=GlobalKey();
  var emailcontroller=TextEditingController();
 bool isloading=false;
  var passcontroller=TextEditingController();
  bool ispasswordShow=true;
Crud _crud=Crud();
login()async{
  if(formstate.currentState!.validate()){
    isloading=true;
    setState(() {

    });
   var response=await _crud.postRequest(linklogin, {
     'email':emailcontroller.text,
     'password':passcontroller.text
   });
    isloading=false;
    setState(() {

    });
   if(response['status']=='successful'){
     sharedPref.setString('id', response['data']['id'].toString());
     sharedPref.setString('username', response['data']['username']);
     sharedPref.setString('email', response['data']['email']);
     Navigator.of(context).pushNamedAndRemoveUntil('/Home', (route) => false);
   }else{

    AwesomeDialog(

        context: context,title: 'warning',body: Text("Email or password not found!"))..show();
   }
  }
}
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body:isloading==true?Center(child: CircularProgressIndicator(),): ListView(
        children: [
          Container(
            padding:const EdgeInsets.all(20),
            child: Form(
              key: formstate,
              child: Column(
                children: [
                  Text("Wellcom to your note app",textAlign:TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  SizedBox(height: 50,),
                  Image.asset('assets/images/logo.png',width: 200,height: 200,),
                 const SizedBox(height: 40,),
                  CustomTextFormFiled(validator: (v){
                    return validInput(v!,8,20);
                  },hintText: 'Enter yor email', label: 'Email', suffixIcon: Icons.email, myController: emailcontroller),
                 const SizedBox(height: 40,),
                  CustomTextFormFiled(validator: (v){
                    return validInput(v!,4,20);
                  },isPassword:ispasswordShow,hintText: 'Enter yor Password', label: 'password', suffixIcon:Icons.lock_outline ,onTapIcon: (){isPasswordShown();}, myController: passcontroller),

                  const SizedBox(height: 50,),
              Container(
                width: 500,
                height: 50,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  padding:const EdgeInsets.symmetric(vertical: 15),onPressed: ()async{
                 await login();
                },color: Colorapp.darkPrimary,child: Text('login',style:const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
              ), const SizedBox(height: 40,),

                  CustomRowToSignInAndUp(textone: 'Don`t Have An Account ?', texttwo: 'Sign Up', ontap: () { Navigator.of(context).pushNamed('/SignUp');  },),


                ],
              ),
            ),
          )
        ],
      ),
    );

  }
  isPasswordShown(){
    setState(() {
      ispasswordShow=ispasswordShow==true ?false:true;
    });


  }
}

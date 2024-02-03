import 'package:flutter/material.dart';
import 'package:untitled7/constans/crud.dart';
import 'package:untitled7/constans/link.dart';

import '../../constans/color/colorapp.dart';
import '../../constans/vaild.dart';
import '../../veiw/widget/Auth/Bottoum.dart';
import '../../veiw/widget/Auth/CustomTextFormFiled.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  GlobalKey<FormState> formstate = GlobalKey();
  var emailcontroller = TextEditingController();
  var usernamecontroller = TextEditingController();
  var passcontroller = TextEditingController();
  bool isloading = false;
  Crud _crud = Crud();

  signUp() async {
    if (formstate.currentState!.validate()) {
      isloading = true;
      setState(() {});
      var response = await _crud.postRequest(linkSignUp, {
        'username': usernamecontroller.text,
        'email': emailcontroller.text,
        'password': passcontroller.text
      });
      isloading = false;
      setState(() {});
      print(response['status']);
      if (response['status'] == 'successful') {
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/Home', (route) => false);
      } else {
        print("sign up failed");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isloading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: formstate,
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          width: 200,
                          height: 200,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        CustomTextFormFiled(
                            validator: (v) {
                              return validInput(v!, 3, 20);
                            },
                            hintText: 'Enter yor name',
                            label: 'username',
                            suffixIcon: Icons.person,
                            myController: usernamecontroller),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextFormFiled(
                            validator: (v) {
                              return validInput(v!, 7, 20);
                            },
                            hintText: 'Enter yor email',
                            label: 'Email',
                            suffixIcon: Icons.email,
                            myController: emailcontroller),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextFormFiled(
                            validator: (v) {
                              return validInput(v!, 10, 20);
                            },
                            hintText: 'Enter yor Password',
                            label: 'password',
                            suffixIcon: Icons.lock_outline,
                            myController: passcontroller),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 500,
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            onPressed: () async {
                              await signUp();
                            },
                            color: Colorapp.primaryColor,
                            child: Text(
                              'sign up',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                            width: 500,
                            child: CustomBottomAuth(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushReplacementNamed("/login");
                              },
                              text: 'Sign in',
                            )),
                      ],
                    ),
                  ),
                )
              ],
            ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:svgimageademo/sign_up.dart';
import 'package:svgimageademo/signin_page/apple.dart';
import 'package:svgimageademo/signin_page/facbook.dart';
import 'package:svgimageademo/signin_page/google.dart';
import 'package:svgimageademo/signin_page/twitter.dart';
import 'package:svgimageademo/verifications.dart';
import 'package:svgimageademo/widget/overlapimage.dart';
import 'package:svgimageademo/widget/widget2.dart';
import 'package:svgimageademo/widgetscreen/forget_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();

  var email = "";
  var password = "";
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>  VerificationScreen(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("No User Found for that Email");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "No User Found for that Email",
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          ),
        );
      } else if (e.code == 'wrong-password') {
        print("Wrong Password Provided by User");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Wrong Password Provided by User",
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
            statusBarColor: Color(0xffFF9201)
        )
    );
    return Stack(
        children: [
          BackgroungWidget2(),
          Form(
            key: _formKey,
            child: Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: Colors.transparent,
                body: Padding(
                  padding: const EdgeInsets.only(top:28.0),
                  child:Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 170),
                              child:  Text('Welcome',
                                  style: GoogleFonts.greatVibes(color: const Color(0xffF4AE05),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 56)
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextFormField(
                                  controller: emailController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Email';
                                    } else if (!value.contains('@')) {
                                      return 'Please Enter Valid Email';
                                    }
                                    return null;
                                  },
                                  decoration:InputDecoration(
                                      label: Text('Email',
                                        style: GoogleFonts.coustard(color: Colors.grey,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(color:Color(0xffFE9706)),
                                        borderRadius: BorderRadius.all(Radius.circular(10)) ,)
                                  ),
                                ),
                                const SizedBox(height: 5,),
                                TextFormField(
                                  autofocus: false,
                                  obscureText: true,
                                  controller: passwordController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Password';
                                    }
                                    return null;
                                  },
                                  decoration:InputDecoration(
                                      label: Text('Password',
                                        style: GoogleFonts.coustard(color: Colors.grey,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(color:Color(0xffFE9706)),
                                        borderRadius: BorderRadius.all(Radius.circular(10)) ,)
                                  ),
                                ),
                                Expanded(
                                  child: TextButton(
                                    onPressed: () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ForgotPassword(),
                                        ),
                                      )
                                    },
                                    child: const Text(
                                      'Forgot Password ?',
                                      style: TextStyle(fontSize: 10.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              height: 30,
                              width: 150,
                              padding: const EdgeInsets.only(left: 3),
                              decoration:
                              BoxDecoration(
                                color: const Color(0xffAE710C),
                                borderRadius: BorderRadius.circular(10),
                                // border: Border(
                                //   bottom: BorderSide(color: Colors.black),
                                //   top: BorderSide(color: Colors.black),
                                //    left: BorderSide(color: Colors.black),
                                //   right: BorderSide(color: Colors.black),
                                // ),
                              ),
                              child:  RawMaterialButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      email = emailController.text;
                                      password = passwordController.text;
                                    });
                                    userLogin();
                                  }
                                },
                                child: const Text(
                                  'Login',
                                  style: TextStyle(fontSize: 18.0),
                                ),
                              ),
                            ),
                            const Center(child: Text('OR',
                              style: TextStyle(fontSize: 14,color: Color(0xffFF9603)),)),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                LoginWithGoogle(),
                                 LoginWithTwitter(),
                                LoginWithApple(),
                                LoginWithFacebook()
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0,right: 12.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Terms And Condition',
                                    style: GoogleFonts.cairo(fontSize:16,color: Colors.blue,
                                    ),),
                                  Text('Privacy Policy ',
                                    style: GoogleFonts.cairo(fontSize:16,color: Colors.blue,
                                    ),)
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 7,),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right:20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Text(
                                    'Do not have an account?',
                                    style: TextStyle(
                                      fontSize:16,color: Color(0xff858181),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 40.0),
                              child:TextButton(onPressed: () {
                                Navigator.pushAndRemoveUntil(context,
                                    PageRouteBuilder(pageBuilder:
                                        (context,a,b)=> const SignUp()),
                                        (route) => false);
                              },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 100.0),
                                  child:  Text('Signup',
                                    style: GoogleFonts.coustard(fontSize:16,color: Colors.blue,
                                        fontWeight: FontWeight.w400
                                    ),),
                                ),)
                            ),
                          ],
                        ),
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 50.0),
                            child: OverlapImage(),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
          ),
        ]);
  }
}

// background.svg
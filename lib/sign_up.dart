import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:svgimageademo/login_page.dart';
import 'package:svgimageademo/widget/alignroundedbutton.dart';
import 'package:svgimageademo/widget/widget1.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {


  // final _formKey = GlobalKey<FormState>();
  //
  // var email = "";
  // var password = "";
  // var confirmPassword = "";
  // // Create a text controller and use it to retrieve the current value
  // // of the TextField.
  // final emailController = TextEditingController();
  // final passwordController = TextEditingController();
  // final confirmPasswordController = TextEditingController();
  //
  // @override
  // void dispose() {
  //   // Clean up the controller when the widget is disposed.
  //   emailController.dispose();
  //   passwordController.dispose();
  //   confirmPasswordController.dispose();
  //   super.dispose();
  // }
  //
  // registration() async {
  //   if (password == confirmPassword) {
  //     try {
  //       final userCredential = await FirebaseAuth.instance
  //           .createUserWithEmailAndPassword(email: email, password: password);
  //       print(userCredential);
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //           backgroundColor: Colors.redAccent,
  //           content: Text(
  //             "Registered Successfully. Please Login..",
  //             style: TextStyle(fontSize: 20.0),
  //           ),
  //         ),
  //       );
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => LoginPage(),
  //         ),
  //       );
  //     } on FirebaseAuthException catch (e) {
  //       if (e.code == 'weak-password') {
  //         print("Password Provided is too Weak");
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(
  //             backgroundColor: Colors.orangeAccent,
  //             content: Text(
  //               "Password Provided is too Weak",
  //               style: TextStyle(fontSize: 18.0, color: Colors.black),
  //             ),
  //           ),
  //         );
  //       } else if (e.code == 'email-already-in-use') {
  //         print("Account Already exists");
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(
  //             backgroundColor: Colors.orangeAccent,
  //             content: Text(
  //               "Account Already exists",
  //               style: TextStyle(fontSize: 18.0, color: Colors.black),
  //             ),
  //           ),
  //         );
  //       }
  //     }
  //   } else {
  //     print("Password and Confirm Password doesn't match");
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         backgroundColor: Colors.orangeAccent,
  //         content: Text(
  //           "Password and Confirm Password doesn't match",
  //           style: TextStyle(fontSize: 16.0, color: Colors.black),
  //         ),
  //       ),
  //     );
  //   }
  // }
  // // String assetName = 'assets/first.svg';
  // // final Widget svg = SvgPicture.asset(
  // //     'assets/first.svg',
  // //     colorBlendMode: BlendMode.multiply);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
            statusBarColor: Color(0xffFF9201)
        )
    );
    return Stack(
        children: [
          BackgroundImage(),
      Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.transparent,
              body: Container(
                padding: const EdgeInsets.only(top:30,left: 20),
                // height: MediaQuery.of(context).size.height - 40,
                // width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        GestureDetector(
                            child: const Icon(Icons.arrow_back),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context)=> const LoginPage()));
                            }),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text("Hello!",
                              style: GoogleFonts.greatVibes(color: const Color(0xffF4AE05),
                                  fontSize: 56)),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left:12.0),
                          child: Text("Signup to Create an account here. ",
                            style: TextStyle(
                                fontSize: 15,
                                color:Colors.black),),
                        )
                      ],
                    ),
                    RoundedReact1(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Already have an account?"),
                        Text(" Login Here", style:TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xff268ADC),
                            fontSize: 18
                        ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
        ]
    );
  }
}

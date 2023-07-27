import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:svgimageademo/login_page.dart';


class RoundedReact extends StatefulWidget {
  const RoundedReact({Key? key}) : super(key: key);

  @override
  State<RoundedReact> createState() => _RoundedReactState();
}

class _RoundedReactState extends State<RoundedReact> {

   final _formKey = GlobalKey<FormState>();

   var email = "";
   var password = "";
   var confirmPassword = "";
   // Create a text controller and use it to retrieve the current value
   // of the TextField.
   final emailController = TextEditingController();
   final passwordController = TextEditingController();
   final confirmPasswordController = TextEditingController();

   @override
   void dispose() {
     // Clean up the controller when the widget is disposed.
     emailController.dispose();
     passwordController.dispose();
     confirmPasswordController.dispose();
     super.dispose();
   }

   registration() async {
     if (password == confirmPassword) {
       try {
         UserCredential userCredential = await FirebaseAuth.instance
             .createUserWithEmailAndPassword(email: email, password: password);
         print(userCredential);
         ScaffoldMessenger.of(context).showSnackBar(
           const SnackBar(
             backgroundColor: Colors.redAccent,
             content: Text(
               "Registered Successfully. Please Login..",
               style: TextStyle(fontSize: 20.0),
             ),
           ),
         );
         Navigator.pushReplacement(
           context,
           MaterialPageRoute(
             builder: (context) => LoginPage(),
           ),
         );
       } on FirebaseAuthException catch (e) {
         if (e.code == 'weak-password') {
           print("Password Provided is too Weak");
           ScaffoldMessenger.of(context).showSnackBar(
             const SnackBar(
               backgroundColor: Colors.orangeAccent,
               content: Text(
                 "Password Provided is too Weak",
                 style: TextStyle(fontSize: 18.0, color: Colors.black),
               ),
             ),
           );
         } else if (e.code == 'email-already-in-use') {
           print("Account Already exists");
           ScaffoldMessenger.of(context).showSnackBar(
             const SnackBar(
               backgroundColor: Colors.orangeAccent,
               content: Text(
                 "Account Already exists",
                 style: TextStyle(fontSize: 18.0, color: Colors.black),
               ),
             ),
           );
         }
       }
     } else {
       print("Password and Confirm Password doesn't match");
       ScaffoldMessenger.of(context).showSnackBar(
         const SnackBar(
           backgroundColor: Colors.orangeAccent,
           content: Text(
             "Password and Confirm Password doesn't match",
             style: TextStyle(fontSize: 16.0, color: Colors.black),
           ),
         ),
       );
     }
   }


   @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Column(
              children: [
                Container(
                  height: 40,
                  width: 290,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter User Name';
                      }
                      return null;
                    },
                    decoration:InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: "User Name",
                        label: Text('userName ',
                          style: GoogleFonts.coustard(color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color:Color(0xffFE9706)),
                          borderRadius: BorderRadius.all(Radius.circular(10)) ,)
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  height: 40,
                  width: 290,
                  child: TextFormField(
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
                      prefixIcon: Icon(Icons.email),
                        label: Text('email ',
                          style: GoogleFonts.coustard(color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color:Color(0xffFE9706)),
                          borderRadius: BorderRadius.all(Radius.circular(10)) ,)
                    ),
                  ),
                ),
               const SizedBox(height: 20,),
                Container(
                  height: 40,
                  width: 290,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Phone No';
                      }
                      return null;
                    },
                    decoration:InputDecoration(
                        prefixIcon: Icon(Icons.phone_android),
                        hintText: "+91-1234567890",
                        label: Text('phoneNo',
                          style: GoogleFonts.coustard(color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color:Color(0xffFE9706)),
                          borderRadius: BorderRadius.all(Radius.circular(10)) ,)
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  height: 40,
                  width: 290,
                  child: TextFormField(
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
                        prefixIcon: Icon(Icons.lock),
                        label: Text('password',
                          style: GoogleFonts.coustard(color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color:Color(0xffFE9706)),
                          borderRadius: BorderRadius.all(Radius.circular(10)) ,)
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 40,
                  width: 290,
                  child: TextFormField(
                    autofocus: false,
                    obscureText: true,
                    controller: confirmPasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Password';
                      }
                      return null;
                    },
                    decoration:InputDecoration(
                        prefixIcon: Icon(Icons.lock_outlined),
                        label: Text('confirmPassword',
                          style: GoogleFonts.coustard(color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color:Color(0xffFE9706)),
                          borderRadius: BorderRadius.all(Radius.circular(10)) ,)
                    ),
                  ),
                ),
              ],
          ),
          SizedBox(height: 40,),
          Center(
            child:Container(
                height: 33,
                width: 184,
                padding: const EdgeInsets.only(top: 3, left: 3),
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
                child: Center(
                  child: RawMaterialButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          email = emailController.text;
                          password = passwordController.text;
                          confirmPassword = confirmPasswordController.text;
                        });
                        registration();
                      }
                    },
                    child:  const Text(
                      'CREATE',
                      style: TextStyle(fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.black,
                      ),),
                    ),
                ),
                ),
            ),
        ],
      ),
    );
  }
}



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:svgimageademo/login_page.dart';
import 'package:svgimageademo/widget/usermodel.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
class RoundedReact1 extends StatefulWidget {
   RoundedReact1({
    Key? key,
  }) : super(key: key);


  @override
  State<RoundedReact1> createState() => _RoundedReact1State();
}

class _RoundedReact1State extends State<RoundedReact1> {
  postDetailsToFirestore() async {
    User? user = _auth.currentUser;
    UserModal userModal = UserModal();
    userModal.email = user!.email;
    userModal.name = _nameController.text;
    userModal.uid = user.uid;
    userModal.phone = user.phoneNumber;

    await FirebaseFirestore.instance
        .collection("user")
        .doc(user.uid)
        .set(userModal.toMap());
    Fluttertoast.showToast(msg: "Account created");
    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => LoginPage()),
            (route) => false);
  }
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final _formKey = GlobalKey<FormState>();
     final _nameController =TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final phoneNoController = TextEditingController();
  final usernameController = TextEditingController();
  bool _success = false;
  late String _userEmail;

  void _create() async {
    final user = (await _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    ))
        .user;
    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email!;
      });
    } else {
      setState(() {
        _success = true;
      });
    }
  }

  String password = '';
  String email = '';
  String phone = '';
  String name = '';
  bool invisible = true;
  RegExp pass_valid = RegExp(r"(?= .\d)(?=.[a-z])(?=.[A-Z])(?=.*\w)");

  bool validatePassword(String password) {
    var pass;
    String _password = pass.trim();
    if(pass_valid.hasMatch(_password)) {
      return true;
    }else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Container(
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Email';
                  }
                  return null;
                },
                onChanged: (value) {
                  email = value;
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
              SizedBox(height: 20,),
              TextFormField(
                controller: _nameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter User Name';
                  }
                  return null;
                },
                onChanged: (value) {
                  name = value;
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
              const SizedBox(height: 20,),
              TextFormField(
                controller: phoneNoController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Phone No';
                  }
                  return null;
                },
                onChanged: (value) {
                  phone = value.toString();
                },
                decoration:InputDecoration(
                    prefixIcon: Icon(Icons.phone_android),
                    hintText: "+91",
                    label: Text('phone',
                      style: GoogleFonts.coustard(color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color:Color(0xffFE9706)),
                      borderRadius: BorderRadius.all(Radius.circular(10)) ,)
                ),
              ),
              SizedBox(height: 20,),
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
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await _auth.
                          createUserWithEmailAndPassword(
                              email: email, password: password)
                              .then((value) => {  postDetailsToFirestore() })
                              .catchError(
                                  (e) {
                                Fluttertoast.showToast(msg: e!.message);
                              });
                          firebaseFirestore
                              .collection('user')
                              .doc(
                              FirebaseAuth.instance.currentUser!.uid.toString())
                              .set({
                            'email': email,
                            'name': name,
                            'phone': phone
                          });
                        };
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
        ),
    );
  }
}



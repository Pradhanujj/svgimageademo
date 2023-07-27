import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:svgimageademo/sign_up.dart';
import 'package:svgimageademo/widget/backgra.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {

  String assetName = 'assets/first.svg';
  final Widget svg = SvgPicture.asset(
      'assets/Ellipse 2.svg',
      colorBlendMode: BlendMode.multiply);

  final Widget svg1 = SvgPicture.asset(
      'assets/VEGGI HEART 1.svg',
      colorBlendMode: BlendMode.multiply);


  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          WidgetBackground(),
          Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
           body: Container(
            padding: const EdgeInsets.only(top:40,left: 20),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20,),
             GestureDetector(
             child: const Icon(Icons.arrow_back),
             onTap: () {
             Navigator.push(context, MaterialPageRoute(
             builder: (context)=> const SignUp()));
            }),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                      child: Text('OTP',
                        style: GoogleFonts.coustard(fontSize:20,color: const Color(0xff858181)),)
                  ),
                  const SizedBox(height: 10,),
                  Center(
                    child: svg1,
                    // String assetName1 = 'assets/first.svg';
                  ),
                  const SizedBox(height: 10,),
                  Center(
                      child: Text('Verification code',
                        style: GoogleFonts.coustard(fontSize:24,color: const Color(0xffFF9603)),)
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text('We have sent the code verification to your Mobile Number',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.coustard(fontSize:15,color: const Color(0xff858181)),),
                  ),
                  const SizedBox(height: 20,),
                 SizedBox(
                 height: 40,
                 width: 290,
                 child:TextFormField(
                decoration:InputDecoration(
                    suffixIcon: const Icon(Icons.edit),
                    label: Text('+91-1234567890',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                     svg,
                      svg,
                      svg,
                      svg,
                      ],
                  ),
                  const SizedBox(height: 50,),
                  Container(
                    height: 37,
                    width: 230,
                    padding: const EdgeInsets.only(top: 3, left: 3),
                    decoration:
                    BoxDecoration(
                      color: const Color(0xffAE710C),
                      borderRadius: BorderRadius.circular(20),
                      // border: Border(
                      //   bottom: BorderSide(color: Colors.black),
                      //   top: BorderSide(color: Colors.black),
                      //    left: BorderSide(color: Colors.black),
                      //   right: BorderSide(color: Colors.black),
                      // ),
                    ),
                    child: const Center(
                      child: Text(
                        "DONE", style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      ),
                    ),
                  ),
                ],
              )
        ]
            )
           ))
        ]);
    }
}

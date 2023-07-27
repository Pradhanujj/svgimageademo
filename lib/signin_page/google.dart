import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginWithGoogle extends StatefulWidget {
  const LoginWithGoogle({Key? key}) : super(key: key);

  @override
  _LoginWithGoogleState createState() => _LoginWithGoogleState();
}

class _LoginWithGoogleState extends State<LoginWithGoogle> {
  String userEmail = "";
  String assetName = 'assets/first.svg';
  final Widget svg = SvgPicture.asset(
    'assets/icons8-google-64 1.svg',
  );
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
            onPressed: () async {
              await signInWithGoogle();
                setState(() {});
      },
            child: svg,
    );
  }
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    userEmail = googleUser.email;
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}



//   RawMaterialButton(
//     onPressed: (){
//       showDialog(context: context,
//           builder: (context) {
//           return AlertDialog(
//           actions: [
//             Container(
//           height: 360,
//           width: 360,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20)
//           ),
//           child: RawMaterialButton(
//             onPressed: ()     //             },
//           )
//       ),]
//       );
//     }
//       );
//     },
//     child: svg
// );
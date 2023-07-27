import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter_login/twitter_login.dart';

class LoginWithTwitter extends StatefulWidget {
  const LoginWithTwitter({Key? key}) : super(key: key);

  @override
  _LoginWithTwitterState createState() => _LoginWithTwitterState();
}

class _LoginWithTwitterState extends State<LoginWithTwitter> {

  String assetName1 = 'assets/first.svg';
  final Widget svg1 = SvgPicture.asset(
    'assets/icons8-twitter-64 1.svg',);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(onPressed: (){
      signInWithTwitter();
    },
      child: svg1,
    );
  }

  void signInWithTwitter() async {

    // Create a TwitterLogin instance
    final twitterLogin =  TwitterLogin(
        apiKey: 'CP1ck9xhkSPRI3fpZbssh20Ay',
        apiSecretKey: 'ExovdLXEkaDktrjuUEnXl0tzBZNBe30oz4qJhpBVlMVwdpJ3KA',
        redirectURI: 'flutter-twitter-practice://'
    );

    // Trigger the sign-in flow
    await twitterLogin.login().then((value) async {

      final twitterAuthCredential = TwitterAuthProvider.credential(
        accessToken: value.authToken!,
        secret: value.authTokenSecret!,
      );

      await FirebaseAuth.instance.signInWithCredential(twitterAuthCredential);

    });

  }
}
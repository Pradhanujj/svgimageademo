// import 'package:html_shim/html.dart' show window;
import 'package:flutter/foundation.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:sign_in_with_apple/sign_in_with_apple.dart';


class LoginWithApple extends StatefulWidget {
  const LoginWithApple({Key? key}) : super(key: key);

  @override
  _LoginWithApple createState() => _LoginWithApple();
}

class _LoginWithApple extends State<LoginWithApple> {
  String assetName3 = 'assets/first.svg';
  final Widget svg3 = SvgPicture.asset(
    'assets/icons8-apple-logo-64 1.svg',
  );
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: svg3,
      onPressed: () async {
        final credential = await SignInWithApple.getAppleIDCredential(
          scopes: [
            AppleIDAuthorizationScopes.email,
            AppleIDAuthorizationScopes.fullName,
          ],
          webAuthenticationOptions: WebAuthenticationOptions(
            // TODO: Set the `clientId` and `redirectUri` arguments to the values you entered in the Apple Developer portal during the setup
            clientId:
            'de.lunaone.flutter.signinwithappleexample.service',

            redirectUri:
            // For web your redirect URI needs to be the host of the "current page",
            // while for Android you will be using the API server that redirects back into your app via a deep link
           // kIsWeb
                // ? Uri.parse('https://${google.location.host}/')
                // :
            Uri.parse(
              'https://flutter-sign-in-with-apple-example.glitch.me/callbacks/sign_in_with_apple',
            ),
          ),
          // TODO: Remove these if you have no need for them
          nonce: 'example-nonce',
          state: 'example-state',
        );

        // ignore: avoid_print
        print(credential);

        // This is the endpoint that will convert an authorization code obtained
        // via Sign in with Apple into a session in your system
        final signInWithAppleEndpoint = Uri(
          scheme: 'https',
          host: 'flutter-sign-in-with-apple-example.glitch.me',
          path: '/sign_in_with_apple',
          queryParameters: <String, String>{
            'code': credential.authorizationCode,
            if (credential.givenName != null)
              'firstName': credential.givenName!,
            if (credential.familyName != null)
              'lastName': credential.familyName!,
            'useBundleId':
            !kIsWeb && (Platform.isIOS || Platform.isMacOS)
                ? 'true'
                : 'false',
            if (credential.state != null) 'state': credential.state!,
          },
        );

        final session = await http.Client().post(
          signInWithAppleEndpoint,
        );

        // If we got this far, a session based on the Apple ID credential has been created in your system,
        // and you can now set this as the app's session
        // ignore: avoid_print
        print(session);
      },
    );
  }
}



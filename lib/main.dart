import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'html_shim.dart' if (dart.library.html) 'dart:html' show window;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign In With Apple',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Sign In'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SignInWithAppleButton(
          onPressed: () async {
            final credential = await SignInWithApple.getAppleIDCredential(
              scopes: [
                AppleIDAuthorizationScopes.email,
                AppleIDAuthorizationScopes.fullName,
              ],
              webAuthenticationOptions: WebAuthenticationOptions(
                clientId: 'com.sgcomptech.bebluui2',
                redirectUri:
                    // For web your redirect URI needs to be the host of the "current page",
                    // while for Android you will be using the API server that redirects back into your app via a deep link
                    kIsWeb
                        ? Uri.parse('https://${window.location.host}/')
                        : Uri.parse(
                            'https://beblu.sgcomp-tech.com/applesignin'),
              ),
              // Remove these if you have no need for them
              // nonce: 'example-nonce',
              // state: 'example-state',
            );

            // ignore: avoid_print
            print(credential);

            // This is the endpoint that will convert an authorization code obtained
            // via Sign in with Apple into a session in your system
            /*
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
                'useBundleId': !kIsWeb && (Platform.isIOS || Platform.isMacOS)
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
            */
          },
        ),
      ),
    );
  }
}

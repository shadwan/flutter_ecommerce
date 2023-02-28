import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SignInScreen(
      providers: [
        EmailAuthProvider(),
      ],
      footerBuilder: (context, _) {
        return const Padding(
          padding: EdgeInsets.only(top: 16),
          child: Text(
            'By signing in, you agree to our Terms of Service and Privacy Policy',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        );
      },
    );
  }
}

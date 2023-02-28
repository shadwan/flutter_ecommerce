import 'package:ecommerce/app/auth_widget.dart';
import 'package:ecommerce/app/pages/admin/admin_home.dart';
import 'package:ecommerce/app/pages/sign_in_page.dart';
import 'package:ecommerce/app/providers.dart';
import 'package:ecommerce/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blueGrey,
        primary: Colors.amberAccent,
      )),
      home: AuthWidget(
          adminSignedInBuilder: (context) => AdminHome(),
          signedInBuilder: (context) => Scaffold(
                body: Center(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Signed In in"),
                    ElevatedButton(
                      onPressed: () {
                        ref.read(firebaseAuthProvider).signOut();
                      },
                      child: const Text("Sign Out"),
                    )
                  ],
                )),
              ),
          nonSignedInBuilder: (_) => const SignInPage()),
    );
  }
}

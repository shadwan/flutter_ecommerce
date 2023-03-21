import 'package:ecommerce/app/auth_widget.dart';
import 'package:ecommerce/app/pages/admin/admin_home.dart';
import 'package:ecommerce/app/pages/sign_in_page.dart';
import 'package:ecommerce/app/providers.dart';
import 'package:ecommerce/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'app/pages/user/user_home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Stripe.publishableKey =
      "pk_test_51Mo6oBA5wygUbsiY36eayPK5dfHd6Rgl3rw89JISXVKwp6qNIfUii5M6kA1zhm1w2J1aCSXth9FxSWtqBSLcpJt800QOZLXN3J";

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
          adminSignedInBuilder: (context) => const AdminHome(),
          signedInBuilder: (context) => const UserHome(),
          nonSignedInBuilder: (_) => const SignInPage()),
    );
  }
}

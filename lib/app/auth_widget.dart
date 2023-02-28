import 'package:ecommerce/app/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthWidget extends ConsumerWidget {
  final WidgetBuilder nonSignedInBuilder;
  final WidgetBuilder signedInBuilder;
  final WidgetBuilder adminSignedInBuilder;
  const AuthWidget({
    super.key,
    required this.nonSignedInBuilder,
    required this.signedInBuilder,
    required this.adminSignedInBuilder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStateChanges = ref.watch(authStateChangesProvider);
    const adminEmail = 'admin@admin.com';
    return authStateChanges.when(
        data: (user) => user != null
            ? user.email == adminEmail
                ? adminSignedInBuilder(context)
                : signedInBuilder(context)
            : nonSignedInBuilder(context),
        loading: () => const CircularProgressIndicator(),
        error: (_, __) => const Scaffold(
              body: Center(child: Text('Something went wrong!')),
            ));
  }
}

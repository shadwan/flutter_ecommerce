import 'package:ecommerce/app/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserBag extends ConsumerWidget {
  const UserBag({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bagViewModel = ref.watch(bagProvider);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                )),
          ],
        ),
      )),
    );
  }
}

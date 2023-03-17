import 'package:flutter/material.dart';

class UserTopBar extends StatelessWidget {
  final IconButton leadingIconButton;

  const UserTopBar({super.key, required this.leadingIconButton});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      leadingIconButton,
      const Spacer(),
      IconButton(
          onPressed: () {
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => const UserOrders()));
          },
          icon: Icon(Icons.menu)),
      IconButton(
        onPressed: () {
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => const UserBag()));
        },
        icon: Icon(Icons.shopping_cart),
      )
    ]);
  }
}

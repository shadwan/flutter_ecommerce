import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyWidget extends StatelessWidget {
  final String text;
  const EmptyWidget({super.key, this.text = "No data"});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Lottie.asset(
          "/assets/anim/empty.json",
          width: 200,
          repeat: false,
        ),
        Text(text),
      ],
    ));
  }
}

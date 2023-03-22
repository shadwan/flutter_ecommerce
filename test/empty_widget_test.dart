import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Empty widgets renders text correctly', (widgetTester) async {
    const text = 'No products yet';
    await widgetTester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(text),
        ),
      ),
    ));
    final textFinder = find.text(text);
    expect(textFinder, findsOneWidget);
  });
}

import 'package:ecommerce/app/pages/admin/admin_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Navigate to Add product when add is pressed inside Admin Home",
      (widgetTester) async {
    await widgetTester
        .pumpWidget(const ProviderScope(child: MaterialApp(home: AdminHome())));
    final possibleFAB = find.widgetWithIcon(FloatingActionButton, Icons.add);
    expect(possibleFAB, findsOneWidget);
    await widgetTester.tap(possibleFAB);
    await widgetTester.pumpAndSettle();
    expect(find.text("Admin Home"), findsNothing);
    expect(find.text("Upload Image"), findsOneWidget);
  });
}

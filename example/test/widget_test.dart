// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:example/main.dart';
Future<void> loadFonts() async {
  FontLoader fontLoader = FontLoader('Custom');

  fontLoader.addFont(rootBundle.load('assets/fonts/QCF_P001.TTF'));
  await fontLoader.load();
}
void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await loadFonts();
  });
}

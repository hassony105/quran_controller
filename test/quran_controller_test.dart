import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quran_controller/models/models.dart';

import 'package:quran_controller/quran_controller.dart';

void main() {
  test('adds one to input values', () async {
    WidgetsFlutterBinding.ensureInitialized();
    QuranController quranController = QuranController(pageNumber: 1);
    await quranController.initializing();
    expect(quranController.verses.verses?.length, 7);
    // final calculator = Calculator();
    // expect(calculator.addOne(2), 3);
    // expect(calculator.addOne(-7), -6);
    // expect(calculator.addOne(0), 1);
  });
}

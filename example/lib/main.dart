import 'package:example/quran_surah_view.dart';
import 'package:flutter/material.dart';
import 'package:quran_controller/quran_controller.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: QuranSurahView(surahNumber: 1, /*juzNumber: 30,*/),
    ),
  ));
}
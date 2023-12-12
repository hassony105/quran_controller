import 'package:example/quran_surah_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      // body: QuranSearchView(),
      body: QuranSurahView(surahNumber: 2, /*juzNumber: 30,*/),
    ),
  ));
}
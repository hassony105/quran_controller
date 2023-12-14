library quran_controller;

import 'dart:async';
import 'models/models.dart';
import 'services/services.dart';
import 'package:flutter/material.dart' show Text, TextStyle;

/// [_quranController] is a global object from [QuranController] to be used as an instance.
QuranController _quranController = QuranController();

/// [QuranController] the main class for this package, it's contains all properties and methods the user want.
class QuranController {
  /// [instance] an instance of [QuranController] that used to access all properties and methods of this class.
  static QuranController instance = _quranController;

  /// [allVerses] it is the List of [Verse] that contains all verses after [initializing] methods called.
  static List<Verse> allVerses = [];

  /// [surahsDetails] is a List of [Surah] that contains the data that will loaded with [initializing] method.
  List<Surah> surahsDetails = [];

  /// [juzsDetails] is a List of [Juz] that contains the data that will loaded with [initializing] method.
  List<Juz> juzsDetails = [];

  /// [basmalaText] is string that contains the unicode of Basmala word text.
  final String basmalaText = '\u00F3';

  /// [surahText] is string that contains the unicode of "Surah" word text.
  final String surahText = '\u005C';

  /// [borderText] is string that contains the unicode of "Border" text (which is the border around the surah name).
  final String borderText = '\u00F2';

  /// [_searchService] is an object from [SearchService] which is used to make searching in the verses.
  static final SearchService _searchService = SearchService();

  /// [basmalaAndSurahsNameFontsFamily] is string that contains the font family for using it in [TextStyle] of [Text].
  final String basmalaAndSurahsNameFontsFamily =
      FontLoaderService.basmalaAndSurahsNameFontsFamily;

  /// [initializing] is the methods that **** MUST BE **** called before any thing will used from the package.
  /// ***hint***: call it only one time.
  initializing() async {
    await FontLoaderService.loadBasmalaAndSurahsNameFonts();
    if (allVerses.isEmpty) {
      await VersesService.loadVerses();
      allVerses = VersesService.allVerses;
    }
    surahsDetails = VersesService.surahsDetails;
    juzsDetails = VersesService.juzsDetails;
  }

  /// [gettingVersesByPageNumber] is a method that getting a List of [Verse] from the [VersesService] class.
  List<Verse> gettingVersesByPageNumber(int pageNumber) =>
      VersesService.gettingVersesByPageNumber(pageNumber);

  /// [gettingVersesBySurahNumber] is a method that getting [Surah] from the [VersesService] class.
  Surah gettingVersesBySurahNumber(int surahNumber) =>
      VersesService.gettingVersesBySurahNumber(surahNumber);

  /// [gettingVersesByJuzNumber] is a method that getting [Juz] from the [VersesService] class.
  Juz gettingVersesByJuzNumber(int juzNumber) =>
      VersesService.gettingVersesByJuzNumber(juzNumber);

  /// [gettingVerseByVerseKey] is a method that getting specific [Verse] from the [VersesService] class.
  Verse gettingVerseByVerseKey(String key) =>
      VersesService.gettingVerseByVerseKey(key);

  /// [search] is a method that searching in all verses and returns a List of [Verse] using [SearchService] class from [_searchService] object.
  Future<List<Verse>> search(String text) async =>
      await _searchService.search(text);

  /// [getSurahName] is a method that returns a unicode string for a specific [Surah] by it's [surahNumber].
  String getSurahName(int surahNumber) =>
      String.fromCharCode(_getFontRangeForSurahNumber(surahNumber));

  /// [_getFontRangeForSurahNumber] is a method that returns an integer depends on [surahNumber] which will convert into hex.
  int _getFontRangeForSurahNumber(int surahNumber) {
    if (surahNumber == 1) return 91;
    if (surahNumber >= 2 && surahNumber <= 35) return surahNumber + 92;
    if (surahNumber >= 36 && surahNumber <= 47) return surahNumber + 125;
    if (surahNumber >= 48 && surahNumber <= 56) return surahNumber + 126;
    return surahNumber + 127;
  }
}

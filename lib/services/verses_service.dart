import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:quran_controller/quran_controller.dart';
import '/models/models.dart';
import '/services/services.dart';

/// [basmalaVerse] is [Verse] global variable that is have constant value for holding Basmala value to use it whenever.
Verse basmalaVerse = Verse(
    verseNumber: 0,
    textImlaeiSimple: 'بسم الله الرحمن الرحيم',
    words: [
      '\u003B',
      '\u003E',
      '\u003D',
      '\u003C',
    ],
    font: QuranController.instance.basmalaAndSurahsNameFontsFamily);

/// [VersesService] is the most important part in the package.
/// it have many methods and properties
class VersesService {
  /// [allVerses] is static List of [Verse] that will filled with verses when calling initializing method from [QuranController].
  static List<Verse> allVerses = [];

  /// [surahsDetails] is static List of [Surah] that contains the data from json file in the assets.
  static List<Surah> surahsDetails = [];

  /// [juzsDetails] is static List of [Juz] that contains the data from json file in the assets.
  static List<Juz> juzsDetails = [];

  /// [_gettingAllVersesFilteredByPageNumbers] this Future of [VersesByPage] method it's load all verses for specific [pageNumber].
  /// it is custom method that only used in [loadVerses] which is called in [initializing] method from [QuranController] class.
  static Future<VersesByPage> _gettingAllVersesFilteredByPageNumbers(
      int pageNumber) async {
    try {
      List<Verse> verses = [];

      String data = await rootBundle.loadString(
          'packages/quran_controller/assets/verses/$pageNumber.json');
      final body = json.decode(data);
      for (var item in body) {
        verses.add(Verse.fromJson(item));
        if (verses.last.verseNumber == 1 && verses.last.surahNumber != 1) {
          Verse verseWithBasmala = verses.last.copyWithBasmala(basmalaVerse);
          verses.insert(verses.length - 1, verseWithBasmala);
        }
      }
      FontLoaderService fontLoaderService =
          FontLoaderService(pageNumber: pageNumber);
      await fontLoaderService.loadFonts();
      return VersesByPage(verses: verses, font: fontLoaderService.fontFamily);
    } catch (e) {
      rethrow;
    }
  }

  /// [gettingVersesByPageNumber] is a List of [Verse] method it's getting all verses from [allVerses] by specific [pageNumber].
  static List<Verse> gettingVersesByPageNumber(int pageNumber) {
    try {
      List<Verse> verses = [];
      verses.addAll(
          allVerses.where((element) => element.pageNumber == pageNumber));

      return verses;
    } catch (e) {
      rethrow;
    }
  }

  /// [gettingVerseByVerseKey] is a [Verse] method it's getting specific verse from [allVerses] by verse key.
  static Verse gettingVerseByVerseKey(String key) {
    try {
      return allVerses.firstWhere((element) => element.verseKey == key);
    } catch (e) {
      rethrow;
    }
  }

  /// [_getSurahsDetails] is a Future List of [Surah] method it's getting all details from json file and set them in [surahsDetails].
  /// it is custom method that only used in [loadVerses] which is called in [initializing] method from [QuranController] class.
  static Future<List<Surah>> _getSurahsDetails() async {
    try {
      List<Surah> surahs = [];
      String data = await rootBundle
          .loadString('packages/quran_controller/assets/surah/surahs.json');
      final body = json.decode(data);
      for (var item in body) {
        surahs.add(Surah.fromJson(item));
      }
      return surahs;
    } catch (e) {
      rethrow;
    }
  }

  /// [_getJuzsDetails] is a Future List of [Juz] method it's getting all details from json file and set them in [juzsDetails].
  /// it is custom method that only used in [loadVerses] which is called in [initializing] method from [QuranController] class.
  static Future<List<Juz>> _getJuzsDetails() async {
    try {
      List<Juz> juzs = [];

      String data = await rootBundle
          .loadString('packages/quran_controller/assets/surah/juzs.json');
      final body = json.decode(data);
      for (var item in body) {
        juzs.add(Juz.fromJson(item));
      }
      return juzs;
    } catch (e) {
      rethrow;
    }
  }

  /// [gettingVersesBySurahNumber] is a [Surah] method it's getting all verses from [allVerses] by specific [surahNumber].
  static Surah gettingVersesBySurahNumber(int surahNumber) {
    try {
      Surah selectedSurah = surahsDetails[surahNumber - 1];
      selectedSurah.verses = [];
      selectedSurah.verses?.addAll(allVerses.where((element) =>
          element.surahNumber == selectedSurah.surahNumber &&
          element.verseNumber != 0));
      return selectedSurah;
    } catch (e) {
      rethrow;
    }
  }

  /// [gettingVersesByJuzNumber] is a [Juz] method it's getting all verses from [allVerses] by specific [juzNumber].
  static Juz gettingVersesByJuzNumber(int juzNumber) {
    try {
      Juz selectedJuz = juzsDetails[juzNumber - 1];
      selectedJuz.verses = [];
      selectedJuz.verses?.addAll(allVerses
          .where((element) => element.juzNumber == selectedJuz.juzNumber));
      return selectedJuz;
    } catch (e) {
      rethrow;
    }
  }

  /// [loadVerses] is a void Future method that called in [initializing] method in [QuranController] class.
  /// it is responsible on loading all verses of Quran and set them in [allVerses] variable.
  /// furthermore, it loads the details for [surahsDetails] and [juzsDetails].
  static Future<void> loadVerses() async {
    surahsDetails = await _getSurahsDetails();
    juzsDetails = await _getJuzsDetails();

    for (int i = 1; i <= 604; i++) {
      allVerses
          .addAll((await _gettingAllVersesFilteredByPageNumbers(i)).verses);
    }
  }
}

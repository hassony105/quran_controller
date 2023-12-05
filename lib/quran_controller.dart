library quran_controller;

import 'dart:async';

import '../../services/services.dart';
import 'models/models.dart';


class QuranController{
  static List<Verse> allVerses = [];
  List<Surah> surahsDetails = [];
  static const String basmalaText = '\u00F3';
  static const String surahText = '\u005C';
  static const String borderText = '\u00F2';

  static final SearchService _searchService = SearchService();

  static const String basmalaAndSurahsNameFontsFamily = FontLoaderService.basmalaAndSurahsNameFontsFamily;

  QuranController();

  initializing() async {
    await FontLoaderService.loadBasmalaAndSurahsNameFonts();
    if(allVerses.isEmpty) {
      await VersesService.loadVerses();
      allVerses = VersesService.allVerses;
    }
    surahsDetails = VersesService.surahsDetails;
  }

  List<Verse> gettingVersesByPageNumber(int pageNumber) => VersesService.gettingVersesByPageNumber(pageNumber);
  Surah gettingVersesBySurahNumber(int surahNumber) => VersesService.gettingVersesBySurahNumber(surahNumber);
  Juz gettingVersesByJuzNumber(int juzNumber) => VersesService.gettingVersesByJuzNumber(juzNumber);
  Verse gettingVerseByVerseKey(String key) => VersesService.gettingVerseByVerseKey(key);

  Future<List<Verse>> search(String text) async => await _searchService.search(text);

  String getSurahName(int surahNumber)=> String.fromCharCode(_getFontRangeForSurahNumber(surahNumber));


  int _getFontRangeForSurahNumber(int surahNumber){
    if(surahNumber == 1) return 91;
    if(surahNumber>= 2 && surahNumber<= 35) return surahNumber+92;
    if(surahNumber>= 36 && surahNumber<= 47) return surahNumber+125;
    if(surahNumber>= 48 && surahNumber<= 56) return surahNumber+126;
    return surahNumber+127;
  }
}
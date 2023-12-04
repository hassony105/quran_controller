library quran_controller;

import 'dart:async';

import '../../services/services.dart';
import 'models/models.dart';


class QuranController{
  static List<Verse> allVerses = [];
  final int? pageNumber;
  final int? surahNumber;
  final int? juzNumber;
  Surah surah = Surah();
  List<Verse> verses = [];
  Juz juz = Juz();
  List<Surah> surahsDetails = [];
  static const String basmalaText = '\u00F3';
  static const String surahText = '\u005C';
  static const String borderText = '\u00F2';

  static const String basmalaAndSurahsNameFontsFamily = FontLoaderService.basmalaAndSurahsNameFontsFamily;

  QuranController({this.pageNumber, this.surahNumber, this.juzNumber});

  initializing() async {
    await FontLoaderService.loadBasmalaAndSurahsNameFonts();
    if(allVerses.isEmpty) {
      await VersesService.loadVerses();
      allVerses = VersesService.allVerses;
    }
    surahsDetails = await VersesService.getSurahsDetails();
    if(surahNumber != null) {
      surah = (await VersesService.gettingVersesBySurahNumber(surahNumber!));
    }
    if(pageNumber != null){
      verses = (await VersesService.gettingVersesByPageNumber(pageNumber!));
    }
    if(juzNumber != null){
      juz = (await VersesService.gettingVersesByJuzNumber(juzNumber!));
    }
  }

  String getSurahName(int surahNumber)=> String.fromCharCode(_getFontRangeForSurahNumber(surahNumber));


  int _getFontRangeForSurahNumber(int surahNumber){
    if(surahNumber == 1) return 91;
    if(surahNumber>= 2 && surahNumber<= 35) return surahNumber+92;
    if(surahNumber>= 36 && surahNumber<= 47) return surahNumber+125;
    if(surahNumber>= 48 && surahNumber<= 56) return surahNumber+126;
    return surahNumber+127;
  }
}
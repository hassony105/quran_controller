library quran_controller;

import '../../services/services.dart';
import 'models/models.dart';


class QuranController{
  final int? pageNumber;
  final int? surahNumber;
  final int? juzNumber;
  Surah surah = Surah();
  VersesByPage verses = VersesByPage();
  Juz juz = Juz();
  static const String basmalaText = '\u00F3';
  static const String surahText = '\u005C';
  static const String basmalaAndSurahsNameFontsFamily = FontLoaderService.basmalaAndSurahsNameFontsFamily;

  QuranController({this.pageNumber, this.surahNumber, this.juzNumber});

  initializing()async{
    await FontLoaderService.loadBasmalaAndSurahsNameFonts();
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
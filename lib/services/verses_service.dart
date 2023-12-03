import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quran_controller/quran_controller.dart';
import '/models/models.dart';
import '/services/services.dart';
Verse basmalaVerse = Verse(verseNumber: 0, words: [VerseWord(codeV1: '\u003B'),VerseWord(codeV1: '\u003C'),VerseWord(codeV1: '\u003D'),VerseWord(codeV1: '\u003E'),], font: QuranController.basmalaAndSurahsNameFontsFamily);
class VersesService{
  static Future<VersesByPage> gettingVersesByPageNumber(int pageNumber) async {
    try{
      List<Verse> verses = [];

      String data = await rootBundle.loadString('packages/quran_controller/assets/verses/$pageNumber.json');
      final body = json.decode(data);
      for (var item in body) {
        verses.add(Verse.fromJson(item));
        if(verses.last.verseNumber == 1) verses.insert(verses.length-1, basmalaVerse);
      }
      FontLoaderService fontLoaderService = FontLoaderService(pageNumber: pageNumber);
      await fontLoaderService.loadFonts();

      // for (var i = 1; i < verses.length; i++) {
      //   if(verses[i].surahNumber > verses[i-1].surahNumber){
      //     verses.insert(i, basmalaVerse);
      //     i++;
      //   }
      // }
      return VersesByPage(verses: verses, font: fontLoaderService.fontFamily);
    }catch(e){
      rethrow;
    }
  }
  static Future<List<Surah>> getSurahsDetails() async {
    try{
      List<Surah> surahs = [];
      String data = await rootBundle.loadString('packages/quran_controller/assets/surah/surahs.json');
      final body = json.decode(data);
      for (var item in body) {
        surahs.add(Surah.fromJson(item));
      }
      return surahs;
    } catch (e){
      rethrow;
    }
  }
  static Future<Surah> gettingVersesBySurahNumber(int surahNumber) async {
    try{
      List<Surah> surahs = await getSurahsDetails();
      Surah selectedSurah = surahs[surahNumber-1];
      selectedSurah.verses = [];
      for (var i = selectedSurah.startPage; i! <= selectedSurah.endPage!; i++) {
        VersesByPage versesByPage = await gettingVersesByPageNumber(i);
        if(i == selectedSurah.startPage || i == selectedSurah.endPage){
          selectedSurah.verses?.addAll(_filteringVersesBySurahNumber(versesByPage.verses, surahNumber));
        } else {
          selectedSurah.verses?.addAll(versesByPage.verses);
        }
      }
      return selectedSurah;
    }catch(e){
      rethrow;
    }
  }

  static List<Verse> _filteringVersesBySurahNumber(List<Verse> verses, int surahNumber){
    List<Verse> filtered = [];
    for (var i = 0; i < verses.length; i++) {
      if(!(verses[i].verseKey??'').startsWith('$surahNumber')){
        continue;
      }
      filtered.add(verses[i]);
    }
    return filtered;
  }

  static Future<Juz> gettingVersesByJuzNumber(int juzNumber) async {
    try{
      List<Juz> juzs = [];

      String data = await rootBundle.loadString('packages/quran_controller/assets/surah/juzs.json');
      final body = json.decode(data);
      for (var item in body) {
        juzs.add(Juz.fromJson(item));
      }
      Juz selectedJuz = juzs[juzNumber-1];
      selectedJuz;
      for (var i = selectedJuz.startPage; i! <= selectedJuz.endPage!; i++) {
        VersesByPage versesByPage = await gettingVersesByPageNumber(i);
        if(i == selectedJuz.startPage || i == selectedJuz.endPage) versesByPage.verses = versesByPage.verses.where((element) => element.juzNumber == selectedJuz.juzNumber).toList();
        selectedJuz.verses?.addAll(versesByPage.verses);
      }
      return selectedJuz;

    }catch(e){
      rethrow;
    }
  }
}
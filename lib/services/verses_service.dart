import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quran_controller/quran_controller.dart';
import '/models/models.dart';
import '/services/services.dart';
Verse basmalaVerse = Verse(verseNumber: 0, textImlaeiSimple: 'بسم الله الرحمن الرحيم', words: [VerseWord(codeV1: '\u003B'),VerseWord(codeV1: '\u003C'),VerseWord(codeV1: '\u003D'),VerseWord(codeV1: '\u003E'),], font: QuranController.instance.basmalaAndSurahsNameFontsFamily);
class VersesService{
  static List<Verse> allVerses = [];
  static List<Surah> surahsDetails = [];
  static List<Juz> juzsDetails = [];

  static Future<VersesByPage> _gettingAllVersesFilteredByPageNumbers(int pageNumber) async {
    try{
      List<Verse> verses = [];

      String data = await rootBundle.loadString('packages/quran_controller/assets/verses/$pageNumber.json');
      final body = json.decode(data);
      for (var item in body) {
        verses.add(Verse.fromJson(item));
        if(verses.last.verseNumber == 1 && verses.last.surahNumber != 1) verses.insert(verses.length-1, verses.last.copyWithBasmala(basmalaVerse));
      }
      FontLoaderService fontLoaderService = FontLoaderService(pageNumber: pageNumber);
      await fontLoaderService.loadFonts();
      return VersesByPage(verses: verses, font: fontLoaderService.fontFamily);
    }catch(e){
      rethrow;
    }
  }

  static List<Verse> gettingVersesByPageNumber(int pageNumber) {
    try{
      List<Verse> verses = [];
      verses.addAll(allVerses.where((element) => element.pageNumber == pageNumber));

      return verses;
    }catch(e){
      rethrow;
    }
  }
  static Verse gettingVerseByVerseKey(String key) {
    try{
      return allVerses.firstWhere((element) => element.verseKey == key);
    } catch(e){
      rethrow;
    }
  }

  static Future<List<Surah>> _getSurahsDetails() async {
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

  static Future<List<Juz>> _getJuzsDetails() async {
    try{
      List<Juz> juzs = [];

      String data = await rootBundle.loadString('packages/quran_controller/assets/surah/juzs.json');
      final body = json.decode(data);
      for (var item in body) {
        juzs.add(Juz.fromJson(item));
      }
      return juzs;
    } catch (e){
      rethrow;
    }
  }

  static Surah gettingVersesBySurahNumber(int surahNumber) {
    try{
      Surah selectedSurah = surahsDetails[surahNumber-1];
      selectedSurah.verses = [];
      selectedSurah.verses?.addAll(allVerses.where((element) => element.surahNumber == selectedSurah.surahNumber && element.verseNumber != 0));
      return selectedSurah;
    }catch(e){
      rethrow;
    }
  }

  static Juz gettingVersesByJuzNumber(int juzNumber) {
    try{
      Juz selectedJuz = juzsDetails[juzNumber-1];
      selectedJuz.verses = [];
      selectedJuz.verses?.addAll(allVerses.where((element) => element.juzNumber == selectedJuz.juzNumber));
      return selectedJuz;

    }catch(e){
      rethrow;
    }
  }

  static Future<void> loadVerses() async {

    surahsDetails = await _getSurahsDetails();
    juzsDetails = await _getJuzsDetails();

    for (int i=1; i<=604; i++) {
      allVerses.addAll((await _gettingAllVersesFilteredByPageNumbers(i)).verses);
    }
  }
}
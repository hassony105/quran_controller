import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quran_controller/models/surah.dart';
import 'package:quran_controller/services/services.dart';
// import 'package:path_provider/path_provider.dart';

import '../models/verse.dart';

class VersesService{
  // final int pageNumber;

  // VersesService(this.pageNumber);

  static Future<List<Verse>> gettingVersesByPageNumber(int pageNumber) async {
    try{
      List<Verse> verses = [];

      String data = await rootBundle.loadString(/*'C:\\Users\\Phoenix\\StudioProjects\\quran_controller\\assets\\verses\\$pageNumber.json'*/'packages/quran_controller/assets/verses/$pageNumber.json');
      final body = json.decode(data);
      for (var item in body) {
        verses.add(Verse.fromJson(item));
      }
      await FontLoaderService(pageNumber: pageNumber).loadFonts();
      return verses;
    }catch(e){
      rethrow;
    }
  }

  static Future<List<Verse>> gettingVersesBySurahNumber(int surahNumber) async {
    try{
      List<Surah> surahs = [];
      String data = await rootBundle.loadString(/*'C:\\Users\\Phoenix\\StudioProjects\\quran_controller\\assets\\surah\\surah.json'*/'packages/quran_controller/assets/surah/surah.json');
      final body = json.decode(data);
      for (var item in body) {
        surahs.add(Surah.fromJson(item));
      }
      Surah selectedSurah = surahs[surahNumber-1];
      for (var i = selectedSurah.startPage; i! <= selectedSurah.endPage!; i++) {
        selectedSurah.verses = (selectedSurah.verses ?? []) + await gettingVersesByPageNumber(i);
        if(i == selectedSurah.endPage){
          print(i);
        }
      }
      return selectedSurah.verses ?? [];
    }catch(e){
      rethrow;
    }
  }
}
import 'dart:async';

import '../services/services.dart';

import '../models/verse.dart';

class SearchService{
  Timer? timer;
  Future<List<Verse>> search(String text)  async {
    try{
      List<Verse> verses = [];
      if(timer != null) timer!.cancel();
      if(text.trim().isEmpty) return verses;
      timer = Timer(const Duration(milliseconds: 1500), () {
        verses = VersesService.allVerses.where((element) => (element.textImlaeiSimple ?? '').contains(text) && element.verseNumber != 0).toList();
      });
      await Future.delayed(const Duration(milliseconds: 1500));
      return verses;
    } catch (e){
      rethrow;
    }
  }
}
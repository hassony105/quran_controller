import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/verse.dart';

class VersesService{
  final int pageNumber;

  VersesService(this.pageNumber);

  Future<List<Verse>> gettingVerses() async {
    try{
      List<Verse> verses = [];
      String data = await rootBundle.loadString('lib/assets/quran/$pageNumber.json');
      final body = json.decode(data);
      for (var item in body) {
        verses.add(Verse.fromJson(item));
      }
      return verses;
    }catch(e){
      rethrow;
    }
  }
}
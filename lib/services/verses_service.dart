import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/verse.dart';

class VersesService{
  final int pageNumber;

  VersesService(this.pageNumber){
    _gettingVerses();
  }

  late List<Verse> verses;

  void _gettingVerses() async {
    try{
      List<Verse> verses = [];
      String data = await rootBundle.loadString('assets/quran/$pageNumber.json');
      final body = json.decode(data);
      for (var item in body) {
        verses.add(Verse.fromJson(item));
      }
      this.verses = verses;
    }catch(e){
      rethrow;
    }
  }
}
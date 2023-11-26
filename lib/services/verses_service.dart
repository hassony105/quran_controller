import 'dart:convert';

import 'package:flutter/services.dart';
// import 'package:path_provider/path_provider.dart';

import '../models/verse.dart';

class VersesService{
  final int pageNumber;

  VersesService(this.pageNumber);

  Future<List<Verse>> gettingVerses() async {
    try{
      List<Verse> verses = [];

      // var myPackageDir = await getApplicationDocumentsDirectory();
      // var myPackagePath = myPackageDir.path;
      String data = await rootBundle.loadString('packages/quran_controller/assets/quran/$pageNumber.json');
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
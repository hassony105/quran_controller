library quran_controller;

import 'dart:ui';

import '../../models/models.dart';
import '../../services/services.dart';


class QuranController{
  final int? pageNumber;
  final int? surahNumber;
  static String fontFamily = FontLoaderService.fontFamily;
  late List<Verse> verses;

  QuranController({this.pageNumber, this.surahNumber});

  initializing()async{
    if(surahNumber != null) {
      verses = (await VersesService.gettingVersesBySurahNumber(surahNumber!));
    }else if(pageNumber != null){
      verses = (await VersesService.gettingVersesByPageNumber(pageNumber!));
    }else{
      verses = [];
    }
  }
}
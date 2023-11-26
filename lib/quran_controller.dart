library quran_controller;

import 'dart:ui';

import '../../models/models.dart';
import '../../services/services.dart';


class QuranController{
  final int pageNumber;
  static String fontFamily = FontLoaderService.fontFamily;
  late List<Verse> verses;

  QuranController({required this.pageNumber});

  initializing()async{
    await FontLoaderService(pageNumber: pageNumber).loadFonts();
    VersesService versesService = VersesService(pageNumber);
    verses = await versesService.gettingVerses();
  }
}
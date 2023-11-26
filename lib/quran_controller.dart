library quran_controller;

import 'dart:ui';

import '../../models/models.dart';
import '../../services/services.dart';


class QuranController{
  final int pageNumber;
  static String fontFamily = FontLoaderService.fontFamily;
  late List<Verse> verses;

  QuranController({required this.pageNumber}){
    FontLoaderService(pageNumber: pageNumber);
    VersesService versesService = VersesService(pageNumber);
    verses = versesService.verses;
  }
}
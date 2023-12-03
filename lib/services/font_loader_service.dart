import 'package:flutter/services.dart' show FontLoader, rootBundle;
// import 'package:path_provider/path_provider.dart';

class FontLoaderService {
  final int _pageNumber;
  final String fontFamily;
  static const String basmalaAndSurahsNameFontsFamily = 'QCF_BSML.TTF';

  String get _fontNumber {
    String pageNumber = '$_pageNumber'.padLeft(3, '0');
    return pageNumber;
  }

  FontLoaderService({required int pageNumber}) : _pageNumber = pageNumber, fontFamily='QCF_P$pageNumber';

  Future<void> loadFonts() async {
    FontLoader fontLoader = FontLoader(fontFamily);
    fontLoader.addFont(rootBundle.load('packages/quran_controller/assets/fonts/QCF_P$_fontNumber.TTF'));
    await fontLoader.load();
  }

  static Future<void> loadBasmalaAndSurahsNameFonts() async {
    FontLoader fontLoader = FontLoader(basmalaAndSurahsNameFontsFamily);
    fontLoader.addFont(rootBundle.load('packages/quran_controller/assets/fonts/$basmalaAndSurahsNameFontsFamily'));
    await fontLoader.load();
  }

}

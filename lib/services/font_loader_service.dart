import 'package:flutter/services.dart' show FontLoader, ByteData, rootBundle;

class FontLoaderService {
  final int _pageNumber;

  String get _fontNumber {
    String pageNumber = '$_pageNumber'.padLeft(3, '0');
    return pageNumber;
  }

  static String fontFamily = 'QuranCustomFont';

  FontLoaderService({required int pageNumber}) : _pageNumber = pageNumber;

  Future<void> loadFonts() async {
    FontLoader fontLoader = FontLoader(fontFamily);

    fontLoader.addFont(rootBundle.load('lib/assets/fonts/QCF_P$_fontNumber.TTF'));
    await fontLoader.load();
  }

}

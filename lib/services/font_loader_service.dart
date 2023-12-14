import 'package:flutter/services.dart' show FontLoader, rootBundle;

/// [FontLoaderService] is responsible for the process of loading fonts from Assets.
class FontLoaderService {
  /// [_pageNumber] is a variable that contains the value of the Quran page number which the font for this page will loaded from asses.
  final int _pageNumber;

  /// [fontFamily] is a final variable that contains the value of the Quran page number Font which loaded from assets.
  final String fontFamily;

  /// [basmalaAndSurahsNameFontsFamily] is a static const variable that contains the constant value of the Basmala, Border and "Surah" word font family.
  static const String basmalaAndSurahsNameFontsFamily = 'QCF_BSML.TTF';

  /// [_fontNumber] private getter that converting the [_pageNumber] variable into String number and adding zeros, for Example:
  /// ```dart
  /// FontLoaderService fls1 = FontLoaderService(pageNumber: 3); // _fontNumber = '003'
  /// FontLoaderService fls2 = FontLoaderService(pageNumber: 42); // _fontNumber = '042'
  /// ```
  String get _fontNumber {
    String pageNumber = '$_pageNumber'.padLeft(3, '0');
    return pageNumber;
  }

  /// [FontLoaderService] Constructor which takes one required variable [pageNumber].
  FontLoaderService({required int pageNumber})
      : _pageNumber = pageNumber,
        fontFamily = 'QCF_P$pageNumber';

  /// [loadFonts] Future void method that loads font from assets depending on [_fontNumber] variable.
  Future<void> loadFonts() async {
    FontLoader fontLoader = FontLoader(fontFamily);
    fontLoader.addFont(rootBundle
        .load('packages/quran_controller/assets/fonts/QCF_P$_fontNumber.TTF'));
    await fontLoader.load();
  }

  /// [loadBasmalaAndSurahsNameFonts] is static Future void method that loads Basmala & Surahs names font family from the assets.
  /// it depends on [basmalaAndSurahsNameFontsFamily] value.
  static Future<void> loadBasmalaAndSurahsNameFonts() async {
    FontLoader fontLoader = FontLoader(basmalaAndSurahsNameFontsFamily);
    fontLoader.addFont(rootBundle.load(
        'packages/quran_controller/assets/fonts/$basmalaAndSurahsNameFontsFamily'));
    await fontLoader.load();
  }
}

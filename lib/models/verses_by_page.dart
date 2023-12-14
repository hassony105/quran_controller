import '/quran_controller.dart';
import '/services/services.dart';
import '/models/models.dart';

/// [VersesByPage] which is the model class that responsible on all details of Quran Surahs of exact page.
class VersesByPage {
  /// [_verses] a private variable that holding the verses of exact page number without it's fonts.
  List<Verse>? _verses;

  /// [font] is the variable that holding the value of font family of all page's verses.
  String? font;

  /// [verses] the getter that holding the verses of exact page number.
  List<Verse> get verses {
    List<Verse> verses = [];

    for (var item in (_verses ?? <Verse>[])) {
      verses.add(item..font = font);
      if (verses.last.fullVerse == basmalaVerse.fullVerse) {
        verses.last.font =
            QuranController.instance.basmalaAndSurahsNameFontsFamily;
      }
    }

    return verses;
  }

  /// [verses] the setter that settings the verses of exact page number into [_verses] variable.
  set verses(List<Verse> value) {
    _verses = value;
  }

  /// the main constructor of [VersesByPage] class.
  VersesByPage({List<Verse>? verses, this.font}) : _verses = verses;

  /// [VersesByPage.fromJson] is a named constructor that convert a [Map] into [VersesByPage] class object.
  VersesByPage.fromJson(Map<String, dynamic> data) {
    _verses = data['verses'];
    font = data['font'];
  }

  /// [toJson] is a method that convert all variables of [VersesByPage] class into a [Map].
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};

    data['verses'] = _verses?.map((e) => e.toJson());
    data['font'] = font;

    return data;
  }
}

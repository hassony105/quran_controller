import 'models.dart';

/// [Surah] which is the model class that responsible on all details of Quran Surahs.
class Surah {
  /// [surahNumber] the variable that holding the number of surah.
  int? surahNumber;

  /// [surahName] the variable that holding the name of exact surah.
  String? surahName;

  /// [startPage] the variable that holding the number of page that the exact surah starts with.
  int? startPage;

  /// [endPage] the variable that holding the number of page that the exact surah ends with.
  int? endPage;

  /// [verses] the variable that holding the verses of exact surah.
  List<Verse>? verses;

  /// [versesCount] the variable that holding the number of verses that the exact surah contains.
  int? versesCount;

  /// the main constructor of [Surah] class.
  Surah({
    this.surahNumber,
    this.surahName,
    this.startPage,
    this.endPage,
    this.verses,
    this.versesCount,
  });

  /// [Surah.fromJson] is a named constructor that convert a [Map] into [Surah] class object.
  Surah.fromJson(Map<String, dynamic> data) {
    surahNumber = data['surahNumber'];
    surahName = data['surahName'];
    startPage = data['startPage'];
    endPage = data['endPage'];
    versesCount = data['versesCount'];
    verses = data['verses'] != null
        ? [for (var item in data['verses']) Verse.fromJson(item)]
        : [];
  }

  /// [toJson] is a method that convert all variables of [Surah] class into a [Map].
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};

    data['surahNumber'] = surahNumber;
    data['surahName'] = surahName;
    data['startPage'] = startPage;
    data['endPage'] = endPage;
    data['versesCount'] = versesCount;
    data['verses'] = verses?.map((e) => e.toJson()).toList();

    return data;
  }
}

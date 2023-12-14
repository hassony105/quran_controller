import 'models.dart';

/// [Juz] which is the model class that responsible on all details of Quran Juzs.
class Juz {
  /// [juzNumber] the variable that holding the number of juz.
  int? juzNumber;

  /// [verses] the variable that holding the verses of exact juz.
  List<Verse>? verses;

  /// [startKey] the variable that holding the start key of exact juz.
  /// for example: '1:1', '2:142', etc.
  String? startKey;

  /// [endKey] the variable that holding the end key of exact juz.
  /// for example: '2:141', '2:252', etc.
  String? endKey;

  /// [startPage] the variable that holding the number of page that the exact juz starts with.
  int? startPage;

  /// [endPage] the variable that holding the number of page that the exact juz ends with.
  int? endPage;

  /// [startSurah] a getter that separates the [startKey] and takes surah number part.
  int get startSurah => int.parse(startKey?.split(':').first ?? '0');

  /// [startVerse] a getter that separates the [startKey] and takes verse number part.
  int get startVerse => int.parse(startKey?.split(':').last ?? '0');

  /// [endSurah] a getter that separates the [endKey] and takes surah number part.
  int get endSurah => int.parse(endKey?.split(':').first ?? '0');

  /// [endVerse] a getter that separates the [endKey] and takes verse number part.
  int get endVerse => int.parse(endKey?.split(':').last ?? '0');

  /// the main constructor of [Juz] class.
  Juz(
      {this.juzNumber,
      this.verses,
      this.startKey,
      this.endKey,
      this.startPage,
      this.endPage});

  /// [Juz.fromJson] is a named constructor that convert a [Map] into [Juz] class object.
  Juz.fromJson(Map<String, dynamic> data) {
    juzNumber = data['juzNumber'];
    verses = data['verses'] != null
        ? [for (var verse in data['verses']) Verse.fromJson(verse)]
        : [];
    startKey = data['startKey'];
    endKey = data['endKey'];
    startPage = data['startPage'];
    endPage = data['endPage'];
  }

  /// [toJson] is a method that convert all variables of [Juz] class into a [Map].
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};

    data['juzNumber'] = juzNumber;
    if (verses != null && verses!.isNotEmpty) {
      data['verses'] = verses!.map((e) => e.toJson()).toList();
    }
    data['startKey'] = startKey;
    data['endKey'] = endKey;
    data['startPage'] = startPage;
    data['endPage'] = endPage;

    return data;
  }
}

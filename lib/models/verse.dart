/// [Verse] which is the model class that responsible on all details of Quran verses.
class Verse {
  /// [verseNumber] the variable that holding the number of verse.
  int? verseNumber;

  /// [verseKey] the variable that holding the key of exact verse.
  /// for example: '1:1', '2:142', etc.
  String? verseKey;

  /// [textImlaeiSimple] the variable that holding the simple text of verse.
  /// for example: 'الحمد لله رب العالمين'.
  String? textImlaeiSimple;

  /// [pageNumber] the variable that holding the number of page that the exact verse starts and ends with.
  int? pageNumber;

  /// [juzNumber] the variable that holding the number of juz that the exact verse is with.
  int? juzNumber;

  /// [words] the variable that holding all the unicodes of verse separated as a [List].
  List<String>? words;

  /// [font] is the variable that holding the value of font family of the exact verse.
  String? font;

  /// [fullVerse] is a getter that joins the characters of [words] as [String].
  String? get fullVerse => words!.join(' ');

  /// [surahNumber] is a getter that extract the surah number from [verseKey].
  int get surahNumber => int.parse((verseKey ?? '0').split(':').first);

  /// the main constructor of [Verse] class.
  Verse(
      {this.verseNumber,
      this.verseKey,
      this.textImlaeiSimple,
      this.pageNumber,
      this.juzNumber,
      this.words,
      this.font});

  /// [Verse.fromJson] is a named constructor that convert a [Map] into [Verse] class object.
  Verse.fromJson(Map<String, dynamic> data) {
    verseNumber = data['verse_number'];
    verseKey = data['verse_key'];
    textImlaeiSimple = data['text_imlaei_simple'];
    pageNumber = data['page_number'];
    juzNumber = data['juz_number'];
    font = data['font'];
    if (data['words'] != null) words = [for (var w in data['words']) '$w'];
  }

  /// [toJson] is a method that convert all variables of [Verse] class into a [Map].
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['verse_number'] = verseNumber;
    data['verse_key'] = verseKey;
    data['text_imlaei_simple'] = textImlaeiSimple;
    data['page_number'] = pageNumber;
    data['juz_number'] = juzNumber;
    data['font'] = font;
    if (words != null) data['words'] = words!;
    return data;
  }

  /// [copyWith] is a method that replace the old values with the new values.
  Verse copyWith(
      {int? verseNumber,
      String? verseKey,
      String? textImlaeiSimple,
      int? pageNumber,
      int? juzNumber,
      List<String>? words,
      String? font}) {
    return Verse(
      verseNumber: verseNumber ?? this.verseNumber,
      verseKey: verseKey ?? this.verseKey,
      textImlaeiSimple: textImlaeiSimple ?? this.textImlaeiSimple,
      pageNumber: pageNumber ?? this.pageNumber,
      juzNumber: juzNumber ?? this.juzNumber,
      words: words ?? this.words,
      font: font ?? this.font,
    );
  }

  /// [copyWithBasmala] is a method that replace the verse with the Basmala verse.
  Verse copyWithBasmala(Verse basmalaVerse) {
    Verse verse = Verse();
    verse = verse.copyWith(
      verseNumber: basmalaVerse.verseNumber,
      verseKey: (verseKey!.split(':')..last = '0').join(':'),
      textImlaeiSimple: basmalaVerse.textImlaeiSimple,
      pageNumber: pageNumber,
      juzNumber: juzNumber,
      words: basmalaVerse.words,
      font: basmalaVerse.font,
    );
    return verse;
  }
}

class Verse {
  int? verseNumber;
  String? verseKey;
  String? textImlaeiSimple;
  int? pageNumber;
  int? juzNumber;
  List<String>? words;
  String? font;
  String? get fullVerse => words!.join(' ');
  int get surahNumber => int.parse((verseKey??'0').split(':').first);

  Verse({this.verseNumber, this.verseKey, this.textImlaeiSimple, this.pageNumber, this.juzNumber, this.words, this.font});

  Verse.fromJson(Map<String, dynamic> data) {
    verseNumber = data['verse_number'];
    verseKey = data['verse_key'];
    textImlaeiSimple = data['text_imlaei_simple'];
    pageNumber = data['page_number'];
    juzNumber = data['juz_number'];
    font = data['font'];
    if (data['words'] != null) words = data['words'].map((e)=>'$e').toList();
  }

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

  Verse copyWith({int? id, int? verseNumber, String? verseKey, int? hizbNumber, int? rubElHizbNumber, int? rukuNumber, int? manzilNumber, int? sajdahNumber, String? textImlaeiSimple, int? pageNumber, int? juzNumber, List<String>? words, String? font}) {
    return Verse(
      verseNumber: verseNumber?? this.verseNumber,
      verseKey: verseKey?? this.verseKey,
      textImlaeiSimple: textImlaeiSimple?? this.textImlaeiSimple,
      pageNumber: pageNumber?? this.pageNumber,
      juzNumber: juzNumber?? this.juzNumber,
      words: words?? this.words,
      font: font?? this.font,
    );
  }

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

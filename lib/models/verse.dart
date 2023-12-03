import '/models/models.dart';

class Verse {
  int? id;
  int? verseNumber;
  String? verseKey;
  int? hizbNumber;
  int? rubElHizbNumber;
  int? rukuNumber;
  int? manzilNumber;
  int? sajdahNumber;
  String? textImlaeiSimple;
  int? pageNumber;
  int? juzNumber;
  List<VerseWord>? words;
  String? font;
  String? get fullVerse => words!.map((e) => e.codeV1).join(' ');
  int get surahNumber => int.parse((verseKey??'0').split(':').first);

  Verse({this.id, this.verseNumber, this.verseKey, this.hizbNumber, this.rubElHizbNumber, this.rukuNumber, this.manzilNumber, this.sajdahNumber, this.textImlaeiSimple, this.pageNumber, this.juzNumber, this.words, this.font});

  Verse.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    verseNumber = data['verse_number'];
    verseKey = data['verse_key'];
    hizbNumber = data['hizb_number'];
    rubElHizbNumber = data['rub_el_hizb_number'];
    rukuNumber = data['ruku_number'];
    manzilNumber = data['manzil_number'];
    sajdahNumber = data['sajdah_number'];
    textImlaeiSimple = data['text_imlaei_simple'];
    pageNumber = data['page_number'];
    juzNumber = data['juz_number'];
    font = data['font'];
    if (data['words'] != null) {
      words = [];
      data['words'].forEach((v) {
        words!.add(VerseWord.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['verse_number'] = verseNumber;
    data['verse_key'] = verseKey;
    data['hizb_number'] = hizbNumber;
    data['rub_el_hizb_number'] = rubElHizbNumber;
    data['ruku_number'] = rukuNumber;
    data['manzil_number'] = manzilNumber;
    data['sajdah_number'] = sajdahNumber;
    data['text_imlaei_simple'] = textImlaeiSimple;
    data['page_number'] = pageNumber;
    data['juz_number'] = juzNumber;
    data['font'] = font;
    if (words != null) {
      data['words'] = words!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

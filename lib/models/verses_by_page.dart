import 'package:quran_controller/quran_controller.dart';
import 'package:quran_controller/services/services.dart';

import '/models/models.dart';

class VersesByPage{
  List<Verse>? _verses;
  String? font;


  List<Verse> get verses {
    List<Verse> verses = [];

    for (var item in (_verses??<Verse>[])) {
      verses.add(item..font = font);
      if(verses.last.fullVerse == basmalaVerse.fullVerse) verses.last.font = QuranController.basmalaAndSurahsNameFontsFamily;
    }

    return verses;
  }


  set verses(List<Verse> value) {
    _verses = value;
  }

  VersesByPage({List<Verse>? verses, this.font}):_verses = verses;

  VersesByPage.fromJson(Map<String, dynamic> data){
    _verses = data['verses'];
    font = data['font'];
  }

  Map<String, dynamic> toJson(){
    Map<String, dynamic> data = {};

    data['verses'] = _verses?.map((e) => e.toJson());
    data['font'] = font;

    return data;
  }
}
import 'models.dart';

class Surah{
  int? versesCount;
  String? surahName;
  String? revelationPlace;
  int? startPage;
  int? endPage;
  List<Verse>? verses;

  Surah({this.versesCount, this.surahName, this.revelationPlace, this.startPage, this.endPage, this.verses});

  Surah.fromJson(Map<String, dynamic> data){
    versesCount = data['versesCount'];
    surahName = data['surahName'];
    revelationPlace = data['revelationPlace'];
    startPage = data['startPage'];
    endPage = data['endPage'];
    verses = data['verses'].map((e)=> Verse.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson(){
    Map<String, dynamic> data = {};

    data['versesCount'] = versesCount;
    data['surahName'] = surahName;
    data['revelationPlace'] = revelationPlace;
    data['startPage'] = startPage;
    data['endPage'] = endPage;
    data['verses'] = verses?.map((e) => e.toJson()).toList();

    return data;
  }

}
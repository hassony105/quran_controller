import 'models.dart';

class Surah{
  int? surahNumber;
  int? versesCount;
  String? surahName;
  String? revelationPlace;
  int? startPage;
  int? endPage;
  List<Verse>? verses;

  Surah({this.surahNumber, this.versesCount, this.surahName, this.revelationPlace, this.startPage, this.endPage, this.verses});

  Surah.fromJson(Map<String, dynamic> data){
    surahNumber = data['surahNumber'];
    versesCount = data['versesCount'];
    surahName = data['surahName'];
    revelationPlace = data['revelationPlace'];
    startPage = data['startPage'];
    endPage = data['endPage'];
    verses = data['verses'] != null?[for(var item in data['verses']) Verse.fromJson(item)]:[];
  }

  Map<String, dynamic> toJson(){
    Map<String, dynamic> data = {};

    data['surahNumber'] = surahNumber;
    data['versesCount'] = versesCount;
    data['surahName'] = surahName;
    data['revelationPlace'] = revelationPlace;
    data['startPage'] = startPage;
    data['endPage'] = endPage;
    data['verse'] = verses?.map((e) => e.toJson()).toList();

    return data;
  }

}
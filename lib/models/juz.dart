import 'models.dart';

class Juz{
  int? juzNumber;
  List<Verse>? verses;
  String? startKey;
  String? endKey;
  int? startPage;
  int? endPage;

  Juz({this.juzNumber, this.verses, this.startKey, this.endKey, this.startPage, this.endPage});

  Juz.fromJson(Map<String, dynamic> data){
    juzNumber = data['juzNumber'];
    verses = data['verses'] != null? [for(var verse in data['verses']) Verse.fromJson(verse)] : [];
    startKey = data['startKey'];
    endKey = data['endKey'];
    startPage = data['startPage'];
    endPage = data['endPage'];
  }

  Map<String, dynamic> toJson(){
    Map<String, dynamic> data = {};

    data['juzNumber'] = juzNumber;
    if(verses != null && verses!.isNotEmpty) data['verses'] = verses!.map((e) => e.toJson()).toList();
    data['startKey'] = startKey;
    data['endKey'] = endKey;
    data['startPage'] = startPage;
    data['endPage'] = endPage;

    return data;
  }

}
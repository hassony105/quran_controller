import 'dart:convert';
import 'dart:io';

// import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quran_controller/models/models.dart';
// import 'package:quran_controller/quran_controller.dart';
// import 'package:quran_controller/services/font_loader_service.dart' show FontLoaderService;

Map<String, Map<String, int>> data = {};
int counter = 0;
void main() async {
  // for (var i = 1; i <= 604; i++) {
  //   await generator(i);
  // }
  String filePath = 'C:\\Users\\Phoenix\\StudioProjects\\quran_controller\\assets\\surah\\pages.json';
  print(data);
  Map<String, Map<String, dynamic>> data1 = {};
  Map<String, Map<String, dynamic>> data2 = {};
  // File(filePath).writeAsString(json.encode(data), mode: FileMode.write).then((File file) {
  await File(filePath).readAsString().then((String value) {
    Map<String, dynamic> values = json.decode(value);
    for (var item in values.keys) {
      data1.addAll({item: json.decode(value)[item]});
    }
    // print('read: $data1');
  }).catchError((error) {
    print('Error: $error');
  });
  await File('C:\\Users\\Phoenix\\StudioProjects\\quran_controller\\assets\\surah\\surahs.json').readAsString().then((String value) {
    Map<String, dynamic> values = json.decode(value);
    for (var item in values.keys) {
      data2.addAll({item: json.decode(value)[item]});
    }
    // print('read: $data2');
  }).catchError((error) {
    print('Error: $error');
  });
// print('data1: ${data1["1"]}');
  Map<String, Map<String, dynamic>> data3 = {};
  for (var i = 1; i <= data2.length; i++) {
    data3.addAll({"$i": {...?data1["$i"], ...?data2["$i"]}});
  }
  print(data3);
  await File('C:\\Users\\Phoenix\\StudioProjects\\quran_controller\\assets\\surah\\surahs.json').writeAsString(json.encode(data3), mode: FileMode.write).then((File file) {
  // await File(filePath).readAsString().then((String value) {
    print('added');
  }).catchError((error) {
    print('Error: $error');
  });
  // FontLoaderService fontLoaderService = FontLoaderService(pageNumber: 1);
  // await fontLoaderService.loadFonts().onError((error, stackTrace) => print('${error.toString()} \n+\n ${stackTrace.toString()}'));
  // runApp(const MaterialApp(home: Center()));
}

Future<void> generator(int index) async{

  http.Response res = await http.get(Uri.parse('https://api.qurancdn.com/api/qdc/verses/by_page/$index?words=true&per_page=all&fields=hizb_number,text_imlaei_simple&reciter=7&word_fields=verse_key,verse_id,page_number,location,code_v1&mushaf=2&filter_page_words=true'));
  String body = res.body;
  var jsonBody = json.decode(body);
  print(index);
  for (var item in jsonBody['verses']) {
    String surah = (item['verse_key'] as String).split(':').first;
    if(data[surah] == null || data[surah]!.isEmpty) data.addAll({surah: {}});
    data[surah]!["end"] = index;
    if(data.length > counter) {
      // String firstVerse = ((jsonBody['verses'] as List<Map<String, dynamic>>).first['verse_key'] as String).split(':').first;
      // if(data.values.last['end'] == int.parse(firstVerse)){
      //
      // }
      data[surah]!["start"] = index;
      counter++;
    }
  }
  // int start = body.indexOf('{"props"');
  // int end = body.indexOf('</script></body></html>');
  //
  // List<Verse> verses = [];
  // for (var item in json.decode(body)['verses']) {
  //   verses.add(Verse.fromJson(item));
  // }
  // print(verses.map((e) => json.encode(e.toJson())).toList());

}
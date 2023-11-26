import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:quran_controller/models/models.dart';
import 'package:quran_controller/quran_controller.dart';

void main() async {
  // for (var i = 1; i <= 604; i++) {
  //   await generator(i);
  // }

  QuranController quranController = QuranController(pageNumber: 1);
  print(quranController.verses.map((e) => e.toJson()).toList());
}

Future<void> generator(int index) async{

  http.Response res = await http.get(Uri.parse('https://api.qurancdn.com/api/qdc/verses/by_page/$index?words=true&per_page=all&fields=hizb_number,text_imlaei_simple&reciter=7&word_fields=verse_key,verse_id,page_number,location,code_v1&mushaf=2&filter_page_words=true'));
  String body = res.body;
  // int start = body.indexOf('{"props"');
  // int end = body.indexOf('</script></body></html>');
  //
  List<Verse> verses = [];
  for (var item in json.decode(body)['verses']) {
    verses.add(Verse.fromJson(item));
  }
  // print(verses.map((e) => json.encode(e.toJson())).toList());

  String filePath = 'C:\\Users\\Phoenix\\StudioProjects\\quran_controller\\assets\\quran\\$index.json';
  File(filePath).writeAsString(verses.map((e) => json.encode(e.toJson())).toList().toString(), mode: FileMode.write).then((File file) {
    print('JSON file $index created and data written successfully!');
  }).catchError((error) {
    print('Error: $error');
  });
}
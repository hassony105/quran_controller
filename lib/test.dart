import 'dart:convert';
import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:quran_controller/models/models.dart';
// import 'package:quran_controller/quran_controller.dart';
// import 'package:quran_controller/services/font_loader_service.dart' show FontLoaderService;

Map<String, Map<String, int>> data = {};
int counter = 0;
void main() async {
  await generator(0);
  // for (var i = 1; i <= 3; i++) {
  //   await generator(i);
  // }
//   String filePath = 'C:\\Users\\Phoenix\\StudioProjects\\quran_controller\\assets\\verses\\juzs.json';
//   print(data);
//   Map<String, Map<String, dynamic>> data1 = {};
//   Map<String, Map<String, dynamic>> data2 = {};
//   // File(filePath).writeAsString(json.encode(data), mode: FileMode.write).then((File file) {
//   await File(filePath).readAsString().then((String value) {
//     Map<String, dynamic> values = json.decode(value);
//     for (var item in values.keys) {
//       data1.addAll({item: json.decode(value)[item]});
//     }
//     // print('read: $data1');
//   }).catchError((error) {
//     print('Error: $error');
//   });
//   await File('C:\\Users\\Phoenix\\StudioProjects\\quran_controller\\assets\\surah\\surahs.json').readAsString().then((String value) {
//     Map<String, dynamic> values = json.decode(value);
//     for (var item in values.keys) {
//       data2.addAll({item: json.decode(value)[item]});
//     }
//     // print('read: $data2');
//   }).catchError((error) {
//     print('Error: $error');
//   });
// // print('data1: ${data1["1"]}');
//   Map<String, Map<String, dynamic>> data3 = {};
//   for (var i = 1; i <= data2.length; i++) {
//     data3.addAll({"$i": {...?data1["$i"], ...?data2["$i"]}});
//   }
//   print(data3);
//   await File('C:\\Users\\Phoenix\\StudioProjects\\quran_controller\\assets\\surah\\surahs.json').writeAsString(json.encode(data3), mode: FileMode.write).then((File file) {
//   // await File(filePath).readAsString().then((String value) {
//     print('added');
//   }).catchError((error) {
//     print('Error: $error');
//   });
  // FontLoaderService fontLoaderService = FontLoaderService(pageNumber: 1);
  // await fontLoaderService.loadFonts().onError((error, stackTrace) => print('${error.toString()} \n+\n ${stackTrace.toString()}'));
  // runApp(const MaterialApp(home: Center()));
}

Future<void> generator(int index) async{

  String filePath = 'C:\\Users\\Phoenix\\StudioProjects\\quran_controller\\assets\\surah\\surahs.json';

  List<Map<String, dynamic>> data = [];
  await File(filePath).readAsString().then((String value) {
    Map<String, dynamic> values = json.decode(value);
    data = values.entries.map((entry) {
      final surahNumber = int.parse(entry.key);
      final Map<String, dynamic> surahData = Map<String, dynamic>.from(entry.value);
      surahData['surahNumber'] = surahNumber;
      return surahData;
    }).toList();
    print('read: $data');
  }).catchError((error) {
    print('Error: $error');
  });

  await File(filePath).writeAsString(json.encode(data), mode: FileMode.write).then((File file) {
    print('added');
  }).catchError((error) {
    print('Error: $error');
  });

  // var jsonBody = json.decode(body);
  // print(index);
  // for (var item in jsonBody['verses']) {
  //   String surah = (item['verse_key'] as String).split(':').first;
  //   if(data[surah] == null || data[surah]!.isEmpty) data.addAll({surah: {}});
  //   data[surah]!["end"] = index;
  //   if(data.length > counter) {
      // String firstVerse = ((jsonBody['verses'] as List<Map<String, dynamic>>).first['verse_key'] as String).split(':').first;
      // if(data.values.last['end'] == int.parse(firstVerse)){
      //
      // }
      // data[surah]!["start"] = index;
      // counter++;
    // }
  // }
  // int start = body.indexOf('{"props"');
  // int end = body.indexOf('</script></body></html>');
  //
  // List<Verse> verses = [];
  // for (var item in json.decode(body)['verses']) {
  //   verses.add(Verse.fromJson(item));
  // }
  // print(verses.map((e) => json.encode(e.toJson())).toList());

}

void convertor() {
  final inputJson = {
    "1": {
      "endPage": 1,
      "startPage": 1,
      "revelationPlace": "makkah",
      "surahName": "الفاتحة",
      "versesCount": 7
    },
    "2": {
      "endPage": 49,
      "startPage": 2,
      "revelationPlace": "madinah",
      "surahName": "البقرة",
      "versesCount": 286
    },
    "3": {
      "endPage": 76,
      "startPage": 50,
      "revelationPlace": "madinah",
      "surahName": "آل عمران",
      "versesCount": 200,
      "translatedName": "آل عمران"
    },
    "4": {
      "endPage": 106,
      "startPage": 77,
      "revelationPlace": "madinah",
      "surahName": "النساء",
      "versesCount": 176,
      "translatedName": "النساء"
    },
    "5": {
      "endPage": 127,
      "startPage": 106,
      "revelationPlace": "madinah",
      "surahName": "المائدة",
      "versesCount": 120,
      "translatedName": "المائدة"
    },
    "6": {
      "endPage": 150,
      "startPage": 128,
      "revelationPlace": "makkah",
      "surahName": "الأنعام",
      "versesCount": 165,
      "translatedName": "الأنعام"
    },
    "7": {
      "endPage": 176,
      "startPage": 151,
      "revelationPlace": "makkah",
      "surahName": "الأعراف",
      "versesCount": 206,
      "translatedName": "الأعراف"
    },
    "8": {
      "endPage": 186,
      "startPage": 177,
      "revelationPlace": "madinah",
      "surahName": "الأنفال",
      "versesCount": 75,
      "translatedName": "الأنفال"
    },
    "9": {
      "endPage": 207,
      "startPage": 187,
      "revelationPlace": "madinah",
      "surahName": "التوبة",
      "versesCount": 129
    },
    "10": {
      "endPage": 221,
      "startPage": 208,
      "revelationPlace": "makkah",
      "surahName": "يونس",
      "versesCount": 109
    },
    "11": {
      "endPage": 235,
      "startPage": 221,
      "revelationPlace": "makkah",
      "surahName": "هود",
      "versesCount": 123
    },
    "12": {
      "endPage": 248,
      "startPage": 235,
      "revelationPlace": "makkah",
      "surahName": "يوسف",
      "versesCount": 111
    },
    "13": {
      "endPage": 255,
      "startPage": 249,
      "revelationPlace": "madinah",
      "surahName": "الرعد",
      "versesCount": 43
    },
    "14": {
      "endPage": 261,
      "startPage": 255,
      "revelationPlace": "makkah",
      "surahName": "ابراهيم",
      "versesCount": 52
    },
    "15": {
      "endPage": 267,
      "startPage": 262,
      "revelationPlace": "makkah",
      "surahName": "الحجر",
      "versesCount": 99
    },
    "16": {
      "endPage": 281,
      "startPage": 267,
      "revelationPlace": "makkah",
      "surahName": "النحل",
      "versesCount": 128
    },
    "17": {
      "endPage": 293,
      "startPage": 282,
      "revelationPlace": "makkah",
      "surahName": "الإسراء",
      "versesCount": 111,
      "translatedName": "الإسراء"
    },
    "18": {
      "endPage": 304,
      "startPage": 293,
      "revelationPlace": "makkah",
      "surahName": "الكهف",
      "versesCount": 110
    },
    "19": {
      "endPage": 312,
      "startPage": 305,
      "revelationPlace": "makkah",
      "surahName": "مريم",
      "versesCount": 98
    },
    "20": {
      "endPage": 321,
      "startPage": 312,
      "revelationPlace": "makkah",
      "surahName": "طه",
      "versesCount": 135
    },
    "21": {
      "endPage": 331,
      "startPage": 322,
      "revelationPlace": "makkah",
      "surahName": "الأنبياء",
      "versesCount": 112,
      "translatedName": "الأنبياء"
    },
    "22": {
      "endPage": 341,
      "startPage": 332,
      "revelationPlace": "madinah",
      "surahName": "الحج",
      "versesCount": 78
    },
    "23": {
      "endPage": 349,
      "startPage": 342,
      "revelationPlace": "makkah",
      "surahName": "المؤمنون",
      "versesCount": 118,
      "translatedName": "المؤمنون"
    },
    "24": {
      "endPage": 359,
      "startPage": 350,
      "revelationPlace": "madinah",
      "surahName": "النور",
      "versesCount": 64
    },
    "25": {
      "endPage": 366,
      "startPage": 359,
      "revelationPlace": "makkah",
      "surahName": "الفرقان",
      "versesCount": 77
    },
    "26": {
      "endPage": 376,
      "startPage": 367,
      "revelationPlace": "makkah",
      "surahName": "الشعراء",
      "versesCount": 227,
      "translatedName": "الشعراء"
    },
    "27": {
      "endPage": 385,
      "startPage": 377,
      "revelationPlace": "makkah",
      "surahName": "النمل",
      "versesCount": 93
    },
    "28": {
      "endPage": 396,
      "startPage": 385,
      "revelationPlace": "makkah",
      "surahName": "القصص",
      "versesCount": 88
    },
    "29": {
      "endPage": 404,
      "startPage": 396,
      "revelationPlace": "makkah",
      "surahName": "العنكبوت",
      "versesCount": 69
    },
    "30": {
      "endPage": 410,
      "startPage": 404,
      "revelationPlace": "makkah",
      "surahName": "الروم",
      "versesCount": 60
    },
    "31": {
      "endPage": 414,
      "startPage": 411,
      "revelationPlace": "makkah",
      "surahName": "لقمان",
      "versesCount": 34
    },
    "32": {
      "endPage": 417,
      "startPage": 415,
      "revelationPlace": "makkah",
      "surahName": "السجدة",
      "versesCount": 30
    },
    "33": {
      "endPage": 427,
      "startPage": 418,
      "revelationPlace": "madinah",
      "surahName": "الأحزاب",
      "versesCount": 73,
      "translatedName": "الأحزاب"
    },
    "34": {
      "endPage": 434,
      "startPage": 428,
      "revelationPlace": "makkah",
      "surahName": "سبإ",
      "versesCount": 54,
      "translatedName": "سبإ"
    },
    "35": {
      "endPage": 440,
      "startPage": 434,
      "revelationPlace": "makkah",
      "surahName": "فاطر",
      "versesCount": 45
    },
    "36": {
      "endPage": 445,
      "startPage": 440,
      "revelationPlace": "makkah",
      "surahName": "يس",
      "versesCount": 83
    },
    "37": {
      "endPage": 452,
      "startPage": 446,
      "revelationPlace": "makkah",
      "surahName": "الصافات",
      "versesCount": 182
    },
    "38": {
      "endPage": 458,
      "startPage": 453,
      "revelationPlace": "makkah",
      "surahName": "ص",
      "versesCount": 88
    },
    "39": {
      "endPage": 467,
      "startPage": 458,
      "revelationPlace": "makkah",
      "surahName": "الزمر",
      "versesCount": 75
    },
    "40": {
      "endPage": 476,
      "startPage": 467,
      "revelationPlace": "makkah",
      "surahName": "غافر",
      "versesCount": 85
    },
    "41": {
      "endPage": 482,
      "startPage": 477,
      "revelationPlace": "makkah",
      "surahName": "فصلت",
      "versesCount": 54
    },
    "42": {
      "endPage": 489,
      "startPage": 483,
      "revelationPlace": "makkah",
      "surahName": "الشورى",
      "versesCount": 53
    },
    "43": {
      "endPage": 495,
      "startPage": 489,
      "revelationPlace": "makkah",
      "surahName": "الزخرف",
      "versesCount": 89
    },
    "44": {
      "endPage": 498,
      "startPage": 496,
      "revelationPlace": "makkah",
      "surahName": "الدخان",
      "versesCount": 59
    },
    "45": {
      "endPage": 502,
      "startPage": 499,
      "revelationPlace": "makkah",
      "surahName": "الجاثية",
      "versesCount": 37
    },
    "46": {
      "endPage": 506,
      "startPage": 502,
      "revelationPlace": "makkah",
      "surahName": "الأحقاف",
      "versesCount": 35,
      "translatedName": "الأحقاف"
    },
    "47": {
      "endPage": 510,
      "startPage": 507,
      "revelationPlace": "madinah",
      "surahName": "محمد",
      "versesCount": 38
    },
    "48": {
      "endPage": 515,
      "startPage": 511,
      "revelationPlace": "madinah",
      "surahName": "الفتح",
      "versesCount": 29
    },
    "49": {
      "endPage": 517,
      "startPage": 515,
      "revelationPlace": "madinah",
      "surahName": "الحجرات",
      "versesCount": 18
    },
    "50": {
      "endPage": 520,
      "startPage": 518,
      "revelationPlace": "makkah",
      "surahName": "ق",
      "versesCount": 45
    },
    "51": {
      "endPage": 523,
      "startPage": 520,
      "revelationPlace": "makkah",
      "surahName": "الذاريات",
      "versesCount": 60
    },
    "52": {
      "endPage": 525,
      "startPage": 523,
      "revelationPlace": "makkah",
      "surahName": "الطور",
      "versesCount": 49
    },
    "53": {
      "endPage": 528,
      "startPage": 526,
      "revelationPlace": "makkah",
      "surahName": "النجم",
      "versesCount": 62
    },
    "54": {
      "endPage": 531,
      "startPage": 528,
      "revelationPlace": "makkah",
      "surahName": "القمر",
      "versesCount": 55
    },
    "55": {
      "endPage": 534,
      "startPage": 531,
      "revelationPlace": "madinah",
      "surahName": "الرحمن",
      "versesCount": 78
    },
    "56": {
      "endPage": 537,
      "startPage": 534,
      "revelationPlace": "makkah",
      "surahName": "الواقعة",
      "versesCount": 96
    },
    "57": {
      "endPage": 541,
      "startPage": 537,
      "revelationPlace": "madinah",
      "surahName": "الحديد",
      "versesCount": 29
    },
    "58": {
      "endPage": 545,
      "startPage": 542,
      "revelationPlace": "madinah",
      "surahName": "المجادلة",
      "versesCount": 22
    },
    "59": {
      "endPage": 548,
      "startPage": 545,
      "revelationPlace": "madinah",
      "surahName": "الحشر",
      "versesCount": 24
    },
    "60": {
      "endPage": 551,
      "startPage": 549,
      "revelationPlace": "madinah",
      "surahName": "الممتحنة",
      "versesCount": 13
    },
    "61": {
      "endPage": 552,
      "startPage": 551,
      "revelationPlace": "madinah",
      "surahName": "الصف",
      "versesCount": 14
    },
    "62": {
      "endPage": 554,
      "startPage": 553,
      "revelationPlace": "madinah",
      "surahName": "الجمعة",
      "versesCount": 11
    },
    "63": {
      "endPage": 555,
      "startPage": 554,
      "revelationPlace": "madinah",
      "surahName": "المنافقون",
      "versesCount": 11
    },
    "64": {
      "endPage": 557,
      "startPage": 556,
      "revelationPlace": "madinah",
      "surahName": "التغابن",
      "versesCount": 18
    },
    "65": {
      "endPage": 559,
      "startPage": 558,
      "revelationPlace": "madinah",
      "surahName": "الطلاق",
      "versesCount": 12
    },
    "66": {
      "endPage": 561,
      "startPage": 560,
      "revelationPlace": "madinah",
      "surahName": "التحريم",
      "versesCount": 12
    },
    "67": {
      "endPage": 564,
      "startPage": 562,
      "revelationPlace": "makkah",
      "surahName": "الملك",
      "versesCount": 30
    },
    "68": {
      "endPage": 566,
      "startPage": 564,
      "revelationPlace": "makkah",
      "surahName": "القلم",
      "versesCount": 52
    },
    "69": {
      "endPage": 568,
      "startPage": 566,
      "revelationPlace": "makkah",
      "surahName": "الحاقة",
      "versesCount": 52
    },
    "70": {
      "endPage": 570,
      "startPage": 568,
      "revelationPlace": "makkah",
      "surahName": "المعارج",
      "versesCount": 44
    },
    "71": {
      "endPage": 571,
      "startPage": 570,
      "revelationPlace": "makkah",
      "surahName": "نوح",
      "versesCount": 28
    },
    "72": {
      "endPage": 573,
      "startPage": 572,
      "revelationPlace": "makkah",
      "surahName": "الجن",
      "versesCount": 28
    },
    "73": {
      "endPage": 575,
      "startPage": 574,
      "revelationPlace": "makkah",
      "surahName": "المزمل",
      "versesCount": 20
    },
    "74": {
      "endPage": 577,
      "startPage": 575,
      "revelationPlace": "makkah",
      "surahName": "المدثر",
      "versesCount": 56
    },
    "75": {
      "endPage": 578,
      "startPage": 577,
      "revelationPlace": "makkah",
      "surahName": "القيامة",
      "versesCount": 40
    },
    "76": {
      "endPage": 580,
      "startPage": 578,
      "revelationPlace": "madinah",
      "surahName": "الانسان",
      "versesCount": 31
    },
    "77": {
      "endPage": 581,
      "startPage": 580,
      "revelationPlace": "makkah",
      "surahName": "المرسلات",
      "versesCount": 50
    },
    "78": {
      "endPage": 583,
      "startPage": 582,
      "revelationPlace": "makkah",
      "surahName": "النبإ",
      "versesCount": 40,
      "translatedName": "النبإ"
    },
    "79": {
      "endPage": 584,
      "startPage": 583,
      "revelationPlace": "makkah",
      "surahName": "النازعات",
      "versesCount": 46
    },
    "80": {
      "endPage": 585,
      "startPage": 585,
      "revelationPlace": "makkah",
      "surahName": "عبس",
      "versesCount": 42
    },
    "81": {
      "endPage": 586,
      "startPage": 586,
      "revelationPlace": "makkah",
      "surahName": "التكوير",
      "versesCount": 29
    },
    "82": {
      "endPage": 587,
      "startPage": 587,
      "revelationPlace": "makkah",
      "surahName": "الإنفطار",
      "versesCount": 19,
      "translatedName": "الإنفطار"
    },
    "83": {
      "endPage": 589,
      "startPage": 587,
      "revelationPlace": "makkah",
      "surahName": "المطففين",
      "versesCount": 36
    },
    "84": {
      "endPage": 589,
      "startPage": 589,
      "revelationPlace": "makkah",
      "surahName": "الإنشقاق",
      "versesCount": 25,
      "translatedName": "الإنشقاق"
    },
    "85": {
      "endPage": 590,
      "startPage": 590,
      "revelationPlace": "makkah",
      "surahName": "البروج",
      "versesCount": 22
    },
    "86": {
      "endPage": 591,
      "startPage": 591,
      "revelationPlace": "makkah",
      "surahName": "الطارق",
      "versesCount": 17
    },
    "87": {
      "endPage": 592,
      "startPage": 591,
      "revelationPlace": "makkah",
      "surahName": "الأعلى",
      "versesCount": 19,
      "translatedName": "الأعلى"
    },
    "88": {
      "endPage": 592,
      "startPage": 592,
      "revelationPlace": "makkah",
      "surahName": "الغاشية",
      "versesCount": 26
    },
    "89": {
      "endPage": 594,
      "startPage": 593,
      "revelationPlace": "makkah",
      "surahName": "الفجر",
      "versesCount": 30
    },
    "90": {
      "endPage": 594,
      "startPage": 594,
      "revelationPlace": "makkah",
      "surahName": "البلد",
      "versesCount": 20
    },
    "91": {
      "endPage": 595,
      "startPage": 595,
      "revelationPlace": "makkah",
      "surahName": "الشمس",
      "versesCount": 15
    },
    "92": {
      "endPage": 596,
      "startPage": 595,
      "revelationPlace": "makkah",
      "surahName": "الليل",
      "versesCount": 21
    },
    "93": {
      "endPage": 596,
      "startPage": 596,
      "revelationPlace": "makkah",
      "surahName": "الضحى",
      "versesCount": 11
    },
    "94": {
      "endPage": 596,
      "startPage": 596,
      "revelationPlace": "makkah",
      "surahName": "الشرح",
      "versesCount": 8
    },
    "95": {
      "endPage": 597,
      "startPage": 597,
      "revelationPlace": "makkah",
      "surahName": "التين",
      "versesCount": 8
    },
    "96": {
      "endPage": 597,
      "startPage": 597,
      "revelationPlace": "makkah",
      "surahName": "العلق",
      "versesCount": 19
    },
    "97": {
      "endPage": 598,
      "startPage": 598,
      "revelationPlace": "makkah",
      "surahName": "القدر",
      "versesCount": 5
    },
    "98": {
      "endPage": 599,
      "startPage": 598,
      "revelationPlace": "madinah",
      "surahName": "البينة",
      "versesCount": 8
    },
    "99": {
      "endPage": 599,
      "startPage": 599,
      "revelationPlace": "madinah",
      "surahName": "الزلزلة",
      "versesCount": 8
    },
    "100": {
      "endPage": 600,
      "startPage": 599,
      "revelationPlace": "makkah",
      "surahName": "العاديات",
      "versesCount": 11
    },
    "101": {
      "endPage": 600,
      "startPage": 600,
      "revelationPlace": "makkah",
      "surahName": "القارعة",
      "versesCount": 11
    },
    "102": {
      "endPage": 600,
      "startPage": 600,
      "revelationPlace": "makkah",
      "surahName": "التكاثر",
      "versesCount": 8
    },
    "103": {
      "endPage": 601,
      "startPage": 601,
      "revelationPlace": "makkah",
      "surahName": "العصر",
      "versesCount": 3
    },
    "104": {
      "endPage": 601,
      "startPage": 601,
      "revelationPlace": "makkah",
      "surahName": "الهمزة",
      "versesCount": 9
    },
    "105": {
      "endPage": 601,
      "startPage": 601,
      "revelationPlace": "makkah",
      "surahName": "الفيل",
      "versesCount": 5
    },
    "106": {
      "endPage": 602,
      "startPage": 602,
      "revelationPlace": "makkah",
      "surahName": "قريش",
      "versesCount": 4
    },
    "107": {
      "endPage": 602,
      "startPage": 602,
      "revelationPlace": "makkah",
      "surahName": "الماعون",
      "versesCount": 7
    },
    "108": {
      "endPage": 602,
      "startPage": 602,
      "revelationPlace": "makkah",
      "surahName": "الكوثر",
      "versesCount": 3
    },
    "109": {
      "endPage": 603,
      "startPage": 603,
      "revelationPlace": "makkah",
      "surahName": "الكافرون",
      "versesCount": 6
    },
    "110": {
      "endPage": 603,
      "startPage": 603,
      "revelationPlace": "madinah",
      "surahName": "النصر",
      "versesCount": 3
    },
    "111": {
      "endPage": 603,
      "startPage": 603,
      "revelationPlace": "makkah",
      "surahName": "المسد",
      "versesCount": 5
    },
    "112": {
      "endPage": 604,
      "startPage": 604,
      "revelationPlace": "makkah",
      "surahName": "الإخلاص",
      "versesCount": 4,
      "translatedName": "الإخلاص"
    },
    "113": {
      "endPage": 604,
      "startPage": 604,
      "revelationPlace": "makkah",
      "surahName": "الفلق",
      "versesCount": 5
    },
    "114": {
      "endPage": 604,
      "startPage": 604,
      "revelationPlace": "makkah",
      "surahName": "الناس",
      "versesCount": 6
    }
  };

  final convertedJson = convertToJsonList(inputJson);
  print(convertedJson);
}

List<Map<String, dynamic>> convertToJsonList(Map<String, dynamic> input) {
  return input.entries.map((entry) {
    final surahNumber = int.parse(entry.key);
    final Map<String, dynamic> surahData = Map<String, dynamic>.from(entry.value);
    surahData['surahNumber'] = surahNumber;
    return surahData;
  }).toList();
}

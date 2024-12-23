import 'package:flutter/material.dart';
import 'package:quran_controller/quran_controller.dart';
import "package:quran_controller/models/models.dart";
import 'package:quran_controller/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await QuranController.instance.initializing();
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // uncomment below line for SearchView
        // body: QuranSearchView(),
        //-----------------------------------------
        // uncomment below line for QuranSurahView by juz number
        // body: QuranSurahView.byJuz(juzNumber: 1),
        //-----------------------------------------
        // uncomment below line for QuranSurahView by verse number [not supported yet]
        // body: QuranSurahView.byVerse(verseNumber: 1),
        //-----------------------------------------
        // below line for QuranSurahView by surah number
        body: QuranSurahView.bySurah(surahNumber: 18),
      ),
    ),
  );
}

class QuranSurahView extends StatefulWidget {
  final int? surahNumber;
  final int? verseNumber;
  final int? juzNumber;

  const QuranSurahView.bySurah({this.surahNumber, super.key})
      : juzNumber = null,
        verseNumber = null;

  const QuranSurahView.byJuz({this.juzNumber, super.key})
      : surahNumber = null,
        verseNumber = null;

  const QuranSurahView.byVerse({this.verseNumber, super.key})
      : surahNumber = null,
        juzNumber = null;

  @override
  State<QuranSurahView> createState() => _QuranSurahViewState();
}

class _QuranSurahViewState extends State<QuranSurahView> {
  ScrollController scrollController = ScrollController();
  Surah surah = Surah();
  Juz juz = Juz();

  String get title => widget.surahNumber != null ? QuranController.instance.surahText + QuranController.instance.getSurahName(widget.surahNumber!) : '${widget.juzNumber!}';

  @override
  void initState() {
    scrollController.addListener(() => setState(() {}));
    getCustomVerses();
    super.initState();
  }

  getCustomVerses() async {
    await QuranController.instance.initializing();
    if (widget.surahNumber != null) surah = QuranController.instance.gettingVersesBySurahNumber(widget.surahNumber!);
    if (widget.juzNumber != null) juz = QuranController.instance.gettingVersesByJuzNumber(widget.juzNumber!);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Stack(
          alignment: Alignment.center,
          children: [
            Text(QuranController.instance.borderText, textDirection: TextDirection.rtl, style: TextStyle(color: Colors.white, fontFamily: QuranController.instance.basmalaAndSurahsNameFontsFamily, fontSize: 35)),
            Text(title, textDirection: TextDirection.rtl, style: TextStyle(color: Colors.white, fontFamily: widget.surahNumber != null ? QuranController.instance.basmalaAndSurahsNameFontsFamily : null)),
          ],
        ),
      ),
      body: SafeArea(
        top: true,
        left: false,
        right: false,
        bottom: false,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            controller: scrollController,
            children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    height: 65,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.blue, width: 2)
                        // border: BorderDirectional(bottom: BorderSide(color:  StaticConstants.lblBlueColor,width: 1)),
                        ),
                    child: Text(
                      QuranController.instance.basmalaText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: QuranController.instance.basmalaAndSurahsNameFontsFamily,
                        fontSize: 35,
                      ),
                    ),
                  ),
                ] +
                versesGenerator(),
          ),
        ),
      ),
    );
  }

  List<Widget> versesGenerator() {
    List<Widget> result = [];
    List<Verse> verses = widget.surahNumber != null ? surah.verses ?? [] : juz.verses ?? [];
    for (int index = 0; index < verses.length; index++) {
      if (verses[index].verseNumber == 0) print(verses[index].verseKey);
      result.add(Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.blueGrey, width: 1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            key: ValueKey(index),
            title: Text(
              verses[index].fullVerse ?? '',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 25, fontFamily: verses[index].font),
            ),
            // subtitle: VerseToolsWidget(surah: widget.surahNumber,verse: index+1, bookmark: ()=> bookmark(widget.surahNumber, index+1, context).then((value) => setState(() {})), isBookmarked: isBookmarked(widget.surahNumber, index+1),)),
          ),
        ),
      ));
    }
    return result;
  }
}

class QuranSearchView extends StatefulWidget {
  const QuranSearchView({super.key});

  @override
  State<QuranSearchView> createState() => _QuranSearchViewState();
}

class _QuranSearchViewState extends State<QuranSearchView> {
  SearchService searchService = SearchService();
  QuranController quranController = QuranController();
  List<Verse> verses = [];

  initializing() async {
    await quranController.initializing();
  }

  @override
  void initState() {
    initializing();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            onChanged: (value) async {
              verses = await searchService.search(value);
              setState(() {});
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .8 - 170,
            child: ListView.builder(
              itemCount: verses.length,
              itemBuilder: (context, index) => Text(verses[index].textImlaeiSimple!),
            ),
          ),
        ],
      ),
    );
  }
}

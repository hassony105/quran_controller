import 'package:flutter/material.dart';
import 'package:quran_controller/quran_controller.dart';
import "package:quran_controller/models/models.dart";
import 'package:quran_controller/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await QuranController.instance.initializing();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      // body: QuranSearchView(),
      body: QuranSurahView(surahNumber: 2, /*juzNumber: 30,*/),
    ),
  ));
}


class QuranSurahView extends StatefulWidget {
  final int? surahNumber;
  final int? verseNumber;
  final int? juzNumber;
  const QuranSurahView({this.surahNumber, this.verseNumber, this.juzNumber, super.key});


  @override
  State<QuranSurahView> createState() => _QuranSurahViewState();
}

class _QuranSurahViewState extends State<QuranSurahView> {
  ScrollController scrollController = ScrollController();
  Surah surah = Surah();

  @override
  void initState() {
    scrollController.addListener(() => setState((){},),);
    getCustomVerses();
    super.initState();
  }


  getCustomVerses() async {
    await QuranController.instance.initializing();
    surah = QuranController.instance.gettingVersesBySurahNumber(widget.surahNumber??1);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        leading: const SizedBox(),
        title: Stack(
          alignment: Alignment.center,
          children: [
            Text(QuranController.instance.borderText, textDirection: TextDirection.rtl, style: TextStyle(color: Colors.white, fontFamily: QuranController.instance.basmalaAndSurahsNameFontsFamily, fontSize: 35)),
            Text(QuranController.instance.surahText + QuranController.instance.getSurahName(widget.surahNumber??1), textDirection: TextDirection.rtl, style: TextStyle(color: Colors.white, fontFamily: QuranController.instance.basmalaAndSurahsNameFontsFamily)),
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
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.blue, width: 2)
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
            ] + versesGenerator(),
          ),
        ),
      ),
    );
  }

  List<Widget> versesGenerator(){
    List<Widget> result = [];
    for(int index=0; index<(surah.verses??[]).length; index++) {
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
              surah.verses![index].fullVerse??'',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 25, fontFamily: surah.verses![index].font),
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
              setState(() {

              });
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*.8-170,
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

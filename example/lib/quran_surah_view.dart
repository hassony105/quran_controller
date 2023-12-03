
import "package:flutter/material.dart";
import "package:quran_controller/models/models.dart";
import "package:quran_controller/quran_controller.dart";


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

  late QuranController quranController = QuranController(surahNumber: widget.surahNumber, juzNumber: widget.juzNumber);
  List<String> surahVerses = [];
  VersesByPage versesAndFont = VersesByPage();
  Surah surah = Surah();
  Juz juz = Juz();
  int versesCount = 0;
  List<int?> bookmarked = [];

  @override
  void initState() {
    scrollController.addListener(() => setState((){},),);
    getCustomVerses();
    super.initState();
  }


  getCustomVerses() async {
    await quranController.initializing();
    versesAndFont = quranController.verses;
    surah = quranController.surah;
    juz = quranController.juz;
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
        title: Text(QuranController.surahText + quranController.getSurahName(widget.surahNumber??1), textDirection: TextDirection.rtl, style: const TextStyle(color: Colors.white, fontFamily: QuranController.basmalaAndSurahsNameFontsFamily)),
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
                child: const Text(
                  QuranController.basmalaText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: QuranController.basmalaAndSurahsNameFontsFamily,
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

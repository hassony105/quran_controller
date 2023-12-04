import 'package:flutter/material.dart';
import 'package:quran_controller/models/models.dart';
import 'package:quran_controller/quran_controller.dart';
import 'package:quran_controller/services/services.dart';

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

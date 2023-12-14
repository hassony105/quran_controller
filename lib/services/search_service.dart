import 'dart:async';
import '../services/services.dart';
import '../models/verse.dart';

/// [SearchService] A class that responsible on searching in Quran verses text.
class SearchService {
  /// [timer] is `Timer` variable that is controlling the delay time for searching.
  Timer? timer;

  /// [search] Future List of [Verse] method that making searching in all verses texts.
  Future<List<Verse>> search(String text) async {
    try {
      List<Verse> verses = [];
      if (timer != null) timer!.cancel();
      if (text.trim().isEmpty) return verses;
      timer = Timer(const Duration(milliseconds: 1500), () {
        verses = VersesService.allVerses
            .where((element) =>
                (element.textImlaeiSimple ?? '').contains(text) &&
                element.verseNumber != 0)
            .toList();
      });
      await Future.delayed(const Duration(milliseconds: 1500));
      return verses;
    } catch (e) {
      rethrow;
    }
  }
}

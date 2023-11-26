class VerseWord {
  int? id;
  int? position;
  String? audioUrl;
  String? verseKey;
  int? verseId;
  String? location;
  String? codeV1;
  String? charTypeName;
  int? pageNumber;
  int? lineNumber;
  String? text;

  VerseWord(
      {this.id,
        this.position,
        this.audioUrl,
        this.verseKey,
        this.verseId,
        this.location,
        this.codeV1,
        this.charTypeName,
        this.pageNumber,
        this.lineNumber,
        this.text});

  VerseWord.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    position = data['position'];
    audioUrl = data['audio_url'];
    verseKey = data['verse_key'];
    verseId = data['verse_id'];
    location = data['location'];
    codeV1 = data['code_v1'];
    charTypeName = data['char_type_name'];
    pageNumber = data['page_number'];
    lineNumber = data['line_number'];
    text = data['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['position'] = position;
    data['audio_url'] = audioUrl;
    data['verse_key'] = verseKey;
    data['verse_id'] = verseId;
    data['location'] = location;
    data['code_v1'] = codeV1;
    data['char_type_name'] = charTypeName;
    data['page_number'] = pageNumber;
    data['line_number'] = lineNumber;
    data['text'] = text;
    return data;
  }
}

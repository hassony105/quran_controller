<div align="center">
  <h1>Quran Controller</h1>
  <div>
    <a title="pub.dev" href="https://pub.dartlang.org/packages/quran_controller" >
        <img alt="Pub Version" src="https://img.shields.io/pub/v/quran_controller">
    </a>
    <a title="GitHub License" href="https://github.com/hassony105/quran_controller/blob/master/LICENSE">
      <img src="https://img.shields.io/github/license/hassony105/quran_controller?color=f12253" />
    </a>
    <a title="GitHub hassony105" href="https://github.com/hassony105">
      <img alt="Static Badge" src="https://img.shields.io/badge/hassony105-github-blue?link=https%3A%2F%2Fgithub.com%2Fhassony105%2Fquran_controller">
    </a>


  </div>
  <div>
  </div>
  <br/>
  <p>Quran Controller that offering a Quran Verses With Quran font which is Called <span style="color:#0fddd6">Uthmani script</span></p>


</div>


---

### Content

- [Installation](#installation)
- [Get Started](#get-started)
- [Methods And Properties](#methods-and-properties)
- [How To Use](#how-to-use)
- [Localization](#localization)
- [Contribution](#contribution)

## Installation

Add the package to your dependencies:

```yaml
dependencies:
  quran_controller: ^1.6.8
```

<p align="center">OR</p>

```yaml
dependencies:
  quran_controller:
    git: https://github.com/hassony105/quran_controller.git
```

Finally, run `dart pub get` to download the package.

Projects using this library should use the stable channel of Flutter

## Get Started
You must to initialize QuranController by calling `await QuranController.instance.initializing();` because it takes a few seconds to load all verses.

## Methods And Properties

| Properties                                    | Type                  | Description                                       |
|:----------------------------------------------|:----------------------|:--------------------------------------------------|
| `initializing()`                              | `Future<void>`        | **Required**. initialize QuranController          |
| `gettingVersesByPageNumber(int pageNumber)`   | `List<Verse>`         | Returns list of Verses filtered by page number    |
| `gettingVersesBySurahNumber(int surahNumber)` | `Surah`               | Returns Surah by given number                     |
| `gettingVersesByJuzNumber(int juzNumber)`     | `Juz`                 | Returns Juz by given number                       |
| `gettingVerseByVerseKey(String key)`          | `Verse`               | Returns Verse by given key                        |
| `search(String text)`                         | `Future<List<Verse>>` | Returns list of Verses filtered by given text     |
| `getSurahName(int surahNumber)`               | `String`              | Returns String from the charcode of surah name    |
| `instance`                                    | `QuranController`     | An Instance of QuranController                    |
| `allVerses`                                   | `List<Verse>`         | A list of Verses that loaded after initializing   |
| `surahsDetails`                               | `List<Surah>`         | A list of Surahs that contains each Surah details |
| `juzsDetails`                                 | `List<Juz>`           | A list of Juzs that contains each Juz details     |
| `basmalaText`                                 | `String`              | The unicode character of Basmala                  |
| `surahText`                                   | `String`              | The unicode character of "Surah" word             |
| `borderText`                                  | `String`              | The unicode character of Border of Surah name     |
| `basmalaAndSurahsNameFontsFamily`             | `String`              | The Font Family Basmala and Surahs names          |

## How To Use

It is very simple to use, just like these examples:

***Require***: *You must to use the `fontFamily` in `TextStyle` to get Quran styled text.*

- Basmala

```
Text(
    QuranController.instance.basmalaText,
    style: TextStyle(fontFamily: QuranController.instance.basmalaAndSurahsNameFontsFamily),
)

```

- "Surah" Word

```
Text(
    QuranController.instance.surahText,
    style: TextStyle(fontFamily: QuranController.instance.basmalaAndSurahsNameFontsFamily),
)

```

- Border

```
Text(
    QuranController.instance.borderText,
    style: TextStyle(fontFamily: QuranController.instance.basmalaAndSurahsNameFontsFamily),
)

```

- Verse

```
Text(
    verse.fullVerse,
    style: TextStyle(fontFamily: verse.font),
)

```

## Localization

Quran Controller package currently supports only <span style="color:#0fddd6">Arabic</span> language view.



## Contribution

Feel free to [file an issue](https://github.com/hassony105/quran_controller/issues/new) if you find a problem or [make pull requests](https://github.com/hassony105/quran_controller/pulls).

All contributions are welcome **:)**
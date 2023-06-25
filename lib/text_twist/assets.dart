class WordsInfo {
  static List<LetterElem> letters = [];

  static int index = 0;
  static List words = [];
  static List<LetterElem> typedLetters = List<LetterElem>.from(words
      .reduce((a, b) => a.length > b.length ? a : b)
      .split("")
      .map((_) => LetterElem(""))
      .toList());

  static String getWord() {
    return typedLetters.map((e) => e.letter).toList().join().toLowerCase();
  }

  static void shuffleKeyBoard() {
    letters.shuffle();
  }
}

class LetterElem {
  late String letter;

  LetterElem(this.letter);
}

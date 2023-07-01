class WordsInfo {
  static List<LetterElem> letters = [];

  static int index = 0;
  static List words = [];
  static List<LetterElem> typedLetters =
      List<LetterElem>.generate(getMaxLength(), (index) => LetterElem(""));

  static String getWord() {
    return typedLetters.map((e) => e.letter).toList().join().toLowerCase();
  }

  static void shuffleKeyBoard() {
    letters.shuffle();
  }

  static void updateIndex() {
    for (LetterElem elem in typedLetters) {
      if (elem.letter == "") {
        index = typedLetters.indexOf(elem);
        return;
      }
    }
    index = typedLetters.length;
  }

  static int getMaxLength() {
    int maxLength = 0;
    for (String word in words) {
      if (word.length > maxLength) {
        maxLength = word.length;
      }
    }
    return maxLength;
  }
}

class LetterElem {
  late String letter;

  LetterElem(this.letter);
}

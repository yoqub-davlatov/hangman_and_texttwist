class WordsInfo {
  static List letters = [];

  static int index = 0;
  static List typedLetters = words.reduce((a, b) =>
  a.length > b.length ? a : b).split("").map((e) => "").toList();

  static List words = [];

  static String getWord() {
    return typedLetters.join().toLowerCase();
  }
  static void shuffleKeyBoard() {
    letters.shuffle();
  }
}

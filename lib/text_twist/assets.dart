class WordsInfo {
  static List letters = [];

  static int index = 0;
  static List typedLetters = letters.map((e) => "").toList();

  static List words = [];
  static String getWord()
  {
    return typedLetters.join().toLowerCase();
  }
}

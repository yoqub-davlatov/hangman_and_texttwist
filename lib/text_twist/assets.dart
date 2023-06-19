class WordsInfo {
  static List letters = List.from(("CATPEN").split(""))..shuffle();
  static int index = 0;
  static List typedLetters = letters.map((e) => "").toList();

  static List words = ["pen", "cat", "pet"];
}

class Game {
  static String word = 'Flutter';
  static String initialHint = '';
  static List<String> hints = [];
  static const String message =
      'Give me a word from a category of colors. Try to give different colors every time. For that particular word provide me a full sentence as a hint that could help me to guess the word. Try to make a hint as short as possible.Return the answer in the following json format, without any extra words: {"word" : "YOUR_WORD", "hint" : "<HINT>"}. Return to me only the json format';
  static int gameTries = 0;
  static List<String> selectedChar = [];
  static List<String> alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split('').toList();
}

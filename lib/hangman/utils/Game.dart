class Game {
  static List<String> words = [];
  static List<String> categories = [];
  static List<String> descriptions = [];
  static List<List<String>> hints = [];
  static int cnt = 0;
  static String getPrompt(final String category) {
    return """For a category of $category, generate $cnt very closely related word(s), and a very short description for each word.
              Put them in the json list, therefore the length of the list becomes $cnt.
              Additionally, provide me three different hints for each word, so that they could help me to guess the word. 
              Provide your generated text as the list that contains of the json objects in the following format (please put all quotation marks):
              [
                {
                  "word" : "word_1",
                  "description" : "description_of_word_1",
                  "hints" : ["hint_1", "hint_2", "hint_3"]
                }
              ],
          """;
  }

  static int guessed = 0;
  static int gameTries = 0;
  static List<String> selectedChar = [];
  static List<String> alphabet = ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P', 'A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L', 'Z', 'X', 'C', 'V', 'B', 'N', 'M'];

}

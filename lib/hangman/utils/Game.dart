class Game {
  static List<String> words = [];
  static List<String> descriptions = [];
  static List<List<String>> hints = [];
  static String getPrompt(final String categories, final int cnt) {
    return """ I will give you a list of categories and one number cnt. 
                For each category, generate cnt very closely related words, and a very short description for each word. 
                Additionally, provide me three different hints for each word, so that they could help me to guess the word. 
                Provide your generated text in the following json format (please put all quotation marks):
                {
                  "category_i" : [
                      {
                        "word" : "word_for_category_i",
                        "description" : "description_of_word",
                        "hints" : ["hint_1", "hint_2", "hint_3"]
                      },
                  ]
                }
                Now the categories are ${categories}and cnt is $cnt.
          """;
  }
  static int guessed = 0;
  static int gameTries = 0;
  static List<String> selectedChar = [];
  static List<String> alphabet =
      "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split('').toList();
}

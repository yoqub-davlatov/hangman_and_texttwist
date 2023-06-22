import 'package:dart_openai/dart_openai.dart';


Future<List> apiCategoryCall(category) async {
  OpenAI.apiKey = "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";

  OpenAIChatCompletionModel completion = await OpenAI.instance.chat.create(
    model: "gpt-3.5-turbo",
    messages: [
      OpenAIChatCompletionChoiceMessageModel(
        content: "Give me 4-5 words in category: $category. "
            "Compose words with maximum common letters. "
            "Each word should be 6 letters maximum. Separate words with"
            " commas with spaces. Do not provide the category, just the items.",
        role: OpenAIChatMessageRole.user,
      ),

    ],
  );

  return completion.choices.first.message.content.split(", ");
}
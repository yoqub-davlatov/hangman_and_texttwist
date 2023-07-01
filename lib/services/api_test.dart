import 'package:dart_openai/dart_openai.dart';

Future<List> apiCategoryCall(category) async {
  // Set the OpenAI API key from the .env file.

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

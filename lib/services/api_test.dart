import 'package:dart_openai/dart_openai.dart';


Future<List> apiCategoryCall(category) async {
  // Set the OpenAI API key from the .env file.
  OpenAI.apiKey = "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";

  // Start using!

  OpenAIChatCompletionModel completion = await OpenAI.instance.chat.create(
    model: "gpt-3.5-turbo",
    temperature: 0.2,
    messages: [
      OpenAIChatCompletionChoiceMessageModel(
        content: "Give me 4-5 words in category: $category. Compose words with minimum common letters. Each word should be 6 letters maximum. Separate words with commas with spaces. Do not provide the category, just the items",
        role: OpenAIChatMessageRole.user,
      ),

    ],
  );

  // final completion = await OpenAI.instance.completion.create(
  //   model: "gpt-4-0613",
  //   prompt: "Give me 4-5 words in category: $category. "
  //       "Separate words with commas without spaces. "
  //       "Do not insert blank lines.",
  //   temperature: 0.2,
  //
  // );

  return completion.choices.first.message.content.split(", ");
}
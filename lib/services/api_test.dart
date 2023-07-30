import 'package:dart_openai/dart_openai.dart';
import '../env/env.dart';

Future<List> apiCategoryCall(category) async {
  // Set the OpenAI API key from the .env file.

  OpenAI.apiKey = Env.key;

  OpenAIChatCompletionModel completion = await OpenAI.instance.chat.create(
    model: "gpt-3.5-turbo",
    messages: [
      OpenAIChatCompletionChoiceMessageModel(
        content: "Give me 4-5 words (Each word should not be longer than 6 letters) in category: $category. "
            "Compose words with maximum common letters. "
            "Separate words with"
            " commas with spaces. Do not provide the category, just the items.",
        role: OpenAIChatMessageRole.user,
      ),
    ],
  );

  return completion.choices.first.message.content.split(", ");
}

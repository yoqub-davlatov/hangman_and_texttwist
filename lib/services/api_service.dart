import 'dart:convert';
import 'dart:developer';
import 'package:dart_openai/dart_openai.dart';
import '../env/env.dart';

Future<List> hangmanApiCall(final String prompt) async {
  OpenAI.apiKey = Env.key;
  try {
    OpenAIChatCompletionModel completion = await OpenAI.instance.chat.create(
      model: "gpt-3.5-turbo",
      // temperature: 0.2,
      messages: [
        OpenAIChatCompletionChoiceMessageModel(
          content: prompt,
          role: OpenAIChatMessageRole.user,
        ),
      ],
    );
    log(completion.choices.first.message.content);
    // await Future.delayed(Duration(seconds: 10));
    return jsonDecode(completion.choices.first.message.content);
  } on RequestFailedException catch (e) {
    log(e.message);
    log(e.statusCode.toString());
    rethrow;
  }
}

import 'dart:convert';
import 'dart:developer';
import 'package:dart_openai/dart_openai.dart';
import 'package:http/http.dart' as http;

Future<Map> hangmanApiCall(final String prompt) async {
  OpenAI.apiKey = "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";

  // Start using!
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
  return jsonDecode(completion.choices.first.message.content);
}

class APIService {
  static Future<Map> getMessage(final String prompt) async {
    try {
      String url = "https://api.openai.com/v1/chat/completions";
      String openAIkey = "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";
      var response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $openAIkey',
          'Content-Type': 'application/json'
        },
        body: jsonEncode(
          {
            "model": "gpt-3.5-turbo",
            "messages": [
              {"role": "system", "content": prompt},
              // {"role": "user", "content": prompt},
            ]
          },
        ),
      );

      Map jsonResponse = jsonDecode(response.body);

      String content = jsonResponse['choices'].length > 0
          ? jsonResponse['choices'][0]['message']['content'].toString()
          : '';

      Map contentResponse = jsonDecode(content);
      return contentResponse;
    } catch (e) {
      log("Error: $e"); // most likely because of json format sent by api
      return getMessage(prompt);
    }
  }
}

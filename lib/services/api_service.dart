import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class APIService {
  static Future<Map> getMessage(final String prompt) async {
    try {
      String url = "https://api.openai.com/v1/chat/completions";
      String openAIkey = YOUR_OPENAI_KEY;
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

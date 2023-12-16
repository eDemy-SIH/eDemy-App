import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> fetchChatbotResponse(String userMessage) async {
  final apiKey = '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';
  final modelId = 'gpt-3.5-turbo';
  final apiUrl = 'https://api.openai.com/v1/chat/completions';

  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    },
    body: jsonEncode({
      'model': modelId,
      'messages': [
        {'role': 'system', 'content': 'You are a career counselor chatbot. Only answer questions based on career advice, subjects. if asked anything else reply i dont know. Strictly do not answer questions from other topics'},
        {'role': 'user', 'content': userMessage},
      ],
    }),
  );

  if (response.statusCode == 200) {
    final chatbotResponse = jsonDecode(response.body)['choices'][0]['message']['content'];
    return chatbotResponse;
  } else {
    throw Exception('Failed to load chatbot response');
  }
}

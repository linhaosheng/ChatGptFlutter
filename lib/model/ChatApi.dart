import 'package:dart_openai/dart_openai.dart';
import 'package:test_flutter/model/ChatMessage.dart';
import 'package:test_flutter/model/chatGptModel.dart';

class ChatApi {
  static const _model = 'gpt-3.5-turbo';

  ChatApi() {
    OpenAI.apiKey = Env.apiKey;
  }

  Future<String> completeChat(List<ChatMessage> messages) async {
    final chatCompletion = await OpenAI.instance.chat.create(
      model: _model,
      messages: messages
          .map((e) => OpenAIChatCompletionChoiceMessageModel(
        role: e.isUserMessage ? OpenAIChatMessageRole.user : OpenAIChatMessageRole.assistant,
        content: e.content,
      ))
          .toList(),
    );
    return chatCompletion.choices.first.message.content;
  }
}

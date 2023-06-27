// chat_page.dart
import 'package:flutter/material.dart';
import 'package:test_flutter/model/ChatApi.dart';
import 'package:test_flutter/model/ChatMessage.dart';
import 'package:test_flutter/view/chatGpt/MessageBubble.dart';
import 'package:test_flutter/view/chatGpt/MessageComposer.dart';

class ChatPage extends StatefulWidget {

  const ChatPage({
    required this.chatApi,
    super.key,
  });

  final ChatApi chatApi;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _messages = <ChatMessage>[
    ChatMessage('Hello, how can I help?', false),
  ];
  var _awaitingResponse = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat')),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ..._messages.map(
                      (msg) => MessageBubble(
                    content: msg.content,
                    isUserMessage: msg.isUserMessage,
                  ),
                ),
              ],
            ),
          ),
          MessageComposer(
            onSubmitted: _onSubmitted,
            awaitingResponse: _awaitingResponse,
          ),
        ],
      ),
    );
  }


  Future<void> _onSubmitted(String message) async {
    setState(() {
      _messages.add(ChatMessage(message, true));
      _awaitingResponse = true;
    });
    final response = await widget.chatApi.completeChat(_messages);
    setState(() {
      _messages.add(ChatMessage(response, false));
      _awaitingResponse = false;
    });
  }

}

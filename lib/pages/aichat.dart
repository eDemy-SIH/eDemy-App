import 'package:flutter/material.dart';
import 'package:sih_app/utils/ai-chat-receive.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _chatLog = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Career Chatbot',style: TextStyle(color: Colors.black,fontFamily:'FontMain'),),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _chatLog.length,
              itemBuilder: (context, index) {
                return _chatLog[index];
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      filled: true, 
                      fillColor: Color.fromARGB(255, 227, 226, 226), 
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send,color: context.cardColor,),
                  onPressed: () async {
                    final userMessage = _controller.text;
                    _controller.clear();
                    setState(() {
                      _chatLog.add(ChatMessage(role: 'User', content: userMessage));
                    });

                    final chatbotResponse = await fetchChatbotResponse(userMessage);

                    setState(() {
                      // _chatLog.add(ChatMessage(role: 'User', content: userMessage));
                      _chatLog.add(ChatMessage(role: 'Chatbot', content: chatbotResponse));
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String role;
  final String content;

  ChatMessage({required this.role, required this.content});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Align(
        alignment: role == 'User' ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: role == 'User' ? context.cardColor : Color.fromRGBO(159, 165, 171, 1),
          ),
          child: Text('$role: $content', style: TextStyle(color: Colors.white,fontFamily:'FontMain')),
        ),
      ),
    );
  }
}
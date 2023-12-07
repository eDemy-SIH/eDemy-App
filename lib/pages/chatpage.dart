
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sih_app/utils/chat_services.dart';
import 'package:sih_app/widgets/chat-buuble.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatPage extends StatefulWidget {
  final String receiverEmail;
  final String receiverId;
  const ChatPage({super.key, required this.receiverEmail, required this.receiverId,});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  final TextEditingController _message=TextEditingController();
  final ChatService _chatService=ChatService();
  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;

  void sendMessage() async{
    if(_message.text.isNotEmpty){
      await _chatService.sendMessage(widget.receiverId, _message.text);
      _message.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        title:
        Text(
          widget.receiverEmail,
          style: TextStyle(color: context.cardColor,fontSize: 18),
        ),
      ),

      body: Column(
        
        children: [

          Expanded(
            child: _messageList(),
          ),

          Row(
            children: [

              
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                     child: TextField(
                    controller: _message,
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
                ),

                IconButton(
                  onPressed: sendMessage, 
                  icon: Icon(Icons.send,color: context.cardColor,),
                )

            ],
          )

        ]
      ),
    );
  }

  Widget _messageList(){
    return StreamBuilder(
      stream: _chatService.getMessage(widget.receiverId, _firebaseAuth.currentUser!.uid), 
      builder: (context,snapshot){
        if(snapshot.hasError){
          return Text('Error'+snapshot.error.toString());
        }
        if(snapshot.connectionState==ConnectionState.waiting){
          return const Text('Loading...');
        }
        return ListView(
          shrinkWrap: true,
          children: snapshot.data!.docs.map((document) => _messageItem(document)).toList(),
        );
      }
    );
  }


  Widget _messageItem(DocumentSnapshot document){
    Map<String,dynamic> data=document.data() as Map<String,dynamic>;

    var alignment=(data['senderId'] == _firebaseAuth.currentUser!.uid)
      ? Alignment.centerRight
      : Alignment.centerLeft;

    return Container(
      alignment: alignment,
      child: Column(
        crossAxisAlignment: (data['senderId'] == _firebaseAuth.currentUser!.uid)
        ? CrossAxisAlignment.end
        :CrossAxisAlignment.start,
        children: [
          //Text(data['senderEmail']),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Chatbubble(
              message: data['message'], 
              user: (data['senderId'] == _firebaseAuth.currentUser!.uid)?true:false
            ),
          )
        ],
      ),
    );

  }



}
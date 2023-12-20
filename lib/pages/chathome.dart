

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sih_app/pages/chatpage.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatHomePage extends StatefulWidget {
  const ChatHomePage({super.key});

  @override
  State<ChatHomePage> createState() => _ChatHomePageState();
}

class _ChatHomePageState extends State<ChatHomePage> {

    final FirebaseAuth _auth= FirebaseAuth.instance;

    void signUserout() async {
    FirebaseAuth.instance.signOut();
    // Future.delayed(Duration(seconds: 1));
    // Navigator.pushNamed(context, Myroutes.loginRoute);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.canvasColor,
      appBar: AppBar(
        title: Text("Talk with Counselor",
          style: TextStyle(fontSize: 24,color: context.cardColor,fontFamily: 'FontMain')),
        actions: [
          IconButton(onPressed: signUserout, icon: Icon(Icons.logout))
        ],
      ),
      

      body: Column(
        children: [
          SizedBox(height: 30,),
          Expanded(child: _buildUserList()),
        ],
      ),
    );
  }

  Widget _buildUserList(){
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
      builder: (context,snapshot){
        if(snapshot.hasError){
          return const Text('error');
        }
        if(snapshot.connectionState==ConnectionState.waiting){
          return const Text('loading...');
        }
        if(_auth.currentUser!.email != 'admin@gmail.com'){

          return ListTile(

          leading: CircleAvatar(
              backgroundColor: Color.fromRGBO(210, 247, 245, 1),
              child: Icon(
                Icons.person_outlined,
                color: const Color.fromRGBO(0, 202, 153, 1),
                size: 24,
              ),
          ),

          title: Text("Career Counselor 1"),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatPage(
              receiverEmail: 'Career Counselor 1',
              receiverId: '6fxpvqVokoakd6x10VVRBh1yVip1',
            )));
          },
        );

        }
        return ListView(
          children: snapshot.data!.docs
            .map<Widget>((doc)=> _buildUserListItem(doc))
            .toList(),
        );
      },
    );
  }

  Widget _buildUserListItem(DocumentSnapshot document){
    Map<String, dynamic> data=document.data()! as Map<String, dynamic>;


    if(_auth.currentUser!.email !=data['email']){
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 5),
        child: ListTile(
          leading: CircleAvatar(
              backgroundColor: Color.fromRGBO(210, 247, 245, 1),
              child: Icon(
                Icons.person_outlined,
                color: const Color.fromRGBO(0, 202, 153, 1),
                size: 24,
              ),
          ),
          title: Text(data['email']),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatPage(
              receiverEmail: data['email'],
              receiverId: data['uid'],
        
            )));
          },
        ),
      );
    } 
    else{
      return Container();
    }
  }
}
// ignore_for_file: prefer_const_constructors
//ignore_for_file: prefer_const_literals


import 'package:sih_app/db/db.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/routes.dart';



class AppDrawer extends StatefulWidget {
  AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}




class _AppDrawerState extends State<AppDrawer> {

  final startbox = Hive.box("Start_db");
  StartPointer db = StartPointer();

  final infobox = Hive.box("BasicInfo-db");
  //list of to do tasks
  BasicDB sdb = BasicDB();

  String userName = "";
  String userimg = "";
  get catalog => null;
  int count = 0;

  bool testake=false;


  @override
  void initState() {
    if (startbox.get("START") == null) {
      db.createTheme();
      testake = db.startHome;
    }
    else{
      db.loadTheme();
      testake=db.startHome;
    }

    if (infobox.get("NAMEDB") == null) {
      sdb.createInitialInfo();
      userName=sdb.userName;
      
    }
    //already exist data
    else {
      sdb.loadDataInfo();
      userName=sdb.userName;
      
    }
    // sdb.updateDbInfo();
    // TODO: implement initState
    super.initState();
  }


//  void _launchURL(String uri) async {
//     final uri=Uri.parse(uri);
//     if (await canLaunchUrl(uri)) {
//       await launchUrl(uri);
//     } else {
//       throw 'Could not launch $uri';
//     }
//   }

  _retakeTest(){
    setState(() {
      db.startHome = !db.startHome;
    });   
    Future.delayed(Duration(seconds: 1));
    Navigator.pushNamed(context, Myroutes.getStartedRoute);
    db.updateTheme();
  }




  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: context.canvasColor,
        child: ListView(
          children: [
            SizedBox(height: 20,),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Color.fromRGBO(210, 247, 245, 1),
                child: Icon(
                  Icons.person,
                  color: const Color.fromRGBO(0, 202, 153, 1),
                  size: 24,
                ),
              ),
            
              title: Text(
                userName,style: 
                TextStyle(color: Color.fromARGB(255, 0, 68, 51),fontSize: 22),
              ),
            ),
            SizedBox(height: 30,),
            GestureDetector(
              onDoubleTap: () {
                _retakeTest();
              },

              child: ListTile(
                
                //5th Title
                leading: Icon(
                  CupertinoIcons.restart,
                  color: context.cardColor,
                  
                ),
                title: Text(
                  "Retake Test",
                  style:
                      TextStyle(fontSize: 18),
                ),
              ),
            ),
            ListTile(
              onTap: () async {
                Navigator.pushNamed(context, '/aichat');
              },
              //5th Title
              leading: Icon(
                Icons.chat,
                color: context.cardColor,
                
              ),
              title: Text(
                "Chat with AI",
                style:
                    TextStyle( fontSize: 18),
              ),
              
            ),
            ListTile(
              onTap: () async {
                Navigator.pushNamed(context, '/chatAuth');
              },
              //5th Title
              leading: Icon(
                Icons.person,
                color: context.cardColor,
                
              ),
              title: Text(
                "Chat with Counselor",
                style:
                    TextStyle( fontSize: 18),
              ),
              
            ),

            ListTile(
              onTap: () async {
                Navigator.pushNamed(context, '/report');
              },
              //5th Title
              leading: Icon(
                Icons.edit_document,
                color: context.cardColor,
                
              ),
              title: Text(
                "View Report",
                style:
                    TextStyle( fontSize: 18),
              ),
            ),


            ListTile(
              onTap: () async {                
               final url = Uri.parse('https://edemy-32175.vercel.app/index.html');
              launchUrl(url);
              },
              //5th Title
              leading: Icon(
                Icons.web,
                color: context.cardColor,
                
              ),
              title: Text(
                "Visit Our Website",
                style:
                    TextStyle( fontSize: 18),
              ),
              
            ),

          ],
        ),
      ),
    );
  }
}

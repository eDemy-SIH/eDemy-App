import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:sih_app/db/db.dart';
import 'package:sih_app/pages/skill_questions.dart';
import 'package:sih_app/utils/routes.dart';
import 'package:sih_app/widgets/next_buttons.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class CharacterStart extends StatefulWidget {
  @override
  _CharacterStartState createState() => _CharacterStartState();
}

class _CharacterStartState extends State<CharacterStart> {



  @override

  Widget build(BuildContext context) {
   
    return Scaffold(
      body: SafeArea(
         child: Container(

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: context.canvasColor,  
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: 30,),

                Padding(
                  padding: EdgeInsets.only(top: 60,left: 20,right: 20),

                  child: Center(
                    child: Container(
                      child: Text("Now we will ask you some questions to predict your dominant personality type",style: TextStyle(fontSize: 24,fontFamily: 'FontMain' ),),
                    ),
                  ),
                ),

                Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: GestureDetector(
                          onTap: () => {
                            Navigator.pushNamed(context, Myroutes.aptitudeRoute)
                                 
                            },
                          child: NextButton(text: "Start")
                        ),
                      ),
                    ),
                  )

              ],
          )

        )
      ),
    );
  }
}

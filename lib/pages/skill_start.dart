import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:sih_app/db/db.dart';
import 'package:sih_app/pages/skill_questions.dart';
import 'package:sih_app/widgets/next_buttons.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class SkillStart extends StatefulWidget {
  @override
  _SkillStartState createState() => _SkillStartState();
}

class _SkillStartState extends State<SkillStart> {

  final aptitudebox = Hive.box("Aptitude_db");
  AptitudeDB db = AptitudeDB();
  var array=[1,2,3];

  String _prediction=" yui";
  String characteristic=" fho";


  @override
  void initState() {

    if (aptitudebox.get("RIASEC") == null) {
      db.createArray();
      array = db.riasec;
    }
    else{
      db.loadArray();
      array=db.riasec;
    }
    
    // TODO: implement initState
    super.initState();
    // checkAndRequestPermissions(); 
    _getPrediction();
  }

  void _getPrediction() async {
    String myString = array.join('');
    String inputString = myString;

    if (inputString.isEmpty) {
      
      setState(() {
        _prediction = 'Input is empty';
      });
      return;
    }
    
    final response = await http.get(Uri.parse('https://model-server-mxrg.onrender.com/$inputString'));
    print(response);
    print("Helloooo:$response.body");
    if (response.statusCode == 200) {
      setState(() {
        
        _prediction = response.body;
        print(_prediction);
        showCharacter(_prediction);

        String jsonString = _prediction;

        // Parse the JSON string
        Map<String, dynamic> jsonMap = json.decode(jsonString);

        // Access the value associated with the key "prediction"
        String predictionValue = jsonMap['prediction'];

        characteristic=predictionValue;

        print(predictionValue);

      });
    } else {
      setState(() {
        _prediction = 'Error: ${response.statusCode}';
      });
    }
  }

  void showCharacter(_prediction){
    String jsonString = _prediction;

    // Parse the JSON string
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    // Access the value associated with the key "prediction"
    String predictionValue = jsonMap['prediction'];

    print(predictionValue);

    setState(() {
       characteristic=predictionValue;
    });
  }


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
                      child: Text("Your Character Test's Over ! Now It's Time To Choose Your Interests.",style: TextStyle(fontSize: 24,fontFamily: 'FontMain' ),),
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
                            Future.delayed(Duration(seconds: 1), (){
                                 Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SkillQuestions(characteristic: characteristic),
                                ),
                              );
                            })
                                 
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

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:sih_app/db/db.dart';
import 'package:sih_app/widgets/drawer.dart';
import 'package:sih_app/widgets/career_cards.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:sih_app/widgets/question_list.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {

   HomePage({super.key,});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final aptitudebox = Hive.box("Aptitude_db");
  AptitudeDB db = AptitudeDB();

  int score=0;
  int total=questions.length-1;
  var array=[1,2,3];
  String _prediction="yolo";
 




  @override
  void initState() {

    if (aptitudebox.get("SCORE") == null) {
      db.createScore();
      score = db.score;
    }
    else{
      db.loadScore();
      score=db.score;
    }

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

 
  final colorList = <Color>[
    Colors.greenAccent,
  ];

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
      });
    } else {
      setState(() {
        _prediction = 'Error: ${response.statusCode}';
      });
    }
  }


  @override
  Widget build(BuildContext context) {

      final dataMap = <String, double>{
        "Progress": score.toDouble(),
      };

    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: context.cardColor),
        backgroundColor: Colors.transparent,
      ),
      drawer: AppDrawer(//creates menu button
        
      ),




      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
      
              //   GestureDetector(
              //      onTap: () {
              //       _getPrediction();
              //      },
              //     child: Center(
              //       child: Text(
              //         "Your Aptitude Score",
              //         style:TextStyle(
              //           fontSize: 18, 
              //           fontFamily: 'FontMain'
              //         ) 
                      
              //       )
              //     ),
              //   ),

              //   SizedBox(height: 20,),

              //   PieChart(
              //     chartRadius: 180,
              //     centerText:  "$score/$total",
              //     initialAngleInDegree: 270,
              //     centerTextStyle: TextStyle(
              //       fontSize: 28,
              //       color: Colors.black
              //     ),
              //     dataMap: dataMap,
              //     chartType: ChartType.ring,
              //     baseChartColor: Color.fromARGB(255, 54, 61, 50).withOpacity(0.15),
              //     colorList: colorList,
              //     legendOptions: LegendOptions(
              //       showLegends: false
              //     ),
              
              //     chartValuesOptions:  ChartValuesOptions(
              //       showChartValuesInPercentage: true,
              //       chartValueStyle: TextStyle(
              //         fontSize: 10,
              //         color: Colors.black
              //       ),
              //       chartValueBackgroundColor: context.canvasColor
              //     ),
              //     totalValue: total.toDouble(),
              // ),


              //  SizedBox(height: 20,),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:10.0), 
                child: Text(      
                  "eDemy",
                  style:
                  TextStyle(
                    fontSize: 36,color:context.cardColor, 
                    fontFamily: 'FontMain',fontWeight: 
                    FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Color.fromARGB(98, 0, 0, 0),      // Choose the color of the shadow
                        blurRadius: 2.0,          // Adjust the blur radius for the shadow effect
                        offset: Offset(2.0, 2.0), // Set the horizontal and vertical offset for the shadow
                      ),
                    ],
                    ), 
                               
                ),         
              ),

              SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal:10.0), 
                child: Text(      
                  "Based on the character assessment test here are some careers recomended for you: $_prediction",
                  style:
                  TextStyle(fontSize: 14,color: Colors.grey[700], fontFamily: 'FontMain'),               
                ),         
              ),
            
              SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        
                        child: Column(
                          
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CareerCard(text: "Software Engineer",col_index: 0,imagePath: "assets/images/graphics-designer-real-min.jpg",),
                            SizedBox(height: 25,),
                            CareerCard(text: "Mechanical Engineer",col_index: 1,imagePath: "assets/images/Mechanical-Engineer-Real-min.jpg",),
                            SizedBox(height: 25,),
                            CareerCard(text: "Civil Engineer",col_index: 2,imagePath: "assets/images/Civil-Engineer-Real-min.jpg",),
                          ],
                        ),
                      ),
                    ],
                  ),     
              ),

              SizedBox(height: 30,),

              GestureDetector(
                onTap: () => {
                      Navigator.pushNamed(context, '/discover')
                  },
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 20,bottom: 10),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 75,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: context.cardColor
                      ),
                      child: const Row(
                        children: [
                          // Container(
                          //   // ignore: sort_child_properties_last
                          //   child: Center(
                          //     child: Image.asset(
                          //       "assets/images/tea-leaves.png",
                          //       height: 50,
                          //       width: 50,
                          //     ),
                          //   ),
                          //   height: 100,
                          //   width: 100,
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(20),
                          //     color: context.cardColor
                          //   ),
                          // ),
                          SizedBox(width: 10,),
                          Expanded(
                            child: Center(                
                              child: Text(
                                "Discover All Jobs",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),              
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

                
          
          
              ],
            ),
          )
        ),
      ),
    );
  }
}
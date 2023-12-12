import 'dart:ffi';

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
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

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
  List<int> myArray = [1, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1];
  List<int> originalList = [];







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
  }

  // Future<void> checkAndRequestPermissions() async {
  //   // Check if permission is granted
  //   // var status = await Permission.storage.status;
  //   final status = await Permission.manageExternalStorage.request();
  //   if (status.isGranted) {
  //     // Permission is already granted, load data
  //     loadJsonData();
  //    }
  //   else if (status.isPermanentlyDenied) {
  //     // Open settings page to grant permission manually
  //       await openAppSettings();
  //   } else {
  //     print('Permission denied');
  //   }
     
     
  //     //else {
  //   //   // Permission is not granted, request it
  //   //   await Permission.storage.request();
  //   //   // Check the permission status again after the request
  //   //   status = await Permission.storage.status;
  //   //   if (status.isGranted) {
  //   //     // Permission granted, load data
  //   //     loadJsonData();
  //   //   } else {
  //   //     // Permission denied
  //   //     print('Permission denied');
  //   //   }
  //   // }
  // }

  //  Future<void> loadJsonData() async {
  //   // Get the application documents directory
  //   final directory = await getApplicationDocumentsDirectory();
  //   final filePath = '${directory.path}/num.json';

  //   // Read the content of num.json
  //   final file = File(filePath);
  //   final exists = await file.exists();

  //   if (!exists) {
  //     // File doesn't exist, create it with initial data
  //     await file.writeAsString(jsonEncode([0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1]));
  //   }

  //   // Parse the JSON content and update the originalList
  //   final decodedList = jsonDecode(await file.readAsString());
  //   updateState(decodedList);
  // }

  // void updateState(List<int> newList) {
  //   setState(() {
  //     originalList = List<int>.from(newList);
  //   });
  // }

  // Future<void> updateList() async {
  //   // Your logic to update the list goes here
  //   // For example, let's reverse the list
  //   final updatedList = originalList.reversed.toList();

  //   // Save the updated list back to num.json
  //   await saveToJsonFile(updatedList);

  //   // Update the UI with the new list
  //   updateState(updatedList);
  // }

  // Future<void> saveToJsonFile(List<int> updatedList) async {
  //   final directory = await getApplicationDocumentsDirectory();
  //   final filePath = '${directory.path}/num.json';

  //   final file = File(filePath);
  //   await file.writeAsString(jsonEncode(updatedList));
  // }

  final colorList = <Color>[
    Colors.greenAccent,
  ];


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
              children: [
      
                GestureDetector(
                   onTap: () {},
                  child: Center(
                    child: Text(
                      "Your Aptitude Score",
                      style:TextStyle(
                        fontSize: 18, 
                        fontFamily: 'FontMain'
                      ) 
                      
                    )
                  ),
                ),

                SizedBox(height: 20,),

                PieChart(
                  chartRadius: 180,
                  centerText:  "$score/$total",
                  initialAngleInDegree: 270,
                  centerTextStyle: TextStyle(
                    fontSize: 28,
                    color: Colors.black
                  ),
                  dataMap: dataMap,
                  chartType: ChartType.ring,
                  baseChartColor: Color.fromARGB(255, 54, 61, 50).withOpacity(0.15),
                  colorList: colorList,
                  legendOptions: LegendOptions(
                    showLegends: false
                  ),
              
                  chartValuesOptions:  ChartValuesOptions(
                    showChartValuesInPercentage: true,
                    chartValueStyle: TextStyle(
                      fontSize: 10,
                      color: Colors.black
                    ),
                    chartValueBackgroundColor: context.canvasColor
                  ),
                  totalValue: total.toDouble(),
              ),


               SizedBox(height: 20,),


             
              Center(
                child: Text(      
                  "Based on the character assessment score and inputs provided here are some careers recomended for you",
                  style:
                  TextStyle(fontSize: 14,color: Colors.grey[700], fontFamily: 'FontMain'),
                  textAlign: TextAlign.center,
                ),
              ),
            
                SizedBox(height: 20,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CareerCard(text: "Software Engineer",col_index: 0,imagePath: "assets/images/graphics-designer-real-min.jpg",),
                              SizedBox(width: 25,),
                              CareerCard(text: "Mechanical Engineer",col_index: 1,imagePath: "assets/images/Mechanical-Engineer-Real-min.jpg",),
                              SizedBox(width: 25,),
                              CareerCard(text: "Civil Engineer",col_index: 2,imagePath: "assets/images/Civil-Engineer-Real-min.jpg",),
                            ],
                          ),
                        ),
                      ],
                    ),     
                ),

                SizedBox(height: 10,),

                GestureDetector(
                  onTap: () => {
                        Navigator.pushNamed(context, '/discover')
                    },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 20,bottom: 10),
                    child: Container(
                      height: 75,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
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

                
          
          
              ],
            ),
          )
        ),
      ),
    );
  }
}
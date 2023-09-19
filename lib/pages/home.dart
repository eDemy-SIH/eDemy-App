import 'package:hive/hive.dart';
import 'package:sih_app/db/db.dart';
import 'package:sih_app/widgets/drawer.dart';
import 'package:sih_app/widgets/career_cards.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {

   HomePage({super.key,});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final aptitudebox = Hive.box("Aptitude_db");
  AptitudeDB db = AptitudeDB();

  int score=0;
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

    // TODO: implement initState
    super.initState();
  }

  final dataMap = <String, double>{
    "Progress": 3,
  };

  final colorList = <Color>[
    Colors.greenAccent,
  ];

  @override
  Widget build(BuildContext context) {
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
      
                Center(
                  child: Text(
                    "Your Aptitude Score",
                    style: TextStyle(fontSize: 18),
                  )
                ),

                SizedBox(height: 20,),

                PieChart(
                  chartRadius: 180,
                  centerText:  "$score/6",
                  initialAngleInDegree: 270,
                  centerTextStyle: TextStyle(
                    fontSize: 28,
                    color: Colors.black
                  ),
                  dataMap: dataMap,
                  chartType: ChartType.ring,
                  baseChartColor: Color.fromARGB(255, 54, 61, 50)!.withOpacity(0.15),
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
                  totalValue: 6,
              ),


               SizedBox(height: 20,),


             
              Center(
                child: Text(      
                  "Based on the score and inputs provided here are some careers recomended for you",
                  style: TextStyle(fontSize: 14,color: Colors.grey[700]),
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
                              CareerCard(text: "Software Engineer",col_index: 0,imagePath: "assets/images/Software-Engineer-Real-min.jpg",),
                              SizedBox(width: 25,),
                              CareerCard(text: "Civil Engineer",col_index: 1,imagePath: "assets/images/Mechanical-Engineer-Real-min.jpg",),
                              SizedBox(width: 25,),
                              CareerCard(text: "Mechanical Engineer",col_index: 2,imagePath: "assets/images/Civil-Engineer-Real-min.jpg",),
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
                      height: 80,
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
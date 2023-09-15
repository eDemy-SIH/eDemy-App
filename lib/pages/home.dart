import 'package:sih_app/widgets/drawer.dart';
import 'package:sih_app/widgets/tips.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});

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
                  chartRadius: 200,
                  centerText:  "3/5",
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
                  totalValue: 5,
              ),


               SizedBox(height: 20,),


             
              Center(
                child: Text(      
                  "Based on the score here are some careers recomended for you",
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            



                SizedBox(height: 20,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Tips to reduce footprint"),
                        SizedBox(height: 10,),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TipsCont(text: "Lorem ipsum ghyr gtuio oi. lorem ipsum",col_index: 0,),
                              SizedBox(width: 20,),
                              TipsCont(text: "Lorem ipsum ghyr gtuio oi. lorem ipsum",col_index: 1,),
                              SizedBox(width: 20,),
                              TipsCont(text: "Lorem ipsum ghyr gtuio oi. lorem ipsum",col_index: 2,),
                            ],
                          ),
                        ),
                      ],
                    ),     
                ),

                // Padding(
                //   padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                //   child: Container(
                //     height: 80,
                //     width: double.infinity,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10),
                //       color: context.cardColor
                //     ),
                //     child: Row(
                //       children: [
                //         Container(
                //           // ignore: sort_child_properties_last
                //           child: Center(
                //             child: Image.asset(
                //               "assets/images/tea-leaves.png",
                //               height: 50,
                //               width: 50,
                //             ),
                //           ),
                //           height: 100,
                //           width: 100,
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(20),
                //             color: context.cardColor
                //           ),
                //         ),
                //         const SizedBox(width: 10,),
                //         const Expanded(
                //           child: Center(                
                //             child: Text(
                //               "Learn More About Climate Change",
                //               style: TextStyle(
                //                 color: Colors.white,
                //                 fontSize: 18,
                //               ),
                //             ),              
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),

                SizedBox(height: 30,),
          
          
              ],
            ),
          )
        ),
      ),
    );
  }
}
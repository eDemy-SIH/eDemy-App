import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:sih_app/db/db.dart';
import 'package:sih_app/pages/home.dart';
import 'package:sih_app/widgets/next_buttons.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: must_be_immutable
class SkillEnd extends StatefulWidget {
  SkillEnd({super.key,required this.userSelections});

  List<String> userSelections = [];

  @override
  State<SkillEnd> createState() => _SkillEndState();
}

class _SkillEndState extends State<SkillEnd> {

  List<String> topFour =['demo'];

  final recommendedbox = Hive.box("Recommended_db");
  RecommendedDb rdb = RecommendedDb();


   @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  
    

  @override
  Widget build(BuildContext context) {

     Map<String, int> occurrences = {};

    for (String element in widget.userSelections) {
      occurrences[element] = (occurrences[element] ?? 0) + 1;
    }

    List<MapEntry<String, int>> sortedOccurrences = occurrences.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));



    List<String> topFour = sortedOccurrences.take(4).map((entry) => entry.key).toList();

    goHome(){
    setState(() {
      rdb.userSelections = topFour;
    });
    rdb.updateRec();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => HomePage(),
      ),
    );
    
  }

   
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
                  padding: EdgeInsets.only(top: 30,left: 20,right: 20),

                  child: Center(
                    child: Container(
                      child: Text("Thanks, for taking the test, continue to see your recommended careers ",style: TextStyle(fontSize: 24,fontFamily: 'FontMain' ),),
                    ),
                  ),
                ),

                
              //   Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     for (String element in topFour)
              //       Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: Text(
              //           element,
              //           style: TextStyle(fontSize: 18,color: Colors.black),
              //         ),
              //       ),
              //   ],
              // ),

                Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: GestureDetector(
                          onTap: () => {
                              goHome()   
                            },
                          child: NextButton(text: "Continue")
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
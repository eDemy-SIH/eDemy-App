import 'package:flutter/material.dart';
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

  List<String> topThreeElements =['ty'];


   
    

  @override
  Widget build(BuildContext context) {

     Map<String, int> occurrences = {};

    for (String element in widget.userSelections) {
      occurrences[element] = (occurrences[element] ?? 0) + 1;
    }

    List<MapEntry<String, int>> sortedOccurrences = occurrences.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));



    List<String> topThreeElements = sortedOccurrences.take(3).map((entry) => entry.key).toList();

   
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
                      child: Text("Great, now we will ask you some questions about your preffered jobs ",style: TextStyle(fontSize: 20,fontFamily: 'FontMain' ),),
                    ),
                  ),
                ),

                
                Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (String element in topThreeElements)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        element,
                        style: TextStyle(fontSize: 18,color: Colors.black),
                      ),
                    ),
                ],
              ),

                Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: GestureDetector(
                          onTap: () => {
                              Navigator.pushNamed(context, '/skillQuestion')      
                            },
                          child: NextButton(text: "End")
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
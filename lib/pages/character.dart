

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:sih_app/db/db.dart';
import 'package:sih_app/pages/home.dart';
import 'package:sih_app/widgets/anwer_card.dart';
import 'package:sih_app/widgets/motivate.dart';
import 'package:sih_app/widgets/next_buttons.dart';
import 'package:sih_app/widgets/question_list.dart';
import 'package:velocity_x/velocity_x.dart';

class AptitudeTest extends StatefulWidget {
  const AptitudeTest({super.key});

  @override
  State<AptitudeTest> createState() => _AptitudeTestState();
}

class _AptitudeTestState extends State<AptitudeTest> {
  int ? selectedAnswerIndex;
  int questionIndex=0;
  int score=0;
  int counter=0;

  final aptitudebox = Hive.box("Aptitude_db");
  AptitudeDB db = AptitudeDB();

  // @override
  // void initState() {
  //   db.createScore();
  //   score = db.score;
  //   // TODO: implement initState
  //   super.initState();
  // }


  void goHome(){
    setState(() {
      db.score = score;
    });
    db.updateScore();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => HomePage(
          
        ),
      ),
    );
    
  }

  void pickAnswer(int vl){
    selectedAnswerIndex=vl;
    final question=questions[questionIndex];
    if(selectedAnswerIndex==question.correctAnswerIndex){
      score+=1;
    }
    setState(() {});
  }

  void goNext(){
    if(questionIndex<questions.length-1){
      questionIndex++;
      selectedAnswerIndex=null;
    }
    counter+=1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final question=questions[questionIndex];
    bool isLast=questionIndex==questions.length-1;
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


                Padding(
                  padding: EdgeInsets.only(top: 40,left: 20,right: 20),
                  child: 
                  counter==3? null: 
                  Text(
                    question.question,
                    style:  TextStyle(fontSize: 20, fontFamily: 'FontMain'),            
                  ),                 
                ),
                SizedBox(height: 30,),

                Padding(
                  padding: EdgeInsets.only(top: 30,left: 20,right: 20),

                  child:  
                  counter==3? 
                  MotivateForTest(question: 'You are doing Great', ):
              
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: question.options.length,
                    itemBuilder: (context,index){
                      return GestureDetector(
                        onTap: selectedAnswerIndex==null
                        ? () => pickAnswer(index)
                        : null,
                        child: AnswerCard(
                          question: question.options[index], 
                          isSelected: selectedAnswerIndex==index, 
                          currentIndex: index, 
                          correctAnswerIndex: question.correctAnswerIndex, 
                          selectedAnswerIndex: selectedAnswerIndex,
                        ),
                      );
                    }
                  ),
                ),

                isLast? Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: GestureDetector(
                          onTap: () => {
                            selectedAnswerIndex!=null ? 
                            goHome(): null
                            },
                          child: NextButton(text: "Submit")
                        ),
                      ),
                    ),
                  )
                :Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: GestureDetector(
                          onTap: () => {
                              
                            selectedAnswerIndex!=null ? goNext() : 
                            counter==3? goNext(): 
                            null
                            },
                          child: NextButton(text: "Next")
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
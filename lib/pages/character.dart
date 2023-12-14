import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:sih_app/db/db.dart';
import 'package:sih_app/pages/skill_start.dart';
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

  List<int> ria = [];

  final aptitudebox = Hive.box("Aptitude_db");
  AptitudeDB db = AptitudeDB();

  final startbox = Hive.box("Start_db");
  StartPointer sdb = StartPointer();


  bool testake=false;

  @override
  void initState() {
    if (startbox.get("START") == null) {
      sdb.createTheme();
      testake = sdb.startHome;
    }
    else{
      sdb.loadTheme();
      testake=sdb.startHome;
    }

    
    super.initState();
  }


  _goHome(){
    setState(() {
      sdb.startHome = !sdb.startHome;
    });
    setState(() {
      db.score = score;
      db.riasec=ria;
    });
    db.updateScore();
    db.updateArray();
    sdb.updateTheme();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => SkillStart(),
      ),
    );
    
  }

  void pickAnswer(int vl){
    selectedAnswerIndex=vl;
    final question=questions[questionIndex];
    if(selectedAnswerIndex==question.correctAnswerIndex){
      score+=1;
      ria.add(1);
    }
    else{
      ria.add(0);
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
                  counter==20? null: 
                  Text(
                    question.question,
                    style:  TextStyle(fontSize: 20, fontFamily: 'FontMain'),            
                  ),                 
                ),
                SizedBox(height: 30,),

                Padding(
                  padding: EdgeInsets.only(top: 30,left: 20,right: 20),

                  child:  
                  counter==20? 
                  MotivateForTest(question: 'You Are Doing Great ! Just A Few More Questions !', ):
              
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
                            _goHome(): null
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
                            counter==20? goNext(): 
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
import 'package:flutter/material.dart';
import 'package:sih_app/utils/routes.dart';
import 'package:sih_app/widgets/next_buttons.dart';
import 'package:velocity_x/velocity_x.dart';


class Disabilities extends StatefulWidget {
  @override
  _DisabilitiesState createState() => _DisabilitiesState();
}

class _DisabilitiesState extends State<Disabilities> {
   final formKey = GlobalKey<FormState>();
  bool isTest = false;

  // //reference the hive box
  // final mybox = Hive.box("PARQ_db");
  // //list of to do tasks
  // ParqDatabase db = ParqDatabase();

  String medicalVal = "false";


  bool isVisual = false;
  bool isCognitive= false;
  bool isMobility = false;
  bool isHearing = false;

  // @override
  // void initState() {
  //   // //first time app? default data
  //   // //if(mybox.get("MED")==null||mybox.get("HEL")==null){
  //   // //db.createInitialHealth();
  //   // //}
  //   // //already exist data
  //   // //else{
  //   // //db.loadDataHealth();
  //   // //}

  //   // //retake Test?
  //   // if (mybox.get("ISTEST") == null) {
  //   //   db.createInitialTest();
  //   //   isTest = db.isTest;
  //   // }
  //   // //test already taken
  //   // else {
  //   //   db.loadDataTest();
  //   //   isTest = db.isTest;
  //   }
  //   super.initState();
  //   // db.updateDbTest();
  //   // db.updateDbHealth();
  // }

  _saveForm() {
    // setState(() {
    //   db.medicalVal = medicalVal;
    //   db.healthVal = healthVal;
    //   db.isTest = !db.isTest;
    // });

    var form = formKey.currentState!;
    if (form.validate()) {
      form.save();
      setState(() {
        //_myActivitiesResult = _myActivities.toString();
      });
      Future.delayed(Duration(seconds: 1));
      Navigator.pushNamed(context, Myroutes.aptitudeRoute);
    }
    medicalVal = "";
    // db.updateDbTest();
    // db.updateDbHealth();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Disabilities".text.xl2.color(context.primaryColor).make(),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Container(
                    
                    //Heart Problems
                    padding: const EdgeInsets.all(5),
                    // ignore: sort_child_properties_last
                    child: Row(
                      children: [
                        Theme(
                          data: ThemeData(
                            unselectedWidgetColor: context.cardColor,
                          ),
                          child: Checkbox(
                            value: isHearing,
                            onChanged: ((value) {
                              setState(() {
                                isHearing = value!;
                                medicalVal = "true";
                              });
                            }),
                            activeColor: context.cardColor,
                          ).px12(),
                        ),
                        Text(
                          "Hearing",
                          style: TextStyle(
                            fontSize: 18,
                            color: context.primaryColor,
                            decorationThickness: 2,
                          ),
                        ),
                      ],
                    ).p8(),
                    decoration: BoxDecoration(
                        color: context.theme.splashColor,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Container(
                    
                    //Heart Problems
                    padding: const EdgeInsets.all(5),
                    // ignore: sort_child_properties_last
                    child: Row(
                      children: [
                        Theme(
                          data: ThemeData(
                            unselectedWidgetColor: context.cardColor,
                          ),
                          child: Checkbox(
                            value: isCognitive,
                            onChanged: ((value) {
                              setState(() {
                                isCognitive = value!;
                                medicalVal = "true";
                              });
                            }),
                            activeColor: context.cardColor,
                          ).px12(),
                        ),
                        Text(
                          "Cognitive",
                          style: TextStyle(
                            fontSize: 18,
                            color: context.primaryColor,
                            decorationThickness: 2,
                          ),
                        ),
                      ],
                    ).p8(),
                    decoration: BoxDecoration(
                        color: context.theme.splashColor,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Container(
                    
                    //Heart Problems
                    padding: const EdgeInsets.all(5),
                    // ignore: sort_child_properties_last
                    child: Row(
                      children: [
                        Theme(
                          data: ThemeData(
                            unselectedWidgetColor: context.cardColor,
                          ),
                          child: Checkbox(
                            value: isMobility,
                            onChanged: ((value) {
                              setState(() {
                                isMobility = value!;
                                medicalVal = "true";
                              });
                            }),
                            activeColor: context.cardColor,
                          ).px12(),
                        ),
                        Text(
                          "Mobility",
                          style: TextStyle(
                            fontSize: 18,
                            color: context.primaryColor,
                            decorationThickness: 2,
                          ),
                        ),
                      ],
                    ).p8(),
                    decoration: BoxDecoration(
                        color: context.theme.splashColor,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Container(
                    
                    //Heart Problems
                    padding: const EdgeInsets.all(5),
                    // ignore: sort_child_properties_last
                    child: Row(
                      children: [
                        Theme(
                          data: ThemeData(
                            unselectedWidgetColor: context.cardColor,
                          ),
                          child: Checkbox(
                            value: isVisual,
                            onChanged: ((value) {
                              setState(() {
                                isVisual = value!;
                                medicalVal = "true";
                              });
                            }),
                            activeColor: context.cardColor,
                          ).px12(),
                        ),
                        Text(
                          "Visual",
                          style: TextStyle(
                            fontSize: 18,
                            color: context.primaryColor,
                            decorationThickness: 2,
                          ),
                        ),
                      ],
                    ).p8(),
                    decoration: BoxDecoration(
                        color: context.theme.splashColor,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),

                const SizedBox(height:40),
              
        
                    
                Center(
                  child: Padding(
                  padding: const EdgeInsets.only(left:20,right: 20,bottom: 20),
                  child: GestureDetector(
                    onTap: () => {
                      _saveForm()
                    },
                    child: NextButton(text: "Next")
                  ),
                ),
                ),
                // GestureDetector(
                //   onTap: (() async {
                //     // final url = Uri.parse(
                //     //     'https://github.com/Remedy-Technologies/yogcare-public-info/blob/main/disclaimer.md');
                //     // launchUrl(url);
                //   }),
                //   child: const Padding(
                //     padding: EdgeInsets.only(top: 5, bottom: 2),
                //     child: Text(
                //       "DISCLAIMER",
                //       style: TextStyle(color: Colors.blue, fontSize: 12),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

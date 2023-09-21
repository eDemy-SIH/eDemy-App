import 'package:hive/hive.dart';
import 'package:sih_app/db/db.dart';
import 'package:sih_app/utils/routes.dart';
import 'package:sih_app/widgets/next_buttons.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Hobbies extends StatefulWidget {
  const Hobbies({super.key});

  @override
  State<Hobbies> createState() => _HobbiesState();
}

class _HobbiesState extends State<Hobbies> {

  int careerSelect=-1;
  
  double current_value=0;
  String val="0";

  final startbox = Hive.box("Start_db");
  StartPointer db = StartPointer();


  bool testake=false;
  TextEditingController controller=TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (startbox.get("START") == null) {
      db.createTheme();
      testake = db.startHome;
    }
    else{
      db.loadTheme();
      testake=db.startHome;
    }
    
    // TODO: implement initState
    super.initState();
  }


  _saveform(){
    setState(() {
      db.startHome = !db.startHome;
    });

    
  
      setState(() {
        //_myActivitiesResult = _myActivities.toString();
      });
      Future.delayed(Duration(seconds: 1));
      Navigator.pushNamed(context, Myroutes.aptitudeRoute);
    
    db.updateTheme();
  }

  Widget CareerButton(String assetName, int index) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          careerSelect = index;
        });
      },
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        side: BorderSide(
            width: (careerSelect == index) ? 3.0 : 0.5,
            color: (careerSelect == index)
                ? Colors.green
                : Colors.transparent),
      ),
      child: Stack(
        children: [
          Center(
            child: Image.asset(
              assetName,
              fit: BoxFit.contain,
              width: 120,
              height: 120,
            ),
          ),
          /*if (vehicleSelect == index)
            Positioned(
              top: 5,
              right: 5,
              child: Image.asset(
                "assets/images/dairy-products.png",
                width: 25,
                fit: BoxFit.cover,
              ),
            ),*/
        ],
      ),
    );
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

                  const Padding(
                    padding: EdgeInsets.only(top: 30,left: 20),
                    child: Text(
                      "Career Information",
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'FontMain'
                      ),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(top: 30,left: 20,right: 20),
                    child: Text(
                      "Which Career do you like the most ?",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'FontMain'
                      ),
                    ),
                  ),

                 Padding(
                   padding: EdgeInsets.only(top: 30,left: 30,right: 30),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        child: CareerButton("assets/images/software-engineer.png", 0),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        child: CareerButton("assets/images/civil-engineering.png", 1),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        child: CareerButton("assets/images/engineering.png", 2),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                   ),
                 ),

                 Padding(
                   padding: EdgeInsets.only(top: 30,left: 30,right: 30),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        child: CareerButton("assets/images/doctor.png", 3),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        child: CareerButton("assets/images/journalist.png", 4),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        child: CareerButton("assets/images/observation.png", 5),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                   ),
                 ),

                  Padding(
                   padding: EdgeInsets.only(top: 30,left: 30,right: 30),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        child: CareerButton("assets/images/teacher.png", 6),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        child: CareerButton("assets/images/fashion-designer.png", 7),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        child: CareerButton("assets/images/lawyer.png", 8),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                   ),
                 ),

                 Padding(
                   padding: EdgeInsets.only(top: 30,left: 30,right: 30),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        child: CareerButton("assets/images/policeman.png", 9),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        child: CareerButton("assets/images/soldier.png", 10),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        child: CareerButton("assets/images/pilot.png", 11),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                   ),
                 ),


                 
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: GestureDetector(
                          onTap: () => {
                              _saveform()
                              //Navigator.pushNamed(context, '/home')
                            },
                          child: NextButton(text: "Next")
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        );

  }
}
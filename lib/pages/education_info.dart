import 'package:sih_app/widgets/next_buttons.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class EducationInfo extends StatefulWidget {
  const EducationInfo({super.key});

  @override
  State<EducationInfo> createState() => _EducationInfoState();
}

class _EducationInfoState extends State<EducationInfo> {


  final formKey = new GlobalKey<FormState>();
  //Percentage controller
  TextEditingController percentagecontroller = TextEditingController();
  //Science controller
  TextEditingController sciencecontroller = TextEditingController();
  //Maths controller
  TextEditingController mathscontroller = TextEditingController();
  //Arts controller
  TextEditingController artscontroller = TextEditingController();


  String stream="";
  String board="";

  List<String> boardList = ["Select Board", "CBSE", "ICSE", "State Board"];
  String? selectedBoard = "Select Board";

  List<String> streamList = ["Select Stream", "Science", "Commerce", "Arts"];
  String? selectedStream = "Select Stream";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  "Education Information",
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'FontMain'
                  ),
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(top: 30,left: 20),
                child: Text(
                  "Please enter all the details to continue",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'FontMain'
                  ),
                ),
              ),

              const SizedBox(height: 30,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        DropdownButtonFormField(
                          //Board
                          value: selectedBoard,
                          items: boardList
                              .map((selectedGender) => DropdownMenuItem(
                                    value: selectedGender,
                                    child: Text(selectedGender),
                                  ))
                              .toList(),
                          onChanged: (newValue) {
                            setState((){
                              selectedBoard = newValue;
                              board=newValue!;
                              });
                          },
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                              color: context.primaryColor,
                              fontSize: 18,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icon(Icons.school),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: context.primaryColor, width: 3.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          validator: (value) {       
                            if (value == "Select Board") {
                              return "This Field Required *";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          //Email
                          controller: percentagecontroller,
                          decoration: InputDecoration(
                            labelText: "Percentage 0-100",
                            labelStyle: TextStyle(
                              color: context.primaryColor,
                              fontSize: 18,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icon(Icons.percent),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  BorderSide(color: context.primaryColor, width: 3.0),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                      
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "This Field Required *";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          //Science
                          controller: sciencecontroller,
                          decoration: InputDecoration(
                            labelText: "Marks in Science 0-100",
                            labelStyle: TextStyle(
                              color: context.primaryColor,
                              fontSize: 18,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icon(Icons.science),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  BorderSide(color: context.primaryColor, width: 3.0),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                      
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "This Field Required *";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                         TextFormField(
                          //Commerce
                          controller: mathscontroller,
                          decoration: InputDecoration(
                            labelText: "Marks in Maths 0-100",
                            labelStyle: TextStyle(
                              color: context.primaryColor,
                              fontSize: 18,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icon(Icons.leaderboard),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  BorderSide(color: context.primaryColor, width: 3.0),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                      
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "This Field Required *";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          //Arts
                          controller: artscontroller,
                          decoration: InputDecoration(
                            labelText: "Marks in Humanities 0-100",
                            labelStyle: TextStyle(
                              color: context.primaryColor,
                              fontSize: 18,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icon(Icons.map),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  BorderSide(color: context.primaryColor, width: 3.0),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                      
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "This Field Required *";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        DropdownButtonFormField(
                          //Strean
                          value: selectedStream,
                          items: streamList
                            .map((selectedGender) => DropdownMenuItem(
                                  value: selectedGender,
                                  child: Text(selectedGender),
                                ))
                            .toList(),
                          onChanged: (newValue) {
                            setState((){
                              selectedStream = newValue;
                              stream=newValue!;
                              });
                          },
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                              color: context.primaryColor,
                              fontSize: 18,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icon(Icons.book),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: context.primaryColor, width: 3.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          validator: (value) {
                            //gender=value!;
                            if (value == "Select Gender") {
                              return "This Field Required *";
                            }
                            return null;
                          },
                        ),
       
                      ],
                    ).px8(),
                  ),
                ),
              ),
            
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: GestureDetector(
                      onTap: () => {
                        Navigator.pushNamed(context, '/hobbyRoute')
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
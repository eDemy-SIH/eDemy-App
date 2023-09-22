import 'package:sih_app/widgets/next_buttons.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class StudentInfo extends StatefulWidget {
  const StudentInfo({super.key});

  @override
  State<StudentInfo> createState() => _StudentInfoState();
}

class _StudentInfoState extends State<StudentInfo> {


  final formKey = new GlobalKey<FormState>();
  //Name controller
  TextEditingController usercontroller = TextEditingController();
  //Email controller
  TextEditingController emailcontroller = TextEditingController();
  //Mobile controller
  TextEditingController mobilecontroller = TextEditingController();
  //Date controler
  TextEditingController _date = TextEditingController();
  //gender
  String gender = "";
  List<String> genderList = ["Select Gender", "Male", "Female", "Other"];
  String? selectedGender = "Select Gender";

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
                  "Student Information",
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
                        TextFormField(
                          //Full Name
                          controller: usercontroller,
                          decoration: InputDecoration(
                            labelText: "Name",
                            labelStyle: TextStyle(
                              color: context.primaryColor,
                              fontSize: 18,
                            ),
                            hintText: "Enter your full name",
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icon(Icons.person),
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
                          //keyboardType: TextInputType.number,
                      
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "This Field Required *";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          //Email
                          controller: emailcontroller,
                          decoration: InputDecoration(
                            labelText: "Email Id",
                            labelStyle: TextStyle(
                              color: context.primaryColor,
                              fontSize: 18,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icon(Icons.mail),
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
                          keyboardType: TextInputType.emailAddress,
                      
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "This Field Required *";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          //Mobile
                          controller: mobilecontroller,
                          decoration: InputDecoration(
                            labelText: "Mobile No.",
                            labelStyle: TextStyle(
                              color: context.primaryColor,
                              fontSize: 18,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icon(Icons.phone),
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
                          //date of birth
                          controller: _date,
                          decoration: InputDecoration(
                            labelText: "Year of birth",
                            labelStyle: TextStyle(
                              color: context.primaryColor,
                              fontSize: 18,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icon(Icons.calendar_month),
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
                          keyboardType: TextInputType.number,                     
                          onTap: () async {                         
                          },                     
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "This Field Required *";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        DropdownButtonFormField(
                          //Gender
                        // controller:_gender,
                          value: selectedGender,
                          items: genderList
                              .map((selectedGender) => DropdownMenuItem(
                                    value: selectedGender,
                                    child: Text(selectedGender),
                                  ))
                              .toList(),
                          onChanged: (newValue) {
                            setState((){
                              selectedGender = newValue;
                              gender=newValue!;
                              });
                          },
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                              color: context.primaryColor,
                              fontSize: 18,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icon(Icons.female),
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
                        Navigator.pushNamed(context, '/educationInfo')
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
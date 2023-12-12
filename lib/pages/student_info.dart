import 'package:hive/hive.dart';
import 'package:sih_app/db/db.dart';
import 'package:sih_app/utils/routes.dart';
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
  TextEditingController agecontroller = TextEditingController();
  //City controler
  TextEditingController citycontroller = TextEditingController();
  //state
  String state = "";
  List<String> stateList = [
    "Select State", 
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttar Pradesh",
    "Uttarakhand",
    "West Bengal",
    "Andaman and Nicobar Islands",
    "Chandigarh",
    "Dadra and Nagar Haveli",
    "Daman and Diu"
    "Lakshadweep",
    "Delhi",
    "Puducherry"
  ];
  String? selectedState = "Select State";

  final infobox = Hive.box("BasicInfo-db");
  //list of to do tasks
  BasicDB db = BasicDB();

  @override
  void initState() {
    //first time app? default data
    if (infobox.get("NAMEDB") == null) {
      db.createInitialInfo();
    }
    //already exist data
    else {
      db.loadDataInfo();
    }
    super.initState();
    
  }



  _saveForm() {
    setState(() {
      db.userName = usercontroller.text;
      db.userAge = agecontroller.text;
      db.userCity = citycontroller.text;
      db.userPhn = mobilecontroller.text;
      db.userMail=emailcontroller.text;
      db.userState=state;
    });
    if (formKey.currentState!.validate()) {
      Future.delayed(Duration(seconds: 1));
      Navigator.pushNamed(context, Myroutes.aptitudeRoute);
    }
    usercontroller.clear();
    // weightcontroller.clear();
    // heightcontroller.clear();
    // db.updateDb();
    db.updateDbInfo();
  }

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
                        const SizedBox(height: 20),
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
                        const SizedBox(height: 20),
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
                        const SizedBox(height: 20),
                        TextFormField(
                          //date of birth
                          controller: agecontroller,
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
                        const SizedBox(
                          height: 20,
                        ),
                        DropdownButtonFormField(
                          //state
                          value: selectedState,
                          items: stateList
                              .map((selectedGender) => DropdownMenuItem(
                                    value: selectedGender,
                                    child: Text(selectedGender),
                                  ))
                              .toList(),
                          onChanged: (newValue) {
                            setState((){
                              selectedState = newValue;
                              state=newValue!;
                              });
                          },
                          style: selectedState=="Select State"?
                           TextStyle(
                              color: context.primaryColor,
                              fontSize: 18
                            ):
                            TextStyle(
                              color: Colors.black,
                              fontSize: 16
                            ) ,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                              color: context.primaryColor,
                              fontSize: 18,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icon(Icons.landscape),
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
                            if (value == "Select State") {
                              return "This Field Required *";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          //citycontroller or district
                          controller: citycontroller,
                          decoration: InputDecoration(
                            labelText: "City/District",
                            labelStyle: TextStyle(
                              color: context.primaryColor,
                              fontSize: 18,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icon(Icons.location_city),
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
                          keyboardType: TextInputType.text,                     
                          onTap: () async {                         
                          },                     
                          validator: (value) {
                            if (value == null || value.isEmpty) {
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
                        _saveForm()
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
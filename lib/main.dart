import 'package:sih_app/pages/air_travel.dart';
import 'package:sih_app/pages/discover_jobs.dart';
import 'package:sih_app/pages/education_info.dart';
import 'package:sih_app/pages/aptitude.dart';
import 'package:sih_app/pages/student_info.dart';
import 'package:sih_app/pages/get_started.dart';
import 'package:sih_app/pages/home.dart';
import 'package:sih_app/pages/hobbies.dart';
import 'package:sih_app/utils/authenticate.dart';
import 'package:sih_app/utils/routes.dart';
import 'package:sih_app/utils/themes.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  
  await Hive.initFlutter();
  await Hive.openBox("Start_db");
  await Hive.openBox("Aptitude_db");
  runApp( MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  //const MyApp({super.key});

  bool isSwitched;
  MyApp({Key? key, this.isSwitched=false}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      
      themeMode: themeProvider.themeMode,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      
      //themeMode: ThemeMode.system,                       // setting the theme

      debugShowCheckedModeBanner: false,              //removes debug banner

      initialRoute: "/",                              //this route will open first
      
      routes: {                                       //creating routes for different pages in app
        "/": (context) => Authenticate(),                //main root 
        Myroutes.getStartedRoute: (context) => GetStarted(),
        Myroutes.homeRoute: (context) => HomePage(),
        Myroutes.basicInfoRoute: (context) => StudentInfo(),
        Myroutes.educationInfoRoute: (context) => EducationInfo(),
        Myroutes.hobbyRoute: (context) => Hobbies(),  
        Myroutes.airCarbonRoute: (context) => AirTravel(),  
        Myroutes.discoverRoute: (context) => DiscoverCareers(),
        Myroutes.aptitudeRoute: (context) => AptitudeTest(),
      },
    );   
  }
  );
}


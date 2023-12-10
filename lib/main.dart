import 'package:firebase_core/firebase_core.dart';
import 'package:sih_app/category%20pages/aviation.dart';
import 'package:sih_app/category%20pages/civil.dart';
import 'package:sih_app/category%20pages/education.dart';
import 'package:sih_app/category%20pages/engineering.dart';
import 'package:sih_app/category%20pages/finance.dart';
import 'package:sih_app/category%20pages/graduate.dart';
import 'package:sih_app/category%20pages/graphics.dart';
import 'package:sih_app/category%20pages/humanities.dart';
import 'package:sih_app/category%20pages/journalism.dart';
import 'package:sih_app/category%20pages/management.dart';
import 'package:sih_app/category%20pages/marketing.dart';
import 'package:sih_app/category%20pages/medicine.dart';
import 'package:sih_app/firebase_options.dart';
import 'package:sih_app/pages/aichat.dart';
import 'package:sih_app/pages/career_details.dart';
import 'package:sih_app/pages/career_list.dart';
import 'package:sih_app/pages/discover_jobs.dart';
import 'package:sih_app/pages/education_info.dart';
import 'package:sih_app/pages/character.dart';
import 'package:sih_app/pages/login.dart';
import 'package:sih_app/pages/student_info.dart';
import 'package:sih_app/pages/get_started.dart';
import 'package:sih_app/pages/home.dart';
import 'package:sih_app/pages/hobbies.dart';
import 'package:sih_app/utils/authenticate.dart';
import 'package:sih_app/utils/chat-authenticate.dart';
import 'package:sih_app/utils/routes.dart';
import 'package:sih_app/utils/themes.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{

  await Hive.initFlutter();
  await Hive.openBox("Start_db");
  await Hive.openBox("Aptitude_db");


    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    runApp(MyApp());
  
 

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
        Myroutes.discoverRoute: (context) => DiscoverCareers(),
        Myroutes.careerDetailsRoute: (context) => CareerPage(careerId: 'doctor'),

        Myroutes.engineerListRote: (context) => EngineeringListPage(),
        Myroutes.aviationListRote: (context) => AviationListPage(),
        Myroutes.civilListRote: (context) => CivilListPage(),
        Myroutes.educationListRote: (context) => EducationListPage(),
        Myroutes.financeListRote: (context) => FinanceListPage(),
        Myroutes.graduateListRote: (context) => GraduateListPage(),        
        Myroutes.graphicsListRote: (context) => GraphicsListPage(),
        Myroutes.humanitiesListRote: (context) => HumanitiesListPage(),
        Myroutes.journalismListRote: (context) => JournalismListPage(),
        Myroutes.managementListRote: (context) => ManagemensListPage(),
        Myroutes.marketingListRote: (context) => MarketingListPage(),
        Myroutes.medicineListRote: (context) => MedicineListPage(),

        Myroutes.aptitudeRoute: (context) => AptitudeTest(),
        Myroutes.aichatRoute: (context) => ChatScreen(),
        Myroutes.chatAuthRoute: (context) => AuthPage(),
        Myroutes.loginRoute: (context) => LoginPage(onTap: (){},),

      },
    );   
  }
  );
}


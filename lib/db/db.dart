import 'package:hive/hive.dart';


class StartPointer{

  bool startHome=false;

  final startbox = Hive.box("Start_db");

   //create initial data
  void createTheme() {
    startHome = false;
  }

  //load data from db
  void loadTheme() {
    startHome = startbox.get("START");
  }

  //update data
  void updateTheme() {
    startbox.put("START", startHome);
  }

}


class AptitudeDB{

  int score=0;


  var riasec=[9,8,0,0,0];

  final aptitudebox = Hive.box("Aptitude_db");

   //create initial data
  void createScore() {
    // riasec=[0,0,0,0,0];
    score = 1;
  }

  //load data from db
  void loadScore() {
    // riasec = aptitudebox.get("RIASEC");
    score = aptitudebox.get("SCORE");
  }

  //update data
  void updateScore() {
    // aptitudebox.put("RIASEC", riasec);
    aptitudebox.put("SCORE", score);
  }

  void createArray(){
    riasec=[0,0,0,0,0];
  }


  void loadArray(){
     riasec = aptitudebox.get("RIASEC");
  }

  void updateArray(){
     aptitudebox.put("RIASEC", riasec);
  }

}


class BasicDB{

  final infobox = Hive.box("BasicInfo-db");

  String userName = "yuy";
  String userAge = "";
  String userPhn = "";
  String userMail="";
  String userState = "";
  String userCity = "";

  void createInitialInfo() {
    userName = "User";
    userAge = "";
    userPhn = "";
    userMail="";
    userState = "";
    userCity = "";
  }

  //load data from db
  void loadDataInfo() {
    userName = infobox.get("NAMEDB");
    userAge = infobox.get("AGEDB");
    userPhn = infobox.get("PHNDB");
    userMail = infobox.get("MAILDB");
    userState = infobox.get("STATEDB");
    userCity = infobox.get("CITYDB");
  }

  //update data
  void updateDbInfo() {
    infobox.put("NAMEDB", userName);
    infobox.put("AGEDB", userAge);
    infobox.put("PHNDB", userPhn);
    infobox.put("MAILDB", userMail);
    infobox.put("STATEDB", userState);
    infobox.put("CITYDB", userCity);
  }
}

class RecommendedDb{

  List<String> userSelections = [];

  final startbox = Hive.box("Recommended_db");

   //create initial data
  void createRec() {
    userSelections = ['1','2','3','4'];
  }

  //load data from db
  void loadRec() {
    userSelections = startbox.get("REC");
  }

  //update data
  void updateRec() {
    startbox.put("REC", userSelections);
  }

}

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

  final aptitudebox = Hive.box("Aptitude_db");

   //create initial data
  void createScore() {
    score = 1;
  }

  //load data from db
  void loadScore() {
    score = aptitudebox.get("SCORE");
  }

  //update data
  void updateScore() {
    aptitudebox.put("SCORE", score);
  }

}


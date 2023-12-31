
import 'package:flutter/material.dart';
import 'package:sih_app/pages/skill_end.dart';
import 'package:velocity_x/velocity_x.dart';


// ignore: must_be_immutable
class SkillQuestions extends StatefulWidget {

  SkillQuestions({super.key,required this.characteristic});

  String characteristic=" ho";

  @override
  _SkillQuestionsState createState() => _SkillQuestionsState();
}

class _SkillQuestionsState extends State<SkillQuestions> {


  List<String> stringList = [
    "Radio Jockey", "Mass Communication", "Journalism", "Language", 'Civil Services', 'Doctor', 'Veterinary', 'Professor', 'Nursing', 'Counsellor', 'Special    Educator', 'Sociology', 'Home Science', 'Teacher', 'Public Relations', 'Cabin Crew', 'Flight Attendant', 'Public Administration', 'Political Science', 'International Relations', 'Sports Management'
  ];

  Map<String, String> stringMap = {
  "Business Administration":'businessadministration',
  "Sports Management":"sportmanagement",
  "Project Management":"projectm",
  "Event Management":"eventm",
  "Fashion Business Management":"fash",
  "Computer Science and Engineering":"cse",
  "Artificial Intelligence & Machine Learning":"aiml",
  "Electronics and Communication Engineering":"ece",
  "Electrical Engineering":"ee",
  "Electrical and Instrumentation Engineering":"eie",
  "Aerospace Engineering":"aero",
  "Mechanical Engineering":"mech",
  "Civil Engineering":"civil",
  "Doctor":"doctor",
  "Surgeon":"surgeon",
  "Pathology":"pathology",
  "Veterinary":"veterinary",
  "Orthopaedic":"orthopaedic",
  "Ophthalmology":"optha",
  "Nursing":"nursing",
  "Fashion Designer":"fashiondesigner",
  "UI/UX Designer":"uiux",
  "Graphic Designer":"graphic",
  "Interior Designer":"interior",
  "Jewellery Designer":"jewellery",
  "Zoology":"zoo",
  "Botany":"botany",
  "Physics Hons.":"phyhon",
  "Chemistry Hons.":"chemhon",
  "Radio Jockey":"rj",
  "Entrepreneurship":"ent",
  "Chartered Accountant":"ca",
  "Chartered Market Technician":"cmt",
  "Chartered Financial Analyst":"cfa",
  "Cost Accountant":"coa",
  "Certified Public Accountant":"cpa",
  "Counsellor":"counsellor",
  "Teacher":"teacher",
  "Special Educator":"speced",
  "Professor":"prof",
  "Civil Services":"civils",
  "Railway Services":"rails",
  "Customs and Excises":"ces",
  "Income Tax Service":"its",
  "Indian Economic System":"iess",
  "Mass Communication":"mascom",
  "Public Relations":"pr",
  "Writer, Editor, Copywriter":"writer",
  "Broadcasting":"Broadcasting",
  "Journalism" : "journalism",
  "Digital Marketing":"digi",
  "Advertisement":"ad",
  "Sales":"sales",
  "Product Designer":"prod",
  "Marketing":"mark",
  "Air Traffic Controller":"atc",
  "Aircraft Maintenance Engineer": "ame",
  "Flight Attendant" : "fa",
  "Cabin Crew": "cc",
  "Pilot" : "pilot",
  "Archaeology":"arch",
  "Public Administration": "PA",
  "Home Science": "HomeSc",
  "Geography": "Geo",
  "Political Science": "PoliSc",
  "Language": "lang",
  "Sociology": "sociology",
  "International Relations": "intreln",
  };

  List<String> combinations = [];
  List<String> userSelections = [];

  List<String> finlSelections = [];
  int currentIndex = 1;
  int totalIndex=20;
  int selected=0;


  List<String> allCombinations = [];

  bool isAnswer=true;

  @override
  void initState() {
    getList(widget.characteristic);
    super.initState();
    combinations = generateAllCombinations(stringList);
    combinations.shuffle(); // Randomly shuffle the combinations
  }

  void getList(String char){

    print(char);

    if(char=='A'){
        stringList = [
          "Graphic Designer", "Fashion Business Management", "Fashion Designer", "Interior Designer", "Jewellery Designer", "Broadcasting", "Advertisement", "UI/UX Designer", "Writer, Editor, Copywriter", "Product Designer", "Radio Jockey", "Mass Communication", "Journalism", "Language", 'Digital Marketing', 'Archaeology', 'Home Science'
        ];    
    }
    if(char=='C'){
      stringList = [
        'Customs and Excises', 'Chartered Accountant', 'Chartered Market Technician', 'Chartered Financial Analyst', 'Cost Accountant', 'Certified Public Accountant', 'Income Tax Service', 'Business Administration', 'Project Management', 'Event Management', 'Entrepreneurship', 'Sales', 'Marketing', 'Digital Marketing', 'Civil Services'
      ];
    }
    if(char=='E'){
      stringList = [
        'Business Administration', 'Project Management', 'Event Management', 'Entrepreneurship', 'Sales', 'Marketing', 'Digital Marketing', 'Customs and Excises', 'Civil Services', "Fashion Business Management", "Fashion Designer", "Interior Designer", "Jewellery Designer", "Broadcasting", "Advertisement", 'Indian Economic System', "Railway Services", "Pilot", 'Teacher', 'Public Relations', 'Cabin Crew', 'Flight Attendant', 'Public Administration', 'Political Science', 'International Relations', 'Sports Management'
      ];    
    }

    if(char=='I'){
      stringList = [
        "Artificial Intelligence & Machine Learning", "Pathology", "Ophthalmology", "Zoology", "Botany", "Physics Hons.", "Chemistry Hons.", "UI/UX Designer", "Writer, Editor, Copywriter", "Product Designer", 'Archaeology', 'Chartered Accountant', 'Chartered Market Technician', 'Chartered Financial Analyst', 'Cost Accountant', 'Certified Public Accountant', 'Income Tax Service', 'Indian Economic System', 'Computer Science and Engineering', 'Surgeon', 'Orthopaedic', 'Geography', 'Doctor', 'Veterinary', 'Professor', "Electrical and Instrumentation Engineering", "Air Traffic Controller", "Aircraft Maintenance Engineer"
      ];    
    }
    if(char=='R'){
      stringList = [
        'Artificial Intelligence & Machine Learning', 'Computer Science and Engineering', 'Surgeon', 'Geography', "Electronics and Communication Engineering", "Electrical Engineering", "Aerospace Engineering", "Mechanical Engineering", "Civil Engineering", "Railway Services", "Pilot", "Electrical and Instrumentation Engineering", "Air Traffic Controller", "Aircraft Maintenance Engineer"
      ];    
    }
    if(char=='S'){
      stringList = [
        "Radio Jockey", "Mass Communication", "Journalism", "Language", 'Civil Services', 'Doctor', 'Veterinary', 'Professor', 'Nursing', 'Counsellor', 'Special Educator', 'Sociology', 'Home Science', 'Teacher', 'Public Relations', 'Cabin Crew', 'Flight Attendant', 'Public Administration', 'Political Science', 'International Relations', 'Sports Management'
      ];    
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text("Would You Rather Pursue :", style: TextStyle(fontSize: 24,fontFamily: 'FontMain' ),),
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GestureDetector(
                      onTap: () => handleElementTap(combinations[currentIndex].split(' - ')[0]),
                      child:  Container(
                        height: 60,
                        width: double.infinity,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color:context.cardColor,
                          borderRadius: BorderRadius.circular(10), 
                        ),
                        child: Center(
                          child: Text(
                            combinations[currentIndex].split(' - ')[0],
                            style: TextStyle(
                              fontSize: 16,
                              color: context.theme.splashColor,
                              fontFamily: 'FontMain' 
                            ),
                          ),
                        ),                                                
                      )
                    ),
                  ),
                  const SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GestureDetector(
                      onTap: () => handleElementTap(combinations[currentIndex].split(' - ')[1]),
                      child:  Container(
                        height: 60,
                        width: double.infinity,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color:context.cardColor,
                          borderRadius: BorderRadius.circular(10), 
                        ),
                        child: Center(
                          child: Text(
                            combinations[currentIndex].split(' - ')[1],
                            style: TextStyle(
                              fontSize: 16,
                              color: context.theme.splashColor,
                              fontFamily: 'FontMain' 
                            ),
                          ),
                        ),                                                
                      )
                    ),
                  ),
                  const SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GestureDetector(
                      onTap: () {handleNone();},
                      child:  Container(
                        height: 60,
                        width: double.infinity,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color:context.cardColor,
                          borderRadius: BorderRadius.circular(10), 
                        ),
                        child: Center(
                          child: Text(
                            "None",
                            style: TextStyle(
                              fontSize: 16,
                              color: context.theme.splashColor,
                              fontFamily: 'FontMain' 
                            ),
                          ),
                        ),                                                
                      )
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Divider(height: 1),
          // Container(
          //   padding: EdgeInsets.all(16.0),
          //   child: Text(
          //     'Selected: $selected/20',
          //     style: TextStyle(fontWeight: FontWeight.bold),
          //   ),
          // ),
        

        ],
      ),
    );
  }

  void handleElementTap(String selectedElement) {
    selected++;
    String selectedId = stringMap[selectedElement] ?? '';
    // Add selected element to the userSelections list
    setState(() {
      userSelections.add(selectedId);
    });

    if (finlSelections.length==4) {
      print(finlSelections);
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  SkillEnd(userSelections: finlSelections)),
        );
      });
    }
    else{

      if (currentIndex >= combinations.length) {
        currentIndex = 0;
      }
      currentIndex++;
      // print(userSelections);
      
      Map<String, int> occurrences = {};

      for (String element in userSelections) {
        occurrences[element] = (occurrences[element] ?? 0) + 1;
      }


      List<MapEntry<String, int>> sortedOccurrences = occurrences.entries.toList()
    ..sort((a, b) => b.value.compareTo(a.value));

      int desiredOccurrences = 3;

      print("Elements with $desiredOccurrences occurrences:");
      for (var entry in sortedOccurrences) {
        print("helooooooooooooooooooooooo");
        if (entry.value == desiredOccurrences) {
          setState(() {
            finlSelections.add(entry.key);
            finlSelections=finlSelections.toSet().toList();

            for(String i in finlSelections){
              allCombinations.removeWhere((element) => element.contains(i));
            }
          });
          
        }
      }
    }
    
  }

  void handleNone(){
     setState(() {
        currentIndex++;
        totalIndex++;
      });
  }

  List<String> generateAllCombinations(List<String> strings) {
    

    for (int i = 0; i < strings.length - 1; i++) {
      for (int j = i + 1; j < strings.length; j++) {
        allCombinations.add('${strings[i]} - ${strings[j]}');
      }
    }

    return allCombinations;
  }
}
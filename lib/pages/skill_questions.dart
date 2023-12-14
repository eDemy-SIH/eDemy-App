import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sih_app/pages/skill_end.dart';
import 'package:velocity_x/velocity_x.dart';


class SkillQuestions extends StatefulWidget {
  @override
  _SkillQuestionsState createState() => _SkillQuestionsState();
}

class _SkillQuestionsState extends State<SkillQuestions> {

  List<String> stringList = [
    "Graphic Designer", "Fashion Business Management", "Fashion Designer", "Interior Designer", "Jewellery Designer", "Broadcasting", "Advertisement", "UI/UX Designer", "Writer, Editor, Copywriter", "Product Designer", "Radio Jockey", "Mass Communication", "Journalism", "Language", 'Digital Marketing', 'Archaeology', 'Home Science'
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
  "Aircraft Maintanence Engineer": "ame",
  "Cabin Crew": "cc",
  "Flight Attendant" : "fa",
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
  int currentIndex = 0;

  bool isAnswer=true;

  @override
  void initState() {
    super.initState();
    combinations = generateAllCombinations(stringList);
    combinations.shuffle(); // Randomly shuffle the combinations
    combinations = combinations.take(15).toList();
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
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Text("Would you rather chosse"),
                  GestureDetector(
                    onTap: () => handleElementTap(combinations[currentIndex].split(' - ')[0]),
                    child:  Container(
                      height: 60,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: 
                              // ? const Color.fromARGB(255, 96, 233, 100)
                              isAnswer
                                  ? const Color.fromARGB(255, 96, 233, 100)
                                  : Colors.white,
                          width: 3,
                        ),    
                      ),
                      child: Row(
                        children: [
                         
                             Text(
                              combinations[currentIndex].split(' - ')[0],
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                         
                          const SizedBox(height: 10),
                        ],
                      ),
                    )
                  ),
                  const SizedBox(height: 20,),
                  GestureDetector(
                    onTap: () => handleElementTap(combinations[currentIndex].split(' - ')[1]),
                    child:  Container(
                      height: 60,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: 
                              // ? const Color.fromARGB(255, 96, 233, 100)
                              isAnswer
                                  ? const Color.fromARGB(255, 96, 233, 100)
                                  : Colors.white,
                          width: 3,
                        ),
                        
                      ),
                      child: Row(
                        children: [
                          
                            Text(
                              combinations[currentIndex].split(' - ')[1],
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(height: 1),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Selected Elements: ${userSelections.length}/15',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        

        ],
      ),
    );
  }

  void handleElementTap(String selectedElement) {
    String selectedId = stringMap[selectedElement] ?? '';
    // Add selected element to the userSelections list
    setState(() {
      userSelections.add(selectedId);
    });

    // Move to the next combination
    if (currentIndex < combinations.length - 1) {
      setState(() {
        currentIndex++;
      });
    } else {
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  SkillEnd(userSelections: userSelections,)),
        );
      });
    }
  }

  List<String> generateAllCombinations(List<String> strings) {
    List<String> allCombinations = [];

    for (int i = 0; i < strings.length - 1; i++) {
      for (int j = i + 1; j < strings.length; j++) {
        allCombinations.add('${strings[i]} - ${strings[j]}');
      }
    }

    return allCombinations;
  }
}
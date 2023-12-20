import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Add this import for rootBundle
import 'dart:convert';

import 'package:velocity_x/velocity_x.dart';

class CareerData {
  final String careerId;
  final String img1;
  final String alt1;
  final String title;
  final String catDir;
  final String cat;
  final String duration;
  final String p1_1;
  final String p1_2;
  final String desc;
  final List<String> skills;
  final List<String> educ;
  final List<String> oppL;
  final List<String> oppR;
  final List<Map<String, String>> insti;
  final List<String> pros;
  final List<String> cons;

  CareerData({
    required this.careerId,
    required this.img1,
    required this.alt1,
    required this.title,
    required this.catDir,
    required this.cat,
    required this.duration,
    required this.p1_1,
    required this.p1_2,
    required this.desc,
    required this.skills,
    required this.educ,
    required this.oppL,
    required this.oppR,
    required this.insti,
    required this.pros,
    required this.cons,
  });

  factory CareerData.fromJson(Map<String, dynamic> json) {
    return CareerData(
      careerId: json['careerid'],
      img1: json['img1'],
      alt1: json['alt1'],
      title: json['title'],
      catDir: json['cat_dir'],
      cat: json['cat'],
      duration: json['duration'],
      p1_1: json['p1_1'],
      p1_2: json['p1_2'],
      desc: json['desc'],
      skills: List<String>.from(json['skills']),
      educ: List<String>.from(json['educ']),
      oppL: List<String>.from(json['opp_l']),
      oppR: List<String>.from(json['opp_r']),
      insti: (json['insti'] as List<dynamic>)
        .map((item) => Map<String, String>.from(item))
        .toList(),
      pros: List<String>.from(json['pros']),
      cons: List<String>.from(json['cons']),
    );
  }
}

class CareerDataProvider {
  static Future<CareerData> getCareerData(String careerId) async {
    String jsonData = await rootBundle.loadString('assets/files/careers.json');
    Map<String, dynamic> careerJson = json.decode(jsonData);
    Map<String, dynamic> careerDataJson = careerJson['sections']
        .firstWhere((section) => section['careerid'] == careerId, orElse: () => {});

    if (careerDataJson.isEmpty) {
      throw Exception("Career data not found for ID: $careerId");
    }

    return CareerData.fromJson(careerDataJson);
  }
}

class CareerPage extends StatefulWidget {
  final String careerId;

  CareerPage({required this.careerId});

  @override
  _CareerPageState createState() => _CareerPageState();
}

class _CareerPageState extends State<CareerPage> {
  late Future<CareerData> futureCareerData;

  @override
  void initState() {
    super.initState();
    futureCareerData = CareerDataProvider.getCareerData(widget.careerId);
  }

    @override
  Widget build(BuildContext context) {
    return FutureBuilder<CareerData>(
      future: futureCareerData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
        return Scaffold(body: Center(child: CircularProgressIndicator())); // or any other loading indicator
      } else if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      } else if (!snapshot.hasData) {
        return Text('Data not available');
      }
      else{     
        CareerData careerData = snapshot.data!;
        return Scaffold(  
        backgroundColor: context.canvasColor,
        appBar: AppBar(
          title: Text(careerData.title,style: TextStyle(color: context.cardColor),),
        ),

        body: SingleChildScrollView(
          
          child: Center(
            
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: 16),
                  Container(
                    width: 130,
                    decoration: BoxDecoration(
                      color: context.cardColor,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Duration:",style: TextStyle(color: context.theme.splashColor),),
                          Text(careerData.duration,style: TextStyle(color: context.theme.splashColor),)
                        ],
                        
                      ),
                    )
                  ),
                  SizedBox(height: 16),
                  Text("What Makes This Career Worth Pursuing?",style: TextStyle(fontSize: 20),),
                  SizedBox(height: 8),
                  Text(careerData.p1_1),
                  SizedBox(height: 8),
                  Text(careerData.p1_2),

                  SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.network(
                        careerData.img1,
                        fit: BoxFit.cover,
                      ),
                    )
                  ),

                  SizedBox(height: 18),
                  Text("Description",style: TextStyle(fontSize: 20),),
                  SizedBox(height: 8),
                  Text(careerData.desc),
                  SizedBox(height: 16),
                  Text("Skills You Need",style: TextStyle(fontSize: 20),),
                  SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: careerData.cons.map(
                      (skill) => Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Icon(Icons.fiber_manual_record, color: context.cardColor,size: 10,),
                          ),
                          SizedBox(width: 8),
                          Expanded(child: Text(skill)),
                        ],
                      ),
                    ).toList(),
                  ),
                  SizedBox(height: 16),
                  Text("How To Pursue",style: TextStyle(fontSize: 20),),
                  SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: careerData.cons.map(
                      (edu) => Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Icon(Icons.fiber_manual_record, color: context.cardColor,size: 10,),
                          ),
                          SizedBox(width: 8),
                          Expanded(child: Text(edu)),
                        ],
                      ),
                    ).toList(),
                  ),
                  SizedBox(height: 16),


                  Text("Job Opportunities",style: TextStyle(fontSize: 20),),
                  SizedBox(height: 8),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildOpportunityColumn(careerData.oppL),
                      _buildOpportunityColumn(careerData.oppR),
                    ],
                  ),
                
                  SizedBox(height: 16),

                  Text("Top Indian Institutes",style: TextStyle(fontSize: 20),),
                  SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: careerData.insti.map(
                      (institute) => Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Icon(Icons.fiber_manual_record, size: 10, color: context.cardColor),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(institute['name'] ?? ''),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ).toList(),
                  ),
                  SizedBox(height: 16),

                  Text("Pros",style: TextStyle(fontSize: 18),),
                  SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: careerData.cons.map(
                      (pro) => Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Icon(Icons.fiber_manual_record, color: context.cardColor,size: 10,),
                          ),
                          SizedBox(width: 8),
                          Expanded(child: Text(pro)),
                        ],
                      ),
                    ).toList(),
                  ),
                  SizedBox(height: 16),

                  Text("Cons",style: TextStyle(fontSize: 20),),
                  SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: careerData.cons.map(
                      (con) => Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Icon(Icons.fiber_manual_record, color: context.cardColor,size: 10,),
                          ),
                          SizedBox(width: 8),
                          Expanded(child: Text(con)),
                        ],
                      ),
                    ).toList(),
                  ),
                ],
              ),
            )
                
              
            ),
          ),
        );
      }
        
      }
      
    );
  }



    Widget _buildOpportunityColumn(List<String?> opportunities) {
    return Container(
      width: 170,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: opportunities.map((opp) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top:4),
                child: Icon(Icons.check_circle, size: 15, color: context.cardColor),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Text(opp ?? ''),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

}



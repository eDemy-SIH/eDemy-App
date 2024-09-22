import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sih_app/pages/career_details.dart';
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


class CareerCard extends StatefulWidget {
  final String id;
  final String imagePath;
  final int col_index;
  CareerCard({super.key, required this.id, required this.col_index, required this.imagePath});

  @override
  State<CareerCard> createState() => _CareerCardState();
}

class _CareerCardState extends State<CareerCard> {

  late Future<CareerData> futureCareerData;

  @override
  void initState() {
    super.initState();
    futureCareerData = CareerDataProvider.getCareerData(widget.id);
  }



  // List<Color> colors = [
  //   Color.fromRGBO(225, 190, 221, 1), 
  //   const Color.fromARGB(255, 238, 204, 103), 
  //   Color.fromARGB(185, 236, 80, 88)];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
      decoration: BoxDecoration(
        color: context.theme.splashColor,
        borderRadius: BorderRadius.circular(20)
      ),

      child: FutureBuilder<CareerData>(
        future: futureCareerData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData) {
            return Text('No data found');
          } else {
            CareerData careerData = snapshot.data!;
      
        
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    careerData.img1,
                    fit: BoxFit.cover,
                    width: 90,
                    height: 90,
                    color: Color.fromARGB(59, 68, 60, 60),
                    colorBlendMode: BlendMode.darken,
                  ),
                ),
                
                SizedBox(width: 30,),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [    
                        Padding(
                          padding: const EdgeInsets.only(left:10),
                          child: Container(
                            width: 200,
                            child: Text(
                              careerData.title,
                              style: TextStyle(fontSize: 18, fontFamily: 'FontMain'),
                            ),
                          ),
                        ),                 
                        SizedBox(height: 20,),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CareerPage(careerId: careerData.careerId),
                              ),
                            );
                          },
                          child: Container(
                            height: 35,
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: context.cardColor
                            ),
                            child: const Center(
                              child: Text(
                                "View More",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14
                                ),
                              ),
                            ),                     
                          ),
                        )
                      ],
                  ),
                ),
              ],
            );
        }})
      );
    
  }
}
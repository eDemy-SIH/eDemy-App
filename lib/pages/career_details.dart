import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Add this import for rootBundle
import 'dart:convert';

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Career Page'),
      ),
      body: Center(
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
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    careerData.title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  // Display other information as needed
                  Text(careerData.desc),
                  // ... Add more widgets to display other information
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
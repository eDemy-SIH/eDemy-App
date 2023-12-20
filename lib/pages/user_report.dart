import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:sih_app/db/db.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:printing/printing.dart';

import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;


class UserReport extends StatefulWidget {
  @override
  State<UserReport> createState() => _UserReportState();
}

class _UserReportState extends State<UserReport> {

  final GlobalKey<State<StatefulWidget>> _globalKey = GlobalKey();

  final infobox = Hive.box("BasicInfo-db");
  //list of to do tasks
  BasicDB sdb = BasicDB();

    final recommendedbox = Hive.box("Recommended_db");
  RecommendedDb rdb = RecommendedDb();

  String userName = "";
  String userAge = "";
  String userPhn = "";
  String userMail="";
  String userState = "";
  String userCity = "";

  var array=[1,2,3];
  String _prediction=" ";
  List<String> recommended = ['phyhon','doctor','civils','atc'];
  String characteristic="o";

  String charTrait="";
  String charData="";

  String pdfrecom ="";

  final aptitudebox = Hive.box("Aptitude_db");
  AptitudeDB db = AptitudeDB();

  @override
  void initState() {

    if (infobox.get("NAMEDB") == null) {
      sdb.createInitialInfo();
      userName=sdb.userName;
      userAge=sdb.userAge;
      userPhn=sdb.userPhn;
      userMail=sdb.userMail;
      userState=sdb.userState;
      userCity=sdb.userCity;
    }
    //already exist data
    else {
      sdb.loadDataInfo();
      userName=sdb.userName;
      userAge=sdb.userAge;
      userPhn=sdb.userPhn;
      userMail=sdb.userMail;
      userState=sdb.userState;
      userCity=sdb.userCity;
      
    }

    if (recommendedbox.get("REC") == null) {
      rdb.createRec();
      recommended = rdb.userSelections;
    }
    else{
      rdb.loadRec();
      recommended=rdb.userSelections;
    } 

    if (aptitudebox.get("RIASEC") == null) {
      db.createArray();
      array = db.riasec;
    }
    else{
      db.loadArray();
      array=db.riasec;
    }



    // sdb.updateDbInfo();
    // TODO: implement initState
    super.initState();
    _getPrediction();
  }



    void _getPrediction() async {
    String myString = array.join('');
    String inputString = myString;

    if (inputString.isEmpty) {
      
      setState(() {
        _prediction = 'Input is empty';
      });
      return;
    }
    
    final response = await http.get(Uri.parse('https://model-server-mxrg.onrender.com/$inputString'));
    print(response);
    print("Helloooo:$response.body");
    if (response.statusCode == 200) {
      setState(() {
        
        _prediction = response.body;
        print(_prediction);
        showCharacter(_prediction);

        String jsonString = _prediction;

        // Parse the JSON string
        Map<String, dynamic> jsonMap = json.decode(jsonString);

       
        String predictionValue = jsonMap['prediction'];

        characteristic=predictionValue;

        print(predictionValue);

      });
    } else {
      setState(() {
        _prediction = 'Error: ${response.statusCode}';
      });
    }
  }

    void showCharacter(_prediction){
    String jsonString = _prediction;

    // Parse the JSON string
    Map<String, dynamic> jsonMap = json.decode(jsonString);

   
    String predictionValue = jsonMap['prediction'];

    print(predictionValue);

    setState(() {
       characteristic=predictionValue;
    });
  }

  _getTrait(String trait){

    if(trait=='A'){
      return "Artistic";
    }
    else if(trait=='C'){
      return "Conventional";
    }
    else if(trait=='I'){
      return "Investigative";
    }
    else if(trait=='S'){
      return "Social";
    }
    else if(trait=='E'){
      return "Enterprising";
    }
    else{
      return "Realistic";
    }
    
  }

    _getDesc(String trait){

    if(trait=='A'){
      return "Artistic individuals are creative, imaginative, and express themselves through various forms of art. They enjoy activities like painting, writing, music, and often find fulfillment in careers such as graphic design, writing, or performing arts.";
    }
    else if(trait=='C'){
      return " Conventional individuals are organized, detail-oriented, and prefer structured environments. They excel in tasks that involve data, numbers, and precision, making them well-suited for roles in finance, administration, or data analysis.";
    }
    else if(trait=='I'){
      return "Investigative personalities are curious, analytical, and enjoy solving problems through research and analysis. They thrive in intellectual activities and often pursue careers in science, research, or information technology.";
    }
    else if(trait=='S'){
      return "People with a social personality are empathetic, sociable, and enjoy working with others to help and support them. They are often drawn to careers in teaching, counseling, healthcare, or social work.";
    }
    else if(trait=='E'){
      return " Enterprising personalities are ambitious, persuasive, and enjoy taking on leadership roles. They thrive in competitive environments and may pursue careers in sales, marketing, management, or entrepreneurship.";
    }
    else{
      return "Individuals with a realistic personality are practical, hands-on, and enjoy working with tools, machines, or physical activities. They often prefer concrete tasks and may excel in occupations such as mechanics, construction, or athletics.";
    }
    
  }


  @override
  Widget build(BuildContext context) {
    
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



  List<String> keys = recommended
        .map((value) => getKeyFromValue(stringMap, value))
        .where((key) => key != null)
        .toList();

  String jobs = keys.join('\n');

    return Scaffold(

      backgroundColor: context.canvasColor,
      appBar: AppBar(
          
        ),
      body: SingleChildScrollView(
        
        child: Padding(
          key:_globalKey,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  userName,
                  style: TextStyle(
                    fontSize: 30, 
                    fontWeight: FontWeight.bold,
                    shadows: [
                    Shadow(
                      color: Color.fromARGB(100, 13, 218, 88),      // Choose the color of the shadow
                      blurRadius: 2.0,          // Adjust the blur radius for the shadow effect
                      offset: Offset(2.0, 2.0), // Set the horizontal and vertical offset for the shadow
                    ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),
              Text("Personal Information"),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Padding(
                        padding: const EdgeInsets.only(left: 12,top: 15,right: 12,bottom: 5),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.email,
                              color: context.cardColor ,
                              size: 22,  
                            ),
                            const SizedBox(width: 15,),
                            Text(
                              "Email",
                              style: TextStyle(fontSize: 14),    
                            ),
                            Spacer(),
                            Text(
                              userMail,
                              style: TextStyle(fontSize: 16),    
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12,top: 5,right: 12,bottom: 5),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.phone,
                              color: context.cardColor ,
                              size: 22,  
                            ),
                            const SizedBox(width: 15,),
                            Text(
                              "Phone",
                              style: TextStyle(fontSize: 14),    
                            ),
                            Spacer(),
                            Text(
                              userPhn,
                              style: TextStyle(fontSize: 16),    
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12,top: 5,right: 12,bottom: 5),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.calendar_month,
                              color: context.cardColor ,
                              size: 22,  
                            ),
                            const SizedBox(width: 15,),
                            Text(
                              "YOB",
                              style: TextStyle(fontSize: 14),    
                            ),
                            Spacer(),
                            Text(
                              userAge,
                              style: TextStyle(fontSize: 16),    
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12,top: 5,right: 12,bottom: 5),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.landscape,
                              color: context.cardColor ,
                              size: 22,  
                            ),
                            const SizedBox(width: 15,),
                            Text(
                              "State",
                              style: TextStyle(fontSize: 14),    
                            ),
                            Spacer(),
                            Text(
                              userState,
                              style: TextStyle(fontSize: 16),    
                            ),
                          ],
                        ),
                      ),
                       const Divider(
                        thickness: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12,top: 5,right: 12,bottom: 15),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.email,
                              color: context.cardColor ,
                              size: 22,  
                            ),
                            const SizedBox(width: 15,),
                            Text(
                              "City",
                              style: TextStyle(fontSize: 14),    
                            ),
                            Spacer(),
                            Text(
                              userCity,
                              style: TextStyle(fontSize: 16),    
                            ),
                          ],
                        ),
                      ),
                    ]
                    
                  ),
                ),
              ),
      
              SizedBox(height: 30),
      
              
            Text("Charaterestic Information"),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Padding(
                        padding: const EdgeInsets.only(left: 12,top: 15,right: 12,bottom: 5),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Dominant Character Trait",
                              style: TextStyle(fontSize: 16),    
                            ),
                            Spacer(),
                            Text(
                              _getTrait(characteristic),
                              style: TextStyle(fontSize: 16),    
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 2,
                      ),
      
                      Padding(
                        padding: const EdgeInsets.only(left: 12,top: 5,right: 12,bottom: 5),
                        child: Text(
                          "Description:",
                          style: TextStyle(fontSize: 16),    
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.only(left: 12,top: 0,right: 12,bottom: 5),
                        child: Text(
                          _getDesc(characteristic),
                          style: TextStyle(fontSize: 14),    
                        ),
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12,top: 5,right: 12,bottom: 5),
                        child: Text(
                          "Suitable Jobs:",
                          style: TextStyle(fontSize: 16),    
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.only(left: 12,top: 0,right: 12,bottom: 15),
                        child: Text(
                          "$jobs",
                          style: TextStyle(fontSize: 14),    
                        ),
                      ),       
                    ]
                    
                  ),
                ),
              ),

              GestureDetector(
                  onTap: () async{
                    setState(() {
                       pdfrecom=jobs;
                    });
                   captureAndSharePDF();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5, top: 20,bottom: 10),
                    child: Container(
                      height: 75,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: context.cardColor
                      ),
                      child: const Row(
                        children: [
                          SizedBox(width: 10,),
                          Expanded(
                            child: Center(                
                              child: Text(
                                "Download Report",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),              
                            ),
                          ),
                        ],
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


  Future<void> captureAndSharePDF() async {
    final pdf = await generatePDF();
    final output = await getTemporaryDirectory();
    final file = File('${output.path}/captured_page.pdf');
    await file.writeAsBytes(pdf);

    Printing.sharePdf(bytes: pdf, filename: 'eDemy_career_report.pdf');
  }

  Future<Uint8List> generatePDF() async {
    final pdf = pw.Document();

    pdf.addPage(pw.Page(
      margin: pw.EdgeInsets.zero,
      build: (pw.Context context) {
        return  pw.Container(
          width: double.infinity,
          decoration: const pw.BoxDecoration(
            color: PdfColor(0.92, 0.92, 0.92, 1)
          ),

            child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [

              pw.Container(
                width: double.infinity,
                height: 110,
                decoration: pw.BoxDecoration(
                  color: const PdfColor(0, 0.8, 0.6, 1),
                ),
                child: pw.Center(
                  child: pw.Text("eDemy Career Report",style: pw.TextStyle(color:  PdfColor(1, 1, 1, 1),fontSize: 30) )
                )              
              ),

             pw.Padding(
              padding: const pw.EdgeInsets.all(30.0),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.SizedBox(height: 15),
                  pw.Text(userName,style: pw.TextStyle( fontSize: 30)),
                  pw.SizedBox(height: 10),
                  pw.Text("Personal Information"),
                  pw.SizedBox(height: 10),
                  pw.Container(
                    width: double.infinity,
                    decoration: pw.BoxDecoration(
                      color: const PdfColor(1, 1, 1, 1),
                      borderRadius: pw.BorderRadius.circular(10)
                    ),
                    child: pw.Padding(
                      padding: const pw.EdgeInsets.all(0.0),
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children:[
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(left: 12,top: 15,right: 12,bottom: 5),
                            child: pw.Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // pw.Icon(
                                //   pw.Icons.email,
                                //   color: context.cardColor ,
                                //   size: 22,  
                                // ),
                                pw.SizedBox(width: 15,),
                                pw.Text(
                                  "Email",
                                  style: pw.TextStyle(fontSize: 14),    
                                ),
                                pw.Spacer(),
                                pw.Text(
                                  userMail,
                                  style: pw.TextStyle(fontSize: 16),    
                                ),
                              ],
                            ),
                          ),
                          pw.Divider(
                            thickness: 2,
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(left: 12,top: 5,right: 12,bottom: 5),
                            child: pw.Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Icon(
                                //   Icons.phone,
                                //   color: context.cardColor ,
                                //   size: 22,  
                                // ),
                                pw.SizedBox(width: 15,),
                                pw.Text(
                                  "Phone",
                                  style: pw.TextStyle(fontSize: 14),    
                                ),
                                pw.Spacer(),
                                pw.Text(
                                  userPhn,
                                  style: pw.TextStyle(fontSize: 16),    
                                ),
                              ],
                            ),
                          ),
                          pw.Divider(
                            thickness: 2,
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(left: 12,top: 5,right: 12,bottom: 5),
                            child: pw.Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Icon(
                                //   Icons.calendar_month,
                                //   color: context.cardColor ,
                                //   size: 22,  
                                // ),
                                pw.SizedBox(width: 15,),
                                pw.Text(
                                  "YOB",
                                  style: pw.TextStyle(fontSize: 14),    
                                ),
                                pw.Spacer(),
                                pw.Text(
                                  userAge,
                                  style: pw.TextStyle(fontSize: 16),    
                                ),
                              ],
                            ),
                          ),
                          pw.Divider(
                            thickness: 2,
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(left: 12,top: 5,right: 12,bottom: 5),
                            child: pw.Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Icon(
                                //   Icons.landscape,
                                //   color: context.cardColor ,
                                //   size: 22,  
                                // ),
                                pw.SizedBox(width: 15,),
                                pw.Text(
                                  "State",
                                  style: pw.TextStyle(fontSize: 14),    
                                ),
                                pw.Spacer(),
                                pw.Text(
                                  userState,
                                  style: pw.TextStyle(fontSize: 16),    
                                ),
                              ],
                            ),
                          ),
                          pw.Divider(
                            thickness: 2,
                          ),
                          pw.Padding(
                            padding: pw.EdgeInsets.only(left: 12,top: 5,right: 12,bottom: 15),
                            child: pw.Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Icon(
                                //   Icons.email,
                                //   color: context.cardColor ,
                                //   size: 22,  
                                // ),
                                pw.SizedBox(width: 15,),
                                pw.Text(
                                  "City",
                                  style: pw.TextStyle(fontSize: 14),    
                                ),
                                pw.Spacer(),
                                pw.Text(
                                  userCity,
                                  style: pw.TextStyle(fontSize: 16),    
                                ),
                              ],
                            ),
                          ),
                        ]
                        
                      ),
                    ),
                  ),
          
                pw.SizedBox(height: 30),
          
                  
                pw.Text("Charaterestic Information"),
                  pw.SizedBox(height: 10),
                  pw.Container(
                    width: double.infinity,
                    decoration: pw.BoxDecoration(
                      color: PdfColor(1, 1, 1, 1),
                      borderRadius: pw.BorderRadius.circular(10)
                    ),
                    child: pw.Padding(
                      padding: const pw.EdgeInsets.all(0.0),
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children:[
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(left: 12,top: 15,right: 12,bottom: 5),
                            child: pw.Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                pw.Text(
                                  "Dominant Character Trait",
                                  style: pw.TextStyle(fontSize: 16),    
                                ),
                                pw.Spacer(),
                                pw.Text(
                                  _getTrait(characteristic),
                                  style: pw.TextStyle(fontSize: 16),    
                                ),
                              ],
                            ),
                          ),
                          pw.Divider(
                            thickness: 2,
                          ),
          
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(left: 12,top: 5,right: 12,bottom: 5),
                            child: pw.Text(
                              "Description:",
                              style: pw.TextStyle(fontSize: 16),    
                            ),
                          ),
                          pw.SizedBox(height: 10,),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(left: 12,top: 0,right: 12,bottom: 5),
                            child: pw.Text(
                              _getDesc(characteristic),
                              style: pw.TextStyle(fontSize: 14),    
                            ),
                          ),
                          pw.Divider(
                            thickness: 2,
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(left: 12,top: 5,right: 12,bottom: 5),
                            child: pw.Text(
                              "Suitable Jobs:",
                              style: pw.TextStyle(fontSize: 16),    
                            ),
                          ),
                          pw.SizedBox(height: 10,),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(left: 12,top: 0,right: 12,bottom: 15),
                            child: pw.Text(
                              pdfrecom,
                              style: pw.TextStyle(fontSize: 14),    
                            ),
                          ),       
                        ]
                        
                      ),
                    ),
                  ),
                ]
              )
            )
            ])
        );
        
      },
    ));

    return pdf.save();
  }
}

String getKeyFromValue(Map<String, String> map, String value) {
  for (var entry in map.entries) {
    if (entry.value == value) {
      return entry.key;
    }
  }
  return ''; // Return an empty string if the value is not found
}




  class CustomPdfWidget extends pw.StatelessWidget {
  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
      child: pw.Text('Hello,', style: pw.TextStyle(fontSize: 40)),
    );
  }

}


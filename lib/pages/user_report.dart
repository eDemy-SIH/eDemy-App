import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:sih_app/db/db.dart';
import 'package:sih_app/widgets/pdf_data.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:printing/printing.dart';

import 'package:pdf/pdf.dart';


import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';

class UserReport extends StatefulWidget {
  @override
  State<UserReport> createState() => _UserReportState();
}

class _UserReportState extends State<UserReport> {

  final GlobalKey<State<StatefulWidget>> _globalKey = GlobalKey();

  final infobox = Hive.box("BasicInfo-db");
  //list of to do tasks
  BasicDB sdb = BasicDB();

  String userName = "";
  String userAge = "";
  String userPhn = "";
  String userMail="";
  String userState = "";
  String userCity = "";

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
    // sdb.updateDbInfo();
    // TODO: implement initState
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
          
        ),
      body: SingleChildScrollView(
        key: _globalKey,
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
                              "Realistic",
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
                          "Realistic individuals are pragmatic and hands-on. They thrive in practical environments, excelling in trades, construction, engineering, and physical work. They are problem solvers who enjoy tangible challenges and applying practical skills.",
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
                          "Carpenter \nElectrician \nAuto Mechanic \nSurveyor",
                          style: TextStyle(fontSize: 14),    
                        ),
                      ),       
                    ]
                    
                  ),
                ),
              ),

              GestureDetector(
                  onTap: () => captureAndSharePDF(),
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

    Printing.sharePdf(bytes: pdf, filename: 'captured_page.pdf');
  }

  Future<Uint8List> generatePDF() async {
    final pdf = pw.Document();

    pdf.addPage(pw.Page(
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Container(
            child: CustomPdfWidget(), // Use a custom pw.Widget for the PDF content
          ),
        );
      },
    ));

    return pdf.save();
  }
}




  class CustomPdfWidget extends pw.StatelessWidget {
  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
      child: pw.Text('Hello,', style: pw.TextStyle(fontSize: 40)),
    );
  }

}


import 'package:flutter/material.dart';
import 'package:sih_app/widgets/carrer_tile.dart';
import 'package:velocity_x/velocity_x.dart';

class HumanitiesListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<CareerTile> listTiles = [
      CareerTile(
        title: 'Archaeology',
        subtitle: "Qualification : Bachelor's degree in Archaeology",
        imageUrl: 'https://i.postimg.cc/bJqtkwZZ/archaeology.jpg', 
        id: "arch",
      ),
      CareerTile(
        title: 'Public Administration',
        subtitle: 'Qualification : Bachelor Degree In Public Admministration',
        imageUrl: 'https://i.postimg.cc/tR2hdWtp/publicadministration.jpg', 
        id: "PA",
      ),
      CareerTile(
        title: 'Home Science',
        subtitle: 'Qualification : Bachelor Degree In Home Science',
        imageUrl: 'https://i.postimg.cc/sDx5TxwS/homescience.jpg', 
        id: "HomeSc",
      ),
      CareerTile(
        title: 'Geography',
        subtitle: "Qualification : Bachelor's degree in Geography",
        imageUrl: 'https://i.postimg.cc/rFHx3TPH/geography-1.jpg',
        id: "Geo",
      ),
      CareerTile(
        title: 'Political Science',
        subtitle: "Qualification : Bachelor Degree In Political Science",
        imageUrl: 'https://i.postimg.cc/T17gRvYp/politicalscience.jpg', 
        id: "PoliSc",
      ),
      CareerTile(
        title: 'Language',
        subtitle: "Qualification : Bachelor Of Arts (BA)",
        imageUrl: 'https://i.postimg.cc/Twxr0c4Y/language.jpg', 
        id: "lang",
      ),

      CareerTile(
        title: 'Sociology',
        subtitle: 'Qualification : Bachelor Degree In Sociology',
        imageUrl: 'https://i.postimg.cc/nr8N0Nt9/Sociology.jpg', 
        id: "sociology",
      ),
      CareerTile(
        title: 'International Relation',
        subtitle: 'Qualification : Bachelor Degree In International Relation',
        imageUrl: 'https://i.postimg.cc/brQWMLzC/international.jpg', 
        id: "intreln",
      ),
    ];

    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: context.cardColor),
        backgroundColor: Colors.transparent,
      ),  
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Container(
                child: Text(
                  "Career Choices in Humanities",
                  style: TextStyle(fontSize: 24, fontFamily: 'FontMain'),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text(
                    "Here is a list of popular career choices in Humanities.",
                    style: TextStyle(fontSize: 14, fontFamily: 'FontMain'),
                  ),
                ),
                SizedBox(height: 40,),

             

              Expanded(
                child: ListView(
                  children: listTiles,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
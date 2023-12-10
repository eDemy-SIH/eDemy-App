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
        imageUrl: 'https://placekitten.com/80/80', 
        id: "journalism",
      ),
      CareerTile(
        title: 'Public Administration',
        subtitle: 'Qualification : Bachelor Degree In Public Admministration',
        imageUrl: 'https://placekitten.com/80/81', 
        id: "journalism",
      ),
      CareerTile(
        title: 'Home Science',
        subtitle: 'Qualification : Bachelor Degree In Home Science',
        imageUrl: 'https://placekitten.com/80/82', 
        id: "journalism",
      ),
      CareerTile(
        title: 'Geography',
        subtitle: "Qualification : Bachelor's degree in Geography",
        imageUrl: 'https://placekitten.com/80/80',
        id: "journalism",
      ),
      CareerTile(
        title: 'Political Science',
        subtitle: "Qualification : Bachelor Degree In Political Science",
        imageUrl: 'https://placekitten.com/80/83', 
        id: "journalism",
      ),
      CareerTile(
        title: 'Language',
        subtitle: "Qualification : Bachelor Of Arts (BA)",
        imageUrl: 'https://placekitten.com/80/83', 
        id: "journalism",
      ),

      CareerTile(
        title: 'Sociology',
        subtitle: 'Qualification : Bachelor Degree In Sociology',
        imageUrl: 'https://placekitten.com/80/84', 
        id: "journalism",
      ),
      CareerTile(
        title: 'International Relation',
        subtitle: 'Qualification : Bachelor Degree In International Relation',
        imageUrl: 'https://placekitten.com/80/85', 
        id: "journalism",
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
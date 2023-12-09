import 'package:flutter/material.dart';
import 'package:sih_app/widgets/carrer_tile.dart';
import 'package:velocity_x/velocity_x.dart';

class AviationListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<CareerTile> listTiles = [
      CareerTile(
        title: 'Air Traffic Controller',
        subtitle: 'Qualification : Bachelor of Technology (B.Tech)',
        imageUrl: 'https://placekitten.com/80/80', 
      ),
      CareerTile(
        title: 'Aircraft Maintanence Engineer',
        subtitle: 'Qualification : Bachelor Of Technology (BTech)',
        imageUrl: 'https://placekitten.com/80/81', 
      ),
      CareerTile(
        title: 'Cabin Crew',
        subtitle: 'Qualification : Engineering Diploma (Diploma)',
        imageUrl: 'https://placekitten.com/80/82', 
      ),
      CareerTile(
        title: 'Flight Attendant',
        subtitle: 'Qualification : Undergrad Degree In Aviation',
        imageUrl: 'https://placekitten.com/80/83', 
      ),
      CareerTile(
        title: 'Pilot',
        subtitle: 'Qualification : High School Diploma',
        imageUrl: 'https://placekitten.com/80/84', 
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
                  "Career Choices in Aviation",
                  style: TextStyle(fontSize: 24, fontFamily: 'FontMain'),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text(
                    "Here is a list of popular career choices in Aviation.",
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
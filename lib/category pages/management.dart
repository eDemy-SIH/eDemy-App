import 'package:flutter/material.dart';
import 'package:sih_app/widgets/carrer_tile.dart';
import 'package:velocity_x/velocity_x.dart';

class ManagemensListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<CareerTile> listTiles = [
      CareerTile(
        title: 'Business Administration',
        subtitle: 'Qualification : Bachelor of Business Administration (BBA)',
        imageUrl: 'https://placekitten.com/80/80', 
      ),
      CareerTile(
        title: 'Sports Management',
        subtitle: 'Qualification : Bachelor of Arts (BA)',
        imageUrl: 'https://placekitten.com/80/81', 
      ),
      CareerTile(
        title: 'Project Management',
        subtitle: 'Qualification : Master of Business Administration (MBA)',
        imageUrl: 'https://placekitten.com/80/82', 
      ),
      CareerTile(
        title: 'Event Management',
        subtitle: 'Qualification : Bachelor of Business Administration (BBA)',
        imageUrl: 'https://placekitten.com/80/83', 
      ),
      CareerTile(
        title: 'Fashion Business Management',
        subtitle: 'Qualification : Bachelor of Business Administration (BBA)',
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
                  "Career Choices in Management",
                  style: TextStyle(fontSize: 24, fontFamily: 'FontMain'),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text(
                    "Here is a list of popular career choices in Management.",
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
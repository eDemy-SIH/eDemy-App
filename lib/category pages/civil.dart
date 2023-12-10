import 'package:flutter/material.dart';
import 'package:sih_app/widgets/carrer_tile.dart';
import 'package:velocity_x/velocity_x.dart';

class CivilListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<CareerTile> listTiles = [
      CareerTile(
        title: 'Civil Services',
        subtitle: "Qualification : Any Bachelor's Degree",
        imageUrl: 'https://placekitten.com/80/80',
        id: "civils",
      ),
      CareerTile(
        title: 'Railway Services',
        subtitle: "Qualification : Any Bachelor's Degree",
        imageUrl: 'https://placekitten.com/80/81',
        id: "civils",
      ),
      CareerTile(
        title: 'Customs And Excises',
        subtitle: "Qualification : Any Bachelor's Degree",
        imageUrl: 'https://placekitten.com/80/82', 
        id: "civils",
      ),
      CareerTile(
        title: 'Income Tax Service',
        subtitle: "Qualification : Any Bachelor's Degree",
        imageUrl: 'https://placekitten.com/80/83',
        id: "civils", 
      ),
      CareerTile(
        title: 'Indian Economic System',
        subtitle: 'Qualification : Master of Science (M.Sc) in Economics',
        imageUrl: 'https://placekitten.com/80/84',
        id: "civils", 
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
                  "Career Choices in Civil Services",
                  style: TextStyle(fontSize: 24, fontFamily: 'FontMain'),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text(
                    "Here is a list of popular career choices in Civil Services.",
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
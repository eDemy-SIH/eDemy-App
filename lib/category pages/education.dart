import 'package:flutter/material.dart';
import 'package:sih_app/widgets/carrer_tile.dart';
import 'package:velocity_x/velocity_x.dart';

class EducationListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<CareerTile> listTiles = [
      CareerTile(
        title: 'Counsellor',
        subtitle: 'Qualification : Bachelor of Arts in Psychology',
        imageUrl: 'https://placekitten.com/80/80',
        id: "journalism", 
      ),
      CareerTile(
        title: 'Teacher',
        subtitle: 'Qualification : Bachelor of Education (B.Ed)',
        imageUrl: 'https://placekitten.com/80/81', 
        id: "journalism",
      ),
      CareerTile(
        title: 'Special Educatorr',
        subtitle: 'Qualification : Bachelor of Education in Special Education',
        imageUrl: 'https://placekitten.com/80/82', 
        id: "journalism",
      ),
      CareerTile(
        title: 'Professor',
        subtitle: 'Qualification : Doctor of Philosophy (Ph.D)',
        imageUrl: 'https://placekitten.com/80/83', 
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
                  "Career Choices in Education And Training",
                  style: TextStyle(fontSize: 24, fontFamily: 'FontMain'),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text(
                    "Here is a list of popular career choices in Education And Training.",
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
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
        imageUrl: 'https://i.postimg.cc/GpyCGVdn/blog-details-ba.jpg', 
        id: "businessadministration",
      ),
      CareerTile(
        title: 'Sports Management',
        subtitle: 'Qualification : Bachelor of Arts (BA)',
        imageUrl: 'https://i.postimg.cc/GpyCGVdn/blog-details-ba.jpg', 
        id: "sportmanagement",
      ),
      CareerTile(
        title: 'Project Management',
        subtitle: 'Qualification : Master of Business Administration (MBA)',
        imageUrl: 'https://i.postimg.cc/X7CkMgj7/blog-details-proj.jpg', 
        id: "projectm",
      ),
      CareerTile(
        title: 'Event Management',
        subtitle: 'Qualification : Bachelor of Business Administration (BBA)',
        imageUrl: 'https://i.postimg.cc/nzpPrPLk/blog-details-event.jpg', 
        id: "eventm",
      ),
      CareerTile(
        title: 'Fashion Business Management',
        subtitle: 'Qualification : Bachelor of Business Administration (BBA)',
        imageUrl: 'https://i.postimg.cc/FKj694hz/blog-details-fashm.jpg', 
        id: "fash",
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
                SizedBox(height: 20,),

             

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
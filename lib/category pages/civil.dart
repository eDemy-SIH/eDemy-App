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
        imageUrl: 'https://i.postimg.cc/TYwBnFJN/blog-details-cv.jpg',
        id: "civils",
      ),
      CareerTile(
        title: 'Railway Services',
        subtitle: "Qualification : Any Bachelor's Degree",
        imageUrl: 'https://i.postimg.cc/PxJ1SWVH/blog-details-rails.jpg',
        id: "rails",
      ),
      CareerTile(
        title: 'Customs And Excises',
        subtitle: "Qualification : Any Bachelor's Degree",
        imageUrl: 'https://i.postimg.cc/FsTN40D8/blog-details-ces.jpg', 
        id: "ces",
      ),
      CareerTile(
        title: 'Income Tax Service',
        subtitle: "Qualification : Any Bachelor's Degree",
        imageUrl: 'https://i.postimg.cc/4ynwhkRz/blog-details-it.jpg',
        id: "its", 
      ),
      CareerTile(
        title: 'Indian Economic System',
        subtitle: 'Qualification : Master of Science (M.Sc) in Economics',
        imageUrl: 'https://i.postimg.cc/PqzSgQM8/blog-details-iess.jpg',
        id: "iess", 
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
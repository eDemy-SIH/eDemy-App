import 'package:flutter/material.dart';
import 'package:sih_app/widgets/carrer_tile.dart';
import 'package:velocity_x/velocity_x.dart';

class EngineeringListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<CareerTile> listTiles = [
      CareerTile(
        title: 'Computer Science and Engineering',
        subtitle: 'Qualification : Bachelor of Technology',
        imageUrl: 'https://i.postimg.cc/XJK6D5r2/blog-details-cse.jpg',
        id: 'cse',
      ),
      CareerTile(
        title: 'Artificial Intelligence & Machine Learning',
        subtitle: 'Qualification : Bachelor of Technology',
        imageUrl: 'https://i.postimg.cc/j2QqN96S/blog-details-aiml.jpg',
        id: 'aiml',
      ),
      CareerTile(
        title: 'Electronics and communication Engineering',
        subtitle: 'Qualification : Bachelor of Technology',
        imageUrl: 'https://i.postimg.cc/JzyVCvyH/blog-details-ece.jpg',
        id: 'ece', 
      ),
      CareerTile(
        title: 'Electrical Engineering',
        subtitle: 'Qualification : Bachelor of Technology',
        imageUrl: 'https://i.postimg.cc/pTHg8dsK/blog-details-ee.jpg', 
        id: 'ee',
      ),
      CareerTile(
        title: 'Electrical and Instrumentation Engineering',
        subtitle: 'Qualification : Bachelor of Technology',
        imageUrl: 'https://i.postimg.cc/c4b2hhDx/blog-details-eie.jpg', 
        id: 'eie',
      ),
      CareerTile(
        title: 'Aerospace Engineering',
        subtitle: 'Qualification : Bachelor of Technology',
        imageUrl: 'https://i.postimg.cc/5N2Wn6b3/blog-details-aero.jpg', 
        id: 'aero',
      ),
      CareerTile(
        title: 'Mechanical engineering',
        subtitle: 'Qualification : Bachelor of Technology',
        imageUrl: 'https://i.postimg.cc/D0D6rj7R/blog-details-mech.jpg',
        id: 'mech', 
      ),
      CareerTile(
        title: 'Civil Engineering',
        subtitle: 'Qualification : Bachelor of Technology',
        imageUrl: 'https://i.postimg.cc/1t1ZHB3n/blog-details-civil.jpg',
        id: 'civil', 
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
                  "Career Choices in Engineering",
                  style: TextStyle(fontSize: 24, fontFamily: 'FontMain'),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text(
                    "Here is a list of popular career choices in Engineering.",
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
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
        imageUrl: 'https://i.postimg.cc/c45CcGbn/lawyer.jpg',
        id: 'cse',
      ),
      CareerTile(
        title: 'Artificial Intelligence & Machine Learning',
        subtitle: 'Qualification : Bachelor of Technology',
        imageUrl: 'https://i.postimg.cc/c45CcGbn/lawyer.jpg',
        id: 'aiml',
      ),
      CareerTile(
        title: 'Electronics and communication Engineering',
        subtitle: 'Qualification : Bachelor of Technology',
        imageUrl: 'https://placekitten.com/80/82',
        id: 'ece', 
      ),
      CareerTile(
        title: 'Electrical Engineering',
        subtitle: 'Qualification : Bachelor of Technology',
        imageUrl: 'https://placekitten.com/80/83', 
        id: 'ee',
      ),
      CareerTile(
        title: 'Electrical and Instrumentation Engineering',
        subtitle: 'Qualification : Bachelor of Technology',
        imageUrl: 'https://placekitten.com/80/84', 
        id: 'eie',
      ),
      CareerTile(
        title: 'Aerospace Engineering',
        subtitle: 'Qualification : Bachelor of Technology',
        imageUrl: 'https://placekitten.com/80/85', 
        id: 'aero',
      ),
      CareerTile(
        title: 'Mechanical engineering',
        subtitle: 'Qualification : Bachelor of Technology',
        imageUrl: 'https://placekitten.com/80/86',
        id: 'mech', 
      ),
      CareerTile(
        title: 'Civil Engineering',
        subtitle: 'Qualification : Bachelor of Technology',
        imageUrl: 'https://placekitten.com/80/87',
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
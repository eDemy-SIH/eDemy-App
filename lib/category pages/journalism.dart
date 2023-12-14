import 'package:flutter/material.dart';
import 'package:sih_app/widgets/carrer_tile.dart';
import 'package:velocity_x/velocity_x.dart';

class JournalismListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<CareerTile> listTiles = [
      CareerTile(
        title: 'Mass Communication',
        subtitle: 'Qualification : Bachelor Of Arts)',
        imageUrl: 'https://placekitten.com/80/80', 
        id: "mascom",
      ),
      CareerTile(
        title: 'Public Relations',
        subtitle: 'Qualification : Bachelor Of Arts',
        imageUrl: 'https://placekitten.com/80/81', 
        id: "pr",
      ),
      CareerTile(
        title: 'Writer Editor Copywriter',
        subtitle: 'Qualification : Bachelor Of Arts',
        imageUrl: 'https://placekitten.com/80/82', 
        id: "writer",
      ),
      CareerTile(
        title: 'Broadcasting',
        subtitle: 'Qualification : Bachelor Of Arts',
        imageUrl: 'https://placekitten.com/80/83', 
        id: "Broadcasting",
      ),
      CareerTile(
        title: 'Journalism',
        subtitle: 'Qualification : Bachelor Of Arts',
        imageUrl: 'https://placekitten.com/80/84', 
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
                  "Career Choices in Media & Journalism",
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
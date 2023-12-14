import 'package:flutter/material.dart';
import 'package:sih_app/widgets/carrer_tile.dart';
import 'package:velocity_x/velocity_x.dart';

class GraduateListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<CareerTile> listTiles = [
      CareerTile(
        title: 'Zoology',
        subtitle: 'Qualification : Bachelor of Science (B.Sc)',
        imageUrl: 'https://placekitten.com/80/80',
        id: "zoo",
      ),
      CareerTile(
        title: 'Botany',
        subtitle: 'Qualification : Bachelor of Science (B.Sc)',
        imageUrl: 'https://placekitten.com/80/81', 
        id:"botany"
      ),
      CareerTile(
        title: 'Physics Hons.',
        subtitle: 'Qualification : Bachelor of Science (B.Sc)',
        imageUrl: 'https://placekitten.com/80/82', 
        id:"phyhon"
      ),
      CareerTile(
        title: 'Chemistry Hons.',
        subtitle: 'Qualification : Bachelor of Science (B.Sc)',
        imageUrl: 'https://placekitten.com/80/83', 
        id:"chemhon"
      ),
      CareerTile(
        title: 'Radio Jockey',
        subtitle: "Qualification : Any Bachelor's Degree",
        imageUrl: 'https://placekitten.com/80/84', 
        id:"rj"
      ),
      CareerTile(
        title: 'Entrepreneurship',
        subtitle: "Qualification : Any Bachelor's Degree",
        imageUrl: 'https://placekitten.com/80/84', 
        id:"ent"
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
                  "Career Choices as a Graduate",
                  style: TextStyle(fontSize: 24, fontFamily: 'FontMain'),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text(
                    "Here is a list of popular career choices as a Graduate.",
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
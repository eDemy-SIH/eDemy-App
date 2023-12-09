import 'package:flutter/material.dart';
import 'package:sih_app/widgets/carrer_tile.dart';
import 'package:velocity_x/velocity_x.dart';

class GraphicsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<CareerTile> listTiles = [
      CareerTile(
        title: 'Fashion Designer',
        subtitle: 'Qualification : Bachelor of Design (B.Des)',
        imageUrl: 'https://placekitten.com/80/80', 
      ),
      CareerTile(
        title: 'UI/UX Designer',
        subtitle: 'Qualification : Bachelor of Computer Application',
        imageUrl: 'https://placekitten.com/80/81', 
      ),
      CareerTile(
        title: 'Graphic Designer',
        subtitle: 'Qualification : Bachelor of Design (B.Des)',
        imageUrl: 'https://placekitten.com/80/82', 
      ),
      CareerTile(
        title: 'Interior Designer',
        subtitle: 'Qualification : Bachelor of Design (B.Des)',
        imageUrl: 'https://placekitten.com/80/83', 
      ),
      CareerTile(
        title: 'Jewellery Designer',
        subtitle: 'Qualification : Bachelor of Design (B.Des) in Jewellery Retail and Export Management',
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
                  "Career Choices in Design & Graphics",
                  style: TextStyle(fontSize: 24, fontFamily: 'FontMain'),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text(
                    "Here is a list of popular career choices in Design & Graphics.",
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
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
        imageUrl: 'https://i.postimg.cc/zBy0yYrT/blog-details-zoo.jpg',
        id: "zoo",
      ),
      CareerTile(
        title: 'Botany',
        subtitle: 'Qualification : Bachelor of Science (B.Sc)',
        imageUrl: 'https://i.postimg.cc/MpGZM9nz/blog-details-bot.jpg', 
        id:"botany"
      ),
      CareerTile(
        title: 'Physics Hons.',
        subtitle: 'Qualification : Bachelor of Science (B.Sc)',
        imageUrl: 'https://i.postimg.cc/CKN4PLFG/blog-details-phy.jpg', 
        id:"phyhon"
      ),
      CareerTile(
        title: 'Chemistry Hons.',
        subtitle: 'Qualification : Bachelor of Science (B.Sc)',
        imageUrl: 'https://i.postimg.cc/WznjtZjD/blog-details-chem.jpg', 
        id:"chemhon"
      ),
      CareerTile(
        title: 'Radio Jockey',
        subtitle: "Qualification : Any Bachelor's Degree",
        imageUrl: 'https://i.postimg.cc/g2bqG6jy/blog-details-rj.jpg', 
        id:"rj"
      ),
      CareerTile(
        title: 'Entrepreneurship',
        subtitle: "Qualification : Any Bachelor's Degree",
        imageUrl: 'https://i.postimg.cc/4y4qLSkd/blog-details-ent.jpg', 
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
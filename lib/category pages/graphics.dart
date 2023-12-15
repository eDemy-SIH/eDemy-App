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
        imageUrl: 'https://i.postimg.cc/nh95Pm5v/blog-details-fashd.jpg', 
        id: "fashiondesigner",
      ),
      CareerTile(
        title: 'UI/UX Designer',
        subtitle: 'Qualification : Bachelor of Computer Application',
        imageUrl: 'https://i.postimg.cc/DftYb0m0/blog-details-uiux.jpg', 
        id: "uiux",
      ),
      CareerTile(
        title: 'Graphic Designer',
        subtitle: 'Qualification : Bachelor of Design (B.Des)',
        imageUrl: 'https://i.postimg.cc/J0hYcHZH/blog-details-graphic.jpg', 
        id: "graphic",
      ),
      CareerTile(
        title: 'Interior Designer',
        subtitle: 'Qualification : Bachelor of Design (B.Des)',
        imageUrl: 'https://i.postimg.cc/hjD2cQCZ/blog-details-interior.jpg', 
        id: "interior",
      ),
      CareerTile(
        title: 'Jewellery Designer',
        subtitle: 'Qualification : Bachelor of Design (B.Des) in Jewellery Retail and Export Management',
        imageUrl: 'https://i.postimg.cc/y6rLCd0n/blog-details-jewellery.jpg', 
        id: "jewellery",
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
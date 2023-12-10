import 'package:flutter/material.dart';
import 'package:sih_app/widgets/carrer_tile.dart';
import 'package:velocity_x/velocity_x.dart';

class CareerListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<CareerTile> listTiles = [
      // CareerTile(
      //   title: 'Title 1',
      //   subtitle: 'Subtitle 1',
      //   imageUrl: 'https://placekitten.com/80/80', 
      // ),
      // CareerTile(
      //   title: 'Title 2',
      //   subtitle: 'Subtitle 2',
      //   imageUrl: 'https://placekitten.com/80/81', 
      // ),
      // CareerTile(
      //   title: 'Title 3',
      //   subtitle: 'Subtitle 3',
      //   imageUrl: 'https://placekitten.com/80/82', 
      // ),
      // CareerTile(
      //   title: 'Title 4',
      //   subtitle: 'Subtitle 4',
      //   imageUrl: 'https://placekitten.com/80/83', 
      // ),
      // CareerTile(
      //   title: 'Title 5',
      //   subtitle: 'Subtitle 5',
      //   imageUrl: 'https://placekitten.com/80/84', 
      // ),
      // CareerTile(
      //   title: 'Title 6',
      //   subtitle: 'Subtitle 6',
      //   imageUrl: 'https://placekitten.com/80/85', 
      // ),
      // CareerTile(
      //   title: 'Title 7',
      //   subtitle: 'Subtitle 7',
      //   imageUrl: 'https://placekitten.com/80/86', 
      // ),
      // CareerTile(
      //   title: 'Title 8',
      //   subtitle: 'Subtitle 8',
      //   imageUrl: 'https://placekitten.com/80/87', 
      // ),
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
                  "Careers in marketing",
                  style: TextStyle(fontSize: 30, fontFamily: 'FontMain'),
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
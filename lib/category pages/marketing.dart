import 'package:flutter/material.dart';
import 'package:sih_app/widgets/carrer_tile.dart';
import 'package:velocity_x/velocity_x.dart';

class MarketingListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<CareerTile> listTiles = [
      CareerTile(
        title: 'Digital Marketing',
        subtitle: 'Qualification : Bachelor Degree In Any Field',
        imageUrl: 'https://placekitten.com/80/80', 
      ),
      CareerTile(
        title: 'Advertisement',
        subtitle: 'Qualification : Bachelor In Any Field',
        imageUrl: 'https://placekitten.com/80/81', 
      ),
      CareerTile(
        title: 'Sales',
        subtitle: 'Qualification : Bachelor Of Business Administration (BBA)',
        imageUrl: 'https://placekitten.com/80/82', 
      ),
      CareerTile(
        title: 'Product Designer',
        subtitle: "Qualification : Bachelor's Degree in Industrial Design, Manufacturing",
        imageUrl: 'https://placekitten.com/80/83', 
      ),
      CareerTile(
        title: 'Marketing',
        subtitle: 'Qualification : Bachelor Of Business Administration (BBA)',
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
                  "Career Choices in Sales & Marketing",
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
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
        imageUrl: 'https://i.postimg.cc/B6BRCGzk/blog-details-digi.jpg', 
        id: "digi",
      ),
      CareerTile(
        title: 'Advertisement',
        subtitle: 'Qualification : Bachelor In Any Field',
        imageUrl: 'https://i.postimg.cc/hjVKWw51/blog-details-ad.jpg', 
        id: "ad",
      ),
      CareerTile(
        title: 'Sales',
        subtitle: 'Qualification : Bachelor Of Business Administration (BBA)',
        imageUrl: 'https://i.postimg.cc/cJsRnyQr/blog-details-sales.jpg', 
        id: "sales",
      ),
      CareerTile(
        title: 'Product Designer',
        subtitle: "Qualification : Bachelor's Degree in Industrial Design, Manufacturing",
        imageUrl: 'https://i.postimg.cc/LXQ3SCgh/blog-details-prod.jpg"', 
        id: "prod",
      ),
      CareerTile(
        title: 'Marketing',
        subtitle: 'Qualification : Bachelor Of Business Administration (BBA)',
        imageUrl: 'https://i.postimg.cc/DyJBvTgh/blog-details-mark.jpg', 
        id: "mark",
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
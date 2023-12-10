import 'package:flutter/material.dart';
import 'package:sih_app/widgets/carrer_tile.dart';
import 'package:velocity_x/velocity_x.dart';

class FinanceListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<CareerTile> listTiles = [
      CareerTile(
        title: 'Chartered Accountant',
        subtitle: 'Qualification : Chartered Accountancy (CA)',
        imageUrl: 'https://placekitten.com/80/80', 
        id: "journalism",
      ),
      CareerTile(
        title: 'Chartered Market Technicianr',
        subtitle: 'Qualification : Bachelor of Commerce in Finance',
        imageUrl: 'https://placekitten.com/80/81',
        id: "journalism", 
      ),
      CareerTile(
        title: 'Chartered Financial Analyst',
        subtitle: 'Qualification : Bachelor of Commerce in Finance',
        imageUrl: 'https://placekitten.com/80/82', 
        id: "journalism",
      ),
      CareerTile(
        title: 'Cost Accountant',
        subtitle: 'Qualification : Intermediate course of Cost Accountancy (ICA)',
        imageUrl: 'https://placekitten.com/80/83', 
        id: "journalism",
      ),
      CareerTile(
        title: 'Certified Public Accountant',
        subtitle: 'Qualification : Bachelor of Commerce in Finance',
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
                  "Career Choices in Finance And Accounts",
                  style: TextStyle(fontSize: 24, fontFamily: 'FontMain'),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text(
                    "Here is a list of popular career choices in Finance and Accounts.",
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
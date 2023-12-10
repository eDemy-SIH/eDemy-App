import 'package:flutter/material.dart';
import 'package:sih_app/widgets/carrer_tile.dart';
import 'package:velocity_x/velocity_x.dart';

class MedicineListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<CareerTile> listTiles = [
      CareerTile(
        title: 'Doctor',
        subtitle: 'Qualification : Bachelor of Medicine and Bachelor of Surgery (MBBS)',
        imageUrl: 'https://placekitten.com/80/80',
        id: 'doctor',
      ),
      CareerTile(
        title: 'Surgeon',
        subtitle: 'Qualification : Master of Surgery (MS)',
        imageUrl: 'https://placekitten.com/80/81', 
        id: 'doctor',
      ),
      CareerTile(
        title: 'Pathology',
        subtitle: 'Qualification : Doctor of Medicine (MD) in Pathology',
        imageUrl: 'https://placekitten.com/80/82',
        id: 'doctor', 
      ),
      CareerTile(
        title: 'Veterinary',
        subtitle: 'Qualification : Bachelor of Veterinary Science and Animal Husbandry (BVSc & AH)',
        imageUrl: 'https://placekitten.com/80/83', 
        id: 'doctor',
      ),
      CareerTile(
        title: 'Orthopaedic',
        subtitle: 'Qualification : Master of Surgery (MS) in Orthopedics',
        imageUrl: 'https://placekitten.com/80/84',
        id: 'doctor', 
      ),
      CareerTile(
        title: 'Ophthalmology',
        subtitle: 'Qualification : Master of Surgery (MS) in Ophthalmology',
        imageUrl: 'https://placekitten.com/80/85', 
        id: 'doctor',
      ),
      CareerTile(
        title: 'Nursing',
        subtitle: 'Qualification : Bachelor of Science (B.Sc) in Nursing',
        imageUrl: 'https://placekitten.com/80/87', 
        id: 'doctor',
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
                  "Career Choices in Medicine",
                  style: TextStyle(fontSize: 24, fontFamily: 'FontMain'),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text(
                    "Here is a list of popular career choices in Medicine.",
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
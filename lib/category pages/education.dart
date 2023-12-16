import 'package:flutter/material.dart';
import 'package:sih_app/widgets/carrer_tile.dart';
import 'package:velocity_x/velocity_x.dart';

class EducationListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<CareerTile> listTiles = [
      CareerTile(
        title: 'Counsellor',
        subtitle: 'Qualification : Bachelor of Arts in Psychology',
        imageUrl: 'https://i.postimg.cc/t4fb1p0z/blog-details-couns.jpg',
        id: "counsellor", 
      ),
      CareerTile(
        title: 'Teacher',
        subtitle: 'Qualification : Bachelor of Education (B.Ed)',
        imageUrl: 'https://i.postimg.cc/J7y2nZrS/blog-details-tec.jpg', 
        id: "teacher",
      ),
      CareerTile(
        title: 'Special Educatorr',
        subtitle: 'Qualification : Bachelor of Education in Special Education',
        imageUrl: 'https://i.postimg.cc/vm3W7qzX/blog-details-spec.jpg', 
        id: "speced",
      ),
      CareerTile(
        title: 'Professor',
        subtitle: 'Qualification : Doctor of Philosophy (Ph.D)',
        imageUrl: 'https://i.postimg.cc/DfDPYNKM/blog-details-prof.jpg', 
        id: "prof",
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
                  "Career Choices in Education And Training",
                  style: TextStyle(fontSize: 24, fontFamily: 'FontMain'),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text(
                    "Here is a list of popular career choices in Education And Training.",
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
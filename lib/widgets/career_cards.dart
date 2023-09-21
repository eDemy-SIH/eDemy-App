import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: must_be_immutable
class CareerCard extends StatelessWidget {
  final String text;
  final String imagePath;
  final int col_index;
  CareerCard({super.key, required this.text, required this.col_index, required this.imagePath});

  List<Color> colors = [
    Color.fromRGBO(225, 190, 221, 1), 
    const Color.fromARGB(255, 238, 204, 103), 
    Color.fromARGB(185, 236, 80, 88)];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12,right: 12,top: 12),
      height: 270,
      width: 200,
      decoration: BoxDecoration(
        color: Color.fromRGBO(215, 243, 242, 1),
        borderRadius: BorderRadius.circular(12)
      ),
      
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                fit: BoxFit.fill,
                imagePath,
                width: 200,
                height: 150,
                color: Color.fromARGB(59, 68, 60, 60),
                colorBlendMode: BlendMode.darken,
              ),
            ),
            
            SizedBox(height: 20,),
            Center(
              child: Text(
                text,
                style: TextStyle(fontSize: 16, fontFamily: 'FontMain'),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 35,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: context.cardColor
              ),
              child: Center(
                child: Text(
                  "View More",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14
                  ),
                ),
              ),
          )

          ],
        ),
      );
    
  }
}
import 'package:flutter/material.dart';
import 'package:sih_app/pages/career_details.dart';
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
      padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),

      decoration: BoxDecoration(
        color: context.theme.splashColor,
        borderRadius: BorderRadius.circular(20)
      ),
      
        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                fit: BoxFit.fill,
                imagePath,
                width: 90,
                height: 90,
                color: Color.fromARGB(59, 68, 60, 60),
                colorBlendMode: BlendMode.darken,
              ),
            ),
            
            SizedBox(width: 40,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [    
                  Text(
                    text,
                    style: TextStyle(fontSize: 16, fontFamily: 'FontMain'),
                  ),                 
                  SizedBox(height: 20,),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CareerPage(careerId: 'cse'),
                        ),
                      );
                    },
                    child: Container(
                      height: 35,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
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
                    ),
                  )
                ],
            ),
           

          ],
        ),
      );
    
  }
}
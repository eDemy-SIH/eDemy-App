import 'package:flutter/material.dart';

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
      height: 200,
      width: 180,
      decoration: BoxDecoration(
        color: colors[col_index],
        borderRadius: BorderRadius.circular(20)
      ),
      
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
              child: Image.asset(
                fit: BoxFit.fill,
                imagePath,
                width: 180,
                height: 120,
              ),
            ),
            
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                text,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      );
    
  }
}
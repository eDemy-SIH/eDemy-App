import 'package:flutter/material.dart';



class CareerTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;

  CareerTile({required this.title, required this.subtitle, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(10)
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
          leading: Container(
            width: 60, 
            height: 60, 
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal:15.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(horizontal:15.0),
            child: Text(subtitle),
          ),
          onTap: () {
            // Add any action you want to perform when the tile is tapped
            print('Tapped on $title');
          },
        ),
      ),
    );
  }
}
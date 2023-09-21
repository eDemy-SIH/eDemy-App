import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagestring;
  const Onboarding({super.key,required this.title,required this.subtitle,required this.imagestring});

  @override
  Widget build(BuildContext context) {
    return Container(
      color:Color.fromARGB(255, 216, 253, 148),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Image.asset(
              imagestring,
              height: 500,
              width: 500,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 28,fontFamily: 'FontMain'),
            ),
            SizedBox(height: 20,),
            Center(
              child: Text(
                subtitle,
                style: TextStyle(fontSize: 16,fontFamily: 'FontMain'),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      )
    );
  }
}
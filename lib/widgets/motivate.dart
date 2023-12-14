

import 'package:flutter/material.dart';

class MotivateForTest extends StatelessWidget {
  const MotivateForTest({super.key,required this.question,});
  final String question;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(question,style: TextStyle(fontSize: 24,fontFamily: 'FontMain' ),),
      ),
    );
  }
}
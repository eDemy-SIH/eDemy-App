

import 'package:flutter/material.dart';

class MotivateForTest extends StatelessWidget {
  const MotivateForTest({super.key,required this.question,});
  final String question;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(question),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Chatbubble extends StatelessWidget {
  final String message;
  final bool user;
  const Chatbubble({super.key, required this.message,required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
      child: Container(
        constraints: BoxConstraints(minWidth: 50, maxWidth: 200),
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: user==true? context.cardColor: Color.fromRGBO(159, 165, 171, 1),
        ),
        child: Text(
          message,
          style: TextStyle(
            fontSize: 14,
            color: context.theme.canvasColor,
          ),
        ),
      ),
    );
  }
}
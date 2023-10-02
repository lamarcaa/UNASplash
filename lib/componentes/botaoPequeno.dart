import 'package:flutter/material.dart';

class BotaoPequeno extends StatelessWidget {
  final String hintText;
  final Function()? onTap;

  const BotaoPequeno({
    super.key,
    required this.hintText,
    this.onTap,
  });

  Widget build(BuildContext context) {
    Color cor = Color(0xFF54C5D0);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 500,
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: cor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            hintText,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}

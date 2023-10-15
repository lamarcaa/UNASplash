import 'package:flutter/material.dart';

class BotaoPrincipal extends StatelessWidget {
  final String text;
  final Function()? onTap;

  const BotaoPrincipal({
    super.key,
    required this.text,
    this.onTap,
  });

  Widget build(BuildContext context) {
    Color cor = Color(0xFF54C5D0);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 500,
        height: 60,
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: cor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

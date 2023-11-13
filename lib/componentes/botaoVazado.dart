import 'package:flutter/material.dart';

class BotaoVazado extends StatelessWidget {
  final String text;
  final Function()? onTap;

  const BotaoVazado({
    Key? key,
    required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color cor = Color.fromARGB(0, 30, 30, 30);
    Color cor2 = Color(0xFF54C5D0);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 500,
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: cor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: cor2, // Cor da borda
            width: 2, // Largura da borda
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: cor2,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

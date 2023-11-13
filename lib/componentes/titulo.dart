import 'package:flutter/material.dart';

class Titulo extends StatelessWidget {
  final String titulo;
  final String subTitulo;
  const Titulo({super.key, required this.titulo, required this.subTitulo});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 30),
          Text(
            titulo,
            style: TextStyle(
              color: Color.fromARGB(189, 0, 0, 0),
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            subTitulo,
            style: TextStyle(
              color: Color.fromARGB(135, 0, 0, 0),
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}

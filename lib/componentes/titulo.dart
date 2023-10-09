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
              color: Colors.grey[500],
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(height: 10),
          Text(
            subTitulo,
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 13,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

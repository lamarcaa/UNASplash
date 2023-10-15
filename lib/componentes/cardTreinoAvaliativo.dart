import 'package:flutter/material.dart';

class CardTreino extends StatelessWidget {
  final String nomeUsuario;
  final String dataTreino;
  final String Modalidade;

  const CardTreino(
      {super.key,
      required this.nomeUsuario,
      required this.dataTreino,
      required this.Modalidade});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.bar_chart_rounded,
                size: 50,
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nomeUsuario,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black),
                  ),
                  SizedBox(height: 4),
                  Text(
                    dataTreino,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          Text(
            Modalidade,
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 15, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

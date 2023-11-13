import 'package:flutter/material.dart';

class CardUser extends StatelessWidget {
  const CardUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).size.width * 0.97,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // imagem
          Container(
            margin: EdgeInsets.only(left: 15),
            height: 43,
            width: 43,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.black,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                'caminho/da/sua/imagem.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          // texto
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Gabriel Lamarca Galdino da Silva".toUpperCase(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text("Administrador",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black38)),
              ],
            ),
          )
        ],
      ),
    );
  }
}

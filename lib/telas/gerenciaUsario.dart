import 'package:flutter/material.dart';
import 'package:unasplash/componentes/titulo.dart';
import 'package:unasplash/telas/perfilAdministrador.dart';
import 'package:unasplash/telas/perfilAtleta.dart';
import 'package:unasplash/telas/perfilTreinador.dart';

void main() {
  runApp(MaterialApp(
    home: GerenciaUser(),
  ));
}

class GerenciaUser extends StatefulWidget {
  GerenciaUser();

  @override
  _GerenciaUserState createState() => _GerenciaUserState();
}

class _GerenciaUserState extends State<GerenciaUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          Titulo(
            titulo: 'GERENCIE OS USUÁRIOS',
            subTitulo: 'Veja os usuários cadastrados no sistema!',
          ),
          InkWell(
            child: listUsuarios('Maria da Silva', 'Administrador'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PerfilAdministrador()),
              );
            },
          ),
          InkWell(
            child: listUsuarios('João Pedro', 'Treinador'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PerfilTreinador()),
              );
            },
          ),
          InkWell(
            child: listUsuarios('Rafael Nunes', 'Atleta'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PerfilAtleta()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget listUsuarios(String name, String role) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Container(
        padding: EdgeInsets.all(20),
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
                  Icons.person,
                  size: 50,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      role,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            Icon(Icons.delete),
          ],
        ),
      ),
    );
  }
}

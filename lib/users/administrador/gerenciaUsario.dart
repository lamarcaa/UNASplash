import 'package:flutter/material.dart';
import '../../helper/lista.dart';

class GerenciaUser extends StatefulWidget {
  GerenciaUser();

  _GerenciaUserState createState() => _GerenciaUserState();
}

class _GerenciaUserState extends State<GerenciaUser> {
  // Chamado quando o widget é criado
  void initState() {
    // garente a chamada do initState
    super.initState();
    // se n for nulo retorna a instancia pra chamar a lista
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      verificaLista();
    });
  }

  Widget build(BuildContext context) {
    final listaDeUsuarios = ListaUsuarios.listaDeUsuarios;
    final listaDeAtletas = ListaUsuarios.listaDeAtleta;
    final listaCombinada = [...listaDeUsuarios, ...listaDeAtletas];
    Color cor = Color(0xFF54C5D0);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            if (listaCombinada.isNotEmpty)
              Expanded(
                child: _buildUserList(listaCombinada, cor),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserList(List<dynamic> listaCombinada, Color cor) {
    return ListView.builder(
      itemCount: listaCombinada.length,
      itemBuilder: (context, index) {
        final item = listaCombinada[index];

        return Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
          child: Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[100],
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
                          item.nome,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                        SizedBox(height: 4),
                        Text(
                          item.tipoUsuario,
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
      },
    );
  }

  void verificaLista() {
    if (ListaUsuarios.listaDeUsuarios.isEmpty &&
        ListaUsuarios.listaDeAtleta.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Nenhum usuário ou atleta cadastrado no sistema'),
        ),
      );
    }
  }
}

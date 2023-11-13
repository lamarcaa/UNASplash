import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:unasplash/componentes/card.dart';
import 'package:unasplash/componentes/labelCard.dart';
import 'package:unasplash/main.dart';
import 'package:unasplash/telas/formularios/cadastroInicialAtleta.dart';
import 'package:unasplash/telas/gerenciaUsario.dart';
import 'formularios/formUsuario.dart';

void main() {
  runApp(MaterialApp(
    home: MenuPrincipalAdm(),
  ));
}

class MenuPrincipalAdm extends StatefulWidget {
  const MenuPrincipalAdm({super.key});

  @override
  State<StatefulWidget> createState() => _MenuPrincipalAdmState();
}

class _MenuPrincipalAdmState extends State<MenuPrincipalAdm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        automaticallyImplyLeading: false,
        elevation: 5,
        title: Text(
          "U N A S P L A S H",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.people_alt_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              showMenu(
                context: context,
                position: RelativeRect.fromLTRB(400, 50, 0, 0),
                items: [
                  PopupMenuItem(
                    child: ListTile(
                      title: Text('Usuário: Administrador'),
                    ),
                  ),
                  PopupMenuItem(
                    child: ListTile(
                      leading: Icon(Icons.exit_to_app),
                      title: Text('Sair'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyApp()),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.person_add_alt_1_rounded),
        backgroundColor: Colors.cyan,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[200],
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 20),
                  child: const Text(
                    'Gerencie os usuários',
                    style: TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // card
                CardUser(),
                CardUser(),
                CardUser(),
                CardUser(),
                CardUser(),
                CardUser(),
                CardUser(),
                CardUser(),
                CardUser(),
                CardUser(),
                CardUser(),
                CardUser(),
                CardUser(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

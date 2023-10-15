import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:unasplash/main.dart';
import 'package:unasplash/telas/analiseComparativa.dart';
import 'package:unasplash/telas/formularios/cadastroInicialAtleta.dart';
import 'package:unasplash/telas/cronometro.dart';
import 'package:unasplash/telas/treinoAvaliativo.dart';

void main() {
  runApp(MaterialApp(
    home: MenuPrincipalTreinador(),
  ));
}

class MenuPrincipalTreinador extends StatefulWidget {
  const MenuPrincipalTreinador({Key? key}) : super(key: key);

  @override
  State<MenuPrincipalTreinador> createState() => _MenuPrincipalTreinadorState();
}

class _MenuPrincipalTreinadorState extends State<MenuPrincipalTreinador> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    TreinoAvaliativo(),
    AnaliseComparativa(),
    cadastroInicialAtleta(),
  ];

  @override
  Widget build(BuildContext context) {
    Color cor = Color(0xFF54C5D0);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: cor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Cronometro()),
          );
          print('Clicado');
        },
        child: Icon(
          Icons.timer_sharp,
          size: 20,
        ),
      ),
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          "U N A S P L A S H",
          style: TextStyle(
            color: Color.fromARGB(255, 42, 42, 42),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.people_alt_rounded,
              color: Colors.black,
            ),
            onPressed: () {
              showMenu(
                context: context,
                position: RelativeRect.fromLTRB(400, 50, 0, 0),
                items: [
                  PopupMenuItem(
                    child: ListTile(
                      title: Text('Usuário: Treinador'),
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
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(5),
                child: GNav(
                  backgroundColor: Colors.white,
                  color: Colors.black,
                  activeColor: Colors.black,
                  tabBackgroundColor: Colors.grey.shade300,
                  gap: 15,
                  onTabChange: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  tabs: [
                    GButton(
                        icon: Icons.analytics_outlined,
                        text: 'Treino Avaliativo'),
                    GButton(
                        icon: Icons.query_stats_rounded,
                        text: 'Análise Comparativa'),
                    GButton(
                      icon: Icons.pool_rounded,
                      text: 'Cadastrar Atletas',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

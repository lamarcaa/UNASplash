import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:unasplash/main.dart';
import 'package:unasplash/telas/cronometro.dart';
import 'package:unasplash/telas/formularios/cadastraAtleta.dart';
import 'package:unasplash/telas/treinoAvaliativo.dart';

void main() {
  runApp(MaterialApp(
    home: MenuPrincipalAtleta(),
  ));
}

class MenuPrincipalAtleta extends StatefulWidget {
  _MenuPrincipalAtletaState createState() => _MenuPrincipalAtletaState();
}

class _MenuPrincipalAtletaState extends State<MenuPrincipalAtleta> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    TreinoAvaliativo(),
  ];

  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      cadAtleta(context);
    });
  }

  void cadAtleta(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.all(25),
          child: InkWell(
            child: Row(
              children: [
                Icon(
                  Icons.warning_rounded,
                  size: 50,
                  color: Color.fromARGB(255, 185, 183, 44),
                ),
                SizedBox(width: 10),
                Text(
                  'Complete seu cadastro no aplicativo!',
                  style: TextStyle(color: Colors.grey[600]),
                  softWrap: true,
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CadastroAtleta()),
              );
            },
          ),
        );
      },
    );
  }

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
                      title: Text('Usuário: Atleta'),
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

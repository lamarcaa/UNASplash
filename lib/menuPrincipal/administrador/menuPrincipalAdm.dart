import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:unasplash/main.dart';
import 'package:unasplash/telas/formularios/cadastroInicialAtleta.dart';
import 'package:unasplash/telas/gerenciaUsario.dart';
import '../../telas/formularios/cadastraUsuarios.dart';

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
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    GerenciaUser(),
    FormCadastro(),
    cadastroInicialAtleta()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    GButton(icon: Icons.search, text: 'Gerênciar Cadastros'),
                    GButton(
                      icon: Icons.person_add_alt_1_sharp,
                      text: 'Cadastrar Usuários',
                    ),
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

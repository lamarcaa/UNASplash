import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:unasplash/users/administrador/gerenciaUsario.dart';
import './formCadastro.dart';
import '../../main.dart';

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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
          child: Text(
            "U N A S P L A S H",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.person,
              color: Colors.black,
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            children: [
              DrawerHeader(
                child: Image.network(
                  'https://i.imgur.com/WMIjSHr.png',
                  width: 200,
                ),
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text(
                  'Sair',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp()),
                  );
                },
              ),
            ],
          ),
        ),
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
                    GButton(icon: Icons.search, text: 'Gerenciar Usuários'),
                    GButton(
                      icon: Icons.person_add_alt_1_sharp,
                      text: 'Cadastrar Usuários',
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

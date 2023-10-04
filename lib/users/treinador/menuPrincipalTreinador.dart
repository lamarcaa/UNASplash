import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:unasplash/componentes/drawerPadrao.dart';
import 'package:unasplash/telas/cronometro.dart';
import 'package:unasplash/telas/treinoAvaliativo.dart';
import 'package:unasplash/users/administrador/formCadastro.dart';
import 'package:unasplash/users/administrador/gerenciaUsario.dart';

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
    FormCadastro(),
    GerenciaUser(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
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
        elevation: 0,
        title: Center(
          child: Text(
            "U N A S p l a s h",
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
      drawer: DrawerPadrao(),
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
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
                  icon: Icons.sports_handball_rounded,
                  text: 'Treino Avaliativo'),
              GButton(
                  icon: Icons.person_add_alt_1_sharp,
                  text: 'Cadastrar Usuários'),
              GButton(icon: Icons.search, text: 'Gerenciar Usuários'),
            ],
          ),
        ),
      ),
    );
  }
}

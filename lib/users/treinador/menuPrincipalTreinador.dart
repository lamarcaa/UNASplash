import 'package:flutter/material.dart';
import 'package:unasplash/componentes/bottomMenu.dart';
import 'package:unasplash/users/administrador/formCadastro.dart';
import 'package:unasplash/users/administrador/gerenciaUusario.dart';
import '../../main.dart';

class MenuPrincipalTreinador extends StatefulWidget {
  const MenuPrincipalTreinador({super.key});

  @override
  State<StatefulWidget> createState() => _MenuPrincipalTreinadorState();
}

class _MenuPrincipalTreinadorState extends State<MenuPrincipalTreinador> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectIndex = 0;
  void navegacaoMenu(int newIndex) {
    setState(() {
      _selectIndex = newIndex;
    });
  }

  final List<Widget> _pages = [
    GerenciaUser(),
    FormCadastro(),
  ];

  @override
  Widget build(BuildContext context) {
    Color cor = Color(0xFF54C5D0);
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0,
        title: Center(
          child: Text("U N A S p l a s h"),
        ),
        leading: IconButton(
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
          icon: Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.person),
          )
        ],
      ),
      body: _pages[_selectIndex],
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: BottomMenu(
        onTabChange: (index) => navegacaoMenu(index),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            children: [
              DrawerHeader(
                child: Image.asset(
                  '../imagens/logo.png',
                  width: 300,
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
    );
  }
}

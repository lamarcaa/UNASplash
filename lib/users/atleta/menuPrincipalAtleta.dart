import 'package:flutter/material.dart';

class MenuPrincipalAtleta extends StatefulWidget {
  @override
  _MenuPrincipalAtletaState createState() => _MenuPrincipalAtletaState();
}

class _MenuPrincipalAtletaState extends State<MenuPrincipalAtleta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Atleta'),
      ),
      body: Center(
        child: Text('atleta'),
      ),
    );
  }
}

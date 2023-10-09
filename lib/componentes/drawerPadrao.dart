import 'package:flutter/material.dart';
import 'package:unasplash/main.dart';

class DrawerPadrao extends StatelessWidget {
  const DrawerPadrao({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
}

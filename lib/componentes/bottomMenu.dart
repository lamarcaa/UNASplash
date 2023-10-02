import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
class BottomMenu extends StatelessWidget {
  final void Function(int)? onTabChange;

  BottomMenu({Key? key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    Color cor = Color(0xFF54C5D0);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GNav(
        onTabChange: (value) => onTabChange!(value),
        mainAxisAlignment: MainAxisAlignment.center,
        activeColor: cor,
        color: cor,
        tabActiveBorder: Border.all(color: cor),
        gap: 9,
        tabs: const [
          GButton(
            icon: Icons.pending_actions_outlined,
            text: 'Gerenciar',
          ),
          GButton(
            icon: Icons.add_circle_outlined,
            text: 'Cadastrar',
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomMenu extends StatelessWidget {
  final void Function(int)? onTabChange;

  BottomMenu({Key? key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GNav(
        onTabChange: (value) => onTabChange!(value),
        mainAxisAlignment: MainAxisAlignment.center,
        activeColor: Colors.white,
        color: Colors.white,
        tabActiveBorder: Border.all(color: Colors.white),
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

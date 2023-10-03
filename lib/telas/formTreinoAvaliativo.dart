import 'package:flutter/material.dart';
import 'package:unasplash/componentes/textfield.dart';

class FormTreinoAvaliativo extends StatelessWidget {
  const FormTreinoAvaliativo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: TextFieldPadrao(hintText: hintText, obscureText: obscureText),
    );
  }
}

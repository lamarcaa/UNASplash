import 'package:flutter/material.dart';

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
        title: Text('Treino Avaliativo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              'Finalize o Treino Avaliativo',
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Preencha o formulário abaixo e finalize o treino avaliativo!',
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}

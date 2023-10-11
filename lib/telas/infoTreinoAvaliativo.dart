import 'package:flutter/material.dart';
import 'package:unasplash/componentes/labelCard.dart';
import 'package:unasplash/componentes/titulo.dart';

void main() {
  runApp(const MaterialApp(
    home: InfoTreinoAvaliativo(),
  ));
}

class InfoTreinoAvaliativo extends StatelessWidget {
  const InfoTreinoAvaliativo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 56, 56, 56),
        title: const Text('Treino Avaliativo'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Icon(
                    Icons.timeline_rounded,
                    size: 100,
                  ),
                  Titulo(
                      titulo: 'Gabriel Lamarca Galdino da Silva',
                      subTitulo: 'Treino Avaliativo'),
                  SizedBox(
                    height: 30,
                  ),
                  Titulo(
                      titulo: 'Voltas',
                      subTitulo: 'Registro de todas as voltas'),
                  LabelCard(
                      info: '1a Volta - 02:21:24', icone: Icons.loop_rounded),
                  LabelCard(
                      info: '2a Volta - 04:51:21', icone: Icons.loop_rounded),
                  LabelCard(
                      info: '3a Volta - 06:10:12', icone: Icons.loop_rounded),
                  LabelCard(
                      info: '4a Volta - 08:01:31', icone: Icons.loop_rounded),
                  LabelCard(
                      info: '1a Volta - 10:15:04', icone: Icons.loop_rounded),
                  LabelCard(
                      info: '2a Volta - 12:00:01', icone: Icons.loop_rounded),
                  Titulo(
                      titulo: 'Informações',
                      subTitulo: 'Informações registradas'),
                  LabelCard(info: 'Modalidade:  Crawl', icone: Icons.list),
                  LabelCard(
                      info: 'Data da Aplicação:  11/10/2023',
                      icone: Icons.date_range_rounded),
                  LabelCard(
                      info: 'Frequência Cardíaca Inicial:  110bpm',
                      icone: Icons.health_and_safety_rounded),
                  LabelCard(
                      info: 'Frequência Cardíaca Final:  183bpm',
                      icone: Icons.health_and_safety_rounded),
                  SizedBox(
                    height: 30,
                  ),
                  LabelCard(
                      info:
                          'Responsável pela Aplicação: Sérgio Antônio (Treinador)',
                      icone: Icons.timer),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

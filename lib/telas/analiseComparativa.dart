import 'package:flutter/material.dart';
import 'package:unasplash/componentes/cardTreinoAvaliativo.dart';
import 'package:unasplash/componentes/titulo.dart';
import 'package:unasplash/telas/analiseTreinoAvaliativo.dart';

enum ExerciseFilter { Craw, Costas, Peito, Borboleta, Medley }

void main() {
  runApp(MaterialApp(
    home: AnaliseComparativa(),
  ));
}

class AnaliseComparativa extends StatefulWidget {
  const AnaliseComparativa({Key? key}) : super(key: key);

  @override
  State<AnaliseComparativa> createState() => _AnaliseComparativaState();
}

class _AnaliseComparativaState extends State<AnaliseComparativa> {
  Set<ExerciseFilter> filters = <ExerciseFilter>{};
  TextEditingController busca = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Titulo(
            titulo: 'ANÁLISE COMPARATIVA',
            subTitulo: 'Filtre, pesquise e compare o desempenho dos atletas!',
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: busca,
              decoration: InputDecoration(
                labelText: 'Nome do atleta',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          InkWell(
            child: CardTreino(
              nomeUsuario: 'Gabriel Lamarca Galdino da Silva',
              dataTreino: 'Clique para analisar',
              Modalidade: '',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AnaliseTreinoAvaliativo()),
              );
            },
          ),
          CardTreino(
            nomeUsuario: 'Ana Maria',
            dataTreino: 'Clique para analisar',
            Modalidade: '',
          ),
          CardTreino(
            nomeUsuario: 'João da Silva',
            dataTreino: 'Clique para analisar',
            Modalidade: '',
          ),
          CardTreino(
            nomeUsuario: 'Maria Fernanda',
            dataTreino: 'Clique para analisar',
            Modalidade: '',
          ),
          CardTreino(
            nomeUsuario: 'Pedro Souza',
            dataTreino: 'Clique para analisar',
            Modalidade: '',
          ),
          CardTreino(
            nomeUsuario: 'Mariana Oliveira',
            dataTreino: 'Clique para analisar',
            Modalidade: '',
          ),
          CardTreino(
            nomeUsuario: 'Rafael Santos',
            dataTreino: 'Clique para analisar',
            Modalidade: '',
          ),
          CardTreino(
            nomeUsuario: 'Carla Mendes',
            dataTreino: 'Clique para analisar',
            Modalidade: '',
          ),
          CardTreino(
            nomeUsuario: 'Fernando Rocha',
            dataTreino: 'Clique para analisar',
            Modalidade: '',
          ),
          CardTreino(
            nomeUsuario: 'Isabela Lima',
            dataTreino: 'Clique para analisar',
            Modalidade: '',
          ),
        ],
      ),
    );
  }

  void buscarAtleta(String value) {
    print('valor digitado: $value');
  }
}

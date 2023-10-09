import 'package:flutter/material.dart';
import 'package:unasplash/componentes/cardTreinoAvaliativo.dart';
import 'package:unasplash/componentes/titulo.dart';

void main() {
  runApp(MaterialApp(
    home: AnaliseComparativa(),
  ));
}

class AnaliseComparativa extends StatefulWidget {
  const AnaliseComparativa({super.key});

  @override
  State<AnaliseComparativa> createState() => _AnaliseComparativaState();
}

class _AnaliseComparativaState extends State<AnaliseComparativa> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Titulo(
                titulo: 'ANÁLISE COMPARATIVA',
                subTitulo:
                    'Filtre, pesquise e compare o desempenho dos atletas!'),
            CardTreino(
              nomeUsuario: 'Gabriel Lamarca Galdino da Silva',
              dataTreino: 'Realizado em: 03/10 - Quarta Feira',
              Modalidade: 'Craw',
            ),
            CardTreino(
              nomeUsuario: 'Ana Maria',
              dataTreino: 'Realizado em: 04/10 - Quinta Feira',
              Modalidade: 'Costas',
            ),
            CardTreino(
              nomeUsuario: 'João da Silva',
              dataTreino: 'Realizado em: 05/10 - Sexta Feira',
              Modalidade: 'Peito',
            ),
            CardTreino(
              nomeUsuario: 'Maria Fernanda',
              dataTreino: 'Realizado em: 06/10 - Sábado',
              Modalidade: 'Borboleta',
            ),
            CardTreino(
              nomeUsuario: 'Pedro Souza',
              dataTreino: 'Realizado em: 07/10 - Domingo',
              Modalidade: 'Madley',
            ),
            CardTreino(
              nomeUsuario: 'Mariana Oliveira',
              dataTreino: 'Realizado em: 08/10 - Segunda Feira',
              Modalidade: 'Borboleta',
            ),
            CardTreino(
              nomeUsuario: 'Rafael Santos',
              dataTreino: 'Realizado em: 09/10 - Terça Feira',
              Modalidade: 'Peito',
            ),
            CardTreino(
              nomeUsuario: 'Carla Mendes',
              dataTreino: 'Realizado em: 10/10 - Quarta Feira',
              Modalidade: 'Craw',
            ),
            CardTreino(
              nomeUsuario: 'Fernando Rocha',
              dataTreino: 'Realizado em: 11/10 - Quinta Feira',
              Modalidade: 'Peito',
            ),
            CardTreino(
              nomeUsuario: 'Isabela Lima',
              dataTreino: 'Realizado em: 12/10 - Sexta Feira',
              Modalidade: 'Costas',
            ),
          ],
        ),
      ),
    );
  }
}

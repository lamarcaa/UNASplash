import 'package:flutter/material.dart';
import 'package:unasplash/componentes/cardTreinoAvaliativo.dart';

class TreinoAvaliativo extends StatelessWidget {
  const TreinoAvaliativo({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CardTreino(
            nomeUsuario: 'Gabriel Lamarca Galdino da Silva',
            dataTreino: 'Treino Realizado em 03/10 - Quarta Feira',
            Modalidade: 'Craw',
          ),
          CardTreino(
            nomeUsuario: 'Ana Maria',
            dataTreino: 'Treino Realizado em 04/10 - Quinta Feira',
            Modalidade: 'Craw',
          ),
          CardTreino(
            nomeUsuario: 'João da Silva',
            dataTreino: 'Treino Realizado em 05/10 - Sexta Feira',
            Modalidade: 'Craw',
          ),
          CardTreino(
            nomeUsuario: 'Maria Fernanda',
            dataTreino: 'Treino Realizado em 06/10 - Sábado',
            Modalidade: 'Craw',
          ),
          CardTreino(
            nomeUsuario: 'Pedro Souza',
            dataTreino: 'Treino Realizado em 07/10 - Domingo',
            Modalidade: 'Craw',
          ),
          CardTreino(
            nomeUsuario: 'Mariana Oliveira',
            dataTreino: 'Treino Realizado em 08/10 - Segunda Feira',
            Modalidade: 'Craw',
          ),
          CardTreino(
            nomeUsuario: 'Rafael Santos',
            dataTreino: 'Treino Realizado em 09/10 - Terça Feira',
            Modalidade: 'Craw',
          ),
          CardTreino(
            nomeUsuario: 'Carla Mendes',
            dataTreino: 'Treino Realizado em 10/10 - Quarta Feira',
            Modalidade: 'Craw',
          ),
          CardTreino(
            nomeUsuario: 'Fernando Rocha',
            dataTreino: 'Treino Realizado em 11/10 - Quinta Feira',
            Modalidade: 'Craw',
          ),
          CardTreino(
            nomeUsuario: 'Isabela Lima',
            dataTreino: 'Treino Realizado em 12/10 - Sexta Feira',
            Modalidade: 'Craw',
          ),
        ],
      ),
    );
  }
}

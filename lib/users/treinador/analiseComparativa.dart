import 'package:flutter/material.dart';
import 'package:unasplash/componentes/btnFiltro.dart';
import 'package:unasplash/componentes/cardTreinoAvaliativo.dart';
import 'package:unasplash/componentes/titulo.dart';

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
                suffixIcon: GestureDetector(
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 500,
                          color: Colors.white,
                          child: Center(
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Titulo(
                                        titulo: 'Filtros',
                                        subTitulo:
                                            'Escolha os filtros desejados'),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'Modalidades',
                                      style: TextStyle(
                                        color: Colors.grey[500],
                                        fontSize: 13,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Wrap(
                                      children: [
                                        BtnFiltro(
                                          text: 'Craw',
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        BtnFiltro(
                                          text: 'Costas',
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        BtnFiltro(
                                          text: 'Peito',
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        BtnFiltro(
                                          text: 'Borboleta',
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        BtnFiltro(
                                          text: 'Medley',
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'Provas',
                                      style: TextStyle(
                                        color: Colors.grey[500],
                                        fontSize: 13,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Wrap(
                                      children: [
                                        BtnFiltro(
                                          text: '50m',
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        BtnFiltro(
                                          text: '100m',
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        BtnFiltro(
                                          text: '200m',
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        BtnFiltro(
                                          text: '700m',
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        BtnFiltro(
                                          text: '800m',
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        BtnFiltro(
                                          text: '1500m',
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'Sexo',
                                      style: TextStyle(
                                        color: Colors.grey[500],
                                        fontSize: 13,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Wrap(
                                      children: [
                                        BtnFiltro(
                                          text: 'Masculino',
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        BtnFiltro(
                                          text: 'Feminino',
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        BtnFiltro(
                                          text: 'Outro',
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'Período',
                                      style: TextStyle(
                                        color: Colors.grey[500],
                                        fontSize: 13,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Wrap(
                                      children: [
                                        BtnFiltro(
                                          text: 'Jan - Fev',
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        BtnFiltro(
                                          text: 'Mar - Abri',
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        BtnFiltro(
                                          text: 'Mai - Jun',
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        BtnFiltro(
                                          text: 'Jul - Ago',
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        BtnFiltro(
                                          text: 'Set - Out',
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        BtnFiltro(
                                          text: 'Nov - Dez',
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.filter_list),
                  ),
                ),
              ),
              onSubmitted: buscarAtleta,
            ),
          ),
          CardTreino(
            nomeUsuario: 'Gabriel Lamarca Galdino da Silva',
            dataTreino: 'Clique para analisar',
            Modalidade: '',
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

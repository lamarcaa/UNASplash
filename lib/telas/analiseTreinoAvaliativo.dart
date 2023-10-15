import 'package:flutter/material.dart';
import 'package:unasplash/componentes/btnFiltro.dart';
import 'package:unasplash/componentes/titulo.dart';

void main() {
  runApp(const MaterialApp(
    home: AnaliseTreinoAvaliativo(),
  ));
}

class AnaliseTreinoAvaliativo extends StatelessWidget {
  const AnaliseTreinoAvaliativo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 42, 42, 42),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Análise Treino Avaliativo'),
      ),
      body: SingleChildScrollView(
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
                      subTitulo: 'Análise Treino Avaliativo'),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                'Filtros',
                                style: TextStyle(
                                  color: Color(0xFF4E4E4E),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.filter_alt_rounded),
                          ],
                        ),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                      ),
                    ],
                  ),
                  Titulo(
                      titulo: 'Gráfico de Desempenho por Atleta',
                      subTitulo: 'Gráfico referentes aos filtros selecionados'),
                  Image.network(
                    'https://i.imgur.com/nX9bW7S.png',
                    width: 400,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Titulo(
                      titulo: 'Gráfico de Desempenho por Período',
                      subTitulo: 'Gráfico referentes aos filtros selecionados'),
                  Image.network(
                    'https://i.imgur.com/J1pgOCM.png',
                    width: 400,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

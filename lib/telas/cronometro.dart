import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:unasplash/componentes/botaoPequeno.dart';
import 'package:unasplash/componentes/botaoPrincipal.dart';
import 'package:unasplash/componentes/botaoSecundario.dart';
import 'package:unasplash/componentes/dataPicker.dart';
import 'package:unasplash/componentes/dropDown.dart';
import 'package:unasplash/componentes/textfield.dart';
import 'package:unasplash/menuPrincipal/treinador/menuPrincipalTreinador.dart';

class Cronometro extends StatefulWidget {
  const Cronometro({super.key});

  @override
  State<Cronometro> createState() => _CronometroState();
}

void main() {
  runApp(MaterialApp(
    home: Cronometro(),
  ));
}

class _CronometroState extends State<Cronometro> {
  int milisegundos = 0;
  int segundos = 0;
  int minutos = 0;
  String guardaMili = "00";
  String guardaSeg = "00";
  String guardaMin = "00";
  Timer? timer;
  bool started = false;
  List<String> voltas = [];
  List<String> estiloTreino = <String>[
    'Crawl',
    'Costas',
    'Peito',
    'Borboleta',
    'Medley'
  ];
  String dropdownValue = 'Crawl';
  String digitoMili = "00";
  String digitoSeg = "00";
  String digitoMin = "00";
  IconData iconeBotao = Icons.play_arrow;
  final FreqCardiacaInicial = TextEditingController();
  final FreqCardiacaFinal = TextEditingController();

  void paraCronometro() {
    timer!.cancel();
    setState(() {
      started = false;
    });
  }

  void resetaCronometro() {
    timer!.cancel();
    setState(() {
      milisegundos = 0;
      segundos = 0;
      minutos = 0;

      guardaMili = "00";
      guardaSeg = "00";
      guardaMin = "00";

      digitoMili = "00";
      digitoSeg = "00";
      digitoMin = "00";

      voltas.clear();

      started = false;
    });
  }

  void salvaVoltas() {
    String volta = "$digitoMin:$digitoSeg:$digitoMili";
    setState(() {
      voltas.add(volta);
    });
  }

  void iniciaCronometro() {
    started = true;
    timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        milisegundos++;
        if (milisegundos >= 100) {
          milisegundos = 0;
          segundos++;
          if (segundos >= 60) {
            segundos = 0;
            minutos++;
          }
        }
        digitoMili = (milisegundos >= 10) ? "$milisegundos" : "0$milisegundos";
        digitoSeg = (segundos >= 10) ? "$segundos" : "0$segundos";
        digitoMin = (minutos >= 10) ? "$minutos" : "0$minutos";
      });
    });
  }

  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      infoIniciais();
    });
  }

  void infoIniciais() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            children: [
              Text('Estilo do treino: '),
              SizedBox(
                height: 10,
              ),
              DropDownPadrao(
                list: estiloTreino,
                dropdownValue: dropdownValue,
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFieldPadrao(
                text: 'Frequência Cardíaca Inicial',
                obscureText: false,
                controller: FreqCardiacaInicial,
                keyboardType: TextInputType.number,
                inputFormatter: [FilteringTextInputFormatter.digitsOnly],
              ),
              SizedBox(
                height: 10,
              ),
              BotaoSecundario(
                text: 'Iniciar Avaliação',
                onTap: () {
                  trataCampos();
                },
              )
            ],
          ),
        );
      },
    );
  }

  void trataCampos() {
    if (FreqCardiacaInicial.text.isEmpty) {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.info(
          message: "Digite a frequência cardíaca!",
        ),
      );
    } else {
      Navigator.pop(context);
    }
  }

  Widget build(BuildContext context) {
    Color cronometroColor =
        (segundos >= 10) ? Color(0xFFFF1100) : Color(0xFF02FF0A);
    double progress = (segundos * 1000 + milisegundos) / 10000;
    Color cor = Color(0xFF54C5D0);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 42, 42, 42),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Treino Avaliativo'),
      ),
      body: Container(
        color: const Color.fromARGB(255, 42, 42, 42),
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Text(
                "$digitoMin:$digitoSeg:$digitoMili",
                style: TextStyle(fontSize: 60, color: cronometroColor),
              ),
              SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (!started) {
                          iniciaCronometro();
                          setState(() {
                            iconeBotao = Icons.pause;
                          });
                        } else {
                          paraCronometro();
                          setState(() {
                            iconeBotao = Icons.play_arrow;
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor: Colors.black,
                      ),
                      child: Icon(iconeBotao, size: 20),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        salvaVoltas();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        backgroundColor: cor,
                      ),
                      child: Icon(Icons.loop_rounded,
                          color: Colors.white, size: 20),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        resetaCronometro();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        backgroundColor: Colors.black,
                      ),
                      child: Icon(Icons.delete, color: Colors.white, size: 20),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Container(
                height: 300,
                margin: EdgeInsets.symmetric(vertical: 20),
                child: ListView.builder(
                  itemCount: voltas.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${index + 1}ª volta:',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            '${voltas[index]}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 15),
              BotaoPrincipal(
                text: 'Encerrar Treino',
                onTap: () {
                  infoFinais();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void infoFinais() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            children: [
              Text(
                'Data do Treino:',
              ),
              SizedBox(
                height: 10,
              ),
              DataPickerPadrao(),
              SizedBox(
                height: 10,
              ),
              TextFieldPadrao(
                text: 'Frequência Cardíaca Final',
                obscureText: false,
                controller: FreqCardiacaFinal,
                keyboardType: TextInputType.number,
                inputFormatter: [FilteringTextInputFormatter.digitsOnly],
              ),
              SizedBox(
                height: 10,
              ),
              BotaoPrincipal(
                text: 'Encerrar Treino Avaliativo',
                onTap: () {
                  if (FreqCardiacaFinal.text.isEmpty) {
                    showTopSnackBar(
                      Overlay.of(context),
                      CustomSnackBar.info(
                        message: "Digite a frequência cardíaca!",
                      ),
                    );
                  } else {
                    showTopSnackBar(
                      Overlay.of(context),
                      CustomSnackBar.success(
                        message: "Treino avaliativo cadastrado com sucesso!",
                      ),
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MenuPrincipalTreinador()),
                    );
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

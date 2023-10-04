import 'dart:async';
import 'package:flutter/material.dart';

class Cronometro extends StatefulWidget {
  const Cronometro({super.key});

  @override
  State<Cronometro> createState() => _CronometroState();
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
  String digitoMili = "00";
  String digitoSeg = "00";
  String digitoMin = "00";

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

  Widget build(BuildContext context) {
    Color cronometroColor = (segundos >= 10) ? Colors.red : Colors.green;

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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text("Treino Avaliativo"),
              ),
              SizedBox(height: 25),
              Center(
                child: Text(
                  "$digitoMin:$digitoSeg:$digitoMili",
                  style: TextStyle(fontSize: 80, color: cronometroColor),
                ),
              ),
              Container(
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ListView.builder(
                  itemCount: voltas.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Volta nº${index + 1}'),
                          Text('${voltas[index]}'),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: RawMaterialButton(
                      onPressed: () {
                        (!started) ? iniciaCronometro() : paraCronometro();
                      },
                      shape: const StadiumBorder(
                        side: BorderSide(color: Colors.blue),
                      ),
                      child: Text((!started) ? "Iniciar" : "Pausar"),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: () {
                      salvaVoltas();
                    },
                    icon: Icon(Icons.flag_sharp),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: RawMaterialButton(
                      onPressed: () {
                        resetaCronometro();
                      },
                      shape: const StadiumBorder(
                        side: BorderSide(color: Colors.blue),
                      ),
                      child: Text('Resetar'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

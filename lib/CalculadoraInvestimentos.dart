// ignore_for_file: prefer_final_fields, unused_field, prefer_const_constructors, unnecessary_import, implementation_imports, depend_on_referenced_packages, unused_import, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations, prefer_interpolation_to_compose_strings, use_key_in_widget_constructors

import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

void main() => runApp(Principal());

class Principal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora de Investimentos',
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      home: CalculadoraInvestimentos(),
    );
  }
}

class CalculadoraInvestimentos extends StatefulWidget {
  const CalculadoraInvestimentos({Key? key}) : super(key: key);

  @override
  State<CalculadoraInvestimentos> createState() =>
      _CalculadoraInvestimentosState();
}

class _CalculadoraInvestimentosState extends State<CalculadoraInvestimentos> {
  TextStyle _textStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
  static final NumberFormat formatoReal =
      NumberFormat.currency(locale: 'pt-br');

  double _investimentoMensal = 0;
  int _anosInvestindo = 0;
  double _rentabilidadeAnual = 0;
  double _resultado = 0;
  double _valorInvestido = 0;
  double _patrimonioAcumulado = 0;

  void atualizarValorInvestido() {
    setState(() {
      _valorInvestido = _investimentoMensal * (_anosInvestindo * 12);
    });
  }

  void atualizarResultado() {
    setState(() {
      _resultado = (_investimentoMensal *
                  (pow(1 + (_rentabilidadeAnual / 12 / 100),
                          (_anosInvestindo * 12)) -
                      1)) /
              (_rentabilidadeAnual / 12 / 100) -
          _valorInvestido;
    });
  }

  void atualizarPatrimonioAcumlado() {
    setState(() {
      _patrimonioAcumulado = _resultado + _valorInvestido;
    });
  }

  Widget textoTitulo() {
    return Text('Calculadora de Rentabilidade',
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic));
  }

  /*Widget imagemCalculadora() {
    return SizedBox(
      height: 50.0,
      child: Image.asset(
        'assets/images/rentabilidade.jpg',
        fit: BoxFit.contain,
      ),
    );
  }*/

  Widget cardInvestimento() {
    return Card(
      margin: EdgeInsets.all(14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.only(top: 14, bottom: 8),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text('Investimento mensal:', style: _textStyle),
                Spacer(),
                Text('${formatoReal.format(_investimentoMensal)}',
                    style: _textStyle),
              ],
            ),
          ),
          Slider(
            value: _investimentoMensal,
            min: 0,
            max: 10000,
            activeColor: Colors.green.shade700,
            inactiveColor: Colors.green.shade100,
            divisions: 1000,
            onChanged: (double value) {
              setState(() {
                _investimentoMensal = value;
              });
              atualizarResultado();
              atualizarValorInvestido();
              atualizarPatrimonioAcumlado();
            },
          ),
        ]),
      ),
    );
  }

  Widget cardTempo() {
    return Card(
      margin: EdgeInsets.all(14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.only(top: 14, bottom: 8),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text('Tempo de investimento (anos):', style: _textStyle),
                Spacer(),
                Text(_anosInvestindo.toString() + " anos", style: _textStyle),
              ],
            ),
          ),
          Slider(
            value: _anosInvestindo.toDouble(),
            min: 0,
            max: 25,
            activeColor: Colors.green.shade700,
            inactiveColor: Colors.green.shade100,
            divisions: 25,
            onChanged: (double value) {
              setState(() {
                _anosInvestindo = value.toInt();
              });
              atualizarResultado();
              atualizarValorInvestido();
              atualizarPatrimonioAcumlado();
            },
          ),
        ]),
      ),
    );
  }

  Widget cardRentabilidade() {
    return Card(
      margin: EdgeInsets.all(14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.only(top: 14, bottom: 8),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text('Rentabilidade anual:', style: _textStyle),
                Spacer(),
                Text(_rentabilidadeAnual.toInt().toString() + "%",
                    style: _textStyle),
              ],
            ),
          ),
          Slider(
            value: _rentabilidadeAnual,
            min: 0,
            max: 25,
            activeColor: Colors.green.shade700,
            inactiveColor: Colors.green.shade100,
            divisions: 25,
            onChanged: (double value) {
              setState(() {
                _rentabilidadeAnual = value;
              });
              atualizarResultado();
              atualizarValorInvestido();
              atualizarPatrimonioAcumlado();
            },
          ),
        ]),
      ),
    );
  }

  Widget cardResultado() {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 14, vertical: 30),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Rendimento:', style: _textStyle),
                Text('${formatoReal.format(_resultado)}', style: _textStyle),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Valor investido', style: _textStyle),
                Text('${formatoReal.format(_valorInvestido)}',
                    style: _textStyle),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Patrimônio acumulado', style: _textStyle),
                Text('${formatoReal.format(_patrimonioAcumulado)}',
                    style: _textStyle),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade900,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10.0),
            textoTitulo(),
            SizedBox(height: 10.0),
            //imagemCalculadora(),
            cardInvestimento(),
            cardTempo(),
            cardRentabilidade(),
            cardResultado(),
          ],
        ),
      ),
    );
  }
}
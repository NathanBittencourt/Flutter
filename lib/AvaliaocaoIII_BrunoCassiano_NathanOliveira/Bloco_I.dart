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
      title: 'Conversor de Moeda',
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      home: CalculadoraRealDolar(),
    );
  }
}

class CalculadoraRealDolar extends StatefulWidget {
  const CalculadoraRealDolar({Key? key}) : super(key: key);

  @override
  State<CalculadoraRealDolar> createState() => _CalculadoraRealDolarState();
}

class _CalculadoraRealDolarState extends State<CalculadoraRealDolar> {
  TextStyle _textStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
  static final NumberFormat formatoReal =
      NumberFormat.currency(locale: 'pt-br');

  double _valorReal = 0;
  double _cotacaoDolar = 0;
  String _infoText = "Informe os valores para poder calcular.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Conversor de Moeda"),
        centerTitle: true,
        backgroundColor: Colors.green,
        leading: Icon(Icons.attach_money, size: 60.0, color: Colors.white),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 10.0),
            cardReal(),
            SizedBox(height: 10.0),
            cardCotacaoDolar(),
            SizedBox(
              height: 10,
            ),
            buildContainerButton(context),
            SizedBox(
              height: 10,
            ),
            buildTextInfo(),
          ],
        ),
      ),
    );
  }

  Widget cardReal() {
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
                Text('Valor possuído em real:', style: _textStyle),
                Spacer(),
                Text('${formatoReal.format(_valorReal)}', style: _textStyle),
              ],
            ),
          ),
          Slider(
            value: _valorReal,
            min: 0,
            max: 10000,
            activeColor: Colors.green.shade800,
            inactiveColor: Colors.green.shade200,
            divisions: 1000,
            onChanged: (double value) {
              setState(() {
                _valorReal = value;
              });
            },
          ),
        ]),
      ),
    );
  }

  Widget cardCotacaoDolar() {
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
                Text('Cotação do Dolar:', style: _textStyle),
                Spacer(),
                Text('${formatoReal.format(_cotacaoDolar)}', style: _textStyle),
              ],
            ),
          ),
          Slider(
            value: _cotacaoDolar,
            min: 0,
            max: 10,
            activeColor: Colors.green.shade800,
            inactiveColor: Colors.green.shade200,
            divisions: 10,
            onChanged: (double value) {
              setState(() {
                _cotacaoDolar = value;
              });
            },
          ),
        ]),
      ),
    );
  }

  buildContainerButton(BuildContext context) {
    return Container(
      height: 50.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade600),
        onPressed: () {
          calcula();
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Text("Calcular",
            style: TextStyle(color: Colors.white, fontSize: 20.0)),
      ),
    );
  }

  void calcula() {
    setState(() {
      double real = _valorReal;
      double cotacao = _cotacaoDolar;

      double dolar = real / cotacao;
      double resultado = (real * 1.1) / 100;

      _infoText = "Valor possuído em real: ${real.toStringAsFixed(2)}\n" +
          "Valor possuído em dolar: ${dolar.toStringAsFixed(2)}\n" +
          "Valor do imposto IOF: ${resultado.toStringAsFixed(2)}";
    });
  }

  buildTextInfo() {
    return Text(
      _infoText,
      textAlign: TextAlign.left,
      style: TextStyle(color: Colors.black, fontSize: 20.0),
    );
  }
}

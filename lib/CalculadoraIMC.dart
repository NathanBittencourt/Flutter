// Calculadora IMC
/* 
VERIFICAR NULO
VERIFICAR IDADE
CLASSIFICAR DE ACORDO COM A IDADE
*/
// ignore_for_file: unused_import, unused_field, prefer_final_fields, prefer_const_constructors, unused_local_variable, non_constant_identifier_names, must_call_super, sort_child_properties_last

import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: CalculadoraIMC(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class CalculadoraIMC extends StatefulWidget {
  const CalculadoraIMC({Key? key}) : super(key: key);

  @override
  State<CalculadoraIMC> createState() => _CalculadoraIMCState();
}

class _CalculadoraIMCState extends State<CalculadoraIMC> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  TextEditingController _pesocontroller = TextEditingController();
  TextEditingController _alturacontroller = TextEditingController();
  TextEditingController _idadecontroller = TextEditingController();
  late String _resultado;

  @override
  void initState() {
    super.initState();
    limparCampos();
  }

  void limparCampos() {
    _pesocontroller.text = "";
    _alturacontroller.text = "";
    _idadecontroller.text = "";
    setState(() {
      _resultado = "Informe seus dados";
    });
  }

  void calcularIMC() {
    double peso = double.parse(_pesocontroller.text);
    double altura = double.parse(_alturacontroller.text) / 100.0;
    int idade = int.parse(_idadecontroller.text);
    double imc = peso / (pow(altura, 2));

    setState(() {
      _resultado = "IMC = ${imc.toStringAsFixed(1)}\n";

      if (idade > 0 && idade < 60) {
        if (imc < 18.5) {
          _resultado += "Classificação: Baixo peso";
        } else if (imc < 25.0) {
          _resultado += "Classificação: Peso adequado";
        } else if (imc < 30.0) {
          _resultado += "Classificação: Sobrepeso";
        } else if (imc < 35.0) {
          _resultado += "Classificação: Obesidade grau I";
        } else if (imc < 40.0) {
          _resultado += "Classificação: Obesidade grau II";
        } else {
          _resultado += "Classificação: Obesidade Extrema";
        }
      } else if (idade >= 60 && idade < 110) {
        if (imc <= 22) {
          _resultado += "Classificação: Baixo peso";
        } else if (imc < 27) {
          _resultado += "Classificação: Peso adequado";
        } else {
          _resultado += "Classificação: Sobrepeso";
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barraSuperior(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: formularioIMC(),
      ),
    );
  }

  AppBar barraSuperior() {
    return AppBar(
      title: Text("Calculadora de IMC"),
      backgroundColor: Colors.black,
      actions: [
        IconButton(
          icon: Icon(Icons.refresh),
          onPressed: () {
            limparCampos();
          },
        ),
      ],
    );
  }

  Widget botaoCalcular() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 36.0),
      child: ElevatedButton(
        onPressed: () {
          if (_formkey.currentState!.validate()) {
            calcularIMC();
          }
        },
        child: Text("CALCULAR", style: TextStyle(color: Colors.white)),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
        ),
      ),
    );
  }

  Widget textoResultado() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 36.0),
      child: Text(
        _resultado,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget textoPeso(
      {TextEditingController? controllerPeso,
      required String error,
      required String label}) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: label),
      controller: controllerPeso,
      validator: (text) {
        if (text == null || text.isEmpty) {
          return "Informe seu peso";
        } else if (double.parse(_pesocontroller.text) < 0 ||
            double.parse(_pesocontroller.text) == 0 ||
            double.parse(_pesocontroller.text).isNaN ||
            double.parse(_pesocontroller.text) > 300) {
          return "Informe um peso válido";
        } else {
          return text!.isEmpty ? error : null;
        }
      },
    );
  }

  Widget textoAltura(
      {TextEditingController? controllerAltura,
      required String error,
      required String label}) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: label),
      controller: controllerAltura,
      validator: (text) {
        if (text == null || text.isEmpty) {
          return "Informe sua altura";
        } else if (double.parse(_alturacontroller.text) < 0 ||
            double.parse(_alturacontroller.text) == 0 ||
            double.parse(_alturacontroller.text).isNaN ||
            double.parse(_alturacontroller.text) > 250) {
          return "Informe uma altura válida";
        } else {
          return text!.isEmpty ? error : null;
        }
      },
    );
  }

  Widget textoIdade(
      {TextEditingController? controllerIdade,
      required String error,
      required String label}) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: label),
      controller: controllerIdade,
      validator: (text) {
        if (text == null || text.isEmpty) {
          return "Informe sua idade";
        } else if (int.parse(_idadecontroller.text) < 0 ||
            int.parse(_idadecontroller.text).isNaN ||
            int.parse(_idadecontroller.text) > 110) {
          return "Informe uma idade válida";
        } else {
          return text!.isEmpty ? error : null;
        }
      },
    );
  }

  Form formularioIMC() {
    return Form(
      key: _formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          textoPeso(
            label: "Peso (kg)",
            error: "Insira seu peso",
            controllerPeso: _pesocontroller,
          ),
          textoAltura(
            label: "Altura (cm)",
            error: "Insira sua altura",
            controllerAltura: _alturacontroller,
          ),
          textoIdade(
            label: "Idade",
            error: "Insira sua idade",
            controllerIdade: _idadecontroller,
          ),
          textoResultado(),
          botaoCalcular(),
        ],
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty("_resultado", _resultado));
  }
}

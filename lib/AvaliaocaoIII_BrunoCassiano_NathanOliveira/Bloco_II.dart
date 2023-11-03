// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_final_fields, unused_field

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.red),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController dolarController = TextEditingController();
  TextEditingController cotacaoController = TextEditingController();

  String _infoText = "Informe os valores para poder calcular.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Conversor de Moeda"),
        centerTitle: true,
        backgroundColor: Colors.blue.shade600,
        leading: Icon(Icons.attach_money, size: 60.0, color: Colors.white),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                _resetaValores();
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              buildTextFormFieldDolar(),
              SizedBox(
                height: 10,
              ),
              buildTextFormFieldCotacao(),
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
      ),
    );
  }

  buildTextFormFieldDolar() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Valor possuído em dólar",
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
        ),
      ),
      controller: dolarController,
      validator: ((value) {
        if (value!.isEmpty) {
            return ("Informe o valor possuído em dólar.");
        } else if(double.parse(value) > 10000 || double.parse(value) < 0) {
            return ("O montante deve estar entre 0 e 10000 dólares.");
        }
        return null;
      }),
    );
  }

  buildTextFormFieldCotacao() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Cotação do dólar em real",
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
        ),
      ),
      controller: cotacaoController,
      validator: ((value) {
        if (value!.isEmpty) {
          return ("Informe a cotação do dólar em real.");
        } else if(double.parse(value) > 10 || double.parse(value) < 0) {
            return ("O valor da cotação deve estar entre 0 e 10.");
        }
        return null;
      }),
    );
  }

  buildContainerButton(BuildContext context) {
    return Container(
      height: 50.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade600),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            calcula();
            FocusScope.of(context).requestFocus(new FocusNode());
          }
        },
        child: Text("Calcular",
            style: TextStyle(color: Colors.white, fontSize: 20.0)),
      ),
    );
  }

  buildTextInfo() {
    return Text(
      _infoText,
      textAlign: TextAlign.left,
      style: TextStyle(color: Colors.black, fontSize: 20.0),
    );
  }

  void calcula() {
    setState(() {
      double dolar = double.parse(dolarController.text);
      double cotacao = double.parse(cotacaoController.text);

      double real = dolar * cotacao;
      double resultado = (real * 6.28) / 100;

      _infoText =
          "Valor possuído em dolár: ${dolar.toStringAsFixed(2)}\n" +
          "Valor possuído em reais: ${real.toStringAsFixed(2)}\n" +
          "Valor do imposto IOF: ${resultado.toStringAsFixed(2)}";
      
    });
  }

  _resetaValores() {
    setState(() {
      dolarController.text = "";
      cotacaoController.text = "";
      _infoText = "Informe os valores para poder calcular.";
    });
  }
}
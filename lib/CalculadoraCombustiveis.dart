/* 
Utilizando projeto que foi demonstrado na última aula híbrida e concluído nesta aula híbrida, crie um novo combustível: 
gasolina aditivada. Sendo que para isso devem ser feitas as seguintes melhorias no aplicativo:

a) Criação de um campo, seu FormField (com controller e valdiator);

b) Fazer verificação se o valor digitado da gasolina aditivada está vazio;

c) Realizar o cálculo (etanol/gasolina * 100) e associar o combustível de acordo com o valor obtido:

● Menor que 70%: Abastecer com etanol;

● Entre 70 e 90%: Abastecer com gasolina;

● Mais de 90%: abastecer com gasolina aditivada

d) Alterar o método calcula para exibir gasolina aditivada caso o etanol custe mais de 90% do valor da gasolina;

e) Limpar o valor da gasolina aditivada ao clicar no ícone de refresh.

f) Compactar todo o projeto (main.dart) em um arquivo .rar ou .zip para enviá-lo;

Obs.: Cópia do código outros alunos serão avaliados com nota 0 na atividade
*/

// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_final_fields, unused_field

import 'package:flutter/material.dart';
import 'package:primeiroappflutter/ListView-Dinamica.dart';

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

  TextEditingController gasolinaController = TextEditingController();
  TextEditingController etanolController = TextEditingController();
  TextEditingController aditivadaController = TextEditingController();

  String _infoText = "Informe o valor de cada combustível";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de Combustível"),
        centerTitle: true,
        backgroundColor: Colors.red,
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
              Icon(Icons.directions_car, size: 60.0, color: Colors.red),
              buildTextFormFieldGasolina(),
              SizedBox(
                height: 10,
              ),
              buildTextFormFieldEtanol(),
              SizedBox(
                height: 10,
              ),
              buildTextFormFieldAditivada(),
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

  buildTextFormFieldGasolina() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Preço da Gasolina",
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
        ),
      ),
      controller: gasolinaController,
      validator: ((value) {
        if (value!.isEmpty) {
          return ("Informe o valor da gasolina.");
        }
        return null;
      }),
    );
  }

  buildTextFormFieldEtanol() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Preço do Etanol",
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
        ),
      ),
      controller: etanolController,
      validator: ((value) {
        if (value!.isEmpty) {
          return ("Informe o valor do etanol.");
        }
        return null;
      }),
    );
  }

  buildTextFormFieldAditivada() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Preço da Gasolina Aditivada",
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
        ),
      ),
      controller: aditivadaController,
      validator: ((value) {
        if (value!.isEmpty) {
          return ("Informe o valor da gasolina aditivada.");
        }
        return null;
      }),
    );
  }

  buildContainerButton(BuildContext context) {
    return Container(
      height: 50.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
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
      double gasolina = double.parse(gasolinaController.text);
      double etanol = double.parse(etanolController.text);
      double aditivada = double.parse(etanolController.text);

      double resultado = (etanol / gasolina) * 100;

      if (resultado < 70) {
        _infoText =
            "Percentual do etanol em relação a gasolina: ${resultado.toStringAsPrecision(2)}"
            "\n\nAbasteça com etanol!";
      } else if (resultado < 90) {
        _infoText =
            "Percentual do etanol em relação a gasolina: ${resultado.toStringAsPrecision(2)}"
            "\n\nAbasteça com gasolina!";
      } else {
        _infoText =
            "Percentual do etanol em relação a gasolina: ${resultado.toStringAsPrecision(2)}"
            "\n\nAbasteça com gasolina aditivada!";
      }
    });
  }

  _resetaValores() {
    setState(() {
      gasolinaController.text = "";
      etanolController.text = "";
      aditivadaController.text = "";
      _infoText = "Informe o valor de cada combustível";
    });
  }
}

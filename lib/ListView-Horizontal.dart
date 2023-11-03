/*
Crie uma lista dinâmica, utilizando o recurso ListView, obedecendo os critérios definidos
abaixo:

1) Exibir seu nome e sua matrícula dentro da App Bar;

2) Criar uma lista com elementos infinitos;

3) Apresentar a lista no sentido horizontal;

4) Cada aluno deverá fazer os itens da lista com as referidas cores abaixo (utilizar a mesma cor na App Bar):

e) Nathan Oliveira: verde claro;

5) Compactar o arquivo .dart no formato .rar ou .zip para enviá-lo.
*/

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Nathan Oliveira - 11032110477"),
          backgroundColor: Colors.lightGreen,
        ),
        body: buildListView(),
      ),
    );
  }

  buildListView() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 1.0),
          color: Colors.lightGreen,
          child: Text('${index + 1}'),
        );
      },
    );
  }
}

//ignore_for_file: prefer_const_constructors;
/*
Utilizando Flutter crie um arquivo .dart com as seguintes especificações:

1) O arquivo deverá ter um Widget de texto com as seguintes informações 
(Nome aluno, matrícula e disciplina referida apresentados com a cor e o 
tom definidos para cada estudante):
e) Nathan Oliveira, Matrícula (Seu Número) e Delphi na cor azul 
(shade 200 - light);
*/

import 'package:flutter/material.dart';

main() {
    runApp(Container(
        child: Center(
            child: Text('Nathan Oliveira - 11032110477 - Delphi',
            textDirection: TextDirection.ltr,
            style: TextStyle(color: Colors.lightBlue.shade200, 
            fontSize: 50)),
        )));
}
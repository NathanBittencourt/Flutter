/* 
Utilizando o projeto construído nesta, substitua os 3 botões por 3 imagens de bandeiras de países conforme as instruções abaixo.

Lembre-se que as bandeiras devem estar dispostas verticalmente (de forma centralizada na coluna).

Nathan Oliveira: Suiça, Sérvia e Camarões;

Faça a importação na pasta correta, acrescente os arquivos no arquivo de permissões e acrescente os novos arquivos ao código;

Obs.: Imagem referenciada por url, mesmo que funcione, acarretará em desconto de nota por fugir da proposta da atividade;

Personalize a coluna com as propriedades MainAxisSize, MainAxisAlignment e CrossAxisAlignment, por exemplo;

Compactar todo o projeto (main.dart, pasta assets completa (com todas imagens do projeto) e pubspec.yaml) 
em um arquivo .rar ou .zip para enviá-lo
*/

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Nathan - Bandeiras: Suiça, Sérvia e Camarões'),
        ),
        body: Container(
          width: double.infinity,
          color: Colors.black,
          child: WidgetRowColumn(),
        ),
      ),
    );
  }

  WidgetRowColumn() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[

        SizedBox(
          height: 100.0,
          child: Image.asset(
            "assets/images/bandeira-suica.png",
            fit: BoxFit.contain,
            alignment: Alignment.center,
            height: 100,
            width: 1000,
          ),
        ),
        
        SizedBox(
          height: 100.0,
          child: Image.asset(
            "assets/images/bandeira-servia.png",
            fit: BoxFit.contain,
            alignment: Alignment.center,
            height: 100,
            width: 1000,
          ),
        ),
        
        SizedBox(
          height: 100.0,
          child: Image.asset(
            "assets/images/bandeira-camaroes.png",
            fit: BoxFit.contain,
            alignment: Alignment.center,
            height: 100,
            width: 1000,
          ),
        ),
        
      ],
    );
  }
}

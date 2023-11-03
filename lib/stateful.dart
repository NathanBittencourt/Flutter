//Stateful Page:

// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, library_private_types_in_public_api, deprecated_member_use, sort_child_properties_last

import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

//Material App = padrão do Google para design
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StatefulPage(title: 'Stateful Widget'),
    );
  }
}

class StatefulPage extends StatefulWidget {
  StatefulPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _StatefulPageState createState() => _StatefulPageState();
}

class _StatefulPageState extends State<StatefulPage> {
  int _contador = 0;

  void _aumentarContagem() {
    setState(() {
      _contador++;
    });
  }

  void _diminuirContagem() {
    setState(() {
      _contador--;
    });
  }

  void _zerarContagem() {
    setState(() {
      _contador = 0;
    });
  }

  //Scafold: estrutura de "andaime" de widgets
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_contador',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: 20),
            ElevatedButton(
                child: Text(
                  'Adicionar',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                onPressed: _aumentarContagem,
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                )),
            SizedBox(height: 10),
            ElevatedButton(
                child: Text(
                  'Zerar',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                onPressed: _zerarContagem,
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                )),
            SizedBox(height: 10),
            ElevatedButton(
                child: Text(
                  'Diminuir',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                onPressed: _diminuirContagem,
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                )),
          ],
        ),
      ),
    );
  }
}
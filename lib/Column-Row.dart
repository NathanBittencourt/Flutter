// ignore_for_file: non_constant_identifier_names, sort_child_properties_last, prefer_const_constructors

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
          title: Text('Widgets Básicos'),
        ),
        body: Container(
          height: double.infinity,
          color: Colors.purple,
          child: WidgetRowColumn(),
        ),
      ),
    );
  }

  WidgetRowColumn() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 20),
        ElevatedButton(
          child:
              Text('Siga', style: TextStyle(fontSize: 18, color: Colors.white)),
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          child:
              Text('Atenção', style: TextStyle(fontSize: 18, color: Colors.white)),
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 182, 182, 35),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          child:
              Text('Pare', style: TextStyle(fontSize: 18, color: Colors.white)),
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
        ),
      ],
    );
  }
}

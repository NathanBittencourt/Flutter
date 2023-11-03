//Navegação:

// ignore_for_file: prefer_const_constructors, unused_import, unused_local_variable, sort_child_properties_last, unnecessary_brace_in_string_interps

import 'package:primeiroappflutter/stateful.dart';
import 'package:primeiroappflutter/stateless.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Widgets Básicos',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => WidgetLogin(),
        '/stateful': (context) => StatefulPage(title: 'Widgets Básicos'),
        '/stateless': (context) => StatelessPage(),
      },
    );
  }
}

class WidgetLogin extends StatefulWidget {
  const WidgetLogin({super.key});

  @override
  State<WidgetLogin> createState() => _WidgetLoginState();
}

class _WidgetLoginState extends State<WidgetLogin> {
  TextStyle style =
      TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold);

  String logado = 'Aguardando credenciais';
  String email = '';
  String password = '';

  void loginRealizado() {
    setState(() {
      if (email == 'diego.fernandes@santamarcelina.edu.br' &&
          password == '12345') {
        Navigator.pushNamed(context, '/stateful');
      } else {
        Navigator.pushReplacementNamed(context, '/stateless');
      }
    });
  }

  void statefulPage() {
    setState(() {
      Navigator.pushNamed(context, '/stateful');
    });
  }

  void statelessPage() {
    setState(() {
      Navigator.pushNamed(context, '/stateless');
    });
  }

  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      onChanged: (text) {
        email = text;
      },
      obscureText: false,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: 'Informe um e-mail válido',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final passwordField = TextField(
      onChanged: (text) {
        password = text;
      },
      obscureText: true,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: 'Informe uma senha válida',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final buttonLogin = ButtonTheme(
      minWidth: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        child: Text(
          'Login',
          style: style.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: loginRealizado,
      ),
    );

    final buttonStateful = ButtonTheme(
      minWidth: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        child: Text(
          'Stateful Page',
          style: style.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: statefulPage,
      ),
    );

    final buttonStateless = ButtonTheme(
      minWidth: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        child: Text(
          'Stateless Page',
          style: style.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: statelessPage,
      ),
    );

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(40.0),
            child: Column(
              children: [
                SizedBox(
                    height: 150.0,
                    child: Image.asset("assets/images/login.png")),
                SizedBox(height: 40.0),
                emailField,
                SizedBox(height: 40.0),
                passwordField,
                SizedBox(height: 40.0),
                buttonLogin,
                SizedBox(height: 40.0),
                buttonStateful,
                SizedBox(height: 40.0),
                buttonStateless,
                SizedBox(height: 40.0),
                Text('Status do login: ${logado}',
                    style: Theme.of(context).textTheme.headlineMedium),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
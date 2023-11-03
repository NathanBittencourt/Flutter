/*Utilizando o projeto da tela de login, substitua a imagem existente pelos arquivos fornecidos, obedecendo às seguintes regras:

1) Cada aluno deve utilizar a imagem correspondente ao seu nome presente no arquivo Image6ADS disponibilizado para download nesta tarefa

Obs.: Pode substituir por outra imagem de melhor qualidade, desde que mantenha o mesmo nome que foi definido e seja semelhante (mesmo logo) ao arquivo original;

2) Faça a importação na pasta correta, acrescente o arquivo no arquivo de permissões e substitua o novo arquivo no local onde o caminho da imagem é passado;

Obs.: Imagem referenciada por url, mesmo que funcione, acarretará em desconto de nota por fugir da proposta da atividade;

3) Personalize a imagem com propriedades como width, height, alignment e fit, por exemplo;

4) Compactar todo o projeto (main.dart e pubspec.yaml) em um arquivo .rar ou .zip para enviá-lo*/

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
                  height: 300.0,
                  child: Image.network(
                    'https://cherry.img.pmdstatic.net/scale/https.3A.2F.2Fimg.2Egaming.2Egentside.2Ecom.2Fsto.2Ftags.2Fone-piece-61263f411d28b420d1458169_1bed47efad0cf7d95f85dc75.2Ejpg/autox375/quality/80/one-piece.jpg',
                    height: 1000,
                    width: 1000,
                  ),
                ),
                SizedBox(
                  height: 300.0,
                  child: Image.asset(
                    "assets/images/Pistons_Nathan_Oliveira.png",
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                    height: 100,
                    width: 1000,
                  ),
                ),
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

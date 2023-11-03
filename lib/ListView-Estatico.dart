import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Elementos da Natureza"),
        ),
        body: buildListView(),
      ),
    );
  }

  buildListView() {
    return ListView(
      children: [
        ListTile(
          leading: Icon(Icons.terrain),
          title: Text("Terra"),
          subtitle: Text(
            "O elemento terra é caracterizado pela rigidez, firmeza e solidez."
            ),
          trailing: Icon(Icons.terrain),
          selected: true,
        ),
        ListTile(
          leading: Icon(Icons.water),
          title: Text("Água"),
          subtitle: Text(
            "A água é fluida, sem forma e é caracterizada pelo movimento."
            ),
          trailing: Icon(Icons.water),
          enabled: false,
        ),
        ListTile(
          leading: Icon(CupertinoIcons.flame),
          title: Text("Fogo"),
          subtitle: Text(
            "O fogo é identificado com calor, luz e energia."
            ),
          trailing: Icon(CupertinoIcons.flame),
        ),
        ListTile(
            leading: Icon(Icons.air),
            title: Text("Ar"),
            subtitle: Text(
              "O ar é um gás. Suas propriedades são expansão, leveza, movimento, intangibilidade, ausência de forma."
              ),
            trailing: Icon(Icons.air),
            onTap: () {
              print("Item selecionado.");
            }),
        ListTile(
          leading: Icon(Icons.wifi_tethering),
          title: Text("Éter (Espírito)"),
          subtitle: Text(
            "O éter é ilimitado e vazio, mas potencialmente contém tudo, contém e está contido, nos dá uma sensação de expansão."
            ),
          trailing: Icon(Icons.wifi_tethering),
          onLongPress: () {
            print("Item selecionado 2.");
          },
        ),
      ],
    );
  }
}

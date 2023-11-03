import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("Prova 27/09/2023 - Questão 2 - Bruno & Nathan"),
        ),
        body: buildListView(),
      ),
    );
  }

  buildListView() {
    return ListView(
      children: [
        ListTile(
          leading: Icon(Icons.location_city),
          title: Text("Nova York/NY"),
          subtitle: Text("Metrópole"),
          trailing: Icon(Icons.location_city),
          onTap: () {
            debugPrint("Nova York/NY - Metrópole");
          },
        ),
        ListTile(
          leading: Icon(Icons.beach_access),
          title: Text("Miami/FL"),
          subtitle: Text("Praia"),
          trailing: Icon(Icons.beach_access),
          onTap: () {
            debugPrint("Miami/FL - Praia");
          },
        ),
        ListTile(
          leading: Icon(Icons.star_rounded),
          title: Text("Los Angeles/CA"),
          subtitle: Text("Hollywood"),
          trailing: Icon(Icons.star_rounded),
          onTap: () {
            debugPrint("Los Angeles/CA - Hollywood");
          },
        ),
        ListTile(
          leading: Icon(Icons.castle_sharp),
          title: Text("Orlando/FL"),
          subtitle: Text("Disney"),
          trailing: Icon(Icons.castle_sharp),
          onTap: () {
            debugPrint("Orlando/FL - Disney");
          },
        ),
        ListTile(
          leading: Icon(Icons.casino),
          title: Text("Las Vegas/NE"),
          subtitle: Text("Cassinos"),
          trailing: Icon(Icons.casino),
          onTap: () {
            debugPrint("Las Vegas/NE - Cassinos");
          },
        ),
        ListTile(
          leading: Icon(Icons.account_balance),
          title: Text("Washington/WA"),
          subtitle: Text("Governo"),
          trailing: Icon(Icons.account_balance),
          onTap: () {
            debugPrint("Washington/WA - Governo");
          },
        ),
        ListTile(
          leading: Icon(Icons.library_books),
          title: Text("Boston/MA"),
          subtitle: Text("Faculdades"),
          trailing: Icon(Icons.library_books),
          onTap: () {
            debugPrint("Boston/MA - Faculdades");
          },
        ),
        ListTile(
          leading: Icon(Icons.directions_car),
          title: Text("San Francisco/CA"),
          subtitle: Text("Golden Gate"),
          trailing: Icon(Icons.directions_car),
          onTap: () {
            debugPrint("San Francisco/CA - Golden Gate");
          },
        ),
      ],
    );
  }
}

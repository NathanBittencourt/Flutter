//Navegação:

// ignore_for_file: prefer_const_constructors, unused_import, unused_local_variable, sort_child_properties_last, unnecessary_brace_in_string_interps

import 'package:primeiroappflutter/componentes/aluno.dart';
import 'package:primeiroappflutter/componentes/professores.dart';
import 'package:primeiroappflutter/componentes/curso.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Aluno());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Widgets Básicos',
//       theme: ThemeData(
//         primaryColor: Colors.blue,
//       ),
//       initialRoute: '/aluno',
//       routes: {
//         '/aluno': (context) => AlunoPage(),
//         '/professores': (context) => ProfessorPage(),
//         '/curso': (context) => CursoPage(),
//       },
//     );
//   }
// }

// class WidgetLogin extends StatefulWidget {
//   const WidgetLogin({super.key});

//   @override
//   State<WidgetLogin> createState() => _WidgetLoginState();
// }

// class _WidgetLoginState extends State<WidgetLogin> {
//   TextStyle style =
//       TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold);

//   void irAluno() {
//     setState(() {
//       Navigator.pushNamed(context, '/aluno');
//     });
//   }

//   void irProfessor() {
//     setState(() {
//       Navigator.pushNamed(context, '/professores');
//     });
//   }

//   void irCurso() {
//     setState(() {
//       Navigator.pushNamed(context, '/curso');
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final buttonAluno = ButtonTheme(
//       minWidth: MediaQuery.of(context).size.width,
//       padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.black,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(30.0),
//           ),
//         ),
//         child: Text(
//           'Stateful Page',
//           style: style.copyWith(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         onPressed: irAluno,
//       ),
//     );

//     final buttonProfessor = ButtonTheme(
//       minWidth: MediaQuery.of(context).size.width,
//       padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.green,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(30.0),
//           ),
//         ),
//         child: Text(
//           'Stateless Page',
//           style: style.copyWith(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         onPressed: irProfessor,
//       ),
//     );

//     final buttonCurso = ButtonTheme(
//       minWidth: MediaQuery.of(context).size.width,
//       padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.green,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(30.0),
//           ),
//         ),
//         child: Text(
//           'Stateless Page',
//           style: style.copyWith(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         onPressed: irCurso,
//       ),
//     );

//     return Scaffold(
//       body: Center(
//         child: SingleChildScrollView(
//           child: Container(
//             color: Colors.white,
//             padding: EdgeInsets.all(40.0),
//             child: Column(
//               children: [
//                 SizedBox(
//                     height: 150.0,
//                     child: Image.asset("assets/images/login.png")),
//                 SizedBox(height: 40.0),
//                 buttonAluno,
//                 SizedBox(height: 40.0),
//                 buttonProfessor,
//                 SizedBox(height: 40.0),
//                 buttonCurso,
//                 SizedBox(height: 40.0),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
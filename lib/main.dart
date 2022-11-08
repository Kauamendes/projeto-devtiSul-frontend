import 'package:consumo_api_com_spring/paginas/cadastro.dart';
import 'package:consumo_api_com_spring/paginas/consulta.dart';
import 'package:consumo_api_com_spring/paginas/home.dart';
import 'package:consumo_api_com_spring/util/tema.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const mainPage());
}

class mainPage extends StatefulWidget {
  const mainPage({super.key});

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Tema().criaTema(),
      initialRoute: '/home',
      routes: {
        '/home':(context) => const Home(),
        '/consulta':(context) => const Consulta(),
        '/cadastro':(context) => const Cadastro(),
      },
    );
  }
}
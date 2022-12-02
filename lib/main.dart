import 'package:consumo_api_com_spring/paginas/cadasto_cidade.dart';
import 'package:consumo_api_com_spring/paginas/cadastro_pessoa.dart';
import 'package:consumo_api_com_spring/paginas/consulta_cidade.dart';
import 'package:consumo_api_com_spring/paginas/consulta_pessoa.dart';
import 'package:consumo_api_com_spring/paginas/home.dart';
import 'package:consumo_api_com_spring/util/tema.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Tema().criaTema(),
      initialRoute: '/home',
      routes: {
        '/home':(context) => const Home(),
        '/consulta/pessoa':(context) => const ConsultaPessoa(),
        '/cadastro/pessoa':(context) => const CadastroPessoa(),
        '/consulta/cidade':(context) => const ConsultaCidade(),
        '/cadastro/cidade':(context) => const CadastroCidade(),
      },
    );
  }
}
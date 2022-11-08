
import 'package:consumo_api_com_spring/util/componentes.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  GlobalKey<FormState> formController = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    home() {
      Navigator.of(context).pushReplacementNamed('/home');
    }

     cadastro() {
      Navigator.of(context).pushReplacementNamed('/cadastro');
    }

     consulta() {
      Navigator.of(context).pushReplacementNamed('/consulta');
    }

    return Scaffold(
      appBar: Componentes().criaAppBar("Utilização API", home),
      body: Form(
        child: Column(
          children: [
            Componentes().criaBotao(formController, cadastro, "Cadastro Pessoa"),
            Componentes().criaBotao(formController, consulta, "Consulta Pessoas"),
          ],
        ),
      ),
    );
  }
}
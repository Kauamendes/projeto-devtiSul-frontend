
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

     consultaPessoa() {
      Navigator.of(context).pushReplacementNamed('/consulta/pessoa');
    }

     consultaCidade() {
      Navigator.of(context).pushReplacementNamed('/consulta/cidade');
    }

    return Scaffold(
      appBar: Componentes().criaAppBar("Utilização API", home),
      body: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
        children: [
            const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
            Row (
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Componentes().criaCardComIconeTelaInicial(Icons.people,consultaPessoa, "Consultar Pessoas"),
              const SizedBox(width: 20),
              Componentes().criaCardComIconeTelaInicial(Icons.maps_home_work, consultaCidade, "Consultar Cidades"),
            ],
          ),
        ]),
      ),
    );
  }
}
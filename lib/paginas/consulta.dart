import 'package:consumo_api_com_spring/api/acesso_api.dart';
import 'package:consumo_api_com_spring/model/pessoa.dart';
import 'package:consumo_api_com_spring/util/componentes.dart';
import 'package:flutter/material.dart';

class Consulta extends StatefulWidget {
  const Consulta({Key? key}) : super(key: key);

  @override
  State<Consulta> createState() => _ConsultaState();
}

class _ConsultaState extends State<Consulta> {
 GlobalKey<FormState> formController = GlobalKey<FormState>();
 List<Pessoa> lista = [];

  @override
  Widget build(BuildContext context) {
    home() {
      Navigator.of(context).pushReplacementNamed('/home');
    }
    
    listarTodas() async {
      List<Pessoa> pessoas = await AcessoApi().listaPessoas();
      setState(() {
        lista = pessoas;
      });
    }

    editar() {
      Navigator.of(context).pushReplacementNamed('/cadastro');
    }

    excluirPessoa(id) {
      AcessoApi().excluirPessoa(id);
    }

    excluir() {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Excluir Cliente"),
          content: const Text("Tem certeza?"),
          actions: <Widget> [
            FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Sim"),
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Não"),
            ),
          ],
        ),
        );
    }

    return Scaffold(
      appBar: Componentes().criaAppBar('Utilização API', home),
      body: Form(
        key: formController,
        child: Column(
          children: [
            Componentes().criaBotao(formController, listarTodas, "Listar Todas"),
            Expanded(
              child: ListView.builder(
                itemCount: lista.length,
                itemBuilder: (context, indice) {
                 return Card(
                  elevation: 6,
                  margin: const EdgeInsets.all(5),
                  child: Componentes().criaItemPessoa(lista[indice], editar, excluir),
                 );
                },
              )
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:consumo_api_com_spring/api/acesso_api.dart';
import 'package:consumo_api_com_spring/model/cidade.dart';
import 'package:consumo_api_com_spring/util/componentes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';


class ConsultaCidade extends StatefulWidget {
  const ConsultaCidade({super.key});

  @override
  State<ConsultaCidade> createState() => _ConsultaCidadeState();
}

class _ConsultaCidadeState extends State<ConsultaCidade> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();
  List<Cidade> lista = [];

  listarTodas() async {
    List<Cidade> cidades = await AcessoApi().listaCidades();
    setState(() {
      lista = cidades;
    });
  }

  @override
  void initState() {
    listarTodas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    home() {
      Navigator.of(context).pushReplacementNamed("/home");
    }

    criaItemCidade(Cidade c) {
      return ListTile(
        title: Componentes().criaTexto("${c.id} - ${c.nome} (${c.uf})", 18),
        trailing: FittedBox(
          fit: BoxFit.fill,
          child: Row(
            children: [
              IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    Navigator.pushNamed(context, "/cadastro/cidade",
                        arguments: c);
                  }),
              IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () async {
                    await AcessoApi().excluirCidade(c.id);
                    setState(() {
                      listarTodas();
                    });
                  })
            ],
          ),
        ),
      );
    }

    irTelaCadastro() {
      Navigator.pushNamed(
        context,
        "/cadastro/cidade",
        arguments: Cidade(0, "", ""),
      );
    }

    return Scaffold(
      appBar: Componentes().criaAppBarSearchCidade("Buscar", home, context),
      body: Form(
        key: formController,
        child: Column(
          children: <Widget>[
            Componentes()
                .criaBotao(formController, listarTodas, "Listar Todas"),
            Expanded(
              child: Container(
                child: ListView.builder(
                    itemCount: lista.length,
                    itemBuilder: (context, indice) {
                      return Card(
                        elevation: 6,
                        margin: EdgeInsets.all(5),
                        child: criaItemCidade(lista[indice]),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: irTelaCadastro,
        backgroundColor: Colors.green,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
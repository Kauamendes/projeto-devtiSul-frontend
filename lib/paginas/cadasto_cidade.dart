import 'package:consumo_api_com_spring/api/acesso_api.dart';
import 'package:consumo_api_com_spring/model/cidade.dart';
import 'package:consumo_api_com_spring/util/componentes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';


class CadastroCidade extends StatefulWidget {
  const CadastroCidade({Key? key}) : super(key: key);

  @override
  State<CadastroCidade> createState() => _CadastroCidadeState();
}

class _CadastroCidadeState extends State<CadastroCidade> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();
  TextEditingController txtNome = TextEditingController();
  TextEditingController txtUF = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Cidade;
    txtNome.text = args.nome;
    txtUF.text = args.uf;

    cadastrar() async {
      Cidade c = Cidade(args.id, txtNome.text, txtUF.text);
      if (c.id == 0) {
        await AcessoApi().insereCidade(c.toJson());
      } else {
        await AcessoApi().editaCidade(c.toJson(), c.id);
      }
      Navigator.of(context).pushReplacementNamed("/consulta/cidade");
    }

    home() {
      Navigator.of(context).pushReplacementNamed("/home");
    }

    return Scaffold(
      appBar: Componentes().criaAppBar("Utilização API", home),
      body: Form(
        key: formController,
        child: Column(
          children: [
            Componentes().criaInputText(
                TextInputType.text, "Cidade", txtNome, "Informe a cidade"),
            Componentes().criaInputText(
                TextInputType.text, "UF", txtUF, "Informe a UF"),
            Componentes().criaBotao(formController, cadastrar, "Cadastrar"),
          ],
        ),
      ),
    );
  }
}
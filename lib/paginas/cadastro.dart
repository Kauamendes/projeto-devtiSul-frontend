import 'package:consumo_api_com_spring/api/acesso_api.dart';
import 'package:consumo_api_com_spring/model/cidade.dart';
import 'package:consumo_api_com_spring/model/pessoa.dart';
import 'package:consumo_api_com_spring/util/combo_cidade.dart';
import 'package:consumo_api_com_spring/util/componentes.dart';
import 'package:consumo_api_com_spring/util/radio_sexo.dart';
import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {

  GlobalKey<FormState> formController = GlobalKey<FormState>();
  TextEditingController txtNome = TextEditingController();
  TextEditingController txtSexo = TextEditingController(text: 'M');
  TextEditingController txtIdade = TextEditingController();
  TextEditingController txtCidade = TextEditingController();

  @override
  Widget build(BuildContext context) {
    cadastar() {
      Pessoa p =
      Pessoa(0, txtNome.text, txtSexo.text, int.parse(txtIdade.text), Cidade(int.parse(txtCidade.text), "", ""));
      AcessoApi().inserePessoa(p.toJson());
      Navigator.of(context).pushReplacementNamed('/consulta');
    }
    home() {
      Navigator.of(context).pushReplacementNamed('/home');
    }

    return Scaffold(
      appBar: Componentes().criaAppBar('Utilização API', home),
      body: Form(
        child: Column(
          children: [
            Componentes().criaInputText(TextInputType.text, "Nome", txtNome, "Informe o nome"),
            Componentes().criaInputText(TextInputType.text, "Idade", txtIdade, "Informe a idade"),
            Center(child: RadioSexo(controller: txtSexo)),
            Center(child: ComboCidade(controller: txtCidade)),
            Componentes().criaBotao(formController, cadastar, "Cadastrar"),
          ],
        ),
      ),
    );
  }
}
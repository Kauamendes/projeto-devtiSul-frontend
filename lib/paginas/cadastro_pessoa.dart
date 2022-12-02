import 'package:consumo_api_com_spring/api/acesso_api.dart';
import 'package:consumo_api_com_spring/model/cidade.dart';
import 'package:consumo_api_com_spring/model/pessoa.dart';
import 'package:consumo_api_com_spring/util/combo_cidade.dart';
import 'package:consumo_api_com_spring/util/componentes.dart';
import 'package:consumo_api_com_spring/util/radio_sexo.dart';
import 'package:flutter/material.dart';

class CadastroPessoa extends StatefulWidget {
  const CadastroPessoa({Key? key}) : super(key: key);

  @override
  State<CadastroPessoa> createState() => _CadastroPessoaState();
}

class _CadastroPessoaState extends State<CadastroPessoa> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();
  TextEditingController txtNome = TextEditingController();
  TextEditingController txtSexo = TextEditingController(text: "M");
  TextEditingController txtIdade = TextEditingController();
  TextEditingController txtCidade = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Pessoa;
    txtNome.text = args.nome;
    txtSexo.text = args.sexo;
    txtIdade.text = args.idade.toString();
    txtSexo.text = args.sexo;
    txtCidade.text = args.cidade.toString();

    cadastrar() async {
      Pessoa p = Pessoa(args.id, txtNome.text, txtSexo.text,
          int.parse(txtIdade.text), Cidade(int.parse(txtCidade.text), "", ""));
      if (p.id == 0) {
        await AcessoApi().inserePessoa(p.toJson());
      } else {
        await AcessoApi().editarPessoa(p.toJson(), p.id);
      }
      Navigator.of(context).pushReplacementNamed("/consulta/pessoa");
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
                TextInputType.text, "Nome", txtNome, "Informe o nome"),
            Componentes().criaInputText(
                TextInputType.number, "Idade", txtIdade, "Informe a idade"),
            Center(
              child: RadioSexo(
                controller: txtSexo,
              ),
            ),
            Center(
              child: ComboCidade(
                controller: txtCidade,
              ),
            ),
            Componentes().criaBotao(formController, cadastrar, "Cadastrar"),
          ],
        ),
      ),
    );
  }
}
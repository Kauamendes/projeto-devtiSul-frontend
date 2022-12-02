import 'package:consumo_api_com_spring/api/acesso_api.dart';
import 'package:consumo_api_com_spring/model/cidade.dart';
import 'package:consumo_api_com_spring/model/pessoa.dart';
import 'package:consumo_api_com_spring/util/componentes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';


class ConsultaPessoa extends StatefulWidget {
  const ConsultaPessoa({Key? key}) : super(key: key);

  @override
  State<ConsultaPessoa> createState() => _ConsultaPessoaState();
}

class _ConsultaPessoaState extends State<ConsultaPessoa> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();
  List<Pessoa> lista = [];

   listarTodas() async {
      List<Pessoa> pessoas = await AcessoApi().listaPessoas();
      setState(() {
        lista = pessoas;
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

      irTelaCadastro() {
      Navigator.pushNamed(
        context,
        "/cadastro/pessoa",
        arguments: Pessoa(0, "", "M", 0, Cidade(0,"", "")),
      );
    }

    criaItemPessoa(Pessoa p) {
    String sexo = p.sexo == "M" ? "Masculino" : "Feminino";
    return ListTile(
      title: Componentes().criaTexto("${p.id} - ${p.nome}  (${p.cidade.nome}/${p.cidade.uf})", 18),
      subtitle: Componentes().criaTexto("${p.idade} anos - ${p.sexo}",18),
      trailing: FittedBox(
          fit: BoxFit.fill,
          child: Row(
            children: [
              IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    Navigator.pushNamed(context, "/cadastro/pessoa",
                        arguments: p);
                  }),
              IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () async {
                    await AcessoApi().excluirPessoa(p.id);
                    setState(() {
                      listarTodas();
                    });
                  })
            ],
          ),
      )
    );
  }

    return Scaffold(
      appBar: Componentes().criaAppBarSearchCliente("Buscar", home, context),
      body: Form(
        key: formController,
        child: Column(
          children: [
            Componentes()
                .criaBotao(formController, listarTodas, "Listar Todas"),
            Expanded(
              child: Container(
                child: ListView.builder(
                    itemCount: lista.length,
                    itemBuilder: (context, indice) {
                      return Card(
                        elevation: 6,
                        margin: const EdgeInsets.all(5),
                        child: criaItemPessoa(lista[indice]),
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
       )
    );
  }
}
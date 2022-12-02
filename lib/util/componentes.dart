
import 'package:consumo_api_com_spring/api/acesso_api.dart';
import 'package:consumo_api_com_spring/model/cidade.dart';
import 'package:consumo_api_com_spring/model/pessoa.dart';
import 'package:consumo_api_com_spring/paginas/pesquisa.dart';
import 'package:consumo_api_com_spring/paginas/pesquisa_cliente.dart';
import 'package:flutter/material.dart';

class Componentes {
  criaAppBar(texto, acao) {
    return AppBar(
      title: criaTexto(texto, 30),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.home),
          onPressed: acao,
        )
      ],
    );
  }

  criaTexto(conteudo, tamanho) {
    return Text(
      conteudo,
      style: TextStyle(
        fontSize: tamanho,
      ),
    );
  }

   criaInputText(tipoTeclado, textoEtiqueta, controlador, msgValidacao) {
    return TextFormField(
      keyboardType: tipoTeclado,
      decoration: InputDecoration(
        labelText: textoEtiqueta,
        labelStyle: const TextStyle(
          color: Colors.green,
        ),
      ),
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.green,
        fontSize: 25.0,
      ),
      controller: controlador,
       validator: ((value) {
        if (value!.isEmpty) {
          return msgValidacao;
        }
   }),
   );
  }

  criaBotao(controladorFormulario, funcao, titulo) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
            height: 70,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                  funcao();
              },
              child: Text(
                titulo,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  criaItemPessoa(Pessoa p, editar, excluir) {
     String sexo = p.sexo == "M" ? "Masculino" : "Feminino";
     return ListTile(
      title: criaTexto("${p.id} - ${p.nome}", 20),
      subtitle: criaTexto("${p.idade} anos - ($sexo)", 20),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: <Widget> [
            IconButton(onPressed: editar, icon: const Icon(Icons.edit)),
            IconButton(onPressed: excluir, icon: const Icon(Icons.delete))
          ],
        ),
      ),
     );
  }

  criaItemPessoa2(Pessoa p, context) {
     String sexo = p.sexo == "M" ? "Masculino" : "Feminino";
     return ListTile(
      title: criaTexto("${p.id} - ${p.nome}  (${p.cidade.nome}/${p.cidade.uf})", 20),
      subtitle: criaTexto("${p.idade} anos - ($sexo)", 20),
     trailing: FittedBox(
          fit: BoxFit.fill,
          child: Row(
            children: [
              IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "/cadastro/pessoa",
                        arguments: p);
                  }),
              IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () async {
                    await AcessoApi().excluirPessoa(p.id);
                    Navigator.pushReplacementNamed(context, "/consulta/pessoa");
                  })
            ],
          ),
        ),
     );
  }

  criaItemCidade(Cidade c, editar, excluir) {
     return ListTile(
      title: criaTexto("${c.id} - ${c.nome}", 20),
      subtitle: criaTexto(c.uf, 20),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: <Widget> [
            IconButton(onPressed: editar, icon: const Icon(Icons.edit)),
            IconButton(onPressed: excluir, icon: const Icon(Icons.delete))
          ],
        ),
      ),
     );
  }

  criaItemCidade2(Cidade c, context) {
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
                    Navigator.pushReplacementNamed(context, "/consulta/cidade");
                  })
            ],
          ),
        ),
      );
    }

criaAppBarSearchCidade(texto, acao, [context]) {
    return AppBar(
      title: criaTexto(texto, 18),
      centerTitle: true,
      actions: <Widget>[
        IconButton(onPressed: acao, icon: const Icon(Icons.home)),
        IconButton(onPressed: () {
          showSearch(context: context, delegate: Pesquisa());
        },
          icon: const Icon(Icons.search),
        )
      ],
    );
  }

  criaAppBarSearchCliente(texto, acao, [context]) {
    return AppBar(
      title: criaTexto(texto, 18),
      centerTitle: true,
      actions: <Widget>[
        IconButton(onPressed: acao, icon: const Icon(Icons.home)),
        IconButton(onPressed: () {
          showSearch(context: context, delegate: PesquisaCliente());
        },
          icon: const Icon(Icons.search),
        )
      ],
    );
  }

  criaCardComIconeTelaInicial(icon, funcao, texto) {
     return Center(
      child: Card(
        elevation: 10,
        color: Colors.lightGreen,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(width: 10),
              Icon(icon, size: 200.0),
              ElevatedButton(
                onPressed: funcao,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  fixedSize: const Size(200, 20),
                ),
                 child: Text(texto, style: const TextStyle(color: Colors.white)),
              ),
            ],
          ),
          ),
      ),
     );
  }

}
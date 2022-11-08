
import 'package:consumo_api_com_spring/model/pessoa.dart';
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
                primary: Colors.green,
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
      trailing: Container(
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

}
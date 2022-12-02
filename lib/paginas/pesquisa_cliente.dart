import 'dart:convert';
import 'dart:js';

import 'package:consumo_api_com_spring/api/acesso_api.dart';
import 'package:consumo_api_com_spring/model/cidade.dart';
import 'package:consumo_api_com_spring/model/pessoa.dart';
import 'package:consumo_api_com_spring/util/componentes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class PesquisaCliente extends SearchDelegate<AcessoApi> {
  @override
  String get searchFieldLabel => "Ex: nome ou cidade";

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: (() {
          query = "";
        }),
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, AcessoApi());
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    }
    return FutureBuilder<List>(
      future: AcessoApi().buscaClientesPorNome(query),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
           List<Pessoa> clientes = snapshot.data!.cast<Pessoa>();
          return ListView.builder(
              itemCount: clientes.length,
              itemBuilder: (context, index) {
                return Componentes().criaItemPessoa2(clientes[index], context);
              });
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Erro ao pesquisar clientes"),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
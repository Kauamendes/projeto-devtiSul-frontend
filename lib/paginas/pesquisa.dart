import 'dart:convert';
import 'dart:js';

import 'package:consumo_api_com_spring/api/acesso_api.dart';
import 'package:consumo_api_com_spring/model/cidade.dart';
import 'package:consumo_api_com_spring/util/componentes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Pesquisa extends SearchDelegate<AcessoApi> {
  @override
  String get searchFieldLabel => "Ex: cidade ou Uf";

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
      future: AcessoApi().buscaCidadePorNomeOuUf(query),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
           List<Cidade> cidades = snapshot.data!.cast<Cidade>();
          return ListView.builder(
              itemCount: cidades.length,
              itemBuilder: (context, index) {
                return Componentes().criaItemCidade2(cidades[index], context);
              });
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Erro ao pesquisar cidades"),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
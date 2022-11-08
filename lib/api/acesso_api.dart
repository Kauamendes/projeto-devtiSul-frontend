import 'dart:convert';

import 'package:consumo_api_com_spring/model/cidade.dart';
import 'package:consumo_api_com_spring/model/pessoa.dart';
import 'package:http/http.dart';

class AcessoApi {

  Future<List<Pessoa>> listaPessoas() async {
    String url = "http://localhost:8080/cliente";
    Response resposta = await get(Uri.parse(url));
    String jsonFormatadoUft8 = utf8.decode(resposta.bodyBytes);
    Iterable a = json.decode(jsonFormatadoUft8);
    List<Pessoa> pessoas = List<Pessoa>.from(a.map((p) => Pessoa.fromJson(p)));
    return pessoas;
  }

  Future<List<Cidade>> listaCidades() async {
    String url = 'http://localhost:8080/cidade';
    Response resposta = await get(Uri.parse(url));
    String jsonFormatadoUtf8 = utf8.decode(resposta.bodyBytes);
    Iterable l = json.decode(jsonFormatadoUtf8);
    List<Cidade> cidades = List<Cidade>.from(l.map((e) => Cidade.fromJson(e)));
    return cidades;
  }

  Future<void> inserePessoa(Map<String, dynamic> pessoa) async {
    String url = 'http://localhost:8080/cliente';
    Map<String, String> headers = {'Content-Type' : 'application/json; charset=UTF-8'};
    Response reposta = await post(Uri.parse(url), headers: headers, body: json.encode(pessoa));
    
  }

  Future<void> editarPessoa(Map<String, dynamic> pessoa) async {
    String url = 'http://localhost:8080/cliente/${pessoa['id']}';
    Map<String, String> headers = {'Content-Type' : 'application/json; charset=UTF-8'};
    Response reposta = await put(Uri.parse(url), headers: headers, body: json.encode(pessoa));
  }

  Future<void> excluirPessoa(int pessoaId) async {
    String url = 'http://localhost:8080/cliente/${pessoaId}';
    Map<String, String> headers = {'Content-Type' : 'application/json; charset=UTF-8'};
    Response reposta = await delete(Uri.parse(url), headers: headers);
  }

  Future<void> insereCidade(Map<String, dynamic> cidade) async {
    String url = 'http://localhost:8080/cidade';
    Map<String, String> headers = {'Content-Type' : 'application/json; charset=UTF-8'};
    Response reposta = await post(Uri.parse(url), headers: headers, body: json.encode(cidade));
  }

  Future<void> editaCidade(Map<String, dynamic> cidade) async {
    String url = 'http://localhost:8080/cidade/${cidade['id']}';
    Map<String, String> headers = {'Content-Type' : 'application/json; charset=UTF-8'};
    Response reposta = await post(Uri.parse(url), headers: headers, body: json.encode(cidade));
  }

  Future<void> excluirCidade(int cidadeId) async {
    String url = 'http://localhost:8080/cidade/${cidadeId}';
    Map<String, String> headers = {'Content-Type' : 'application/json; charset=UTF-8'};
    Response reposta = await delete(Uri.parse(url), headers: headers);
  }

}
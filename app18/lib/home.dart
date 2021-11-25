import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String baseURL = 'https://api.github.com/users';

class Api {
  getGithub(user) async {
    String url = '$baseURL/$user';

    print(url);

    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = json.decode(response.body);
    return retorno;
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController userController = TextEditingController();
  UserGithub user =
  UserGithub(null, null, null, null, null, null, null, null, null);

  _recuperarGithub() async {
    var api = Api();
    var retorno = await api.getGithub(userController.text);

    if (retorno.isNotEmpty) {
      setState(() {
        user = UserGithub(
          retorno["login"],
          retorno["id"],
          retorno["avatar_url"],
          retorno["repos_url"],
          retorno["name"],
          retorno["public_repos"],
          retorno["followers"],
          retorno["following"],
          retorno["created_at"],
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil do GITHUB", style: TextStyle(fontSize:20, color: Colors.black)),
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(

          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: user.avatar_url != null
                    ? Image.network(
                  user.avatar_url.toString(),
                  height: 100,
                )
                    : Image.network(
                  "https://cdn-icons-png.flaticon.com/512/25/25231.png",
                  height: 100,
                ),
              ),
              TextField(

                decoration: InputDecoration(
                  labelText: "Digite o login do Git",
                  labelStyle: TextStyle(color: Colors.black38),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 25.0),
                controller: userController,
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Container(
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: _recuperarGithub,
                    child: Text(
                      "Obter Perfil",
                      style: TextStyle(
                        color: Colors.black,

                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "Id: ${user.id ?? ''}",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "Nome: ${user.name ?? ''}",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "Repositórios: ${user.public_repos ?? ''}",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "Criado em: ${user.created_at ?? ''}",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "Seguidores: ${user.followers ?? ''}",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "Seguindo: ${user.following ?? ''}",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              )
            ],
          )),
   backgroundColor: Colors.amber, );
  }
}

class UserGithub {
  final String? login;
  final int? id;
  final String? avatar_url;
  final String? repos_url;
  final String? name;
  final int? public_repos;
  final int? followers;
  final int? following;
  final String? created_at;

  UserGithub(
      this.login,
      this.id,
      this.avatar_url,
      this.repos_url,
      this.name,
      this.public_repos,
      this.followers,
      this.following,
      this.created_at,
      );
}
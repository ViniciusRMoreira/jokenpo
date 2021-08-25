import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("images/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["Pedra", "Papel", "Tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    switch (escolhaApp) {
      case "Pedra":
        setState(() {
          this._imagemApp = AssetImage("images/pedra.png");
        });
        break;
      case "Papel":
        setState(() {
          this._imagemApp = AssetImage("images/papel.png");
        });
        break;

      case "Tesoura":
        setState(() {
          this._imagemApp = AssetImage("images/tesoura.png");
        });
        break;
    }
    if ((escolhaUsuario == "Pedra" && escolhaApp == "Tesoura") ||
        (escolhaUsuario == "Tesoura" && escolhaApp == "Papel") ||
        (escolhaUsuario == "Papel" && escolhaApp == "Pedra")) {
      setState(() {
        this._mensagem = "Você ganhou!";
      });
    } else if ((escolhaApp == "Pedra" && escolhaUsuario == "Tesoura") ||
        (escolhaApp == "Tesoura" && escolhaUsuario == "Papel") ||
        (escolhaApp == "Papel" && escolhaUsuario == "Pedra")) {
      setState(() {
        this._mensagem = "Você perdeu!";
      });
    } else {
      setState(() {
        this._mensagem = "Empatou!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Jokepo",
          style: TextStyle(),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(padding: EdgeInsets.all(20)),
          Text(
            "Escolha do App:",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Padding(padding: EdgeInsets.all(20)),
          Image(
            image: this._imagemApp,
            height: 100,
          ),
          Padding(padding: EdgeInsets.all(20)),
          Text(
            this._mensagem,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(padding: EdgeInsets.all(20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () => _opcaoSelecionada("Pedra"),
                child: Image.asset("images/pedra.png", height: 100),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("Papel"),
                child: Image.asset("images/papel.png", height: 100),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("Tesoura"),
                child: Image.asset("images/tesoura.png", height: 100),
              ),
            ],
          )
        ],
      ),
    );
  }
}

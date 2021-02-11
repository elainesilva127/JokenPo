import 'package:flutter/material.dart';
import 'dart:math';
class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagemApp = AssetImage("imagens/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";
  void _opcaoSelecionada(String usuarioEscolha )
  {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random(). nextInt(3);
    var escolhaApp = opcoes[numero];

    print ("Escolha do App:" + escolhaApp);
    print(" Escolha do usuario:" + usuarioEscolha);

    switch(escolhaApp){
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("imagens/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imagemApp = AssetImage("imagens/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("imagens/tesoura.png");
        });
        break;
    }
    if (
        (usuarioEscolha == "pedra"&& escolhaApp == "tesoura") ||
        (usuarioEscolha == "tesoura"&& escolhaApp == "papel") ||
        (usuarioEscolha == "papel" && escolhaApp == "pedra")

    ){
      setState(() {
        this._mensagem ="Parabéns! Você ganhou :)";
      });

    }else if(
        (escolhaApp == "pedra"&& usuarioEscolha == "tesoura") ||
        (escolhaApp == "tesoura"&& usuarioEscolha == "papel") ||
        (escolhaApp == "papel" && usuarioEscolha == "pedra")
    ){
      setState(() {
        this._mensagem = "Você perdeu :(";
      });

    }else{
      setState(() {
        this._mensagem ="Empatamos ;)";
      });
    }

  }
  //exibição da imagem escolhida
  // ignore: expected_class_member

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange,
        title: Text ("JokenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App:",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image(image: _imagemApp, height: 150,),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada ("pedra"),
                child:Image.asset("imagens/pedra.png", height: 130,) ,
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada ("papel"),
                child:Image.asset("imagens/papel.png", height: 130,) ,
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada ("tesoura"),
                child:Image.asset("imagens/tesoura.png", height: 130,) ,
              ),
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CheckBoxRectangle extends StatelessWidget {
  final String texto;
  final bool valor;
  final Function funcao;

  const CheckBoxRectangle(
    this.texto,
    this.valor,
    this.funcao,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: valor ? Colors.red : Color(0xffdcdcdc),
        borderRadius: BorderRadius.all(
          Radius.circular(7),
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(7)),
        onTap: () => funcao(!valor),
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Row(
            children: <Widget>[
              Container(
                width: 20,
                margin: EdgeInsets.only(
                  right: 7,
                ),
                child: Transform.scale(
                  scale: 0.8,
                  child: Checkbox(
                    checkColor: Colors.red,
                    activeColor: Colors.white,
                    value: valor,
                    onChanged: (bool novoValor) => funcao(novoValor),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Text(
                    texto,
                    style: TextStyle(
                      color: valor ? Colors.white : Colors.black54,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

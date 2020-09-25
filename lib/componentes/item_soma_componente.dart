import 'package:flutter/material.dart';

class ItemSoma extends StatelessWidget {
  final String texto;
  final int pontos;

  ItemSoma(
    this.texto,
    this.pontos,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          texto,
          style: TextStyle(color: Colors.black54),
        ),
        Flexible(
          child: Column(
            children: <Widget>[
              Text(
                pontos.toString(),
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              Text(
                "ponto(s)",
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

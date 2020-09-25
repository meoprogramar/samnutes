import 'package:flutter/material.dart';

class CheckBoxCustomizado extends StatelessWidget {
  final String texto;
  final bool valor;
  final Function funcao;
  final double espacamento;

  const CheckBoxCustomizado(
    this.texto,
    this.valor,
    this.funcao, {
    this.espacamento = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () => (funcao(!valor)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: espacamento),
        child: Row(
          children: <Widget>[
            Container(
              width: 20,
              child: Checkbox(
                value: valor,
                onChanged: (bool valor) => funcao(valor),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              child: Text(
                texto,
                overflow: TextOverflow.visible,
                style: TextStyle(
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Navegacao extends StatelessWidget {
  final Function() avancar;
  final Function() voltar;

  Navegacao({this.voltar, this.avancar});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        voltar != null
            ? Padding(
                padding: EdgeInsets.only(left: 30),
                child: FloatingActionButton(
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.black87,
                  ),
                  onPressed: voltar,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  highlightElevation: 0,
                ),
              )
            : SizedBox(),
        avancar != null
            ? FloatingActionButton(
                child: const Icon(
                  Icons.arrow_forward,
                  color: Colors.black87,
                ),
                onPressed: avancar,
                backgroundColor: Colors.transparent,
                elevation: 0,
                highlightElevation: 0,
              )
            : SizedBox(),
      ],
    );
  }
}

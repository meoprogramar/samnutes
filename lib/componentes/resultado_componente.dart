import 'package:flutter/material.dart';
import 'package:sam_nutes/modelo/relatorio.dart';

class Resultado extends StatelessWidget {
  final Relatorio relatorio;

  const Resultado(this.relatorio);

  @override
  Widget build(BuildContext context) {
    List<dynamic> configuracoes = relatorio.configuracoesGrauRisco();
    return Padding(
      padding: const EdgeInsets.only(left: 14.0, right: 14.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          boxShadow: [
            new BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 8.0,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Card(
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.all(0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          elevation: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                color: configuracoes[4],
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        "Grau de risco:",
                        style: TextStyle(
                          color: configuracoes[5],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        configuracoes[0],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: configuracoes[5],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Frequência de avaliação:",
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      configuracoes[1],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                    Divider(
                      height: 30,
                      color: Colors.black12,
                    ),
                    Text(
                      "Resposta clínica:",
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      configuracoes[2],
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                    Divider(
                      height: 30,
                      color: Colors.black12,
                    ),
                    Text(
                      "Conduta:",
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      configuracoes[3],
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sam_nutes/componentes/botao_principal_componente.dart';
import 'package:sam_nutes/modelo/relatorio.dart';

class OutroDiagnostico extends StatefulWidget {
  final Relatorio relatorio;
  final Function recomecar;

  const OutroDiagnostico(this.relatorio, this.recomecar);

  @override
  _OutroDiagnosticoState createState() => _OutroDiagnosticoState();
}

class _OutroDiagnosticoState extends State<OutroDiagnostico> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Avaliação",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Síndrome gripal",
                        style: TextStyle(color: Colors.black54),
                      ),
                      Text(
                        "NÃO",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
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
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        "Conduta:",
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "O paciente não apresenta síndrome gripal, logo deve-se considerar outros diagnósticos.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 120,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              color: Colors.transparent,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  BotaoPrincipal("NOVA AVALIAÇÃO", Icons.refresh, () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    widget.recomecar();
                  }),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(40.0)),
                padding: const EdgeInsets.only(
                  top: 17,
                  bottom: 17,
                ),
                onPressed: () => exit(0),
                child: Text(
                  "SAIR",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ],
    );
  }
}

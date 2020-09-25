import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sam_nutes/componentes/botao_principal_componente.dart';
import 'package:sam_nutes/componentes/item_soma_componente.dart';
import 'package:sam_nutes/componentes/resultado_componente.dart';
import 'package:sam_nutes/modelo/relatorio.dart';

class Avaliacao extends StatefulWidget {
  final Relatorio relatorio;
  final Function recomecar;

  const Avaliacao(this.relatorio, this.recomecar);

  @override
  _AvaliacaoState createState() => _AvaliacaoState();
}

class _AvaliacaoState extends State<Avaliacao> {
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
                        "SIM",
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
                  ItemSoma(
                      "Comorbidades", widget.relatorio.comorbidadesAvaliacao()),
                  ItemSoma("Oxigênio periférico",
                      widget.relatorio.oxigenioPerifericoAvaliacao()),
                  ItemSoma("Verificação FC/PA/Temperatura",
                      widget.relatorio.verificarAvaliacao()),
                  ItemSoma("Idade", widget.relatorio.idadeAvaliacao()),
                  ItemSoma(
                      "Desorientado", widget.relatorio.desorientadoAvaliacao()),
                  Divider(
                    color: Colors.black12,
                  ),
                  ItemSoma("Escore", widget.relatorio.escore()),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            Resultado(widget.relatorio),
            SizedBox(
              height: 20,
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
        ),
      ],
    );
  }
}

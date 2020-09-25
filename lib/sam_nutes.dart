import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sam_nutes/componentes/navegacao_componente.dart';
import 'package:sam_nutes/paginas/avaliacao_pagina.dart';
import 'package:sam_nutes/paginas/comorbidades_pagina.dart';
import 'package:sam_nutes/paginas/estado_pagina.dart';
import 'package:sam_nutes/paginas/logo_pagina.dart';
import 'package:sam_nutes/paginas/outros_diagnosticos_pagina.dart';
import 'package:sam_nutes/paginas/oxigenio_periferico_pagina.dart';
import 'package:sam_nutes/paginas/sindrome_gripal_pagina.dart';
import 'package:sam_nutes/paginas/verificacao.dart';
import 'modelo/relatorio.dart';

class Tabulacao extends StatefulWidget {
  Relatorio relatorio = Relatorio();
  final _formEstado = GlobalKey<FormState>();

  @override
  _TabulacaoState createState() => _TabulacaoState();
}

class _TabulacaoState extends State<Tabulacao>
    with SingleTickerProviderStateMixin {
  TabController controleTabulacao;
  bool visibilidadeBotaoAvancar = false;
  bool visibilidadeBotaoVoltar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('samNUTES'),
      //   actions: <Widget>[
      //     IconButton(
      //       icon: Icon(
      //         Icons.refresh,
      //         color: Colors.white,
      //       ),
      //       onPressed: () => recomecar(),
      //     ),
      //     IconButton(
      //       padding: EdgeInsets.only(right: 10),
      //       icon: Icon(
      //         Icons.close,
      //         color: Colors.white,
      //       ),
      //       onPressed: () => exit(0),
      //     ),
      //   ],
      // ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: controleTabulacao,
        children: <Widget>[
          Logo(avancar),
          SindromeGripal(widget.relatorio),
          Comorbidades(widget.relatorio),
          OxigenioPeriferico(widget.relatorio),
          Verificacao(widget.relatorio),
          Form(
            key: widget._formEstado,
            child: Estado(widget.relatorio, avancar),
          ),
          Avaliacao(widget.relatorio, recomecar),
          OutroDiagnostico(widget.relatorio, recomecar),
        ],
      ),
      floatingActionButton: Navegacao(
        voltar: visibilidadeBotaoVoltar ? voltar : null,
        avancar: visibilidadeBotaoAvancar ? avancar : null,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controleTabulacao = TabController(vsync: this, length: 8);
    irPara(0);
  }

  @override
  void dispose() {
    controleTabulacao.dispose();
    super.dispose();
  }

  void avancar() {
    irPara(controleTabulacao.index + 1);
  }

  void voltar() {
    irPara(controleTabulacao.index - 1);
  }

  void atualizarBotaoAvancar(bool valor) {
    setState(() => visibilidadeBotaoAvancar = valor);
  }

  void atualizarBotaoVoltar(bool valor) {
    setState(() => visibilidadeBotaoVoltar = valor);
  }

  void irPara(int numeroTab) {
    if ((numeroTab == 2) && (widget.relatorio.sindromeGripalAvaliacao() == 0))
      numeroTab = 7;
    else if ((numeroTab == 6) && (!widget._formEstado.currentState.validate()))
      return;

    setState(() {
      visibilidadeBotaoVoltar = (numeroTab > 1) && (numeroTab < 6);
      visibilidadeBotaoAvancar =
          (numeroTab < controleTabulacao.length - 3) && (numeroTab > 0);
    });

    controleTabulacao.animateTo(numeroTab);
  }

  void recomecar() {
    widget.relatorio = Relatorio();
    irPara(1);
  }
}

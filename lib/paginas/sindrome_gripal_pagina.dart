import 'package:flutter/material.dart';
import 'package:sam_nutes/componentes/behaviorTransparent.dart';
import 'package:sam_nutes/componentes/checkbox_2_componente.dart';
import 'package:sam_nutes/componentes/checkbox_componente.dart';
import 'package:sam_nutes/modelo/relatorio.dart';

class SindromeGripal extends StatefulWidget {
  final Relatorio relatorio;

  const SindromeGripal(this.relatorio);

  @override
  _SindromeGripalState createState() => _SindromeGripalState();
}

class _SindromeGripalState extends State<SindromeGripal> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(0),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                "Selecione os sintomas apresentados pelo paciente",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: (MediaQuery.of(context).size.width / 2) - 27.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          CheckBoxRectangle(
                            "Febre (Tax > 37,8)",
                            widget.relatorio.febre,
                            (bool valor) =>
                                setState(() => widget.relatorio.febre = valor),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          CheckBoxRectangle(
                            "Tosse seca",
                            widget.relatorio.tosseSeca,
                            (bool valor) => setState(
                                () => widget.relatorio.tosseSeca = valor),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          CheckBoxRectangle(
                            "Dispinéia",
                            widget.relatorio.dispineia,
                            (bool valor) => setState(
                                () => widget.relatorio.dispineia = valor),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: (MediaQuery.of(context).size.width / 2) - 27.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          CheckBoxRectangle(
                            "Mialgia",
                            widget.relatorio.mialgia,
                            (bool valor) => setState(
                                () => widget.relatorio.mialgia = valor),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          CheckBoxRectangle(
                            "Coriza nasal",
                            widget.relatorio.corizaNasal,
                            (bool valor) => setState(
                                () => widget.relatorio.corizaNasal = valor),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          CheckBoxRectangle(
                            "Fadiga nos últimos 7 dias",
                            widget.relatorio.fadiga,
                            (bool valor) =>
                                setState(() => widget.relatorio.fadiga = valor),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

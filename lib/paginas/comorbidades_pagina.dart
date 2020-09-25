import 'package:flutter/material.dart';
import 'package:sam_nutes/componentes/checkbox_2_componente.dart';
import 'package:sam_nutes/componentes/checkbox_componente.dart';
import 'package:sam_nutes/modelo/relatorio.dart';

class Comorbidades extends StatefulWidget {
  final Relatorio relatorio;

  const Comorbidades(this.relatorio);

  @override
  _ComorbidadesState createState() => _ComorbidadesState();
}

class _ComorbidadesState extends State<Comorbidades> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(0),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Selecione as comorbidades apresentadas pelo paciente",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CheckBoxRectangle(
                "Doença Pulmonar Pré-Existente",
                widget.relatorio.doencaPulmonar,
                (bool valor) =>
                    setState(() => widget.relatorio.doencaPulmonar = valor),
              ),
              SizedBox(
                height: 15,
              ),
              CheckBoxRectangle(
                "Lesão Renal Crônica",
                widget.relatorio.lesaoRenal,
                (bool valor) =>
                    setState(() => widget.relatorio.lesaoRenal = valor),
              ),
              SizedBox(
                height: 15,
              ),
              CheckBoxRectangle(
                "Diagnóstico referido de Diabetes Mellitus (DM)*",
                widget.relatorio.diabetes,
                (bool valor) =>
                    setState(() => widget.relatorio.diabetes = valor),
              ),
              SizedBox(
                height: 15,
              ),
              CheckBoxRectangle(
                "História de Hipertensão Arterial Sistêmica",
                widget.relatorio.hipertensao,
                (bool valor) =>
                    setState(() => widget.relatorio.hipertensao = valor),
              ),
              SizedBox(
                height: 15,
              ),
              CheckBoxRectangle(
                "Uso de Imunobiológicos",
                widget.relatorio.imunobiologico,
                (bool valor) =>
                    setState(() => widget.relatorio.imunobiologico = valor),
              ),
              SizedBox(
                height: 15,
              ),
              CheckBoxRectangle(
                "História de Transplante",
                widget.relatorio.transplante,
                (bool valor) =>
                    setState(() => widget.relatorio.transplante = valor),
              ),
              SizedBox(
                height: 15,
              ),
              CheckBoxRectangle(
                "História de cardiopatia prévia (doença arterial coronariana, insuficiência cardíaca)",
                widget.relatorio.cardiopatia,
                (bool valor) =>
                    setState(() => widget.relatorio.cardiopatia = valor),
              ),
              SizedBox(
                height: 15,
              ),
              CheckBoxRectangle(
                "Uso de imunossupressor (incluindo quimioterápicos e corticosteroides)",
                widget.relatorio.imunossupressor,
                (bool valor) =>
                    setState(() => widget.relatorio.imunossupressor = valor),
              ),
              SizedBox(
                height: 15,
              ),
              CheckBoxRectangle(
                "Diagnóstico de HIV (independente do nível sérico de CD4)",
                widget.relatorio.diagnosticoHIV,
                (bool valor) =>
                    setState(() => widget.relatorio.diagnosticoHIV = valor),
              ),
              SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

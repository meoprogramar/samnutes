import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sam_nutes/componentes/checkbox_2_componente.dart';
import 'package:sam_nutes/componentes/checkbox_componente.dart';
import 'package:sam_nutes/modelo/relatorio.dart';

class OxigenioPeriferico extends StatefulWidget {
  final Relatorio relatorio;

  const OxigenioPeriferico(this.relatorio);

  @override
  _OxigenioPerifericoState createState() => _OxigenioPerifericoState();
}

class _OxigenioPerifericoState extends State<OxigenioPeriferico> {
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
                "Oxigênio periférico",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                initialValue:
                    widget.relatorio.spo2 != null ? widget.relatorio.spo2 : "",
                onFieldSubmitted: (value) =>
                    FocusScope.of(context).requestFocus(new FocusNode()),
                decoration: InputDecoration(
                  labelText: 'Oxigênio periférico (SPO2 %)',
                  hintText: 'Ex: 95',
                ),
                onChanged: (String value) {
                  widget.relatorio.spo2 = value;
                },
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(3),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "OU",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              CheckBoxRectangle(
                "Presença de taquidispnéia (FR ≥ 25 IRPM)",
                widget.relatorio.taquidispneia,
                (bool valor) =>
                    setState(() => widget.relatorio.taquidispneia = valor),
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

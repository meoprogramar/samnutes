import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sam_nutes/modelo/relatorio.dart';

class Verificacao extends StatefulWidget {
  final Relatorio relatorio;

  const Verificacao(this.relatorio);

  @override
  _VerificacaoState createState() => _VerificacaoState();
}

class _VerificacaoState extends State<Verificacao> {
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
                "Verificação PA/FC/Temperatura",
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
                initialValue: widget.relatorio.frequenciaCardiaca != null
                    ? widget.relatorio.frequenciaCardiaca
                    : "",
                onFieldSubmitted: (value) =>
                    FocusScope.of(context).requestFocus(new FocusNode()),
                decoration: InputDecoration(
                  labelText: 'Frequência cardíaca (bpm)',
                  hintText: 'Ex: 100',
                ),
                onChanged: (String value) {
                  widget.relatorio.frequenciaCardiaca = value;
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
                height: 20,
              ),
              TextFormField(
                initialValue: widget.relatorio.pressaoArterial != null
                    ? widget.relatorio.pressaoArterial
                    : "",
                onFieldSubmitted: (value) =>
                    FocusScope.of(context).requestFocus(new FocusNode()),
                decoration: InputDecoration(
                  labelText: 'Pressão arterial sistólica (mmHg)',
                  hintText: 'Ex: 95',
                ),
                onChanged: (String value) {
                  widget.relatorio.pressaoArterial = value;
                },
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(3),
                ],
              ),
              SizedBox(
                height: 45,
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
                height: 25,
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Temp.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                    overflow: TextOverflow.visible,
                  ),
                  Flexible(
                    child: Slider(
                      value: widget.relatorio.temperatura,
                      min: 34.0,
                      max: 42.0,
                      divisions: 80,
                      label: '${widget.relatorio.temperatura}',
                      onChanged: (valor) =>
                          setState(() => widget.relatorio.temperatura = valor),
                    ),
                  ),
                  Text(
                    widget.relatorio.temperatura.toString() + "°C",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                    overflow: TextOverflow.visible,
                  ),
                ],
              ),
              SizedBox(
                height: 60,
              )
            ],
          ),
        ),
      ],
    );
  }
}

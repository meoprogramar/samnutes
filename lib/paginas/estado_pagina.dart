import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sam_nutes/componentes/botao_principal_componente.dart';
import 'package:sam_nutes/componentes/checkbox_2_componente.dart';
import 'package:sam_nutes/componentes/checkbox_componente.dart';
import 'package:sam_nutes/modelo/relatorio.dart';

class Estado extends StatefulWidget {
  final Function() irParaAvaliacao;
  final Relatorio relatorio;

  const Estado(this.relatorio, this.irParaAvaliacao);

  @override
  _EstadoState createState() => _EstadoState();
}

class _EstadoState extends State<Estado> {
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
                    "Idade e estado",
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
                    initialValue: widget.relatorio.idade != null
                        ? widget.relatorio.idade
                        : "",
                    onFieldSubmitted: (value) =>
                        FocusScope.of(context).requestFocus(new FocusNode()),
                    decoration: InputDecoration(
                      labelText: 'Idade',
                      hintText: 'Ex: 46',
                    ),
                    validator: (String value) {
                      if (value.isEmpty) return 'Idade inválida';
                      return null;
                    },
                    onChanged: (String value) {
                      widget.relatorio.idade = value;
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
                  CheckBoxRectangle(
                    "Paciente desorientado",
                    widget.relatorio.desorientado,
                    (bool valor) =>
                        setState(() => widget.relatorio.desorientado = valor),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                ],
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            color: Colors.transparent,
            margin: EdgeInsets.only(
              bottom: 20,
              right: 20,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                BotaoPrincipal("GERAR AVALIAÇÃO", Icons.verified_user, () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  widget.irParaAvaliacao();
                }),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class BotaoPrincipal extends StatelessWidget {
  final IconData icone;
  final String texto;
  final Function quandoPressionar;

  BotaoPrincipal(this.texto, this.icone, this.quandoPressionar);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        gradient:
            LinearGradient(colors: <Color>[Colors.red.shade700, Colors.red]),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            offset: Offset(0.0, 1.5),
            blurRadius: 10,
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          onTap: quandoPressionar,
          child: Row(
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 8.0),
                  child: Text(
                    texto,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Icon(
                  icone,
                  color: Colors.white,
                  size: 25.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

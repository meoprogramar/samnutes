import 'package:flutter/material.dart';
import 'package:sam_nutes/componentes/behaviorTransparent.dart';
import 'package:sam_nutes/componentes/botao_principal_componente.dart';

class Logo extends StatelessWidget {
  final Function() comecar;

  const Logo(this.comecar);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ScrollConfiguration(
          behavior: BehaviorTransparent(),
          child: ListView(
            padding: EdgeInsets.all(0.0),
            children: <Widget>[
              Column(
                children: <Widget>[
                  Image.asset("images/curves2.png"),
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width <
                            MediaQuery.of(context).size.height
                        ? MediaQuery.of(context).size.width * 0.75
                        : MediaQuery.of(context).size.height * 0.75,
                    child: Image.asset("images/fastcovid2.png"),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                ],
              ),
            ],
          ),
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
                BotaoPrincipal("COMEÇAR", Icons.arrow_forward, comecar),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class Relatorio {
  //Sindrome gripal
  bool febre = false;
  bool tosseSeca = false;
  bool dispineia = false;
  bool mialgia = false;
  bool corizaNasal = false;
  bool fadiga = false;

  //Comorbidades
  bool doencaPulmonar = false;
  bool lesaoRenal = false;
  bool diabetes = false;
  bool hipertensao = false;
  bool imunobiologico = false;
  bool transplante = false;
  bool cardiopatia = false;
  bool imunossupressor = false;
  bool diagnosticoHIV = false;

  //Oxigenio periferico
  String spo2;
  bool taquidispneia = false;

  //Verificar FC/PA/Temp
  String frequenciaCardiaca;
  String pressaoArterial;
  double temperatura = 37.0;

  //Idade e desorientado
  String idade;
  bool desorientado = false;

  int sindromeGripalAvaliacao() {
    int contador = 0;
    if (febre) contador++;
    if (tosseSeca) contador++;
    if (dispineia) contador++;
    if (mialgia) contador++;
    if (corizaNasal) contador++;
    if (fadiga) contador++;
    return contador >= 2 ? 1 : 0;
  }

  int comorbidadesAvaliacao() {
    int contador = 0;
    if (doencaPulmonar) contador++;
    if (lesaoRenal) contador++;
    if (diabetes) contador++;
    if (hipertensao) contador++;
    if (imunobiologico) contador++;
    if (transplante) contador++;
    if (cardiopatia) contador++;
    if (imunossupressor) contador++;
    if (diagnosticoHIV) contador++;
    return contador >= 1 ? 1 : 0;
  }

  int oxigenioPerifericoAvaliacao() {
    int contador = 0;
    if ((spo2 != null) && (int.parse(spo2) <= 93)) contador++;
    if (taquidispneia) contador++;
    return contador >= 1 ? 1 : 0;
  }

  int verificarAvaliacao() {
    int contador = 0;
    if ((frequenciaCardiaca != null) && (int.parse(frequenciaCardiaca) >= 110))
      contador++;
    if ((pressaoArterial != null) && (int.parse(pressaoArterial) <= 90))
      contador++;
    if (temperatura >= 39.0) contador++;
    return contador >= 1 ? 1 : 0;
  }

  int idadeAvaliacao() {
    return (idade != null) && (int.parse(idade) >= 65) ? 1 : 0;
  }

  int desorientadoAvaliacao() {
    return desorientado ? 1 : 0;
  }

  int escore() {
    return comorbidadesAvaliacao() +
        oxigenioPerifericoAvaliacao() +
        verificarAvaliacao() +
        idadeAvaliacao() +
        desorientadoAvaliacao();
  }

  // Map<MaterialColor, MaterialColor> grauRiscoCor() {
  //   int pontos = escore();
  //   if (pontos == 0 || pontos == 1)
  //     return {Colors.green: Colors.white};
  //   else if (pontos == 2) {
  //     if (oxigenioPerifericoAvaliacao() == 0)
  //       return {Colors.yellow: Colors.black87};
  //     else
  //       return {Colors.orange: Colors.white};
  //   } else
  //     return {Colors.red: Colors.white};
  // }

  List<dynamic> configuracoesGrauRisco() {
    int pontos = escore();
    if (pontos == 0 || pontos == 1)
      return [
        "BAIXO (VERDE)",
        "-",
        "-",
        "Procurar serviços de saúde se sinais de alarme.",
        Colors.green,
        Colors.white,
      ];
    else if (pontos == 2) {
      if (oxigenioPerifericoAvaliacao() == 0)
        return [
          "INTERMEDIÁRIO (AMARELO)",
          "1x",
          "Unidade básica de saúde Sem necessidade de Hospitalização.",
          "Sem sinais de alarme, após avaliação USF, encaminhar para isolamento domiciliar.",
          Colors.yellow,
          Colors.black87,
        ];
      else
        return [
          "INTERMEDIÁRIO (LARANJA)",
          "6/6h durante 24h",
          "Avaliação de Enfermagem e Médica em ambiente hospitalar/Unidade de Pronto Atendimento (UPA).",
          "Observação durante 6h a 24hs, em unidade hospitalar/UPA, com realização de Laboratório/Imagem se possível.",
          Colors.orange,
          Colors.white,
        ];
    } else
      return [
        "ALTO (VERMELHO)",
        "Contínua",
        "Avaliação de Enfermagem e Médica de Urgência Urgente.",
        "Conduta Médica de Imediato (avaliar vaga de UTI); Encaminhar ao Centro de Referência COVID-19; realizar laboratório, radiografia torácica, avaliação clínica.",
        Colors.red,
        Colors.white,
      ];
    ;
  }
}

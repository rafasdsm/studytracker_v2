import 'package:material_ui/material_ui.dart';
import 'package:studytracker_v2/model/localbank.dart';

DateTime data_atual = DateTime.now();

List<String> diasemananome = [
  "Segunda",
  "Terca",
  "Quarta",
  "Quinta",
  "Sexta",
  "Sabado",
  "Domingo",
];

Map<String, bool> gerar_map() {
  Map<String, bool> dias = {};
  for (var i in diasemananome) {
    dias[i] = false;
  }
  return dias;
}

enum PresencaTipo { Falta, FaltaJustificada, Presente }

enum NotaTipo { Trabalho, Prova }

enum StatusCurso {
  Cursando,
  Aprovado,
  PerigoFalta,
  ReprovadoNota,
  ReprovadoFalta,
}

const List<Icon> StatusIcon = [
  Icon(Icons.check_circle, color: Colors.green),
  Icon(Icons.priority_high_rounded, color: Colors.yellow),
  Icon(Icons.warning_rounded, color: Colors.red),
];

class Materia {
  int get id {
    return AppSession().materias.length + 1;
  }

  String nome;
  String professor;

  bool concluido;

  int carga_horaria;
  int carga_diaria;

  StatusCurso status;
  late Icon status_icon;
  int presenca_minima;
  int falta_limite = 0;

  double media_minima;
  double media_maxima;

  List<Presenca> presencas;
  List<Nota> notas;
  List<bool> diassemana;

  void gerar_limitefalta() {
    if (carga_diaria <= 0) {
      falta_limite = 0;
      return;
    }
    int total_dia = carga_horaria ~/ carga_diaria;
    double percentual_falta = (100 - presenca_minima) / 100;
    falta_limite = (total_dia * percentual_falta).floor();
  }

  double gerar_media() {
    double media = notas[0].nota;
    if (notas.length >= 2) {
      double _notas = 0;
      double pesos = 0;
      for (var i in notas) {
        _notas += (i.nota * i.peso);
        pesos += i.peso;
      }
      media = (_notas / pesos).roundToDouble();
    }
    return media;
  }

  int return_presenca() {
    int presenca = 0;
    for (var i in presencas) {
      if (i.tipopresenca == PresencaTipo.Presente) {
        presenca++;
      }
    }
    return presenca;
  }

  int return_falta({bool considerar_justificadas = false}) {
    int falta = 0;
    for (var i in presencas) {
      if (considerar_justificadas == false) {
        if (i.tipopresenca == PresencaTipo.Falta) {
          falta++;
        }
      } else {
        if (i.tipopresenca == PresencaTipo.Falta ||
            i.tipopresenca == PresencaTipo.FaltaJustificada) {
          falta++;
        }
      }
    }
    return falta;
  }

  void check_status() {
    if (presencas.isNotEmpty && notas.isNotEmpty) {
      double media = gerar_media().roundToDouble();
      int faltas = return_falta();
      if (media < media_minima) {
        status = StatusCurso.ReprovadoNota;
        status_icon = StatusIcon[2];
      } else if (faltas > falta_limite) {
        status = StatusCurso.ReprovadoFalta;
        status_icon = StatusIcon[2];
      } else if (faltas == falta_limite - 1) {
        status = StatusCurso.PerigoFalta;
        status_icon = StatusIcon[1];
      } else if (concluido == true &&
          media >= media_minima &&
          faltas <= falta_limite) {
        status = StatusCurso.Aprovado;
        status_icon = StatusIcon[0];
      }
    } else {
      status = StatusCurso.Cursando;
      status_icon = StatusIcon[0];
    }
  }

  Materia({
    required this.nome,
    required this.professor,
    required this.carga_diaria,
    required this.carga_horaria,
    required this.diassemana,
    this.falta_limite = 0,
    this.media_maxima = 10,
    this.media_minima = 7,
    this.presenca_minima = 75,
    this.status = StatusCurso.Cursando,
    this.presencas = const [],
    this.concluido = false,
    this.notas = const [],
  }) {
    status_icon = StatusIcon[0];
    gerar_limitefalta();
  }
}

class Presenca {
  int materia_id;
  PresencaTipo tipopresenca;
  DateTime datapresenca;
  Presenca({
    required this.materia_id,
    required this.tipopresenca,
    required this.datapresenca,
  });
}

class Nota {
  int materia_id;
  NotaTipo tiponota;
  double nota;
  String nomenota;
  int peso;
  late DateTime datanota;
  Nota({
    required this.materia_id,
    required this.tiponota,
    required this.nomenota,
    required this.nota,
    this.peso = 1,
  }) {
    datanota = data_atual;
  }
}

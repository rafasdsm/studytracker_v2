import 'package:material_ui/material_ui.dart';

enum TiposNota { Trabalho, Prova }

List<String> diasDaSemana = [
  "Segunda",
  "Terca",
  "Quarta",
  "Quinta",
  "Sexta",
  "Sabado",
  "Domingo",
];

List<Icon> StatusIcon = [
  Icon(Icons.check_circle,color: Colors.green,),
  Icon(Icons.priority_high,color: Colors.yellow,),
  Icon(Icons.warning,color: Colors.red,),
];

enum Status {
  aprovado,
  reprovado_nota,
  reprovado_falta,
  perigo_falta,
  perigo_nota,
  cursando,
}

class Materia {
  int cargahoraria;
  int horapordia;
  String professor;
  String nome;

  List<Nota> notas;
  List<bool> semana;

  int faltas;
  int limitefalta;

  Status status;

  double gerar_media() {
    if (notas.length > 1) {
      double media = 0;
      double num = 0;
      for (var i in notas) {
        num += (i.nota * i.peso);
      }
      media = num / notas.length;
      return media;
    } else {
      return 0;
    }
  }

  List<String> dias_da_semana_por_nome() {
    int cont = 0;
    List<String> _diadasemana = [];
    for (var i in semana) {
      if (i == true) {
        _diadasemana.add(diasDaSemana[cont]);
      }
      cont++;
    }
    return _diadasemana;
  }

  Map<String, dynamic> to_map() => {
    "nome": nome,
    "professor": professor,
    "cargahoraria": cargahoraria,
    "horapordia": horapordia,
    "dia_semana": dias_da_semana_por_nome(),
    "notas": notas,
  };

  void gerar_status(double mediaminima, int limitefalta) {
    double mediaatual = gerar_media();
    if (faltas > limitefalta) {
      status = Status.reprovado_falta;
    } else if (mediaatual < mediaminima) {
      status = Status.reprovado_nota;
    }
  }

  void gerar_limitefaltas(double presencaminima) {
    limitefalta = (cargahoraria * presencaminima).floor();
  }

  Materia({
    required this.cargahoraria,
    required this.horapordia,
    required this.professor,
    required this.nome,
    required this.semana,
    this.notas = const [],
    this.faltas = 0,
    this.limitefalta = 0,
    this.status = Status.cursando,
  });
}

class Nota {
  double nota;
  int peso;
  NotaTipo tipo;
  Nota({required this.nota, required this.peso, required this.tipo});
}

class NotaTipo {
  TiposNota tipodanota;
  NotaTipo({required this.tipodanota});
}

enum TiposNota{
  Trabalho,
  Prova
}

List<String> diasDaSemana = [
  "Segunda",
  "Terca",
  "Quarta",
  "Quinta",
  "Sexta",
  "Sabado",
  "Domingo"
];

class Materia{
  int cargahoraria;
  int horapordia;
  String professor;
  String nome;
  List<Nota> notas = [];
  List<bool> semana;

  double gerar_media(){
    double media = 0;
    double num = 0;
    for(var i in notas){
      num += (i.nota*i.peso);
    }
    media = num/notas.length;
    return media;
  }

  List<String> dias_da_semana_por_nome(){
    int cont = 0;
    List<String> _diadasemana = [];
    for(var i in semana){
      if(i == true){
        _diadasemana.add(diasDaSemana[cont]);
      }
      cont ++;
    }
    return _diadasemana;
  }

  Materia({
    required this.cargahoraria,
    required this.horapordia,
    required this.professor,
    required this.nome,
    required this.semana,
  });
}

class Nota{
  double nota;
  int peso;
  NotaTipo tipo;
  Nota({
    required this.nota,
    required this.peso,
    required this.tipo,
  });
}

class NotaTipo{
  TiposNota tipodanota;
  NotaTipo({
    required this.tipodanota
  });
}
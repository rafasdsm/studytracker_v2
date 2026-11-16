import 'package:material_ui/material_ui.dart';
import 'package:studytracker_v2/model/localbank.dart';
import 'package:studytracker_v2/model/models.dart';
import 'package:studytracker_v2/pages/materias.dart';

void add_materias() {
  Materia materia2 = Materia(
    nome: "Banco de Dados",
    professor: "Carlos Henrique",
    carga_diaria: 3,
    carga_horaria: 60,
    diassemana: [false, true, false, false, false, false, false],
  );

  materia2.presencas = [
    Presenca(
      materia_id: materia2.id,
      tipopresenca: PresencaTipo.Presente,
      datapresenca: DateTime(2026, 10, 27),
    ),
    Presenca(
      materia_id: materia2.id,
      tipopresenca: PresencaTipo.Presente,
      datapresenca: DateTime(2026, 11, 3),
    ),
    Presenca(
      materia_id: materia2.id,
      tipopresenca: PresencaTipo.Falta,
      datapresenca: DateTime(2026, 11, 10),
    ),
  ];

  materia2.notas = [
    Nota(
      materia_id: materia2.id,
      tiponota: NotaTipo.Prova,
      nomenota: "NP1",
      peso: 1,
      nota: 8.5,
    ),
    Nota(
      materia_id: materia2.id,
      tiponota: NotaTipo.Prova,
      nomenota: "NP2",
      peso: 1,
      nota: 6.0,
    ),
    Nota(
      materia_id: materia2.id,
      tiponota: NotaTipo.Trabalho,
      nomenota: "PIM",
      peso: 2,
      nota: 9.5,
    ),
  ];

  AppSession().materias.add(materia2);

  // --------------------------------------------
  // MATÉRIA 3
  // --------------------------------------------

  Materia materia3 = Materia(
    nome: "Engenharia de Software",
    professor: "Mariana Oliveira",
    carga_diaria: 3,
    carga_horaria: 60,
    diassemana: [false, false, true, false, false, false, false],
  );

  materia3.presencas = [
    Presenca(
      materia_id: materia3.id,
      tipopresenca: PresencaTipo.Presente,
      datapresenca: DateTime(2026, 10, 28),
    ),
    Presenca(
      materia_id: materia3.id,
      tipopresenca: PresencaTipo.Presente,
      datapresenca: DateTime(2026, 11, 4),
    ),
    Presenca(
      materia_id: materia3.id,
      tipopresenca: PresencaTipo.Presente,
      datapresenca: DateTime(2026, 11, 11),
    ),
  ];

  materia3.notas = [
    Nota(
      materia_id: materia3.id,
      tiponota: NotaTipo.Prova,
      nomenota: "NP1",
      peso: 1,
      nota: 5.5,
    ),
    Nota(
      materia_id: materia3.id,
      tiponota: NotaTipo.Prova,
      nomenota: "NP2",
      peso: 1,
      nota: 4.0,
    ),
    Nota(
      materia_id: materia3.id,
      tiponota: NotaTipo.Trabalho,
      nomenota: "PIM",
      peso: 2,
      nota: 8.0,
    ),
  ];

  AppSession().materias.add(materia3);

  // --------------------------------------------
  // MATÉRIA 4
  // --------------------------------------------

  Materia materia4 = Materia(
    nome: "Algoritmos e Estruturas de Dados",
    professor: "André Martins",
    carga_diaria: 3,
    carga_horaria: 60,
    diassemana: [false, false, false, true, false, false, false],
  );

  materia4.presencas = [
    Presenca(
      materia_id: materia4.id,
      tipopresenca: PresencaTipo.Presente,
      datapresenca: DateTime(2026, 10, 29),
    ),
    Presenca(
      materia_id: materia4.id,
      tipopresenca: PresencaTipo.Falta,
      datapresenca: DateTime(2026, 11, 5),
    ),
    Presenca(
      materia_id: materia4.id,
      tipopresenca: PresencaTipo.Presente,
      datapresenca: DateTime(2026, 11, 12),
    ),
  ];

  materia4.notas = [
    Nota(
      materia_id: materia4.id,
      tiponota: NotaTipo.Prova,
      nomenota: "NP1",
      peso: 1,
      nota: 5.0,
    ),
    Nota(
      materia_id: materia4.id,
      tiponota: NotaTipo.Prova,
      nomenota: "NP2",
      peso: 1,
      nota: 8.0,
    ),
    Nota(
      materia_id: materia4.id,
      tiponota: NotaTipo.Trabalho,
      nomenota: "PIM",
      peso: 2,
      nota: 7.0,
    ),
  ];

  AppSession().materias.add(materia4);

  // --------------------------------------------
  // MATÉRIA 5
  // --------------------------------------------

  Materia materia5 = Materia(
    nome: "Programação Estruturada",
    professor: "Ricardo Almeida",
    carga_diaria: 3,
    carga_horaria: 60,
    diassemana: [false, false, false, false, true, false, false],
  );

  materia5.presencas = [
    Presenca(
      materia_id: materia5.id,
      tipopresenca: PresencaTipo.Presente,
      datapresenca: DateTime(2026, 10, 30),
    ),
    Presenca(
      materia_id: materia5.id,
      tipopresenca: PresencaTipo.Presente,
      datapresenca: DateTime(2026, 11, 6),
    ),
    Presenca(
      materia_id: materia5.id,
      tipopresenca: PresencaTipo.Presente,
      datapresenca: DateTime(2026, 11, 13),
    ),
  ];

  materia5.notas = [
    Nota(
      materia_id: materia5.id,
      tiponota: NotaTipo.Prova,
      nomenota: "NP1",
      peso: 1,
      nota: 9.0,
    ),
    Nota(
      materia_id: materia5.id,
      tiponota: NotaTipo.Prova,
      nomenota: "NP2",
      peso: 1,
      nota: 9.5,
    ),
    Nota(
      materia_id: materia5.id,
      tiponota: NotaTipo.Trabalho,
      nomenota: "PIM",
      peso: 2,
      nota: 10.0,
    ),
  ];

  AppSession().materias.add(materia5);

  // --------------------------------------------
  // MATÉRIA 6
  // --------------------------------------------

  Materia materia6 = Materia(
    nome: "Desenvolvimento Web",
    professor: "Fernanda Costa",
    carga_diaria: 3,
    carga_horaria: 60,
    diassemana: [false, false, false, false, false, true, false],
  );

  materia6.presencas = [
    Presenca(
      materia_id: materia6.id,
      tipopresenca: PresencaTipo.Presente,
      datapresenca: DateTime(2026, 10, 31),
    ),
    Presenca(
      materia_id: materia6.id,
      tipopresenca: PresencaTipo.Presente,
      datapresenca: DateTime(2026, 11, 7),
    ),
    Presenca(
      materia_id: materia6.id,
      tipopresenca: PresencaTipo.Falta,
      datapresenca: DateTime(2026, 11, 14),
    ),
  ];

  materia6.notas = [
    Nota(
      materia_id: materia6.id,
      tiponota: NotaTipo.Prova,
      nomenota: "NP1",
      peso: 1,
      nota: 7.5,
    ),
    Nota(
      materia_id: materia6.id,
      tiponota: NotaTipo.Prova,
      nomenota: "NP2",
      peso: 1,
      nota: 7.0,
    ),
    Nota(
      materia_id: materia6.id,
      tiponota: NotaTipo.Trabalho,
      nomenota: "PIM",
      peso: 2,
      nota: 6.5,
    ),
  ];

  AppSession().materias.add(materia6);
}

void main() {
  add_materias();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MateriasPage(),
    );
  }
}

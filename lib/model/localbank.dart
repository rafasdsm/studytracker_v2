import 'package:studytracker_v2/model/models.dart';

class AppSession {
  // Private static instance
  static AppSession? _instance;

  // Private named constructor
  AppSession._();

  List<Materia> materias = [];
  int selectedpage = 0;

  double presencaminima = 0.25;
  double notamaxima = 10;
  int mediaminima = 7;

  // Factory constructor that ensures only one instance
  factory AppSession() {
    _instance ??= AppSession._();
    return _instance!;
  }
}

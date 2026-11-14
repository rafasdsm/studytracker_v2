import 'package:studytracker_v2/model/models.dart';

class AppSession {
  // Private static instance
  static AppSession? _instance;

  // Private named constructor
  AppSession._();
  
  List<Materia> materias = [];
  
  // Factory constructor that ensures only one instance
  factory AppSession() {
    _instance ??= AppSession._();
    return _instance!;
  }
}
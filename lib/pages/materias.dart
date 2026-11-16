import 'package:material_ui/material_ui.dart';
import 'package:studytracker_v2/model/localbank.dart';
import 'package:studytracker_v2/model/models.dart';
import 'package:studytracker_v2/pages/materiadetail.dart';
import 'package:studytracker_v2/pages/materiaform.dart';

class MateriasPage extends StatelessWidget {
  MateriasPage({super.key});

  AppSession _session = AppSession();

  @override
  Widget build(BuildContext context) {
    List<GestureDetector> _materiacontainerlist = [];

    for (var materia in _session.materias) {
      materia.check_status();
      _materiacontainerlist.add(materiacontainer(context, materia));
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MateriaFormPage()),
        ),
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            spacing: 30,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: _materiacontainerlist,
          ),
        ),
      ),
    );
  }

  GestureDetector materiacontainer(context, Materia _materia) {
    _materia.check_status();
    String _nome = _materia.nome;
    String _professor = _materia.professor;
    double nota = _materia.gerar_media();
    double nota_minima = _materia.media_minima;
    int falta = _materia.return_falta();
    int limite_falta = _materia.falta_limite;
    Icon status_icon = _materia.status_icon;
    // trata caso o status fique bichado
    // ReprovadoNota
    String _status = _materia.status.name;
    String status = "";

    if (_status == "ReprovadoNota") {
      status = "Reprovado por nota";
    } else if (_status == "ReprovadoFalta") {
      status = "Reprovado por falta";
    } else if (_status == "PerigoFalta") {
      status = "Perigo reprovar por falta";
    } else {
      status = _status;
    }

    // se a pessoa passou da média mínima, mostra a média máxima = 10
    if (nota >= nota_minima) {
      nota_minima = 10;
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MateriaDetailPage(_materia)),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Container(
          decoration: BoxDecoration(
            border: BoxBorder.all(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Text(_nome, style: TextStyle(fontSize: 18)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Nota: $nota/$nota_minima",
                      style: TextStyle(fontSize: 18),
                    ),
                    Spacer(),
                    Text(
                      "Faltas: $falta/$limite_falta",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey.shade300,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 10,
                      children: [
                        status_icon,
                        Text("${status}", style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    "Clique para mais detalhes",
                    style: TextStyle(
                      fontSize: 15,
                      decoration: TextDecoration.underline,
                      color: Colors.deepPurpleAccent,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:material_ui/material_ui.dart';
import 'package:studytracker_v2/components/bottomappbar.dart';
import 'package:studytracker_v2/model/localbank.dart';
import 'package:studytracker_v2/model/models.dart';
import 'package:studytracker_v2/pages/materiaform.dart';

class MateriasPage extends StatelessWidget {
  MateriasPage({super.key});

  AppSession _appSession = AppSession();

  @override
  Widget build(BuildContext context) {
    List<Padding> _materiasWidget = [];
    List<Materia> _materiasFromsession = _appSession.materias;
    if (_materiasFromsession.length > 0) {
      for (var i in _materiasFromsession) {
        Icon status = Icon(Icons.abc);
        if (i.status == Status.aprovado || i.status == Status.cursando) {
          status = StatusIcon[0];
        } else if (i.status == Status.perigo_falta ||
            i.status == Status.perigo_nota) {
          status = StatusIcon[1];
        } else if (i.status == Status.reprovado_falta ||
            i.status == Status.reprovado_nota) {
          status = StatusIcon[2];
        }
        _materiasWidget.add(
          materiacontainer(
            i.nome,
            [i.notas.length > 0 ? i.notas[0].nota : 0, _appSession.notamaxima],
            [i.faltas, i.limitefalta],
            status,
          ),
        );
      }
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 248, 242),
      bottomNavigationBar: CBottomappbar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MateriaFormPage()),
          );
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(spacing: 20, children: _materiasWidget),
        ),
      ),
    );
  }

  Padding materiacontainer(
    String materianome,
    List<double> nota,
    List<int> faltas,
    Icon status,
  ) {
    return Padding(
      padding: EdgeInsets.only(left: 40, right: 40),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: BoxBorder.all(color: Colors.black, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            spacing: 10,
            children: [
              Text(materianome.toUpperCase(), style: TextStyle(fontSize: 20)),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Média Atual: ${nota[0]}/${nota[1]}",
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      "Faltas: ${faltas[0]}/${faltas[1]}",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  status,
                  Text(
                    "Clique para mais detalhes ->",
                    style: TextStyle(
                      color: Colors.deepPurpleAccent,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

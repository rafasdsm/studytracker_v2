import 'package:flutter/widgets.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:material_ui/material_ui.dart';
import 'package:studytracker_v2/model/models.dart';

class MateriaDetailPage extends StatelessWidget {
  Materia _materia;
  MateriaDetailPage(this._materia, {super.key});
  List<Map<String, dynamic>> _notalist = [];
  List<Map<String, dynamic>> _presencalist = [];

  List<Map<String, dynamic>> generate_notalist() {
    List<Map<String, dynamic>> notalist = [];
    for (var i in _materia.notas) {
      notalist.add({
        "nome_nota": i.nomenota,
        "tipo_nota": i.tiponota.name,
        "nota": i.nota,
        "peso": i.peso,
      });
    }
    return notalist;
  }

  List<Map<String, dynamic>> generate_presenca() {
    List<Map<String, dynamic>> presencalist = [];
    for (var i in _materia.presencas) {
      presencalist.add({"data": i.datapresenca, "tipo": i.tipopresenca});
    }
    return presencalist;
  }

  String normalize_data(DateTime _date) {
    String data = _date.toString();
    List<String> separated_data = data.split("-");
    data =
        "${separated_data[2].split(" ")[0]}/${separated_data[1]}/${separated_data[0]}";

    return data;
  }

  @override
  Widget build(BuildContext context) {
    _notalist = generate_notalist();
    _presencalist = generate_presenca();
    return Scaffold(
      appBar: AppBar(title: Text(_materia.nome), centerTitle: true),
      floatingActionButton: SpeedDial(
        children: [
          SpeedDialChild(
            label: "Adicionar Nota",
            child: Icon(Icons.grade, color: Colors.white),
            backgroundColor: Colors.yellow,
          ),
          SpeedDialChild(
            label: "Adicionar Falta",
            child: Icon(Icons.calendar_month, color: Colors.white),
            backgroundColor: Colors.purple,
          ),
        ],
        child: Icon(Icons.more_vert),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Text(
              "Professor(a): ${_materia.professor}",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Container da média
                containergrid("Média Atual", _materia.gerar_media().toString()),
                containergrid(
                  "Faltas",
                  "${_materia.return_falta().toString()}/${_materia.falta_limite}",
                ),
                containergrid(
                  "Presenças",
                  _materia.return_presenca().toString(),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text("Provas e trabalhos", style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            notasgrid(),
            SizedBox(height: 10),
            Text("Faltas e presenças", style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Container(
              height: 250,
              child: ListView.builder(
                itemCount: _presencalist.length,
                itemBuilder: (context, int index) {
                  print(normalize_data(_presencalist[index]["data"]));
                  Icon _presencaicon = Icon(Icons.close, color: Colors.grey);
                  if (_presencalist[index]['tipo'] == PresencaTipo.Falta) {
                    _presencaicon = Icon(Icons.close, color: Colors.red);
                  } else if (_presencalist[index]['tipo'] ==
                      PresencaTipo.FaltaJustificada) {
                    _presencaicon = Icon(Icons.close, color: Colors.yellow);
                  } else if (_presencalist[index]['tipo'] ==
                      PresencaTipo.Presente) {
                    _presencaicon = Icon(Icons.check, color: Colors.green);
                  }
                  return Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                      right: 20,
                      left: 20,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        border: BoxBorder.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _presencaicon,
                          Text(
                            "Data: ${normalize_data(_presencalist[index]["data"])}",
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container notasgrid() {
    return Container(
      height: 250,
      child: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: _notalist.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2,
        ),
        itemBuilder: (context, int index) {
          return Padding(
            padding: EdgeInsets.all(5),
            child: Container(
              decoration: BoxDecoration(
                border: BoxBorder.all(color: Colors.black),
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    "${_notalist[index]['tipo_nota']} - ${_notalist[index]["nome_nota"]}",
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Nota: ${_notalist[index]['nota']}"),
                        Text("Peso: ${_notalist[index]['peso']}"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Container containergrid(String title, String data) {
    return Container(
      decoration: BoxDecoration(
        border: BoxBorder.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(children: [Text(title), Text(data)]),
      ),
    );
  }
}

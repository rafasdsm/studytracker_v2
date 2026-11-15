import 'package:flutter/widgets.dart';
import 'package:material_ui/material_ui.dart';
import 'package:studytracker_v2/model/models.dart';

class MateriaDetailPage extends StatelessWidget {
  Materia _materia;
  MateriaDetailPage(this._materia, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_materia.nome), centerTitle: true),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.edit),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Container da média
                containergrid("Média Atual", _materia.gerar_media().toString()),
                containergrid("Faltas", _materia.return_falta().toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container containergrid(String title, String data) {
    return Container(
      decoration: BoxDecoration(
        border: BoxBorder.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(children: [Text(title), Text(data)]),
      ),
    );
  }
}

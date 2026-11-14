import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MateriaFormPage extends StatefulWidget {
  MateriaFormPage({super.key});

  @override
  State<MateriaFormPage> createState() => _MateriaFormPageState();
}

class _MateriaFormPageState extends State<MateriaFormPage> {
  final TextEditingController _materia = TextEditingController();
  final TextEditingController _professor = TextEditingController();
  final TextEditingController _cargahoraria = TextEditingController();
  final TextEditingController _horadiaria = TextEditingController();
  List<bool> dias = [false, false, false, false, false, false, false];

  @override
  void dispose() {
    _materia.dispose();
    _professor.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
            children: [
              SizedBox(height: 50),
              inputcontainer("Nome da matéria", _materia),
              inputcontainer("Nome do professor da matéria", _professor),
              /////////////////////////
              //                     //
              // Trocar por um Ratio //
              //                     //
              /////////////////////////
              inputcontainer("Carga horária (horas)", _cargahoraria), // ratio
              inputcontainer("Horas pro dia (horas)", _horadiaria), // ratio
              Padding(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: Wrap(
                  direction: Axis.horizontal,
                  runSpacing: 5,
                  alignment: WrapAlignment.center,
                  spacing: 20,
                  children: [
                    dayselectbtn("Segunda", 1, Colors.red),
                    dayselectbtn("Terça", 2, Colors.pink),
                    dayselectbtn("Quarta", 3, Colors.green),
                    dayselectbtn("Quinta", 4, Colors.blue),
                    dayselectbtn("Sexta", 5, Colors.orange),
                    dayselectbtn("Sábado", 6, Colors.deepPurpleAccent),
                    dayselectbtn("Domingo", 7, Colors.brown),
                  ],
                ),
              ),
              ElevatedButton(onPressed: () {}, child: Text("Salvar Matéria")),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector dayselectbtn(
    String _dia,
    int index,
    Color cordodia, {
    Color cor_texto = Colors.white,
  }) {
    bool selected = dias[index - 1];
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = selected == false ? true : false;
          dias[index - 1] = selected;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: selected == true ? cordodia : Colors.grey,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          child: Text(
            _dia,
            style: TextStyle(
              color: selected == true ? cor_texto : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Padding inputcontainer(String hint, TextEditingController text_controller) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        controller: text_controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Text(hint),
        ),
      ),
    );
  }
}

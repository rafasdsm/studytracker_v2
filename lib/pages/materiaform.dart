import 'package:material_ui/material_ui.dart';
import 'package:studytracker_v2/model/localbank.dart';
import 'package:studytracker_v2/model/models.dart';

/*
Forms da matéria

*/

class MateriaFormPage extends StatefulWidget {
  const MateriaFormPage({super.key});

  @override
  State<MateriaFormPage> createState() => _MateriaFormPageState();
}

class _MateriaFormPageState extends State<MateriaFormPage> {
  final AppSession _session = AppSession();

  final TextEditingController _Controllermateria = TextEditingController();
  final TextEditingController _ControllerProfessor = TextEditingController();
  final TextEditingController _ControllerCargaTotal = TextEditingController();
  final TextEditingController _ControllerCargaDiaria = TextEditingController();

  int cargatotal = 0;
  int cargadiaria = 0;
  String professor = "";
  String materia = "";

  final Map<String, bool> _dias = gerar_map();

  String error = "";

  static List<Color> colors = [
    Colors.blue,
    Colors.deepPurpleAccent,
    Colors.pinkAccent,
    Colors.green,
    Colors.orange,
    Colors.teal,
    Colors.indigo,
  ];

  bool save = false;

  @override
  void dispose() {
    super.dispose();
    _Controllermateria.dispose();
    _ControllerProfessor.dispose();
    _ControllerCargaDiaria.dispose();
    _ControllerCargaTotal.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<GestureDetector> daybtnlist = [];
    for (var i in diasemananome) {
      daybtnlist.add(daybutton(i, colors[diasemananome.indexOf(i)]));
    }

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: error.isEmpty ? false : true,
                child: warningcontainer(),
              ),
              SizedBox(height: 20),
              inputfield(
                TextInputType.text,
                "Nome da Matéria",
                _Controllermateria,
              ),
              inputfield(
                TextInputType.text,
                "Nome do professor",
                _ControllerProfessor,
              ),
              inputfield(
                TextInputType.number,
                "Carga Horária total (Horas)",
                _ControllerCargaTotal,
              ),
              inputfield(
                TextInputType.number,
                "Carga Horária Diária (Horas)",
                _ControllerCargaDiaria,
              ),
              dayswrap(daybtnlist),
              savebutton(),
            ],
          ),
        ),
      ),
    );
  }

  Padding warningcontainer() {
    return Padding(
      padding: EdgeInsets.only(left: 50, right: 50),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: error.isNotEmpty ? Colors.red : Colors.transparent,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.only(bottom: 15, top: 15),
            child: Text(
              "Alerta: $error",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: error.isNotEmpty ? Colors.white : Colors.transparent,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void check_cansave() {
    setState(() {
      save = false;
      materia = _Controllermateria.text;
      professor = _ControllerProfessor.text;

      if (materia.isEmpty) {
        error = "Matéria sem nome";
      } else if (professor.isEmpty) {
        error = "Professor sem nome";
      } else if (_ControllerCargaTotal.text.isEmpty) {
        error = "Sem carga horária";
      } else if (_ControllerCargaDiaria.text.isEmpty) {
        error = "Sem carga diária";
      } else if (_ControllerCargaTotal.text.isNotEmpty &&
          int.tryParse(_ControllerCargaTotal.text) == false) {
        error = "Coloque uma carga horária em números";
      } else if (_ControllerCargaDiaria.text.isNotEmpty &&
          int.tryParse(_ControllerCargaDiaria.text) == false) {
        error = "Coloque uma carga diária em números";
      } else if (int.parse(_ControllerCargaTotal.text) <= 0) {
        error = "Carga horária tem que ser maior que 0";
      } else if (int.parse(_ControllerCargaDiaria.text) <= 0) {
        error = "Carga diária tem que ser maior que 0";
      } else if (int.parse(_ControllerCargaDiaria.text) >=
          int.parse(_ControllerCargaTotal.text)) {
        error = "Carga diaria é maior ou igual a carga total";
      } else if (!_dias.containsValue(true)) {
        error = "Selecione pelo menos um dia para a matéria";
      } else {
        cargadiaria = int.parse(_ControllerCargaDiaria.text);
        cargatotal = int.parse(_ControllerCargaTotal.text);
        error = "";
        save = true;
      }
    });
  }

  GestureDetector savebutton() {
    return GestureDetector(
      onTap: () {
        if (save == true) {
          Materia materiaObject = Materia(
            carga_diaria: cargadiaria,
            carga_horaria: cargatotal,
            diassemana: _dias.values.toList(),
            nome: materia,
            professor: professor,
          );
          _session.materias.add(materiaObject);
          Navigator.pop(context);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: save == true ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          child: Text(
            "Salvar Matéria",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Padding inputfield(
    TextInputType inputtype,
    String hint,
    TextEditingController controller,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        onChanged: (value) => check_cansave(),
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          label: Text(hint),
        ),
        keyboardType: inputtype,
        controller: controller,
      ),
    );
  }

  Wrap dayswrap(List<GestureDetector> daybtnlist) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 20,
      runSpacing: 10,
      children: daybtnlist,
    );
  }

  GestureDetector daybutton(String dianome, Color cor) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _dias[dianome] = !(_dias[dianome] ?? false);
          check_cansave();
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: _dias[dianome] == true ? cor : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 10,
            bottom: 10,
          ),
          child: Text(
            dianome,
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
      ),
    );
  }
}

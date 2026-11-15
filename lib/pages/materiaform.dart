import 'package:material_ui/material_ui.dart';
import 'package:studytracker_v2/model/localbank.dart';
import 'package:studytracker_v2/model/models.dart';

class MateriaFormPage extends StatefulWidget {
  const MateriaFormPage({super.key});

  @override
  State<MateriaFormPage> createState() => _MateriaFormPageState();
}

class _MateriaFormPageState extends State<MateriaFormPage> {
  final TextEditingController _materia = TextEditingController();
  final TextEditingController _professor = TextEditingController();
  final TextEditingController _cargahoraria = TextEditingController();
  final TextEditingController _horadiaria = TextEditingController();
  final AppSession _appSession = AppSession();
  String error = "";
  List<bool> dias = [false, false, false, false, false, false, false];
  bool save = false;

  @override
  void dispose() {
    super.dispose();
    _materia.dispose();
    _professor.dispose();
    _cargahoraria.dispose();
    _horadiaria.dispose();
    dias.clear();
    for (var i = 0; i < 7; i++) {
      dias.add(false);
    }
  }

  void _validacao() {
    setState(() {
      if (_materia.text.isEmpty) {
        error = "Matéria inválida";
        save = false;
      } else if (_professor.text.isEmpty) {
        error = "Nome do Professor inválida";
        save = false;
      } else if (_cargahoraria.text.isEmpty) {
        error = "Coloque uma carga horária válida";
        save = false;
      } else if (_horadiaria.text.isEmpty) {
        error = "Coloque quantas horas de aula você tem por dia";
        save = false;
      } else if (int.parse(_cargahoraria.text) == 0) {
        error = "Coloque uma carga horária maior que 0";
        save = false;
      } else if (int.parse(_horadiaria.text) == 0) {
        error = "A hora diária deve ser maior que 0";
        save = false;
      } else if (int.parse(_cargahoraria.text) <= int.parse(_horadiaria.text)) {
        error =
            "A carga horária não pode ser\n menor ou igual que a carga diária";
        save = false;
      } else if (!dias.contains(true)) {
        error = "Selecione pelo menos um dia para a matéria";
        save = false;
      } else {
        error = "";
        save = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      O appbar mostra os dialogos de erro.
      Sempre que o usuário digita algo, é validado pela função "_validacao"
      O mesmo se aplica quando ele clica no botão dos dias
      O usuário só poderá salvar a matéria se ele preencher todos os dados de maneira cooerente
      
      /////////////////////////////////////////////////////////////////////////////////
      
      Logica dos dados:
        - O nome da matéria não pode ser em branco
        - O nome do professor não pode ser em branco
        - A carga horária não pode ser em branco
        - A carga horária não pode ser 0
        - A carga horária tem que ser maior que as horas por dia
        - As horas por dia não podem ser em branco
        - As horas pro dia não podem ser 0
        - As horas por dia não podem ser maior que a carga horária do curso
        - Tem que ter pelo menos um dia atribuido ao curso
        
      */
      backgroundColor: Color.fromARGB(255, 252, 248, 242),
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.red,
          ),
          child: Padding(
            padding: error.length > 0
                ? EdgeInsets.all(10)
                : EdgeInsetsGeometry.all(0),
            child: Text(
              error,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
            children: [
              SizedBox(height: 50),
              inputcontainer("Nome da matéria", _materia, TextInputType.text),
              inputcontainer(
                "Nome do professor da matéria",
                _professor,
                TextInputType.name,
              ),
              ///////////////////////////
              //                       //
              // Trocar por um Ratio?  //
              //                       //
              ///////////////////////////
              inputcontainer(
                "Carga horária (horas)",
                _cargahoraria,
                TextInputType.number,
              ), // ratio
              inputcontainer(
                "Horas pro dia (horas)",
                _horadiaria,
                TextInputType.number,
              ), // ratio
              SizedBox(height: 10),
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
              SizedBox(height: 50),
              GestureDetector(
                onTap: () {
                  String professornome = _professor.text;
                  String materia = _materia.text;
                  int cargahoraria = 0;
                  int horaspordia = 0;
                  if (error == "" && save == true) {
                    cargahoraria = int.parse(_cargahoraria.text);
                    horaspordia = int.parse(_horadiaria.text);
                    Materia matobject = Materia(
                      cargahoraria: cargahoraria,
                      horapordia: horaspordia,
                      nome: materia,
                      professor: professornome,
                      semana: dias,
                    );
                    _appSession.materias.add(matobject);
                    Navigator.pop(context);
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                    color: save == false ? Colors.grey : Colors.blue,
                    borderRadius: BorderRadius.circular(30),
                  ),
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
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector dayselectbtn(
    String dia,
    int index,
    Color cordodia, {
    Color cor_texto = Colors.white,
  }) {
    bool selected = dias[index - 1];
    return GestureDetector(
      onTap: () {
        setState(() {
          dias[index - 1] = !dias[index - 1];
        });
        _validacao();
      },
      child: Container(
        decoration: BoxDecoration(
          color: selected == true ? cordodia : Colors.grey,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          child: Text(
            dia,
            style: TextStyle(
              color: selected == true ? cor_texto : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Padding inputcontainer(
    String hint,
    TextEditingController textController,
    TextInputType inputtype,
  ) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        keyboardType: inputtype,
        onChanged: (text) => _validacao(),
        controller: textController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            gapPadding: 5,
          ),
          label: Text(hint),
        ),
      ),
    );
  }
}

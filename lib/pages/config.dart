import 'package:material_ui/material_ui.dart';
import 'package:studytracker_v2/components/bottomappbar.dart';
import 'package:studytracker_v2/model/localbank.dart';

class ConfigPage extends StatefulWidget {
  ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  AppSession _session = AppSession();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CBottomappbar(),
      backgroundColor: Color.fromARGB(255, 252, 248, 242),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              spacing: 20,
              children: [
                Row(
                  spacing: 20,
                  children: [
                    Text("Presença mínima %:", style: TextStyle(fontSize: 15)),
                    Expanded(
                      child: TextFormField(
                        initialValue: (_session.presencaminima * 100).toString(),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                Row(
                  spacing: 20,
                  children: [
                    Text("Nota máxima:", style: TextStyle(fontSize: 15)),
                    Expanded(
                      child: TextFormField(
                        initialValue: _session.notamaxima.toString(),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

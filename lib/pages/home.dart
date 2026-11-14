import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 248, 242),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
            children: [
              materiacontainer(
                "Banco de dados",
                [9.6, 10],
                [3, 10],
                Icon(Icons.check_circle, color: Colors.green),
              ),
              materiacontainer(
                "Banco de dados",
                [9.6, 10],
                [3, 10],
                Icon(Icons.check_circle, color: Colors.green),
              ),
              materiacontainer(
                "Banco de dados",
                [9.6, 10],
                [3, 10],
                Icon(Icons.check_circle, color: Colors.green),
              ),
              materiacontainer(
                "Banco de dados",
                [9.6, 10],
                [3, 10],
                Icon(Icons.check_circle, color: Colors.green),
              ),
            ],
          ),
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

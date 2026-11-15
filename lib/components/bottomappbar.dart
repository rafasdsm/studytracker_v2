import 'package:material_ui/material_ui.dart';
import 'package:studytracker_v2/model/localbank.dart';
import 'package:studytracker_v2/pages/config.dart';
import 'package:studytracker_v2/pages/dashboard.dart';
import 'package:studytracker_v2/pages/materias.dart';
import 'package:studytracker_v2/pages/notas.dart';

class CBottomappbar extends StatelessWidget {
  CBottomappbar({super.key});
  AppSession _session = AppSession();

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.grey.shade400,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        spacing: 20,
        children: [
          IconButton(
            onPressed: () {
              _session.selectedpage = 0;
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryanimation) =>
                      Dashboard(),
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                ),
              );
            },
            icon: Icon(
              Icons.dashboard,
              color: _session.selectedpage == 0
                  ? Colors.deepPurpleAccent.shade400
                  : Colors.grey.shade300,
            ),
          ),
          IconButton(
            onPressed: () {
              _session.selectedpage = 1;
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryanimation) =>
                      MateriasPage(),
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                ),
              );
            },
            icon: Icon(
              Icons.book,
              color: _session.selectedpage == 1
                  ? Colors.blue
                  : Colors.grey.shade300,
            ),
          ),
          IconButton(
            onPressed: () {
              _session.selectedpage = 3;
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryanimation) =>
                      NotasPage(),
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                ),
              );
            },
            icon: Icon(
              Icons.grade,
              color: _session.selectedpage == 3
                  ? Colors.yellow
                  : Colors.grey.shade300,
            ),
          ),
          IconButton(
            onPressed: () {
              _session.selectedpage = 4;

              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryanimation) =>
                      ConfigPage(),
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                ),
              );
            },
            icon: Icon(
              Icons.settings,
              color: _session.selectedpage == 4
                  ? Colors.black
                  : Colors.grey.shade300,
            ),
          ),
        ],
      ),
    );
  }
}

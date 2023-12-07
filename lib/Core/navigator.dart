import 'package:todo_app/Utils/exports.dart';

class GoRouter {
  late GlobalKey<NavigatorState> navigationKey;

  static GoRouter instance = GoRouter();

  GoRouter() {
    navigationKey = GlobalKey<NavigatorState>();
  }

  goRoute(Widget rn) {
    return navigationKey.currentState!
        .push(MaterialPageRoute(builder: (context) => rn));
  }

  goBack() {
    return navigationKey.currentState!.pop();
  }
}

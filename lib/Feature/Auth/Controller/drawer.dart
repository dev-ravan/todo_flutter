import 'package:todo_app/Utils/exports.dart';

class DrawerProvider extends ChangeNotifier {
  // Navigation
  final GoRouter _router;
  DrawerProvider(this._router);
  // Global scaffold key
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  // Helps to navigate to profile
  goToProfile() => _router.goRoute(const Profile());
}

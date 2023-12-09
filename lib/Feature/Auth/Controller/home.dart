// ignore_for_file: unused_field

import 'package:todo_app/Utils/exports.dart';

class HomeProvider extends ChangeNotifier {
  // Navigation
  final GoRouter _router;
  HomeProvider(this._router);
  // Global scaffold key
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  // Helps to open the drawer
  openDrawer() => scaffoldKey.currentState!.openDrawer();
}

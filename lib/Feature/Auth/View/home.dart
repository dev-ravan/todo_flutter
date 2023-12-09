import 'package:todo_app/Utils/exports.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();
    return SafeArea(
      child: Scaffold(
        key: provider.scaffoldKey,
        backgroundColor: Palette.white,

        // Drawer
        drawer: const AppDrawer(),

        // App Bar
        appBar: MyAppBar(
            context: context,
            userName: "Ravan",
            onTap: () => provider.openDrawer()),
      ),
    );
  }
}

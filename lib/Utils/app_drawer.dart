import 'package:todo_app/Utils/exports.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DrawerProvider>();
    return Drawer(
      child: Material(
        color: Palette.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ? Header
              gap20,
              MyTexts().LogoText(size: 30),
              gap20,
              Divider(color: Palette.grey),
              gap20,
              myWidgets.drawerListTile(icon: Icons.home, title: "Home"),
              gap10,
              myWidgets.drawerListTile(icon: Icons.message, title: "Messages"),
              gap10,
              myWidgets.drawerListTile(
                  icon: Icons.notifications, title: "Notification"),
              gap10,
              myWidgets.drawerListTile(icon: Icons.info, title: "About"),
              const Spacer(flex: 3),
              // ? Footer
              Expanded(
                  child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    Divider(color: Palette.grey),
                    gap10,
                    Row(
                      children: [
                        myWidgets.miniAvatar(
                            onTap: () => provider.goToProfile(),
                            image: "assets/Images/profile.jpg"),
                        gap10,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyTexts()
                                .DMSansNormalBlackText(text: "Ravan", size: 18),
                            MyTexts().DMSansNormalGreyText(
                                text: "ravan@gmail.com", size: 15)
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

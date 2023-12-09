// ignore_for_file: non_constant_identifier_names

import 'package:todo_app/Utils/exports.dart';

PreferredSizeWidget MyAppBar(
    {required BuildContext context,
    required Function onTap,
    required String userName}) {
  return AppBar(
    title: MyTexts().WelcomeText(size: 25, userName: userName),
    backgroundColor: Palette.white,
    automaticallyImplyLeading: false,
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 10),
        child: InkWell(
            onTap: onTap as void Function(),
            child: SvgPicture.asset(menuIcon, width: 30)),
      )
    ],
  );
}

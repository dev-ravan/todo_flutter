import 'package:todo_app/Utils/exports.dart';

final myButtons = MyButtons();

class MyButtons {
  Widget customButton(
      {required BuildContext context,
      required String title,
      required Function onTap,
      Color? color}) {
    return Material(
      borderRadius: BorderRadius.circular(15),
      color: color ?? Palette.black,
      child: InkWell(
        onTap: onTap as void Function(),
        child: SizedBox(
          height: 60,
          width: double.infinity,
          child: Center(
              child: Text(
            title,
            style: GoogleFonts.dmSans(
                color: Palette.white,
                fontWeight: FontWeight.w600,
                fontSize: 20),
          )),
        ),
      ),
    );
  }

  Widget redButton({
    required String title,
    required Function onTap,
  }) {
    return InkWell(
        onTap: onTap as void Function(),
        child: MyTexts().MiniRedText(text: title));
  }
}

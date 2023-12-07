import 'package:todo_app/Utils/exports.dart';

final myWidgets = MyWidgets();

class MyWidgets {
  Widget profileAvatar({required Function onTap, required image}) => Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Stack(
            children: [
              CircleAvatar(
                radius: 52,
                backgroundColor: Palette.black,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[200],
                  backgroundImage: image,
                ),
              ),
              Positioned(
                  bottom: 2,
                  right: 2,
                  child: InkWell(
                    onTap: onTap as void Function(),
                    child: const CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.black54,
                      child: Icon(
                        Icons.add_a_photo,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ))
            ],
          ),
        ),
      );

  Widget skillChips({required String text, required Function onCancel}) =>
      Container(
        width: 90,
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
        decoration: BoxDecoration(
            color: Palette.black, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyTexts().DMSansNormalWhiteText(text: text, size: 16),
            InkWell(
              onTap: onCancel as void Function(),
              child: Icon(
                Icons.cancel,
                size: 20,
                color: Palette.white,
              ),
            )
          ],
        ),
      );
}

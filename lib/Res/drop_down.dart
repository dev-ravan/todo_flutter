import 'package:todo_app/Utils/exports.dart';

final myDropDowns = MyDropDowns();

class MyDropDowns {
  genderDropDown(
          {required String hintText,
          required String? Function(dynamic) validator,
          required int value,
          required List<DropdownMenuItem> items,
          required IconData icon}) =>
      DropdownButtonFormField(
        value: value,
        items: items,
        onChanged: (val) {
          val = value;
          print(val);
        },
        validator: validator,
        focusColor: Palette.white,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Palette.grey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Palette.black)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Palette.red)),
        ),
      );
}

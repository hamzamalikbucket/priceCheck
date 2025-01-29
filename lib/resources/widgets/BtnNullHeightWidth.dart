
import 'package:compareapp/resources/Widgets/app_text.dart';
import 'package:flutter/material.dart';


class BtnNullHeightWidth extends StatelessWidget {
  String title;
  Color bgcolour;
  Color bordercolour;
  Color disablecolor;
  Color textcolour;
  late ValueChanged<String> value;
  late VoidCallback onPress;
  late double width;
  late double height;

  BtnNullHeightWidth(
      {super.key,
      required this.title,
      required this.bgcolour,
      required this.bordercolour,
      required this.disablecolor,
      required this.textcolour,
      required this.onPress,
      required this.width,
      required this.height});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(

        onPressed: () => onPress(),
        style: ElevatedButton.styleFrom(
            backgroundColor: bgcolour,
            elevation: 0,

            disabledForegroundColor: disablecolor.withOpacity(0.38),
            disabledBackgroundColor: disablecolor.withOpacity(0.12),

            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(95.0),
                side: BorderSide(color: bordercolour, width: 0))),
        child: AppText(
          title,
          size: 12,
          fontWeight: FontWeight.w400,
          color: textcolour,
        ),


      ),
    );
  }
}

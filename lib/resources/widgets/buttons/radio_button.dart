import 'package:compareapp/resources/Widgets/app_text.dart';
import 'package:compareapp/resources/utils/app_colors.dart';
import 'package:flutter/material.dart';


class AppRadioButton extends StatelessWidget {
  final dynamic value;
  final Function(dynamic)? onChanged;
  final dynamic groupValue;
  final String text;
  final double textWidth;
  final bool infoIcon;
  final Function()? infoOnPress;
  final bool enabled;

  const AppRadioButton({
    super.key,
    required this.value,
    this.onChanged,
    required this.groupValue,
    required this.text,
    this.textWidth = 0.8,
    this.infoIcon = false,
    this.infoOnPress,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        unselectedWidgetColor: AppColors.black,
      ),
      child: Row(
        children: [
          Radio(
            toggleable: false,
            value: value,
            onChanged: enabled ? onChanged : null,
            groupValue: groupValue,
            activeColor: AppColors.appGreenColor,
          ),
          Flexible(
            child: AppText(
              text,
              color: enabled ? Colors.black : Colors.grey,
              size: 15,
            ),
          ),
          if (infoIcon == true) ...[
            IconButton(
              icon: const Icon(
                Icons.info,
                color: Colors.yellow,
              ),
              onPressed: () {
                infoOnPress!();
              },
            ),
          ]
        ],
      ),
    );
  }
}

class AppRadioButtonList extends StatelessWidget {
  final dynamic value;
  final Function(dynamic)? onChanged;
  final dynamic groupValue;
  final String text;
  final double textWidth;
  final bool enabled;

  const AppRadioButtonList({
    super.key,
    required this.value,
    this.onChanged,
    required this.groupValue,
    required this.text,
    this.textWidth = 0.8,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        //here change to your color
        unselectedWidgetColor: Colors.black,
      ),
      child: Row(
        children: [
          Radio(
            value: value,
            onChanged: enabled ? onChanged : null,
            groupValue: groupValue,
            activeColor: AppColors.appGreenColor,
          ),
          AppText(
            text,
            color: enabled ? Colors.black : Colors.grey,
            size: 13,
          ),
        ],
      ),
    );
  }
}

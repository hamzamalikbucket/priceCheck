import 'package:compareapp/resources/Widgets/app_text.dart';
import 'package:compareapp/resources/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ToolbarBack extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final AppBar appBar;
  final List<Widget>? action;

  const ToolbarBack({super.key, required this.title,required  this.appBar, this.action});

  @override
  Widget build(BuildContext context) {
    return (
        AppBar(
          backgroundColor: AppColors.primaryColor,
          automaticallyImplyLeading: true,
            centerTitle: true,
            elevation: 1,

          title:AppText(
            title,
            size: 17,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
          actions: action ?? [],
          iconTheme: const IconThemeData(
            color: AppColors.black,

            //change your color here
          ),
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}

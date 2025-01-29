import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class ToolbarImage extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  final List<Widget>? action;


  const ToolbarImage({super.key, required this.appBar, this.action,});

  @override
  Widget build(BuildContext context) {
    return (AppBar(
      elevation: 1,
      automaticallyImplyLeading: true,
      backgroundColor: Colors.white,
      centerTitle: true,

      iconTheme: const IconThemeData(
        color: AppColors.black,
        //change your color here
      ),
    ));
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}

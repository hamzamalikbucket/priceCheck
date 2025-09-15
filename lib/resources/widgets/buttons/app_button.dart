
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:compareapp/resources/utils/app_colors.dart';
import 'package:compareapp/resources/utils/constants.dart';

class AppButton extends StatelessWidget {
  final Function? onTap;
  final double? width;
  final double? height;
  final String assetUrl;
  final bool disabled;

  const AppButton({
    super.key,
    this.onTap,
    this.width,
    this.disabled = false,
    this.height,
    this.assetUrl = Constants.loginBTn,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: GestureDetector(
        onTap: () {
          if (!disabled && onTap != null) onTap!();
        },
        child: SvgPicture.asset(
          assetUrl,
        ),
      ),
    );
  }
}
class AppCircularButton extends StatelessWidget {
  final Function? onTap;
  final double? width;
  final double? height;
  final String assetUrl;
  final bool disabled;
  final String btnText;
  final Color btnTextColor;
  final Color btnColor;
  final Color assetColor;
  final double btnTextSize;

  final Color borderColor;

  const AppCircularButton({
    super.key,
    this.onTap,
    this.width,
    this.disabled = false,
    this.height,
    this.assetUrl = Constants.loginBTn,

    this.btnTextColor = AppColors.primaryColor,
    this.btnColor = AppColors.buttonBlueColor,
    this.assetColor = AppColors.black,
    this.btnTextSize = 16,
    this.btnText = 'Button',
    this.borderColor = AppColors.noColor,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: btnColor,
        border: Border.all(width: 1, color: borderColor),
        borderRadius: BorderRadius.circular(50),
      ),
      child: GestureDetector(
        onTap: () {
          if (!disabled && onTap != null) onTap!();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(

              assetUrl,
              height: 30,
              color: assetColor,
            ),
            Text(
              btnText,
              style: GoogleFonts.jost(
                color:
                disabled == false ? btnTextColor : AppColors.lightgreybgColor,
                fontSize: btnTextSize,

              ),
            ),

          ],
        ),
      ),
    );
  }
}

class AppSimpleButton extends StatelessWidget {
  final Function? onTap;
  final double? width;
  final double? height;
  final String btnText;
  final Color btnTextColor;
  final Color btnColor;
  final double btnTextSize;
  final FontWeight? fontWeight;
  final bool disabled;

  const AppSimpleButton({
    super.key,
    this.onTap,
    this.width,
    this.disabled = false,
    this.height,
    this.btnText = 'Button',
    this.btnTextColor = AppColors.primaryColor,
    this.btnColor = AppColors.buttonBlueColor,
    this.btnTextSize = 16,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!disabled && onTap != null) onTap!();
      },
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            btnText,
            style: GoogleFonts.jost(
              color:
                  disabled == false ? btnTextColor : AppColors.lightgreybgColor,
              fontSize: btnTextSize,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ),
    );
  }
}

class AppBorderButton extends StatelessWidget {
  final Function? onTap;
  final double? width;
  final double? height;
  final String btnText;
  final Color btnTextColor;
  final Color btnColor;
  final Color borderColor;
  final Color iconColor;
  final double btnTextSize;
  final FontWeight? fontWeight;
  final bool disabled;

  const AppBorderButton({
    super.key,
    this.onTap,
    this.width,
    this.disabled = false,
    this.height,
    this.btnText = 'Button',

    this.borderColor = AppColors.appGreenColor,
    this.btnTextColor = AppColors.primaryColor,
    this.btnColor = AppColors.buttonBlueColor,
    this.iconColor = AppColors.primaryColor,
    this.btnTextSize = 18,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!disabled && onTap != null) onTap!();
      },
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: btnColor,
          border: Border.all(width: 1, color: borderColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                btnText,
                style: GoogleFonts.jost(
                  color:
                      disabled == false ? btnTextColor : AppColors.lightgreybgColor,
                  fontSize: btnTextSize,
                  fontWeight: fontWeight,
                ),
              ),
           Padding(
               padding: const EdgeInsets.only(left: 8),
               child: Icon(
                 Icons.arrow_forward,
                 color: iconColor,

               ),
             )
            ],
          ),
        ),
      ),
    );
  }
}

class AppGradiantButton extends StatelessWidget {
  final Function? onTap;
  final double? width;
  final double? height;
  final String btnText;
  final Color btnTextColor;
  final double btnTextSize;
  final bool disabled;

  const AppGradiantButton({
    super.key,
    this.onTap,
    this.width,
    this.disabled = false,
    this.height,
    this.btnText = 'Button',
    this.btnTextColor = Colors.white,
    this.btnTextSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!disabled && onTap != null) onTap!();
      },
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            colors: [AppColors.gradiantStartColor, AppColors.gradiantEndColor],
            stops: [0.0, 1.0],
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.topRight,
            tileMode: TileMode.repeated,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            btnText,
            style: GoogleFonts.jost(
              color:
                  disabled == false ? btnTextColor : AppColors.lightgreybgColor,
              fontSize: btnTextSize,
            ),
          ),
        ),
      ),
    );
  }
}

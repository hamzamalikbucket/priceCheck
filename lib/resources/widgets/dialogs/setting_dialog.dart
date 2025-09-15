
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:compareapp/resources/utils/app_colors.dart';

import 'package:compareapp/resources/widgets/sized_boxes.dart';
class SettingDialog extends StatelessWidget {
  final Function? onTapSetting;
  final Function? onTapSecurity;
  final Function? onTapRecording;
  final Function? onTapVideoShare;

  const SettingDialog({
    super.key,
    this.onTapSetting,
    this.onTapSecurity,
    this.onTapRecording,
    this.onTapVideoShare,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(20.0), // Adjust the radius as needed
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          border: Border.all(
            width: 1,
            color: AppColors.appGreenColor,
          ),
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10.0,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  onTapSetting!();
                },
                child: Text(
                  'Setting',
                  style: GoogleFonts.jost(
                    fontSize: 18,
                    color: AppColors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Divider(),
              TextButton(
                onPressed: () {
                  onTapSecurity!();
                },
                child: Text(
                  'Security',
                  style: GoogleFonts.jost(
                    fontSize: 18,
                    color: AppColors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Divider(),
              TextButton(
                onPressed: () {
                  onTapRecording!();
                },
                child: Text(
                  'Recording',
                  style: GoogleFonts.jost(
                    fontSize: 18,
                    color: AppColors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Divider(),
              TextButton(
                onPressed: () {
                  onTapVideoShare!();
                },
                child: Text(
                  'Video Share',
                  style: GoogleFonts.jost(
                    fontSize: 18,
                    color: AppColors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizeBoxHeight16(),
            ],
          ),
        ),
      ),
    );
  }
}

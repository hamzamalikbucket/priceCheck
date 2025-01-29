import 'package:compareapp/resources/Widgets/app_text.dart';
import 'package:compareapp/resources/utils/app_colors.dart';
import 'package:compareapp/resources/widgets/ToolbarImage.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart' show rootBundle;


class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AboutState();
  }
}

class AboutState extends State<AboutUsScreen> {
  String data = '';

  fetchFileData() async {
    String responseText;
    responseText = await rootBundle.loadString("assets/doc/aboutus.txt");
    setState(() {
      data = responseText;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchFileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: ToolbarImage(
        appBar: AppBar(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppHeadings(
                  'About Us',
                  size: 22,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                ),
                AppText(
                   data,
                  size: 12,
                  fontWeight: FontWeight.w700,
                 color: AppColors.black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

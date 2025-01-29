
import 'package:compareapp/Models/vendor_model.dart';
import 'package:flutter/material.dart';


import 'package:compareapp/resources/utils/app_colors.dart';

import 'package:compareapp/resources/widgets/sized_boxes.dart';

class AppDropDownFields<T> extends StatelessWidget {
  final String? hint;
  final List<T>? items;
  final Function? onChange;
  final String? prefixIcon;
  final Function()? validator;
  final T? value;
  final bool? applyValidation;
  final String? errorMessage;

  const AppDropDownFields({
    super.key,
    this.hint,
    required this.items,
    this.value,
    this.onChange,
    this.validator,
    this.applyValidation,
    this.errorMessage = "Required!",
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 30,
          decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(40),
              border: Border.all(
                  color: AppColors.appBlueColor, width: 0.5)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.0), // Reduce vertical padding
            child: Row(
              children: [
                const SizeBoxWidth8(),
                prefixIcon == null
                    ? const SizedBox()
                    : ImageIcon(
                        size: 18,
                        color: Colors.grey,
                        AssetImage(prefixIcon ?? '')),
                Expanded(
                  child: DropdownButtonHideUnderline(

                    child: ButtonTheme(

                      //padding: const EdgeInsets.all(5.0),
                      alignedDropdown: true,

                      child: DropdownButton<T>(

                        isExpanded: true,
                        iconEnabledColor: AppColors.appBlueColor,

                        hint: Text(
                          hint ?? "",
                          style: const TextStyle(
                            fontSize: 8,
                            color:AppColors.appBlueColor,
                          ),
                        ),
                        value: value,

                        items: items != null
                            ?items?.map((i) {
                          return DropdownMenuItem(
                            value: i,
                            child: Text(
                              (i is VendorModel) ? i.vendorName : i.toString(),
                              style: const TextStyle(
                                fontSize: 9.4,
                                color: AppColors.appBlueColor,
                              ),
                            ),
                          );
                        }).toList()

                        : [],
                        onChanged: (item) {

                          if (onChange != null) onChange!(item);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (applyValidation == true)
          Padding(
            padding: const EdgeInsets.only(left: 24.0, top: 8.0, bottom: 4.0),
            child: Text(
              errorMessage!,
              style: const TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
      ],
    );
  }
}

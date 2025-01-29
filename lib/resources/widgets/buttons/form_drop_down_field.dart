
import 'package:flutter/material.dart';


import 'package:compareapp/resources/utils/app_colors.dart';

import 'package:compareapp/resources/widgets/sized_boxes.dart';

class FormDropDownField<T> extends StatelessWidget {
  final String? hint;
  final List<T>? items;
  final Function? onChange;
  final String? prefixIcon;
  final Function()? validator;
  final T? value;
  final bool? applyValidation;
  final String? errorMessage;
  final String Function(T item)? displayText;

  const FormDropDownField({
    super.key,
    this.hint,
    required this.items,
    this.value,
    this.onChange,
    this.validator,
    this.applyValidation,
    this.errorMessage = "Required!",
    this.prefixIcon,
    this.displayText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.0), // Reduce vertical padding
          child: Row(
            children: [
              const SizeBoxWidth8(),
              prefixIcon == null
                  ? const SizedBox()
                  : ImageIcon(
                  size: 25,
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
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color:AppColors.lightgreyColor,
                        ),
                      ),
                      value: value,

                      items: items != null
                          ? items?.map((i) {
                        return DropdownMenuItem<T>(

                            value: i, child:
                        Text(
                          displayText != null ? displayText!(i) : i.toString(),
                          style: const TextStyle(
                            fontSize: 10,

                            color:  AppColors.appBlueColor, //
                          ),


                        ));
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

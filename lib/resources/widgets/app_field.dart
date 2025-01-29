
import 'package:compareapp/resources/utils/constants.dart';
import 'package:flutter/material.dart';


class AppField extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final String? hint;
  final FocusNode? focusNode;
  final String? initialValue;
  final String? prefixIcon;
  final String? suffixIcon;
  final String? errorText;
  final InputDecoration decoration;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool autofocus;
  final bool readOnly;
  final bool? showCursor;
  final bool autocorrect;
  final bool maxLengthEnforced;
  final bool showEmailIcon;
  final bool filled;
  final bool isDense;
  final int maxLines;
  final int? minLines;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final bool? isEnabled;
  final TextInputType keyboardType;

  const AppField({
    super.key,
    required this.controller,
    this.initialValue,
    this.focusNode,
    this.decoration = const InputDecoration(),
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.style,
    this.textDirection,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.autofocus = false,
    this.readOnly = false,
    this.showCursor,
    this.autocorrect = true,
    this.filled = false,
    this.isDense = false,
    this.maxLengthEnforced = true,
    this.showEmailIcon = true,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.validator,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.isEnabled = true,
    this.keyboardType = TextInputType.emailAddress,
    this.hint,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      controller: controller,
      initialValue: initialValue,
      focusNode: focusNode,
      keyboardType: keyboardType,
      textCapitalization: textCapitalization,
      textInputAction: textInputAction,
      style: style,
      textDirection: textDirection,
      textAlign: textAlign,
      textAlignVertical: textAlignVertical,
      autofocus: autofocus,
      readOnly: readOnly,
      showCursor: showCursor,
      autocorrect: autocorrect,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      onChanged: onChanged,
      onTap: onTap,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
      decoration: InputDecoration(
        enabled: isEnabled!,
        fillColor: Colors.white,
        filled: filled,
        isDense: isDense,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        contentPadding: const EdgeInsets.fromLTRB(24, 20, 20, 20),
        labelText: label,
        hintText: hint,
        labelStyle: TextStyle(
            fontSize: 14, color: isEnabled! ? Colors.grey : Colors.grey[400]),
        hintStyle: TextStyle(
            fontSize: 14, color: isEnabled! ? Colors.grey : Colors.grey[400]),
        errorText: errorText,
      ),
    );
  }
}

class AppIconField extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final String? hint;
  final FocusNode? focusNode;
  final String? initialValue;
  final String? prefixIcon;
  final String? suffixIcon;
  final String? errorText;
  final InputDecoration decoration;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool autofocus;
  final bool readOnly;
  final bool? showCursor;
  final bool autocorrect;
  final bool maxLengthEnforced;
  final bool showEmailIcon;
  final bool filled;
  final bool isDense;
  final int maxLines;
  final int? minLines;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final bool? isEnabled;
  final TextInputType keyboardType;

  const AppIconField({
    super.key,
    required this.controller,
    this.initialValue,
    this.focusNode,
    this.decoration = const InputDecoration(),
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.style,
    this.textDirection,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.autofocus = false,
    this.readOnly = false,
    this.showCursor,
    this.autocorrect = true,
    this.filled = false,
    this.isDense = false,
    this.maxLengthEnforced = true,
    this.showEmailIcon = true,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.validator,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.isEnabled = true,
    this.keyboardType = TextInputType.emailAddress,
    this.hint,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      controller: controller,
      initialValue: initialValue,
      focusNode: focusNode,
      keyboardType: keyboardType,
      textCapitalization: textCapitalization,
      textInputAction: textInputAction,
      style: style,
      textDirection: textDirection,
      textAlign: textAlign,
      textAlignVertical: textAlignVertical,
      autofocus: autofocus,
      readOnly: readOnly,
      showCursor: showCursor,
      autocorrect: autocorrect,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      onChanged: onChanged,
      onTap: onTap,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
      decoration: InputDecoration(
        enabled: isEnabled!,
        fillColor: Colors.white,
        filled: filled,
        isDense: isDense,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        contentPadding: const EdgeInsets.fromLTRB(24, 20, 20, 20),
        prefixIcon: prefixIcon == null
            ? null
            : Padding(
                padding: const EdgeInsets.all(12.0),
                child:
                    ImageIcon(color: Colors.grey, AssetImage(prefixIcon ?? '')),
              ),
        suffixIcon: suffixIcon == null
            ? null
            : Padding(
                padding: const EdgeInsets.all(12.0),
                child:
                    ImageIcon(color: Colors.grey, AssetImage(suffixIcon ?? '')),
              ),
        labelText: label,
        hintText: hint,
        labelStyle: TextStyle(
            fontSize: 14, color: isEnabled! ? Colors.grey : Colors.grey[400]),
        hintStyle: TextStyle(
            fontSize: 14, color: isEnabled! ? Colors.grey : Colors.grey[400]),
        errorText: errorText,
      ),
    );
  }
}

class AppPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String? label;
  final String hint;
  final FocusNode? focusNode;
  final String? initialValue;
  final String? prefixIcon;
  final String? suffixIcon;
  final InputDecoration decoration;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool autofocus;
  final bool readOnly;
  final bool? showCursor;
  final bool autocorrect;
  final bool maxLengthEnforced;
  final bool showEmailIcon;
  final int maxLines;
  final int? minLines;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final bool? isEnabled;
  final TextInputType keyboardType;

  const AppPasswordField({
    super.key,
    required this.controller,
    this.initialValue,
    this.focusNode,
    this.decoration = const InputDecoration(),
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.style,
    this.textDirection,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.autofocus = false,
    this.readOnly = false,
    this.showCursor,
    this.autocorrect = true,
    this.maxLengthEnforced = true,
    this.showEmailIcon = true,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.validator,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.isEnabled = true,
    this.keyboardType = TextInputType.emailAddress,
    required this.hint,
  });

  @override
  State<AppPasswordField> createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField> {
  bool _obscureText = true;

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      initialValue: widget.initialValue,
      focusNode: widget.focusNode,
      keyboardType: widget.keyboardType,
      textCapitalization: widget.textCapitalization,
      textInputAction: widget.textInputAction,
      style: widget.style,
      obscureText: _obscureText,
      textDirection: widget.textDirection,
      textAlign: widget.textAlign,
      textAlignVertical: widget.textAlignVertical,
      autofocus: widget.autofocus,
      readOnly: widget.readOnly,
      showCursor: widget.showCursor,
      autocorrect: widget.autocorrect,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      maxLength: widget.maxLength,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      onEditingComplete: widget.onEditingComplete,
      onFieldSubmitted: widget.onFieldSubmitted,
      validator: widget.validator,
      decoration: InputDecoration(
        enabled: widget.isEnabled!,
        fillColor: Colors.white,
        //filled: true,
        isDense: false,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        contentPadding: const EdgeInsets.fromLTRB(24, 20, 20, 20),
        prefixIcon: widget.prefixIcon == null
            ? null
            : Padding(
                padding: const EdgeInsets.all(12.0),
                child: ImageIcon(
                    color: Colors.grey, AssetImage(widget.prefixIcon ?? '')),
              ),
        suffixIcon: GestureDetector(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ImageIcon(
              color: Colors.grey,
              AssetImage(
                _obscureText ? Constants.slashEye : Constants.eye
              ),
            ),
          ),
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
        // border: OutlineInputBorder(),
        labelText: widget.label,
        hintText: widget.hint,
        labelStyle: TextStyle(
            fontSize: 14,
            color: widget.isEnabled! ? Colors.grey : Colors.grey[400]),
        hintStyle: TextStyle(
            fontSize: 14,
            color: widget.isEnabled! ? Colors.grey : Colors.grey[400]),
      ),
    );
  }
}

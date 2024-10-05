import 'package:flutter/material.dart';

import '../utils/app_theme.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.trailingIcon,
    required this.obsecured,
    required this.controller,
    required this.filled,
    this.fillColor,
    this.inputType,
    this.minLines,
    this.maxLines,
    this.initalValue, this.onChanged, this.border, this.focusedBorder, this.suffixIcon,
  });
  final String hintText;
  final Widget? trailingIcon;
  final Widget? suffixIcon;

  final bool? obsecured;
  final bool filled;
  final Color? fillColor;
  final TextEditingController controller;
  final TextInputType? inputType;
  final int? minLines;
  final int? maxLines;
  final String? initalValue;
  final Function(String)? onChanged;
  final InputBorder? border;
  final InputBorder? focusedBorder;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        onChanged: onChanged,
        initialValue: initalValue,
        controller: controller,
        minLines: minLines,
        maxLines: maxLines ?? 1,
        obscureText: obsecured ?? false,
        keyboardType: inputType,
        decoration: InputDecoration(
            fillColor: fillColor ?? Colors.transparent,
            filled: filled,
            focusedBorder: focusedBorder?? OutlineInputBorder(borderRadius: AppTheme.boxRadius),
            hintText: hintText,
            suffixIcon: trailingIcon,
            prefixIcon:suffixIcon ,
            border: border?? OutlineInputBorder(borderRadius: AppTheme.boxRadius)),
      ),
    );
  }
}

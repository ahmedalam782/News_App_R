import 'package:flutter/material.dart';

import '../Themes/app_theme.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final String? labelText;
  final String? hintText;
  final int? maxLines;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final bool obscureText;
  final Function()? onTap;

  const CustomTextFormField({
    super.key,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.labelText,
    this.hintText,
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
    this.maxLines = 1,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      cursorColor: AppTheme.primary,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
      onTap: onTap,
      validator: validator,
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontSize: 20,
            color: AppTheme.navy,
          ),
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        contentPadding: EdgeInsets.symmetric(
            vertical: MediaQuery.sizeOf(context).height * 0.01),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: AppTheme.primary,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: AppTheme.primary,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: AppTheme.primary,
            width: 1,
          ),
        ),
        hintStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: AppTheme.primary.withOpacity(.3),
            ),
        labelStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: AppTheme.primary,
            ),
        hintText: hintText,
        labelText: labelText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}

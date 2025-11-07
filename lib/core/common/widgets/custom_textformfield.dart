import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextStyle? hintTextStyle;
  final ValueChanged<String>? onChanged;
  final Color? containerColor;
  final Color? containerBorderColor;
  final double? containerBorderWidth;
  final int? maxLines;
  final int? maxLength;
  final bool readonly;
  final bool obscureText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator<String>? validator;
  final Widget? prefixIcon;
  final String? prefixIconPath;
  final String? prefixText;
  final TextStyle? prefixTextStyle;
  final Widget? suffixIcon;
  final Function(String)? onFieldSubmit;
  final String? suffixIconPath;
  final String? suffixText;
  final TextStyle? suffixTextStyle;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? focusedErrorBorder;
  final FocusNode? focusNode;
  final Function(PointerDownEvent)? onTapOutside;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.hintTextStyle,
    this.onChanged,
    this.containerColor,
    this.focusNode,
    this.maxLength,
    this.containerBorderColor,
    this.containerBorderWidth,
    this.maxLines,
    this.readonly = false,
    this.obscureText = false,
    this.validator,
    this.keyboardType,
    this.inputFormatters,
    this.prefixIcon,
    this.prefixIconPath,
    this.prefixText,
    this.prefixTextStyle,
    this.onFieldSubmit,
    this.suffixIcon,
    this.suffixIconPath,
    this.suffixText,
    this.suffixTextStyle,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.focusedErrorBorder,
    this.onTapOutside,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(containerBorderWidth ?? 8),
          border: Border.all(color: AppColors.textWhite),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(25),
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        readOnly: readonly,
        focusNode: focusNode,
        cursorColor: AppColors.primary,
        onTapOutside: onTapOutside ?? (value){
          FocusScope.of(context).unfocus();
        },
        onFieldSubmitted: onFieldSubmit,
        obscureText: obscureText,
        onChanged: onChanged,
        maxLength: maxLength,
        maxLines: maxLines ?? 1,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.textPrimary,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: AppColors.textWhite,
          hintStyle:
          hintTextStyle ??
              TextStyle(color: AppColors.textSecondary,fontSize: 12,fontWeight: FontWeight.w400),
          errorStyle: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.error, // Customize as needed
          ),
          prefixText: prefixText != null ? '$prefixText  ' : null,
          prefixStyle:
          prefixTextStyle ??
              GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: AppColors.textSecondary,
              ),
          counterStyle: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: maxLength != null ? controller.text.length < maxLength! ? AppColors.error : AppColors.success : AppColors.textSecondary,
          ),
          prefixIcon:
          prefixIcon ??
              (prefixIconPath != null
                  ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 11),
                child: Image.asset(prefixIconPath!, width: 26),
              )
                  : null),
          suffixIcon:
          suffixIcon ??
              (suffixIconPath != null
                  ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 11),
                child: Image.asset(suffixIconPath!, width: 26),
              )
                  : null),
          suffixText: suffixText != null ? '  $suffixText' : null,
          suffixStyle:
          suffixTextStyle ??
              GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: AppColors.textSecondary,
              ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(containerBorderWidth ?? 8),
              borderSide: BorderSide(color: AppColors.textWhite)
          ),
          focusedBorder: focusedBorder ?? OutlineInputBorder(
              borderRadius: BorderRadius.circular(containerBorderWidth ?? 8),
              borderSide: BorderSide(color: AppColors.textWhite)
          ),
          focusedErrorBorder: focusedErrorBorder ?? OutlineInputBorder(
              borderRadius: BorderRadius.circular(containerBorderWidth ?? 8),
              borderSide: BorderSide(color: AppColors.textWhite)
          ),
          enabledBorder: enabledBorder ?? OutlineInputBorder(
              borderRadius: BorderRadius.circular(containerBorderWidth ?? 8),
              borderSide: readonly ? BorderSide(color: const Color(0xFFF9F9F9)) : BorderSide(color: AppColors.textWhite)
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(containerBorderWidth ?? 8),
              borderSide: BorderSide(color: AppColors.error)
          ),
          disabledBorder: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        ),
      ),
    );
  }
}

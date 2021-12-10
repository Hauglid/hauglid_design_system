import 'package:hauglid_design_system/src/shared/app_colors.dart';
import 'package:flutter/material.dart';

class AInputField extends StatelessWidget {
  AInputField({
    Key? key,
    required this.controller,
    this.placeholder = '',
    this.leading,
    this.trailing,
    this.trailingTapped,
    this.password = false,
  }) : super(key: key);

  final void Function()? trailingTapped;
  final circularBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
  );

  final TextEditingController controller;
  final Widget? leading;
  final bool password;
  final String placeholder;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(height: 1),
      obscureText: password,
      decoration: InputDecoration(
        hintText: placeholder,
        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        filled: true,
        fillColor: kcVeryLightGreyColor,
        prefixIcon: leading,
        suffixIcon: trailing != null
            ? GestureDetector(
                onTap: trailingTapped,
                child: trailing,
              )
            : null,
        border: circularBorder.copyWith(
          borderSide: const BorderSide(color: kcLightGreyColor),
        ),
        errorBorder: circularBorder.copyWith(
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedBorder: circularBorder.copyWith(
          borderSide: const BorderSide(color: kcPrimaryColor),
        ),
        enabledBorder: circularBorder.copyWith(
          borderSide: const BorderSide(color: kcLightGreyColor),
        ),
      ),
    );
  }
}

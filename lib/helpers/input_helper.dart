import 'package:flutter/material.dart';

class InputHelper {
  static OutlineInputBorder createOutlineInputBorder({
    Color? color,
    double width = 0.0,
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(15)),
  }) {
    return OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(
        color: color ?? Colors.transparent,
        width: width,
      ),
    );
  }

  static InputDecoration createInputDecoration(
    BuildContext context, {
    String? labelText,
    String? placeholderText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    Widget? prefixWidget,
    Widget? suffixWidget,
    Color? fillColor,
    Color? focusedColor,
    Color? enabledColor,
    Color? disabledColor,
    Color? errorColor,
    int? errorMaxLines,
    FloatingLabelAlignment? floatingLabelAlignment,
    FloatingLabelBehavior? floatingLabelBehavior,
    bool filled = true,
  }) {
    return InputDecoration(
      filled: filled,
      fillColor: fillColor ?? Theme.of(context).colorScheme.tertiary,
      errorMaxLines: errorMaxLines,
      floatingLabelAlignment: floatingLabelAlignment,
      floatingLabelBehavior: floatingLabelBehavior,
      labelText: labelText,
      hintText: placeholderText,
      prefix: prefixWidget,
      prefixIcon: prefixIcon,
      suffix: suffixWidget,
      suffixIcon: suffixIcon,
      border: createOutlineInputBorder(),
      focusedBorder: createOutlineInputBorder(color: focusedColor ?? Colors.transparent),
      enabledBorder: createOutlineInputBorder(color: enabledColor ?? Colors.transparent),
      disabledBorder: createOutlineInputBorder(
        color: disabledColor ?? Theme.of(context).colorScheme.tertiary,
      ),
      errorBorder: createOutlineInputBorder(
        color: errorColor ?? Theme.of(context).colorScheme.error,
        width: 2.0,
      ),
    );
  }
}

import 'package:chat_ui/constants.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key key,
    @required this.hintText,
    @required this.controller,
    @required this.focusNode,
    @required this.textInputAction,
    @required this.onFieldSubmitted,
    @required this.validator,
    this.obscureText = false,
  }) : super(key: key);

  final String hintText;
  final Function validator;
  final bool obscureText;
  final FocusNode focusNode;
  final TextEditingController controller;
  final Function onFieldSubmitted;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: kThemeColor.withOpacity(0.7),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(
              color: kThemeColor,
              style: BorderStyle.solid,
              width: 1.5,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(
              color: kThemeColor,
              style: BorderStyle.solid,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(
              color: kThemeColor,
              style: BorderStyle.solid,
              width: 2,
            ),
          ),
          contentPadding: const EdgeInsets.all(kDefaultPadding),
        ),
        controller: controller,
        focusNode: focusNode,
        textInputAction: textInputAction,
        onFieldSubmitted: onFieldSubmitted,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: obscureText,
        validator: validator,
        style: TextStyle(color: kThemeColor.withOpacity(0.7), fontSize: 18),
      ),
    );
  }
}

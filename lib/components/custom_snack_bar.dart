import 'package:flutter/material.dart';

SnackBar snackBarBuilder({
  BuildContext context,
  Color color,
  String text,
}) {
  Size size = MediaQuery.of(context).size;
  return SnackBar(
    content: Text(
      text,
      textAlign: TextAlign.center,
    ),
    behavior: SnackBarBehavior.floating,
    elevation: 10,
    width: size.width * 0.9,
    backgroundColor: color,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(40),
    ),
  );
}

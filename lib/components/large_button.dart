import 'package:flutter/material.dart';

class LargeButton extends StatelessWidget {
  final String text;
  final Function onTap;
  final Color color;
  final Color textColor;
  final bool isLoading;
  final bool isDisabled;

  const LargeButton({
    Key key,
    @required this.text,
    @required this.onTap,
    @required this.color,
    @required this.textColor,
    this.isLoading = false,
    this.isDisabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width * 0.8,
        foregroundDecoration: isDisabled
            ? BoxDecoration(
                color: Colors.grey,
                backgroundBlendMode: BlendMode.saturation,
              )
            : null,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5),
              blurRadius: 20,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 20,
          ),
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(textColor),
                  ),
                )
              : Text(
                  text,
                  style: Theme.of(context).textTheme.headline6.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                  textAlign: TextAlign.center,
                ),
        ),
      ),
    );
  }
}

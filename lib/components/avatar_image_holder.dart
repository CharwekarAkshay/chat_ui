import 'package:chat_ui/constants.dart';
import 'package:chat_ui/services/services.dart';
import 'package:flutter/material.dart';

class AvatarImageHolder extends StatelessWidget {
  AvatarImageHolder({
    Key key,
  }) : super(key: key);

  final String avatarImage = AvatarService.getRandomAvatarUrl();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration:
          BoxDecoration(color: kThemeColor, shape: BoxShape.circle, boxShadow: [
        BoxShadow(
          offset: Offset(0, 10),
          blurRadius: 50,
          color: kThemeColorDark,
        ),
      ]),
      child: Center(
        child: Image.asset(
          avatarImage,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    Key key,
    @required this.assetImage,
    this.radius = 40,
  }) : super(key: key);

  final String assetImage;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.white,
      backgroundImage: AssetImage(assetImage),
    );
  }
}
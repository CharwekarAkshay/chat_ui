import 'package:chat_ui/constants.dart';
import 'package:chat_ui/modals/user.dart';
import 'package:flutter/material.dart';

class UserDashboardScreen extends StatelessWidget {
  static const routeName = '/user-dashboard';

  @override
  Widget build(BuildContext context) {
    User user = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Row(
      ),
    );
  }
}

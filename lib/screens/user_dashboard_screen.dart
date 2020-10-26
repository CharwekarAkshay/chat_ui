import 'package:chat_ui/constants.dart';
import 'package:chat_ui/modals/user.dart';
import 'package:flutter/material.dart';
import 'package:chat_ui/components/components.dart';

import '../constants.dart';
import '../constants.dart';
import '../constants.dart';

class UserDashboardScreen extends StatelessWidget {
  static const routeName = '/user-dashboard';

  @override
  Widget build(BuildContext context) {
    User user = ModalRoute.of(context).settings.arguments;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kThemeColor,
      body: Container(
        height: size.height,
        child: Column(
          children: [
            UserWithAvatarAndGreeting(user: user),
            Container(
              height: size.height * 0.8,
              decoration: BoxDecoration(
                color: kBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50) ,
                  topRight: Radius.circular(50) ,
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
   Container(
            padding: const EdgeInsets.only(
                top: kDefaultPadding * 2,
                right: kDefaultPadding,
                left: kDefaultPadding),
            child:
          ),
 */

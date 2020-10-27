import 'package:chat_ui/constants.dart';
import 'package:chat_ui/modals/user.dart';
import 'package:flutter/material.dart';
import 'package:chat_ui/components/components.dart';

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
              padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding,
                vertical: kDefaultPadding,
              ),
              decoration: BoxDecoration(
                color: kBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 30,
                    child: Text(
                      'Chats',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,                        
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 12,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          color: Colors.green,
                          height: 70,
                          margin: const EdgeInsets.symmetric(
                              vertical: kDefaultPadding / 2),
                          child: Center(
                            child: Text('$index'),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
 
 */

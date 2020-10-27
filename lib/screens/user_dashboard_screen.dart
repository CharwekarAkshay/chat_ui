import 'package:chat_ui/constants.dart';
import 'package:chat_ui/modals/user.dart';
import 'package:chat_ui/services/avatar_service.dart';
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
                    margin: const EdgeInsets.only(
                        bottom: kDefaultPadding / 2, left: kDefaultPadding / 2),
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
                        return ChatTile();
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

class ChatTile extends StatelessWidget {
  const ChatTile({
    Key key,
  }) : super(key: key);

  String messageTrimmer(String message) {
    if (message.length > 30) {
      message = message.substring(0, 30) + '...';
    }
    return message;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO: What to do when we click on chat window
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: kDefaultPadding / 2),
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 3),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 0.3,
              color: kThemeColor.withOpacity(0.5),
            ),
          ),
        ),
        child: Row(
          children: [
            ProfileAvatar(
              assetImage: AvatarService.getRandomAvatarUrl(),
              radius: 35,
            ),
            SizedBox(width: kDefaultPadding),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Random Name',
                    style: Theme.of(context).textTheme.headline6.copyWith(
                          color: kTextColor,
                        ),
                  ),
                  SizedBox(height: kDefaultPadding / 3),
                  Text(
                    messageTrimmer('This was the last message from the user.'),
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                      color: kTextColor.withOpacity(0.5),
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

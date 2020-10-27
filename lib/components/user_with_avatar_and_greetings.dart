import 'package:chat_ui/components/components.dart';
import 'package:chat_ui/constants.dart';
import 'package:chat_ui/modals/user.dart';
import 'package:flutter/material.dart';
import 'package:chat_ui/services/services.dart';

class UserWithAvatarAndGreeting extends StatelessWidget {
  const UserWithAvatarAndGreeting({
    Key key,
    @required this.user,
  }) : super(key: key);

  final User user;

  String getGreetings() {
    var now = DateTime.now();
    if (now.hour < 12) {
      return 'Good Morning';
    } else if (now.hour < 16) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.2,
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
      ),
      child: Row(
        children: [
          ProfileAvatar(
            assetImage: AvatarService.getAvatarUrlWithId(user.avatarId),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getGreetings(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  user.userName,
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:chat_ui/components/components.dart';
import 'package:chat_ui/constants.dart';
import 'package:chat_ui/services/services.dart';
import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  final String assetImage;
  final String userName;
  final String lastMessage;
  final Function onTap;

  ChatTile({
    Key key,
    @required this.assetImage,
    @required this.userName,
    @required this.lastMessage,
    @required this.onTap,
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
      onTap: onTap,
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
              assetImage: assetImage,
              radius: 35,
            ),
            SizedBox(width: kDefaultPadding),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    userName,
                    style: Theme.of(context).textTheme.headline6.copyWith(
                          color: kTextColor,
                        ),
                  ),
                  SizedBox(height: kDefaultPadding / 3),
                  Text(
                    messageTrimmer(lastMessage),
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

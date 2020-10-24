import 'package:flutter/foundation.dart';

class User {
  String userId;
  String userName;
  String userEmail;
  String avatarId;

  // ! We can keep avatar ID option so that if we not get we can get it with AvatarService

  User({
    @required this.userId,
    @required this.userName,
    @required this.userEmail,
    this.avatarId,
  });
}

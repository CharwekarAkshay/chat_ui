import 'dart:math';

import 'package:flutter/widgets.dart';

class AvatarService {
  static int _noOfAvatarInRepository = 5;
  static final _random = new Random();

  static String getRandomAvatarUrl() {
    return 'assets/avatars/avatar_${_random.nextInt(_noOfAvatarInRepository) + 1}.png';
  }

  // Implement all the methods related to avatar
}

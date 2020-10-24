import 'dart:math';

class AvatarService {
  static int _noOfAvatarInRepository = 5;
  static final _random = new Random();

  // Implement all the methods related to avatar
  
  static String getRandomAvatarUrl() {
    return 'assets/avatars/avatar_${_random.nextInt(_noOfAvatarInRepository) + 1}.png';
  }

  static String getAvatarUrlWithId(String id) {
    return 'assets/avatars/avatar_$id.png';
  }
}

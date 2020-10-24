import 'package:chat_ui/modals/user.dart';
import 'package:chat_ui/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

class AuthenticationService {
  var uuid = Uuid();

  // * Variable to AuthenticationService
  bool _isUserLoggedIn = false;
  User _user;

  // * Implements all the methods related to user

  Future<bool> logIn(User user, String password) async {
    // * We have to authenticate user with backend.
    // * We have to authenticate wiwht passwordManager
    // * After successful authentication we have to retrive complete userdata;
    // * after this we will be retrun complete user

    // ! On error we will be rreturning null so that we can show the error to the user;
    try {
      TemproryDatabase.passwordManager.singleWhere(
        (element) {
          if (element['userId'] == user.userId &&
              element['password'] == password) {
            return true;
          }
          return false;
        },
      );
    } catch (error) {
      throw error;
    }
  }

  Future<User> signUp(
    String userName,
    String userEmail,
    String password,
    String avatarId,
  ) async {
    User newUser = new User(
      userId: uuid.v1(),
      userName: userName,
      userEmail: userEmail,
      avatarId: avatarId,
    );

    // * We have to add the following details to firebase backend
    // * On success signup we will set user as newUser and we will make isUserLoggedIn in flag up
    // * @retrun User  if null error has occured;
    TemproryDatabase.users.add(newUser);
    TemproryDatabase.passwordManager.add({
      'userId': newUser.userId,
      'password': password,
    });

    // ! We are shortciructing data base storage we are directly assigining newUser
    this._user = newUser;
    this._isUserLoggedIn = true;

    return newUser;
  }

  Future<User> getUserByUserEmail(String userEmail) async {
    User user;
    try {
      user = TemproryDatabase.users
          .singleWhere((user) => user.userEmail == userEmail);
    } catch (error) {
      throw error;
    }
    return user;
  }

  User get user {
    return user;
  }

  bool get isUserLoggedIn {
    return _isUserLoggedIn;
  }
}

class TemproryDatabase {
  static List<User> users = [
    new User(
      userId: Uuid().v1(),
      userName: 'AksahyCharwekar',
      userEmail: 'akshay_charwekar@gmail.com',
    ),
    new User(
      userId: Uuid().v1(),
      userName: 'NinadCharwekar',
      userEmail: 'ninad_charwekar@gmail.com',
    ),
  ];

  // * This will be automatically managed with Google Clout Authentication
  static var passwordManager = [
    {'userId': users[0].userId, 'password': 'test@12345'},
    {'userId': users[1].userId, 'password': 'test@12345'}
  ];
}

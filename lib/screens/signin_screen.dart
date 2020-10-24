import 'package:chat_ui/components/components.dart';
import 'package:chat_ui/constants.dart';
import 'package:chat_ui/screens/signup_screen.dart';
import 'package:chat_ui/services/services.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = '/signin';

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // Form Key

  Key formKey = GlobalKey<FormState>();

  // TextField Cotnrollers
  TextEditingController _emailTextEditingController =
      new TextEditingController();
  TextEditingController _passwordTextEditingController =
      new TextEditingController();

  // Focus Nodes
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  AuthenticationService authenticationService = new AuthenticationService();

  _signInUser() {
    var userEmail = _emailTextEditingController.text.trim();
    var password = _passwordTextEditingController.text.trim();

    authenticationService.getUserByUserEmail(userEmail).then(
      (user) {
        authenticationService.logIn(user, password).then(
          (value) {
            print('Verified User');
          },
        ).catchError(
          (error) {
            // ! Show snackbar;
            print('Incorrect password');
          },
        );
      },
    ).catchError(
      (error) {
        // ! Show snackbar;
        print('No such user exist');
      },
    );
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: kBackgroundColor,
          padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
            vertical: kDefaultPadding * 2,
          ),
          child: Column(
            children: [
              AvatarImageHolder(),
              SizedBox(height: kDefaultPadding * 2),
              Container(
                constraints: BoxConstraints(minHeight: size.height * 0.6),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: kDefaultPadding,
                          ),
                          CustomTextFormField(
                            hintText: 'Email',
                            controller: _emailTextEditingController,
                            focusNode: _emailFocusNode,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_passwordFocusNode);
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter email';
                              } else if (!RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                                return 'Please enter valid email address';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: kDefaultPadding,
                          ),
                          CustomTextFormField(
                            hintText: 'Password',
                            controller: _passwordTextEditingController,
                            focusNode: _passwordFocusNode,
                            textInputAction: TextInputAction.send,
                            onFieldSubmitted: (_) {
                              _signInUser();
                            },
                            validator: (value) {
                              if (value.length < 6) {
                                return 'Password cannot be less then 6 character ';
                              }
                              return null;
                            },
                            obscureText: true,
                          ),
                          SizedBox(height: kDefaultPadding),
                          LargeButton(
                            color: kThemeColor,
                            onTap: _signInUser,
                            text: 'Sign In',
                            textColor: Colors.white,
                          ),
                          SizedBox(height: kDefaultPadding * 2),
                        ],
                      ),
                      Column(
                        children: [
                          LargeButton(
                            color: Colors.white,
                            textColor: kThemeColor,
                            onTap: () {},
                            text: 'Sign In with Google',
                          ),
                          SizedBox(height: kDefaultPadding * 2),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have account? ",
                                style: TextStyle(
                                  color: kThemeColorDark,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    SignUpScreen.routeName,
                                    (route) => false,
                                  );
                                },
                                child: Text(
                                  "SignUp now",
                                  style: TextStyle(
                                    color: kThemeColorDark,
                                    fontSize: 19,
                                    decoration: TextDecoration.underline,
                                    decorationThickness: 2,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: kDefaultPadding * 2),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

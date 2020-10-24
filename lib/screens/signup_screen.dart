import 'package:chat_ui/components/components.dart';
import 'package:chat_ui/components/large_button.dart';
import 'package:chat_ui/constants.dart';
import 'package:chat_ui/screens/screens.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/signup';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // Form Key

  Key formKey = GlobalKey<FormState>();

  // TextField Cotnrollers
  TextEditingController _userNameTextEditingController =
      new TextEditingController();
  TextEditingController _emailTextEditingController =
      new TextEditingController();
  TextEditingController _passwordTextEditingController =
      new TextEditingController();

  // Focus Nodes
  FocusNode _userNameFocusNode = FocusNode();
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _userNameFocusNode.dispose();
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
                          CustomTextFormField(
                            hintText: 'Username',
                            controller: _userNameTextEditingController,
                            focusNode: _userNameFocusNode,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_emailFocusNode);
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter username';
                              } else if (value.length < 3) {
                                return 'Username cannot be less than 3 character';
                              }
                              return null;
                            },
                          ),
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
                              //TODO: Actual logic of sign in
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
                            onTap: () {},
                            text: 'Sign Up',
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
                            text: 'Sign Up with Google',
                          ),
                          SizedBox(height: kDefaultPadding),
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
                                    SignInScreen.routeName,
                                    (route) => false,
                                  );
                                },
                                child: Text(
                                  "SignIn now",
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

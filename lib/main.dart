import 'package:chat_ui/screens/screens.dart';
import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatApp UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WelcomeScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        WelcomeScreen.routeName: (context) => WelcomeScreen(),
        SignInScreen.routeName: (context) => SignInScreen(),
        SignUpScreen.routeName: (context) => SignUpScreen(),
        UserDashboardScreen.routeName: (context) => UserDashboardScreen(),
        SearchUserScreen.routeName: (context) => SearchUserScreen(),
      },
    );
  }
}

import 'package:chat_ui/components/components.dart';
import 'package:chat_ui/constants.dart';
import 'package:chat_ui/screens/screens.dart';
import 'package:chat_ui/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WelcomeScreen extends StatelessWidget {
  static const routeName = '/welcome';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kThemeColor,
      body: WelcomeScreenBody(),
    );
  }
}

class WelcomeScreenBody extends StatefulWidget {
  const WelcomeScreenBody({
    Key key,
  }) : super(key: key);

  @override
  _WelcomeScreenBodyState createState() => _WelcomeScreenBodyState();
}

class _WelcomeScreenBodyState extends State<WelcomeScreenBody> {
  InternetConnectivityService internetConnectivityService =
      InternetConnectivityService();

  @override
  initState() {
    internetConnectivityService.initInterNetConnectivitySubscription(context);
    super.initState();
  }

  @override
  dispose() {
    internetConnectivityService.disposeSubscription();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 10),
                  color: Colors.white.withOpacity(0.3),
                  blurRadius: 50,
                ),
              ],
            ),
            child: SvgPicture.asset(
              'assets/images/welcome_illustration.svg',
              alignment: Alignment.center,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
            child: RichText(
              softWrap: true,
              text: TextSpan(
                text:
                    'A world without communication is meaningless. So, you have to message every one now!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                  wordSpacing: 2.0,
                ),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          LargeButton(
            text: 'Get Started',
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                SignUpScreen.routeName,
                (route) => true,
              );
            },
            color: Colors.white,
            textColor: Colors.black,
          )
        ],
      ),
    );
  }
}

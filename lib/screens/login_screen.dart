import 'package:flutter/material.dart';
import 'package:sac_app/animations/slide_fade_anim.dart';
import 'package:sac_app/provider/signin.dart';
import 'package:sac_app/screens/main_screen.dart';
import 'package:sac_app/widgets/themable_image.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sac_app/provider/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const id = 'login_screen';
  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  bool isShown = false;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double width = screenWidth < 540 ? screenWidth : 540;
    double height = screenHeight;

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Stack(
            children: [
              // Logo and Title
              SizedBox(
                width: width,
                height: height,
              ),
              Positioned(
                top: height * 0.05,
                left: width * 0.3,
                width: width * 0.4,
                height: height * 0.4,
                child: const DelayedFadeAnimation(
                  delay: 100,
                  child: ThemableImage(
                    lightModeImagePath: lightLogoPath,
                    darkModeImagePath: darkLogoPath,
                  ),
                ),
              ),

              Positioned(
                top: height * 0.4,
                left: width * 0.15,
                height: height * 0.2,
                width: width * 0.7,
                child: const DelayedFadeAnimation(
                  delay: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      FittedBox(
                        fit: BoxFit.cover,
                        child: Text(
                          sac,
                          style: TextStyle(color: primaryColor),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.cover,
                        child: Text(iitPKD),
                      )
                    ],
                  ),
                ),
              ),
              // Back Button
              Positioned(
                top: 10,
                right: 10,
                child: AnimatedOpacity(
                  opacity: isShown ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 550),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        isShown = !isShown;
                      });
                    },
                    icon: const Icon(Icons.arrow_back_ios_rounded),
                  ),
                ),
              ),
              // Login
              AnimatedPositioned(
                duration: const Duration(milliseconds: 550),
                curve: Curves.easeInOut,
                bottom: isShown ? height * 0.4 : height * 0.2,
                left: width * 0.3,
                width: width * 0.4,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 550),
                  opacity: isShown ? 0.0 : 1.0,
                  child: DelayedFadeAnimation(
                      delay: 200,
                      child: OutlinedButton(
                        child: const Text(signInText),
                        onPressed: () {
                          setState(() {
                            isShown = !isShown;
                          });
                        },
                      )),
                ),
              ),
              AnimatedPositioned(
                left: width * 0.15,
                bottom: isShown ? height * 0.15 : -height * 0.2,
                duration: const Duration(milliseconds: 550),
                curve: Curves.easeOut,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 550),
                  opacity: isShown ? 1.0 : 0.0,
                  child: logInBtns(width * 0.7),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget logInBtns(double width) {
    return SizedBox(
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          OutlinedButton.icon(
            onPressed: () {
              signIn(context);
            },
            icon: Image.asset(
              googleImagePath,
              height: 20,
            ),
            label: const Text(googleSignIn),
          ),
          const SizedBox(height: 10),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.account_circle_rounded),
            label: const Text(guestSignIn),
          ),
        ],
      ),
    );
  }

  Future signIn(BuildContext context) async {
    final user = await GoogleSignInApi.login();
    if (user == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Not able to login')));
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('user_name', user.displayName ?? '');
      await prefs.setString('user_email', user.email);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
    }
  }
}

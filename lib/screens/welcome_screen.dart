import 'dart:developer';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:petzarus/screens/signin_screen.dart';
import 'package:petzarus/screens/signup_screen.dart';
import 'package:petzarus/widgets/rounded_button.dart';
import 'package:petzarus/widgets/screen_wrapper.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pageController = PageController();
  double _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    _pageController.addListener(
      () => setState(() {
        _currentPageIndex = _pageController.page ?? 0.0;
      }),
    );
    return ScreenWrapper(
      backgroundColor: const Color(0xff131621),
      resizeToAvoidBottomInset: true,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: PageView(
              controller: _pageController,
              children: const [
                WelcomePage(
                  title: 'No Bots, No Spam, No Clickbait',
                  description: 'Experience a community built for real Humans and their Pets.',
                  image: 'assets/images/illustration_1.png',
                ),
                WelcomePage(
                  title: 'Learn, Share & Collaborate',
                  description: 'A Pet Community where everyone is heard and every opinion matters.',
                  image: 'assets/images/illustration_2.png',
                ),
                WelcomePage(
                  title: 'Build Your Neighbourhood',
                  description: 'Share your experience, ask for opinions, help a Pet friend.',
                  image: 'assets/images/illustration_3.png',
                ),
                WelcomePage(
                  title: 'Campaign for a Cause',
                  description: 'Collaborate with compassionate Pet lovers to make a difference.',
                  image: 'assets/images/illustration_4.png',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: DotsIndicator(
              dotsCount: 4,
              position: _currentPageIndex,
              onTap: (dot) {
                _pageController.animateToPage(
                  dot.toInt(),
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.decelerate,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, top: 32.0, right: 32.0, left: 32.0),
            child: RoundedButton(
              borderRadius: 16.0,
              padding: const EdgeInsets.fromLTRB(20.0, 17.0, 20.0, 20.0),
              color: Theme.of(context).primaryColor,
              text: const Text(
                'Sign in',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SigninScreen(),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 32.0, left: 32.0, bottom: 32.0),
            child: RoundedButton(
              borderRadius: 16.0,
              padding: const EdgeInsets.fromLTRB(20.0, 17.0, 20.0, 20.0),
              color: const Color(0xff131621),
              text: Text(
                'Sign up',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 16.0,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignupScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  const WelcomePage({Key? key, required this.title, required this.description, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                image,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 24.0, 0.0, 16.0),
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32.0,
                ),
              ),
            ),
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 15.0,
            ),
          ),
        ],
      ),
    );
  }
}

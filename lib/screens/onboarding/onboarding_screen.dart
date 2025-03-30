import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart' as rive;
import 'package:rive_animation/screens/components/animated_btn.dart';
import 'package:rive_animation/screens/components/sign_in_form.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late rive.RiveAnimationController _btnAnimation;
  @override
  void initState() {
    _btnAnimation = rive.OneShotAnimation('active', autoplay: false);

  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 200,
            left: 100,
            width: MediaQuery.of(context).size.width * 1.7,
            child: Image.asset('assets/Backgrounds/Spline.png'),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            ),
          ),
          const rive.RiveAnimation.asset('assets/RiveAssets/shapes.riv'),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
              child: const SizedBox(),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  SizedBox(
                    width: 260,
                    child: Column(
                      children: [
                        const SizedBox(height: 50),
                        const Text(
                          'Learn design & code',
                          style: TextStyle(
                            fontSize: 60,
                            fontFamily: 'Poppins',
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Don\'t skip design, learn design & code by building beautiful Mobile apps and developing it so you make your understand for the work will be more stronger and have a good experience in the tech.',
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .25,
                        ),
                        AnimatedBtn(
                          btnAnimation: _btnAnimation,
                          press: () {
                            _btnAnimation.isActive = true;
                            showGeneralDialog(
                              barrierDismissible: true,
                              barrierLabel: "Sign In",
                              context: context,
                              pageBuilder: (context, _, _) {
                                return Center(
                                  child: Center(
                                    child: Container(
                                      height: 620,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                      ),
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.94),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(16),
                                        ),
                                      ),
                                      child: const Scaffold(
                                        backgroundColor: Colors.transparent,
                                        body: Column(
                                          children: [
                                            Text(
                                              'Sign In',
                                              style: TextStyle(
                                                fontSize: 34,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Poppins',
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 16,
                                              ),
                                              child: Text(
                                                'Access to 240+ hours of content. Learn design and code, by building real apps with flutter and swift',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            SizedBox(height: 30),
                                            SignInForm(),
                                            Row(
                                              children: [
                                                Expanded(child: Divider()),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 12,
                                                  ),
                                                  child: Text(
                                                    'OR',
                                                    style: TextStyle(
                                                      color: Colors.black26,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(child: Divider()),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 20,
                                              ),
                                              child: Text(
                                                'Sign Up with Email, Apple or Google.',
                                                style: TextStyle(
                                                  color: Colors.black54
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 24),
                          child: Text(
                            'Purchase includes 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certifications.',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

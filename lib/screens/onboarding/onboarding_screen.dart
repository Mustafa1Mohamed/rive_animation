import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive/rive.dart' as rive;
import 'package:rive_animation/screens/components/animated_btn.dart';
import 'package:rive_animation/screens/components/custom_signin_dialog.dart';
import 'package:rive_animation/screens/components/sign_in_form.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool isSignInDialogShow = false;
  late rive.RiveAnimationController _btnAnimation;
  @override
  void initState() {
    _btnAnimation = rive.OneShotAnimation('active', autoplay: false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
          AnimatedPositioned(
            top: isSignInDialogShow ? -50 : 0,
            duration: const Duration(milliseconds: 240),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,

            child: SafeArea(
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
                              Future.delayed(
                                const Duration(milliseconds: 800),
                                () {
                                  setState(() {
                                    isSignInDialogShow = true;
                                  });
                                  customSignInDialog(
                                    context,
                                    onClose: (_) {
                                      setState(() {
                                        isSignInDialogShow = false;
                                      });
                                    },
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
          ),
        ],
      ),
    );
  }
}

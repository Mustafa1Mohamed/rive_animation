import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive_animation/screens/components/sign_in_form.dart';

Future<Object?> customSignInDialog(
  BuildContext context, {
  required ValueChanged onClose,
}) {
  return showGeneralDialog(
    barrierDismissible: true,
    barrierLabel: "Sign In",
    transitionDuration: const Duration(milliseconds: 400),
    transitionBuilder: (_, animation, _, child) {
      Tween<Offset> tween;
      tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
      return SlideTransition(
        position: tween.animate(
          CurvedAnimation(parent: animation, curve: Curves.easeInOut),
        ),
        child: child,
      );
    },
    context: context,
    pageBuilder: (context, _, _) {
      return Center(
        child: Center(
          child: Container(
            height: 620,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              // ignore: deprecated_member_use
              color: Colors.white.withOpacity(0.94),
              borderRadius: const BorderRadius.all(Radius.circular(16)),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                clipBehavior: Clip.none,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Column(
                      children: [
                        const Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'Access to 240+ hours of content. Learn design and code, by building real apps with flutter and swift',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 30),
                        const SignInForm(),
                        const Row(
                          children: [
                            Expanded(child: Divider()),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Text(
                                'OR',
                                style: TextStyle(color: Colors.black26),
                              ),
                            ),
                            Expanded(child: Divider()),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            'Sign Up with Email, Apple or Google.',
                            style: TextStyle(color: Colors.black54),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                'assets/icons/email_box.svg',
                                height: 64,
                                width: 64,
                              ),
                            ),
                            IconButton(
                              padding: EdgeInsets.zero,

                              onPressed: () {},
                              icon: SvgPicture.asset(
                                'assets/icons/google_box.svg',
                                height: 64,
                                width: 64,
                              ),
                            ),
                            IconButton(
                              padding: EdgeInsets.zero,

                              onPressed: () {},
                              icon: SvgPicture.asset(
                                'assets/icons/apple_box.svg',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: -MediaQuery.of(context).size.height * .04,
                      left: 0,
                      right: 0,

                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 16,
                        child: Icon(Icons.close, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  ).then(onClose);
}

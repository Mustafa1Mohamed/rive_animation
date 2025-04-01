import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/screens/entry_point.dart';
import 'package:rive_animation/utils/rive_utils.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late SMITrigger error, check, reset, confetti;
  bool isShownDialog = false, isShownConfetti = false;
 

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Email', style: TextStyle(color: Colors.black54)),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "";
                    }
                    return null;
                  },
                  onSaved: (email) {},
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: SvgPicture.asset('assets/icons/email.svg'),
                    ),
                  ),
                ),
              ),
              const Text('Password', style: TextStyle(color: Colors.black54)),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "";
                    }
                    return null;
                  },
                  onSaved: (password) {},
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: SvgPicture.asset('assets/icons/password.svg'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 24),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF77D8E),
                    minimumSize: const Size(double.infinity, 56),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                  ),
                  icon: const Icon(
                    CupertinoIcons.arrow_right,
                    color: Color(0xFFFE0037),
                  ),
                  onPressed: () {
                    signIn(context);
                  },
                  label: const Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        isShownDialog
            ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 220,
                  width: 100,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: RiveAnimation.asset(
                          'assets/RiveAssets/check.riv',
                          onInit: (artboard) {
                            StateMachineController controller =
                               RiveUtils.getRiveController(artboard);
                            check = controller.findSMI('Check') as SMITrigger;
                            error = controller.findSMI('Error') as SMITrigger;
                            reset = controller.findSMI('Reset') as SMITrigger;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
            : const SizedBox(),
        isShownConfetti
            ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 220,
                  width: 100,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Transform.scale(
                          scale: 7,
                          child: RiveAnimation.asset(
                            'assets/RiveAssets/confetti.riv',
                            onInit: (artboard) {
                              StateMachineController controller =
                                 RiveUtils.getRiveController(artboard);
                              confetti =
                                  controller.findSMI('Trigger explosion')
                                      as SMITrigger;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
            : const SizedBox(),
      ],
    );
  }

  void signIn(BuildContext context) {
    setState(() {
      isShownDialog = true;
      isShownConfetti = true;
    });
    Future.delayed(const Duration(seconds: 1), () {
      if (_formKey.currentState!.validate()) {
        check.fire();
        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            isShownDialog = false;
          });
          confetti.fire();
          Future.delayed(const Duration(seconds: 1), () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const EntryPoint()),
            );
          });
        });
      } else {
        error.fire();
        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            isShownDialog = false;
          });
        });
      }
    });
  }
}

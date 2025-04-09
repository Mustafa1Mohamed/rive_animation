import 'package:flutter/cupertino.dart';
import 'package:rive/rive.dart' as rive;

class AnimatedBtn extends StatelessWidget {
  const AnimatedBtn({
    super.key,
    required rive.RiveAnimationController btnAnimation,
    required this.press,
  }) : _btnAnimation = btnAnimation;

  final rive.RiveAnimationController _btnAnimation;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        height: 64,
        width: 260,
        child: Stack(
          children: [
            rive.RiveAnimation.asset(
              'assets/RiveAssets/button.riv',
              controllers: [_btnAnimation],
            ),
            const Positioned.fill(
              top: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.arrow_right),
                  SizedBox(width: 8),
                  Text(
                    'Start the course',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

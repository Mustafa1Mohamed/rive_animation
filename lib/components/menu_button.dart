import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({super.key, required this.press, required this.onInit});
  final VoidCallback press;
  final ValueChanged<Artboard> onInit;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: press,
        child: Container(
          margin: const EdgeInsets.only(left: 16),
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: RiveAnimation.asset(
            'assets/RiveAssets/menu_button.riv',
            onInit: onInit,
          ),
        ),
      ),
    );
  }
}

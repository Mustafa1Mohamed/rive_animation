import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/models/rive_asset.dart';

class SideMenueTitle extends StatefulWidget {
  const SideMenueTitle({
    super.key,
    required this.menue,
    required this.onTap,
    required this.onInit,
    required this.isActive,
  });
  final RiveAsset menue;
  final VoidCallback onTap;
  final ValueChanged<Artboard> onInit;
  final bool isActive;

  @override
  State<SideMenueTitle> createState() => _SideMenueTitleState();
}

class _SideMenueTitleState extends State<SideMenueTitle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24.0),
          child: Divider(color: Colors.white24, height: 1, thickness: 1),
        ),
        Stack(
          children: [
            Builder(
              builder: (context) {
                return AnimatedPositioned(
                  curve: Curves.fastOutSlowIn,
                  duration: const Duration(milliseconds: 300),
                  height: 56,
                  width: widget.isActive ? 288 : 0,
                  left: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF6792FF),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                );
              },
            ),
            ListTile(
              onTap: widget.onTap,
              title: Text(
                widget.menue.title,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              leading: SizedBox(
                width: 34,
                height: 34,

                child: RiveAnimation.asset(
                  widget.menue.src,
                  artboard: widget.menue.artboard,
                  onInit: widget.onInit,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

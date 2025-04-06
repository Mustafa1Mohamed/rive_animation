import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/components/animated_bar.dart';
import 'package:rive_animation/components/menu_button.dart';
import 'package:rive_animation/components/side_menue.dart';
import 'package:rive_animation/constants.dart';
import 'package:rive_animation/models/rive_asset.dart';
import 'package:rive_animation/screens/home/home_view.dart';
import 'package:rive_animation/utils/rive_utils.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  late SMIBool isSideBarClosed;
  RiveAsset selectedButtomNavs = bottomNavs.first;
  bool isSideMenuClosed = true;
  late AnimationController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor2,
      resizeToAvoidBottomInset: false,
      extendBody: true,
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: backgroundColor2.withOpacity(.8),
            borderRadius: const BorderRadius.all(Radius.circular(24)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(
                bottomNavs.length,
                (index) => GestureDetector(
                  onTap: () {
                    bottomNavs[index].input!.change(true);
                    if (bottomNavs[index] != selectedButtomNavs) {
                      setState(() {
                        selectedButtomNavs = bottomNavs[index];
                      });
                    }
                    Future.delayed(const Duration(seconds: 1), () {
                      bottomNavs[index].input!.change(false);
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedBar(
                        isActive: bottomNavs[index] == selectedButtomNavs,
                      ),
                      SizedBox(
                        height: 36,
                        width: 36,
                        child: Opacity(
                          opacity:
                              bottomNavs[index] == selectedButtomNavs ? 1 : 0.5,
                          child: RiveAnimation.asset(
                            bottomNavs.first.src,
                            artboard: bottomNavs[index].artboard,
                            onInit: (artboard) {
                              StateMachineController controller =
                                  RiveUtils.getRiveController(
                                    artboard,
                                    stateMachine: bottomNavs[index].statMachine,
                                  );
                              bottomNavs[index].input =
                                  controller.findSMI('active') as SMIBool;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            left: isSideMenuClosed?-288:0,
            width: 288,
            height: MediaQuery.of(context).size.height,
            child: const SideMenue(),
          ),
          Transform.translate(
            offset: Offset(isSideMenuClosed ? 0 : 288, 0),
            child: Transform.scale(
              scale: isSideMenuClosed ? 1 : 0.8,
              child: const ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(24)),
                child: HomeView(),
              ),
            ),
          ),
          MenuButton(
            press: () {
              isSideBarClosed.value = !isSideBarClosed.value;
              setState(() {
                isSideMenuClosed = !isSideMenuClosed;
              });
            },
            onInit: (artboard) {
              StateMachineController controller = RiveUtils.getRiveController(
                artboard,
                stateMachine: 'State Machine',
              );
              isSideBarClosed = controller.findSMI('isOpen') as SMIBool;
              isSideBarClosed.value = true;
              // iconTrigger = controller.findSMI('active') as SMIBool;
            },
          ),
        ],
      ),
    );
  }
}

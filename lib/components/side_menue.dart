import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/components/info_card.dart';
import 'package:rive_animation/components/side_menue_title.dart';
import 'package:rive_animation/models/rive_asset.dart';
import 'package:rive_animation/utils/rive_utils.dart';

class SideMenue extends StatefulWidget {
  const SideMenue({super.key});

  @override
  State<SideMenue> createState() => _SideMenueState();
}

class _SideMenueState extends State<SideMenue> {
  RiveAsset selectdMenu = sideMenu.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
        color: const Color(0xFF17203A),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const InfoCard(name: 'Abu Anwar', profession: 'YouTuber'),
              Padding(
                padding: const EdgeInsets.only(left: 24.0, top: 32, bottom: 16),
                child: Text(
                  'Browse',
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium!.copyWith(color: Colors.white70),
                ),
              ),
              ...sideMenu.map(
                (item) => SideMenueTitle(
                  menue: item,
                  onInit: (artboard) {
                    StateMachineController controller =
                        RiveUtils.getRiveController(
                          artboard,
                          stateMachine: item.statMachine,
                        );
                    item.input = controller.findSMI('active') as SMIBool;
                  },
                  onTap: () {
                    item.input!.change(true);
                    Future.delayed(const Duration(seconds: 1), () {
                      item.input!.change(false);
                    });
                    setState(() {
                      selectdMenu = item;
                    });
                  },
                  isActive: selectdMenu == item,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0, top: 32, bottom: 16),
                child: Text(
                  'History',
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium!.copyWith(color: Colors.white70),
                ),
              ),
              ...sideMenu2.map(
                (item) => SideMenueTitle(
                  menue: item,
                  onInit: (artboard) {
                    StateMachineController controller =
                        RiveUtils.getRiveController(
                          artboard,
                          stateMachine: item.statMachine,
                        );
                    item.input = controller.findSMI('active') as SMIBool;
                  },
                  onTap: () {
                    item.input!.change(true);
                    Future.delayed(const Duration(seconds: 1), () {
                      item.input!.change(false);
                    });
                    setState(() {
                      selectdMenu = item;
                    });
                  },
                  isActive: selectdMenu == item,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

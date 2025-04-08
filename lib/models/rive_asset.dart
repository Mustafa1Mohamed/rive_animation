import 'package:rive/rive.dart';

class RiveAsset {
  String artboard, statMachine, title, src;
  late SMIBool? input;
  RiveAsset(
    this.src, {
    required this.artboard,
    required this.statMachine,
    required this.title,
    this.input,
  });
  set setInput(SMIBool status) {
    input = status;
  }
}

List<RiveAsset> bottomNavs = [
  RiveAsset(
    'assets/RiveAssets/icons.riv',
    artboard: 'CHAT',
    statMachine: 'CHAT_Interactivity',
    title: 'Chat',
  ),
  RiveAsset(
    'assets/RiveAssets/icons.riv',
    artboard: 'SEARCH',
    statMachine: 'SEARCH_Interactivity',
    title: 'Search',
  ),

  RiveAsset(
    'assets/RiveAssets/icons.riv',
    artboard: 'TIMER',
    statMachine: 'TIMER_Interactivity',
    title: 'Timer',
  ),
  RiveAsset(
    'assets/RiveAssets/icons.riv',
    artboard: 'BELL',
    statMachine: 'BELL_Interactivity',
    title: 'Notifications',
  ),
  RiveAsset(
    'assets/RiveAssets/icons.riv',
    artboard: 'USER',
    statMachine: 'USER_Interactivity',
    title: 'Profile',
  ),
];
//Side Menue
List<RiveAsset> sideMenu = [
  RiveAsset(
    'assets/RiveAssets/icons.riv',
    artboard: "SETTINGS",
    statMachine: "SETTINGS_Interactivity",
    title: "Settings",
  ),
  RiveAsset(
    'assets/RiveAssets/icons.riv',
    artboard: 'SEARCH',
    statMachine: 'SEARCH_Interactivity',
    title: 'Search',
  ),
  RiveAsset(
    'assets/RiveAssets/icons.riv',
    artboard: 'LIKE/STAR',
    statMachine: 'STAR_Interactivity',
    title: 'Favourites',
  ),
  RiveAsset(
    'assets/RiveAssets/icons.riv',
    artboard: 'CHAT',
    statMachine: 'CHAT_Interactivity',
    title: 'Help',
  ),
];
List<RiveAsset>sideMenu2 = [
  RiveAsset(
    'assets/RiveAssets/icons.riv',
    artboard: "TIMER",
    statMachine: "TIMER_Interactivity",
    title: "History",
  ),
  RiveAsset(
    'assets/RiveAssets/icons.riv',
    artboard: 'BELL',
    statMachine: 'BELL_Interactivity',
    title: 'Notifications',
  ),
];
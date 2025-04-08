import 'dart:ui';

class Course {
  final String title, description, iconSrc;
  final Color bgColor;

  Course({
    required this.title,
    this.description = 'Build and animate an IOS apps from scratch',
    this.iconSrc = 'assets/icons/apple_box.svg',
    this.bgColor = const Color(0xff7553f6),
  });
}

List<Course> courses = [
  Course(title: 'Animation in SwiftUI'),
  Course(
    title: 'Animation in Flutter',
    iconSrc: 'assets/icons/ios.svg',
    bgColor: const Color(0xff80A4FF),
  ),
  Course(title: 'Animation in SwiftUI'),
  Course(
    title: 'Animation in Flutter',
    iconSrc: 'assets/icons/ios.svg',
    bgColor: const Color(0xff80A4FF),
  ),
  Course(title: 'Animation in SwiftUI'),
  Course(
    title: 'Animation in Flutter',
    iconSrc: 'assets/icons/ios.svg',
    bgColor: const Color(0xff80A4FF),
  ),
  Course(title: 'Animation in SwiftUI'),
  Course(
    title: 'Animation in Flutter',
    iconSrc: 'assets/icons/ios.svg',
    bgColor: const Color(0xff80A4FF),
  ),
];
List<Course> recentCourses = [
  Course(title: 'State Machine'),
  Course(
    title: 'Animated Menu',
    iconSrc: 'assets/icons/apple_box.svg',
    bgColor: const Color(0xff9CC5ff),
  ),
  Course(
    title: 'Animated Menu',
    iconSrc: 'assets/icons/apple_box.svg',
    bgColor: const Color(0xff9CC5ff),
  ),
  Course(
    title: 'Animated Menu',
    iconSrc: 'assets/icons/apple_box.svg',
    bgColor: const Color(0xff9CC5ff),
  ),
  Course(
    title: 'Animated Menu',
    iconSrc: 'assets/icons/apple_box.svg',
    bgColor: const Color(0xff9CC5ff),
  ),
  Course(
    title: 'Animated Menu',
    iconSrc: 'assets/icons/apple_box.svg',
    bgColor: const Color(0xff9CC5ff),
  ),
  Course(
    title: 'Animated Menu',
    iconSrc: 'assets/icons/apple_box.svg',
    bgColor: const Color(0xff9CC5ff),
  ),
  Course(
    title: 'Animated Menu',
    iconSrc: 'assets/icons/ios.svg',
    bgColor: const Color(0xff9CC5ff),
  ),
  Course(
    title: 'Animation in Flutter',
    iconSrc: 'assets/icons/ios.svg',
    bgColor: const Color(0xff9CC5ff),
  ),
];

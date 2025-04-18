import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive_animation/models/course_model.dart';
import 'package:rive_animation/screens/home/components/course_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Courses',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...courses.map(
                      (course) => Padding(
                        padding: const EdgeInsets.only(left: 18),
                        child: CourseCard(course: course),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Recent',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ...recentCourses.map(
                (course) => Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: 20,
                  ),
                  child: RecentCourseCard(course: course),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecentCourseCard extends StatelessWidget {
  const RecentCourseCard({super.key, required this.course});
  final Course course;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        color: course.bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  course.title,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Text(
                  'Watch video - 15 mins',
                  style: TextStyle(color: Colors.white60, fontSize: 16),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40, child: VerticalDivider()),
          const SizedBox(width: 8),
          SvgPicture.asset('assets/icons/ios.svg'),
        ],
      ),
    );
  }
}

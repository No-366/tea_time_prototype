import 'package:app/screen/home_screen.dart';
import 'package:app/screen/make_survey_screen.dart';
import 'package:app/screen/mypage.dart';
import 'package:app/screen/survey_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;

  const BottomNavBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'My Page',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.poll),
          label: 'Survey',
        ),
      ],
      currentIndex: currentIndex,
      onTap: (index) {
        if (index == currentIndex) return;

        Widget page;
        switch (index) {
          case 0:
            page = const MyPageScreen();
            break;
          case 1:
            page = const HomeScreen();
            break;
          case 2:
          default:
            page = const MakeSurveyScreen();
            break;
        }

        //final bool goingRight = index > currentIndex;

        // Navigator.pushReplacement(
        //   context,
        //   PageRouteBuilder(
        //     pageBuilder: (context, animation, secondaryAnimation) => page,
        //     transitionsBuilder:
        //         (context, animation, secondaryAnimation, child) {
        //       final begin = Offset(goingRight ? 1.0 : -1.0, 0.0);
        //       const end = Offset.zero;
        //       const curve = Curves.easeInOut;

        //       final tween =
        //           Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        //       final offsetAnimation = animation.drive(tween);

        //       return SlideTransition(
        //         position: offsetAnimation,
        //         child: child,
        //       );
        //     },
        //   ),
        // );
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => page,
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        );
      },
    );
  }
}

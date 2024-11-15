import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class AppNavigator {
  static goToPage({
    required BuildContext context,
    required Widget screen,
    PageTransitionType type = PageTransitionType.rightToLeft, // Set default type
  }) {
    return Navigator.push(
      context,
      PageTransition(
        duration: const Duration(milliseconds: 500),
        type: type,
        child: screen,
      ),
    );
  }

  static goToPageWithReplacement({
    required BuildContext context,
    required Widget screen,
    PageTransitionType type = PageTransitionType.rightToLeft, // Set default type
  }) {
    return Navigator.pushReplacement(
      context,
      PageTransition(
        duration: const Duration(milliseconds: 500),
        type: type,
        child: screen,
      ),
    );
  }

  static void goToPageWithReplacementAll({
    required BuildContext context,
    required Widget screen,
    PageTransitionType? type, // Optional type, default to MaterialPageRoute if not provided
  }) {
    if (type != null) {
      Navigator.pushAndRemoveUntil(
        context,
        PageTransition(
          duration: const Duration(milliseconds: 500),
          type: type,
          child: screen,
        ),
            (route) => false,
      );
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => screen),
            (route) => false,
      );
    }
  }
}

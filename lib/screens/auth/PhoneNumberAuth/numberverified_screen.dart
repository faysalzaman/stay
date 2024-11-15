import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stay/screens/home/home_screen.dart';
import 'package:stay/utils/app_colors.dart';
import 'package:stay/utils/app_navigator.dart';
import 'package:stay/widgets/text_widget.dart';
import 'package:easy_localization/easy_localization.dart';

class NumberVerifiedScreen extends StatefulWidget {
  const NumberVerifiedScreen({super.key});

  @override
  State<NumberVerifiedScreen> createState() => _NumberVerifiedScreenState();
}

class _NumberVerifiedScreenState extends State<NumberVerifiedScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      AppNavigator.pushReplacement(context, const HomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onboardingbgcolor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              repeat: false,
              'assets/lottie/verified.json',
              fit: BoxFit.contain,
              height: 300,
            ),
            SizedBox(
              height: 30,
            ),
            AppText.heading("otp_verification".tr()),
            SizedBox(
              height: 20,
            ),
            AppText.subHeading("enter_code_sms".tr(),
                color: AppColors.onboadingsubtextcolor,
                maxline: 2,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w500)
          ],
        ),
      ),
    );
  }
}

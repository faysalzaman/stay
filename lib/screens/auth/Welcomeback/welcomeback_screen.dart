import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:stay/screens/auth/EmailAuth/signup_screen.dart';
import 'package:stay/screens/auth/PhoneNumberAuth/phonenumber_screen.dart';
import 'package:stay/screens/home/home_screen.dart';
import 'package:stay/utils/app_colors.dart';
import 'package:stay/utils/app_navigator.dart';
import 'package:stay/widgets/ElevatedButtonWidget.dart';
import 'package:stay/widgets/text_widget.dart';
import 'package:lottie/lottie.dart';

class WelcomeBackScreen extends StatefulWidget {
  const WelcomeBackScreen({super.key});

  @override
  State<WelcomeBackScreen> createState() => _WelcomeBackScreenState();
}

class _WelcomeBackScreenState extends State<WelcomeBackScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.95, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeOut),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // bool _switchValue = false;

  // void _changeLanguage(bool value) {
  //   setState(() {
  //     _switchValue = value;
  //     if (value) {
  //       context.setLocale(const Locale('ar'));
  //     } else {
  //       context.setLocale(const Locale('en'));
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      appBar: AppBar(
        backgroundColor: AppColors.lightBlue,
        toolbarHeight: 0.5,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Lottie.asset(
              'assets/lottie/splash_animation.json',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppText.heading(
                          "welcome".tr(),
                          maxline: 2,
                          textAlign: TextAlign.center,
                        ),
                        // Row(
                        //   children: [
                        //     Lottie.asset(
                        //       'assets/lottie/language.json',
                        //       fit: BoxFit.contain,
                        //       height: 40,
                        //     ),
                        //     Column(
                        //       children: [
                        //         Image.asset(
                        //           "assets/images/us_flag.png",
                        //           height: 20,
                        //           width: 20,
                        //         ),
                        //         AppText.normal(
                        //           "english".tr(),
                        //           fontsize: 8,
                        //           color: AppColors.onboadingsubtextcolor,
                        //         ),
                        //       ],
                        //     ),
                        //     Transform.scale(
                        //       scale: 0.6,
                        //       child: Switch(
                        //         activeColor: AppColors.bgcolor,
                        //         inactiveTrackColor:
                        //             AppColors.onboardingarrowbackcolor,
                        //         inactiveThumbColor: AppColors.onboadingsubtextcolor,
                        //         value: _switchValue,
                        //         onChanged: _changeLanguage,
                        //       ),
                        //     ),
                        //     Column(
                        //       children: [
                        //         Image.asset(
                        //           "assets/images/uae_flag.png",
                        //           height: 20,
                        //           width: 20,
                        //         ),
                        //         AppText.normal(
                        //           "arabic".tr(),
                        //           fontsize: 8,
                        //           color: AppColors.onboadingsubtextcolor,
                        //         ),
                        //       ],
                        //     ),
                        //   ],
                        // )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: AppText.subHeading(
                      "fill_details".tr(),
                      maxline: 2,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return FadeTransition(
                          opacity: _fadeAnimation,
                          child: Transform.scale(
                            scale: _scaleAnimation.value,
                            child: Image.asset(
                              "assets/splash1.png",
                              height: 300,
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 330,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            AppNavigator.pushReplacement(
                                context, const HomeScreen());
                          },
                          child: Container(
                            width: 327,
                            height: 52,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: AppColors.onboardingarrowbackcolor),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.person,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 17,
                                  ),
                                  AppText.subHeading(
                                    "continue_as_guest".tr(),
                                    letterSpacing: 1.0,
                                    color: Colors.black,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            AppNavigator.push(context, const SignupScreen());
                          },
                          child: Container(
                            width: 327,
                            height: 52,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: AppColors.onboardingarrowbackcolor),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.email_rounded,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 17,
                                  ),
                                  AppText.subHeading(
                                    "sign_up_with_email".tr(),
                                    letterSpacing: 1.0,
                                    color: Colors.black,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 130,
                                height: 1.2,
                                color: AppColors.onboardingarrowbackcolor,
                              ),
                              AppText.subHeading("Or",
                                  fontWeight: FontWeight.w500),
                              Container(
                                width: 130,
                                height: 1.2,
                                color: AppColors.onboardingarrowbackcolor,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Handle Google sign in
                              },
                              child: Image.asset(
                                'assets/images/google.png',
                                height: 40,
                                width: 40,
                              ),
                            ),
                            SizedBox(width: 30),
                            GestureDetector(
                              onTap: () {
                                // Handle Facebook sign in
                              },
                              child: Image.asset(
                                'assets/images/facebook.png',
                                height: 40,
                                width: 40,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        ElevatedButtonWidget(
                          buttonBackgroundColor: AppColors.bgcolor,
                          buttonHeight: 52,
                          buttonWidth: 327,
                          buttonborderRadius: 12,
                          onPressed: () {
                            AppNavigator.push(
                                context, const PhonenumberScreen());
                          },
                          child: AppText.heading(
                            "use_phone_number".tr(),
                            letterSpacing: 1.0,
                            fontsize: 14,
                            color: Colors.white,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

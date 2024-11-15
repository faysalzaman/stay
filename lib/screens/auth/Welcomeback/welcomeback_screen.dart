import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:stay/screens/auth/EmailAuth/signup_screen.dart';
import 'package:stay/screens/auth/PhoneNumberAuth/phonenumber_screen.dart';
import 'package:stay/screens/home/home_screen.dart';
import 'package:stay/utils/app_colors.dart';
import 'package:stay/utils/app_navigator.dart';
import 'package:stay/widgets/ElevatedButtonWidget.dart';
import 'package:stay/widgets/text_widget.dart';

class WelcomeBackScreen extends StatefulWidget {
  const WelcomeBackScreen({super.key});

  @override
  State<WelcomeBackScreen> createState() => _WelcomeBackScreenState();
}

class _WelcomeBackScreenState extends State<WelcomeBackScreen> {
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
      body: Column(
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
                    AppText.heading("welcome".tr(),
                        maxline: 2, textAlign: TextAlign.center),
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
              SizedBox(height: 0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: AppText.subHeading(
                  "fill_details".tr(),
                  maxline: 2,
                  color: AppColors.onboadingsubtextcolor,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(child: Image.asset("assets/images/wl.png")),
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
                    SizedBox(
                      height: 10,
                    ),
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
                    SizedBox(
                      height: 10,
                    ),
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
                          AppText.subHeading("Or", fontWeight: FontWeight.w500),
                          Container(
                            width: 130,
                            height: 1.2,
                            color: AppColors.onboardingarrowbackcolor,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButtonWidget(
                      buttonBackgroundColor: AppColors.bgcolor,
                      buttonHeight: 52,
                      buttonWidth: 327,
                      buttonborderRadius: 12,
                      onPressed: () {
                        AppNavigator.push(context, const PhonenumberScreen());
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
    );
  }
}

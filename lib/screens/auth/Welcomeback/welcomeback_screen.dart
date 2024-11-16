import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:stay_app/screens/auth/PhoneNumberAuth/otpverification_screen.dart';
import 'package:stay_app/screens/home/home_screen.dart';
import 'package:stay_app/utils/app_colors.dart';
import 'package:stay_app/utils/app_navigator.dart';
import 'package:stay_app/utils/globalvariables.dart';
import 'package:stay_app/widgets/ElevatedButtonWidget.dart';
import 'package:stay_app/widgets/TextFormFieldWidget.dart';
import 'package:stay_app/widgets/countrycode_widget.dart';
import 'package:stay_app/widgets/text_widget.dart';

class WelcomeBackScreen extends StatefulWidget {
  const WelcomeBackScreen({super.key});

  @override
  State<WelcomeBackScreen> createState() => _WelcomeBackScreenState();
}

class _WelcomeBackScreenState extends State<WelcomeBackScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 0.5,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: AppColors.onboardingarrowbackcolor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AppText.heading("phone_number".tr(), maxline: 2),
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              // Padding(
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: AppText.subHeading(
                  "fill_details".tr(),
                  maxline: 2,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  CountryCodeDropdown(),
                  TextFormFieldWgt(
                    width: 230,
                    height: 48,
                    hintText: "phone_hint".tr(),
                    keyboardType: TextInputType.number,
                  )
                ],
              ),

              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ElevatedButtonWidget(
                  buttonBackgroundColor: AppColors.bgcolor,
                  buttonHeight: 52,
                  buttonWidth: 350,
                  buttonborderRadius: 12,
                  onPressed: () {
                    AppNavigator.push(context, const OtpVerificationScreen());
                  },
                  child: AppText.heading(
                    "send_code".tr(),
                    letterSpacing: 1.0,
                    fontsize: 14,
                    color: Colors.white,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 1,
                      color: Colors.grey.shade300,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: AppText.normal(
                        "or_sign_in_with".tr(),
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 1,
                      color: Colors.grey.shade300,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Handle Google sign in
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Image.asset(
                        'assets/images/google.png',
                        height: 40,
                        width: 40,
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  GestureDetector(
                    onTap: () {
                      // Handle Facebook sign in
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Image.asset(
                        'assets/images/facebook.png',
                        height: 40,
                        width: 40,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () {
                    AppNavigator.pushReplacement(context, const HomeScreen());
                  },
                  child: Container(
                    width: w(context),
                    height: 52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey),
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
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ));
  }
}

// Stack(
// children: [
// Positioned.fill(
// child: Lottie.asset(
// 'assets/lottie/splash_animation.json',
// fit: BoxFit.cover,
// ),
// ),
// SingleChildScrollView(
// child: Column(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Padding(
// padding: EdgeInsets.symmetric(horizontal: 20),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// AppText.heading(
// "welcome".tr(),
// maxline: 2,
// textAlign: TextAlign.center,
// ),
// // Row(
// //   children: [
// //     Lottie.asset(
// //       'assets/lottie/language.json',
// //       fit: BoxFit.contain,
// //       height: 40,
// //     ),
// //     Column(
// //       children: [
// //         Image.asset(
// //           "assets/images/us_flag.png",
// //           height: 20,
// //           width: 20,
// //         ),
// //         AppText.normal(
// //           "english".tr(),
// //           fontsize: 8,
// //           color: AppColors.onboadingsubtextcolor,
// //         ),
// //       ],
// //     ),
// //     Transform.scale(
// //       scale: 0.6,
// //       child: Switch(
// //         activeColor: AppColors.bgcolor,
// //         inactiveTrackColor:
// //             AppColors.onboardingarrowbackcolor,
// //         inactiveThumbColor: AppColors.onboadingsubtextcolor,
// //         value: _switchValue,
// //         onChanged: _changeLanguage,
// //       ),
// //     ),
// //     Column(
// //       children: [
// //         Image.asset(
// //           "assets/images/uae_flag.png",
// //           height: 20,
// //           width: 20,
// //         ),
// //         AppText.normal(
// //           "arabic".tr(),
// //           fontsize: 8,
// //           color: AppColors.onboadingsubtextcolor,
// //         ),
// //       ],
// //     ),
// //   ],
// // )
// ],
// ),
// ),
// Padding(
// padding: EdgeInsets.symmetric(horizontal: 20),
// child: AppText.subHeading(
// "fill_details".tr(),
// maxline: 2,
// color: Colors.grey,
// ),
// ),
// SizedBox(height: 20),
// Center(
// child: AnimatedBuilder(
// animation: _controller,
// builder: (context, child) {
// return FadeTransition(
// opacity: _fadeAnimation,
// child: Transform.scale(
// scale: _scaleAnimation.value,
// child: Image.asset(
// "assets/splash1.png",
// height: 300,
// fit: BoxFit.fill,
// ),
// ),
// );
// },
// ),
// ),
// ],
// ),
// Align(
// alignment: Alignment.bottomCenter,
// child: Container(
// width: double.infinity,
// height: 330,
// decoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.only(
// topLeft: Radius.circular(30),
// topRight: Radius.circular(30),
// ),
// ),
// child: Padding(
// padding: const EdgeInsets.symmetric(
// horizontal: 10.0,
// ),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// GestureDetector(
// onTap: () {
// AppNavigator.pushReplacement(
// context, const HomeScreen());
// },
// child: Container(
// width: 327,
// height: 52,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(12),
// border: Border.all(
// color: AppColors.onboardingarrowbackcolor),
// ),
// child: Center(
// child: Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// SizedBox(
// width: 10,
// ),
// Icon(
// Icons.person,
// color: Colors.black,
// ),
// SizedBox(
// width: 17,
// ),
// AppText.subHeading(
// "continue_as_guest".tr(),
// letterSpacing: 1.0,
// color: Colors.black,
// textAlign: TextAlign.center,
// ),
// ],
// ),
// ),
// ),
// ),
// SizedBox(height: 10),
// GestureDetector(
// onTap: () {
// AppNavigator.push(context, const SignupScreen());
// },
// child: Container(
// width: 327,
// height: 52,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(12),
// border: Border.all(
// color: AppColors.onboardingarrowbackcolor),
// ),
// child: Center(
// child: Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Icon(
// Icons.email_rounded,
// color: Colors.black,
// ),
// SizedBox(
// width: 17,
// ),
// AppText.subHeading(
// "sign_up_with_email".tr(),
// letterSpacing: 1.0,
// color: Colors.black,
// textAlign: TextAlign.center,
// ),
// ],
// ),
// ),
// ),
// ),
// SizedBox(height: 10),
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 10.0),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Container(
// width: 130,
// height: 1.2,
// color: AppColors.onboardingarrowbackcolor,
// ),
// AppText.subHeading("Or",
// fontWeight: FontWeight.w500),
// Container(
// width: 130,
// height: 1.2,
// color: AppColors.onboardingarrowbackcolor,
// ),
// ],
// ),
// ),
// SizedBox(height: 20),
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// GestureDetector(
// onTap: () {
// // Handle Google sign in
// },
// child: Image.asset(
// 'assets/images/google.png',
// height: 40,
// width: 40,
// ),
// ),
// SizedBox(width: 30),
// GestureDetector(
// onTap: () {
// // Handle Facebook sign in
// },
// child: Image.asset(
// 'assets/images/facebook.png',
// height: 40,
// width: 40,
// ),
// ),
// ],
// ),
// SizedBox(height: 20),
// ElevatedButtonWidget(
// buttonBackgroundColor: AppColors.bgcolor,
// buttonHeight: 52,
// buttonWidth: 327,
// buttonborderRadius: 12,
// onPressed: () {
// AppNavigator.push(
// context, const PhonenumberScreen());
// },
// child: AppText.heading(
// "use_phone_number".tr(),
// letterSpacing: 1.0,
// fontsize: 14,
// color: Colors.white,
// textAlign: TextAlign.center,
// ),
// ),
// ],
// ),
// ),
// ),
// )
// ],
// ),
// ),
// ],
// ),

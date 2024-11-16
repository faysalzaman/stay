import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:stay/screens/auth/PhoneNumberAuth/numberverified_screen.dart';
import 'package:stay/utils/app_colors.dart';
import 'package:stay/utils/app_navigator.dart';
import 'package:stay/widgets/ElevatedButtonWidget.dart';

import 'package:stay/widgets/text_widget.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  late Timer _timer;
  int _start = 180; // Set timer duration to 3 minutes (180 seconds)

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_start > 0) {
          _start--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  String formatTime(int seconds) {
    final duration = Duration(seconds: seconds);
    final minutesStr =
        duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final secondsStr =
        duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$minutesStr:$secondsStr";
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 0.5,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
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
                SizedBox(height: 30),
                AppText.heading("otp_verification".tr()),
                SizedBox(height: 15),
                AppText.subHeading(
                  "enter_code_sms".tr(),
                  color: AppColors.onboadingsubtextcolor,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 10),
                AppText.subHeading("+8801774280874",
                    fontWeight: FontWeight.w500),
                SizedBox(height: 20),
                // Timer display in MM:SS format
                AppText.subHeading(
                  formatTime(_start),
                  fontWeight: FontWeight.w500,
                  fontsize: 16,
                  color: AppColors.bgcolor,
                ),
                SizedBox(height: 30),
                // Pinput OTP Field
                Pinput(
                  length: 6, // Adjust OTP length if needed
                  showCursor: true,
                  onCompleted: (pin) {
                    print("Entered OTP: $pin");
                  },
                  defaultPinTheme: PinTheme(
                    width: 48,
                    height: 48,
                    textStyle: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontFamily: GoogleFonts.inter().fontFamily),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border:
                          Border.all(color: AppColors.onboardingarrowbackcolor),
                    ),
                  ),
                  focusedPinTheme: PinTheme(
                    width: 48,
                    height: 48,
                    textStyle: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontFamily: GoogleFonts.inter().fontFamily),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.bgcolor),
                    ),
                  ),
                  submittedPinTheme: PinTheme(
                    width: 48,
                    height: 48,
                    textStyle: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontFamily: GoogleFonts.inter().fontFamily),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.bgcolor),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText.subHeading(
                      "didnt_receive_code".tr(),
                      color: AppColors.onboadingsubtextcolor,
                      fontWeight: FontWeight.w400,
                    ),
                    AppText.subHeading(
                      "resend".tr(),
                      color: AppColors.bgcolor,
                      underline: true,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ],
            ),
            // Button at the bottom
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: ElevatedButtonWidget(
                buttonBackgroundColor: AppColors.bgcolor,
                buttonHeight: 52,
                buttonWidth: MediaQuery.of(context).size.width *
                    0.9, // Make button responsive to screen width
                buttonborderRadius: 12,
                onPressed: () {
                  AppNavigator.push(context, const NumberVerifiedScreen());
                },
                child: AppText.heading(
                  "activate".tr(),
                  letterSpacing: 1.0,
                  fontsize: 14,
                  color: Colors.white,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

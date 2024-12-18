import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stay_app/screens/auth/PhoneNumberAuth/otpverification_screen.dart';
import 'package:stay_app/utils/app_colors.dart';
import 'package:stay_app/utils/app_navigator.dart';
import 'package:stay_app/widgets/ElevatedButtonWidget.dart';
import 'package:stay_app/widgets/TextFormFieldWidget.dart';

import 'package:stay_app/widgets/countrycode_widget.dart';
import 'package:stay_app/widgets/text_widget.dart';
import 'package:easy_localization/easy_localization.dart';

class PhonenumberScreen extends StatefulWidget {
  const PhonenumberScreen({super.key});

  @override
  State<PhonenumberScreen> createState() => _PhonenumberScreenState();
}

class _PhonenumberScreenState extends State<PhonenumberScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onboardingbgcolor,
      appBar: AppBar(
        backgroundColor: AppColors.onboardingbgcolor,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText.heading("phone_number".tr(), maxline: 2),
                    Lottie.asset(
                      'assets/lottie/number.json',
                      fit: BoxFit.contain,
                      height: 100,
                    ),
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: AppText.subHeading("phone_hint".tr(),
                  maxline: 2, color: AppColors.onboadingsubtextcolor),
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
          ],
        ),
      ),
    );
  }
}

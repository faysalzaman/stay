import 'package:flutter/material.dart';
import 'package:stay/screens/auth/EmailAuth/signin_screen.dart';
import 'package:stay/utils/app_colors.dart';
import 'package:stay/utils/app_navigator.dart';
import 'package:stay/utils/globalvariables.dart';
import 'package:stay/widgets/ElevatedButtonWidget.dart';
import 'package:stay/widgets/PwdTextFormFieldWidget.dart';

import 'package:stay/widgets/text_widget.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onboardingbgcolor,
      appBar: AppBar(
        surfaceTintColor: AppColors.onboardingbgcolor,
        elevation: 0,
        backgroundColor: AppColors.onboardingbgcolor,
        toolbarHeight: 0.5,
      ),
      body:
          // Main content above the button
          SingleChildScrollView(
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
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AppText.heading("Reset Password", maxline: 2),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AppText.subHeading(
                "Please enter your email in order to receive OTP \non your email.",
                maxline: 2,
                color: AppColors.onboadingsubtextcolor,
              ),
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child:
                  AppText.subHeading("Password", fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            PwdTextFormFieldWidget(
              width: w(context),
              hintText: "********",
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AppText.subHeading("Confirm Password",
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            PwdTextFormFieldWidget(
              width: w(context),
              hintText: "********",
            ),
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: ElevatedButtonWidget(
                buttonBackgroundColor: AppColors.bgcolor,
                buttonHeight: 52,
                buttonWidth: w(context),
                buttonborderRadius: 12,
                onPressed: () {
                  AppNavigator.pushReplacement(context, const SigninScreen());
                },
                child: AppText.heading(
                  "Submit",
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

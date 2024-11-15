import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stay/screens/auth/EmailAuth/signin_screen.dart';
import 'package:stay/utils/app_colors.dart';
import 'package:stay/utils/app_navigator.dart';
import 'package:stay/utils/globalvariables.dart';
import 'package:stay/widgets/PwdTextFormFieldWidget.dart';
import 'package:stay/widgets/TextFormFieldWidget.dart';

import 'package:stay/widgets/text_widget.dart';

import '../../../widgets/ElevatedButtonWidget.dart';
import 'package:easy_localization/easy_localization.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _isChecked = false;

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
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AppText.heading("sign_up".tr(), maxline: 2),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AppText.subHeading(
                "fill_details".tr(),
                maxline: 2,
                color: AppColors.onboadingsubtextcolor,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child:
                  AppText.subHeading("name".tr(), fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormFieldWgt(
              width: w(context),
              hintText: "name_hint".tr(),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child:
                  AppText.subHeading("email".tr(), fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormFieldWgt(
              width: w(context),
              hintText: "email_hint".tr(),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AppText.subHeading("password".tr(),
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
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Transform.scale(
                    scale: 0.8,
                    child: Checkbox(
                      value: _isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value ?? false;
                        });
                      },
                      activeColor: AppColors.bgcolor,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15),
                      Row(
                        children: [
                          AppText.normal(
                            "agree_with".tr(),
                            maxline: 2,
                            color: AppColors.onboadingsubtextcolor,
                          ),
                          AppText.normal(
                            "terms_conditions".tr(),
                            maxline: 2,
                            color: AppColors.bgcolor,
                            underline: true,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButtonWidget(
                buttonBackgroundColor: AppColors.bgcolor,
                buttonHeight: 52,
                buttonWidth: w(context),
                buttonborderRadius: 12,
                onPressed: () {
                  AppNavigator.pushReplacement(context, const SigninScreen());
                },
                child: AppText.heading(
                  "sign_up".tr(),
                  letterSpacing: 1.0,
                  fontsize: 14,
                  color: Colors.white,
                  textAlign: TextAlign.center,
                ),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText.normal(
                    "already_have_account".tr(),
                    fontWeight: FontWeight.bold,
                  ),
                  5.width,
                  GestureDetector(
                    onTap: () {
                      AppNavigator.pop(context);
                    },
                    child: AppText.normal(
                      "sign_in".tr(),
                      fontWeight: FontWeight.bold,
                      underline: true,
                      color: AppColors.bgcolor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

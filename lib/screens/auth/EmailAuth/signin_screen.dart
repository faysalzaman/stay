import 'package:flutter/material.dart';
import 'package:stay/screens/auth/EmailAuth/Forget/forget_password_screen.dart';
import 'package:stay/screens/home/home_screen.dart';
import 'package:stay/utils/app_colors.dart';
import 'package:stay/utils/app_navigator.dart';
import 'package:stay/utils/globalvariables.dart';
import 'package:stay/widgets/ElevatedButtonWidget.dart';
import 'package:stay/widgets/PwdTextFormFieldWidget.dart';
import 'package:stay/widgets/TextFormFieldWidget.dart';

import 'package:stay/widgets/text_widget.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
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
              child: AppText.heading("Sign In with Email", maxline: 2),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AppText.subHeading("Please enter your details to sign in.",
                  maxline: 2, color: AppColors.onboadingsubtextcolor),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AppText.subHeading("Email", fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormFieldWgt(
              width: w(context),
              hintText: "abc@domain.com",
            ),
            SizedBox(
              height: 15,
            ),
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
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Transform.scale(
                    scale:
                        0.8, // Adjust this value to control the checkbox size
                    child: Checkbox(
                      value: _isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value ?? false;
                        });
                      },
                      activeColor:
                          AppColors.bgcolor, // Customize checkbox color
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText.normal("Remember me", color: Colors.grey),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                AppNavigator.push(
                                    context, const ForgetPasswordScreen());
                              },
                              child: AppText.normal("Forgot Password?",
                                  color: AppColors.bgcolor,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 15,
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButtonWidget(
                buttonBackgroundColor: AppColors.bgcolor,
                buttonHeight: 52,
                buttonWidth: w(context),
                buttonborderRadius: 12,
                onPressed: () {
                  AppNavigator.pushReplacement(context, const HomeScreen());
                },
                child: AppText.heading(
                  "Sign In",
                  letterSpacing: 1.0,
                  fontsize: 14,
                  color: Colors.white,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
                        "Continue as a Guest",
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
              height: 50,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText.normal("Don\'t have an account? ",
                        fontWeight: FontWeight.bold),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: AppText.normal("Sign Up",
                          fontWeight: FontWeight.bold,
                          underline: true,
                          color: AppColors.bgcolor),
                    ),
                  ],
                )),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

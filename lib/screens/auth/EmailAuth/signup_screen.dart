import 'package:flutter/material.dart';
import 'package:stay/utils/app_colors.dart';
import 'package:stay/utils/app_navigator.dart';
import 'package:stay/utils/globalvariables.dart';
import 'package:stay/widgets/PwdTextFormFieldWidget.dart';
import 'package:stay/widgets/TextFormFieldWidget.dart';

import 'package:stay/widgets/text_widget.dart';

import '../../../widgets/ElevatedButtonWidget.dart';

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
              child: AppText.heading("Sign Up with Email", maxline: 2),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AppText.subHeading("Please enter your details to sign up.",
                  maxline: 2, color: AppColors.onboadingsubtextcolor),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AppText.subHeading("Name", fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormFieldWgt(
              width: w(context),
              hintText: "John Doe",
            ),
            SizedBox(
              height: 15,
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
              height: 10,
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          AppText.normal("By signing up, you’ve agree to our ",
                              maxline: 2,
                              color: AppColors.onboadingsubtextcolor),
                          AppText.normal("terms and",
                              maxline: 2,
                              color: AppColors.bgcolor,
                              underline: true),
                        ],
                      ),
                      Row(
                        children: [
                          AppText.normal("conditions",
                              maxline: 2,
                              color: AppColors.bgcolor,
                              underline: true),
                          AppText.normal(" and ",
                              maxline: 2,
                              color: AppColors.onboadingsubtextcolor),
                          AppText.normal("Privacy Policy",
                              maxline: 2,
                              color: AppColors.bgcolor,
                              underline: true),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButtonWidget(
                buttonBackgroundColor: AppColors.bgcolor,
                buttonHeight: 52,
                buttonWidth: w(context),
                buttonborderRadius: 12,
                onPressed: () {
                  // AppNavigator.goToPage(context: context, screen: PhonenumberScreen());
                },
                child: AppText.heading(
                  "Sign Up",
                  letterSpacing: 1.0,
                  fontsize: 14,
                  color: Colors.white,
                  textAlign: TextAlign.center,
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
                    AppText.normal("Already have an account? ",
                        fontWeight: FontWeight.bold),
                    GestureDetector(
                      onTap: () {
                        AppNavigator.pop(context);
                      },
                      child: AppText.normal("Sign In",
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

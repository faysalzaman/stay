


import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stay/screens/auth/EmailAuth/signup_screen.dart';
import 'package:stay/screens/auth/PhoneNumberAuth/phonenumber_screen.dart';
import 'package:stay/screens/home/home_screen.dart';
import 'package:stay/utils/app_colors.dart';
import 'package:stay/widgets/ElevatedButtonWidget.dart';
import 'package:stay/widgets/app_navigator.dart';
import 'package:stay/widgets/text_widget.dart';

class WelcomeBackScreen extends StatefulWidget {
  const WelcomeBackScreen({super.key});

  @override
  State<WelcomeBackScreen> createState() => _WelcomeBackScreenState();
}

class _WelcomeBackScreenState extends State<WelcomeBackScreen> {

  bool _switchValue = false;

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
               padding: EdgeInsets.symmetric(horizontal: 20,),
               child:  Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   AppText.heading("Welcome",maxline: 2,textAlign: TextAlign.center),

                   Row(
                     children: [
                       Lottie.asset(
                         'assets/lottie/language.json',
                         fit: BoxFit.contain,
                         height: 40,

                       ),
                       Column(
                         children: [
                           Image.asset("assets/images/us_flag.png",height: 20,width: 20,),
                           AppText.normal("English",fontsize: 8,color: AppColors.onboadingsubtextcolor,),

                         ],
                       ),
                       Transform.scale(
                         scale: 0.6, // Scale down the switch size
                         child: Switch(
                           activeColor: AppColors.bgcolor,
                           inactiveTrackColor: AppColors.onboardingarrowbackcolor,
                           inactiveThumbColor: AppColors.onboadingsubtextcolor,
                           value: _switchValue,
                           onChanged: (value) {
                             setState(() {
                               _switchValue = value;
                             });
                           },
                         ),
                       ),
                       Column(
                         children: [
                           Image.asset("assets/images/uae_flag.png",height: 20,width: 20,),
                           AppText.normal("Arabic",fontsize: 8,color: AppColors.onboadingsubtextcolor,),

                         ],
                       ),
                     ],
                   )
                 ],
               )
             ),
             SizedBox(height: 0,),
             Padding(
               padding: EdgeInsets.symmetric(horizontal: 20,),
               child:  AppText.subHeading("Please Login or Signup to explore \nthe best hotel deals with Stay",
                 maxline: 2,
                 color:AppColors.onboadingsubtextcolor,
               ),
             ),
             SizedBox(height: 20,),
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
                padding: const EdgeInsets.symmetric(horizontal: 10.0,),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    GestureDetector(
                      onTap: (){
                        AppNavigator.goToPageWithReplacement(context: context, screen: HomeScreen());
                      },
                      child: Container(
                        width: 327,
                        height: 52,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.onboardingarrowbackcolor),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 10,),
                              Icon(Icons.person,color: Colors.black,),
                              SizedBox(width: 17,),
                              AppText.subHeading("Continue as a Guest",
                                letterSpacing: 1.0,
                                color: Colors.black,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: (){
                        AppNavigator.goToPage(context: context, screen: SignupScreen());
                      },
                      child: Container(
                        width: 327,
                        height: 52,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.onboardingarrowbackcolor),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.email_rounded,color: Colors.black,),
                              SizedBox(width: 17,),
                              AppText.subHeading("Sign Up with Email",
                                letterSpacing: 1.0,
                                color: Colors.black,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 10,),
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
                          AppText.subHeading("Or",fontWeight: FontWeight.w500),
                          Container(
                            width: 130,
                            height: 1.2,
                            color: AppColors.onboardingarrowbackcolor,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    ElevatedButtonWidget(
                      buttonBackgroundColor: AppColors.bgcolor,
                      buttonHeight: 52,
                      buttonWidth: 327,
                      buttonborderRadius: 12,
                      onPressed: (){
                        AppNavigator.goToPage(context: context, screen: PhonenumberScreen());
                      },
                      child: AppText.heading("Use Phone Number",
                        letterSpacing: 1.0,
                        fontsize: 14, color: Colors.white,
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

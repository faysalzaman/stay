import 'package:flutter/material.dart';
import 'package:stay/screens/auth/login/login_screen.dart';
import 'package:stay/utils/app_colors.dart';
import 'package:stay/utils/app_navigator.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:easy_localization/easy_localization.dart';

class OtpScreenWithSignup extends StatefulWidget {
  final String email;

  const OtpScreenWithSignup({
    super.key,
    required this.email,
  });

  @override
  State<OtpScreenWithSignup> createState() => _OtpScreenWithSignupState();
}

class _OtpScreenWithSignupState extends State<OtpScreenWithSignup> {
  final TextEditingController _otpController = TextEditingController();
  bool _isDisposed = false;

  @override
  void dispose() {
    _isDisposed = true;
    _otpController.dispose();
    super.dispose();
  }

  void _handleOtpChange(String value) {
    if (!_isDisposed) {
      // Handle OTP changes
    }
  }

  void _handleOtpComplete(String value) {
    if (!_isDisposed) {
      // Handle OTP completion
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () => AppNavigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                padding: EdgeInsets.zero,
              ),
              const SizedBox(height: 40),
              Center(
                child: Text(
                  'verify_code'.tr(),
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                    children: [
                      TextSpan(
                        text: 'Please enter the code we just sent\nto email '
                            .tr(),
                      ),
                      TextSpan(
                        text: widget.email,
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 48),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: PinCodeTextField(
                  appContext: context,
                  length: 4,
                  controller: _otpController,
                  keyboardType: TextInputType.number,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(12),
                    fieldHeight: 70,
                    fieldWidth: 70,
                    activeFillColor: AppColors.lightBlue,
                    inactiveFillColor: AppColors.lightBlue,
                    selectedFillColor: AppColors.lightBlue,
                    borderWidth: 0,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  onCompleted: _handleOtpComplete,
                  onChanged: _handleOtpChange,
                ),
              ),
              const SizedBox(height: 32),
              Center(
                child: Column(
                  children: [
                    Text(
                      "Didn't receive OTP".tr(),
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 16,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Handle resend code
                      },
                      child: Text(
                        'Resend Code'.tr(),
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  // Handle verification
                  AppNavigator.pushReplacement(context, const LoginScreen());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Verify'.tr(),
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

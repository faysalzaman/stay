import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:stay/screens/auth/login/login_screen.dart';
import 'package:stay/utils/app_colors.dart';
import 'package:stay/utils/app_navigator.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreenWithForgotPassword extends StatefulWidget {
  final String email;

  const OtpScreenWithForgotPassword({
    super.key,
    required this.email,
  });

  @override
  State<OtpScreenWithForgotPassword> createState() =>
      _OtpScreenWithForgotPasswordState();
}

class _OtpScreenWithForgotPasswordState
    extends State<OtpScreenWithForgotPassword> {
  final _otpController = TextEditingController();
  bool _isDisposed = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _isDisposed = true;
    _otpController.dispose();
    super.dispose();
  }

  void _handleOtpChange(String value) {
    if (!_isDisposed) {
      setState(() {
        // Handle OTP changes if needed
      });
    }
  }

  void _handleVerifyOtp() {
    if (_formKey.currentState?.validate() ?? false) {
      AppNavigator.pushReplacement(context, const LoginScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
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
                          text: 'please_enter_code'.tr(),
                        ),
                        TextSpan(
                          text: "\n\n\n${widget.email}",
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
                    onChanged: _handleOtpChange,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'otp_required'.tr();
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 32),
                Center(
                  child: Column(
                    children: [
                      Text(
                        'didnt_receive_otp'.tr(),
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 16,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // TODO: Implement resend OTP logic
                        },
                        child: Text(
                          'resend_code'.tr(),
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
                  onPressed: _handleVerifyOtp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    minimumSize: const Size(double.infinity, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'verify'.tr(),
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
      ),
    );
  }
}

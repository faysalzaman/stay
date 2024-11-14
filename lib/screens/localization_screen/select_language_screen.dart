import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:stay/screens/auth/login/login_screen.dart';
import 'package:stay/utils/app_colors.dart';
import 'package:stay/utils/app_navigator.dart';

class SelectLanguageScreen extends StatelessWidget {
  const SelectLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Image.asset(
                'assets/images/logo.png',
                height: 150,
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 40),
              Text(
                'welcome'.tr(),
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2B5989),
                ),
              ),
              Text(
                'lets_get_started'.tr(),
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF2B5989),
                ),
              ),
              const SizedBox(height: 40),
              Text(
                'select_language'.tr(),
                style: const TextStyle(
                  fontSize: 24,
                  color: Color(0xFF2B5989),
                ),
              ),
              const SizedBox(height: 30),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _LanguageButton(
                      isSelected: context.locale == const Locale('en'),
                      flagAsset: 'assets/images/us_flag.png',
                      language: 'english'.tr(),
                      onTap: () {
                        context.setLocale(const Locale('en'));
                      },
                    ),
                    const SizedBox(width: 16),
                    _LanguageButton(
                      isSelected: context.locale == const Locale('ar'),
                      flagAsset: 'assets/images/uae_flag.png',
                      language: 'arabic'.tr(),
                      onTap: () {
                        context.setLocale(const Locale('ar'));
                      },
                    ),
                  ],
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  // Navigate to next screen
                  AppNavigator.push(context, const LoginScreen());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'continue'.tr(),
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
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

class _LanguageButton extends StatelessWidget {
  final bool isSelected;
  final String flagAsset;
  final String language;
  final VoidCallback onTap;

  const _LanguageButton({
    required this.isSelected,
    required this.flagAsset,
    required this.language,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE5EDF5) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color(0xFFE5EDF5),
          ),
        ),
        child: Column(
          children: [
            Image.asset(flagAsset, height: 40),
            const SizedBox(height: 10),
            Text(
              language,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF2B5989),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

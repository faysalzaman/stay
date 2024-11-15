import 'dart:math';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:stay/screens/auth/Welcomeback/welcomeback_screen.dart';
import 'package:stay/utils/app_colors.dart';
import 'package:stay/utils/app_navigator.dart';
import 'package:lottie/lottie.dart';

class SelectLanguageScreen extends StatelessWidget {
  const SelectLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                // round below two corners
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  color: AppColors.primary,
                ),
                child: Lottie.asset(
                  'assets/lottie/language.json',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  Image.asset(
                    'assets/logo1.png',
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'welcome'.tr(),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  Text(
                    'lets_get_started'.tr(),
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'select_language'.tr(),
                    style: const TextStyle(
                      fontSize: 20,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 20),
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
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {
                  AppNavigator.push(context, const WelcomeBackScreen());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  minimumSize: const Size(double.infinity, 45),
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
            ),
          ],
        ),
      ),
    );
  }
}

class _LanguageButton extends StatefulWidget {
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
  State<_LanguageButton> createState() => _LanguageButtonState();
}

class _LanguageButtonState extends State<_LanguageButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: widget.isSelected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color(0xFFE5EDF5),
          ),
        ),
        child: Column(
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.rotate(
                  angle: context.locale.languageCode == 'ar'
                      ? -0.1 * sin(_controller.value * 2 * pi)
                      : 0.1 * sin(_controller.value * 2 * pi),
                  child: AnimatedScale(
                    scale: widget.isSelected ? 1.2 : 1.0,
                    duration: const Duration(milliseconds: 200),
                    child: Image.asset(widget.flagAsset, height: 30),
                  ),
                );
              },
            ),
            const SizedBox(height: 8),
            Text(
              widget.language,
              style: TextStyle(
                fontSize: 14,
                color: widget.isSelected ? Colors.white : AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

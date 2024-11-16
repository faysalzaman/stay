

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stay_app/utils/app_colors.dart';
import 'package:stay_app/widgets/text_widget.dart';

class CountryCodeDropdown extends StatefulWidget {
  @override
  _CountryCodeDropdownState createState() => _CountryCodeDropdownState();
}

class _CountryCodeDropdownState extends State<CountryCodeDropdown> {
  String selectedCountryCode = "+880"; // Default country code
  final List<Map<String, String>> countries = [
    {"code": "+880", "name": "Bangladesh", "flag": "🇧🇩"},
    {"code": "+93", "name": "Afghanistan", "flag": "🇦🇫"},
    {"code": "+355", "name": "Albania", "flag": "🇦🇱"},
    {"code": "+213", "name": "Algeria", "flag": "🇩🇿"},
    {"code": "+376", "name": "Andorra", "flag": "🇦🇩"},
    {"code": "+244", "name": "Angola", "flag": "🇦🇴"},

    // Add more countries here
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.onboardingarrowbackcolor),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          dropdownColor: Colors.white,
          borderRadius: BorderRadius.circular(12),
          value: selectedCountryCode,
          onChanged: (String? newValue) {
            setState(() {
              selectedCountryCode = newValue!;
            });
          },
          items: countries.map<DropdownMenuItem<String>>((country) {
            return DropdownMenuItem<String>(
              value: country["code"],
              child: Row(
                children: [
                  AppText.normal(country["flag"] ?? "",fontWeight: FontWeight.w500,fontFamily: GoogleFonts.mulish().fontFamily),
                  SizedBox(width: 8),
                  AppText.normal(country["code"]  ?? "",fontWeight: FontWeight.w500,fontFamily: GoogleFonts.mulish().fontFamily),
                ],
              ),
            );
          }).toList(),
          icon: Icon(Icons.arrow_drop_down, color: Colors.black),
        ),
      ),
    );
  }
}

import 'package:demo_app/features/auth/presentation/view%20model/auth_controller.dart';
import 'package:demo_app/features/auth/presentation/widgets/languageButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

showSettingsPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          title: const Center(child: Text('Settings')),
          content: GetBuilder<AuthController>(builder: (controller) {
            controller.getLanguage();
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          controller.changeLanguage(const Locale('ar'));
                        },
                        child: settingsLanguageButton(
                            'عربي', 'AR', context, controller.isArabic)),
                    GestureDetector(
                        onTap: () {
                          controller.changeLanguage(const Locale('en'));
                        },
                        child: settingsLanguageButton(
                          'English',
                          'EN',
                          context,
                          controller.isEnglish,
                        )),
                  ],
                ),
              ],
            );
          }));
    },
  );
}

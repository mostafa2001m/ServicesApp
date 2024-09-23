import 'package:demo_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

Widget settingsLanguageButton(
  String title,
  String image,
  BuildContext context,
  bool isClicked,
) {
  double screenWidth = MediaQuery.of(context).size.width;
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        SizedBox(
          width: screenWidth * 0.28,
          height: screenWidth * 0.28,
          child: Card(
            elevation: 2,
            color: isClicked ? AppColors.primaryColor : Colors.white,
            child: Center(
                child: Text(
              image,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            )),
          ),
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 18),
        )
      ],
    ),
  );
}

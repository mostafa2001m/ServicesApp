import 'dart:ui';

import 'package:demo_app/core/utils/app_colors.dart';
import 'package:demo_app/core/utils/images.dart';
import 'package:demo_app/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LoaderCircle extends StatelessWidget {
  const LoaderCircle({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine the smaller dimension of the screen
    double size = MediaQuery.of(context).size.shortestSide * 0.3;

    return Stack(
      alignment: Alignment.center, // Centers the content inside the Stack
      children: [
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: const SizedBox(),
          ),
        ),
        Container(
          height: size,
          width: size,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(size / 2),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  Images.logo,
                  height: size,
                  width: size,
                ),
              ),
            ),
          ),
        ),
        const Positioned(
          top: 2,
          left: 2,
          right: 2,
          bottom: 2,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
            color: Colors.black,
            backgroundColor: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}

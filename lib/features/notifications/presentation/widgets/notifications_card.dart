import 'package:demo_app/core/utils/app_colors.dart';
import 'package:demo_app/features/notifications/data/models/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Column notificationCardView(int index, NotificationModel notification) {
  return Column(
    children: [
      if (index == 0)
        SizedBox(
          height: 100.h,
        ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: ListTile(
          leading: CircleAvatar(
              radius: 30,
              backgroundColor: AppColors.textColorLight,
              child: ClipOval(
                child: Image.network(
                  notification.imageUrl,
                  fit: BoxFit.cover,
                ),
              )),
          title: Text(notification.title,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 18)),
          subtitle: Text(
            notification.date,
            style: TextStyle(color: Colors.blue.shade300),
          ),
        ),
      ),
    ],
  );
}

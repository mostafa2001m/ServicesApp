import 'package:demo_app/features/services/presentaion/view%20model/survices_controller.dart';
import 'package:demo_app/features/services/presentaion/widgets/view_services_widgets/suvices_list_widget.dart';
import 'package:demo_app/features/services/presentaion/widgets/view_services_widgets/view_survices_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewServicesScreen extends StatelessWidget {
  const ViewServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SurvicesController());
    return const Scaffold(
      body: Column(
        children: [ViewSurvicesHeader(), ServicesListWidget()],
      ),
    );
  }
}

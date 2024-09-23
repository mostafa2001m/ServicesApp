import 'dart:developer';
import 'dart:math';

import 'package:demo_app/core/widgets/custom_snackbar.dart';
import 'package:demo_app/features/services/data/models/add_new_service_model.dart';
import 'package:demo_app/features/services/data/models/detailed_service_model.dart';
import 'package:demo_app/features/services/data/models/service_model.dart';
import 'package:demo_app/features/services/data/models/sub_service_model.dart';
import 'package:demo_app/features/services/data/services_repository.dart';
import 'package:get/get.dart';

class SurvicesController extends GetxController {
  RxInt selectedIndex = (-1).obs;
  RxInt selectedInnerIndex = (-1).obs;
  bool isLoading = false;
  List<ServiceModel> services = [];
  List<SubServiceModel> subServices = [];
  List<DetatailedServiceModel> detailedServices = [];
  ServicesRepository repo = ServicesRepository();
  List<AddServiceModel> addServicesList = [];

  getAllServices() async {
    isLoading = true;
    update();
    await repo.getAllServices((service) {
      services = service;

      update();
    }, (error) {
      customSnackBar('Error'.tr, error, true);
    });
    isLoading = false;
    update();
  }

  getSubServices(String serviceId) async {
    isLoading = true;
    update();
    selectedInnerIndex.value = -1;
    await repo.getSubServicesById(serviceId, (subs) {
      subServices = subs;
      update();
    }, (e) {
      customSnackBar('Error'.tr, e, true);
    });
    isLoading = false;
    update();
  }

  getDetailedServices(String serviceId) async {
    isLoading = true;
    update();
    await repo.getDetailedServicesById(serviceId, (detailed) {
      detailedServices = detailed;
      update();
    }, (e) {
      customSnackBar('Error'.tr, e, true);
    });
    isLoading = false;
    update();
  }

  getAllServicesWithTheirInfo() async {
    addServicesList = await repo.getAllAddServiceModels();
    update();
  }

  selectServicesToAdd(
      String? detailedServiceId, String subServiceId, int serviceIndex) {
    if (detailedServiceId == null) {
      addServicesList[serviceIndex]
              .subServices
              .firstWhere((element) => element.id == subServiceId)
              .isChecked =
          !addServicesList[serviceIndex]
              .subServices
              .firstWhere((element) => element.id == subServiceId)
              .isChecked;
    } else {
      addServicesList[serviceIndex]
              .detailedServices
              .firstWhere((element) => element.id == detailedServiceId)
              .isChecked =
          !addServicesList[serviceIndex]
              .detailedServices
              .firstWhere((element) => element.id == detailedServiceId)
              .isChecked;
    }
    update();
  }

  bool checkIfSelected(
    int serviceIndex,
    String subServiceId,
    String? detailedServiceId,
  ) {
    if (detailedServiceId == null) {
      return addServicesList[serviceIndex]
              .subServices
              .firstWhere((element) => element.id == subServiceId)
              .isChecked ||
          addServicesList[serviceIndex].detailedServices.any(
              (detailedService) =>
                  detailedService.subServiceId == subServiceId &&
                  detailedService.isChecked);
    } else {
      return addServicesList[serviceIndex]
          .detailedServices
          .firstWhere((element) => element.id == detailedServiceId)
          .isChecked;
    }
  }
}

import 'package:demo_app/core/database_helper/database_helper.dart';
import 'package:demo_app/features/services/data/models/add_new_service_model.dart';
import 'package:demo_app/features/services/data/models/detailed_service_model.dart';
import 'package:demo_app/features/services/data/models/service_model.dart';
import 'package:demo_app/features/services/data/models/sub_service_model.dart';

class ServicesRepository {
  final dbHelper = DatabaseHelper();

  getAllServices(Function(List<ServiceModel>) onSuccess,
      Function(String error) onError) async {
    try {
      List<Map<String, dynamic>> servicesMap = await dbHelper.getAllServices();
      List<ServiceModel> services = List.generate(servicesMap.length, (index) {
        return ServiceModel.fromMap(servicesMap[index]);
      });
      onSuccess(services);
    } catch (e) {
      onError(e.toString());
    }
  }

  getSubServicesById(
      String serviceId,
      Function(List<SubServiceModel>) onSuccess,
      Function(String error) onError) async {
    try {
      List<Map<String, dynamic>> servicesMap =
          await dbHelper.getSubServices(int.parse(serviceId));
      List<SubServiceModel> services =
          List.generate(servicesMap.length, (index) {
        return SubServiceModel.fromMap(servicesMap[index]);
      });
      onSuccess(services);
    } catch (e) {
      onError(e.toString());
    }
  }

  getDetailedServicesById(
      String subServiceId,
      Function(List<DetatailedServiceModel>) onSuccess,
      Function(String error) onError) async {
    try {
      List<Map<String, dynamic>> servicesMap =
          await dbHelper.getDetailedServices(int.parse(subServiceId));
      List<DetatailedServiceModel> services =
          List.generate(servicesMap.length, (index) {
        return DetatailedServiceModel.fromMap(servicesMap[index]);
      });
      onSuccess(services);
    } catch (e) {
      onError(e.toString());
    }
  }

  Future<List<AddServiceModel>> getAllAddServiceModels() async {
    final servicesData = await dbHelper.getAllServices();
    List<AddServiceModel> addServiceModels = [];

    for (var serviceMap in servicesData) {
      final service = ServiceModel.fromMap(serviceMap);

      // Fetch sub-services for this service
      final subServicesData = await dbHelper.getSubServices(int.parse(service.id));
      List<SubServiceModel> subServices = subServicesData
          .map((subServiceMap) => SubServiceModel.fromMap(subServiceMap))
          .toList();

      List<DetatailedServiceModel> detailedServices = [];
      for (var subService in subServices) {
        // Fetch detailed services for this sub-service
        final detailedServicesData = await dbHelper.getDetailedServices(int.parse(subService.id));
        detailedServices.addAll(detailedServicesData
            .map((detailedServiceMap) =>
                DetatailedServiceModel.fromMap(detailedServiceMap))
            .toList());
      }

      // Create AddServiceModel
      addServiceModels.add(AddServiceModel(
        service: service,
        subServices: subServices,
        detailedServices: detailedServices,
      ));
    }

    return addServiceModels;
  }
}

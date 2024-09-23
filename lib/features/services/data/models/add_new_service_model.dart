import 'package:demo_app/features/services/data/models/detailed_service_model.dart';
import 'package:demo_app/features/services/data/models/service_model.dart';
import 'package:demo_app/features/services/data/models/sub_service_model.dart';

class AddServiceModel {
  final ServiceModel service;
  final List<SubServiceModel> subServices;
  final List<DetatailedServiceModel> detailedServices;

  AddServiceModel({
    required this.service,
    required this.subServices,
    required this.detailedServices,
  });
}

class SubServiceModel {
  final String id;
  final String serviceId;
  final String name;
  final String description;
   bool isChecked ;

  SubServiceModel(
      {this.isChecked=false,required this.serviceId,required this.id, required this.name, required this.description});

      factory SubServiceModel.fromMap(Map<String, dynamic> map) {
    return SubServiceModel(
      serviceId: map['service_id'].toString(),
      id: map['id'] .toString(),
      name: map['name'] .toString(),
      description: map['description'] .toString(),
    );
  }

  // Convert a ServiceModel to a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'service_id': serviceId,
      'name': name,
      'description': description,
    };
  }
}

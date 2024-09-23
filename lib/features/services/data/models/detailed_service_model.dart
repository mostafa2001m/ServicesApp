class DetatailedServiceModel {
  final String id;
  final String subServiceId;
  final String name;
  final String description;
   bool isChecked;

  DetatailedServiceModel(
      {this.isChecked=false,
      required this.subServiceId,
      required this.id,
      required this.name,
      required this.description});

  factory DetatailedServiceModel.fromMap(Map<String, dynamic> map) {
    return DetatailedServiceModel(
      id: map['id'].toString(),
      subServiceId: map['subservice_id'].toString(),
      name: map['name'] as String,
      description: map['description'] as String,
    );
  }

  // Convert a ServiceModel to a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'subservice_id': subServiceId,
      'name': name,
      'description': description,
    };
  }
}

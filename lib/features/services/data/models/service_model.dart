class ServiceModel {
  final String id;
  final String name;
  final String description;

  ServiceModel(
      {required this.id, required this.name, required this.description});

  factory ServiceModel.fromMap(Map<String, dynamic> map) {
    return ServiceModel(
      id: map['id'].toString(),
      name: map['name'].toString(),
      description: map['description'].toString(),
    );
  }

  // Convert a ServiceModel to a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }
}

class ErrorModel {
  final String errorMessage;

  ErrorModel({ required this.errorMessage});

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      errorMessage: json['message'],
    );
  }

   Map<String, dynamic> toJson() {
    return {
      'message': errorMessage,
    };
  }
}
class NotificationModel {
  final String title;
  final String imageUrl;
  final String date;

  NotificationModel(
      {required this.title, required this.imageUrl, required this.date});

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    print(json['title']);
    return NotificationModel(
      title: json['title'] as String,
      imageUrl: json['thumbnail'] as String,
      date: json['meta']['createdAt'] as String,
    );
  }
}

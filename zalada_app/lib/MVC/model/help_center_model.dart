class Help_center_model {
  final int id;
  final String title;
  final String content;
  final DateTime createdAt;
  final DateTime updatedAt;

  Help_center_model({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Help_center_model.fromJson(Map<String, dynamic> json) {
    return Help_center_model(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

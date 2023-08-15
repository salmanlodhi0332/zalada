class RecentSearch_Model {
  final int? id;
  final String? search_query;
  final int? user_id;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  RecentSearch_Model({
    this.id,
    this.search_query,
    this.user_id,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> tojson() => {
        'id': id,
        'search_query': search_query,
        'user_id': user_id,
        'createdAt': createdAt,
        'updatedAt': updatedAt
      };
  factory RecentSearch_Model.fromJson(Map<String, dynamic> json) {
    return RecentSearch_Model(
      id: json['id'],
      search_query: json['search_query'],
      user_id: json['user_id'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

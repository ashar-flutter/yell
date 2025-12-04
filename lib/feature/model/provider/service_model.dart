class ServiceModel {
  final String id;
  final String title;
  final String icon;
  final String category;

  ServiceModel({
    required this.id,
    required this.title,
    required this.icon,
    required this.category,
  });

  factory ServiceModel.fromMap(Map<String, dynamic> map) {
    return ServiceModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      icon: map['icon'] ?? '',
      category: map['category'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'icon': icon,
      'category': category,
    };
  }
}
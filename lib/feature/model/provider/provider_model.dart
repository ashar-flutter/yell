class ProviderModel {
  final String id;
  final String uid;
  final String serviceId;
  final String serviceTitle;
  final String serviceCategory;
  final String name;
  final String? profilePic;

  ProviderModel({
    required this.id,
    required this.uid,
    required this.serviceId,
    required this.serviceTitle,
    required this.serviceCategory,
    required this.name,
    this.profilePic,
  });
}
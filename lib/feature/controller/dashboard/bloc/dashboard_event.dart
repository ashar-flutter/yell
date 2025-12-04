abstract class DashboardEvent {}

class LoadUserDataEvent extends DashboardEvent {
  final String uid;
  LoadUserDataEvent({required this.uid});
}

class LoadServiceProvidersEvent extends DashboardEvent {
  final String serviceId;
  LoadServiceProvidersEvent({required this.serviceId});
}

class RegisterProviderEvent extends DashboardEvent {
  final String uid;
  final String serviceId;
  final String serviceTitle;
  final String serviceCategory;
  RegisterProviderEvent({
    required this.uid,
    required this.serviceId,
    required this.serviceTitle,
    required this.serviceCategory,
  });
}
abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  final String userName;
  final String? profileImageUrl;
  DashboardLoaded({required this.userName, this.profileImageUrl});
}

class ServiceProvidersLoaded extends DashboardState {
  final String serviceId;
  final List<Map<String, dynamic>> providers;
  ServiceProvidersLoaded({required this.serviceId, required this.providers});
}

class ProviderRegistrationSuccess extends DashboardState {
  final String serviceTitle;
  ProviderRegistrationSuccess({required this.serviceTitle});
}

class DashboardError extends DashboardState {
  final String message;
  DashboardError({required this.message});
}
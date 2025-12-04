// service_providers_list_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controller/dashboard/bloc/dashboard_bloc.dart';
import '../../../controller/dashboard/bloc/dashboard_event.dart';
import '../../../controller/dashboard/bloc/dashboard_state.dart';

class ServiceProvidersListScreen extends StatelessWidget {
  final String serviceId;
  final String serviceName;

  const ServiceProvidersListScreen({
    super.key,
    required this.serviceId,
    required this.serviceName,
  });

  Widget _buildProviderCard(BuildContext context, Map<String, dynamic> provider) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor,
          backgroundImage: provider['userProfilePic'] != null
              ? NetworkImage(provider['userProfilePic']!)
              : null,
          child: provider['userProfilePic'] == null
              ? Icon(Icons.person, color: Colors.white)
              : null,
        ),
        title: Text(
          provider['userName'] ?? 'Provider',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(provider['serviceTitle']),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(serviceName)),
      body: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          if (state is DashboardInitial) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.read<DashboardBloc>().add(
                LoadServiceProvidersEvent(serviceId: serviceId),
              );
            });
          }

          if (state is DashboardLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is ServiceProvidersLoaded && state.serviceId == serviceId) {
            final providers = state.providers;

            if (providers.isEmpty) {
              return Center(child: Text('No providers available'));
            }

            return ListView.builder(
              itemCount: providers.length,
              itemBuilder: (context, index) {
                return _buildProviderCard(context, providers[index]);
              },
            );
          }

          if (state is DashboardError) {
            return Center(child: Text('Error: ${state.message}'));
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
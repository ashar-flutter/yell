import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yell/feature/screens/dashboard/consumer/reusable_components/services_data.dart';
import 'package:yell/feature/screens/dashboard/provider/service_provider_dashboard.dart';

import '../../../controller/dashboard/bloc/dashboard_bloc.dart';
import '../../../controller/dashboard/bloc/dashboard_event.dart';
import '../../../controller/dashboard/bloc/dashboard_state.dart';

class ProviderServiceSelectionScreen extends StatelessWidget {
  final String uid;
  const ProviderServiceSelectionScreen({super.key, required this.uid});

  @override
  Widget build(BuildContext context) {
    final services = ServicesData.getAllServices();

    return BlocListener<DashboardBloc, DashboardState>(
      listener: (context, state) {
        if (state is ProviderRegistrationSuccess) {
          // Navigate to provider dashboard
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ServiceProviderDashboard(
                userId: uid,
                serviceTitle: state.serviceTitle,
              ),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Select Your Service'),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.8,
            ),
            itemCount: services.length,
            itemBuilder: (context, index) {
              final service = services[index];
              return Card(
                child: InkWell(
                  onTap: () {
                    context.read<DashboardBloc>().add(
                      RegisterProviderEvent(
                        uid: uid,
                        serviceId: service.id,
                        serviceTitle: service.title,
                        serviceCategory: service.category,
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(service.icon, style: TextStyle(fontSize: 30)),
                        SizedBox(height: 8),
                        Text(
                          service.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
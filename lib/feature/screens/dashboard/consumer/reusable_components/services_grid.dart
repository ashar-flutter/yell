import 'package:yell/core/barrel/barrel.dart';
import '../service_providers_list_screen.dart';
import 'services_data.dart';
import 'service_card.dart';

class ServicesGrid extends StatelessWidget {
  final Function(String) onServiceTap;

  const ServicesGrid({super.key, required this.onServiceTap});

  @override
  Widget build(BuildContext context) {
    final services = ServicesData.getAllServices();

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.85,
      ),
      itemCount: services.length,
      itemBuilder: (context, index) {
        final service = services[index];

        return ServiceCard(
          title: service.title,
          icon: service.icon,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ServiceProvidersListScreen(
                  serviceId: service.id,
                  serviceName: service.title,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
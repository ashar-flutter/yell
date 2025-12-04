import 'package:flutter/foundation.dart';
import 'package:yell/core/barrel/barrel.dart';
import 'package:yell/feature/screens/dashboard/consumer/reusable_components/consumer_appbar.dart';
import 'package:yell/feature/screens/dashboard/consumer/reusable_components/consumer_header.dart';
import 'package:yell/feature/screens/dashboard/consumer/reusable_components/services_grid.dart';

import 'package:yell/feature/repository/user/user_repository.dart';

class ServiceConsumerDashboard extends StatefulWidget {
  final String userId;

  const ServiceConsumerDashboard({super.key, required this.userId});

  @override
  State<ServiceConsumerDashboard> createState() =>
      _ServiceConsumerDashboardState();
}

class _ServiceConsumerDashboardState extends State<ServiceConsumerDashboard> {
  String _userName = 'Loading...';
  String? _profileImageUrl;
  bool _isLoading = true;
  final UserRepository _userRepository = UserRepository();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {
      final user = await _userRepository.getUserData(widget.userId);

      if (user != null) {
        setState(() {
          _userName = user.name;
          _profileImageUrl = user.profilePic;
          _isLoading = false;
        });
      } else {
        setState(() {
          _userName = 'User';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _userName = 'User';
        _isLoading = false;
      });
    }
  }

  void _onServiceTap(String serviceName) {
    if (kDebugMode) {
      print('Service tapped: $serviceName');
    }
  }

  void _onProfileTap() {
    if (kDebugMode) {
      print('Profile tapped');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: ConsumerAppBar(
        userName: _userName,
        profileImageUrl: _profileImageUrl,
        onProfileTap: _onProfileTap,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  ConsumerHeader(),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Popular Services',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'bold',
                            color: Theme.of(
                              context,
                            ).textTheme.headlineLarge!.color,
                          ),
                        ),
                        SizedBox(height: 16),
                        ServicesGrid(onServiceTap: _onServiceTap),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

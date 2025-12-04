import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dashboard_event.dart';
import 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  DashboardBloc() : super(DashboardInitial()) {
    on<LoadUserDataEvent>(_onLoadUserData);
    on<LoadServiceProvidersEvent>(_onLoadServiceProviders);
    on<RegisterProviderEvent>(_onRegisterProvider);
  }

  Future<void> _onLoadServiceProviders(
      LoadServiceProvidersEvent event,
      Emitter<DashboardState> emit,
      ) async {
    emit(DashboardLoading());

    try {
      // Get providers for this service
      final snapshot = await _firestore
          .collection('providers')
          .where('serviceId', isEqualTo: event.serviceId)
          .get();

      // Get user details for each provider
      List<Map<String, dynamic>> providers = [];

      for (var doc in snapshot.docs) {
        final providerData = doc.data();
        final uid = providerData['uid'];

        // Get user info
        final userDoc = await _firestore.collection('auth').doc(uid).get();
        final userData = userDoc.data();

        providers.add({
          'providerId': doc.id,
          ...providerData,
          'userName': userData?['name'] ?? 'Provider',
          'userProfilePic': userData?['profilePic'],
        });
      }

      emit(ServiceProvidersLoaded(
        serviceId: event.serviceId,
        providers: providers,
      ));
    } catch (e) {
      emit(DashboardError(message: e.toString()));
    }
  }

  Future<void> _onRegisterProvider(
      RegisterProviderEvent event,
      Emitter<DashboardState> emit,
      ) async {
    emit(DashboardLoading());

    try {
      await _firestore.collection('providers').doc(event.uid).set({
        'uid': event.uid,
        'serviceId': event.serviceId,
        'serviceTitle': event.serviceTitle,
        'serviceCategory': event.serviceCategory,
        'createdAt': FieldValue.serverTimestamp(),
      });

      await _firestore.collection('auth').doc(event.uid).update({
        'role': 'Service Provider',
        'serviceId': event.serviceId,
      });

      emit(ProviderRegistrationSuccess(serviceTitle: event.serviceTitle));
    } catch (e) {
      emit(DashboardError(message: e.toString()));
    }
  }

  Future<void> _onLoadUserData(
      LoadUserDataEvent event,
      Emitter<DashboardState> emit,
      ) async {
    emit(DashboardLoading());
    try {
      final doc = await _firestore.collection('auth').doc(event.uid).get();
      if (doc.exists) {
        final data = doc.data()!;
        emit(DashboardLoaded(
          userName: data['name'] ?? 'User',
          profileImageUrl: data['profilePic'],
        ));
      }
    } catch (e) {
      emit(DashboardError(message: e.toString()));
    }
  }
}
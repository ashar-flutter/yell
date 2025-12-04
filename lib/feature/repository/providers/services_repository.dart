// lib/features/services/data/repositories/services_repository.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/provider/provider_model.dart';

class ServicesRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ProviderModel>> getProvidersByService(String serviceId) async {
    try {
      final snapshot = await _firestore
          .collection('providers')
          .where('serviceId', isEqualTo: serviceId)
          .get();

      List<ProviderModel> providers = [];

      for (var doc in snapshot.docs) {
        final data = doc.data();
        final uid = data['uid'];

        // Get user name and profile pic
        final userDoc = await _firestore.collection('auth').doc(uid).get();
        final userData = userDoc.data();

        providers.add(ProviderModel(
          id: doc.id,
          uid: uid,
          serviceId: data['serviceId'],
          serviceTitle: data['serviceTitle'],
          serviceCategory: data['serviceCategory'],
          name: userData?['name'] ?? 'Provider',
          profilePic: userData?['profilePic'],
        ));
      }

      return providers;
    } catch (e) {
      throw e.toString();
    }
  }

  // Register as provider
  Future<void> registerAsProvider({
    required String uid,
    required String serviceId,
    required String serviceTitle,
    required String serviceCategory,
    required String name,
    required String? profilePic,
  }) async {
    await _firestore.collection('providers').doc(uid).set({
      'uid': uid,
      'serviceId': serviceId,
      'serviceTitle': serviceTitle,
      'serviceCategory': serviceCategory,
      'createdAt': FieldValue.serverTimestamp(),
    });

    await _firestore.collection('auth').doc(uid).update({
      'role': 'Service Provider',
      'serviceId': serviceId,
    });
  }
}
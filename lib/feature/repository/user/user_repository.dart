import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/user/user_model.dart';

class UserRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel?> getUserData(String uid) async {
    try {
      final doc = await _firestore.collection('auth').doc(uid).get();
      if (doc.exists) {
        return UserModel.fromMap(doc.data()!);
      }
      return null;
    } catch (e) {
      throw e.toString();
    }
  }
}
import 'package:flexchamp/domain/models/figure_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FiguresRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  FiguresRepository({
    FirebaseFirestore? firestore,
    FirebaseAuth? auth,
  })  : _firestore = firestore ?? FirebaseFirestore.instance,
        _auth = auth ?? FirebaseAuth.instance;

  Stream<List<FigureModel>> getFiguresStream() {
    try {
      final userID = _auth.currentUser?.uid;
      if (userID == null) {
        throw Exception('User is not logged in');
      }

      return _firestore
          .collection('figure')
          .snapshots()
          .map((querySnapshot) {
            try {
              return querySnapshot.docs.map((doc) {
                try {
                  final data = doc.data();
                  final dataWithId = {...data, 'id': doc.id};
                  return FigureModel.fromJson(dataWithId);
                } catch (e) {
                  rethrow;
                }
              }).toList();
            } catch (e) {
              rethrow;
            }
          });
    } catch (e) {
      return Stream.error('Failed to load figures: $e');
    }
  }
}


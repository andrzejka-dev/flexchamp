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
            return querySnapshot.docs.map(
              (doc) => FigureModel.fromMap(doc.data(), doc.id),
            ).toList();
          });
    } catch (e) {
      return Stream.error('Repository error: $e');
    }
  }
}




// class FiguresRepository {
//   Stream<List<FigureModel>> getFiguresStream() {
//     final userID = FirebaseAuth.instance.currentUser?.uid;
//     if (userID == null) {
//       throw Exception('User is not logged in');
//     }
//     return FirebaseFirestore.instance
//         .collection('figure')
//         .snapshots()
//         .map((querySnapshot) {
//       return querySnapshot.docs.map(
//         (doc) {
//           return FigureModel(
//             figureIcon: doc['figureIcon'],
//             title: doc['title'],
//           );
//         },
//       ).toList();
//     });
//   }
//  }
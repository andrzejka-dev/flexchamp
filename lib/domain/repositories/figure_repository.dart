import 'package:flexchamp/domain/models/figure_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FiguresRepository {
  Stream<List<FigureModel>> getFiguresStream() {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('figure')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map(
        (doc) {
          return FigureModel(
            figureIcon: doc['figureIcon'],
            title: doc['title'],
          );
        },
      ).toList();
    });
  }

  // Future<void> delete({required String id}) {
  //   final userID = FirebaseAuth.instance.currentUser?.uid;
  //   if (userID == null) {
  //     throw Exception('User is not logged in');
  //   }
  //   return FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(userID)
  //       .collection('figure')
  //       .doc(id)
  //       .delete();
  // }

  Future<FigureModel> get({required String id}) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('figure')
        .doc()
        .get();
    return FigureModel(
      title: doc['title'],
      figureIcon: doc['figureIcon'],
    );
  }

//   Future<void> add(
//     String title,
//     String imageURL,
//   ) async {
//     final userID = FirebaseAuth.instance.currentUser?.uid;
//     if (userID == null) {
//       throw Exception('User is not logged in');
//     }
//     await FirebaseFirestore.instance
//         .collection('users')
//         .doc(userID)
//         .collection('figure')
//         .add(
//       {
//         'title': title,
//         'figureIcon': figureIcon,
//       },
//     );
//   }
 }
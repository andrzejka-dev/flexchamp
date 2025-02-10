import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flexchamp/domain/models/detail_model.dart';


class DetailsRepository {
  final FirebaseFirestore _firestore;

  DetailsRepository({FirebaseFirestore? firestore}) 
    : _firestore = firestore ?? FirebaseFirestore.instance;

  Stream<List<DetailModel>> getFigureDetails(String figureType) {
    return _firestore
      .collection(figureType.toLowerCase()) // 'bridge', 'split', etc.
      .snapshots()
      .map((snapshot) => 
        snapshot.docs.map((doc) => 
          DetailModel.fromMap(doc.data(), doc.id)
        ).toList()
      );
  }
}
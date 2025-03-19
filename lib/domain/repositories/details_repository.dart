import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flexchamp/domain/models/detail_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class DetailsRepository {
  final FirebaseFirestore _firestore;

  DetailsRepository({FirebaseFirestore? firestore}) 
    : _firestore = firestore ?? FirebaseFirestore.instance;

  Stream<List<DetailModel>> getFigureDetails(String title) {
    return _firestore
      .collection('figure') // Use the collection name from your security rules
      .where('title', isEqualTo: title) // 'bridge', 'split', etc.
      .snapshots()
      .map((snapshot) => 
        snapshot.docs.map((doc){
          final data = doc.data();
          final dataWithId = {...data, 'id': doc.id};
          // Use the existing fromJson method
          return DetailModel.fromJson(dataWithId);
          //DetailModel.fromMap(doc.data(), doc.id)
        }).toList()
      );
  }
}
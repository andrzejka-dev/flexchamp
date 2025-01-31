import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flexchamp/domain/models/figure_model.dart';
import 'package:flexchamp/features/home/cubit/figure_state.dart';

// class HomeCubit extends Cubit<HomeState> {
//   HomeCubit()
//       : super(HomeInitial()
//         );

//   StreamSubscription? _streamSubscription;

//   Future<void> start() async {
//     emit(
//       HomeState(
//         figure: [],
//         errorMessage: '',
//         isLoading: false,
//       ),
//     );

//     _streamSubscription = FirebaseFirestore.instance
//         .collection('figure')
//         .snapshots()
//         .listen((figure) {
//           final figureModels = figure.docs.map((doc) {
//             return FigureModel(title: doc['title'],);
//           }).toList();
//       emit(
//         HomeState(title: figureModels, isLoading: false, errorMessage: ''),
//       );
//     })..onError((error) {
//       emit(
//         HomeState(title: [], isLoading: false, errorMessage: error.toString()),
//       );
//     });
//   }
//   @override
//   Future<void> close() {
//     _streamSubscription?.cancel();
//     return super.close();
//   }
// }

class FigureCubit extends Cubit<FigureState> {
  final FirebaseFirestore _firestore;

  FigureCubit(this._firestore) : super(FigureInitial());

  Future<void> start() async {
    try {
      emit(FigureLoading());
      
      final snapshot = await _firestore
          .collection('figure')
          .get();

      final figure = snapshot.docs
          .map((doc) => FigureModel.fromJson(doc.data()))
          .toList();

      emit(FigureLoaded(figure));
    } catch (e) {
      emit(FigureError(e.toString()));
    }
  }
}
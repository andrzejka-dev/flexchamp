import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flexchamp/domain/repositories/figure_repository.dart';
import 'package:flexchamp/features/home/cubit/figure_state.dart';

class FigureCubit extends Cubit<FigureState> {
  FigureCubit(this._figuresRepository) : super(const FigureState());

  final FiguresRepository _figuresRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    _streamSubscription = _figuresRepository.getFiguresStream().listen(
      (figure) {
        emit(FigureState(figure: figure));
      },
    )..onError(
        (error) {
          print('Error loading figures: $error');
          emit(const FigureState(loadingErrorOccurred: true));
        },
      );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}


//FigureCubit z claudeAI
// class FigureCubit extends Cubit<FigureState> {
//   final FirebaseFirestore _firestore;

//   FigureCubit(this._firestore) : super(FigureInitial());

//   Future<void> start() async {
//     try {
//       emit(FigureLoading());
      
//       final snapshot = await _firestore
//           .collection('figure')
//           .get();

//       final figure = snapshot.docs
//           .map((doc) => FigureModel.fromJson(doc.data()))
//           .toList();

//       emit(FigureLoaded(figure));
//     } catch (e) {
//       emit(FigureError(e.toString()));
//     }
//   }
// }
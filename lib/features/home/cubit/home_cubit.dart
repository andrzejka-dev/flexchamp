import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(
          const HomeState(
            user: [],
            errorMessage: '',
            isLoading: false,
          ),
        );

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      HomeState(
        user: [],
        errorMessage: '',
        isLoading: false,
      ),
    );

    _streamSubscription = FirebaseFirestore.instance
        .collection('users')
        .orderBy('displayName')
        .snapshots()
        .listen((user) {
      emit(
        HomeState(user: user.docs, isLoading: true, errorMessage: ''),
      );
    })..onError((error) {
      emit(
        HomeState(user: [], isLoading: false, errorMessage: error.toString()),
      );
    });
  }
  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}

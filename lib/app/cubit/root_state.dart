part of 'root_cubit.dart';

@immutable
class RootState {
  final User? users;
  final bool isLoading;
  final String errorMessage;

  const RootState({
    required this.users,
    required this.isLoading,
    required this.errorMessage,
  });
}

part of 'user_cubit.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

final class AddUser extends UserState {}

final class UpdateUser extends UserState {}

final class PrepareToAdd extends UserState {}

final class GetUser extends UserState {
  List<User> x;
  GetUser({required this.x});
}

final class LoadingData extends UserState {
  List<User> x;
  LoadingData({required this.x});
}

final class MoveNext extends UserState {}

final class MovePrevoius extends UserState {}

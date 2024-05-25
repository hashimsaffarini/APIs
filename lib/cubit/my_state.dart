part of 'my_cubit.dart';

sealed class MyState {}

final class MyInitial extends MyState {}

final class GetAllUsers extends MyState {
  final List<Users> users;
  GetAllUsers(this.users);
}

final class GetUserById extends MyState {
  final Users user;
  GetUserById(this.user);
}

final class CreateUser extends MyState {
  final Users user;
  CreateUser(this.user);
}

import 'package:api_project/cubit/my_state.dart';
import 'package:api_project/my_repo.dart';
import 'package:api_project/users.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCubit extends Cubit<MyState<Users>> {
  MyCubit(this.myRepo) : super(const MyState.initial());

  final MyRepo myRepo;

  // Future<void> emitGetAllUsers() async {
  //   final users = await myRepo.getAllUsers();
  //   users.when(
  //     success: (users) {
  //       emit(SuccessList(users));
  //     },
  //     failure: (error) {
  //       emit(Error(error));
  //     },
  //   );
  // }

  Future<void> emitGetUserById(int id) async {
    final user = await myRepo.getUserById(id);
    user.when(
      success: (user) {
        emit(Success(user));
      },
      failure: (error) {
        emit(Error(error));
      },
    );
  }

  Future<void> emitCreateUser(Users user) async {
    final createdUser = await myRepo.createUser(user);
    createdUser.when(
      success: (user) {
        emit(Success(user));
      },
      failure: (error) {
        emit(Error(error));
      },
    );
  }

  Future<void> emitDeleteUser(int id) async {
    final response = await myRepo.deleteUser(id);
    response.when(
      success: (response) {
        emit(Success(response));
      },
      failure: (error) {
        emit(Error(error));
      },
    );
  }
}

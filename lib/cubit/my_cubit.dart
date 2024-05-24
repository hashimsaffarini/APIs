import 'package:api_project/my_repo.dart';
import 'package:api_project/users.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_state.dart';

class MyCubit extends Cubit<MyState> {
  MyCubit(this.myRepo) : super(MyInitial());

  final MyRepo myRepo;

  void emitGetAllUsers() async {
    final users = await myRepo.getAllUsers();
    emit(GetAllUsers(users));
  }
  //  void emitGetAllUsers() async {
  //   myRepo.getAllUsers().then((users) {
  //     emit(GetAllUsers(users));
  //   });
  // }
}

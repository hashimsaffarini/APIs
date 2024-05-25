import 'package:api_project/users.dart';
import 'package:api_project/web_services.dart';

class MyRepo {
  final WebService webService;
  MyRepo(this.webService);

  Future<List<Users>> getAllUsers() async {
    final users = await webService.getAllUsers();
    return users.map((userData) => Users.fromJson(userData.toJson())).toList();
  }

  Future<Users> getUserById(int id) async {
    final user = await webService.getUserById(id);
    return Users.fromJson(user.toJson());
  }
}

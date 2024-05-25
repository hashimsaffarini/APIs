import 'package:api_project/users.dart';
import 'package:api_project/web_services.dart';

class MyRepo {
  final WebService webService;
  MyRepo(this.webService);

  Future<List<Users>> getAllUsers() async {
    final users = await webService.getAllUsers();
    return users;
  }

  Future<Users> getUserById(int id) async {
    final user = await webService.getUserById(id);
    return user;
  }

  Future<Users> createUser(Users user) async {
    final createdUser = await webService.createUser(user,
        'Bearer efd0cce3ae3d280057d2766522a27511d0f1515dc54a71083690ab82acbc715a');
    return createdUser;
  }
}

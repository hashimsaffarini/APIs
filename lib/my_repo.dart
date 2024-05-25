import 'package:api_project/api_error_handler.dart';
import 'package:api_project/api_result.dart';
import 'package:api_project/users.dart';
import 'package:api_project/web_services.dart';

class MyRepo {
  final WebService webService;
  MyRepo(this.webService);

  Future<ApiResult<List<Users>>> getAllUsers() async {
    try {
      final users = await webService.getAllUsers();
      return ApiResult.success(users);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<Users>> getUserById(int id) async {
    try {
      final user = await webService.getUserById(id);
      return ApiResult.success(user);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<Users>> createUser(Users user) async {
    try {
      final createdUser = await webService.createUser(user,
          'Bearer efd0cce3ae3d280057d2766522a27511d0f1515dc54a71083690ab82acbc715a');
      return ApiResult.success(createdUser);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<dynamic>> deleteUser(int id) async {
    try {
      final response = await webService.deleteUser(
        id,
        'Bearer efd0cce3ae3d280057d2766522a27511d0f1515dc54a71083690ab82acbc715a',
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}

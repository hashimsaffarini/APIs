import 'package:api_project/users.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
part 'web_services.g.dart';

@RestApi(baseUrl: "https://gorest.co.in/public/v2/")
abstract class WebService {
  factory WebService(Dio dio, {String baseUrl}) = _WebService;

  @GET("users")
  Future<List<Users>> getAllUsers();

  @GET("users/{id}")
  Future<Users> getUserById(@Path("id") int id);

  @POST("users")
  Future<Users> createUser(
    @Body() Users user,
    @Header("Authorization") String token,
  );
}

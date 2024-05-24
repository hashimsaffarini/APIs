import 'package:api_project/cubit/my_cubit.dart';
import 'package:api_project/my_repo.dart';
import 'package:api_project/web_services.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initGetIt() {
  getIt.registerLazySingleton<MyCubit>(() => MyCubit(getIt()));

  getIt.registerLazySingleton<MyRepo>(() => MyRepo(getIt()));

  getIt.registerLazySingleton<WebService>(() => WebService(Dio()));
}

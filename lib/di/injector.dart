import 'package:get_it/get_it.dart';
import 'package:flutter_application_1/domain/post_bloc.dart';
import '../data/service/api_service.dart';
import '../data/repo/post_repository.dart';

final sl = GetIt.instance;

void setupDI() {
  sl.registerLazySingleton(() => ApiService());
  sl.registerLazySingleton(() => PostRepository(sl()));
  sl.registerFactory(() => PostBloc(sl())); // ← now works
}

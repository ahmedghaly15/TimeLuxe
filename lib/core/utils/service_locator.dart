import 'package:get_it/get_it.dart';
import 'package:time_luxe/features/auth/sign_in/data/sign_in_repo_impl.dart';
import 'package:time_luxe/features/auth/sign_in/domain/sign_in_repo.dart';
import 'package:time_luxe/features/auth/sign_in/presentation/cubit/sign_in_cubit.dart';

final GetIt serviceLocator = GetIt.instance;

class ServiceLocator {
  void setupServiceLocators() {
    serviceLocator
        .registerLazySingleton<SignInViewRepo>(() => SignInViewRepoImpl());

    serviceLocator.registerFactory<SignInViewCubit>(
      () => SignInViewCubit(serviceLocator.get<SignInViewRepo>()),
    );
  }
}

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:sembast/sembast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:technologies_login_example/data/local/dataSources/user_dataSource.dart';
import 'package:technologies_login_example/data/network/apis/login/users_api.dart';
import 'package:technologies_login_example/data/network/dio_client.dart';
import 'package:technologies_login_example/data/network/rest_client.dart';
import 'package:technologies_login_example/data/sharedpref/shared_preference_helper.dart';
import 'package:technologies_login_example/di/modules/local_module.dart';
import 'package:technologies_login_example/di/modules/netwok_module.dart';
import 'package:technologies_login_example/di/modules/preference_module.dart';
import 'package:technologies_login_example/domain/repositories/user_repository.dart';
import 'package:technologies_login_example/domain/viewmodel/base_view_model.dart';
import 'package:technologies_login_example/domain/viewmodel/login_view_model.dart';
import 'package:technologies_login_example/domain/viewmodel/user_view_model.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  final gh = GetItHelper(getIt);

  // async singletons:----------------------------------------------------------
  getIt.registerSingletonAsync<SharedPreferences>(
      () => PreferenceModule.provideSharedPreferences());

  getIt.registerSingletonAsync<Database>(() => LocalModule.provideDatabase());
  // singletons:----------------------------------------------------------------
  getIt.registerSingleton(
      SharedPreferenceHelper(getIt.getAsync<SharedPreferences>()));
  getIt.registerSingleton<Dio>(
      NetworkModule.provideDio(getIt<SharedPreferenceHelper>()));
  getIt.registerSingleton(DioClient(getIt<Dio>()));
  getIt.registerSingleton(RestClient());
  // api's:---------------------------------------------------------------------
  getIt.registerSingleton(UsersApi(getIt<DioClient>()));
  getIt.registerSingleton(UserDataSource(getIt.getAsync<Database>()));
  // repository:----------------------------------------------------------------
  getIt.registerSingleton(UserRepository(
    getIt<UsersApi>(),
    getIt<UserDataSource>(),
  ));

  // view models:---------------------------------------------------------------
  getIt.registerFactory(() => BaseViewModel());
  getIt.registerFactory(() => LoginViewModel());
  getIt.registerFactory(() => UserViewModel());

}

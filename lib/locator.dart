import 'package:futsal/data/repository/post/login_repo.dart';
import 'package:futsal/provider/login_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locators = GetIt.instance;

void setup() async {
  final sharedPref = await SharedPreferences.getInstance();
  locators.registerLazySingleton(() => sharedPref);

  //model
  locators.registerLazySingleton<LoginRepo>(
      () => LoginRepo(sharedPref: locators()));

  //provider
  locators.registerLazySingleton(
      () => LoginProvider(loginRepo: locators()));
}

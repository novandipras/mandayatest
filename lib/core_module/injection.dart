import 'package:get_it/get_it.dart';
import 'package:mandayatest/core_module/bloc/map_expand_bloc/map_expand_bloc.dart';
import 'package:mandayatest/core_module/bloc/search_bloc/search_bloc.dart';
import 'package:mandayatest/core_module/routes/page_routes.dart';
import 'package:mandayatest/home_module/presentation/bloc/bottom_navbar_bloc/bottom_navbar_bloc.dart';
import 'package:mandayatest/home_module/presentation/bloc/explore_screen_bloc/explore_screen_bloc.dart';

GetIt locator = GetIt.instance;

void initInjector() {
  ///ROUTES
  locator.registerLazySingleton(() => PageRoutes());

  ///BLOC
  locator.registerFactory(() => BottomNavbarBloc());
  locator.registerFactory(() => ExploreScreenBloc());
  locator.registerFactory(() => MapExpandBloc());
  locator.registerFactory(() => SearchBloc());
  // locator.registerFactory(() => RegisterBloc(locator()));
  // locator.registerFactory(() => LoginBloc(locator()));
  // locator.registerFactory(() => AktifitasSheetBloc(locator()));
  // locator.registerFactory(() => AddWalletBloc(locator()));
  //
  // ///USECASE
  // locator.registerLazySingleton(() => AuthUsecase(locator()));
  // locator.registerLazySingleton(() => HomeUsecase(locator()));
  // locator.registerLazySingleton(() => WalletUsecase(locator()));
  //
  // ///REPOSITORY
  // locator.registerLazySingleton<AuthDomainRepository>(
  //     () => AuthDataRepositoryImpl(authDataRemoteDatasource: locator()));
  //
  // locator.registerLazySingleton<HomeRepository>(
  //     () => HomeRepositoryImpl(homeRemoteDatasource: locator()));
  //
  // locator.registerLazySingleton<WalletRepository>(
  //     () => WalletRepositoryImpl(walletRemoteDatasource: locator()));
  //
  // ///REMOTEDATASOURCE
  // locator.registerLazySingleton<AuthDataRemoteDatasource>(
  //     () => AuthDataRemoteDatasourceImpl());
  //
  // locator.registerLazySingleton<HomeRemoteDatasource>(
  //     () => HomeRemoteDatasourceImpl());
  //
  // locator.registerLazySingleton<WalletRemoteDatasource>(
  //     () => WalletRemoteDatasourceImpl());
}

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../screens/take_id_card_screens/logic/id_card_cubit.dart';

GetIt locator = GetIt.instance;

Future setupLocator() async {
  locator.registerLazySingleton(() => Dio());
  locator.registerLazySingleton<IdCardCubit>(() => IdCardCubit());
}

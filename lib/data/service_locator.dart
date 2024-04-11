import 'package:flutter_application_1/data/data_repository.dart';
import 'package:flutter_application_1/data/http_service.dart';
import 'package:flutter_application_1/data/local_storage.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.I;

void setupLocator() {
  getIt.registerSingleton<DataRepository>(DataRepository());
  getIt.registerSingleton<HttpService>(HttpService());
  getIt.registerSingletonAsync<SharedPrefs>(() async {
    final prefs = SharedPrefs();
    await prefs.init();
    return prefs;
  });
}

DataRepository dataRepository = getIt.get<DataRepository>();
HttpService httpService = getIt.get<HttpService>();
Future<SharedPrefs> sharedPrefs = getIt.getAsync<SharedPrefs>();

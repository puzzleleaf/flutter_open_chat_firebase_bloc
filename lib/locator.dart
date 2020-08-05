import 'package:get_it/get_it.dart';
import 'package:open_chat/services/auth_service.dart';
import 'package:open_chat/services/chat_service.dart';
import 'package:open_chat/services/repository_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => RepositoryService());
  locator.registerLazySingleton(() => ChatService());
}
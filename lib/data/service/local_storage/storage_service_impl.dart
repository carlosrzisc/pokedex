import 'package:injectable/injectable.dart';
import 'package:pokedex/domain/service/local_storage/app_storage_abstr.dart';
import 'package:pokedex/domain/service/local_storage/storage_event.dart';
import 'package:pokedex/domain/service/local_storage/storage_keys.dart';
import 'package:pokedex/domain/service/local_storage/storage_service_abstr.dart';

@LazySingleton(as: StorageService)
class StorageServiceImpl implements StorageService {
  const StorageServiceImpl(this.appStorage);
  final AppStorage appStorage;

  @override
  StorageEvent<String> get authToken => StorageEvent<String>(
        appStorage: appStorage,
        key: StorageKeys.authToken,
      );

  @override
  StorageEvent<String> get language => StorageEvent<String>(
        appStorage: appStorage,
        key: StorageKeys.language,
      );
}

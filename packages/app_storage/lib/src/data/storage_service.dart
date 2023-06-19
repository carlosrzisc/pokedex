import 'package:app_storage/src/domain/app_storage_abstr.dart';
import 'package:app_storage/src/domain/storage_event.dart';
import 'package:app_storage/src/domain/storage_keys.dart';
import 'package:app_storage/src/domain/storage_service_abstr.dart';

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

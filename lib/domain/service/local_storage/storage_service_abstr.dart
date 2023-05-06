import 'package:pokedex/domain/service/local_storage/storage_event.dart';

abstract class StorageService {
  StorageEvent<String> get authToken;
  StorageEvent<String> get language;
}

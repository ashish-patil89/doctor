import 'package:api_client/api_client.dart' hide TokenStorage;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:persistent_storage/persistent_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_repository/user_repository.dart';

import 'app/view/app.dart';
import 'bootstrap/bootstrap_io.dart';

void main() {
  bootstrap(({
    required FlutterSecureStorage secureStorage,
    required SharedPreferences sharedPreferences,
  }) async {
    final apiClient = ApiClient(
      orbOriginUrl: '',
      orbUploadUrl: '',
      orbApiBaseUrl: '',
      orbAccessToken: '',
      appVersion: '0.0.1',
    );

    final userRepository = UserRepository(
      apiClient: apiClient,
      storage: PersistentStorage(
        sharedPreferences: sharedPreferences,
      ),
    );

    return App(
      userRepository: userRepository,
    );
  });
}

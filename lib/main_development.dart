import 'package:api_client/api_client.dart' hide TokenStorage;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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
      orbOriginUrl: 'https://doctor-backend-uh4gjizycq-uc.a.run.app/',
      orbUploadUrl: '',
      orbApiBaseUrl: 'https://doctor-backend-uh4gjizycq-uc.a.run.app/',
      orbAccessToken: '',
      appVersion: '0.0.1',
    );

    final userRepository = UserRepository(
      apiClient: apiClient,
    );

    return App(
      userRepository: userRepository,
    );
  });
}

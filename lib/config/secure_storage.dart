import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static const String accessTokenKey = 'access_token';
  static const String accessTokenExpirationDateTimeKey =
      'access_token_expiration_datetime';
  static const String refreshTokenKey = 'refresh_token';
  static const String refreshTokenExpirationDateTimeKey =
      'refresh_token_expiration_datetime';

  final flutterSecureStorage = FlutterSecureStorage();
  //SecureStorageService(this.flutterSecureStorage);
  Future<String> getAccessToken() {
    return flutterSecureStorage.read(key: accessTokenKey);
  }

  Future<void> saveAccessToken(String accessToken) {
    //print('save');
    return flutterSecureStorage.write(key: accessTokenKey, value: accessToken);
  }

  Future<DateTime> getAccessTokenExpirationDateTime() async {
    final String iso8601ExpirationDate =
        await flutterSecureStorage.read(key: accessTokenExpirationDateTimeKey);
    if (iso8601ExpirationDate == null) {
      return null;
    }
    
    return DateTime.parse(iso8601ExpirationDate);
  }

  Future<void> saveAccessTokenExpiresIn(
      String accessTokenExpirationDateTime) {
    //DateTime today = DateTime.now();
    //print(today);
    //print(accessTokenExpirationDateTime);
    return flutterSecureStorage.write(
        key: accessTokenExpirationDateTimeKey,
        value:accessTokenExpirationDateTime); 
        //accessTokenExpirationDateTime.toIso8601String());
  }

  Future<String> getRefreshToken() {
    return flutterSecureStorage.read(key: refreshTokenKey);
  }

  Future<void> saveRefreshToken(String refreshToken) {
    return flutterSecureStorage.write(
        key: refreshTokenKey, value: refreshToken);
  }

  Future<void> saveRefreshTokenExpiresIn(
      String refreshTokenExpirationDateTime) {
    return flutterSecureStorage.write(
        key: refreshTokenExpirationDateTimeKey,
        value: refreshTokenExpirationDateTime);//TokenExpirationDateTime.toIso8601String());
  }

  Future<DateTime> getRefreshTokenExpirationDateTime() async {
    final String iso8601ExpirationDate =
        await flutterSecureStorage.read(key: refreshTokenExpirationDateTimeKey);
    if (iso8601ExpirationDate == null) {
      return null;
    }
    return DateTime.parse(iso8601ExpirationDate);
  }

  Future<void> deleteAll() {
    return flutterSecureStorage.deleteAll();
  }
}

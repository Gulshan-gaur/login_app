import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:chestX/config/secure_storage.dart';
import 'package:http/http.dart' as http;

final SecureStorageService secureStorageService = SecureStorageService();

Future<String> getValidAccessToken() async {
  final DateTime expirationDate =
      await secureStorageService.getAccessTokenExpirationDateTime();
  //print(expirationDate);
  if (DateTime.now()
      .isBefore(expirationDate.subtract(const Duration(minutes: 1)))) {
    print('we are here0');
    return secureStorageService.getAccessToken();
  }
  return _refreshAccessToken();
}

Future<String> _refreshAccessToken() async {
  final DateTime expirationDateRefresh =
      await secureStorageService.getRefreshTokenExpirationDateTime();
  //print('here1');
  if (DateTime.now()
      .isBefore(expirationDateRefresh.subtract(const Duration(minutes: 1)))) {
    return refreshAccessExpireToken();
  }
  final String refreshToken = await secureStorageService.getRefreshToken();
  final response = await http
      .post(Uri.parse('http://127.0.0.1:5000/refreshtokens'), headers: {
    HttpHeaders.authorizationHeader: 'Bearer $refreshToken',
  });
  final responseJson = jsonDecode(response.body);
  await secureStorageService.saveAccessToken(responseJson['access_token']);
  await secureStorageService
      .saveAccessTokenExpiresIn(responseJson['expire_access_token']);
  return responseJson['access_token'];
}

Future<String> refreshAccessExpireToken() async {
  //secureStorageService.deleteAll();
  final storedRefreshToken = await secureStorageService.getRefreshToken();
  //print(storedRefreshToken);
  if (storedRefreshToken == null) return null;
  try {
    //print('here2');
    final response = await http.post(
        Uri.parse(
            'http://127.0.0.1:5000/accessrefreshtokens'), //Route will change
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $storedRefreshToken',
        });
    if (response.statusCode == 200) {
      final responseJson = jsonDecode(response.body);
      print(responseJson);
      final accessToken = responseJson['access_token'];
      final refreshToken = responseJson['refresh_token'];

      secureStorageService.saveAccessToken(accessToken);
      await secureStorageService
          .saveAccessTokenExpiresIn(responseJson['expire_access_token']);
      secureStorageService.saveRefreshToken(refreshToken);
      await secureStorageService
          .saveRefreshTokenExpiresIn(responseJson['expire_refresh_token']);
      return accessToken;
    }
  } catch (e, s) {
    print('error on refresh token: $e - stack: $s');
  }
  return null; //error Handling
}

void logoutAction() async {
  await secureStorageService.deleteAll();
}

/*@override
  /// For Spalsh Screen everytime App restart initAction() calls
  void initState() {
    initAction();
    //super.initState();
  }

  void initAction() async {
    final storedRefreshToken = await secureStorageService.getRefreshToken();
    if (storedRefreshToken == null) return;

    setState(() {
      isBusy = true;
    });

    try {
      final response = await http.get(
        Uri.parse('http://127.0.0.1:5000/refreshtokens'), //Route will change
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $storedRefreshToken',
      });

      final responseJson = jsonDecode(response.body);
      final accessToken = responseJson['access_token'];
      final refreshToken = responseJson['refresh-token'];

      secureStorageService.saveAccessToken(accessToken);
      secureStorageService.saveRefreshToken(refreshToken);


      setState(() {
        isBusy = false;
        isLoggedIn = true;
        name = idToken['name'];
        picture = profile['picture'];
      });
    } catch (e, s) {
      print('error on refresh token: $e - stack: $s');
    }
  }

void logoutAction() async {
    await secureStorageService.deleteAll();
}
*/

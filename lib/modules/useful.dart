import 'package:chestX/config/secure_storage.dart';



SecureStorageService secureStorageService = SecureStorageService();


Future<String> getValidAccessToken() async {
    final DateTime expirationDate =
        await secureStorageService.getAccessTokenExpirationDateTime();
    if (DateTime.now()
        .isBefore(expirationDate.subtract(const Duration(minutes: 1)))) {
      return secureStorageService.getAccessToken();
    }
    return _refreshAccessToken();
  }
Future<String> _refreshAccessToken() async {
    //final String refreshToken = await secureStorageService.getRefreshToken();
    /*final TokenResponse response = await appAuth.token(TokenRequest(
        clientId, redirectUrl,
        issuer: issuer, refreshToken: refreshToken));*/
    //await secureStorageService.saveAccessToken(response.accessToken);
    //await secureStorageService
    //    .saveAccessTokenExpiresIn(response.accessTokenExpirationDateTime);
    //await secureStorageService.saveRefreshToken(response.refreshToken);
    //return response.accessToken;
  //}
}

/*
@override
  void initState() {
    initAction();
    super.initState();
  }

  void initAction() async {
    final storedRefreshToken = await secureStorage.read(key: 'refresh_token');
    if (storedRefreshToken == null) return;

    setState(() {
      isBusy = true;
    });

    try {
      final response = await appAuth.token(TokenRequest(
        AUTH0_CLIENT_ID,
        AUTH0_REDIRECT_URI,
        issuer: AUTH0_ISSUER,
        refreshToken: storedRefreshToken,
      ));

      final idToken = parseIdToken(response.idToken);
      final profile = await getUserDetails(response.accessToken);

      secureStorage.write(key: 'refresh_token', value: response.refreshToken);

      setState(() {
        isBusy = false;
        isLoggedIn = true;
        name = idToken['name'];
        picture = profile['picture'];
      });
    } catch (e, s) {
      print('error on refresh token: $e - stack: $s');
      logoutAction();
    }
  }

void logoutAction() async {
    await secureStorage.delete(key: 'refresh_token');
    setState(() {
      isLoggedIn = false;
      isBusy = false;
    });
}
*/
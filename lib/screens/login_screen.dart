import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:chestX/modules/query_mutation.dart';
import 'package:chestX/widgets/login_widgets.dart';
import 'package:chestX/screens/chestX_test_screen.dart';
import 'package:chestX/homepage.dart';
import 'package:chestX/screens/records_screen.dart';
import 'package:chestX/screens/subscription_details.dart';
import 'package:chestX/config/secure_storage.dart';

final SecureStorageService secureStorageService = SecureStorageService();

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Login> {
  //bool loginFail = false;
  //WidgetsBinding.instance.addPostFrameCallback((_) => initMethod(context));
  TextStyle style = TextStyle(fontSize: 14.0, color: Colors.red.shade800);

  //GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87, //grey.shade700,
        body: Mutation(
            options: MutationOptions(
                document: gql(loginMutation),
                update: (GraphQLDataProxy cache, QueryResult result) {
                  if (result.hasException) {
                    //if (result.exception.linkException!=null){
                    //  return Text('Internet is Not Connected');
                    // }
                    //print(result);
                    // setState(() {
                    //  loginFail = true;
                    //});

                    print(result.exception.graphqlErrors[0].message);
                  }
                  if (result.data != null) {
                    final accessToken =
                        result.data["login_user"]["access_token"];
                    final refreshToken =
                        result.data["login_user"]["refresh_token"];
                    //print(result.data);
                    secureStorageService.saveAccessToken(accessToken);
                    secureStorageService.saveAccessTokenExpiresIn(
                        result.data["login_user"]['expire_access_token']);
                    secureStorageService.saveRefreshToken(refreshToken);
                    secureStorageService.saveRefreshTokenExpiresIn(
                        result.data["login_user"]['expire_refresh_token']);

                    print(result.data["login_user"]["access_token"]);
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => ChestX()));
                  }
                  return cache;
                },
                onCompleted: (dynamic resultData) async {
                  // print('Completed');
                  setState(() {
                    loginUserIdFail = false;
                    loginPasswordFail = false;
                  });
                  //WidgetsBinding.instance.addPostFrameCallback((_){}
                },
                onError: (dynamic resultData) async {
                  if (resultData.linkException != null) {
                    return Text('Internet is not working');
                  } else {
                    String error = resultData.graphqlErrors[0].message;
                    if (error == 'password not Match') {
                      setState(() {
                        loginPasswordFail = true;
                      });
                    } else {
                      setState(() {
                        loginUserIdFail = true;
                      });
                    }
                    //Navigator.of(context).pop();
                  }
                }),
            builder: (RunMutation runMutation, QueryResult result) {
              /*if (result.hasException) {
                //print('exception');
                print(result.exception.graphqlErrors[0].message);
              }*/
              return Padding(
                  padding: EdgeInsets.zero,
                  child: Row(children: <Widget>[
                    Expanded(
                        child: Container(
                            height: MediaQuery.of(context).size.height,
                            color: Colors.black87, //grey.shade700,
                            child:
                                Image(image: AssetImage('images/login.gif')))),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                    ),
                    Wrap(
                      direction: Axis.horizontal,
                      children :[
                        Expanded(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                          Container(
                            height: 170.0,
                            width: 170.0,
                            child: Align(
                              alignment: Alignment.topRight,
                              child:
                                  Image(image: AssetImage('images/logo.png')),
                            ),
                          ),
                          SizedBox(height: 40.0),
                          SizedBox(
                              height: 65.0,
                              width: MediaQuery.of(context).size.width / 3.0,
                              child: emailField),
                          Container(
                              child: loginUserIdFail
                                  ? Text('UserID not match', style: style)
                                  : null),
                          SizedBox(
                              height: 65.0,
                              width: MediaQuery.of(context).size.width / 3.0,
                              child: passwordField),
                          Container(
                              child: loginPasswordFail
                                  ? Text('Password not match', style: style)
                                  : null),
                          Container(
                              child: result.isLoading
                                  ? CircularProgressIndicator()
                                  : null),
                          Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(20.0),
                            //color: Color(0xff01A0C7),
                            color: Colors.lightBlue,
                            child: MaterialButton(
                              minWidth:
                                  MediaQuery.of(context).size.width / 10.0,
                              padding:
                                  EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              onPressed: () => runMutation({
                                'userid': userIdController.text,
                                'password': passwordController.text
                              }),
                              child: Text("Login",
                                  textAlign: TextAlign.center,
                                  style: style.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          //Container(
                          //  child :CircularProgressIndicator(),
                          //),
                          SizedBox(height: 15.0),
                          Text('@Powered By Friday',
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                  fontSize: 10.0))
                        ]))]),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                    )
                  ]));
            }));
  }
}
// use bool loginfail = false in login widget and when error set state true
// then if login fail? 'error':null

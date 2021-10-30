import 'package:flutter/material.dart';
import 'package:chestX/homepage.dart';
//import 'package:chestX/config/graphl_client.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:chestX/modules/query_mutation.dart';
import 'package:chestX/widgets/login_widgets.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Login> {
  TextStyle style = TextStyle(fontSize: 16.0, color: Colors.grey.shade800);

  //GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade700,
        body: Stack(children: <Widget>[
          Mutation(
              options: MutationOptions(
                  document: gql(loginMutation),
                  update: (GraphQLDataProxy cache, QueryResult result) {
                    return cache;
                  },
                  onCompleted: (dynamic resultData) async {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => MyHomePage()));
                    print(resultData);
                  },
                  onError: (dynamic resultData) async {
                    if (resultData.linkException!=null){
                      return ('Internet is not working');
                    }
                    else{
                      Navigator.of(context).pop();
                      print(resultData.graphqlErrors[0].message);
                    }
                  }),
              builder: (RunMutation runMutation, QueryResult result) {
               /* if (result.hasException) {
                   //if (result.exception.linkException!=null){
                    //  return Text('Internet is Not Connected');
                   // }
                  print(result.exception);
                  //print(result.exception.graphqlErrors[0].message);
                }*/
                if (result.isLoading) {
                  print(Text('Loding'));
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (!result.hasException) {
                  print(result.data);
                }
                return Padding(
                    padding: EdgeInsets.zero,
                    child: Row(children: <Widget>[
                      Expanded(
                          child: Container(
                              height: MediaQuery.of(context).size.height,
                              color: Colors.grey.shade700,
                              child: Image(
                                  image: AssetImage('images/login.gif')))),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                      ),
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
                            SizedBox(
                                height: 65.0,
                                width: MediaQuery.of(context).size.width / 3.0,
                                child: passwordField),
                            SizedBox(height: 4.0,child: CircularProgressIndicator()),
                            //loginButon,
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
                                onPressed: () => runMutation(
                                  {
                                    'userid': userIdController.text,
                                    'password': passwordController.text
                                  },
                                ),
                                child: Text("Login",
                                    textAlign: TextAlign.center,
                                    style: style.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            SizedBox(height: 15.0),
                            Text('@Powered By Friday',
                                style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                    fontSize: 10.0))
                          ])),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                      )
                    ]));
              })
        ]));
  }
}
/*
TextEditingController txtId = TextEditingController();

                           TextField(
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 16.0,
                        ),
                        decoration: InputDecoration(
                        labelText: "User ID",
                        labelStyle: TextStyle(color: Colors.purple),
                         //border: UnderlineInputBorder(),
                        border: OutlineInputBorder(),
                       )
                    ),

login BUtton
final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(20.0),
      //color: Color(0xff01A0C7),
      color: Colors.black87,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width / 10.0,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => MyHomePage())),
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );                    
                  */

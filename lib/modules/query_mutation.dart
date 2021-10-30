//(\$email: String, \$password: String)
final loginMutation = '''
    mutation(\$userid: String!, \$password: String!){
      login_user(userid: \$userid, password: \$password){

      access_token

      refresh_token
    }

  }
  ''';
String getAll() {
    return '''

{

persons{

id

name

lastName

age

}

}

''';
  }

  String deletePerson(id) {
    return '''

mutation{

deletePerson(id: “$id”){

id

}

}

''';
  }

  String editPerson(String id, String name, String lastName, int age) {
    return '''

mutation{

editPerson(id: “$id”, name: “$name”, lastName: “$lastName”, age: $age){

name

lastName

}

}

''';
}

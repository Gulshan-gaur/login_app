//(\$email: String, \$password: String)
final loginMutation = '''
  mutation(\$userid: String!, \$password: String!){
    login_user(userid: \$userid, password: \$password){
      access_token
      refresh_token
      expire_access_token
      expire_refresh_token
    }

  }
  ''';

final recentPatients = '''
  query(\$user:String){
    recent_patients(user:\$user){
      recentpatients
    }
  }
''';

final subscriptionData = '''
  query(\$user:String!){
    hospital_data(user:\$user){
      id
      hospitalname
      userid
      email
      subscription
      plan_name
      subscription_date
      expiredat
    }
  }
''';
final uploadData='''
  mutation(\$file:Upload!,\$data:Upload!){
    upload_image(file:\$file,data:\$data){
      patientid
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

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:chestX/modules/query_mutation.dart';


class PredictionScreen extends StatefulWidget {
  PredictionScreen({Key key, @required this.patinetId}) : super(key: key);

  final String patinetId;

  @override
  _PredictionScreenState createState() => _PredictionScreenState();
}

class _PredictionScreenState extends State<PredictionScreen>{

  @override
  Widget build(BuildContext context) {

  }
}
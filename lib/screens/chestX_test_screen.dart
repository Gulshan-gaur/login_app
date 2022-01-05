import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
//mport 'package:percent_indicator/percent_indicator.dart';
import 'package:chestX/modules/query_mutation.dart';
import 'package:chestX/config/graphql_client.dart';
import 'package:chestX/widgets/chestX_widgets.dart';
//import 'package:chestX/widgets/progress_bar.dart';
import 'package:chestX/widgets/drawer_class.dart';
import 'package:chestX/screens/predictionResult.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

final GraphQLClient client = GraphQLConfiguration().clientToQuery();

class ChestX extends StatefulWidget {
  ChestX({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ChestXScreenState createState() => _ChestXScreenState();
}

class _ChestXScreenState extends State<ChestX> {
  double progress = 0.0;
  String path;
  bool isLoading;
  var imageFile;

  uploadFile() async {
    var dataField = {
    'firstname': fnameController.text,
    'lastname': lnameController.text,
    'gender': genController.text,
    'age': ageController.text,
    'position': posController.text
  };
    var multipartFile = await http.MultipartFile.fromPath('chestx_image', path);
    final QueryResult result = await client.mutate(
      MutationOptions(
          document: gql(uploadData),
          variables: {'file': multipartFile, 'data': dataField}),
    );
    if (result.hasException) {
      print(result.exception);
    }
    if (result.isLoading != null) {
      setState(() {
        isLoading = true;
      });
     // return CircularProgressIndicator();
    }
    if (result.data != null) {
      //Navigator.of(context).pushReplacement(MaterialPageRoute(
      //    builder: (BuildContext context) => PredictionScreen(patinetId:result.data,)));
      print(result.data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text('ChestX'),
      ),
      drawer: DrawerScreen(title: 'Friday'),
      body: InkWell(
          child: Padding(
              padding: EdgeInsets.zero,
              child: Wrap(
                direction: Axis.horizontal,
                children:[
                  Row(
                children: <Widget>[
                  Expanded(
                    //child: ImageUploader()
                    child: Column(
                      children: <Widget>[
                        //FadeInImage(image: Image.file(new File(path)), placeholder: AssetImage(assetName))
                        SizedBox(height: 15.0),
                        Container(
                            height: 150,
                            width: 150,
                            child: //path == null
                                //? Text('Uploading') //placeholder
                                LiquidCircularProgressIndicator(
                                 value: progress/100,
                                 valueColor: AlwaysStoppedAnimation(Colors.redAccent), // Defaults to the current Theme's accentColor.
                                 backgroundColor: Colors.black12, // Defaults to the current Theme's backgroundColor.
                                 borderColor: Colors.black12,
                                 borderWidth: 0.0,
                                 direction: Axis.vertical, 
// The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
                                 center: Text("$progress%"),
                                ),
                            ),
                        SizedBox(height:100),
                        Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(20.0),
                          //color: Color(1xff01A0C7),
                          color: Colors.lightBlue,
                          child: MaterialButton(
                            minWidth: MediaQuery.of(context).size.width / 150.0,
                            padding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            onPressed: () => uploadImage(),
                            child: Text("File Upload",
                                textAlign: TextAlign.center,
                                style: style.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),

                          ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  Expanded(
                      child: Padding(
                          padding: EdgeInsets.all(40.0),
                          child: Wrap(
                            children :[
                              Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Column(children: <Widget>[
                                  Container(
                                      height: 90.0,
                                      width: MediaQuery.of(context).size.width /
                                          5.0,
                                      child: nameField),
                                  SizedBox(
                                      height: 50.0,
                                      width: MediaQuery.of(context).size.width /
                                          5.0,
                                      child: ageField),
                                  SizedBox(height: 40.0),
                                  Container(
                                      height: 90.0,
                                      width: MediaQuery.of(context).size.width /
                                          5.0,
                                      child: positionField),
                                ]),
                                SizedBox(height:100),
                                Padding(
                                  padding: EdgeInsets.all(20.0),
                                ),
                                Column(children: <Widget>[
                                  Container(
                                      height: 90.0,
                                      width: MediaQuery.of(context).size.width /
                                          5.0,
                                      child: lastnameField),
                                  SizedBox(
                                      height: 50.0,
                                      width: MediaQuery.of(context).size.width /
                                          5.0,
                                      child: genderField),
                                  SizedBox(height: 150.0),
                                  Material(
                                      elevation: 5.0,
                                      borderRadius: BorderRadius.circular(20.0),
                                      //color: Color(1xff01A0C7),
                                      color: Colors.lightBlue,
                                      child: MaterialButton(
                                        minWidth:
                                            MediaQuery.of(context).size.width /
                                                150.0,
                                        padding: EdgeInsets.fromLTRB(
                                            20.0, 15.0, 20.0, 15.0),
                                    
                                        onPressed: () => uploadFile(),
                                        child: Text("Submit",
                                            textAlign: TextAlign.center,
                                            style: style.copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold)),
                                      ))
                                ]),
                                /*Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(20.0),
                          //color: Color(1xff01A0C7),
                          color: Colors.lightBlue,
                          child: MaterialButton(
                            minWidth: MediaQuery.of(context).size.width / 150.0,
                            padding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            onPressed: () => uploadFile(),
                            child: Text("Submit",
                                textAlign: TextAlign.center,
                                style: style.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),

                          )),*/
                              ])]))
                  )],
              )]))),
      /*floatingActionButton: FloatingActionButton.extended(
        heroTag: 'picker',
        elevation: 0,
        backgroundColor: Colors.tealAccent[400],
        hoverElevation: 0,
        label: Row(
          children: <Widget>[
            Icon(Icons.file_upload),
            SizedBox(width: 10),
            Text('Upload Image')
          ],
        ),
        onPressed: () => uploadImage(),
      ),*/
      //floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }

  uploadImage() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ['png', 'jpg', 'dcm']);

    if (result != null) {
      PlatformFile file = result.files.first;
      setState(() {
        progress = 0.0;
      });
      setState(() {
        path = file.path;
        Timer timer;
        timer = Timer.periodic(Duration(milliseconds: 1000), (_) {
          setState(() {
            progress += 5;
            if (progress >= 100) {
              timer.cancel();
            }
          });
        });
        //fileSize = file.size;
        imageFile = Image(image: FileImage(File(path)));
      });
    } else {
      // User canceled the picker
      ///Image(image: FileImage(File(path)))
    }
  }
}
/*Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(20.0),
                          //color: Color(0xff01A0C7),
                          color: Colors.lightBlue,
                          child: MaterialButton(
                            minWidth: MediaQuery.of(context).size.width / 50.0,
                            padding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        RecordsScreen())),
                            child: Text("File Upload",
                                textAlign: TextAlign.center,
                                style: style.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),

                          )),
        }
      });
    }*/

/*
/*
                                CircularPercentIndicator(
                              radius: 100,
                              lineWidth: 5.0,
                              animation: true,
                              percent: progress / 100,
                              center: new Text('$progress%'),
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Colors.blue,
                            )*///progressIndicatior() //Image(image: FileImage(File(path))),
floatingActionButton: Stack(children: <Widget>[
          Align(
              alignment: Alignment.bottomLeft,
              child: FloatingActionButton.extended(
                heroTag: 'picker',
                elevation: 0,
                backgroundColor: Colors.tealAccent[400],
                hoverElevation: 0,
                label: Row(
                  children: <Widget>[
                    Icon(Icons.file_upload),
                    SizedBox(width: 10),
                    Text('Upload Image')
                  ],
                ),
                onPressed: () => uploadImage(),
              )),
          //floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton.extended(
                heroTag: 'Submit',
                elevation: 0,
                backgroundColor: Colors.tealAccent[400],
                hoverElevation: 0,
                label: Row(
                  children: <Widget>[
                    Icon(Icons.file_upload),
                    SizedBox(width: 10),
                    Text('Submit')
                  ],
                ),
                onPressed: () => {},
              ))
        ])
*/

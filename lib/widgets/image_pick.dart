import 'dart:io';
//import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ImageUploader extends StatefulWidget {
  @override
  _ImageUploaderState createState() => _ImageUploaderState();
}

class _ImageUploaderState extends State<ImageUploader> {
  //Uint8List imagevalue;
  String path;
  var placeholder = Image(image: AssetImage('images/logo.png'));

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      //backgroundColor: Colors.black87,
      body: Container(
        width: width,
        child: Column(
          children: <Widget>[
            //FadeInImage(image: Image.file(new File(path)), placeholder: AssetImage(assetName))
            Container(
              height: 450,
              width: 450,
              child: path == null ? placeholder
                      : Image(image: FileImage(File(path))),
            )
            // : DecorationImage(
            //     fit: BoxFit.cover,
            //     image: Image.memory(imagevalue).image)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
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
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
    );
  }

  uploadImage() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ['png', 'jpg', 'dcm']);

    if (result != null) {
      PlatformFile file = result.files.first;

      setState(() {
        path = file.path;
      });
    } else {
      // User canceled the picker
      ///Image(image: FileImage(File(path)))
    }
  }
}

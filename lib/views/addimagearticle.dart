import 'dart:math';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class uploadphotoArticle extends StatefulWidget {
  uploadphotoArticle();

  @override
  _uploadphotoArticle createState() => _uploadphotoArticle();
}

class _uploadphotoArticle extends State<uploadphotoArticle> {
  _uploadphotoArticle();
  String? sId;
  String? _dropDownValue1;
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    final _addFormKey = GlobalKey<FormState>();

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('upload photo'),
      ),
      body: Form(
        key: _addFormKey,
        child: Center(
          child: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.all(20.0),
                child: Card(
                    child: Container(
                  padding: EdgeInsets.all(10.0),
                  width: 440,
                  child: Column(
                    children: <Widget>[
                      if (imageFile != null)
                        Container(
                          width: 300,
                          height: 300,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            image: DecorationImage(
                                image: FileImage(imageFile!),
                                fit: BoxFit.cover),
                            border: Border.all(width: 8, color: Colors.black),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        )
                      else
                        Container(
                          width: 300,
                          height: 300,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            border: Border.all(width: 8, color: Colors.black12),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: const Text(
                            'Image field',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                   primary: Colors.red,
                                    fixedSize: const Size(300, 30),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50))),
                                icon: const Icon(Icons.camera_alt_outlined),
                                onPressed: () =>
                                    getImage(source: ImageSource.camera),
                                label: const Text('Camera',
                                    style: TextStyle(fontSize: 18))),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: ElevatedButton.icon(
                              
                              style: 
                              ElevatedButton.styleFrom(
                                   primary: Colors.purple,
                                    fixedSize: const Size(300, 30),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50))),
                                icon: const Icon(Icons.folder_outlined),
                                onPressed: () =>
                                    getImage(source: ImageSource.gallery),
                                label: const Text('Dossier',
                                    style: TextStyle(fontSize: 18))),
                          )
                        ],
                      ),
                      Container(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                           ElevatedButton.icon(
                              
                              style: 
                              ElevatedButton.styleFrom(
                                   primary: Colors.blueAccent,
                                    fixedSize: const Size(150, 30),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50))),
                                icon: const Icon(Icons.check),
                                onPressed: () =>{},
                                   
                                label: const Text('Valider',
                                    style: TextStyle(fontSize: 18))),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))),
          ),
        ),
      ),
    );
  }

  void getImage({required ImageSource source}) async {
    final file = await ImagePicker().pickImage(
        source: source,
        maxWidth: 640,
        maxHeight: 480,
        imageQuality: 70 //0 - 100
        );

    if (file?.path != null) {
      setState(() {
        imageFile = File(file!.path);
      });
    }
  }
}

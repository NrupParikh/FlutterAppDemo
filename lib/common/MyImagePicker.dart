import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class MyImagePicker extends StatefulWidget {
  const MyImagePicker({super.key});

  @override
  State<MyImagePicker> createState() => _MyImagePickerState();
}

// Reference : https://www.youtube.com/watch?v=IePaAGXzmtU
class _MyImagePickerState extends State<MyImagePicker> {
  File? _image;

  Future getImage(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image == null) return;

      // final imageTmp = File(image.path);
      final imagePermanent = await saveFilePermanently(image.path);
      setState(() {
        // _image = imageTmp;
        _image = imagePermanent;
      });
    } on PlatformException catch (e) {
      print("Failed to pick image : $e");
    }
  }

  Future<File> saveFilePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(image.path);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          _image != null
              ? Image.file(
                  _image!,
                  width: 250,
                  height: 250,
                  fit: BoxFit.cover,
                )
              : Image.network("https://picsum.photos/250?image=9"),
          const SizedBox(
            height: 40,
          ),
          TextButton(
              onPressed: () {
                getImage(ImageSource.gallery);
              },
              child: const Text(
                "Pick from Gallery",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.green),
              )),
          TextButton(
              onPressed: () {
                getImage(ImageSource.camera);
              },
              child: const Text(
                "Pick from Camera",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.green),
              )),
        ],
      ),
    );
  }
}

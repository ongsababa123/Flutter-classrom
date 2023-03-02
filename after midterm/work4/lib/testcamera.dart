import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:barcode_scan2/barcode_scan2.dart';

class TestCamera extends StatefulWidget {
  String title;

  TestCamera({super.key, required this.title});

  @override
  State<TestCamera> createState() => _TestCameraState();
}

class _TestCameraState extends State<TestCamera> {
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  String mpath = "";
  String result = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(children: [
        TextButton(
          onPressed: () {
            filePicker();
          },
          child: const Text("Take A Photo"),
        ),
        ElevatedButton.icon(
            onPressed: () {
              _scanQR();
            },
            icon: const Icon(Icons.qr_code_2),
            label: Text("Scan")),
        const SizedBox(height: 20),
        image == null
            ? const Text("Image Here")
            : Image.file(File(image!.path), width: 250),
        Text(mpath),
        Text(result)
      ]),
    );
  }

  void filePicker() async {
    final XFile? selectImage =
        await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      mpath = selectImage!.path;
      image = selectImage;
    });
  }

  Future _scanQR() async {
    try {
      ScanResult qrResult = await BarcodeScanner.scan();
      setState(() {
        result = qrResult.rawContent;
      });
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          result = "Camera permission was denied";
        });
      } else {
        setState(() {
          result = "Unknown an Error $e";
        });
      }
    } on FormatException {
      setState(() {
        result = "You pressed the back button before scanning";
      });
    } catch (e) {
      result = "Unknown an Error $e";
    }
  }
}

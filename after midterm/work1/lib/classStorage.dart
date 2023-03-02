import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';

class classStorage {
  String myfile = "app.txt";
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$myfile');
  }

  Future<File> writeFile(String contents) async {
    final file = await _localFile;
    return file.writeAsString(contents);
  }

  Future<File> writeFile_multiline(List<String> contents) async {
    final file = await _localFile;
    for (var txt in contents) {
      await file.writeAsString(txt, mode: FileMode.append);
    }
    return file;
  }

  Future<String> readFile() async {
    try {
      final file = await _localFile;
      String contents = await file.readAsString();
      return contents;
    } catch (e) {
      return "";
    }
  }

  Future<List<String>> readFile_multiline() async {
    try {
      final file = await _localFile;
      List<String> contents = await file.readAsLines();
      return contents;
    } catch (e) {
      return [];
    }
  }
}

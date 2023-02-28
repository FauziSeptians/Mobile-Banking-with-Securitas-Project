import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'dart:async';



class IntStorage2 {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
 
    return directory.path;
  }
 
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/biometricStatus.txt');
  }
 
  Future<String> get readCounter async {
    try {
      final file = await _localFile;
 
      // Read the file
      final contents = await file.readAsString();
 
      return (contents);
    } catch (e) {
      // If encountering an error, return 0
      return 'something went wrong';
    }
  }
 
  Future<File> writeCounter(int counter) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$counter');
  }
}
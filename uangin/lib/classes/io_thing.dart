import 'dart:io';

import 'package:path_provider/path_provider.dart';
class IntStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
 
    return directory.path;
  }
 
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
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
}

class StrStorage {
  // create constructor with parameter

  String types;
  StrStorage(this.types);
  
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
 
    return directory.path;
  }
 
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/${types}Balance.txt');
  }
 
  Future<int> get readCounter async {
    bool nc = false;
    do {
      try {
        final file = await _localFile;

        // Read the file
        String strcontents = file.readAsStringSync();
        int contents = int.parse(strcontents);
        nc = true;
        return (contents);
      } catch (e) {
        // If encountering an error, return 0
        nc = false;
      }
    }
    while(nc != true);

    return 0;
  }

  Future<File> writeCounter(int input) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString(input.toString());
  }

}
import 'dart:io';

import 'package:path_provider/path_provider.dart';

Future<String> createFolderInAppDocDir(String folderName) async {
  //Get this App Document Directory
  final Directory? _appDocDir = await getExternalStorageDirectory();
  //App Document Directory + folder name
  final Directory _appDocDirFolder =
      Directory('${_appDocDir?.path}/$folderName/');
  if (await _appDocDirFolder.exists()) {
    //if folder already exists return path
    return _appDocDirFolder.path;
  } else {
    //if folder not exists create folder and then return its path
    final Directory _appDocDirNewFolder =
        await _appDocDirFolder.create(recursive: true);
    return _appDocDirNewFolder.path;
  }
}

Future<List<FileSystemEntity>> getDirByName(String dirname) async {
  final directory = await getExternalStorageDirectory();
  final dir = directory?.path;
  String pdfDirectory = '$dir/' + dirname;
  final myDir = Directory(pdfDirectory);
  final folders = myDir.listSync(recursive: true, followLinks: false);
  //print(folders[0].path);
  return folders;
}

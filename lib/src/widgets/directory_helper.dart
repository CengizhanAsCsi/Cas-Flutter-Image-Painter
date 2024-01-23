
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

@immutable
class DirectoryHelper {
  const DirectoryHelper._();
  static Future<String> getPublicDir() async {
    Directory? dir;
    if (Platform.isIOS) {
      dir = await getApplicationDocumentsDirectory();
    }
    if (Platform.isAndroid) {
      dir = (await getExternalStorageDirectory());
    }
    return dir!.path;
  }

  // static Future<String> getDir() async {
  //   var supportDir = await getApplicationSupportDirectory();
  //   return supportDir.path;
  // }

  static Future<String> getDir() async {
    Directory? supportDir = await getApplicationSupportDirectory();
    if (Platform.isAndroid) {
      supportDir = await getExternalStorageDirectory();
    }
    return supportDir!.path;
  }
}
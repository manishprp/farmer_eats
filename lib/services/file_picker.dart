import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FilePickerClass {
  Future<PlatformFile?> filePick({required BuildContext context}) async {
    PlatformFile? file;
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      file = result!.files.first;
    } catch (e) {}
    return file;
  }
}

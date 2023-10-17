import 'dart:io';

import 'package:dio/dio.dart';

class UploadDto {
  final File file;
  UploadDto({required this.file});

  Future<FormData> formData() async {
    var fileName = file.path.split('/').last;

    return FormData.fromMap({
      'files': await MultipartFile.fromFile(
        file.path,
        filename: fileName,
      ),
    });
  }
}

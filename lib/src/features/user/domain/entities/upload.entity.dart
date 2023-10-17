class UploadEntity {
  String filename;
  UploadEntity({this.filename = ''});

  static UploadEntity fromJson(List<dynamic> json) {
    return UploadEntity(filename: json[0]['filename']);
  }

  UploadEntity get toEntity => UploadEntity(filename: filename);
}

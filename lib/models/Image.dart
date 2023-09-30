class Image {
  String? attachmentFile;
  Image({
    this.attachmentFile,
  });
  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      attachmentFile: json['attachment_file'],
    );
  }
}

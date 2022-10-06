class ImageModel{
  final String imgUrl;
  final String altText;
  ImageModel({
    required this.imgUrl,
    required this.altText
  });
  factory ImageModel.fromJson(List<dynamic> json) {
    return ImageModel(
        imgUrl: json[0]['img_url'],
        altText: json[0]['alt_text']);
  }
}

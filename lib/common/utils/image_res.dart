class ImageRes {
  /**
   * 
   *  Center(
      child: appImage(imagePath: "assets/icons/home.png"),
    ),
    Center(
      child: appImage(imagePath: "assets/icons/search2.png"),
    ),
    Center(
      child: appImage(imagePath: "assets/icons/play-circle.png"),
    ),
    Center(
      child: appImage(imagePath: "assets/icons/message-circle.png"),
    ),
    Center(
      child: appImage(imagePath: "assets/icons/person2.png"),
    ),
   */
  ImageRes._();

  static const String _imageBase = "assets/icons";

  static const String defaultImg = "$_imageBase/blank.png";
  static const String home = "$_imageBase/home.png";
  static const String search = "$_imageBase/search2.png";
  static const String play = "$_imageBase/play-circle.png";
  static const String message = "$_imageBase/message-circle.png";
  static const String profile = "$_imageBase/person2.png";
}

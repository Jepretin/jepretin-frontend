class ImagekitEndpoint {
  static const String base = "https://ik.imagekit.io/kevinvin/jepretin";

  // Folder Struktur di ImageKit
  static String icon(String name) => "$base/assets/icons/$name";
  static String images(String name) => "$base/assets/images/$name";
  static String feed(String name) => "$base/assets/images/feed/$name";
}

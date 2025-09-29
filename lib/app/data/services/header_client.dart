class HeaderClient {
  static Map<String, dynamic> setHeaderBearer() {
    Map<String, dynamic> header = {
      "Content-Type": 'application/json',
      "Accept": 'application/json',
    };
    return header;
  }

  static Map<String, dynamic> setHeaderMultipart() {
    Map<String, dynamic> header = {
      "Content-Type": 'multipart/form-data',
      "Accept": 'application/json',
    };
    return header;
  }
}

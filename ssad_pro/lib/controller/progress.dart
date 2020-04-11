class Progress {
  static String getWorld(String data) {
    return data.substring(1, 2);
  }

  static String getSection(String data) {
    return data.substring(4, 6);
  }

  static String getLevel(String data) {
    return data.substring(7, 8);
  }
}

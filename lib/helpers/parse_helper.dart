class ParseHelper {
  static double toDouble(String value) {
    value = value.replaceAll(',', '.');
    return double.tryParse(value) ?? 0.0;
  }
}

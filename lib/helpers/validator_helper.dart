const kRequireField = 'Campo obrigatório';

class ValidatorHelper {
  static String isNotEmptyNumber(String text) {
    return text.isEmpty ? kRequireField : null;
  }
}

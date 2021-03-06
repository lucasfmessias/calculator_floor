import 'package:calculator_floor/helpers/parse_helper.dart';

const kRequireField = 'Campo obrigatório';
const kInvalidValue = 'Valor inválido';

class ValidatorHelper {
  static String validateNumberField(String text) {
    if (text.isEmpty) return kRequireField;

    if (ParseHelper.toDouble(text) == 0) return kInvalidValue;

    if (text.startsWith('.') || text.startsWith(',')) return kInvalidValue;

    if (ParseHelper.toDouble(text) == 0) {
      return kInvalidValue;
    } else {
      ParseHelper.toDouble(text);
    }
    return null;
  }
}

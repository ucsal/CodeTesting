import 'package:projetofinal_mobile/src/core/constants/string_constants.dart';

/// A classe [FormatterUtil] é responsável por gerenciar os métodos de utilidades de formatação utilizados no projeto.
class FormatterUtil {
  ///Formata a data que vem da API.
  static String dateFromAPI(String date, {bool isFullDate = false}) {
    final dateSplit = date.split(StringConstants.t);
    final hour = dateSplit.last.substring(0, 5);
    final dateResult = dateSplit.first.substring(0, 10).split(
          StringConstants.hyphen,
        );

    return dateResult[2] +
        StringConstants.slash +
        dateResult[1] +
        StringConstants.slash +
        dateResult[0] +
        (isFullDate ? ' $hour' : StringConstants.empty);
  }
}

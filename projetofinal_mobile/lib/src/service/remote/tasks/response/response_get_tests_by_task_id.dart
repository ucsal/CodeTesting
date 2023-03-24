import 'package:projetofinal_mobile/src/service/model/teste_model.dart';

class ResponseGetTestByTaskId extends Teste {
  ResponseGetTestByTaskId({
    int? id,
    String? name,
    String? input,
    String? output,
    int? comparation,
    bool? isShow,
  }) : super(
          id: id,
          name: name,
          input: input,
          output: output,
          comparation: comparation,
          isShow: isShow,
        );

  factory ResponseGetTestByTaskId.fromJson(dynamic json) {
    return ResponseGetTestByTaskId(
      id: json['id'],
      name: json['nomeTeste'],
      input: json['entrada'],
      output: json['saida'],
      comparation: json['comparacao'],
      isShow: json['flagExibir'],
    );
  }
}

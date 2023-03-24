import 'package:projetofinal_mobile/src/service/model/answer_model.dart';
import 'package:projetofinal_mobile/src/service/model/perfil_model.dart';
import 'package:projetofinal_mobile/src/service/model/task_model.dart';
import 'package:projetofinal_mobile/src/service/model/teste_model.dart';
import 'package:projetofinal_mobile/src/service/model/usuario_model.dart';

class ResponseGetAnswerByUserId extends Answer {
  ResponseGetAnswerByUserId({
    int? id,
    String? code,
    String? sendDate,
    Usuario? user,
    Task? task,
  }) : super(
          id: id,
          code: code,
          sendDate: sendDate,
          user: user,
          task: task,
        );

  factory ResponseGetAnswerByUserId.fromJson(dynamic json) {
    return ResponseGetAnswerByUserId(
      id: json["id"],
      code: json["codigo"],
      sendDate: json["dataEnvio"],
      task: ResponseGetAnswerByUserIdTarefa.fromJson(json["tarefa"]),
    );
  }
}

class ResponseGetAnswerByUserIdPerfil extends Perfil {
  ResponseGetAnswerByUserIdPerfil({
    int? id,
    String? name,
    String? authority,
  }) : super(
          id: id,
          name: name,
          authority: authority,
        );

  factory ResponseGetAnswerByUserIdPerfil.fromJson(dynamic json) {
    return ResponseGetAnswerByUserIdPerfil(
      id: json['id'],
      name: json['nome'],
      authority: json['authority'],
    );
  }
}

class ResponseGetAnswerByUserIdTarefa extends Task {
  ResponseGetAnswerByUserIdTarefa({
    int? id,
    String? title,
    String? description,
    int? status,
    List<Teste>? tests,
  }) : super(
          id: id,
          title: title,
          description: description,
          status: status,
          tests: tests,
        );

  factory ResponseGetAnswerByUserIdTarefa.fromJson(dynamic json) {
    return ResponseGetAnswerByUserIdTarefa(
      id: json['id'],
      title: json['titulo'],
      description: json['descricao'],
      status: json['status'],
      tests: json['testes'] != null
          ? json['testes']
              .map<ResponseGetAnswerByUserIdTestes>(
                  (e) => ResponseGetAnswerByUserIdTestes.fromJson(e))
              .toList()
          : [],
    );
  }
}

class ResponseGetAnswerByUserIdTestes extends Teste {
  ResponseGetAnswerByUserIdTestes({
    int? id,
    String? name,
    String? input,
    String? output,
    int? comparation,
    bool? isShow,
    bool? executed,
    bool? isCorrect,
    dynamic exception,
    String? expectedOutput,
    String? obtainedOutput,
  }) : super(
          id: id,
          name: name,
          input: input,
          output: output,
          comparation: comparation,
          isShow: isShow,
          executed: executed,
          isCorrect: isCorrect,
          exception: exception,
          expectedOutput: expectedOutput,
          obtainedOutput: obtainedOutput,
        );

  factory ResponseGetAnswerByUserIdTestes.fromJson(dynamic json) {
    return ResponseGetAnswerByUserIdTestes(
      id: json['id'],
      name: json['nomeTeste'],
      input: json['entrada'],
      output: json['saida'],
      comparation: json['comparacao'],
      isShow: json['flagExibir'],
      executed: json['execute'],
      isCorrect: json['resultadoFinal'],
      exception: json['exception'],
      expectedOutput: json['saidaEsperada'],
      obtainedOutput: json['saidaObtida'],
    );
  }
}

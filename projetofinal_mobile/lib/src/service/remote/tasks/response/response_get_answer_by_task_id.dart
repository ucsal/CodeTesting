import 'package:projetofinal_mobile/src/service/model/answer_model.dart';

class ResponseGetAnswerByTaskId extends Answer {
  ResponseGetAnswerByTaskId({
    int? id,
    String? code,
    String? sendDate,
    int? userId,
    int? taskId,
  }) : super(
          id: id,
          code: code,
          sendDate: sendDate,
          userId: userId,
          taskId: taskId,
        );

  factory ResponseGetAnswerByTaskId.fromJson(dynamic json) {
    return ResponseGetAnswerByTaskId(
      id: json["id"],
      code: json["codigo"],
      sendDate: json["dataEnvio"],
      userId: json["usuarioId"] ?? json["usuario"]["id"],
      taskId: json["tarefaId"] ?? json["tarefa"]["id"],
    );
  }
}

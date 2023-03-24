import 'package:projetofinal_mobile/src/service/model/answer_model.dart';

class ResponseSendTask extends Answer {
  ResponseSendTask({
    int? id,
    String? code,
    String? sentAt,
    int? quizId,
    int? taskId,
    int? userId,
  }) : super(
          id: id,
          code: code,
          sendDate: sentAt,
          quizId: quizId,
          taskId: taskId,
          userId: userId,
        );

  factory ResponseSendTask.fromJson(dynamic json) {
    return ResponseSendTask(
      id: json['id'] as int?,
      code: json['codigo'] as String?,
      sentAt: json['dataEnvio'] as String?,
      quizId: json['itemProva'] as int?,
      taskId: json['tarefa'] as int?,
      userId: json['usuario'] as int?,
    );
  }
}

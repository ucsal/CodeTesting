import 'package:projetofinal_mobile/src/service/model/task_model.dart';
import 'package:projetofinal_mobile/src/service/model/usuario_model.dart';

class Answer {
  int? id;
  String? code;
  String? sendDate;
  int? userId;
  int? taskId;
  int? quizId;
  Usuario? user;
  Task? task;

  Answer({
    this.id,
    this.code,
    this.sendDate,
    this.userId,
    this.taskId,
    this.task,
    this.user,
    this.quizId,
  });
}

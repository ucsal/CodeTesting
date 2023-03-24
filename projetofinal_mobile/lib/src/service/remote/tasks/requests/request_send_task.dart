class RequestSendTask {
  String? code;
  int? quizId;
  int? userId;
  int? taskId;

  RequestSendTask({
    this.code,
    this.quizId,
    this.userId,
    this.taskId,
  });

  Map<String, dynamic> toJson() {
    return {
      'codigo': code,
      'itemProvaId': quizId,
      'usuarioId': userId,
      'tarefaId': taskId,
    };
  }
}

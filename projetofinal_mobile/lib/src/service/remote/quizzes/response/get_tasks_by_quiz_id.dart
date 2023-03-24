import 'package:projetofinal_mobile/src/service/model/perfil_model.dart';
import 'package:projetofinal_mobile/src/service/model/quiz_model.dart';
import 'package:projetofinal_mobile/src/service/model/task_model.dart';
import 'package:projetofinal_mobile/src/service/model/usuario_model.dart';

class ResponseGetTasksByQuizId {
  int? id;
  int? ordem;
  ResponseGetTasksByQuizIdQuiz? prova;
  ResponseGetTasksByQuizIdTask? tarefa;

  ResponseGetTasksByQuizId({
    this.id,
    this.ordem,
    this.prova,
    this.tarefa,
  });

  factory ResponseGetTasksByQuizId.fromJson(dynamic json) {
    return ResponseGetTasksByQuizId(
      id: json['id'] as int?,
      ordem: json['ordem'] as int?,
      prova: json['prova'] != null
          ? ResponseGetTasksByQuizIdQuiz.fromJson(json['prova'])
          : null,
      tarefa: json['tarefa'] != null
          ? ResponseGetTasksByQuizIdTask.fromJson(json['tarefa'])
          : null,
    );
  }
}

class ResponseGetTasksByQuizIdQuiz extends Quiz {
  ResponseGetTasksByQuizIdQuiz({
    int? id,
    String? name,
    String? startDate,
    String? endDate,
    Usuario? user,
  }) : super(
          id: id,
          name: name,
          startDate: startDate,
          endDate: endDate,
          user: user,
        );

  factory ResponseGetTasksByQuizIdQuiz.fromJson(dynamic json) {
    return ResponseGetTasksByQuizIdQuiz(
      id: json['id'],
      name: json['nome'],
      startDate: json['dataInicial'],
      endDate: json['dataFinal'],
      user: json['usuario'] != null
          ? ResponseGetTasksByQuizIdUsuario.fromJson(json['usuario'])
          : null,
    );
  }
}

class ResponseGetTasksByQuizIdUsuario extends Usuario {
  ResponseGetTasksByQuizIdUsuario({
    int? id,
    String? name,
    bool? isActive,
    String? createdAt,
    String? updatedAt,
    List<ResponseGetTasksByQuizIdPerfil>? profiles,
  }) : super(
          id: id,
          name: name,
          isActive: isActive,
          createdAt: createdAt,
          updatedAt: updatedAt,
          profiles: profiles,
        );

  factory ResponseGetTasksByQuizIdUsuario.fromJson(dynamic json) {
    return ResponseGetTasksByQuizIdUsuario(
      id: json['id'],
      name: json['nome'],
      isActive: json['flagAtivo'],
      createdAt: json['dataCriacao'],
      updatedAt: json['dataUltimoAcesso'],
      profiles: json['perfil'] != null
          ? (json['perfil'] as List)
              .map((i) => ResponseGetTasksByQuizIdPerfil.fromJson(i))
              .toList()
          : null,
    );
  }
}

class ResponseGetTasksByQuizIdPerfil extends Perfil {
  ResponseGetTasksByQuizIdPerfil({
    int? id,
    String? name,
    String? authority,
  }) : super(
          id: id,
          name: name,
          authority: authority,
        );

  factory ResponseGetTasksByQuizIdPerfil.fromJson(dynamic json) {
    return ResponseGetTasksByQuizIdPerfil(
      id: json['id'],
      name: json['nome'],
      authority: json['authority'],
    );
  }
}

class ResponseGetTasksByQuizIdTask extends Task {
  ResponseGetTasksByQuizIdTask({
    int? id,
    String? title,
    String? description,
    int? status,
    int? visibility,
    Usuario? user,
  }) : super(
          id: id,
          description: description,
          status: status,
          title: title,
          user: user,
          visibility: visibility,
        );

  factory ResponseGetTasksByQuizIdTask.fromJson(dynamic json) {
    return ResponseGetTasksByQuizIdTask(
      id: json['id'],
      title: json['titulo'],
      description: json['descricao'],
      status: json['status'],
      visibility: json['visibilidade'],
      user: json['usuario'] != null
          ? ResponseGetTasksByQuizIdUsuario.fromJson(json['usuario'])
          : null,
    );
  }
}

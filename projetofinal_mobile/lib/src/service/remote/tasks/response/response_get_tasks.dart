import 'package:projetofinal_mobile/src/service/model/perfil_model.dart';
import 'package:projetofinal_mobile/src/service/model/task_model.dart';
import 'package:projetofinal_mobile/src/service/model/teste_model.dart';
import 'package:projetofinal_mobile/src/service/model/usuario_model.dart';

class ResponseGetTasks extends Task {
  ResponseGetTasks({
    int? id,
    String? title,
    String? description,
    int? status,
    List<Teste>? tests,
    Usuario? user,
  }) : super(
          id: id,
          title: title,
          description: description,
          status: status,
          tests: tests,
          user: user,
        );

  factory ResponseGetTasks.fromJson(dynamic json) {
    return ResponseGetTasks(
      id: json["id"],
      title: json["titulo"],
      description: json["descricao"],
      status: json["status"],
      tests: json["testes"] != null
          ? (json["testes"] as List)
              .map((i) => ResponseGetTasksTestes.fromJson(i))
              .toList()
          : [],
      user: ResponseGetTasksUsuario.fromJson(json["usuario"]),
    );
  }
}

class ResponseGetTasksTestes extends Teste {
  ResponseGetTasksTestes({
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

  factory ResponseGetTasksTestes.fromJson(dynamic json) {
    return ResponseGetTasksTestes(
      id: json['id'],
      name: json['nomeTeste'],
      input: json['entrada'],
      output: json['saida'],
      comparation: json['comparacao'],
      isShow: json['flagExibir'],
    );
  }
}

class ResponseGetTasksUsuario extends Usuario {
  ResponseGetTasksUsuario({
    int? id,
    String? name,
    bool? isActive,
    String? createdAt,
    String? updatedAt,
    List<ResponseGetTasksPerfil>? profiles,
  }) : super(
          id: id,
          name: name,
          isActive: isActive,
          createdAt: createdAt,
          updatedAt: updatedAt,
          profiles: profiles,
        );

  factory ResponseGetTasksUsuario.fromJson(dynamic json) {
    return ResponseGetTasksUsuario(
      id: json['id'],
      name: json['nome'],
      isActive: json['flagAtivo'],
      createdAt: json['dataCriacao'],
      updatedAt: json['dataUltimoAcesso'],
      profiles: (json['perfil'] as List)
          .map((i) => ResponseGetTasksPerfil.fromJson(i))
          .toList(),
    );
  }
}

class ResponseGetTasksPerfil extends Perfil {
  ResponseGetTasksPerfil({
    int? id,
    String? name,
    String? authority,
  }) : super(
          id: id,
          name: name,
          authority: authority,
        );

  factory ResponseGetTasksPerfil.fromJson(dynamic json) {
    return ResponseGetTasksPerfil(
      id: json['id'],
      name: json['nome'],
      authority: json['authority'],
    );
  }
}

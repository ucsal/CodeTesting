import 'package:projetofinal_mobile/src/service/model/perfil_model.dart';
import 'package:projetofinal_mobile/src/service/model/quiz_model.dart';
import 'package:projetofinal_mobile/src/service/model/usuario_model.dart';

class ResponseGetQuiz extends Quiz {
  ResponseGetQuiz({
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

  factory ResponseGetQuiz.fromJson(dynamic json) {
    return ResponseGetQuiz(
      id: json['id'] as int?,
      name: json['nome'] as String?,
      startDate: json['dataInicial'] as String?,
      endDate: json['dataFinal'] as String?,
      user: json['usuario'] != null
          ? ResponseGetQuizUsuario.fromJson(
              json['usuario'] as Map<String, dynamic>,
            )
          : null,
    );
  }
}

class ResponseGetQuizUsuario extends Usuario {
  ResponseGetQuizUsuario({
    int? id,
    String? name,
    bool? isActive,
    String? createdAt,
    String? updatedAt,
    List<ResponseGetQuizPerfil>? profiles,
  }) : super(
          id: id,
          name: name,
          createdAt: createdAt,
          isActive: isActive,
          profiles: profiles,
          updatedAt: updatedAt,
        );

  factory ResponseGetQuizUsuario.fromJson(dynamic json) {
    return ResponseGetQuizUsuario(
      id: json['id'],
      name: json['nome'],
      isActive: json['flagAtivo'],
      createdAt: json['dataCriacao'],
      updatedAt: json['dataUltimoAcesso'],
      profiles: json['perfis'] != null
          ? (json['perfis'] as List)
              .map((e) => ResponseGetQuizPerfil.fromJson(
                    e as Map<String, dynamic>,
                  ))
              .toList()
          : null,
    );
  }
}

class ResponseGetQuizPerfil extends Perfil {
  ResponseGetQuizPerfil({
    int? id,
    String? name,
    String? authority,
  }) : super(
          id: id,
          name: name,
          authority: authority,
        );

  factory ResponseGetQuizPerfil.fromJson(dynamic json) {
    return ResponseGetQuizPerfil(
      id: json['id'],
      name: json['nome'],
      authority: json['authority'],
    );
  }
}

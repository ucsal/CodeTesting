import 'package:projetofinal_mobile/src/service/model/teste_model.dart';
import 'package:projetofinal_mobile/src/service/model/usuario_model.dart';

class Task {
  int? id;
  String? title;
  String? description;
  int? status;
  List<Teste>? tests;
  Usuario? user;
  int? visibility;

  Task({
    this.id,
    this.title,
    this.description,
    this.status,
    this.tests,
    this.user,
    this.visibility,
  });
}

import 'package:projetofinal_mobile/src/service/model/task_model.dart';
import 'package:projetofinal_mobile/src/service/model/usuario_model.dart';

class Quiz {
  int? id;
  String? name;
  String? startDate;
  String? endDate;
  Usuario? user;
  List<Task>? tasks;

  Quiz({
    this.id,
    this.name,
    this.startDate,
    this.endDate,
    this.user,
    this.tasks,
  });
}

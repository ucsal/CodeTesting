import 'package:projetofinal_mobile/src/domain/entity/task_entity.dart';
import 'package:projetofinal_mobile/src/domain/entity/user_entity.dart';
import 'package:projetofinal_mobile/src/service/model/quiz_model.dart';

class QuizEntity {
  int? id;
  String? name;
  String? startDate;
  String? endDate;
  UserEntity? user;
  List<TaskEntity>? tasks;

  QuizEntity({
    this.id,
    this.name,
    this.startDate,
    this.endDate,
    this.user,
    this.tasks,
  });

  factory QuizEntity.toEntity(Quiz? response) {
    return QuizEntity(
      id: response?.id,
      name: response?.name,
      startDate: response?.startDate,
      endDate: response?.endDate,
      user: UserEntity.toEntity(response?.user),
      tasks: response?.tasks?.map((e) => TaskEntity.toEntity(e)).toList(),
    );
  }

  QuizEntity copyWith({
    int? id,
    String? name,
    String? startDate,
    String? endDate,
    UserEntity? user,
    List<TaskEntity>? tasks,
  }) {
    return QuizEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      user: user ?? this.user,
      tasks: tasks ?? this.tasks,
    );
  }
}

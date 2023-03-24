import 'package:projetofinal_mobile/src/domain/entity/test_entity.dart';
import 'package:projetofinal_mobile/src/domain/entity/user_entity.dart';
import 'package:projetofinal_mobile/src/service/model/task_model.dart';

class TaskEntity {
  int? id;
  String? title;
  String? description;
  int? status;
  List<TestEntity>? tests;
  UserEntity? user;
  int? quizId;

  TaskEntity({
    this.id,
    this.title,
    this.description,
    this.status,
    this.tests,
    this.user,
    this.quizId,
  });

  factory TaskEntity.toEntity(Task? response) {
    return TaskEntity(
      id: response?.id,
      title: response?.title,
      description: response?.description,
      status: response?.status,
      tests: response?.tests?.map((e) => TestEntity.toEntity(e)).toList(),
      user: UserEntity.toEntity(response?.user),
    );
  }
}

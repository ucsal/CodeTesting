import 'package:projetofinal_mobile/src/domain/entity/test_entity.dart';
import 'package:projetofinal_mobile/src/service/remote/tasks/response/response_get_answer_result.dart';

class ResultEntity {
  int? id;
  String? obtainedOutput;
  bool? create;
  bool? compiled;
  double? percentage;
  List<TestEntity>? tests;

  ResultEntity({
    this.id,
    this.obtainedOutput,
    this.create,
    this.compiled,
    this.percentage,
    this.tests,
  });

  factory ResultEntity.toEntity(ResponseGetAnswerResult? response) {
    return ResultEntity(
      id: response?.id,
      compiled: response?.compiled,
      create: response?.create,
      obtainedOutput: response?.obtainedOutput,
      percentage: response?.percentage,
      tests: response?.tests?.map((e) => TestEntity.toEntity(e)).toList(),
    );
  }
}

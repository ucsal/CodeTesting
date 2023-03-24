import 'package:projetofinal_mobile/src/service/model/teste_model.dart';

class TestEntity {
  int? id;
  String? name;
  String? input;
  String? output;
  int? comparation;
  bool? isShow;
  bool? executed;
  bool? isCorrect;
  bool? exception;
  String? expectedOutput;
  String? obtainedOutput;
  bool? runtimeException;
  String? exceptionSimplificada;

  TestEntity({
    this.id,
    this.name,
    this.input,
    this.output,
    this.comparation,
    this.isShow,
    this.executed,
    this.isCorrect,
    this.exception,
    this.expectedOutput,
    this.obtainedOutput,
    this.runtimeException,
    this.exceptionSimplificada,
  });

  factory TestEntity.toEntity(Teste? response) {
    return TestEntity(
      id: response?.id,
      name: response?.name,
      input: response?.input,
      output: response?.output,
      comparation: response?.comparation,
      isShow: response?.isShow,
      executed: response?.executed,
      isCorrect: response?.isCorrect,
      exception: response?.exception,
      expectedOutput: response?.expectedOutput,
      obtainedOutput: response?.obtainedOutput,
      runtimeException: response?.runtimeException,
      exceptionSimplificada: response?.exceptionSimplificada,
    );
  }
}

import 'package:projetofinal_mobile/src/service/model/teste_model.dart';

class ResponseGetAnswerResult {
  int? id;
  String? obtainedOutput;
  bool? create;
  bool? compiled;
  double? percentage;
  bool? exception;
  List<ResponseGetAnswerResultTest>? tests;

  ResponseGetAnswerResult({
    this.id,
    this.obtainedOutput,
    this.create,
    this.compiled,
    this.percentage,
    this.tests,
    this.exception,
  });

  factory ResponseGetAnswerResult.fromJson(dynamic json) {
    return ResponseGetAnswerResult(
      id: json['id'],
      obtainedOutput: json['saidaObtida'],
      create: json['create'],
      compiled: json['compile'],
      percentage: json['porcentagem'],
      tests: (json['testes'] as List)
          .map((i) => ResponseGetAnswerResultTest.fromJson(i))
          .toList(),
    );
  }
}

class ResponseGetAnswerResultTest extends Teste {
  ResponseGetAnswerResultTest({
    int? id,
    bool? executed,
    bool? isCorrect,
    dynamic exception,
    String? input,
    String? expectedOutput,
    String? obtainedOutput,
    String? name,
    bool? runtimeException,
    String? exceptionSimplificada,
  }) : super(
          id: id,
          executed: executed,
          isCorrect: isCorrect,
          exception: exception,
          input: input,
          expectedOutput: expectedOutput,
          obtainedOutput: obtainedOutput,
          name: name,
          exceptionSimplificada: exceptionSimplificada,
          runtimeException: runtimeException,
        );

  factory ResponseGetAnswerResultTest.fromJson(dynamic json) {
    return ResponseGetAnswerResultTest(
      id: json['id'],
      name: json['nome'],
      executed: json['execute'],
      isCorrect: json['resultadoFinal'],
      exception: json['exception'],
      input: json['entrada'],
      expectedOutput: json['saidaEsperada'],
      obtainedOutput: json['saidaObtida'],
      runtimeException: json['runtimeException'],
      exceptionSimplificada: json['exceptionSimplificada'],
    );
  }
}

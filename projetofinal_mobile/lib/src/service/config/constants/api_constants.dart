import 'dart:convert';

/// [ApiConstants] é uma classe que contém todas as constantes usadas nas requisições da API
class ApiConstants {
  ///Credenciais de autenticação
  static const String kClientCredentials = '';
  static const String kAuthorization = 'Authorization';
  static const String kContentType = 'Content-Type';

  ///Base64 de credenciais de autenticação
  static String kEncodedClientCredentials = base64Encode(
    utf8.encode(kClientCredentials),
  );

  ///Url default para requisições da API
  static const String kUrl = 'http://localhost:8081/api/';
  //static const String kUrl = 'http://projetofinal-api.herokuapp.com/api/';

  /*--------------------------------------------------------------------*/

  //Auth
  static const String doAuth = '${kUrl}login/';
  static const String doRegister = '${kUrl}usuarios/';
  static const String getUserById = '${kUrl}usuarios/';

  //Tasks
  static const String getTasks = '${kUrl}tarefa/publicas/';
  static const String getAnswerByTaskId = '${kUrl}respostas/tarefa/';
  static const String getAnswerByUserId = '${kUrl}respostas/usuario/';
  static const String getAnswerByQuizId = '${kUrl}respostas/prova/';
  static const String getResultByAnswerId = '${kUrl}resultados/resposta/';
  static const String getTestsByTaskId = '${kUrl}casoteste/tarefa/';
  static const String sendTasks = '${kUrl}respostas/';

  //Quizzes
  static const String getQuizzes = '${kUrl}provas/';
  static const String getTasksByQuizId = '${kUrl}provas/itemprova/';
}

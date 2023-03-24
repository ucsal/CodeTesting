/// [RequestLogin] é uma classe que contém os dados necessários para fazer uma solicitação de login ao servidor
class RequestLogin {
  String user;
  String password;
  RequestLogin({
    required this.user,
    required this.password,
  });

  Map<String, dynamic> toJson(RequestLogin request) {
    return {
      'login': request.user,
      'senha': request.password,
    };
  }
}

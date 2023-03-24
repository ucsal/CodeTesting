class RequestRegister {
  int? profileId; // 1 - Admin, 2 - Aluno, 3 - Professor
  String? name;
  String? user;
  String? password;
  bool? isActive;
  String? email;

  RequestRegister({
    this.name,
    this.user,
    this.password,
    this.isActive,
    this.profileId,
    this.email,
  });

  Map<String, dynamic> toJson(RequestRegister request) {
    return {
      'nome': request.name,
      'login': request.user,
      'senha': request.password,
      'flagAtivo': request.isActive,
      'perfilId': request.profileId,
      'email': request.email,
    };
  }
}

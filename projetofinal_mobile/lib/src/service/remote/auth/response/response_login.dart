class ResponseLogin {
  String? accessToken;
  String? tokenType;
  int? id;

  ResponseLogin({
    this.accessToken,
    this.tokenType,
    this.id,
  });

  factory ResponseLogin.fromJson(dynamic json) {
    return ResponseLogin(
      accessToken: json["token"],
      tokenType: json["tipo"],
      id: json["id"],
    );
  }
}

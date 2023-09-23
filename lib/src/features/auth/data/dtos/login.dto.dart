class LoginDto {
  final String email;
  final String password;
  LoginDto({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }
}
